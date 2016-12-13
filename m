Received: from 11.mo4.mail-out.ovh.net ([46.105.34.195])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGpzB-0007Ot-7A
 for linux-mtd@lists.infradead.org; Tue, 13 Dec 2016 16:31:26 +0000
Received: from player750.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 5109D236AB
 for <linux-mtd@lists.infradead.org>; Tue, 13 Dec 2016 17:30:49 +0100 (CET)
Subject: Re: [PATCH v9] mtd: spi-nor: Add support for S3AN spi-nor devices
To: Marek Vasut <marek.vasut@gmail.com>,
 Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20161202113144.17970-1-ricardo.ribalda@gmail.com>
 <edf9ac78-6431-0f51-3151-3f1195263d9a@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <5ad3cedd-35c3-42c5-010c-dc8311905abc@wedev4u.fr>
Date: Tue, 13 Dec 2016 17:30:40 +0100
MIME-Version: 1.0
In-Reply-To: <edf9ac78-6431-0f51-3151-3f1195263d9a@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 13/12/2016 à 08:53, Marek Vasut a écrit :
> On 12/02/2016 12:31 PM, Ricardo Ribalda Delgado wrote:
>> Xilinx Spartan-3AN FPGAs contain an In-System Flash where they keep
>> their configuration data and (optionally) some user data.
>>
>> The protocol of this flash follows most of the spi-nor standard. With
>> the following differences:
>>
>> - Page size might not be a power of two.
>> - The address calculation (default addressing mode).
>> - The spi nor commands used.
>>
>> Protocol is described on Xilinx User Guide UG333
>>
>> Reviewed-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
>> Cc: Brian Norris <computersforpeace@gmail.com>
>> Cc: Marek Vasut <marek.vasut@gmail.com>
> 
> [...]
> 
>> +static int s3an_nor_scan(const struct flash_info *info, struct spi_nor *nor)
>> +{
>> +	int ret;
>> +	u8 val;
>> +
>> +	ret = nor->read_reg(nor, SPINOR_OP_XRDSR, &val, 1);
>> +	if (ret < 0) {
>> +		dev_err(nor->dev, "error %d reading XRDSR\n", (int) ret);
>> +		return ret;
>> +	}
>> +
>> +	nor->erase_opcode = SPINOR_OP_XSE;
>> +	nor->program_opcode = SPINOR_OP_XPP;
>> +	nor->read_opcode = SPINOR_OP_READ;
>> +	nor->flags |= SNOR_F_NO_OP_CHIP_ERASE ;
> 
> NIT: You have an extra space before ;        ^
> 
>> +
>> +	/*
>> +	 * This flashes have a page size of 264 or 528 bytes (known as
>> +	 * Default addressing mode). It can be changed to a more standard
>> +	 * Power of two mode where the page size is 256/512. This comes
>> +	 * with a price: there is 3% less of space, the data is corrupted
>> +	 * and the page size cannot be changed back to default addressing
>> +	 * mode.
>> +	 *
>> +	 * The current addressing mode can be read from the XRDSR register
>> +	 * and should not be changed, because is a destructive operation.
>> +	 */
>> +	if (val & XSR_PAGESIZE) {
>> +		/* Flash in Power of 2 mode */
>> +		nor->page_size = (nor->page_size == 264) ? 256 : 512;
>> +		nor->mtd.writebufsize = nor->page_size;
>> +		nor->mtd.size = 8 * nor->page_size * info->n_sectors;
>> +		nor->mtd.erasesize = 8 * nor->page_size;
>> +	} else {
>> +		/* Flash in Default addressing mode */
>> +		nor->flags |= SNOR_F_S3AN_ADDR_DEFAULT;
>> +	}
>> +
>> +	return 0;
>> +}
> 
> Looks great otherwise:
> Reviewed-by: Marek Vasut <marek.vasut@gmail.com>
> 
Applied to git://github.com/spi-nor/linux.git

I've removed the additional SPACE before ';' as reported by Marek.

Thanks!
