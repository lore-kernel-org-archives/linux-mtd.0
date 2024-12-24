Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F457E77188
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 21:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eLUuuteI6bqYG491AIxUxi6jWRUQbI96lvEugNVKNlI=; b=uk1aREB4l16ItD
	mLRHXJSra7VpOHMe0Jhs5XiF4VfXVa8VhI2eM4Su21oBbbssxsXdjUiTHdheOCMgaoiyiU8rzmfIv
	iSoxP/RzDU2G0HmmdMdO2bp/Bj4NXEcyxI9zp+nTbGH6SKAwyoDvCadOK52G+O4gBYPKvaY00SMGh
	1amezNmiDNYPTpySC8WKRURqxglJdCv833UzOcTkr8sTosAgIbuK9AGqoWNIPXLiwbiEGG8mGtCCb
	FBKVy5dm9MHErUzdL/ey0rwY/a8iJ5bkwEYQTLIW/X1ChRT4UnfhNok7Mmr1OyMIcMjxcNraYYJvf
	hiQy6vStczLGDdcpHSBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQCFo-0000000Copy-3BPe;
	Tue, 24 Dec 2024 21:15:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQCFl-0000000CopZ-4ACQ
	for linux-mtd@lists.infradead.org;
	Tue, 24 Dec 2024 21:15:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7997D5C5884;
	Tue, 24 Dec 2024 21:15:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30584C4CED0;
	Tue, 24 Dec 2024 21:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735074943;
	bh=otEm/sQQI7MvhJtdufloWfFnlLm1ipydgV32P0xgwBs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dmo4R0GWYzF/7uBiKklalmIBTgzhaFlbl2kmGDHZxx07xmh57ADsxEHIJAghg8Pcr
	 cr9pjUQogfzdLRjAbC0tMjeG1TJyDbvXIBcOf0YjJZm40A9bGhj9NAwbOvTCn+H4Ps
	 oQ7leC+KLwio3ZlHt0i/rJg2M7zfNsAuIzXkrUbsRRlw9xgxjQ+ZmTPdN1FPG6wqWD
	 7pqDiiOuq8N69kiYw+m4lUi/c9UccMVoaI5vS6UPpt7izFOeG1oaDSKvmfyeaG2x6G
	 HAIcF0hHqhuTKwp2HFfOS75WNWzTJDrufShG/VcdOTzTiD+bUiYrnN1OjdvN0nZnrL
	 MdmyYm9bekAJQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: winbond: Add support for w25q01jv
In-Reply-To: <20241224-winbond-6-12-rc1-nor-volatile-bit-v1-1-f7c4dff66182@bootlin.com>
	(Miquel Raynal's message of "Tue, 24 Dec 2024 17:47:41 +0100")
References: <20241224-winbond-6-12-rc1-nor-volatile-bit-v1-0-f7c4dff66182@bootlin.com>
	<20241224-winbond-6-12-rc1-nor-volatile-bit-v1-1-f7c4dff66182@bootlin.com>
Date: Tue, 24 Dec 2024 21:15:41 +0000
Message-ID: <mafs0zfkk7pfm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_131546_136657_21617823 
X-CRM114-Status: GOOD (  58.05  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Dec 24 2024, Miquel Raynal wrote:

> Add support for Winbond w25q01jv spi-nor chip.
>
> This chip is internally made of two dies with linear addressing
> capabilities to make it transparent to the user that two dies were
> used. There is one drawback however, the read status operation is racy
> as the status bit only gives the active die status and not the status of
> the other die. For commands affecting the two dies, it means if another
> command is sent too fast after the first die has returned a valid status
> (deviation can be up to 200us), the chip will get corrupted/in an
> unstable state.
>
> This chip hence requires a better status register read. There are three
> solutions here:
> - Either we wait about 200us after getting a first status ready
> feedback, to cover possible internal deviations.
> - Or we always check all internal dies (which takes about 30us per die).
>
> This second option being always faster and also being totally safe, we
> implement a specific hook for the status register read. flash_speed

Makes sense.

> benchmarks show no difference with this implementation, compared to the
> regular status read core function, the difference being part of the
> natural deviation with this benchmark:
>
> 	> Without the fixup
> 	$ flash_speed /dev/mtd0 -c100 -d
> 	eraseblock write speed is 442 KiB/s
> 	eraseblock read speed is 1606 KiB/s
> 	page write speed is 439 KiB/s
> 	page read speed is 1520 KiB/s
> 	2 page write speed is 441 KiB/s
> 	2 page read speed is 1562 KiB/s
> 	erase speed is 68 KiB/s
>
> 	> With the fixup
> 	$ flash_speed /dev/mtd0 -c100 -d
> 	eraseblock write speed is 428 KiB/s
> 	eraseblock read speed is 1626 KiB/s
> 	page write speed is 426 KiB/s
> 	page read speed is 1538 KiB/s
> 	2 page write speed is 426 KiB/s
> 	2 page read speed is 1574 KiB/s
> 	erase speed is 66 KiB/s
>
> As there are very few situations where this can actually happen, a
> status register write being the most likely one, another possibility
> might have been to use volatile writes instead of non-volatile writes,
> as most of the deviation comes from the action of writing the bit. But
> this would overlook other possible actions where both dies can be used
> at the same time like a chip erase (or any erase over the die boundary
> in general). This last approach would have the least impact but because
> it does not feel like it is totally safe to use and because the impact
> of the second solution presented above is also negligible, we keep this
> second approach for now (which can be further tuned later if it appears
> to be too impacting in the end).

I am a bit confused by this paragraph. What do you mean by "this" in the
first sentence? What do status register writes have to do with the ready
bit being racy? I would assume those would be nearly instant since
status registers are usually volatile. What do volatile writes mean in
this context?
>
> However, the fixup, whatever which one we pick, must be applied on
> multi-die chips, which hence must be properly flagged. The SFDP tables
> implemented give a lot of information but the die details are part of an
> optional table that is not implemented, hence we use a post parsing
> fixup hook to set the params->n_dice value manually.
>
> Link: https://www.winbond.com/resource-files/W25Q01JV%20SPI%20RevE%2003042024%20Plus.pdf
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>
> Here is the basic test procedure output:
>
> $ cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
> w25q01jv
> $ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
> ef4021
> $ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
> winbond
> $ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 53464450060101ff00060110800000ff84000102d00000ff03000102f000
> 00ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffe520fbffffffff3f44eb086b083b42bbfeffffffffff
> 0000ffff40eb0c200f5210d800003602a60082ea14e2e96376337a757a75
> f7a2d55c19f74dffe970f9a5ffffffffffffffffffffffffffffffffff0a
> f0ff21ffdcff
> $ md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> a7b9dbf76e99a33db99e557b6676588a  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> $ dd if=/dev/urandom of=./qspi_test bs=1M count=1
> 1+0 records in
> 1+0 records out
> $ mtd_debug write /dev/mtd0 0 1048576 qspi_test
> Copied 1048576 bytes from qspi_test to address 0x00000000 in flash
> $ mtd_debug erase /dev/mtd0 0 1048576
> Erased 1048576 bytes from address 0x00000000 in flash
> $ mtd_debug read /dev/mtd0 0 1048576 qspi_read
> Copied 1048576 bytes from address 0x00000000 in flash to qspi_read
> $ hexdump qspi_read
> 0000000 ffff ffff ffff ffff ffff ffff ffff ffff
> *
> 0100000
> $ mtd_debug write /dev/mtd0 0 1048576 qspi_test
> Copied 1048576 bytes from qspi_test to address 0x00000000 in flash
> $ mtd_debug read /dev/mtd0 0 1048576 qspi_read
> Copied 1048576 bytes from address 0x00000000 in flash to qspi_read
> $ sha1sum qspi_test qspi_read
> becf3097c0bbff0dd6f204ffe5bf575e6c43f792  qspi_test
> becf3097c0bbff0dd6f204ffe5bf575e6c43f792  qspi_read
> ---
>  drivers/mtd/spi-nor/winbond.c | 82 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index 8d0a00d69e1233988876a15479d73c5fe899c542..4691e7a27ba1d70c75932c4e6b60fe36102138be 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -10,6 +10,7 @@
>  
>  #define WINBOND_NOR_OP_RDEAR	0xc8	/* Read Extended Address Register */
>  #define WINBOND_NOR_OP_WREAR	0xc5	/* Write Extended Address Register */
> +#define WINBOND_NOR_OP_SELDIE	0xc2	/* Select active die */
>  
>  #define WINBOND_NOR_WREAR_OP(buf)					\
>  	SPI_MEM_OP(SPI_MEM_OP_CMD(WINBOND_NOR_OP_WREAR, 0),		\
> @@ -17,6 +18,12 @@
>  		   SPI_MEM_OP_NO_DUMMY,					\
>  		   SPI_MEM_OP_DATA_OUT(1, buf, 0))
>  
> +#define WINBOND_NOR_SELDIE_OP(buf)					\
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(WINBOND_NOR_OP_SELDIE, 0),		\
> +		   SPI_MEM_OP_NO_ADDR,					\
> +		   SPI_MEM_OP_NO_DUMMY,					\
> +		   SPI_MEM_OP_DATA_OUT(1, buf, 0))
> +
>  static int
>  w25q128_post_bfpt_fixups(struct spi_nor *nor,
>  			 const struct sfdp_parameter_header *bfpt_header,
> @@ -66,6 +73,26 @@ static const struct spi_nor_fixups w25q256_fixups = {
>  	.post_bfpt = w25q256_post_bfpt_fixups,
>  };
>  
> +static int
> +w25q0xjv_post_bfpt_fixups(struct spi_nor *nor,
> +			  const struct sfdp_parameter_header *bfpt_header,
> +			  const struct sfdp_bfpt *bfpt)
> +{
> +	/*
> +	 * SFDP supports dice numbers, but this information is only available in
> +	 * optional additional tables which are not provided by these chips.
> +	 * Dice number has an impact though, because these devices need extra
> +	 * care when reading the busy bit.
> +	 */
> +	nor->params->n_dice = nor->params->size / SZ_64M;

n_dice is set by spi_nor_parse_sccr_mc(), which runs _after_ post-BFPT
fixups. This doesn't matter in practice since you say that the chip
doesn't have a SCCR_MC table but I think it still is a good idea to
follow the initialization order and do this in the post-SFDP hook.

> +
> +	return 0;
> +}
> +
> +static const struct spi_nor_fixups w25q0xjv_fixups = {
> +	.post_bfpt = w25q0xjv_post_bfpt_fixups,
> +};
> +
>  static const struct flash_info winbond_nor_parts[] = {
>  	{
>  		.id = SNOR_ID(0xef, 0x30, 0x10),
> @@ -146,6 +173,11 @@ static const struct flash_info winbond_nor_parts[] = {
>  		.name = "w25q512jvq",
>  		.size = SZ_64M,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> +	}, {
> +		.id = SNOR_ID(0xef, 0x40, 0x21),
> +		.name = "w25q01jv",

We no longer set the name for new flash entries. But knowing the flash
name for an entry is still useful, so make this a comment on top of the
entry.

> +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,

Since the flash has an SFDP table, you probably don't need these flags.
Can you try removing this line and see if things still work fine?

> +		.fixups = &w25q0xjv_fixups,
>  	}, {
>  		.id = SNOR_ID(0xef, 0x50, 0x12),
>  		.name = "w25q20bw",
> @@ -289,6 +321,37 @@ static int winbond_nor_write_ear(struct spi_nor *nor, u8 ear)
>  	return ret;
>  }
>  
> +/**
> + * winbond_nor_select_die() - Set active die.
> + * @nor:	pointer to 'struct spi_nor'.
> + * @die:	die to set active.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int winbond_nor_select_die(struct spi_nor *nor, u8 die)
> +{
> +	int ret;
> +
> +	nor->bouncebuf[0] = die;
> +
> +	if (nor->spimem) {
> +		struct spi_mem_op op = WINBOND_NOR_SELDIE_OP(nor->bouncebuf);
> +
> +		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
> +		ret = spi_mem_exec_op(nor->spimem, &op);
> +	} else {
> +		ret = spi_nor_controller_ops_write_reg(nor,
> +						       WINBOND_NOR_OP_SELDIE,
> +						       nor->bouncebuf, 1);
> +	}
> +
> +	if (ret)
> +		dev_dbg(nor->dev, "error %d selecting die %d\n", ret, die);
> +
> +	return ret;
> +}
> +
>  /**
>   * winbond_nor_set_4byte_addr_mode() - Set 4-byte address mode for Winbond
>   * flashes.
> @@ -322,6 +385,22 @@ static int winbond_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
>  	return spi_nor_write_disable(nor);
>  }
>  

Adding a short comment about why this is needed would be nice, and
readers won't always have to do a git blame to find out.

> +static int winbond_multi_die_ready(struct spi_nor *nor)
> +{
> +	int ret, i;
> +
> +	for (i = 0; i < nor->params->n_dice; i++) {
> +		ret = winbond_nor_select_die(nor, i);
> +		if (ret)
> +			return ret;
> +
> +		if (!spi_nor_sr_ready(nor))

spi_nor_sr_ready() can also return -errno, which would be treated here
as being ready, which obviously isn't right. This should also check for
a return value < 0.

> +			return 0;
> +	}
> +
> +	return 1;
> +}
> +
>  static const struct spi_nor_otp_ops winbond_nor_otp_ops = {
>  	.read = spi_nor_otp_read_secr,
>  	.write = spi_nor_otp_write_secr,
> @@ -334,6 +413,9 @@ static int winbond_nor_late_init(struct spi_nor *nor)
>  {
>  	struct spi_nor_flash_parameter *params = nor->params;
>  
> +	if (params->n_dice > 1)
> +		params->ready = winbond_multi_die_ready;
> +

Is this true for all multi-die Winbond flashes, and going to hold true
for future ones? If not, I suppose this should go in the flash-specific
fixup hook. Do it in either the flash-specific late_init hook, or in the
post_sfdp hook, I have no strong opinions.

>  	if (params->otp.org)
>  		params->otp.ops = &winbond_nor_otp_ops;

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
