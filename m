Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9GWj-0001II-3Z
 for linux-mtd@lists.infradead.org; Mon, 21 Jul 2014 16:33:26 +0000
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: hujianyang@huawei.com
Subject: Re: [PATCH 6/7] New utility ubidump
References: <53BA491E.8060502@huawei.com> <53BA4B98.1080000@huawei.com>
 <1405497907.1920.27.camel@sauron.fi.intel.com>
 <53C63DA2.5080200@huawei.com>
 <1405507040.1906.18.camel@sauron.fi.intel.com>
 <53C6618F.3010707@huawei.com>
Date: Mon, 21 Jul 2014 12:20:59 -0400
In-Reply-To: <53C6618F.3010707@huawei.com> (hujianyang's message of "Wed, 16
 Jul 2014 19:27:11 +0800")
Message-ID: <874myan0no.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=-=-=
Content-Type: text/plain

On 16 Jul 2014, hujianyang at huawei.com wrote:

>> But again, if you start smaller, and upstream a good tool for
>> UBIFS-level stuff, it will be easier to add UBI stuff separately.

>> Besides, I have some additional vision, which you do not have to
>> implement, but which should be taken into account. E.g., ubidump
>> which does not need UBI/UBIFS drivers, ubidump which can deal with an
>> image generated with nanddump without "mounting" it, etc. So I was
>> thinking doing small steps at a time would make it easier for me and
>> for you to make a tool which has limited functionality today, but
>> which can be later extended to support more functionality.

> It seems you what more than me. I think you are right. I need to
> reconsider how to realize these above, not hole of them, but a
> good architecture that can be extended easily.

> So I think getting data from mtd driver is a good choice and then
> run it with an image file. Current UBI functionality has lots of
> limit and it is basing on UBI driver. But we need to do more work
> in user space (rebuilding volume table and so on) in this way. I
> think it's worth.

> Give me some time to re-create this utility. I will send it to you
> if I finished it. If you get some new ideas, please tell me as soon
> as possible.

I started some thing like this.  The source is attached.  As really you
only want 'read only' access, there is a minimal portion of the
UBI/UbiFs code that is needed.  I think that only the 'ubi-media.h' is
needed.  The Linux is high performance and handles read/write with
different fault conditions.

If you write code for read-only/single thread I think it will be much
more simple than the active UBI/UbiFS code in the Linux kernel.  I did
not look at the UbiFS layer as much.  It is far more complex that UBI
imho; of course, I just saw a little of the internal volumes and the
fast map features.  However, fast map itself should not be needed for
this utility.

For your use case of analysis in a running system, I think that reads of
'/dev/mtd0ro', etc can be used.  This way recovery features can also be
developed if we identified some inconsistency; Ie, it is not required to
'mount' the volume before analysis.

The attached source just scans an file image and create an leb/peb
mapping.  I only used the 'ubi-media.h' as documentation.

Fwiw,
Bill Pringlemeir.


--=-=-=
Content-Type: text/x-csrc
Content-Disposition: attachment; filename=parse_ubi.c
Content-Description: Stupid source that processes raw dump of UBI layer.

/* -*- mode: c; compile-command: "gcc -Wall -g -o parse_ubi parse_ubi.c"; -*- */

#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <endian.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

#define __packed __attribute__((packed))
#include "ubi-media.h"

#define bswap16 be16toh
#define bswap32 be32toh
#define bswap64 be64toh

static int dump_vid = 0;

#define CRCPOLY_LE 0xedb88320
static unsigned int crc32(unsigned int crc, void const *_p, size_t len)
{
    unsigned char const *p = _p;
	int i;
	while (len--) {
		crc ^= *p++;
		for (i = 0; i < 8; i++)
			crc = (crc >> 1) ^ ((crc & 1) ? CRCPOLY_LE : 0);
	}
	return crc;
}

#define ALEN(a) (sizeof(a)/sizeof(a[0]))
static void print_ec(struct ubi_ec_hdr *ec)
{
    if(ec->version != UBI_VERSION || ec->magic != UBI_EC_HDR_MAGIC) {
        printf(" Magic: %x\n", ec->magic);
        printf(" Version: %d\n", (int)ec->version);
        printf(" EC: %llx\n", ec->ec);
        printf(" VID offset: %x\n", ec->vid_hdr_offset);
        printf(" Data offset: %x\n", ec->data_offset);
        printf(" Image seq: %x\n", ec->image_seq);
        exit(-1);
    }
}

static void read_ec(int fd, struct ubi_ec_hdr *ec)
{
    int rval = read(fd, ec,sizeof(*ec));
    if(rval == sizeof(*ec)) {
        unsigned int crc;
        crc = crc32(UBI_CRC32_INIT, ec, UBI_EC_HDR_SIZE_CRC);
        ec->magic = bswap32(ec->magic);
        ec->vid_hdr_offset = bswap32(ec->vid_hdr_offset);
        ec->data_offset = bswap32(ec->data_offset);
        ec->image_seq = bswap32(ec->image_seq);
        ec->hdr_crc = bswap32(ec->hdr_crc);
        ec->ec = bswap64(ec->ec);
        if(crc != ec->hdr_crc)
            printf("EC CRC: %x/%x\n", crc, ec->hdr_crc);
    } else
        memset(ec, 0, sizeof(*ec));
}

static void print_vid(int vid_num, struct ubi_vid_hdr *vid)
{
    if(vid->magic != UBI_VID_HDR_MAGIC)
        printf(" Magic: %x\n", vid->magic);
    if(vid->version != UBI_VERSION)
        printf(" Version: %d\n", (int)vid->version);

    if(!dump_vid) return;
    
    printf("VID %d\n", vid_num);

    /* This is usually the same. */
    if(vid->vol_id >= UBI_INTERNAL_VOL_START)
        printf("Internal vol_id: %d\n", vid->vol_id - UBI_INTERNAL_VOL_START);
    if(vid->vol_type != UBI_VID_DYNAMIC)
        printf(" vol_type: %s\n",
               vid->vol_type == UBI_VID_DYNAMIC ? "dynamic" : "static");
    if(vid->used_ebs)
        printf(" used_ebs: %d\n", vid->used_ebs);
    if(vid->data_pad)
        printf(" data_pad: %d\n", vid->data_pad);
    if((vid->copy_flag != 1 && vid->data_size) ||
       (vid->copy_flag == 0 && vid->data_size))
        printf(" copy_flag: %d\n", (int)vid->copy_flag);

    printf(" lnum: %d\n", vid->lnum);
    if(vid->compat) {
        const char *compat[] = {
            [UBI_COMPAT_DELETE]   = "delete",
            [UBI_COMPAT_RO]       = "ro",
            [UBI_COMPAT_PRESERVE] = "preserve",
            [UBI_COMPAT_REJECT]   = "reject"
        };
        printf(" compat: %s\n", compat[vid->compat]);
    }
    printf(" data_size: %d\n", vid->data_size);
    /* printf(" data_crc: %x\n", vid->data_crc); */
    printf(" hdr_crc: %x\n", vid->hdr_crc);
    printf(" sqnum: %lld\n", vid->sqnum);
}

static int read_vid(int fd, struct ubi_vid_hdr *vid)
{
    int rval = read(fd, vid,sizeof(*vid));
    if(rval == sizeof(*vid)) {
        unsigned int crc;
        crc = crc32(UBI_CRC32_INIT, vid, UBI_EC_HDR_SIZE_CRC);
        vid->magic = bswap32(vid->magic);
        vid->vol_id = bswap32(vid->vol_id);
        vid->lnum = bswap32(vid->lnum);
        vid->data_size = bswap32(vid->data_size);
        vid->used_ebs = bswap32(vid->used_ebs);
        vid->data_pad = bswap32(vid->data_pad);
        vid->data_crc = bswap32(vid->data_crc);
        vid->hdr_crc = bswap32(vid->hdr_crc);
        vid->sqnum = bswap64(vid->sqnum);
        if(crc != vid->hdr_crc && vid->magic == UBI_VID_HDR_MAGIC)
            printf("VID CRC: %x/%x\n", crc, vid->hdr_crc);
#if 0
        /* Apparently data after VID is semi-random. */
        /* Read extra 32 bits and check for all 0xff. */
        {
            off_t cur = lseek(fd, 0, SEEK_CUR);
            if(read(fd, &crc, sizeof(crc)) == sizeof(crc)) {
                if(crc != 0xffffffffUL)
                    printf("Corrupt VID extra @ %d with %x\n", vid->lnum, crc);
            } else {
                printf("Can read VID extra @ %d.\n", vid->lnum);
            }
            lseek(fd, cur, SEEK_SET);
        }
#endif
    } else
        memset(vid, 0, sizeof(*vid));
    return rval;
}

static void print_vtbl(struct ubi_vtbl_record *vtbl)
{
    printf(" Found vtbl [%d] %s\n", vtbl->name_len, vtbl->name);
    printf(" Reserved PEBs: %d\n", vtbl->reserved_pebs);
    printf(" Align: %d\n", vtbl->alignment);
    printf(" Pad: %d\n", vtbl->data_pad);
    if(vtbl->vol_type != UBI_VID_DYNAMIC)
        printf(" vol_type: %s\n",
               vtbl->vol_type == UBI_VID_DYNAMIC ? "dynamic" : "static");
    printf(" Update: %d\n", vtbl->upd_marker);
    printf(" Flags: %d\n", (int)vtbl->flags);
}

static void read_vtbl(int fd, struct ubi_vtbl_record *vtbl)
{
    int rval = read(fd, vtbl, sizeof(*vtbl));
    if(rval == sizeof(*vtbl)) {
        vtbl->reserved_pebs = bswap32(vtbl->reserved_pebs);
        vtbl->alignment = bswap32(vtbl->alignment);
        vtbl->data_pad = bswap32(vtbl->data_pad);
        vtbl->crc = bswap32(vtbl->crc);
        vtbl->name_len = bswap16(vtbl->name_len);
    } else
        memset(vtbl, 0, sizeof(*vtbl));
}

static void print_fm_sb(struct ubi_fm_sb *fm_sb)
{
    int i;
    
    if(fm_sb->magic != UBI_FM_SB_MAGIC)
        printf(" Magic: %x\n", fm_sb->magic);
    if(fm_sb->version != UBI_VERSION)
        printf(" Version: %d\n", (int)fm_sb->version);
    printf(" data_crc: %x\n", fm_sb->data_crc);
    printf(" used_blocks: %x\n", fm_sb->used_blocks);
    for(i = 0; i < fm_sb->used_blocks; i++)
        printf(" block_loc[%d]: %d\n", i, fm_sb->block_loc[i]);
    for(i=0; i < fm_sb->used_blocks; i++)
        printf(" block_ec[%d]: %d\n", i, fm_sb->block_ec[i]);
    printf(" sqnum: %lld\n", fm_sb->sqnum);
}

static void read_fm_sb(int fd, struct ubi_fm_sb *fm_sb)
{
    int rval = read(fd, fm_sb, sizeof(*fm_sb));
    if(rval == sizeof(*fm_sb)) {
        int i;
        fm_sb->magic = bswap32(fm_sb->magic);
        fm_sb->data_crc = bswap32(fm_sb->data_crc);
        fm_sb->used_blocks = bswap32(fm_sb->used_blocks);
        for(i=0; i < UBI_FM_MAX_BLOCKS; i++)
            fm_sb->block_loc[i] = bswap32(fm_sb->block_loc[i]);
        for(i=0; i < UBI_FM_MAX_BLOCKS; i++)
            fm_sb->block_ec[i] = bswap32(fm_sb->block_ec[i]);
        fm_sb->sqnum = bswap64(fm_sb->sqnum);
    } else
        memset(fm_sb, 0, sizeof(*fm_sb));
}

/* Set logical block at physical. */
static int eba_map[1920];
static int pba_map[1920];

static void usage(char *name)
{
    printf("Usage: %s -b [erase block size] -e -v <ubi file> \n", name);
    printf("Where,\n -e  is dump the logic to physical block map.\n");
    printf(" -v  is dump the VID headers.\n");
    printf(" -b [size] sets the erase block size (flash dependent).\n");
  
}

typedef struct fastmap {
    struct ubi_fm_sb        fm_sb;
    struct ubi_fm_hdr       hdr;
    struct ubi_fm_scan_pool pool1;
    struct ubi_fm_scan_pool pool2;
    /* Free, Used, Scrub and Erase */
    struct ubi_fm_ec        ec[0];
    /* ... */
    /* struct ubi_fm_volhdr vol; */
    /* struct ubi_fm_eba eba[0]; */

} fastmap;

int main (int argc, char *argv[])
{
    int fd, i, erase_block = 0, eba_flag = 0;
    int c;
    struct ubi_ec_hdr ec;
    struct ubi_vid_hdr vid;
    int erase_size = 0x20000;
    int leb_size;
    off_t cur_ec = 0;
    int vidless_blocks = 0;

    while ((c = getopt (argc, argv, "hveb:")) != -1)
        switch (c)
        {
            case 'h': /* Help */
                usage(argv[0]);
                goto out;
            case 'b':
                erase_size = atoi(optarg);
                break;
            case 'e':
                eba_flag = 1;
                break;
            case 'v':
                dump_vid = 1;
                break;
            case '?':
                if (optopt == 'b')
                    fprintf (stderr, "Option -%c requires an argument.\n", optopt);
                else if (isprint (optopt))
                    fprintf (stderr, "Unknown option `-%c'.\n", optopt);
                else
                    fprintf (stderr,
                             "Unknown option character `\\x%x'.\n",
                             optopt);
                return 1;
            default:
                goto out;
        }

    if(optind >= argc) {
        usage(argv[0]);
        goto out;
    }

    fd = open(argv[optind], O_RDONLY);
    if(fd < 0) {
        printf("Bad file: %s\n", argv[1]);
        goto out;
    }

    memset(eba_map, -1, sizeof(eba_map));
    memset(pba_map, -1, sizeof(pba_map));
    
    /* Process each 'erase block'. */
    read_ec(fd,&ec);
    while(ec.magic == UBI_EC_HDR_MAGIC) {
        leb_size = erase_size - ec.data_offset;
        print_ec(&ec);

        /* VID present? */
        if(lseek(fd, ec.vid_hdr_offset-sizeof(ec), SEEK_CUR) == -1) {
            printf("Seek error: %s\n", argv[1]);
            goto out;
        }

        if(read_vid(fd,&vid) != sizeof(vid)) {
            printf("File too small: %s\n", argv[1]);
            goto out;
        }
        if(vid.magic == UBI_VID_HDR_MAGIC) {
            print_vid(erase_block, &vid);
            if(vid.vol_id == 3) {
                if(eba_map[vid.lnum] != -1)
                    printf("EBA dup: %d %d\n", eba_map[vid.lnum], erase_block);
                eba_map[vid.lnum] = erase_block;
            }
            pba_map[erase_block] = vid.lnum;

            /* Read volume table. */
            if(vid.vol_id == UBI_INTERNAL_VOL_START) {
                /* Seek to PEB data offset. */
                if(lseek(fd,
                         ec.data_offset - ec.vid_hdr_offset - sizeof(vid),
                         SEEK_CUR) == -1)
                    printf("Seek error: %s\n", argv[1]);
                else {
                    int i;
                    struct ubi_vtbl_record vtbl;
                    for(i = 0; i < UBI_MAX_VOLUMES; i++) {
                        read_vtbl(fd, &vtbl);
                        if(vtbl.reserved_pebs ||
                           vtbl.name_len ||
                           strcmp((char*)vtbl.name, "") != 0) {
                            printf("VTBL %d\n", i);
                            print_vtbl(&vtbl);
                        }
                    }
                }
            } else if(vid.vol_id == UBI_FM_SB_VOLUME_ID) {
                printf("Found Fastmap super block @PEB %d.\n", erase_block);
                if(lseek(fd,
                         ec.data_offset - ec.vid_hdr_offset - sizeof(vid),
                         SEEK_CUR) == -1)
                    printf("Seek error: %s\n", argv[1]);
                else {
                    void *data = alloca(leb_size);
                    struct ubi_fm_sb *fm_sb = data;
                    read_fm_sb(fd, data);
                    print_fm_sb(fm_sb);
                }
            } else if(vid.vol_id == UBI_FM_DATA_VOLUME_ID) {
                printf("Found Fastmap data block @PEB %d.\n", erase_block);
                printf("UNSUPPORTED!!!\n");
            }

        } else if(vid.magic != 0xffffffff){
            printf("VID %d corrupt! %x\n", erase_block, vid.magic);
        } else {
            vidless_blocks++;
        }

        erase_block++;
        cur_ec += erase_size;
        cur_ec = lseek(fd, cur_ec, SEEK_SET);

        /* Process Erase counter. */
        read_ec(fd,&ec);
    }

    printf("Found %d vidless (free) blocks.\n", vidless_blocks);
    if(eba_flag) {
        printf("Logical to physical.\n");
        for(i = 0; i < ALEN(eba_map); i+=8)
            printf("%4d: %4d %4d %4d %4d %4d %4d %4d %4d"
                   " %4d %4d %4d %4d %4d %4d %4d %4d\n", i,
                   eba_map[i],   eba_map[i+1],
                   eba_map[i+2], eba_map[i+3],
                   eba_map[i+4], eba_map[i+5],
                   eba_map[i+6], eba_map[i+7],
                   eba_map[i+8], eba_map[i+9],
                   eba_map[i+10], eba_map[i+11],
                   eba_map[i+12], eba_map[i+13],
                   eba_map[i+14], eba_map[i+15]);
        printf("Physical to logical.\n");
        for(i = 0; i < ALEN(pba_map); i+=8)
            printf("%4d: %4d %4d %4d %4d %4d %4d %4d %4d"
                   " %4d %4d %4d %4d %4d %4d %4d %4d\n", i,
                   pba_map[i],   pba_map[i+1],
                   pba_map[i+2], pba_map[i+3],
                   pba_map[i+4], pba_map[i+5],
                   pba_map[i+6], pba_map[i+7],
                   pba_map[i+8], pba_map[i+9],
                   pba_map[i+10], pba_map[i+11],
                   pba_map[i+12], pba_map[i+13],
                   pba_map[i+14], pba_map[i+15]);
    }
out:
    return 0;
}

--=-=-=--
