Return-Path: <SRS0=N2Dg=QU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 113C9C282C2
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 10:39:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D75EA2190A
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 10:39:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AIUmqGUf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D75EA2190A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f5T/0cz1w5cgqWHdCDNLn4BRjaokXFiDS4ehZjfk80Q=; b=AIUmqGUfFXeb9D
	kJrtoTmjxrF9BdLaRyH0EY66ilxLvKzrytBm3Heh5NpNDxkvamOXnHR5KzAy9LsO3u5WjQI9dtGAN
	QBmb24nZ2jDO3jpi+SdyWoetRFJiwnc+4QssH4IAi53dOUBBrpvpo2RpDnETN6zr+ThTHdK5xCHVg
	XCDK5IE3jwVskRVyqi34x7WOfax1lM2K+skfcbOwsPcHG4UUHwDyS9rrX3EYVIlsVUtSViyialURK
	vdkdzLvkTKlVtDodleKyb82GQ+wpDmKFWl18o6UsQcL5YYQx2r/ZasiROe9autCglUzNK7WhQba23
	bx40pkSD7xu9inFURnMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtrwv-0003Oe-KH; Wed, 13 Feb 2019 10:39:29 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtrwm-00033U-6w; Wed, 13 Feb 2019 10:39:22 +0000
X-Originating-IP: 90.53.137.203
Received: from localhost (alyon-652-1-306-203.w90-53.abo.wanadoo.fr
 [90.53.137.203])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id EBE6A24000F;
 Wed, 13 Feb 2019 10:39:06 +0000 (UTC)
Date: Wed, 13 Feb 2019 11:39:05 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH 07/11] mtd: rawnand: atmel: add sam9x60 nand controller
 support
Message-ID: <20190213103905.GH10129@piout.net>
References: <20190213085930.31578-1-tudor.ambarus@microchip.com>
 <20190213085930.31578-8-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190213085930.31578-8-tudor.ambarus@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_023920_412194_97D27B84 
X-CRM114-Status: UNSURE (   6.84  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, bbrezillon@kernel.org,
 richard@nod.at, Nicolas.Ferre@microchip.com, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, Ludovic.Desroches@microchip.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, lee.jones@linaro.org,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 13/02/2019 09:00:05+0000, Tudor.Ambarus@microchip.com wrote:
> -	nc->ebi_csa_offs = (uintptr_t)match->data;
> +	nc->ebi_csa = (struct atmel_smc_nand_ebi_csa_cfg *)match->data;
>  

This cast is probably not necessary anymore as this cast a pointer to a
pointer.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
