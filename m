Message-ID: <4DB14CE9.2040602@freescale.com>
Date: Fri, 22 Apr 2011 17:39:53 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@KARO-electronics.de>
Subject: Re: [PATCH v6 1/3] MTD : add the common code for GPMI controller
	driver
References: <1303267549-18377-1-git-send-email-b32955@freescale.com>	<1303267549-18377-2-git-send-email-b32955@freescale.com>
	<19887.57747.43423.753598@ipc1.ka-ro>
In-Reply-To: <19887.57747.43423.753598@ipc1.ka-ro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi:
> Huang Shijie writes:
>> These files contain the common code for the GPMI driver.
>>
>> Signed-off-by: Huang Shijie<b32955@freescale.com>
>> ---
>>   drivers/mtd/nand/gpmi-nfc/gpmi-nfc.c | 2501 ++++++++++++++++++++++++=
++++++++++
>>   drivers/mtd/nand/gpmi-nfc/gpmi-nfc.h |  488 +++++++
>>   2 files changed, 2989 insertions(+), 0 deletions(-)
>>   create mode 100644 drivers/mtd/nand/gpmi-nfc/gpmi-nfc.c
>>   create mode 100644 drivers/mtd/nand/gpmi-nfc/gpmi-nfc.h
>>
>> diff --git a/drivers/mtd/nand/gpmi-nfc/gpmi-nfc.c b/drivers/mtd/nand/g=
pmi-nfc/gpmi-nfc.c
>> new file mode 100644
>> index 0000000..53d6915
>> --- /dev/null
>> +++ b/drivers/mtd/nand/gpmi-nfc/gpmi-nfc.c
>> @@ -0,0 +1,2501 @@
>> +/*
>> + * Freescale GPMI NFC NAND Flash Driver
>> + *
>> + * Copyright (C) 2010-2011 Freescale Semiconductor, Inc.
>> + * Copyright (C) 2008 Embedded Alley Solutions, Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modi=
fy
>> + * it under the terms of the GNU General Public License as published =
by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License =
along
>> + * with this program; if not, write to the Free Software Foundation, =
Inc.,
>> + * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
>> + */
>> +#include<linux/slab.h>
>> +#include "gpmi-nfc.h"
>> +
>> +/* add our owner bbt descriptor */
>> +static uint8_t scan_ff_pattern[] =3D { 0xff };
>> +static struct nand_bbt_descr gpmi_bbt_descr =3D {
>> +	.options	=3D 0,
>> +	.offs		=3D 0,
>> +	.len		=3D 1,
>> +	.pattern	=3D scan_ff_pattern
>> +};
>> +
>> +/* debug control */
>> +int gpmi_debug;
>> +
> This could be a module_param.
>
thanks.
>> +static ssize_t show_gpmi_debug(struct device *dev,
>> +				struct device_attribute *attr, char *buf)
>> +{
>> +	return sprintf(buf, "%d\n", gpmi_debug);
>> +}
>> +
>> +static ssize_t
>> +store_gpmi_debug(struct device *dev, struct device_attribute *attr,
>> +			const char *buf, size_t size)
>> +{
>> +	const char *p =3D buf;
>> +	unsigned long v;
>> +
>> +	if (strict_strtoul(p, 0,&v)<  0)
>> +		return size;
>> +
>> +	gpmi_debug =3D v;
>> +	return size;
>> +}
>> +
>> +static ssize_t show_ignorebad(struct device *dev,
>> +				struct device_attribute *attr, char *buf)
>> +{
>> +	struct gpmi_nfc_data *this =3D dev_get_drvdata(dev);
>> +	struct mil *mil =3D&this->mil;
>> +
>> +	return sprintf(buf, "%d\n", mil->ignore_bad_block_marks);
>> +}
>> +
>> +static ssize_t
>> +store_ignorebad(struct device *dev, struct device_attribute *attr,
>> +			const char *buf, size_t size)
>> +{
>> +	struct gpmi_nfc_data *this =3D dev_get_drvdata(dev);
>> +	struct mil *mil =3D&this->mil;
>> +	const char *p =3D buf;
>> +	unsigned long v;
>> +
>> +	if (strict_strtoul(p, 0,&v)<  0)
>> +		return size;
>>
> return -EINVAL would be more appropriate here.
>
>> +
>> +	if (v>  0)
>> +		v =3D 1;
>> +
>> +	if (v !=3D mil->ignore_bad_block_marks) {
>>
> These lines could be reduced to:
> 	if (!v =3D=3D mil->ignore_bad_block_marks) {
>
:)
>> +		if (v) {
>> +			/*
>> +			 * This will cause the NAND Flash MTD code to believe
>> +			 * that it never created a BBT and force it to call our
>> +			 * block_bad function.
>> +			 *
>> +			 * See mil_block_bad for more details.
>> +			 */
>> +			mil->saved_bbt =3D mil->nand.bbt;
>> +			mil->nand.bbt  =3D NULL;
>> +		} else {
>> +			/*
>> +			 * Restore the NAND Flash MTD's pointer
>> +			 * to its in-memory BBT.
>> +			 */
>> +			mil->nand.bbt =3D mil->saved_bbt;
>> +		}
>> +		mil->ignore_bad_block_marks =3D v;
>> +	}
>> +	return size;
>> +}
>> +
> [...]
>> +/* This will be called after the DMA operation is finished. */
>> +static void dma_irq_callback(void *param)
>> +{
>> +	struct gpmi_nfc_data *this =3D param;
>> +	struct nfc_hal *nfc =3D this->nfc;
>> +	struct mil *mil =3D&this->mil;
>> +
>> +	complete(&nfc->dma_done);
>> +
>> +	switch (this->dma_type) {
>> +	case DMA_FOR_COMMAND:
>> +		dma_unmap_sg(this->dev,&mil->cmd_sgl, 1, DMA_TO_DEVICE);
>> +		break;
>> +
>> +	case DMA_FOR_READ_DATA:
>> +		dma_unmap_sg(this->dev,&mil->data_sgl, 1, DMA_FROM_DEVICE);
>> +		if (mil->direct_dma_map_ok =3D=3D false)
>> +			memcpy(mil->upper_buf, (char *)mil->data_buffer_dma,
>>
> pointless cast.
thanks.
> [...]
>> +static int acquire_dma_channels(struct gpmi_nfc_data *this,
>> +				const char *resource_name,
>> +				unsigned *low_channel, unsigned *high_channel)
>> +{
>> +	struct platform_device *pdev =3D this->pdev;
> 	struct gpmi_nfc_platform_data *pdata =3D pdev->dev.platform_data;
> see below.
>
>> +	struct resource *r, *r_dma;
>> +	unsigned int i;
>> +
>> +	r =3D platform_get_resource_byname(pdev, IORESOURCE_DMA, resource_na=
me);
>> +	r_dma =3D platform_get_resource_byname(pdev, IORESOURCE_IRQ,
>> +					GPMI_NFC_DMA_INTERRUPT_RES_NAME);
>> +	if (!r || !r_dma) {
>> +		log("Can't get resource for DMA");
>> +		return -ENXIO;
>> +	}
>> +
>> +	/* used in gpmi_dma_filter() */
>> +	this->private =3D r;
>> +
>> +	for (i =3D r->start; i<=3D r->end; i++) {
>> +		dma_cap_mask_t		mask;
>> +		struct dma_chan		*dma_chan;
>> +
> 		if (i - r->start>=3D pdata->max_chip_count)
> 			break;
>
This is a good idea. it can limits the real dma channels.
>> +		dma_cap_zero(mask);
>> +		dma_cap_set(DMA_SLAVE, mask);
>> +
>> +		/* get the DMA interrupt */
>> +		this->dma_data.chan_irq =3D r_dma->start +
>> +			((r_dma->start !=3D r_dma->end) ? (i - r->start) : 0);
>> +
>> +		dma_chan =3D dma_request_channel(mask, gpmi_dma_filter, this);
>> +		if (!dma_chan)
>> +			goto acquire_err;
>> +		/* fill the first empty item */
>> +		this->dma_chans[i - r->start] =3D dma_chan;
>> +	}
>> +
>> +	*low_channel  =3D r->start;
>> +	*high_channel =3D r->end;
> 	*high_channel =3D i;
>
> This will acquire only those DMA channels that are actually needed.
>
> [...]
>> +static int read_page_prepare(struct gpmi_nfc_data *this,
>> +			void *destination, unsigned length,
>> +			void *alt_virt, dma_addr_t alt_phys, unsigned alt_size,
>> +			void **use_virt, dma_addr_t *use_phys)
>> +{
>> +	struct device  *dev =3D this->dev;
>> +	dma_addr_t destination_phys =3D ~0;
>> +
>> +	if (virt_addr_valid(destination))
>> +		destination_phys =3D dma_map_single(dev, (void *)destination,
>>
> pointless cast.
>
> [...]
>> +static int mil_alloc_dma_buffer(struct gpmi_nfc_data *this)
>> +{
>> +	struct nfc_geometry *geo =3D&this->nfc_geometry;
>> +	struct device *dev =3D this->dev;
>> +	struct mil *mil =3D&this->mil;
>> +
>> +	/* [1] Allocate a command buffer. PAGE_SIZE is enough. */
>> +	mil->cmd_buffer =3D kzalloc(PAGE_SIZE, GFP_DMA);
>> +	if (mil->cmd_buffer =3D=3D NULL)
>> +		goto error_alloc;
>> +
>> +	/* [2] Allocate a read/write data buffer. PAGE_SIZE is enough. */
>> +	mil->data_buffer_dma =3D kzalloc(PAGE_SIZE, GFP_DMA);
>> +	if (mil->data_buffer_dma =3D=3D NULL)
>> +		goto error_alloc;
>> +
>> +	/*
>> +	 * [3] Allocate the page buffer.
>> +	 *
>> +	 * Both the payload buffer and the auxiliary buffer must appear on
>> +	 * 32-bit boundaries. We presume the size of the payload buffer is a
>> +	 * power of two and is much larger than four, which guarantees the
>> +	 * auxiliary buffer will appear on a 32-bit boundary.
>> +	 */
>> +	mil->page_buffer_size =3D geo->payload_size_in_bytes +
>> +				geo->auxiliary_size_in_bytes;
>> +
>> +	mil->page_buffer_virt =3D dma_alloc_coherent(dev, mil->page_buffer_s=
ize,
>> +					&mil->page_buffer_phys, GFP_DMA);
>> +	if (!mil->page_buffer_virt)
>> +		goto error_alloc;
>> +
>> +
>> +	/* Slice up the page buffer. */
>> +	mil->payload_virt =3D mil->page_buffer_virt;
>> +	mil->payload_phys =3D mil->page_buffer_phys;
>> +	mil->auxiliary_virt =3D ((char *) mil->payload_virt) +
>>
> unnecessary cast.
>
> [...]
>
> The functions from here thru gpmi_nfc_probe could be marked __devinit,
> so they can be discarded after boot.
>> +static int nand_boot_set_geometry(struct gpmi_nfc_data *this)
>> +{
>> +	struct boot_rom_geometry *geometry =3D&this->rom_geometry;
>> +
>> +	/*
>> +	 * Set the boot block stride size.
>> +	 *
>> +	 * In principle, we should be reading this from the OTP bits, since
>> +	 * that's where the ROM is going to get it. In fact, we don't have a=
ny
>> +	 * way to read the OTP bits, so we go with the default and hope for =
the
>> +	 * best.
>> +	 */
>> +	geometry->stride_size_in_pages =3D 64;
>> +
>> +	/*
>> +	 * Set the search area stride exponent.
>> +	 *
>> +	 * In principle, we should be reading this from the OTP bits, since
>> +	 * that's where the ROM is going to get it. In fact, we don't have a=
ny
>> +	 * way to read the OTP bits, so we go with the default and hope for =
the
>> +	 * best.
>> +	 */
>> +	geometry->search_area_stride_exponent =3D 2;
>> +
>> +	if (gpmi_debug&  GPMI_DEBUG_INIT)
>> +		log("stride size in page : %d, search areas : %d",
>> +			geometry->stride_size_in_pages,
>> +			geometry->search_area_stride_exponent);
>> +	return 0;
>> +}
>> +
>> +static const char  *fingerprint =3D "STMP";
>> +static int mx23_check_transcription_stamp(struct gpmi_nfc_data *this)
>> +{
>> +	struct boot_rom_geometry *rom_geo =3D&this->rom_geometry;
>> +	struct mil *mil =3D&this->mil;
>> +	struct mtd_info *mtd =3D&mil->mtd;
>> +	struct nand_chip *nand =3D&mil->nand;
>> +	unsigned int search_area_size_in_strides;
>> +	unsigned int stride;
>> +	unsigned int page;
>> +	loff_t byte;
>> +	uint8_t *buffer =3D nand->buffers->databuf;
>> +	int saved_chip_number;
>> +	int found_an_ncb_fingerprint =3D false;
>> +
>> +	/* Compute the number of strides in a search area. */
>> +	search_area_size_in_strides =3D 1<<  rom_geo->search_area_stride_exp=
onent;
>> +
>> +	/* Select chip 0. */
>> +	saved_chip_number =3D mil->current_chip;
>> +	nand->select_chip(mtd, 0);
>> +
>> +	/*
>> +	 * Loop through the first search area, looking for the NCB fingerpri=
nt.
>> +	 */
>> +	pr_info("Scanning for an NCB fingerprint...\n");
>> +
>> +	for (stride =3D 0; stride<  search_area_size_in_strides; stride++) {
>> +		/* Compute the page and byte addresses. */
>> +		page =3D stride * rom_geo->stride_size_in_pages;
>> +		byte =3D page   * mtd->writesize;
>> +
>> +		pr_info("  Looking for a fingerprint in page 0x%x\n", page);
>> +
>> +		/*
>> +		 * Read the NCB fingerprint. The fingerprint is four bytes long
>> +		 * and starts in the 12th byte of the page.
>> +		 */
>> +		nand->cmdfunc(mtd, NAND_CMD_READ0, 12, page);
>> +		nand->read_buf(mtd, buffer, strlen(fingerprint));
>> +
>> +		/* Look for the fingerprint. */
>> +		if (!memcmp(buffer, fingerprint, strlen(fingerprint))) {
>> +			found_an_ncb_fingerprint =3D true;
>> +			break;
>> +		}
>> +
>> +	}
>> +
>> +	/* Deselect chip 0. */
>> +	nand->select_chip(mtd, saved_chip_number);
>> +
>> +	if (found_an_ncb_fingerprint)
>> +		pr_info("  Found a fingerprint\n");
>> +	else
>> +		pr_info("  No fingerprint found\n");
>> +	return found_an_ncb_fingerprint;
>> +}
>> +
>> +/* Writes a transcription stamp. */
>> +static int mx23_write_transcription_stamp(struct gpmi_nfc_data *this)
>> +{
>> +	struct device *dev =3D this->dev;
>> +	struct boot_rom_geometry *rom_geo =3D&this->rom_geometry;
>> +	struct mil *mil =3D&this->mil;
>> +	struct mtd_info *mtd =3D&mil->mtd;
>> +	struct nand_chip *nand =3D&mil->nand;
>> +	unsigned int block_size_in_pages;
>> +	unsigned int search_area_size_in_strides;
>> +	unsigned int search_area_size_in_pages;
>> +	unsigned int search_area_size_in_blocks;
>> +	unsigned int block;
>> +	unsigned int stride;
>> +	unsigned int page;
>> +	loff_t       byte;
>> +	uint8_t      *buffer =3D nand->buffers->databuf;
>> +	int saved_chip_number;
>> +	int status;
>> +
>> +	/* Compute the search area geometry. */
>> +	block_size_in_pages =3D mtd->erasesize / mtd->writesize;
>> +	search_area_size_in_strides =3D 1<<  rom_geo->search_area_stride_exp=
onent;
>> +	search_area_size_in_pages =3D search_area_size_in_strides *
>> +					rom_geo->stride_size_in_pages;
>> +	search_area_size_in_blocks =3D
>> +		  (search_area_size_in_pages + (block_size_in_pages - 1)) /
>> +				    block_size_in_pages;
>> +
>> +	pr_info("-------------------------------------------\n");
>> +	pr_info("Search Area Geometry\n");
>> +	pr_info("-------------------------------------------\n");
>> +	pr_info("Search Area Size in Blocks : %u", search_area_size_in_block=
s);
>> +	pr_info("Search Area Size in Strides: %u", search_area_size_in_strid=
es);
>> +	pr_info("Search Area Size in Pages  : %u", search_area_size_in_pages=
);
>> +
>> +	/* Select chip 0. */
>> +	saved_chip_number =3D mil->current_chip;
>> +	nand->select_chip(mtd, 0);
>> +
>> +	/* Loop over blocks in the first search area, erasing them. */
>> +	pr_info("Erasing the search area...\n");
>> +
>> +	for (block =3D 0; block<  search_area_size_in_blocks; block++) {
>> +		/* Compute the page address. */
>> +		page =3D block * block_size_in_pages;
>> +
>> +		/* Erase this block. */
>> +		pr_info("  Erasing block 0x%x\n", block);
>> +		nand->cmdfunc(mtd, NAND_CMD_ERASE1, -1, page);
>> +		nand->cmdfunc(mtd, NAND_CMD_ERASE2, -1, -1);
>> +
>> +		/* Wait for the erase to finish. */
>> +		status =3D nand->waitfunc(mtd, nand);
>> +		if (status&  NAND_STATUS_FAIL)
>> +			dev_err(dev, "[%s] Erase failed.\n", __func__);
>> +	}
>> +
>> +	/* Write the NCB fingerprint into the page buffer. */
>> +	memset(buffer, ~0, mtd->writesize);
>> +	memset(nand->oob_poi, ~0, mtd->oobsize);
>> +	memcpy(buffer + 12, fingerprint, strlen(fingerprint));
>> +
>> +	/* Loop through the first search area, writing NCB fingerprints. */
>> +	pr_info("Writing NCB fingerprints...\n");
>> +	for (stride =3D 0; stride<  search_area_size_in_strides; stride++) {
>> +		/* Compute the page and byte addresses. */
>> +		page =3D stride * rom_geo->stride_size_in_pages;
>> +		byte =3D page   * mtd->writesize;
>> +
>> +		/* Write the first page of the current stride. */
>> +		pr_info("  Writing an NCB fingerprint in page 0x%x\n", page);
>> +		nand->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
>> +		nand->ecc.write_page_raw(mtd, nand, buffer);
>> +		nand->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
>> +
>> +		/* Wait for the write to finish. */
>> +		status =3D nand->waitfunc(mtd, nand);
>> +		if (status&  NAND_STATUS_FAIL)
>> +			dev_err(dev, "[%s] Write failed.\n", __func__);
>> +	}
>> +
>> +	/* Deselect chip 0. */
>> +	nand->select_chip(mtd, saved_chip_number);
>> +	return 0;
>> +}
>> +
>> +int mx23_boot_init(struct gpmi_nfc_data  *this)
>> +{
>> +	struct device *dev =3D this->dev;
>> +	struct mil *mil =3D&this->mil;
>> +	struct nand_chip *nand =3D&mil->nand;
>> +	struct mtd_info *mtd =3D&mil->mtd;
>> +	unsigned int block_count;
>> +	unsigned int block;
>> +	int     chip;
>> +	int     page;
>> +	loff_t  byte;
>> +	uint8_t block_mark;
>> +	int     error =3D 0;
>> +
>> +	/*
>> +	 * If control arrives here, we can't use block mark swapping, which
>> +	 * means we're forced to use transcription. First, scan for the
>> +	 * transcription stamp. If we find it, then we don't have to do
>> +	 * anything -- the block marks are already transcribed.
>> +	 */
>> +	if (mx23_check_transcription_stamp(this))
>> +		return 0;
>> +
>> +	/*
>> +	 * If control arrives here, we couldn't find a transcription stamp, =
so
>> +	 * so we presume the block marks are in the conventional location.
>> +	 */
>> +	pr_info("Transcribing bad block marks...\n");
>> +
>> +	/* Compute the number of blocks in the entire medium. */
>> +	block_count =3D nand->chipsize>>  nand->phys_erase_shift;
>> +
>> +	/*
>> +	 * Loop over all the blocks in the medium, transcribing block marks =
as
>> +	 * we go.
>> +	 */
>> +	for (block =3D 0; block<  block_count; block++) {
>> +		/*
>> +		 * Compute the chip, page and byte addresses for this block's
>> +		 * conventional mark.
>> +		 */
>> +		chip =3D block>>  (nand->chip_shift - nand->phys_erase_shift);
>> +		page =3D block<<  (nand->phys_erase_shift - nand->page_shift);
>> +		byte =3D block<<   nand->phys_erase_shift;
>> +
>> +		/* Select the chip. */
>> +		nand->select_chip(mtd, chip);
>> +
>> +		/* Send the command to read the conventional block mark. */
>> +		nand->cmdfunc(mtd, NAND_CMD_READ0, mtd->writesize, page);
>> +
>> +		/* Read the conventional block mark. */
>> +		block_mark =3D nand->read_byte(mtd);
>> +
>> +		/*
>> +		 * Check if the block is marked bad. If so, we need to mark it
>> +		 * again, but this time the result will be a mark in the
>> +		 * location where we transcribe block marks.
>> +		 *
>> +		 * Notice that we have to explicitly set the marking_a_bad_block
>> +		 * member before we call through the block_markbad function
>> +		 * pointer in the owning struct nand_chip. If we could call
>> +		 * though the block_markbad function pointer in the owning
>> +		 * struct mtd_info, which we have hooked, then this would be
>> +		 * taken care of for us. Unfortunately, we can't because that
>> +		 * higher-level code path will do things like consulting the
>> +		 * in-memory bad block table -- which doesn't even exist yet!
>> +		 * So, we have to call at a lower level and handle some details
>> +		 * ourselves.
>> +		 */
>> +		if (block_mark !=3D 0xff) {
>> +			pr_info("Transcribing mark in block %u\n", block);
>> +			mil->marking_a_bad_block =3D true;
>> +			error =3D nand->block_markbad(mtd, byte);
>> +			mil->marking_a_bad_block =3D false;
>> +			if (error)
>> +				dev_err(dev, "Failed to mark block bad with "
>> +							"error %d\n", error);
>> +		}
>> +
>> +		/* Deselect the chip. */
>> +		nand->select_chip(mtd, -1);
>> +	}
>> +
>> +	/* Write the stamp that indicates we've transcribed the block marks.=
 */
>> +	mx23_write_transcription_stamp(this);
>> +	return 0;
>> +}
>> +
>> +static int nand_boot_init(struct gpmi_nfc_data  *this)
>> +{
>> +	nand_boot_set_geometry(this);
>> +
>> +	/* This is ROM arch-specific initilization before the BBT scanning. =
*/
>> +	if (GPMI_IS_MX23(this))
>> +		return mx23_boot_init(this);
>> +	return 0;
>> +}
>> +
>> +static void show_nfc_geometry(struct nfc_geometry *geo)
>> +{
>> +	pr_info("---------------------------------------\n");
>> +	pr_info("	NFC Geometry (used by BCH)\n");
>> +	pr_info("---------------------------------------\n");
>> +	pr_info("ECC Algorithm          : %s\n", geo->ecc_algorithm);
>> +	pr_info("ECC Strength           : %u\n", geo->ecc_strength);
>> +	pr_info("Page Size in Bytes     : %u\n", geo->page_size_in_bytes);
>> +	pr_info("Metadata Size in Bytes : %u\n", geo->metadata_size_in_bytes=
);
>> +	pr_info("ECC Chunk Size in Bytes: %u\n", geo->ecc_chunk_size_in_byte=
s);
>> +	pr_info("ECC Chunk Count        : %u\n", geo->ecc_chunk_count);
>> +	pr_info("Payload Size in Bytes  : %u\n", geo->payload_size_in_bytes)=
;
>> +	pr_info("Auxiliary Size in Bytes: %u\n", geo->auxiliary_size_in_byte=
s);
>> +	pr_info("Auxiliary Status Offset: %u\n", geo->auxiliary_status_offse=
t);
>> +	pr_info("Block Mark Byte Offset : %u\n", geo->block_mark_byte_offset=
);
>> +	pr_info("Block Mark Bit Offset  : %u\n", geo->block_mark_bit_offset)=
;
>> +}
>> +
>> +static int mil_set_geometry(struct gpmi_nfc_data *this)
>> +{
>> +	struct nfc_hal *nfc =3D this->nfc;
>> +	struct nfc_geometry *geo =3D&this->nfc_geometry;
>> +	int error;
>> +
>> +	/* Free the temporary DMA memory for read ID case */
>> +	mil_free_dma_buffer(this);
>> +
>> +	/* Set up the NFC geometry which is used by BCH. */
>> +	error =3D nfc->set_geometry(this);
>> +	if (error !=3D 0) {
>> +		log("NFC set geometry error : %d", error);
>> +		return error;
>> +	}
>> +	if (gpmi_debug&  GPMI_DEBUG_INIT)
>> +		show_nfc_geometry(geo);
>> +
>> +	/* Alloc the new DMA buffers according to the pagesize and oobsize *=
/
>> +	return mil_alloc_dma_buffer(this);
>> +}
>> +
>> +static int mil_pre_bbt_scan(struct gpmi_nfc_data  *this)
>> +{
>> +	struct nand_chip *nand =3D&this->mil.nand;
>> +	struct mtd_info *mtd =3D&this->mil.mtd;
>> +	struct nand_ecclayout *layout =3D nand->ecc.layout;
>> +	struct nfc_hal *nfc =3D this->nfc;
>> +	int error;
>> +
>> +	/* fix the ECC layout before the scanning */
>> +	layout->eccbytes          =3D 0;
>> +	layout->oobavail          =3D mtd->oobsize;
>> +	layout->oobfree[0].offset =3D 0;
>> +	layout->oobfree[0].length =3D mtd->oobsize;
>> +
>> +	mtd->oobavail =3D nand->ecc.layout->oobavail;
>> +
>> +	/* Set up swap block-mark, must be set before the mil_set_geometry()=
 */
>> +	if (GPMI_IS_MX23(this))
>> +		this->swap_block_mark =3D false;
>> +	else
>> +		this->swap_block_mark =3D true;
>> +
>> +	/* Set up the medium geometry */
>> +	error =3D mil_set_geometry(this);
>> +	if (error)
>> +		return error;
>> +
>> +	/* extra init */
>> +	if (nfc->extra_init) {
>> +		error =3D nfc->extra_init(this);
>> +		if (error !=3D 0)
>> +			return error;
>> +	}
>> +
>> +	/* NAND boot init, depends on the mil_set_geometry(). */
>> +	return nand_boot_init(this);
>> +}
>> +
>> +static int mil_scan_bbt(struct mtd_info *mtd)
>> +{
>> +	struct nand_chip *nand =3D mtd->priv;
>> +	struct gpmi_nfc_data *this =3D nand->priv;
>> +	int error;
>> +
>> +	/* Prepare for the BBT scan. */
>> +	error =3D mil_pre_bbt_scan(this);
>> +	if (error)
>> +		return error;
>> +
>> +	/* use the default BBT implementation */
>> +	return nand_default_bbt(mtd);
>> +}
>> +
>> +static const char *cmd_parse =3D "cmdlinepart";
>>
> This should be a NULL terminated list of strings:
> static const char *cmd_parse[] =3D { "cmdlinepart", NULL };
>
thanks a lot.
>> +static int mil_partitions_init(struct gpmi_nfc_data *this)
>> +{
>> +	struct gpmi_nfc_platform_data *pdata =3D this->pdata;
>> +	struct mil *mil =3D&this->mil;
>> +	struct mtd_info *mtd =3D&mil->mtd;
>> +
>> +	/* use the command line for simple partitions layout */
>> +	mil->partition_count =3D parse_mtd_partitions(mtd,&cmd_parse,
>> +						&mil->partitions, 0);
>> +	if (mil->partition_count)
>> +		return add_mtd_partitions(mtd, mil->partitions,
>> +					mil->partition_count);
>> +
>> +	/* The complicated partitions layout uses this. */
>> +	if (pdata->partitions&&  pdata->partition_count>  0)
>> +		return add_mtd_partitions(mtd, pdata->partitions,
>> +					pdata->partition_count);
>> +	return 0;
> How about:
> 	return mtd_add_device(mtd);
> so you will get the whole flash registered in case there are no
> partitions defined.
>
no problem.
>> +#ifdef CONFIG_PM
>> +static int gpmi_nfc_suspend(struct platform_device *pdev, pm_message_=
t state)
>> +{
>> +	return 0;
>> +}
>> +static int gpmi_nfc_resume(struct platform_device *pdev)
>> +{
>> +	return 0;
>> +}
>> +#else
>> +#define gpmi_nfc_suspend NULL
>> +#define gpmi_nfc_resume  NULL
>> +#endif
>> +
> There is no point in adding empty suspend/resume functions.
> Furthermore you should use dev_pm_ops.
>
Ok.  I think the gpmi needs to do nothing when suspend.


Best Regards
Huang shijie
> Lothar Wa=C3=9Fmann
