Received: from web63402.mail.re1.yahoo.com ([69.147.97.42])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kdt9U-0002MJ-UQ
	for linux-mtd@lists.infradead.org; Thu, 11 Sep 2008 20:52:33 +0000
Date: Thu, 11 Sep 2008 13:52:31 -0700 (PDT)
From: Fundu <fundu_1999@yahoo.com>
Subject: Flash Mapping and gpio 
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <306578.90559.qm@web63402.mail.re1.yahoo.com>
Reply-To: fundu_1999@yahoo.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I trying to access 256mb flash from a pripheral that can only access 128 mb.
flash are in x16 mode and interleaved.
A gpio is connected to A25 pin of the flash parts.

Such that any of the two 128mb "areas" can be accessed.

I'm trying to configure the mtd drivers such that i can do the following 

so when ofs 00000000 -> 07ffffff, A25(gpio)= 0
ofs 08000000 -> 0fffffff, A25(gpio) =1


i have added helper the following function in include/linux/cfi.h

#define GPIO_FLASH_MASK 0x00000800
static inline void flash_cs(u32 addr, char is_ret)
{
    u32 gpio_data = is_ret ? 0 : GPIO_FLASH_MASK;
    if (addr & 0x08000000)
    {
        ibm_gpio_out(0, GPIO_FLASH_MASK, gpio_data);
    }
}

/* adjust the ofs such that 0800_0000 seems like 0000_0000 */
static inline u32 update_addr(u32 addr)
{
    return (addr & 0x08000000) ? (addr - 0x08000000) : addr;
}


static inline void cfi_write(struct map_info *map, cfi_word val, __u32 addr)
{
    flash_cs(map->phys + addr, 0);
    u32 new_addr = update_addr(addr);

    cfi_write_o(map, val, new_addr);

    flash_cs(map->phys + addr, 1); // sets A25 back to 0
}

static inline cfi_word cfi_read(struct map_info *map, __u32 addr)
{
    flash_cs(map->phys + addr, 0);
    u32 new_addr = update_addr(addr);

    cfi_word returnVal = cfi_read_o(map, new_addr);

    flash_cs(map->phys + addr, 1); // sets A25 back to 0

    return returnVal;
}

cfi_read_o and cfi_write_o are the original fn.

Also in cfi_send_gen_cmd i don't call the modified cfi_write 
as all Commands go to base address which is 0.

Questions 
---------
there are 2 things that i'm seeing that doesn't make sense
in cfi_probe.c the print_cfi_ident prints the following

Typical byte/word write timeout: 64 us
Maximum byte/word write timeout: 512 us
Typical full buffer write timeout: 64 us
Maximum full buffer write timeout: 2048 us
Typical block erase timeout: 512 ms
Maximum block erase timeout: 4096 ms
Typical chip erase timeout: 524288 ms
Maximum chip erase timeout: 2097152 ms
Device size: 0x8000000 bytes (128 MiB)
Flash Device Interface description: 0x0002

1) which seems wrong as the Device size should come out to be 256 instead of 128.
This doesn't look right, any ideas ? 

other is that when i do a erase i'm seeing a this ...
MTD do_erase_oneblock(): Wacky!  Unable to decode failure status
MTD do_erase_oneblock(): 0x07f40000(0x00ff00ff): 0x27051956 0x27051956 0x27051956 0x27051956

thanks !
fundu


      
