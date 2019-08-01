Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6546AC433FF
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 09:18:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24150216C8
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 09:18:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fzkIeaQ4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24150216C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6jtpUQ6gkU++P4WvaZ5uMYABVEEsCCAjXeKBr3rhmeU=; b=fzkIeaQ461nT/n
	FiS90A+jfJXhLJXKI4rq3reUmtIzMtAqCWCA3n6uDxL1oL/iX7oMlC06IxtW7q8Ewh0nPRLTvdRXt
	ULAGpLxbGz8OwDrA5VrcArqpeIVNznqDdaXMlCsoMdLH39k1601SIP4g0VW5A2FyH2DMy6ROJhHXg
	0NCWnP33gbqYku3BJuMMMVj4xABy0LNJ0111cNVIdi1xErrPET9Qj032KVFtMlXw+y1ehVkIR3mLE
	/Ft/904C9gWXcGbVvKuK5zCyhbwW7FMpjdxBQydordrm1eVS498AtyucmVG29y5LrL9MY9S8/2owh
	YKilTnDn2OOwJYBmUkBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht7EJ-0005HS-Dx; Thu, 01 Aug 2019 09:18:35 +0000
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht7EG-0005H0-2z
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 09:18:33 +0000
Received: from twhfmnt1.mxic.com.tw (twhfm1p2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id x719HTPb014187;
 Thu, 1 Aug 2019 17:17:29 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id E762F2D1C15A92C1395E;
 Thu,  1 Aug 2019 17:17:29 +0800 (CST)
In-Reply-To: <20190801075725.4f23e0f5@collabora.com>
References: <1564631710-30276-1-git-send-email-masonccyang@mxic.com.tw>	<1564631710-30276-3-git-send-email-masonccyang@mxic.com.tw>
 <20190801075725.4f23e0f5@collabora.com>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
Subject: Re: [PATCH v6 2/2] dt-bindings: mtd: Document Macronix raw NAND
 controller bindings
MIME-Version: 1.0
X-KeepSent: 42C4D3EC:9549E8DC-48258449:003273A5;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF42C4D3EC.9549E8DC-ON48258449.003273A5-48258449.00330A06@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Thu, 1 Aug 2019 17:17:29 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/08/01 PM 05:17:29,
 Serialize complete at 2019/08/01 PM 05:17:29
X-MAIL: TWHMLLG4.macronix.com x719HTPb014187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_021832_384545_1E8C898D 
X-CRM114-Status: GOOD (  15.06  )
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
 lee.jones@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 paul@crapouillou.net, marek.vasut@gmail.com, paul.burton@mips.com,
 liang.yang@amlogic.com, linux-mtd@lists.infradead.org, stefan@agner.ch,
 miquel.raynal@bootlin.com, anders.roxell@linaro.org,
 computersforpeace@gmail.com, dwmw2@infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Boris,

> On Thu,  1 Aug 2019 11:55:10 +0800
> Mason Yang <masonccyang@mxic.com.tw> wrote:
> 
> > Document the bindings used by the Macronix raw NAND controller.
> > 
> > Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> > ---
> >  Documentation/devicetree/bindings/mtd/mxic-nand.txt | 19 
+++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >  create mode 100644 
Documentation/devicetree/bindings/mtd/mxic-nand.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/mxic-nand.txt b/
> Documentation/devicetree/bindings/mtd/mxic-nand.txt
> > new file mode 100644
> > index 0000000..de37d60
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/mxic-nand.txt
> > @@ -0,0 +1,19 @@
> > +Macronix Raw NAND Controller Device Tree Bindings
> > +-------------------------------------------------
> > +
> > +Required properties:
> > +- compatible: should be "mxicy,multi-itfc-v009-nand-morph"
> > +- reg: should contain 1 entry for the registers
> > +- interrupts: interrupt line connected to this raw NAND controller
> > +- clock-names: should contain "ps", "send" and "send_dly"
> > +- clocks: should contain 3 phandles for the "ps", "send" and
> > +    "send_dly" clocks
> > +
> > +Example:
> > +
> > +   nand: nand-controller@43c30000 {
> > +      compatible = "mxicy,multi-itfc-v009-nand-morph";
> > +      reg = <0x43c30000 0x10000>;
> > +      clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
> > +      clock-names = "send", "send_dly", "ps";
> 
> You should have subnodes describing the NAND connected to the
> controller (see [1]).
> 
> [1]
https://elixir.bootlin.com/linux/v5.3-rc2/source/Documentation/devicetree/
> bindings/mtd/nand-controller.yaml#L131
> 
> > +   };
> 

Do you mean to add patternProperties ?

                 nand: nand-controller@43c30000 {
                                 compatible = 
"mxicy,multi-itfc-v009-nand-morph";
                                 reg = <0x43c30000 0x10000>;
                                 clocks = <&clkwizard 0>, <&clkwizard 1>, 
<&clkc 15>;
                                 clock-names = "send", "send_dly", "ps";

+                               nand@0 {
+
+                               };
                 };

something like that.

thanks & best regards,
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
