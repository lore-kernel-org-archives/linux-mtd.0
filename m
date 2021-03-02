Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5366C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 21:29:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 433A6600EF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 21:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 433A6600EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SVS2q5IjWnx2U+iQC1JMfpdQSqpDjwqfppL448RRfmY=; b=ExM+YyC+rxzG6OqeTiThCpSnn
	kuG9fTB/FVgtVbv9nt1KCSYZHxgWOz4Bww9Ldkc3NDo4ffaj1V8l5sGgMRJ7DL5dud3U5x1etFw9u
	/asZq7EInqIBpuor7j/Qm7EyM3rjsqR3PeFDPo+C+RD4+u6kj1vMG00Sj3Uva6x16DMiHFMCBva49
	QqlBhkAQD7MsqwRU43mMH8zekXCW+ypSkWpOb/oWOpuXI4JDRxgq21rMux79R9Jw4Lq7ZYRZxqWiY
	9gzxZemH7Sg208H4J95cLVLDPX+m+1uePL3C6lgH4bIP84OuRCAXOohwRxlRVEWb59N4u61rXiGc8
	tK7uUvZKg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHZ2K-006b8Y-BC; Wed, 03 Mar 2021 21:28:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT8O-005Jn1-Pp
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:09:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=XY9GrYoBtIXthyWuNY6TPQxiQEz+xHQrzqPT/wtKqbw=; b=OCPac4+3Rj2IUhmaKjKlh7DmB8
 oiQNEeHauJeTUJHZzGowLiNuOfaBqWNPUQkX2kiOgUGw9zzOMe2KfGPU2JB3cuXfjlfiOTFpQ6KT6
 IzDLg7IXpVbe1zQQ9Qa3qgVcCAOWL1HlnuK0IOnBc2Q9I8FsSD0C0aGprztraeRRFjPK9mfTDDchY
 0mmyplaEYT5HcdEIBrOCXyxdqOeFrGbHySUX3eIJDxXlAT5BWVxw7WGvbgvlzVakPm0wM2E97a4Dl
 brpzeKXe30izlaVr9EqZjgtVGGc4u7Q54CaYXc8IyHtBK4gP14vSIoPzH1TMlCcjPBNGTMliK3EhQ
 rHzFx6NA==;
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH6z4-00HLro-7X
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 15:30:53 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 122FUAeU117081;
 Tue, 2 Mar 2021 09:30:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1614699010;
 bh=XY9GrYoBtIXthyWuNY6TPQxiQEz+xHQrzqPT/wtKqbw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=UokPXdDqLwE75ptLZwzXmbE+AmnhfCwm9SbRtcDFaVm8ZC/1vf+b5WX5Oky8/XjnA
 UdRFNDHgxfCWgjpuyDvN0pWcVCfq7t4Aevh6IT00/0kgXzRkj46ZYb5+M9lJbkFKBo
 xIfhoBxflve5g0d4mNJ5eap+agBsNJNe+su5ZJlw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 122FUAoN065541
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 2 Mar 2021 09:30:10 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 2 Mar
 2021 09:30:09 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 2 Mar 2021 09:30:09 -0600
Received: from [10.250.234.120] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 122FU6QY102733;
 Tue, 2 Mar 2021 09:30:07 -0600
Subject: Re: [RFC PATCH] mtd: add OTP (one-time-programmable) erase ioctl
To: Michael Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-api@vger.kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, <Tudor.Ambarus@microchip.com>
References: <20210302110927.6520-1-michael@walle.cc>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <b106264e-987f-cecc-28cb-0724d4af1f4c@ti.com>
Date: Tue, 2 Mar 2021 21:00:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210302110927.6520-1-michael@walle.cc>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_153053_365111_0BB2F0E4 
X-CRM114-Status: GOOD (  27.55  )
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

Hi,

On 3/2/21 4:39 PM, Michael Walle wrote:
> This may sound like a contradiction but some SPI-NOR flashes really
> support erasing their OTP region until it is finally locked. Having the
> possibility to erase an OTP region might come in handy during
> development.
> 
> The ioctl argument follows the OTPLOCK style.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> OTP support for SPI-NOR flashes may be merged soon:
> https://lore.kernel.org/linux-mtd/20210216162807.13509-1-michael@walle.cc/
> 
> Tudor suggested to add support for the OTP erase operation most SPI-NOR
> flashes have:
> https://lore.kernel.org/linux-mtd/d4f74b1b-fa1b-97ec-858c-d807fe1f9e57@microchip.com/
> 
> Therefore, this is an RFC to get some feedback on the MTD side, once this
> is finished, I can post a patch for mtd-utils. Then we'll have a foundation
> to add the support to SPI-NOR.
> 
>  drivers/mtd/mtdchar.c      |  7 ++++++-
>  drivers/mtd/mtdcore.c      | 12 ++++++++++++
>  include/linux/mtd/mtd.h    |  3 +++
>  include/uapi/mtd/mtd-abi.h |  2 ++
>  4 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index 323035d4f2d0..da423dd031ae 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -661,6 +661,7 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
>  	case OTPGETREGIONCOUNT:
>  	case OTPGETREGIONINFO:
>  	case OTPLOCK:
> +	case OTPERASE:

This is not a Safe IOCTL. We are destroying OTP data. Need to check for
write permission before allowing the ioctl right?

>  	case ECCGETLAYOUT:
>  	case ECCGETSTATS:
>  	case MTDFILEMODE:
> @@ -938,6 +939,7 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
>  	}
>  
>  	case OTPLOCK:
> +	case OTPERASE:
>  	{
>  		struct otp_info oinfo;
>  
> @@ -945,7 +947,10 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
>  			return -EINVAL;
>  		if (copy_from_user(&oinfo, argp, sizeof(oinfo)))
>  			return -EFAULT;
> -		ret = mtd_lock_user_prot_reg(mtd, oinfo.start, oinfo.length);
> +		if (cmd == OTPLOCK)
> +			ret = mtd_lock_user_prot_reg(mtd, oinfo.start, oinfo.length);
> +		else
> +			ret = mtd_erase_user_prot_reg(mtd, oinfo.start, oinfo.length);
>  		break;
>  	}
>  
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 2d6423d89a17..d844d718ef77 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -1918,6 +1918,18 @@ int mtd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t len)
>  }
>  EXPORT_SYMBOL_GPL(mtd_lock_user_prot_reg);
>  
> +int mtd_erase_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t len)
> +{
> +	struct mtd_info *master = mtd_get_master(mtd);
> +
> +	if (!master->_erase_user_prot_reg)
> +		return -EOPNOTSUPP;
> +	if (!len)
> +		return 0;
> +	return master->_erase_user_prot_reg(master, from, len);
> +}
> +EXPORT_SYMBOL_GPL(mtd_erase_user_prot_reg);
> +
>  /* Chip-supported device locking */
>  int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  {
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 157357ec1441..734ad7a8c353 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -336,6 +336,8 @@ struct mtd_info {
>  				     size_t len, size_t *retlen, u_char *buf);
>  	int (*_lock_user_prot_reg) (struct mtd_info *mtd, loff_t from,
>  				    size_t len);
> +	int (*_erase_user_prot_reg) (struct mtd_info *mtd, loff_t from,
> +				     size_t len);
>  	int (*_writev) (struct mtd_info *mtd, const struct kvec *vecs,
>  			unsigned long count, loff_t to, size_t *retlen);
>  	void (*_sync) (struct mtd_info *mtd);
> @@ -517,6 +519,7 @@ int mtd_read_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t len,
>  int mtd_write_user_prot_reg(struct mtd_info *mtd, loff_t to, size_t len,
>  			    size_t *retlen, u_char *buf);
>  int mtd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t len);
> +int mtd_erase_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t len);
>  
>  int mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
>  	       unsigned long count, loff_t to, size_t *retlen);
> diff --git a/include/uapi/mtd/mtd-abi.h b/include/uapi/mtd/mtd-abi.h
> index 65b9db936557..242015f60d10 100644
> --- a/include/uapi/mtd/mtd-abi.h
> +++ b/include/uapi/mtd/mtd-abi.h
> @@ -205,6 +205,8 @@ struct otp_info {
>   * without OOB, e.g., NOR flash.
>   */
>  #define MEMWRITE		_IOWR('M', 24, struct mtd_write_req)
> +/* Erase a given range of user data (must be in mode %MTD_FILE_MODE_OTP_USER) */
> +#define OTPERASE		_IOR('M', 25, struct otp_info)
>  

Hmm, shouldn't this be:

#define OTPERASE		_IOW('M', 25, struct otp_info)

Userspace is writing struct otp_info to the driver. OTPLOCK should
probably be _IOW() as well.

>  /*
>   * Obsolete legacy interface. Keep it in order not to break userspace
> 

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
