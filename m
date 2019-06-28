Return-Path: <SRS0=/mLJ=U3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F58C4321A
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 06:48:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48C2E20644
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 06:48:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lJEMhdfG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48C2E20644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eq9igKqE7NCsXskAHL9yIltNFy/Yb9aeN7xfX0MEoPI=; b=lJEMhdfG2jsLSj
	bcFSK7UENPDgZTPQcfdIB7+G2zw8wRU1BF1aWrvXtRwhodbn4nPJ6XQDz9RzSxPApQT7aD1UIlmSZ
	8ebt7OzwYeZIgT/GP+d5tAEi+QyQe18EwuTcBn7ibqj8TRtfikcejuynpMC845s4vcbKNX2V6vB6P
	+v9a0uz68oNEHbGjOn4ix77ShLJ1QrazELwmMMjHQxJCHwtiJRuEK7K9WPmJ/kbtTepFHQz0sGD4u
	Iunxj7j5Lux1lsIgfdnRRSp0lk2NGOWGtwehCr76tDMLhsgZJlgWN7Ds7URxZSA4ABiQ3fDrTCa4J
	Ehn7ESQY1NQdyvcH6TAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgkgk-0002jT-Oc; Fri, 28 Jun 2019 06:48:50 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgkgg-0002gm-VY
 for linux-mtd@lists.infradead.org; Fri, 28 Jun 2019 06:48:48 +0000
Received: from twhfmlp1.macronix.com (twhfm1p1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id x5S6m1Tv035815;
 Fri, 28 Jun 2019 14:48:01 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id C8B2B7E87EA3F2CAB608;
 Fri, 28 Jun 2019 14:48:01 +0800 (CST)
In-Reply-To: <20190627192609.0965f6d5@xps13>
References: <1561443056-13766-1-git-send-email-masonccyang@mxic.com.tw>	<1561443056-13766-3-git-send-email-masonccyang@mxic.com.tw>
 <20190627192609.0965f6d5@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: mtd: Document Macronix raw NAND
 controller bindings
MIME-Version: 1.0
X-KeepSent: FBD1710A:54AC467B-48258427:0023FCA3;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OFFBD1710A.54AC467B-ON48258427.0023FCA3-48258427.00255B71@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Fri, 28 Jun 2019 14:48:02 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/06/28 PM 02:48:01,
 Serialize complete at 2019/06/28 PM 02:48:01
X-MAIL: TWHMLLG3.macronix.com x5S6m1Tv035815
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_234847_291116_D7B6B17B 
X-CRM114-Status: GOOD (  13.77  )
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
Cc: devicetree@vger.kernel.org, christophe.kerello@st.com, vigneshr@ti.com,
 jianxin.pan@amlogic.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 lee.jones@linaro.org, linux-kernel@vger.kernel.org, stefan@agner.ch,
 paul@crapouillou.net, marek.vasut@gmail.com, paul.burton@mips.com,
 broonie@kernel.org, linux-mtd@lists.infradead.org, richard@nod.at,
 anders.roxell@linaro.org, liang.yang@amlogic.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel,

> > Document the bindings used by the Macronix raw NAND controller.
> > 
> > Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> > ---
> >  .../devicetree/bindings/mtd/mxic-nand.txt          | 26 
++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >  create mode 100644 
Documentation/devicetree/bindings/mtd/mxic-nand.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/mxic-nand.txt b/
> Documentation/devicetree/bindings/mtd/mxic-nand.txt
> > new file mode 100644
> > index 0000000..3d198e4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
> > @@ -0,0 +1,26 @@
> > +Macronix Raw NAND Controller Device Tree Bindings
> > +-------------------------------------------------
> > +
> > +Required properties:
> > +- compatible: should be "mxic,raw-nand-ctlr"
> 
> I would prefer "macronix,nand-controller"

okay, will patch it.

> 
> > +- reg: should contain 1 entrie for the registers
> 
>                            entry
> 
> > +- reg-names: should contain "regs"
> 
> Not sure you need that?

for a base address of ctlr registers.

> 
> > +- interrupts: interrupt line connected to this NAND controller
> > +- clock-names: should contain "ps_clk", "send_clk" and "send_dly_clk"
> > +- clocks: should contain 3 entries for the "ps_clk", "send_clk" and
> > +    "send_dly_clk" clocks
> 
> s/entries/phandles/ ?

?
as I know that kernel views the phandle values as device tree structure
information instead of device tree data and thus does not store them as
properties.


> 
> > +
> > +Example:
> > +
> > +   nand: mxic-nfc@43c30000 {
> > +      compatible = "mxic,raw-nand-ctlr";
> > +      reg = <0x43c30000 0x10000>;
> > +      reg-names = "regs";
> > +      clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
> > +      clock-names = "send_clk", "send_dly_clk", "ps_clk";
> > +
> > +      nand-ecc-mode = "soft";
> > +      nand-ecc-algo = "bch";
> > +      nand-ecc-step-size = <512>;
> > +      nand-ecc-strength = <8>;
> 
> The last 4 lines are probably not needed.

okay, will remove them.

thanks for your review.
best regards,
Mason


CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information 
and/or personal data, which is protected by applicable laws. Please be 
reminded that duplication, disclosure, distribution, or use of this e-mail 
(and/or its attachments) or any part thereof is prohibited. If you receive 
this e-mail in error, please notify us immediately and delete this mail as 
well as its attachment(s) from your system. In addition, please be 
informed that collection, processing, and/or use of personal data is 
prohibited unless expressly permitted by personal data protection laws. 
Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================



============================================================================

CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information and/or personal data, which is protected by applicable laws. Please be reminded that duplication, disclosure, distribution, or use of this e-mail (and/or its attachments) or any part thereof is prohibited. If you receive this e-mail in error, please notify us immediately and delete this mail as well as its attachment(s) from your system. In addition, please be informed that collection, processing, and/or use of personal data is prohibited unless expressly permitted by personal data protection laws. Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
