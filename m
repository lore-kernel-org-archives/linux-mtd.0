Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A88AC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 18:01:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D218F60F3A
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 18:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D218F60F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PGOutohClRynaiA9PSyftBI8mOx1yLnNG+aeKrLaD3Q=; b=sM8subTCqcn0za
	Xgzvn4xjI+xnm6PlhrPjKw2BSGYxsCOMFJACMuojMdjiNkLoVpnmK70Eq0/kfY/n6CnxikbVIhtI0
	8tcfp1PLNYNYJePDcNk/UYRHyTrYCdGrLq29tflhYuOyQbPaE+vAGRnfwxFSQgQF5ZMGfLhrwDRMM
	MOYCkDU6r4H52LhK3/pVZVC5Sa/w2csjboFpG34QjGdACUJ0rs/GAEdg6jasHWB2cID382DeO1KCc
	n8zZ9LcIJBMVNnybDOUY+vY8QTs9sDCvNJWNNq6oGgON710Qbcn5FVFJGqLziZoE2jCSK5KDdHx/0
	KJRDXUgBLUy8rssTkGPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYXhI-000RWn-Ja; Thu, 07 Oct 2021 18:00:48 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYXhE-000RV7-4U
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 18:00:47 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 197I0XlV078054;
 Thu, 7 Oct 2021 13:00:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1633629633;
 bh=/8/LqfY1tsSG2Hqa/h7+PWJukVboKDUGqRlimlBGYmQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=eVgJ5Ltygg4xtGOFaunX4itmtAmNJqi1oqkhQP0jl9zaxHrN2KRfEohG1nUceeUbT
 JvHjTmLDRJNFkzr64FzjhcUcBlbNnK8PjEvLYpCqhfAFmhMV1rPhIVv2+5yZQqpBYU
 s98tiODOWvuB0oOQNKhLTuVXEP5nP2rGbRJ4poaM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 197I0Xj6061903
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 7 Oct 2021 13:00:33 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 7
 Oct 2021 13:00:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 7 Oct 2021 13:00:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 197I0WKx055285;
 Thu, 7 Oct 2021 13:00:33 -0500
Date: Thu, 7 Oct 2021 23:30:31 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Mark Brown
 <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, Michael Walle
 <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Mauro Lima <mauro.lima@eclypsium.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
Subject: Re: [PATCH 2/3] mtd: spi-nor: intel-spi: Convert to SPI MEM
Message-ID: <20211007180029.6agt43vyiwpcgmjz@ti.com>
References: <20210930100719.2176-1-mika.westerberg@linux.intel.com>
 <20210930100719.2176-3-mika.westerberg@linux.intel.com>
 <20211004095239.dyowgkyq5lnfdag2@ti.com> <YVrSbyEsSLMOu1bU@lahna>
 <20211007123621.ld4aqasr3hlwq2c7@ti.com> <YV8kVKiMShWp4g7a@lahna>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YV8kVKiMShWp4g7a@lahna>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_110044_304659_6D902222 
X-CRM114-Status: GOOD (  34.66  )
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

On 07/10/21 07:46PM, Mika Westerberg wrote:
> Hi,
> 
> On Thu, Oct 07, 2021 at 06:06:23PM +0530, Pratyush Yadav wrote:
> > > Unfortunately there is no way to tell the controller any of these. It
> > > simply does "read" or "write" (as we command it) and internally then
> > > uses whatever it got from the SFDP tables of the flash chip. That's why
> > > we just claim to support all these operations and let the controller do
> > > its thing (whatever it is).
> > 
> > That is not ideal. SPI NOR uses this to negotiate the best available 
> > protocol with the controller. Say you have a flash that is capable of 
> > octal mode but the controller can only support quad mode. Your driver 
> > will happily tell SPI NOR that it can support octal mode. I think you 
> > should check the SPI mode bits to make sure the protocol bus width is 
> > supported at least (see spi_check_buswidth_req() in spi-mem.c).
> 
> Okay, I'll see if I can add that check somewhere.
> 
> > As for opcodes, is there no way to find out what opcodes the controller 
> > discovered via SFDP? Maybe we can't change them, but can we at least 
> > take a peek at them?
> 
> AFAICT no. The controller only allows "higher" level commands like read,
> write, erase but does not expose any of that to software. You can see
> yourself if you want, the spec is here:
>  
>   https://cdrdv2.intel.com/v1/dl/getContent/636174
> 
> Page 403 has the control register.

I do see 4k and 64k erase opcode fields on the BIOS_SFDP1_VSSC1 register 
(page 428), but I am not sure what exactly it is for. Anyway, that 
doesn't really do much for us I think.

> 
> > I think this has problems similar to the Cadence xSPI controller [0].
> 
> Probably but I would not call these "problems" - it is how the
> controller is designed. This one is meant only for SPI-NOR flash access,
> typically used by the BIOS. It is by no means general purpose SPI
> controller (as you can see from the datasheet). The BIOS does need the
> full SPI stack, it just issues these simple commands and let's the
> controller figure out what actually needs to be done.

The problem is not the controller itself. It is perfectly fine piece to 
have a controller like this IMO. The problem is how do we make it fit 
into the SPI MEM model, which seems to be designed for general purpose 
controllers only. This problem is shared with this and the Cadence xSPI 
controller.

> 
> > Sorry I only replied to this after you posted a new version. It got lost 
> > in the heap of emails in my inbox :-(
> 
> No worries :)
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
