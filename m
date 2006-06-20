Received: from mta068a.interbusiness.it ([85.37.17.68])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FsgET-0003HH-Pz
	for linux-mtd@lists.infradead.org; Tue, 20 Jun 2006 09:25:52 -0400
Message-ID: <4497F758.5090708@eptar.com>
Date: Tue, 20 Jun 2006 15:25:44 +0200
From: Claudio Lanconelli <claudiolanconelli@eptar.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: FAT vs jFFS2 for NAND.
References: <BAY110-F16C625F11A1D80EA24563ABC860@phx.gbl>	<4497DCA6.2080006@eptar.com>
	<1150806658.17609.55.camel@hades.cambridge.redhat.com>
In-Reply-To: <1150806658.17609.55.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> Thanks. I think it makes a certain amount of sense to merge that --
> people can add write support to it later. Please could you re-send with
> a Signed-off-by: line so that it can be merged
Signed-off-by: Claudio Lanconelli <lanconelli.claudio@eptar.com>

/*
 * Linux driver for SSFDC Flash Translation Layer (Read only)
 * (c) 2005 Eptar srl
 * Author: Claudio Lanconelli <lanconelli.claudio@eptar.com>
 *
 * Based on NTFL and MTDBLOCK_RO drivers
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 * $Id: ssfdc_ro.c,v 1.5 2005/11/28 13:54:08 claudio Exp $
 */

#include <linux/config.h>
#include <linux/kernel.h>
#include <linux/module.h>

#include <linux/init.h>
#include <linux/slab.h>
#include <linux/hdreg.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/nand.h>
#include <linux/mtd/blktrans.h>

#undef     ENABLE_GETGEO

#undef DEBUG
#define DEBUG(n, args...)                    \
     do {                                    \
        if (n <= SSFDC_RO_DEBUG_VERBOSE)    \
            printk(KERN_INFO args);            \
    } while(0)

#define SSFDC_RO_DEBUG_VERBOSE    0

struct ssfdcr_record {
    struct mtd_blktrans_dev mbd;
    int usecount;
#ifdef ENABLE_GETGEO
    unsigned char heads;
    unsigned char sectors;
    unsigned short cylinders;
#endif
    int cis_block;                        //block n. containing CIS/IDI
    int erase_size;                        //phys_block_size
    unsigned short *logic_block_map;    //all zones (max 8192 phys 
blocks on the 128MB)
    int map_len;                        //n. phys_blocks on the card
};

static const struct nand_oobinfo ssfdc_oobinfo = {
    .useecc = MTD_NANDECC_PLACEONLY,
    .eccbytes = 6,
    .eccpos = {14, 13, 15, 9, 8, 10}
};

#define SSFDCR_MAJOR        44
#define SSFDCR_PARTN_BITS    3

#define SECTOR_SIZE        512
#define SECTOR_SHIFT    9
#define OOB_SIZE        16

#define MAX_LOGIC_BLK_PER_ZONE    1000
#define MAX_PHYS_BLK_PER_ZONE    1024

#define ArraySize(x)    ( sizeof(x) / sizeof((x)[0]) )

#define KB(x)    ( (x) * 1024L )
#define MB(x)    ( KB(x) * 1024L )

/** CHS Table
            1MB        2MB        4MB        8MB        16MB    32MB    
64MB    128MB
NCylinder    125        125        250        250        500        
500        500        500
NHead        4        4        4        4        4        8        8    
    16
NSector        4        8        8        16        16        16        
32        32
SumSector    2,000    4,000    8,000    16,000    32,000    64,000    
128,000    256,000
SectorSize    512        512        512        512        512        
512        512        512
**/

#ifdef ENABLE_GETGEO

typedef struct {
    unsigned long size;
    unsigned short cyl;
    unsigned char head;
    unsigned char sec;
} chs_entry_t;

//Must be ordered by size
static const chs_entry_t chs_table[] = {
    { MB(  1), 125,  4,  4 },
    { MB(  2), 125,  4,  8 },
    { MB(  4), 250,  4,  8 },
    { MB(  8), 250,  4, 16 },
    { MB( 16), 500,  4, 16 },
    { MB( 32), 500,  8, 16 },
    { MB( 64), 500,  8, 32 },
    { MB(128), 500, 16, 32 },
    { 0 },
};

static int get_chs(unsigned long size, unsigned short *cyl, unsigned 
char *head, unsigned char *sec)
{
    int k;
    int found = 0;

    k = 0;
    while ( chs_table[k].size > 0 && size > chs_table[k].size )
        k++;

    if ( chs_table[k].size > 0 )
    {
        if (cyl)
            *cyl = chs_table[k].cyl;
        if (head)
            *head = chs_table[k].head;
        if (sec)
            *sec = chs_table[k].sec;
        found = 1;
    }

    return found;
}
#endif


static const unsigned char nibble_count_bits[16] = {
    0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,4
};

//Counts bit 1 in a byte. Use look up table to speed up count
static int byte_count_bits(unsigned char val)
{
    return nibble_count_bits[val >> 4] + nibble_count_bits[val & 0x0f];
}

static const unsigned char cis_numbers[] = {
    0x01, 0x03, 0xD9, 0x01, 0xFF, 0x18, 0x02, 0xDF, 0x01, 0x20
};

#define OOB_BLOCKSTATUS_OFFSET    5

#define block_is_bad(x)        ( byte_count_bits(x) < 7 )
#define block_is_good(x)    ( !block_is_bad(x) )

//Read and check for a valid CIS sector
static int get_valid_cis_sector(struct mtd_info *mtd)
{
    int ret, k, cis_sector;
    size_t retlen;
    loff_t offset;
    unsigned char sect_buf[SECTOR_SIZE];
    unsigned char oob_buf[OOB_SIZE];

    //Look for CIS/IDI sector on the first GOOD block (give up after 4 
bad blocks)
    //If the first good block doesn't contain CIS number the flash is 
not SSFDC formatted
    cis_sector = -1;
    for (k = 0, offset = 0; k < 4; k++, offset += mtd->erasesize)
    {
        ret = MTD_READOOB(mtd, offset, OOB_SIZE, &retlen, oob_buf);
        if ( ret < 0 || retlen != OOB_SIZE )
        {
            DEBUG(MTD_DEBUG_LEVEL0, "SSFDC_RO: can't read OOB data on 
sector %d\n",
                            (int)(offset >> SECTOR_SHIFT));
            break;
        }

        if ( block_is_good( oob_buf[OOB_BLOCKSTATUS_OFFSET] ) )
        {
            ret = MTD_READ(mtd, offset, SECTOR_SIZE, &retlen, sect_buf);
            if ( ret < 0 || retlen != SECTOR_SIZE )
            {
                DEBUG(MTD_DEBUG_LEVEL0, "SSFDC_RO: can't read CIS/IDI 
sector\n");
            }
            else
            if ( !memcmp(sect_buf, cis_numbers, sizeof(cis_numbers)) 
)    //CIS pattern matching on the sector buffer
            {
                cis_sector = (int)(offset >> SECTOR_SHIFT);        //Found
            }
            else
            {
                DEBUG(MTD_DEBUG_LEVEL1, "SSFDC_RO: CIS/IDI sector not 
found on %s (mtd%d)\n",
                                    mtd->name, mtd->index);
            }
            break;
        }
    }

    return cis_sector;
}

//Read physical sector (just a wrapper to MTD_READ)
static int read_physical_sector(struct mtd_info *mtd, unsigned char 
*sect_buf, int sect_no)
{
    int ret;
    size_t retlen;
    loff_t offset = (loff_t)sect_no << SECTOR_SHIFT;

    ret = MTD_READ(mtd, offset, SECTOR_SIZE, &retlen, sect_buf);
    if ( ret < 0 || retlen != SECTOR_SIZE )
        return -1;

    return 0;
}

//Parity calculator on a word of n bit size
static int get_parity(int number, int size)
{
     int k;
    int parity;

    parity = 1;
    for (k = 0; k < size; k++)
    {
        parity += (number >> k);
        parity &= 1;
    }
    return parity;
}

//Read and validate the logical block address field stored in the OOB
static int get_logical_address(unsigned char oob_buf[OOB_SIZE])
{
    int block_address, parity;
    int offset[2] = {6, 11};    //offset of the two address fields 
within OOB
    int j;
    int ok = 0;

    //First we check for good block
    if ( block_is_bad(oob_buf[OOB_BLOCKSTATUS_OFFSET]) )
    {
        DEBUG(MTD_DEBUG_LEVEL0, "SSFDC_RO: get_logical_address() Bad 
block\n");
        return -1;        //Bad block
    }

    //Look for the first valid logical address
    //Valid address has fixed pattern on most significant bits and 
parity check
    for (j = 0; j < ArraySize(offset); j++)
    {
        block_address = ((int)oob_buf[offset[j]] << 8) | 
oob_buf[offset[j]+1];

        //Check for the signature bits in the address field (most 
significant bits)
        if( (block_address & ~0x7FF) == 0x1000 )
        {
            parity = block_address & 0x01;
            block_address &= 0x7FF;
            block_address >>= 1;

            if( get_parity(block_address, 10) != parity )
            {
                DEBUG(MTD_DEBUG_LEVEL0, "SSFDC_RO: logical address 
field%d parity error (0x%04X)\n", j+1, block_address);
            }
            else
            {
                ok = 1;
                break;
            }
        }
    }

    if ( !ok )
        block_address = -2;

    DEBUG(MTD_DEBUG_LEVEL3, "SSFDC_RO: get_logical_address() %d\n", 
block_address);

    return block_address;
}

//Build the logic block map
static int build_logical_block_map(struct ssfdcr_record *ssfdc)
{
    unsigned long offset;
    unsigned char oob_buf[OOB_SIZE];
    int ret, block_address, phys_block;
    size_t retlen;

    DEBUG(MTD_DEBUG_LEVEL1, "SSFDC_RO: build_block_map() n.blocks = %d 
(%luK)\n",
                        ssfdc->map_len, (unsigned long)ssfdc->map_len * 
ssfdc->erase_size / 1024 );

    //Scan every physical block, skip CIS block
    for (phys_block = ssfdc->cis_block + 1; phys_block < ssfdc->map_len; 
phys_block++)
    {
        offset = (unsigned long)phys_block * ssfdc->erase_size;
        ret = MTD_READOOB(ssfdc->mbd.mtd, offset, OOB_SIZE, &retlen, 
oob_buf);
        if ( ret < 0 || retlen != OOB_SIZE )
        {
            DEBUG(MTD_DEBUG_LEVEL0, "SSFDC_RO: mtd read_oob() failed at 
%lu\n", offset);
            return -1;
        }
        block_address = get_logical_address(oob_buf);

        //Skip bad blocks and invalid addresses
        if ( block_address >= 0 && block_address < MAX_LOGIC_BLK_PER_ZONE )
        {
            int zone_index;

            zone_index = phys_block / MAX_PHYS_BLK_PER_ZONE;
            block_address += zone_index * MAX_LOGIC_BLK_PER_ZONE;
            ssfdc->logic_block_map[block_address] = (unsigned 
short)phys_block;

            DEBUG(MTD_DEBUG_LEVEL2, "SSFDC_RO: build_block_map() 
phys_block=%d, logic_block_addr=%d, zone=%d\n",
                                    phys_block, block_address, zone_index);
        }
    }
    return 0;
}

static void ssfdcr_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info 
*mtd)
{
    struct ssfdcr_record *ssfdc;
    int cis_sector;

    //Check for NAND flash
    if (mtd->type != MTD_NANDFLASH)
        return;

    //Check for SSDFC format by reading CIS/IDI sector
    cis_sector = get_valid_cis_sector(mtd);
    if ( cis_sector == -1 )
        return;

    ssfdc = kmalloc(sizeof(struct ssfdcr_record), GFP_KERNEL);
    if ( !ssfdc )
    {
        printk(KERN_WARNING "SSFDC_RO: out of memory for data 
structures\n");
        return;
    }
    memset(ssfdc, 0, sizeof(*ssfdc));
   
    ssfdc->mbd.mtd = mtd;
    ssfdc->mbd.devnum = -1;
    ssfdc->mbd.blksize = SECTOR_SIZE;
    ssfdc->mbd.tr = tr;
    ssfdc->mbd.readonly = 1;

    ssfdc->cis_block = cis_sector / (mtd->erasesize >> SECTOR_SHIFT);
    ssfdc->erase_size = mtd->erasesize;
    ssfdc->map_len = mtd->size / mtd->erasesize;

    DEBUG(MTD_DEBUG_LEVEL1, "SSFDC_RO: cis_block=%d, erase_size=%d, 
map_len=%d, n_zones=%d\n",
                        ssfdc->cis_block, ssfdc->erase_size, ssfdc->map_len,
                        (ssfdc->map_len + MAX_PHYS_BLK_PER_ZONE - 1) / 
MAX_PHYS_BLK_PER_ZONE);

#ifdef ENABLE_GETGEO
    // Set geometry
    get_chs( mtd->size, NULL, &ssfdc->heads, &ssfdc->sectors);
    ssfdc->cylinders = (unsigned short)((mtd->size >> SECTOR_SHIFT) /
                        ((long)ssfdc->sectors * (long)ssfdc->heads));

    DEBUG(MTD_DEBUG_LEVEL1, "SSFDC_RO: using C:%d H:%d S:%d == %ld sects\n",
                    ssfdc->cylinders, ssfdc->heads , ssfdc->sectors,
                    (long)ssfdc->cylinders * (long)ssfdc->heads *
                    (long)ssfdc->sectors );

    ssfdc->mbd.size = (long)ssfdc->heads * (long)ssfdc->cylinders * 
(long)ssfdc->sectors;
#else
    ssfdc->mbd.size  = ssfdc->map_len * (ssfdc->erase_size >> SECTOR_SHIFT);
#endif

    //Allocate logical block map
    ssfdc->logic_block_map = kmalloc( sizeof(ssfdc->logic_block_map[0]) 
* ssfdc->map_len, GFP_KERNEL);
    if (!ssfdc->logic_block_map)
    {
        printk(KERN_WARNING "SSFDC_RO: out of memory for data 
structures\n");
        kfree(ssfdc);
        return;
    }
    memset(ssfdc->logic_block_map, 0xff, 
sizeof(ssfdc->logic_block_map[0]) * ssfdc->map_len);

    //Build logical block map
    if( build_logical_block_map(ssfdc) < 0 )
    {
        if ( ssfdc->logic_block_map )
            kfree(ssfdc->logic_block_map);
        kfree(ssfdc);
        return;
    }

    //Register device + partitions
    if (add_mtd_blktrans_dev(&ssfdc->mbd))
    {
        if ( ssfdc->logic_block_map )
            kfree(ssfdc->logic_block_map);
        kfree(ssfdc);
        return;
    }

    printk(KERN_INFO "SSFDC_RO: Found ssfdc%c on mtd%d (%s)\n",
                    ssfdc->mbd.devnum + 'a', mtd->index, mtd->name);
}

static void ssfdcr_remove_dev(struct mtd_blktrans_dev *dev)
{
    struct ssfdcr_record *ssfdc = (struct ssfdcr_record *)dev;

    DEBUG(MTD_DEBUG_LEVEL1, "SSFDC_RO: remove_dev (i=%d)\n", dev->devnum);

    del_mtd_blktrans_dev(dev);
    if (ssfdc->logic_block_map)
        kfree(ssfdc->logic_block_map);
    kfree(ssfdc);
}

static int ssfdcr_readsect(struct mtd_blktrans_dev *dev, unsigned long 
logic_sect_no, char *buf)
{
    struct ssfdcr_record *ssfdc = (struct ssfdcr_record *)dev;
    int sectors_per_block, offset, block_address;

    sectors_per_block = ssfdc->erase_size >> SECTOR_SHIFT;
    offset = (int)(logic_sect_no % sectors_per_block);
    block_address = (int)(logic_sect_no / sectors_per_block);

    DEBUG(MTD_DEBUG_LEVEL3, "SSFDC_RO: ssfdcr_readsect(%lu) 
sec_per_blk=%d, ofst=%d, block_addr=%d\n",
                        logic_sect_no, sectors_per_block, offset, 
block_address);

    if ( block_address >= ssfdc->map_len )
        BUG();

    block_address = ssfdc->logic_block_map[block_address];

    DEBUG(MTD_DEBUG_LEVEL3, "SSFDC_RO: ssfdcr_readsect() 
phys_block_addr=%d\n", block_address);

    if ( block_address < 0xffff )
    {
        unsigned long sect_no;

        sect_no = (unsigned long)block_address * sectors_per_block + offset;

        DEBUG(MTD_DEBUG_LEVEL3, "SSFDC_RO: ssfdcr_readsect() 
phys_sect_no=%lu\n", sect_no);

        if ( read_physical_sector( ssfdc->mbd.mtd, buf, sect_no ) < 0 )
            return -EIO;
    }
    else
    {
        memset(buf, 0xff, SECTOR_SIZE);
    }

    return 0;
}

#ifdef ENABLE_GETGEO
static int ssfdcr_getgeo(struct mtd_blktrans_dev *dev,  struct 
hd_geometry *geo)
{
    struct ssfdcr_record *ssfdc = (struct ssfdcr_record *)dev;

    DEBUG(MTD_DEBUG_LEVEL1, "SSFDC_RO: ssfdcr_getgeo() C=%d, H=%d, S=%d\n",
                        ssfdc->cylinders, ssfdc->heads, ssfdc->sectors);

    geo->heads = ssfdc->heads;
    geo->sectors = ssfdc->sectors;
    geo->cylinders = ssfdc->cylinders;

    return 0;
}
#endif

/****************************************************************************
 *
 * Module stuff
 *
 ****************************************************************************/

static struct mtd_blktrans_ops ssfdcr_tr = {
    .name        = "ssfdc",
    .major        = SSFDCR_MAJOR,
    .part_bits    = SSFDCR_PARTN_BITS,
#ifdef ENABLE_GETGEO
    .getgeo        = ssfdcr_getgeo,
#endif
    .readsect    = ssfdcr_readsect,
    .add_mtd    = ssfdcr_add_mtd,
    .remove_dev    = ssfdcr_remove_dev,
    .owner        = THIS_MODULE,
};

static int __init init_ssfdcr(void)
{
    printk(KERN_INFO "SSFDC Read only Flash Translation layer $Revision: 
1.5 $\n");

    return register_mtd_blktrans(&ssfdcr_tr);
}

static void __exit cleanup_ssfdcr(void)
{
    deregister_mtd_blktrans(&ssfdcr_tr);
}

module_init(init_ssfdcr);
module_exit(cleanup_ssfdcr);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Claudio Lanconelli <lanconelli.claudio@eptar.com>");
MODULE_DESCRIPTION("Flash Translation Layer for read-only SSDFC 
SmartMedia card");
