Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eqPmk-0004Z4-Tb
 for linux-mtd@lists.infradead.org; Mon, 26 Feb 2018 20:54:15 +0000
Date: Mon, 26 Feb 2018 21:53:39 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Cc: miquel.raynal@free-electrons.com, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, marcel.ziswiler@toradex.com, richard@nod.at,
 linux-mtd@lists.infradead.org, bpringle@sympatico.ca
Subject: Re: [RFC PATCH v4 1/2] mtd: nand: vf610_nfc: make use of ->exec_op()
Message-ID: <20180226215339.6a23e633@bbrezillon>
In-Reply-To: <b3d84aab5b89d333d731c515f564f917@agner.ch>
References: <20180222202918.8708-1-stefan@agner.ch>
 <20180222202918.8708-2-stefan@agner.ch>
 <20180222230637.6f8437f9@bbrezillon>
 <2044ff39c936ecf123f32e7cecedb12b@agner.ch>
 <b3d84aab5b89d333d731c515f564f917@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 26 Feb 2018 21:05:35 +0100
Stefan Agner <stefan@agner.ch> wrote:

> On 26.02.2018 08:48, Stefan Agner wrote:
> > On 22.02.2018 23:06, Boris Brezillon wrote:  
> >> On Thu, 22 Feb 2018 21:29:17 +0100
> >> Stefan Agner <stefan@agner.ch> wrote:
> >>  
> >>> This reworks the driver to make use of ->exec_op() callback. The
> >>> command sequencer of the VF610 NFC aligns well with the new ops
> >>> interface.
> >>>
> >>> The ops are translated to a NFC command code while filling the
> >>> necessary registers. Instead of using the special status and
> >>> read id command codes (which require the status/id form special
> >>> registers) the driver now uses the main data buffer for all
> >>> commands. This simplifies the driver as no special casing is
> >>> needed.
> >>>
> >>> For control data (status byte, id bytes and parameter page) the
> >>> driver needs to reverse byte order for little endian CPUs since
> >>> the controller seems to store the bytes in big endian order in
> >>> the data buffer.
> >>>
> >>> The current state seems to pass MTD tests on a Colibri VF61.
> >>>
> >>> Signed-off-by: Stefan Agner <stefan@agner.ch>
> >>> ---
> >>>  drivers/mtd/nand/raw/vf610_nfc.c | 439 +++++++++++++++++++++++++++++++++++++--
> >>>  1 file changed, 425 insertions(+), 14 deletions(-)
> >>>
> >>> diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
> >>> index 5d7a1f8f580f..9baf80766307 100644
> >>> --- a/drivers/mtd/nand/raw/vf610_nfc.c
> >>> +++ b/drivers/mtd/nand/raw/vf610_nfc.c
> >>> @@ -74,6 +74,22 @@
> >>>  #define RESET_CMD_CODE			0x4040
> >>>  #define STATUS_READ_CMD_CODE		0x4068
> >>>
> >>> +/* NFC_CMD2[CODE] controller cycle bit masks */
> >>> +#define COMMAND_CMD_BYTE1		BIT(14)
> >>> +#define COMMAND_CAR_BYTE1		BIT(13)
> >>> +#define COMMAND_CAR_BYTE2		BIT(12)
> >>> +#define COMMAND_RAR_BYTE1		BIT(11)
> >>> +#define COMMAND_RAR_BYTE2		BIT(10)
> >>> +#define COMMAND_RAR_BYTE3		BIT(9)
> >>> +#define COMMAND_NADDR_BYTES(x)		GENMASK(13, 13 - (x) - 1)
> >>> +#define COMMAND_WRITE_DATA		BIT(8)
> >>> +#define COMMAND_CMD_BYTE2		BIT(7)
> >>> +#define COMMAND_RB_HANDSHAKE		BIT(6)
> >>> +#define COMMAND_READ_DATA		BIT(5)
> >>> +#define COMMAND_CMD_BYTE3		BIT(4)
> >>> +#define COMMAND_READ_STATUS		BIT(3)
> >>> +#define COMMAND_READ_ID			BIT(2)
> >>> +
> >>>  /* NFC ECC mode define */
> >>>  #define ECC_BYPASS			0
> >>>  #define ECC_45_BYTE			6
> >>> @@ -97,10 +113,14 @@
> >>>  /* NFC_COL_ADDR Field */
> >>>  #define COL_ADDR_MASK				0x0000FFFF
> >>>  #define COL_ADDR_SHIFT				0
> >>> +#define COL_ADDR(pos, val)			((val & 0xFF) << (8 * (pos)))
> >>> +
> >>>
> >>>  /* NFC_ROW_ADDR Field */
> >>>  #define ROW_ADDR_MASK				0x00FFFFFF
> >>>  #define ROW_ADDR_SHIFT				0
> >>> +#define ROW_ADDR(pos, val)			((val & 0xFF) << (8 * (pos)))
> >>> +
> >>>  #define ROW_ADDR_CHIP_SEL_RB_MASK		0xF0000000
> >>>  #define ROW_ADDR_CHIP_SEL_RB_SHIFT		28
> >>>  #define ROW_ADDR_CHIP_SEL_MASK			0x0F000000
> >>> @@ -165,6 +185,7 @@ struct vf610_nfc {
> >>>  	enum vf610_nfc_variant variant;
> >>>  	struct clk *clk;
> >>>  	bool use_hw_ecc;
> >>> +	bool page_access;  
> >>
> >> This field deserves a comment IMO, even if you describe in details what
> >> it does in the rd/wr_from/to_sram() funcs.
> >>  
> >>>  	u32 ecc_mode;
> >>>  };
> >>>
> >>> @@ -173,6 +194,11 @@ static inline struct vf610_nfc *mtd_to_nfc(struct mtd_info *mtd)
> >>>  	return container_of(mtd_to_nand(mtd), struct vf610_nfc, chip);
> >>>  }
> >>>
> >>> +static inline struct vf610_nfc *chip_to_nfc(struct nand_chip *chip)
> >>> +{
> >>> +	return container_of(chip, struct vf610_nfc, chip);
> >>> +}
> >>> +
> >>>  static inline u32 vf610_nfc_read(struct vf610_nfc *nfc, uint reg)
> >>>  {
> >>>  	return readl(nfc->regs + reg);
> >>> @@ -214,6 +240,86 @@ static inline void vf610_nfc_memcpy(void *dst, const void __iomem *src,
> >>>  	memcpy(dst, src, n);
> >>>  }
> >>>
> >>> +static inline bool vf610_nfc_is_little_endian(void)  
> >>
> >> It's not really the NFC that is LE, is it? I mean, you could have the
> >> kernel configured in BIG ENDIAN for this platform, and then you wouldn't
> >> have to do the byte-swapping.
> >>  
> >>> +{
> >>> +#ifdef __LITTLE_ENDIAN
> >>> +	return true;
> >>> +#else
> >>> +	return false;
> >>> +#endif
> >>> +}
> >>> +
> >>> +/**
> >>> + * Read accessor for internal SRAM buffer
> >>> + * @dst: destination address in regular memory
> >>> + * @src: source address in SRAM buffer
> >>> + * @len: bytes to copy
> >>> + * @fix_endian: Fix endianness if required
> >>> + *
> >>> + * Use this accessor for the internal SRAM buffers. On the ARM
> >>> + * Freescale Vybrid SoC it's known that the driver can treat
> >>> + * the SRAM buffer as if it's memory. Other platform might need
> >>> + * to treat the buffers differently.
> >>> + *
> >>> + * The controller stores bytes from the NAND chip internally in big
> >>> + * endianness. On little endian platforms such as Vybrid this leads
> >>> + * to reversed byte order.
> >>> + * For performance reason (and earlier probably due to unanawareness)  
> >>
> >> 							  ^ unawareness
> >>  
> >>> + * the driver avoids correcting endianness where it has control over
> >>> + * write and read side (e.g. page wise data access).
> >>> + * In case endianness matters len should be a multiple of 4.
> >>> + */
> >>> +static inline void vf610_nfc_rd_from_sram(void *dst, const void __iomem *src,
> >>> +					  size_t len, bool fix_endian)
> >>> +{
> >>> +	if (vf610_nfc_is_little_endian() && fix_endian) {
> >>> +		unsigned int i;
> >>> +
> >>> +		for (i = 0; i < len; i += 4) {
> >>> +			u32 val = be32_to_cpu(__raw_readl(src + i));
> >>> +			memcpy(dst + i, &val, min(sizeof(val), len - i));
> >>> +		}
> >>> +	} else {
> >>> +		memcpy_fromio(dst, src, len);
> >>> +	}
> >>> +}
> >>> +
> >>> +/**
> >>> + * Write accessor for internal SRAM buffer
> >>> + * @dst: destination address in SRAM buffer
> >>> + * @src: source address in regular memory
> >>> + * @len: bytes to copy
> >>> + * @fix_endian: Fix endianness if required
> >>> + *
> >>> + * Use this accessor for the internal SRAM buffers. On the ARM
> >>> + * Freescale Vybrid SoC it's known that the driver can treat
> >>> + * the SRAM buffer as if it's memory. Other platform might need
> >>> + * to treat the buffers differently.
> >>> + *
> >>> + * The controller stores bytes from the NAND chip internally in big
> >>> + * endianness. On little endian platforms such as Vybrid this leads
> >>> + * to reversed byte order.
> >>> + * For performance reason (and earlier probably due to unanawareness)  
> >>
> >> 							  ^ unawareness
> >>  
> >>> + * the driver avoids correcting endianness where it has control over
> >>> + * write and read side (e.g. page wise data access).
> >>> + * In case endianness matters len should be a multiple of 4.  
> >>
> >> That's the opposite actually. If fix_endian is set, we don't have any
> >> requirement on len alignment, because the cpu_to_be32(val) will save
> >> us. But we have a problem when fix_endian is false an len is not
> >> aligned on 4, because, AFAIR memcpy_toio() does 32-bit accesses when
> >> things are properly aligned on 32 bits, and when that's not the case it
> >> falls back to 16 or 8 bit accesses, which in our case may lead to data
> >> loss on LE platforms.
> >>  
> 
> I guess that also applies to read?

Yes it does.

> 
> Wouldn't that mean that my status command is broken? The stack usually
> does a 1 byte read there....

No, because endianness it taken into account in this case. That's the
very reason you previously had an issue when the STATUS command was
executed with ->page_access set to true (in this case endianness is
ignored), and this problem disappeared when you moved the call that was
executing a STATUS op outside of the ->page_access=true section.

> 
> <snip>
> 
> >> Same problem here. The above logic should be replaced by:
> >>
> >> 	nfc->page_access = true;
> >> 	ret = nand_prog_page_begin_op(chip, page, mtd->writesize,
> >> 				      chip->oob_poi, mtd->oobsize);
> >>
> >> 	nfc->page_access = false;
> >>
> >> 	if (ret)
> >> 		return ret;
> >>
> >> 	return nand_prog_page_end_op(chip);
> >>  
> > 
> > Read/write seems to work, but there seems to be an issue with data:
> > 
> > root@colibri-vf:~# insmod mtd_oobtest.ko dev=3
> > [   69.609120]
> > [   69.610664] =================================================
> > [   69.616734] mtd_oobtest: MTD device: 3
> > [   69.631659] mtd_oobtest: MTD device size 16777216, eraseblock size
> > 131072, page size 2048, count of eraseblocks 128, pages per eraseblock
> > 64, OOB size 64
> > [   69.647814] mtd_test: scanning for bad eraseblocks
> > [   69.654166] mtd_test: scanned 128 eraseblocks, 0 are bad
> > [   69.659507] mtd_oobtest: test 1 of 5
> > [   69.736812] mtd_oobtest: writing OOBs of whole device
> > [   69.755753] mtd_oobtest: written up to eraseblock 0
> > [   71.500646] mtd_oobtest: written 128 eraseblocks
> > [   71.505397] mtd_oobtest: verifying all eraseblocks
> > [   71.510336] mtd_oobtest: error @addr[0x0:0x0] 0xff -> 0xe diff 0xf1
> > [   71.516727] mtd_oobtest: error @addr[0x0:0x1] 0xff -> 0x10 diff 0xef
> > [   71.523164] mtd_oobtest: error: verify failed at 0x0
> > [   71.530372] mtd_oobtest: error @addr[0x800:0x0] 0xff -> 0x82 diff
> > 0x7d
> > [   71.537083] mtd_oobtest: error @addr[0x800:0x1] 0xff -> 0x10 diff
> > 0xef
> > [   71.543709] mtd_oobtest: error: verify failed at 0x800
> > 
> > Need to check what is exactly going wrong.  
> 
> I found the issue there, the COMMAND_NADDR_BYTES macro should look like
> this:
> 
> #define COMMAND_NADDR_BYTES(x)		GENMASK(13, 13 - (x) + 1)

I don't remember what I initially suggested, but this one is good ;-).


-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
