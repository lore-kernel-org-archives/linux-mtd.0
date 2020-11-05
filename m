Return-Path: <SRS0=L3KX=EL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C88E7C4741F
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2020 15:58:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 425062087D
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2020 15:58:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iQZ4mLGg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="S93VqGNi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 425062087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eNvtuC7q5bPtspIDHWj/rR9sXwawOjuGMxK32NLFCQs=; b=iQZ4mLGglYvLlnnC2AuCqK7he
	7GSDVgckZDbtUqADu85VgBm8Qxs0bphveZR9MhAciDfe1vYd7wk5MZE/3zDzBjEi+xXMpwLuH0eXH
	zCkf9OrZ2lKXfEE5txBUTVMXHXE84wvfbvDHfcRvEr/M6P59mgkQEsw0bTjCSLm8ElMLAj6MGPa95
	67cO0jARaQBbKYf7aZEp2fjti3/Xdcy/UxPRy0fRtDx+G33vvOzFa6y3wRhewH42ns6BEbTkF3N0j
	sc1IXEp+xPt3Yr5aqXpCCwzd480AKdquJhG1aDrdO6QRkNTHCdMTHdwghD1fIzFV4Ygsa8okXD0s4
	QnZAff0Qg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaheD-0000lT-GU; Thu, 05 Nov 2020 15:58:01 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaheB-0000kk-Cw
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2020 15:58:00 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5FvtNs030602;
 Thu, 5 Nov 2020 09:57:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604591875;
 bh=cRyNJqFzegPh24HdCscOHLjKNMorB21SUKPbtr+eBTU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=S93VqGNiaXIS5IvvEUoiwSZIhkSUCmjkFHhJo/TVSiUfKWOIAbkWM1DtmpEQdsjDv
 ZFEOzywux+NfNp9A0xR7/MueyLV7vWAu1HgqMS/Ame0zi/DFvefbsbtBbs7NZHvAoR
 QbtJy4RyrLnxFhUZ/9SNPeo6ZEKP2d2iXz+WXjMk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5Fvt3O093280
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 5 Nov 2020 09:57:55 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 09:57:55 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 09:57:55 -0600
Received: from [10.250.233.179] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5FvrOL014669;
 Thu, 5 Nov 2020 09:57:54 -0600
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: Use status register where possible
To: Joakim Tjernlund <joakim.tjernlund@infinera.com>, "linux-mtd @ lists .
 infradead . org" <linux-mtd@lists.infradead.org>
References: <20201022154506.17639-1-joakim.tjernlund@infinera.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <256798c1-e7b6-4bfb-bdc7-b143cb2f0502@ti.com>
Date: Thu, 5 Nov 2020 21:27:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201022154506.17639-1-joakim.tjernlund@infinera.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_105759_568934_94589FCE 
X-CRM114-Status: GOOD (  20.57  )
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
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Joakim,

On 10/22/20 9:15 PM, Joakim Tjernlund wrote:
> Commit "mtd: cfi_cmdset_0002: Add support for polling status register"

Standard way to refer to a commit is:

Commit 4844ef80305d ("mtd: cfi_cmdset_0002: Add support for polling status register")

> added support for polling the status rather than using DQ polling.
> However, status register is used only when DQ polling is missing.
> Lets use status register when available as it is superior to DQ polling.
> 
> Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index a1f3e1031c3d..ee9b322e63bb 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -117,7 +117,7 @@ static struct mtd_chip_driver cfi_amdstd_chipdrv = {
>  static int cfi_use_status_reg(struct cfi_private *cfi)
>  {
>  	struct cfi_pri_amdstd *extp = cfi->cmdset_priv;
> -	u8 poll_mask = CFI_POLL_STATUS_REG | CFI_POLL_DQ;
> +	u8 poll_mask = CFI_POLL_STATUS_REG;

This local variable now looks pointless and can be dropped.. So,

>  	return extp->MinorVersion >= '5' &&
>  		(extp->SoftwareFeatures & poll_mask) == CFI_POLL_STATUS_REG;
> 

	return extp->MinorVersion >= '5' &&
  			(extp->SoftwareFeatures & CFI_POLL_STATUS_REG);

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
