Return-Path: <SRS0=9tRn=TP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617E5C04E53
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 07:37:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 342A9206A3
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 07:37:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VmIPHNpi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 342A9206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=73yqzn9cve8AvSqpc+fEXFU4SB9JUm+74dzh60Wo7hI=; b=VmIPHNpi8a56Gc
	LY0dYH5FjxEGxUCaEA531Y6Ku21GSVIYSKjwKWVdNJGPBZAyLQ9v3mmZGKzD9RAYHU7Jv3zvA+wVR
	YTDoFac/URjbASE8iqVaX6eTLELMLT04zB/7hWoNdy5dYVRwRB/SGIImMkkONlLAAYEUd39kzYqvc
	/szS1Nd8ISXCYkJSBKJtFo+SK+56HjAY9/32e3Q0wOdMOESdavEopryJHYwHEMPlOpbuwMOKvJkhB
	8V4Uk/9k5Ugwln/XNB4nWdxhW1Bo+xdwwJaerV3DJNyqki9YGWGfT6H65LkOnalDhOmYQxZoRT6GV
	8HmpUu17EPYfsJvfDDkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQoTX-00007Q-HL; Wed, 15 May 2019 07:37:19 +0000
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQoTU-00006j-MH
 for linux-mtd@lists.infradead.org; Wed, 15 May 2019 07:37:18 +0000
Received: from twhfmlp1.macronix.com (twhfm1p1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id x4F7aS9F078422;
 Wed, 15 May 2019 15:36:28 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id EE36B97764010B1F89B8;
 Wed, 15 May 2019 15:36:28 +0800 (CST)
In-Reply-To: <20190512152328.49576a0f@xps13>
References: <1555320234-15802-1-git-send-email-masonccyang@mxic.com.tw>	<1555320234-15802-5-git-send-email-masonccyang@mxic.com.tw>
 <20190512152328.49576a0f@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 4/4] dt-bindings: mfd: Document Macronix MX25F0A
 controller bindings
MIME-Version: 1.0
X-KeepSent: 0FD6EB50:C92AD6D4-482583FB:00285AB8;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF0FD6EB50.C92AD6D4-ON482583FB.00285AB8-482583FB.0029CAB7@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Wed, 15 May 2019 15:36:29 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/05/15 PM 03:36:28,
 Serialize complete at 2019/05/15 PM 03:36:28
X-MAIL: TWHMLLG3.macronix.com x4F7aS9F078422
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_003716_997251_080812F5 
X-CRM114-Status: GOOD (  12.27  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, christophe.kerello@st.com,
 bbrezillon@kernel.org, juliensu@mxic.com.tw, lee.jones@linaro.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-spi@vger.kernel.org,
 marcel.ziswiler@toradex.com, paul.burton@mips.com, broonie@kernel.org,
 geert@linux-m68k.org, stefan@agner.ch, linux-mtd@lists.infradead.org,
 richard@nod.at, liang.yang@amlogic.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, marek.vasut@gmail.com, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel,


> > +Macronix MX25F0A MultiFunction Device Tree Bindings
> > +----------------------------------------------------
> > +
> > +MX25F0A is a MultiFunction Device with SPI and raw NAND, which
> > +supports either spi host controller or raw nand controller.
> 
> Acronyms in plain English should be in upper case.

okay, will fix.

> > +Example:
> > +
> > +   mxic: mx25f0a@43c30000 {
> > +      compatible = "mxic,mx25f0a";
> > +      reg = <0x43c30000 0x10000>, <0xa0000000 0x4000000>;
> > +      reg-names = "regs", "dirmap";
> > +
> > +      /* spi */
> > +      clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
> > +      clock-names = "send_clk", "send_dly_clk", "ps_clk";
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      flash@0 {
> > +         compatible = "jedec,spi-nor";
> > +         reg = <0>;
> > +         spi-max-frequency = <25000000>;
> > +         spi-tx-bus-width = <4>;
> > +         spi-rx-bus-width = <4>;
> > +      };
> > +
> > +      /* nand */
> > +      nand-ecc-mode = "soft";
> > +      nand-ecc-algo = "bch";
> > +      nand-ecc-step-size = <512>;
> > +      nand-ecc-strength = <8>;
> 
> Any reason to enforce 512B/8b correction? Why not letting the core
> choose for you depending on the NAND chip's requirements?
> 

I thought here is just a raw NAND DTS example. 
Will remove it.

> 
> Anyway, I think you can have only one or the other (NAND or SPI), not
> both, and you probably should have a compatible or a property to tell
> the kernel which one you are using, right?
> 

yes, you are right.

New DTS is bellow.
-------------------------------------------------------------------------->

Macronix Flash Memory Controller Device Tree Bindings
-----------------------------------------------------

Macronix Flash Memory Controller supports serial and raw Flash, including
NOR and NAND Flash for high throughput and low pin count applications.
It's a MultiFunction Device which supports either SPI host controller or
raw NAND controller.

Required properties:
- compatible: should be "mxic,mfd"
- reg: should contain 2 entries, one for the registers and one for the 
direct
       mapping area in SPI mode.
- reg-names: should contain "regs" and "dirmap"
- interrupts: interrupt line connected to this controller
- SPI:
        - #address-cells: should be 1
        - #size-cells: should be 0
        - clock-names: should contain "ps_clk", "send_clk" and
                       "send_dly_clk"
        - clocks: should contain 3 entries for the "ps_clk", "send_clk"
                  and "send_dly_clk" clocks
- Raw NAND:
        - nand-ecc-mode = "soft";
        - nand-ecc-algo = "bch";

Example:
- SPI mode:

        mxic: mxic-mfd@43c30000 {
                compatible = "mxic,mfd";
                reg = <0x43c30000 0x10000>, <0xa0000000 0x4000000>;
                reg-names = "regs", "dirmap";
                clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
                clock-names = "send_clk", "send_dly_clk", "ps_clk";
                #address-cells = <1>;
                #size-cells = <0>;

                flash@0 {
                        compatible = "jedec,spi-nor";
                        reg = <0>;
                        spi-max-frequency = <25000000>;
                        spi-tx-bus-width = <4>;
                        spi-rx-bus-width = <4>;
                };
        };
 
- Raw NAND mode:

        mxic: mxic-mfd@43c30000 {
                compatible = "mxic,mfd";
                reg = <0x43c30000 0x10000>, <0xa0000000 0x4000000>;
                reg-names = "regs", "dirmap";

                nand-ecc-mode = "soft";
                nand-ecc-algo = "bch";
        };  

---------------------------------------------------------------------< 

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
