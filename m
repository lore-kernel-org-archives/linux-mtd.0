Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3330C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 07:31:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6961960E53
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 07:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6961960E53
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arri.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b/3L0wxQdsFx+pteuXUtQtZu43Hxu6+LKv2ObdyrvNk=; b=WesLhFiylZkiek
	NbC7On0VCrkm0kLeq2Y+Nz/z7YAeExhWf347Ah4mQlm9MxSJt3pRnhCuvG1ef62u7jIpv1RtaX/9d
	v6xaxjETtQr2QK+YOAjABXtdfqZiDaubTFRKp/+iHTwS5m16JGmDmeouAtXIItCY2le3mAcyd6xQ3
	dqq4HBgB6srmYi1L37OL1EHo62IQJpHQGgNPHG8xRco35s608WP2m0/5kTJa/gJGeBnU8pUfK+kcy
	aVeVSKkaikb/4XbE+xTyPi5ZUjZbMvZdKLLCWYMW4lAePHDCJPbvlDRf1hqzjn6UtXek8ynTQdQYm
	4hKmwADq2BtEoR+0hqww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maYi2-00FMgT-3u; Wed, 13 Oct 2021 07:29:54 +0000
Received: from mailout08.rmx.de ([94.199.90.85])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maXK0-00F3xv-9l
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 06:01:02 +0000
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mailout08.rmx.de (Postfix) with ESMTPS id 4HThjB0vqlzMlLm;
 Wed, 13 Oct 2021 08:00:46 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by kdin02.retarus.com (Postfix) with ESMTPS id 4HThhq4V6Yz2TTK0;
 Wed, 13 Oct 2021 08:00:27 +0200 (CEST)
Received: from n95hx1g2.localnet (192.168.54.63) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 13 Oct
 2021 08:00:27 +0200
From: Christian Eggers <ceggers@arri.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Michael Nazzareno Trimarchi
 <michael@amarulasolutions.com>, Greg Ungerer <gerg@kernel.org>, Stefan
 Riedmueller <s.riedmueller@phytec.de>
CC: Stefan Riedmueller <s.riedmueller@phytec.de>, Sascha Hauer
 <s.hauer@pengutronix.de>, Han Xu <han.xu@nxp.com>, Christian Hemp
 <C.Hemp@phytec.de>, Boris Brezillon <bbrezillon@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [RFC PATCH 1/2] mtd: rawnand: gpmi: Remove explicit default gpmi
 clock setting for i.MX6
Date: Wed, 13 Oct 2021 08:00:26 +0200
Message-ID: <4352240.LvFx2qVVIh@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <20211012090224.4101984-1-s.riedmueller@phytec.de>
References: <20211011084607.27a840e0@xps13>
 <20211012090224.4101984-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.63]
X-RMX-ID: 20211013-080027-ClsNTNPyJrmT-0@out02.hq
X-RMX-SOURCE: 217.111.95.66
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_230100_573793_9000811C 
X-CRM114-Status: GOOD (  18.29  )
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

On Tuesday, 12 October 2021, 11:02:23 CEST, Stefan Riedmueller wrote:
> There is no need to explicitly set the default gpmi clock rate during
> boot for the i.MX 6 since this is done during nand_detect anyway.
> 
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> index 4d08e4ab5c1b..a1f7000f033e 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -1034,15 +1034,6 @@ static int gpmi_get_clks(struct gpmi_nand_data *this)
>  		r->clock[i] = clk;
>  	}
>  
> -	if (GPMI_IS_MX6(this))
> -		/*
> -		 * Set the default value for the gpmi clock.
> -		 *
> -		 * If you want to use the ONFI nand which is in the
> -		 * Synchronous Mode, you should change the clock as you need.
> -		 */
> -		clk_set_rate(r->clock[0], 22000000);
> -
>  	return 0;
>  
>  err_clock:
> 

Tested-by: Christian Eggers <ceggers@arri.de>  # on i.MX6ULL with MT29F4G08ABADAH4
Cc: stable@vger.kernel.org




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
