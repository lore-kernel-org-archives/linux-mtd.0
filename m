Return-Path: <SRS0=h6Lp=II=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A77C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Mar 2021 02:33:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86A5F64F4B
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Mar 2021 02:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86A5F64F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AO/R01j+eeg5mrAsMLW4/OuP1AdyZntFBmKuvPw1ORg=; b=G4ziv/kd2D0dxVsc7SbQ04+cG
	PdAYpkfZU1v8nnr74BBfr3hGuSb83TpQnDrG5VRhJojdyL142hwnBW6ZJVhTjG3xy5NaDkabShGGE
	WrpiKrNd49qL2C/xkLMHrFkcTbDDa6v/gEzHi16zl7WF3+Wxl4/HRt8TPg8raJf8D38pvE3fZ27HA
	WH93cMVCGHMn8eTrxkwwDyk2ApNfgvxELDJDlhvC0hmta2g4FBhXJ1lpkXEBohzKEbcc3JEdqgO8i
	YVyQmxqFD0vXgVcSm0qn/7qgGsKSWbG9TZxqLCk5+gakoSZXj7dKwoBDdtnV2W3ZBeHRe8bosGf6o
	HwXie0nkQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJoec-005oSA-5a; Wed, 10 Mar 2021 02:32:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJoeS-005oQg-00
 for linux-mtd@lists.infradead.org; Wed, 10 Mar 2021 02:32:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9546F64F8C
 for <linux-mtd@lists.infradead.org>; Wed, 10 Mar 2021 02:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615343561;
 bh=69DUFNK2JB2JKzdkRdZ/XlWLEjG3ef1b4VxLgCOxoqw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=f8gpp9VdmwuPyoTT2fK7F+6mxLEzG+ejIftSJP3u2iiOdZhqnv8BsLbw6mvVTySiQ
 v82H9IFxBO06JOWtZwGPAQhXGmOFVszRwG8/3uCMNhie0bfuRfrjhuYGpXpQRJ5hR+
 Ay0ZeVv0/neMnICME4IC0vcWL9w9fdaGw8PGYCEupzWSepPFUjQ1do6ySHq/0S10Bh
 4h2L6PpngO7nw98bmzThF3id5nwvfyCKNT81qEwhOfqUI3bU3X/5g3bN2x7C5jnTLR
 EL+eljAwZ0NqjJcBWJu0z/YNVej/jEgpVR1XtlTX9+H5AC+jkSFCthAHtKhXqsnAQO
 EhMwHzTEgpUxA==
Received: by mail-ed1-f46.google.com with SMTP id b13so25017594edx.1
 for <linux-mtd@lists.infradead.org>; Tue, 09 Mar 2021 18:32:41 -0800 (PST)
X-Gm-Message-State: AOAM532VcOs1hoHFt+CAozs1e5yZt40xyaA3GiqhlQyDglCne+G+7XAH
 bR3OPmcZuvFCOpRQ4T4vWDe1L9zV8jsneSvGVg==
X-Google-Smtp-Source: ABdhPJwHjeFbPXpi7Hx1kJl/4EAmKe+MyBlw8ijIqRC+kYtRQvVW/TFyZN4qAshKdQQHueTyJWZ6Stlr1V0uk9El3Ag=
X-Received: by 2002:a05:6402:c88:: with SMTP id
 cm8mr699106edb.62.1615343560077; 
 Tue, 09 Mar 2021 18:32:40 -0800 (PST)
MIME-Version: 1.0
References: <20210222120259.94465-1-manivannan.sadhasivam@linaro.org>
 <20210222120259.94465-3-manivannan.sadhasivam@linaro.org>
 <20210305233657.GA839767@robh.at.kernel.org>
 <20210308053140.GA5457@thinkpad>
In-Reply-To: <20210308053140.GA5457@thinkpad>
From: Rob Herring <robh@kernel.org>
Date: Tue, 9 Mar 2021 19:32:28 -0700
X-Gmail-Original-Message-ID: <CAL_JsqKOfQ8v=Adp_3k64-WW-YXan_1kCG9mab6rE62VkSwmhQ@mail.gmail.com>
Message-ID: <CAL_JsqKOfQ8v=Adp_3k64-WW-YXan_1kCG9mab6rE62VkSwmhQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: mtd: Add a property to declare secure
 regions in Qcom NANDc
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh R <vigneshr@ti.com>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 MTD Maling List <linux-mtd@lists.infradead.org>, devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_023244_400279_BF10F1B6 
X-CRM114-Status: GOOD (  21.17  )
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

On Sun, Mar 7, 2021 at 10:31 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Fri, Mar 05, 2021 at 05:36:57PM -0600, Rob Herring wrote:
> > On Mon, Feb 22, 2021 at 05:32:58PM +0530, Manivannan Sadhasivam wrote:
> > > On a typical end product, a vendor may choose to secure some regions in
> > > the NAND memory which are supposed to stay intact between FW upgrades.
> > > The access to those regions will be blocked by a secure element like
> > > Trustzone. So the normal world software like Linux kernel should not
> > > touch these regions (including reading).
> > >
> > > So let's add a property for declaring such secure regions so that the
> > > driver can skip touching them.
> > >
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >  Documentation/devicetree/bindings/mtd/qcom,nandc.yaml | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> > > index 84ad7ff30121..7500e20da9c1 100644
> > > --- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> > > +++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> > > @@ -48,6 +48,13 @@ patternProperties:
> > >          enum:
> > >            - 512
> > >
> > > +      qcom,secure-regions:
> > > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> >
> > Don't you need 64-bit regions potentially? Though 4GB should be enough
> > for anyone.
> >
>
> Yes, given the size of current NAND based systems around, I thought 32 bit is
> enough.

Huh!? I was joking. 4GB is small nowadays. Make this 64-bit.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
