Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8298C43381
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 05:27:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 789E320840
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 05:27:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eOYiJP1+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PSznTq/b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 789E320840
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gEQaFxyqQH9DdoflzP9yxiZkmzxFs/hZot549j4BoZc=; b=eOYiJP1+Te3Cdn
	HXmdPVh15acDgPZQE5k1HWJEgDGQ2mgdcI2NtFXRpIWEGnHbvTDNX6rivMJ/eCH0RlxWQYCAQL86t
	6CrC2XIjjhwr79+v4AYGVR+SCPtLtZY4gBBqaeIsdZwgSJ8FlJE1fL4ESG6XMZ6VX7iLGfIBEBljR
	7cXeubV8F3saph/jcOwJJN+HLUyuyX2iAGBEGjKBoB4LEwu2nf75JPHnyTiNN8P5pWmgWwPWaqRdd
	rNBUQZV0C1au/PGydCU+1AAMy5x71bkfg7b+1bqljrYgTr3nA1v+wliOVleRu0Neh+/hgtPBUK2FP
	N1oqHTxo5NIoEn3VR6hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBBx0-0003NL-24; Tue, 02 Apr 2019 05:27:10 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBBww-0003Mr-22
 for linux-mtd@lists.infradead.org; Tue, 02 Apr 2019 05:27:08 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x325R2B5013762;
 Tue, 2 Apr 2019 00:27:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1554182822;
 bh=/2foyPYOtR5panzk2mFpGwdD6144oKEnfquiIulQ21s=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=PSznTq/bF7hlTpV5X5VWcWSIMIQw/wQA9NjzDMs5O36bzYJXiaOt/K0kHa3mtjYXW
 IzRWNgDpxjCSfI5Ap2esN+RL/+BD3Lyn17GHMaBFO4h8p+G7MYcFd+oEd5FXhMqpSW
 eFU2rO0fgTXO+C2BPkLEGyUN5jx9kSd76iNYLU6Y=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x325R2ex043612
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 2 Apr 2019 00:27:02 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 2 Apr
 2019 00:27:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 2 Apr 2019 00:27:02 -0500
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x325R0SM024625;
 Tue, 2 Apr 2019 00:27:01 -0500
Subject: Re: [PATCH v4 3/3] spi-nor: allow setting the BPNV (default locked)
 bit
To: Jonas Bonn <jonas@norrbonn.se>, <linux-mtd@lists.infradead.org>
References: <20190320071605.4289-1-jonas@norrbonn.se>
 <20190320071605.4289-4-jonas@norrbonn.se>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <b42b6d1d-4b7e-dca9-6cb8-02bbcc47c092@ti.com>
Date: Tue, 2 Apr 2019 10:57:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190320071605.4289-4-jonas@norrbonn.se>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_222706_229290_C6D6244B 
X-CRM114-Status: GOOD (  33.62  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: tudor.ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 20/03/19 12:46 PM, Jonas Bonn wrote:
> Setting the BPNV bit defaults the block protection bits BP0-2 to 1 at
> reset.  This means that all the flash sectors are protected until they
> are explicity unlocked by the user.
> 

s/explicity/explicitly

> Together with protection of the status register via the SRWD bit and the
> WP# signal, this allows a flash device to be effectively protected from
> erasure by unauthorized actors.
> 
> The patch has been tested with a Cypress s25fl512s and works as
> advertised.  The concern that I have with this, though, is that the BPNV
> bit is "write once":  if somebody inadvertently sets this feature on the
> device, it is irrevocable!  Whether or not this actually belongs in the
> mainline kernel is therefore up for debate...
>

I am fine with this in general as setting BPNV is OTP but wont
necessarily brick the flash. More comments below:

> Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
> ---
>  drivers/mtd/mtdchar.c         |   6 ++
>  drivers/mtd/mtdcore.c         |   8 +++
>  drivers/mtd/spi-nor/spi-nor.c | 103 +++++++++++++++++++++++-----------
>  include/linux/mtd/mtd.h       |   2 +
>  include/linux/mtd/spi-nor.h   |   1 +
>  include/uapi/mtd/mtd-abi.h    |   1 +
>  6 files changed, 88 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index 02389528f622..72842308087b 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -800,6 +800,12 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
>  		break;
>  	}
>  
> +	case MEMSETDEFAULTLOCKED:
> +	{
> +		ret = mtd_set_default_locked(mtd);
> +		break;
> +	}
> +
>  	case MEMLOCK:
>  	{
>  		struct erase_info_user einfo;
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 76b4264936ff..811fe0f3c24a 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -1681,6 +1681,14 @@ int mtd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t len)
>  }
>  EXPORT_SYMBOL_GPL(mtd_lock_user_prot_reg);
>  
> +int mtd_set_default_locked(struct mtd_info *mtd)
> +{
> +	if (!mtd->_set_default_locked)
> +		return -EOPNOTSUPP;
> +	return mtd->_set_default_locked(mtd);
> +}
> +EXPORT_SYMBOL_GPL(mtd_set_default_locked);
> +
>  /* Chip-supported device locking */
>  int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  {
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 9abac9e326a1..8a30cdac6f88 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -250,7 +250,8 @@ struct flash_info {
>  	u16		page_size;
>  	u16		addr_width;
>  
> -	u16		flags;
> +	u16		__unused16;

Why is this needed?

> +	u32		flags;
>  #define SECT_4K			BIT(0)	/* SPINOR_OP_BE_4K works uniformly */
>  #define SPI_NOR_NO_ERASE	BIT(1)	/* No erase command needed */
>  #define SST_WRITE		BIT(2)	/* use SST byte programming */
> @@ -279,6 +280,10 @@ struct flash_info {
>  #define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
>  #define USE_CLSR		BIT(14)	/* use CLSR command */
>  #define SPI_NOR_OCTAL_READ	BIT(15)	/* Flash supports Octal Read */
> +#define SPI_NOR_HAS_BPNV	BIT(16) /* Block protection bits can be set
> +					 * non-volatile, meaning all blocks
> +					 * are protected by default at reset
> +					 */
>  

Setting BPNV actually makes the BP bits _volatile_ and therefore are
reset to 1 on power up. Above comment and commit log should reflect the
same.

>  	/* Part specific fixup hooks. */
>  	const struct spi_nor_fixups *fixups;
> @@ -1324,6 +1329,36 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  	return write_sr_and_check(nor, status_new, mask);
>  }
>  
> +/*
> + * Write status Register and configuration register with 2 bytes
> + * The first byte will be written to the status register, while the
> + * second byte will be written to the configuration register.
> + * Return negative if error occurred.
> + */
> +static int write_sr_cr(struct spi_nor *nor, u8 *sr_cr)
> +{
> +	int ret;
> +
> +	write_enable(nor);
> +
> +	ret = nor->write_reg(nor, SPINOR_OP_WRSR, sr_cr, 2);
> +	if (ret < 0) {
> +		dev_err(nor->dev,
> +			"error while writing configuration register\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = spi_nor_wait_till_ready(nor);
> +	if (ret) {
> +		dev_err(nor->dev,
> +			"timeout while writing configuration register\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +

Is there a real need to move this function over here? This messes up
looking at history using git blame. Please do not move the code around
unless needed

>  /*
>   * Check if a region of the flash is (completely) locked. See stm_lock() for
>   * more info.
> @@ -1342,6 +1377,35 @@ static int stm_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  	return stm_is_locked_sr(nor, ofs, len, status);
>  }
>  
> +static int spi_nor_set_default_locked(struct mtd_info *mtd)
> +{
> +	struct spi_nor *nor = mtd_to_spi_nor(mtd);
> +	struct device *dev = nor->dev;
> +	u8 sr_cr[2];
> +	int ret;
> +
> +	ret = read_cr(nor);
> +	if (ret < 0) {
> +		dev_err(dev, "error while reading configuration register\n");
> +		return -EINVAL;
> +	}
> +
> +	if (ret & CR_BPNV)
> +		return 0;
> +
> +	sr_cr[1] = ret | CR_BPNV;
> +
> +	/* Keep the current value of the Status Register. */
> +	ret = read_sr(nor);
> +	if (ret < 0) {
> +		dev_err(dev, "error while reading status register\n");
> +		return -EINVAL;
> +	}
> +	sr_cr[0] = ret;
> +
> +	return write_sr_cr(nor, sr_cr);
> +}
> +
>  static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  {
>  	struct spi_nor *nor = mtd_to_spi_nor(mtd);
> @@ -1387,35 +1451,6 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  	return ret;
>  }
>  
> -/*
> - * Write status Register and configuration register with 2 bytes
> - * The first byte will be written to the status register, while the
> - * second byte will be written to the configuration register.
> - * Return negative if error occurred.
> - */
> -static int write_sr_cr(struct spi_nor *nor, u8 *sr_cr)
> -{
> -	int ret;
> -
> -	write_enable(nor);
> -
> -	ret = nor->write_reg(nor, SPINOR_OP_WRSR, sr_cr, 2);
> -	if (ret < 0) {
> -		dev_err(nor->dev,
> -			"error while writing configuration register\n");
> -		return -EINVAL;
> -	}
> -
> -	ret = spi_nor_wait_till_ready(nor);
> -	if (ret) {
> -		dev_err(nor->dev,
> -			"timeout while writing configuration register\n");
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
>  /**
>   * macronix_quad_enable() - set QE bit in Status Register.
>   * @nor:	pointer to a 'struct spi_nor'
> @@ -1898,9 +1933,7 @@ static const struct flash_info spi_nor_ids[] = {
>  			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>  	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
>  	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> -	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
> -			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> -			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | USE_CLSR) },
> +	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_HAS_BPNV | USE_CLSR) },

Please limit to 80 char as before. That is the preferred style going forward

>  	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>  	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
>  	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
> @@ -4082,6 +4115,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>  		mtd->_is_locked = spi_nor_is_locked;
>  	}
>  
> +	if (info->flags & SPI_NOR_HAS_BPNV) {
> +		mtd->_set_default_locked = spi_nor_set_default_locked;
> +	}
> +
>  	/* sst nor chips use AAI word program */
>  	if (info->flags & SST_WRITE)
>  		mtd->_write = sst_write;
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 677768b21a1d..30ee6f1c1142 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -313,6 +313,7 @@ struct mtd_info {
>  	int (*_writev) (struct mtd_info *mtd, const struct kvec *vecs,
>  			unsigned long count, loff_t to, size_t *retlen);
>  	void (*_sync) (struct mtd_info *mtd);
> +	int (*_set_default_locked) (struct mtd_info *mtd);
>  	int (*_lock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
>  	int (*_unlock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
>  	int (*_is_locked) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
> @@ -451,6 +452,7 @@ static inline void mtd_sync(struct mtd_info *mtd)
>  int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
>  int mtd_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
>  int mtd_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len);
> +int mtd_set_default_locked(struct mtd_info *mtd);
>  int mtd_block_isreserved(struct mtd_info *mtd, loff_t ofs);
>  int mtd_block_isbad(struct mtd_info *mtd, loff_t ofs);
>  int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs);
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index b3d360b0ee3d..40d575a1431f 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -144,6 +144,7 @@
>  #define FSR_PT_ERR		BIT(1)	/* Protection error bit */
>  
>  /* Configuration Register bits. */
> +#define CR_BPNV			BIT(3)	/* Block protection non-volatile */
>  #define CR_QUAD_EN_SPAN		BIT(1)	/* Spansion Quad I/O */
>  
>  /* Status Register 2 bits. */
> diff --git a/include/uapi/mtd/mtd-abi.h b/include/uapi/mtd/mtd-abi.h
> index aff5b5e59845..27b752796efa 100644
> --- a/include/uapi/mtd/mtd-abi.h
> +++ b/include/uapi/mtd/mtd-abi.h
> @@ -204,6 +204,7 @@ struct otp_info {
>   * without OOB, e.g., NOR flash.
>   */
>  #define MEMWRITE		_IOWR('M', 24, struct mtd_write_req)
> +#define MEMSETDEFAULTLOCKED	_IO('M', 25)
>  

There should be a comment to warn users that above ioctl might end up
setting a OTP bit as this is not clear from the name of the macro.

There is MTD_POWERUP_LOCK flag to indicate flash device is locked after
reset. To be consistent, above ioctl would need to be named
MEMSETPOWERUPLOCKED.


Also, spi-nor framework should detect the state of BPNV on powerup and
set MTD_POWERUP_LOCK in mtd->flags accordingly to honor ABI here[1]:


What:		/sys/class/mtd/mtdX/flags
Date:		April 2009
KernelVersion:	2.6.29
Contact:	linux-mtd@lists.infradead.org
Description:
		A hexadecimal value representing the device flags, ORed
		together:

		0x0400: MTD_WRITEABLE - device is writable
		0x0800: MTD_BIT_WRITEABLE - single bits can be flipped
		0x1000: MTD_NO_ERASE - no erase necessary
		0x2000: MTD_POWERUP_LOCK - always locked after reset

[1]https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-class-mtd



-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
