Return-Path: <SRS0=UzJP=VU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21993C76186
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jul 2019 03:28:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E961821911
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jul 2019 03:28:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LVrieFzJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E961821911
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6slVNpfXFJKKAsSBHkiKlyVO3xWdiY/7Omj5jofFrZ0=; b=LVrieFzJNsdH28
	jRU2VGgEiTNYWTA/3o+jGVwXqZs7Ofxi6ec7JgrBxza9YzaiX9bcS/3PkvBnQ3vDOlF6Du6QUoQlt
	/UTZqK02WxVkuQ2cnTuI6NZmR7YzhhBP33jczwPrrNl9OyTYICzBDF0JJQ378OT1jeUPcEDqV+++8
	m8bd1JT7LimrYvnX+2pfzp2/zUHfou5qDNNoUk4ooN5Om6qzhpZAjCoilKkOiBYDj18cQYFRPwd8J
	t2GLCkrS0dTYIBLhcWax78xyCI6GENrWbGlaunxxuruLw3qtJO3AqNwzudYz7kYfn2QoxqcM2P6wL
	5Lc9od1QHh50MGpm+hQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hplSp-0002Dn-97; Tue, 23 Jul 2019 03:27:43 +0000
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hplSl-00022v-LR
 for linux-mtd@lists.infradead.org; Tue, 23 Jul 2019 03:27:41 +0000
Received: from twhfmlp1.macronix.com (twhfm1p1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id x6N3QSlo003193;
 Tue, 23 Jul 2019 11:26:28 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id 1A5EFAD7BC06911158C9;
 Tue, 23 Jul 2019 11:26:28 +0800 (CST)
In-Reply-To: <20190722234614.GA11971@bogus>
References: <1562138144-2212-1-git-send-email-masonccyang@mxic.com.tw>
 <1562138144-2212-3-git-send-email-masonccyang@mxic.com.tw>
 <20190722234614.GA11971@bogus>
To: "Rob Herring" <robh@kernel.org>
Subject: Re: [PATCH v5 2/2] dt-bindings: mtd: Document Macronix raw NAND
 controller bindings
MIME-Version: 1.0
X-KeepSent: 10139C27:59024E84-48258440:00113398;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF10139C27.59024E84-ON48258440.00113398-48258440.0012E6FA@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Tue, 23 Jul 2019 11:26:27 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/07/23 AM 11:26:28,
 Serialize complete at 2019/07/23 AM 11:26:28
X-MAIL: TWHMLLG3.macronix.com x6N3QSlo003193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190722_202739_972239_2646ACCA 
X-CRM114-Status: GOOD (  14.90  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, christophe.kerello@st.com,
 richard@nod.at, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 lee.jones@linaro.org, linux-kernel@vger.kernel.org, stefan@agner.ch,
 paul@crapouillou.net, marek.vasut@gmail.com, paul.burton@mips.com,
 liang.yang@amlogic.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, anders.roxell@linaro.org,
 computersforpeace@gmail.com, dwmw2@infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Rob,


> 
> Re: [PATCH v5 2/2] dt-bindings: mtd: Document Macronix raw NAND 
controller bindings
> 
> On Wed, Jul 03, 2019 at 03:15:44PM +0800, Mason Yang wrote:
> > Document the bindings used by the Macronix raw NAND controller.
> > 
> > Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> > ---
> >  Documentation/devicetree/bindings/mtd/mxic-nand.txt | 20 
++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100644 
Documentation/devicetree/bindings/mtd/mxic-nand.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/mxic-nand.txt b/
> Documentation/devicetree/bindings/mtd/mxic-nand.txt
> > new file mode 100644
> > index 0000000..ddd7660
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
> > @@ -0,0 +1,20 @@
> > +Macronix Raw NAND Controller Device Tree Bindings
> > +-------------------------------------------------
> > +
> > +Required properties:
> > +- compatible: should be "macronix,nand-controller"
> 
> That's not very specific. There's only 1 version of this h/w?

okay, will give it a apposite name.

> 
> > +- reg: should contain 1 entrie for the registers
> 
> s/entrie/entry/

will fix it.

> 
> > +- interrupts: interrupt line connected to this raw NAND controller
> > +- clock-names: should contain "ps_clk", "send_clk" and "send_dly_clk"
> > +- clocks: should contain 3 phandles for the "ps_clk", "send_clk" and
> > +    "send_dly_clk" clocks
> 
> You can drop '_clk' as that is redundant.

okay, got it.

> 
> > +
> > +Example:
> > +
> > +   nand: mxic-nfc@43c30000 {
> > +      compatible = "macronix,nand-controller";
> > +      reg = <0x43c30000 0x10000>;
> > +      reg-names = "regs";
> 
> Not documented. You can drop as *-names is not generally useful when 
> there is only 1 entry.

okay, will fix it.

> 
> > +      clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
> > +      clock-names = "send_clk", "send_dly_clk", "ps_clk";
> > +   };
> > -- 
> > 1.9.1
> > 

thanks for your time & review.
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
