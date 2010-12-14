Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PSXMx-0003XO-JY
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2010 16:04:52 +0000
Subject: Re: [PATCH] mtd: add NOR flash write buffer size reporting for
	UBI/UBIFS
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <1291667217-13097-1-git-send-email-agust@denx.de>
References: <1291667217-13097-1-git-send-email-agust@denx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 14 Dec 2010 18:01:40 +0200
Message-ID: <1292342500.2538.65.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, thank you for the patch, but I have few requests.

On Mon, 2010-12-06 at 21:26 +0100, Anatolij Gustschin wrote:
> Add "write_buffer_size" field to struct mtd_info. This field
> will be used to set minimal I/O unit size (min_io_size) for UBI
> on NOR flash. In case of NOR flash minimal I/O size must be equal
> to the maximal size of the write buffer used by embedded flash
> programming algorithm.
> 
> Flash programming from prepared write buffer performed in one
> programming operation could be interrupted by a power cut or
> a system reset causing corrupted (partially written) areas in
> a flash sector. Knowing the size of potentially corrupted areas
> UBIFS scanning and recovery algorithms are able to perform
> successful recovery.
> 
> Signed-off-by: Anatolij Gustschin <agust@denx.de>
> ---
>  drivers/mtd/chips/cfi_cmdset_0001.c |    1 +
>  drivers/mtd/chips/cfi_cmdset_0002.c |    4 ++++
>  drivers/mtd/chips/cfi_cmdset_0020.c |    1 +
>  drivers/mtd/mtdconcat.c             |    1 +
>  drivers/mtd/mtdpart.c               |    1 +
>  drivers/mtd/ubi/build.c             |    5 ++++-
>  include/linux/mtd/mtd.h             |   12 ++++++++++++
>  7 files changed, 24 insertions(+), 1 deletions(-)

Could you please keep MTD and UBI changes in separate patches?

>  	/*
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index fe8d77e..cb902d1 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -144,6 +144,18 @@ struct mtd_info {
>  	 */
>  	uint32_t writesize;
>  
> +	/*
> +	 * Sets minimal I/O unit size (min_io_size) for UBI on NOR flash.
> +	 * In case of NOR flash minimal I/O size must be equal to the size
> +	 * of the write buffer used by internal flash programming algorithm.
> +	 * This requirement results from the fact that the flash programming
> +	 * operation could be interrupted by a power cut or a system reset
> +	 * causing corrupted (partially written) areas in a flash sector.
> +	 * Knowing the size of potentially corrupted areas UBIFS scanning
> +	 * and recovery algorithms are able to perform successful recovery.
> +	 */
> +	uint32_t write_buffer_size;

Err, no, please, add comment like that to UBI, because it MTD subsystem
is wrong place to discuss UBIFS issues.

But here, instead, explain what is this and how is it different to
writesize.

Also, what write_buffer_size is in case of NAND? I think it should be
equivalent to mtd->writesize.

If we think in terms of general MTD device model:

1. mtd->writesize is the minimal amount of bytes you can write at a
time.

2. but the MTD device can have a "write-buffer", which means it can
write multiple mtd->writesize chunks at a time. And the size of this
buffer has to be "mtd->write_buffer_size" bytes.

So if you write 4 * mtd->writesize bytes, and mtd->write_buffer_size is
2*mtd->writesize, then MTD driver can (but does not have to) do 2
mtd->writesize write operations, not 4.

So I expect a comment like that instead.

To conclude, can you please:

0. Submit an mtd.h patch which just adds the field and nice comment.
1. Submit a NOR-specific patch.
2. Submit a NAND-specific patch - just do mtd->write_buffer_size =
mtd->writesuze in 'nand_scan_tail()'.
3. Submit a OneNAND-specific patch - do the same in 'onenand_scan()'.
4. Submit a patch for mtdpart and mtdconcat.
5. Submit an UBI patch

Yes, it is more job for you, but I hope I'll not scary you off with this
request :-) Thanks!

N.B. And actually, looking at other fields in mtd_info (e.g.,
numeraseregions) makes me think that it is better to name the new field
"writebufsize" instead. This would be more consistent and shorter.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
