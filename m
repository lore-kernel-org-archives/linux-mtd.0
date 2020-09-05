Return-Path: <SRS0=qoSA=CO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFD3C43461
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Sep 2020 06:03:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30D80208DB
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Sep 2020 06:03:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yABp2hk+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4yabjZ9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30D80208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4VEVKY7GdW0LdVzdZDcvyemVhtF3zGwcGrTFuxjMVSg=; b=yABp2hk+XNGcNqO86x2G/co2p
	SKZLwYYuJ0acgNohb46fbdwQTVqYWDkGbIzz1GFrxTpg93Ls2oos2ts3z7YomQsYHxaChRBJ/iUMW
	M/IGvrHxo62F3vgqkWFCbw/JhFivFvXdMIbWspAzU7XQyDXr4adKUbBCttIbzTJ5cAAFPcqy9bGym
	55r6msN5hRcA8Uk/JPAWwNyodMK03c5u0zKzbAkjuhcM8sgeuWWuqHeypNHIDrOQ9UhuIFewFgixZ
	RvtF77Jc4/fcBnLMkI4oLpHeGKLIwwhqX1hc73Husw/uA1bb/ElOs0uDMiJCpLVTqapg02LBLy/zp
	CRr0Yg2Hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kERH8-00079r-VY; Sat, 05 Sep 2020 06:02:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kERH5-00078p-0r; Sat, 05 Sep 2020 06:02:08 +0000
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5190A208DB;
 Sat,  5 Sep 2020 06:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599285725;
 bh=Baa+vCVEDyUV7eOx+FInEWcsp0zp8TLXiBCsCiQ2+LI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g4yabjZ9UashSqLcV2bYmUclpYFvRCHHve59hAcTbNLFiu9oTIKZ0YCtw6HM5spE2
 Qi67m6oMcysjJRCES+Z4Dq05Clh6NA+kkiwv3Xn2W0Hx6M5iNDf3FYxFKzKc0+eTTe
 MYisn8n0ZCjhPrep8J7Stg80DHIDihOvrtAwSJA0=
Date: Sat, 5 Sep 2020 14:02:00 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/4] ARM: dts: imx23: Align GPMI NAND node name with schema
Message-ID: <20200905060158.GE7508@dragon>
References: <20200828192037.22897-1-krzk@kernel.org>
 <20200828192037.22897-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200828192037.22897-2-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200905_020207_223786_C69558C2 
X-CRM114-Status: GOOD (  11.92  )
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Fabio Estevam <festevam@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Aug 28, 2020 at 09:20:35PM +0200, Krzysztof Kozlowski wrote:
> Device tree schema expects NAND controller to be named
> "nand-controller", otherwise dtbs_check complain with a warning like:
> 
>     arch/arm/boot/dts/imx28-eukrea-mbmx283lc.dt.yaml: gpmi-nand@8000c000:
>         $nodename:0: 'gpmi-nand@8000c000' does not match '^nand-controller(@.*)?'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

I already applied one patch from Anson [1].

Shawn

[1] https://lkml.org/lkml/2020/7/30/610

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
