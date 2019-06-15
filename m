Return-Path: <SRS0=lAOP=UO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09FBC31E52
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Jun 2019 13:38:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9941421773
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Jun 2019 13:38:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A/b/uRCH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dCa2Y4I9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9941421773
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8OAro8gT/JAx9wlJpNSLV2z4H6ckewrT+U6W2T0kmlY=; b=A/b/uRCHDwP9Ou
	6gzDxHNRHWdNL8HkC7vO2Cb2DBnzc31RPUEYsjX+R7NgbPH+cXk7G26osNeogiN3md/UdfGk/DIje
	QxvflvnPkYF0wUSipvZNabteDi9XIKObeAe0Xo5FytDKwkvUGcUGS6WiPw8K4onWmn4/lx/hxtaEz
	TjKOsC3D3P27dhETj+jeH5SVe1IA+li/Rb71iRUNqzJEzekdMMUr45blMETVvh808kTolmM6Q26bz
	jzc7IWgrKnsx9C8VJ6i9dc3kXhgWOkvEAoao4LqsNVg7VWz5j9IszgEyA88xEQ2x0ucuxCASqByVC
	AJSH69H9GG1rX/uYl01g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hc8tC-0005rW-3v; Sat, 15 Jun 2019 13:38:38 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hc8t6-0005qz-6n
 for linux-mtd@lists.infradead.org; Sat, 15 Jun 2019 13:38:34 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5FDcIfo025942;
 Sat, 15 Jun 2019 08:38:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1560605898;
 bh=jG30qgGpq/bk2ABZUC+ssLvWf4/8PdOBz3ejL1zU8Fo=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=dCa2Y4I964IewnU84FGjRSh2iJCi/xJxkk22jm1ymvnuGRlrJlGo1OoOexHTas/0h
 3kOuKR1JcKUjNvJCiKY0cWDOkmwuBnlkG2kgKPAh7zvAH1S0FW9ZDlu76bBtECEbAh
 EJ25gjOEDd0FXlmzyhs3krybI9oAG/h6e6OxfxVY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5FDcI9D110452
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 15 Jun 2019 08:38:18 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sat, 15
 Jun 2019 08:38:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Sat, 15 Jun 2019 08:38:18 -0500
Received: from [10.250.133.146] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5FDcFWO048302;
 Sat, 15 Jun 2019 08:38:16 -0500
Subject: Re: [PATCH v6 01/11] mtd: cfi_cmdset_0002: Use chip_good() to retry
 in do_write_oneword()
To: Tokunori Ikegami <ikegami.t@gmail.com>
References: <20190526153904.28871-1-ikegami.t@gmail.com>
 <20190526153904.28871-2-ikegami.t@gmail.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <60d3389a-2e56-5993-b115-e74f4c6d7f67@ti.com>
Date: Sat, 15 Jun 2019 19:08:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190526153904.28871-2-ikegami.t@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190615_063832_356920_7B2C8274 
X-CRM114-Status: GOOD (  30.15  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 26-May-19 9:08 PM, Tokunori Ikegami wrote:
> As reported by the OpenWRT team, write requests sometimes fail on some
> platforms.
> Currently to check the state chip_ready() is used correctly as described by
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
> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> Co-Developed-by: Hauke Mehrtens <hauke@hauke-m.de>

I need sign of all co-developers before applying the patch.
Please run ./scripts/checkpatch.pl --strict on all patches and address
all the issues.

Regards
Vignesh

> Co-Developed-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
> Reported-by: Fabio Bettoni <fbettoni@gmail.com>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: stable@vger.kernel.org
> ---
> Changes since v5:
> - Rebased on top of Liu Jian's fixes in master.
> - Change to follow Liu Jian's fixes in master for the write buffer.
> - Change the email address of Tokunori Ikegami to ikegami.t@gmail.com.
> 
> Changes since v4:
> - None.
> 
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
> <https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=ddc11c3932c7b7b7df7d5fbd48f207e77619eaa7>
> 
> Also the original patch in OpenWRT is below.
> <https://github.com/openwrt/openwrt/blob/v18.06.0/target/linux/ar71xx/patches-4.9/403-mtd_fix_cfi_cmdset_0002_status_check.patch>
> 
> The reason to use chip_good() is that just actually fix the issue.
> And also in the past I had fixed the erase function also as same way by the
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
>  drivers/mtd/chips/cfi_cmdset_0002.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>  mode change 100644 => 100755 drivers/mtd/chips/cfi_cmdset_0002.c
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> old mode 100644
> new mode 100755
> index c8fa5906bdf9..348b54820e4c
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1628,29 +1628,35 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
>  			continue;
>  		}
>  
> -		if (time_after(jiffies, timeo) && !chip_ready(map, adr)){
> +		/*
> +		 * We check "time_after" and "!chip_good" before checking "chip_good" to avoid
> +		 * the failure due to scheduling.
> +		 */
> +		if (time_after(jiffies, timeo) && !chip_good(map, adr, datum)){
>  			xip_enable(map, chip, adr);
>  			printk(KERN_WARNING "MTD %s(): software timeout\n", __func__);
>  			xip_disable(map, chip, adr);
> +			ret = -EIO;
>  			break;
>  		}
>  
> -		if (chip_ready(map, adr))
> +		if (chip_good(map, adr, datum))
>  			break;
>  
>  		/* Latency issues. Drop the lock, wait a while and retry */
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
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
