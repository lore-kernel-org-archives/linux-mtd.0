Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 477A6C282CB
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:24:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E6A02175B
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:24:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ncxIP46e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="aDSjSRUC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E6A02175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:References:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f0CFJC20IELVzbmZPAf2JOWyNNphXJwXIR9bSyRyEi0=; b=ncxIP46ebzUBqr
	xd9Ek0rpzZwO6zzMAs76ANK30n/1C/PwIIZEBQCQiD8g7DKN/XcSE/Y+lY6BU6P3GuEPNMhIK0rQN
	UW5TBGRhHKvtUNb6V2Y+pdbLkrrYIcV1tp0QNJxyo7TAlWDOYCajN764WB2iDJHsaXC2coohnOnP/
	Aiuc/SNUT964du9yrAsWACTeIf9S0P1RVvLy4gplSd0g1E/sciQ3Ep+NGzEdpD+8w93xlOdHC9aRd
	b9uZmLnhmVSy0B4S7XDcqRbF9F7go5OWAU0veej3bfPaxY6hMfwPqgh9Rvx6MUlhbECABI8HyHCHn
	HNveft/s4nmke67BK2UA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqiuj-0000BJ-Il; Mon, 04 Feb 2019 18:24:13 +0000
Received: from [183.79.56.145] (helo=nh502.bullet.mail.kks.yahoo.co.jp)
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqiue-0000Ax-KU
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:24:11 +0000
Received: from [183.79.100.139] by nh502.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 04 Feb 2019 18:24:07 -0000
Received: from [183.79.101.122] by t502.bullet.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:24:07 -0000
Received: from [127.0.0.1] by omp509.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:24:07 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 57677.8476.bm@omp509.mail.kks.yahoo.co.jp
Received: (qmail 74705 invoked by alias); 4 Feb 2019 18:24:06 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304646; bh=7gS2IKMSQ+cLqNeoXyMq8ak6ylCbpSXbIET4ReDrU5c=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:Thread-Index:Content-Language;
 b=aDSjSRUCC7dXnqYTSAofvNHXIiKgq8T7hhlmce69zPPz72Y/DyGC/GWSVD9bo9fHx5D8m1LLbcAykgfX6Y4bJWIFYSJFS3TtniY51qaopHZKR07NYEdSVHu70oYM9lgRlKEqnNkfnD7VSChaR+OV3rjj4FHNjuLJ23zaQMlTBso=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:Thread-Index:Content-Language;
 b=mzwHewfvRkDqHyV81WPTE7CupNWLVMk8pAHXwn0pqG6L1sdKIx2Z/3cjJvha7r+WpYojJZwKKefJxGZBOuxX6t13t18uUGg3k6eLLjiUh2iiJ1FKdmv9K7OPSS4VET+UlXNqZaujdSECo8t/UsuMpPjWMdmDooDkq8uRgQghvoI=
 ; 
Received: from unknown (HELO ikegamiPC) (106.72.39.32 with login)
 by smtp5005.mail.kks.ynwp.yahoo.co.jp with SMTP; 4 Feb 2019 18:24:06 -0000
X-YMail-JAS: M8QAJ9oVM1k42SuLbyzC6rkAO_Zltc9QV0EmgWIhZD9w8Ae0W9HvdcSVkI0XpB3mekuksBlCnizAXHQ8SVvmV.2gR5AxHmuxvhP7gkkL59srGquCobGVNjRSld93Ptn4w4.I9oDrPw--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: ggJxO_8VM1k45TPmQ36RVQooov6ahiwujjEjNaGZFrw7V2F
 d_Y.BsWetCvDtRB8Jiq2D3xTu6NLY6z_3KWM56t4ACCeXgXWOcm8CcUi2b80
 .rqP7ZIZJaSdJ2.WYsv4U_RuxHSn5gx5tlrXJOPnZW9cx2bm1CcAFzEAObXy
 Z3pGpPRFsUCjQd1vKU70qveY0qhWZzwj2L8xv06xNCcFOv_6CkSdcfOH1AEj
 9d78x9MCFKUfPgsJgmtY0mqy.IM5hSro1jI9k4wb0V3pGISov2CPZLwgOE3g
 TnNaqo63Z4lv1r0VqTSudogwx.d1XU7_hsiHzTbICxW2Yivvjg5Re1qYTTCc
 1xuFdEkfkr3bASLWEYs.gvBc.zdXy_90iGZRmS7VIoqs_hpqcmIAkRNx5Rt5
 8oUtb_NBollO5CqCn3L44D5vXsKMsmkYtZCSoZoLYQsHXTl.qDudvmcb7fFm
 qXipA3N2MaHiHAjvYDeGIJi.RC_ZcN9cmWv7SwArliXfAg8IpB9oloxkf0cb
 lg9zcjydcr7kFbGgNexnyiec90b7tcHHGQJPk3DJGQKQKgMUUoven6jfmNGM
 R3fj4mm6SLbAjMdtSEMK6MfB5eUjMNftXavfFhbb4hDAXxt3E
From: "Tokunori Ikegami" <ikegami_to@yahoo.co.jp>
To: "'Boris Brezillon'" <bbrezillon@kernel.org>
References: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
 <20190204182004.29894-2-ikegami_to@yahoo.co.jp>
In-Reply-To: <20190204182004.29894-2-ikegami_to@yahoo.co.jp>
Subject: RE: [RESEND v4 01/11] mtd: cfi_cmdset_0002: Use chip_good() to retry
 in do_write_oneword()
Date: Tue, 5 Feb 2019 03:24:04 +0900
Message-ID: <002601d4bcb6$cf5aa140$6e0fe3c0$@yahoo.co.jp>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQDjxbIBRBIZFh9gHHguOm1vXT/OEwJPV3jZp59mtXA=
Content-Language: ja
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_102408_946431_F7F41C26 
X-CRM114-Status: GOOD (  26.60  )
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
Cc: 'Joakim Tjernlund' <Joakim.Tjernlund@infinera.com>,
 'Chris Packham' <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org,
 'Felix Fietkau' <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Very sorry for many times resending the patch mails.
Since I could not send the mails correctly with the incorrect mail address.
Still I can not send correctly the mail to stable@vger.kernel.org so I will
investigate this later.

Regards,
Ikegami

> -----Original Message-----
> From: Tokunori Ikegami [mailto:ikegami_to@yahoo.co.jp]
> Sent: Tuesday, February 5, 2019 3:20 AM
> To: Boris Brezillon
> Cc: Tokunori Ikegami; Felix Fietkau; Chris Packham; Joakim Tjernlund;
> linux-mtd@lists.infradead.org; stable@vger.kernel.org
> Subject: [RESEND v4 01/11] mtd: cfi_cmdset_0002: Use chip_good() to retry
> in do_write_oneword()
> 
> As reported by the OpenWRT team, write requests sometimes fail on some
> platforms.
> Currently to check the state chip_ready() is used correctly as described
> by
> the flash memory S29GL256P11TFI01 datasheet.
> Also chip_good() is used to check if the write is succeeded and it was
> implemented by the commit fb4a90bfcd6d8 ("[MTD] CFI-0002 - Improve error
> checking").
> But actually the write failure is caused on some platforms and also it can
> be fixed by using chip_good() to check the state and retry instead.
> Also it seems that it is caused after repeated about 1,000 times to retry
> the write one word with the reset command.
> By using chip_good() to check the state to be done it can be reduced the
> retry with reset.
> It is depended on the actual flash chip behavior so the root cause is
> unknown.
> 
> Signed-off-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> Co-Developed-by: Hauke Mehrtens <hauke@hauke-m.de>
> Co-Developed-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
> Reported-by: Fabio Bettoni <fbettoni@gmail.com>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: stable@vger.kernel.org
> ---
> Changes since v3:
> - Update the commit message for the comments.
> - Drop the addition of blanks lines around xip_enable().
> - Delete unnecessary setting the ret variable to -EIO.
> - Change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.
> 
> Changes since v2:
> - Just update the commit message for the comment.
> 
> Changes since v1:
> - Just update the commit message.
> 
> Background:
> This is required for OpenWrt Project to result the flash write issue as
> below patche.
> <https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=ddc11c3
> 932c7b7b7df7d5fbd48f207e77619eaa7>
> 
> Also the original patch in OpenWRT is below.
> <https://github.com/openwrt/openwrt/blob/v18.06.0/target/linux/ar71xx/
> patches-4.9/403-mtd_fix_cfi_cmdset_0002_status_check.patch>
> 
> The reason to use chip_good() is that just actually fix the issue.
> And also in the past I had fixed the erase function also as same way by
> the
> patch below.
>   <https://patchwork.ozlabs.org/patch/922656/>
>     Note: The reason for the patch for erase is same.
> 
> In my understanding the chip_ready() is just checked the value twice from
> flash.
> So I think that sometimes incorrect value is read twice and it is depended
> on the flash device behavior but not sure..
> 
> So change to use chip_good() instead of chip_ready().
> 
>  drivers/mtd/chips/cfi_cmdset_0002.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>  mode change 100644 => 100755 drivers/mtd/chips/cfi_cmdset_0002.c
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
> b/drivers/mtd/chips/cfi_cmdset_0002.c
> old mode 100644
> new mode 100755
> index 72428b6..91a491b
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1627,29 +1627,31 @@ static int __xipram do_write_oneword(struct
> map_info *map, struct flchip *chip,
>  			continue;
>  		}
> 
> -		if (time_after(jiffies, timeo) && !chip_ready(map, adr)){
> +		if (chip_good(map, adr, datum))
> +			break;
> +
> +		if (time_after(jiffies, timeo)){
>  			xip_enable(map, chip, adr);
>  			printk(KERN_WARNING "MTD %s(): software
> timeout\n", __func__);
>  			xip_disable(map, chip, adr);
> +			ret = -EIO;
>  			break;
>  		}
> 
> -		if (chip_ready(map, adr))
> -			break;
> -
>  		/* Latency issues. Drop the lock, wait a while and retry
> */
>  		UDELAY(map, chip, adr, 1);
>  	}
> +
>  	/* Did we succeed? */
> -	if (!chip_good(map, adr, datum)) {
> +	if (ret) {
>  		/* reset on all failures. */
>  		map_write(map, CMD(0xF0), chip->start);
>  		/* FIXME - should have reset delay before continuing */
> 
> -		if (++retry_cnt <= MAX_RETRIES)
> +		if (++retry_cnt <= MAX_RETRIES) {
> +			ret = 0;
>  			goto retry;
> -
> -		ret = -EIO;
> +		}
>  	}
>  	xip_enable(map, chip, adr);
>   op_done:
> --
> 2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
