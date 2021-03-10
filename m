Return-Path: <SRS0=h6Lp=II=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9877EC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Mar 2021 03:46:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A39D64FEE
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Mar 2021 03:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A39D64FEE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a5rfllOxt22iyD7sMBdCdnScoXxc2Gmb5/m1AcGpLVg=; b=nICrFqVcIM0Tb6RLv9atGr/RA
	mMSkIoRrGriP/UifFkRMkl+TIjUwQUU+A9Bmkt4o2dpR2UAUX2X6ZsTjIvaf3Q2zVnDH8oj7Lvuq3
	rvr5M5D3Dhl+DiVT0Q7kr6fWzKpWJRJrsRO6Ytpv5AylaGdP+YHcb9B7IzbbjyjNZgs+C4OGTBHBU
	YL9qK0Na6jIKyBmEb6luLZzZUkvN2O3yCIePI2UpVSJg8Ua/MKd+vMisBNl9o/iN++VbOnFLnFWPz
	14EmHxH0dwvLBr7/GqEDzEXt2tcrYMlYU05SRhSEG+TFuCsNq0nf61ghueVkE32D8WSTqXclMbb4J
	ldynNOADA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJpnE-005wkQ-FE; Wed, 10 Mar 2021 03:45:52 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJpmj-005wfr-Ly
 for linux-mtd@lists.infradead.org; Wed, 10 Mar 2021 03:45:47 +0000
Received: by mail-pj1-x1032.google.com with SMTP id gb6so803924pjb.0
 for <linux-mtd@lists.infradead.org>; Tue, 09 Mar 2021 19:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DhWQQNXXhBl9V6m34E/2PgUYDDDOUR9yglVAy9KAsHY=;
 b=wZtFlrFINw2Eair2VU4xp47Y+Zi2XmPCnVs7/PeQQ+qZL4KJz7TIbM4fSs7rkGdkWR
 Tl0SPi8DxbMK8n35d2WfRZLLZq4vPNMNMHbSFMmDEzlJFbNrHYjyFJSXibqvB6mvIPuD
 rujaYePPrZWDrQl7ZM7yyKgguW+gm+ZdWMmhJdy5CCVN12yHflTVRMooqqaZjBXgX9Kt
 cAmLiJrc1A1N7FR0ipezYhyPkO0X/Y7qlZyQlyR8kFhaSqV47S6YisodCt2dGdZPBJfi
 7LkD7ptdMN+fdaTf4amIBaL5YBjSVwYLMZjIj0Yz5VYlgXYqGz9aqnewwYhzjiUJKmF8
 xJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DhWQQNXXhBl9V6m34E/2PgUYDDDOUR9yglVAy9KAsHY=;
 b=nP4R8n4vZNptrWwJdEa8Hid6owdPNjtYXMRI1NxYp6FVljIK7zhjjYUkz8032OfNI7
 7Kuco83lNR029qhrbLD3Vl3wXXFHgim5QFbgs5Z3ttB7udpA9i/FOoVsp1R1l4JBnBPU
 GKbM6MzVSv4eg6nw90RJJMgnPwZHrMnt+QW6Y2wFpM3YG+IzVKXE5K29FoIGvhd5ojXu
 sI+o+yUjQpmF7XTvW9DpZqpb6E8vSAyxnrRs+i4FlI6Rt7Z0K9SDu9FxqUEVgpE6vg2y
 s8zsFy73B65P2dIR3+KskgL7Lu6SkT70h5xYbfk/izbx2eM9UK4xAsnkU+vN+64MNQQW
 LxVg==
X-Gm-Message-State: AOAM532C8JNvCi8d0UEQEas/yRWAmqGPuZnGDRkDWryxEC2pMYg6gIUR
 gVE6NjXOaXZGAv6gPP6kAFaIL1m1HxBs
X-Google-Smtp-Source: ABdhPJww3LXcQIsgNxaSJHDT5/xWPeMIY19nocTKUL5cDKhnuEj6JBzU0U6CZYxIYaCnJ0FAoncP0w==
X-Received: by 2002:a17:902:d114:b029:e4:87c7:39f5 with SMTP id
 w20-20020a170902d114b02900e487c739f5mr988931plw.72.1615347919127; 
 Tue, 09 Mar 2021 19:45:19 -0800 (PST)
Received: from work ([103.66.79.59])
 by smtp.gmail.com with ESMTPSA id l2sm2149788pji.45.2021.03.09.19.45.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 09 Mar 2021 19:45:18 -0800 (PST)
Date: Wed, 10 Mar 2021 09:15:14 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: =?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh R <vigneshr@ti.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 2/3] dt-bindings: mtd: Add a property to declare secure
 regions in Qcom NANDc
Message-ID: <20210310034514.GA11114@work>
References: <20210222120259.94465-1-manivannan.sadhasivam@linaro.org>
 <20210222120259.94465-3-manivannan.sadhasivam@linaro.org>
 <20210305233657.GA839767@robh.at.kernel.org>
 <20210308053140.GA5457@thinkpad>
 <CAL_JsqKOfQ8v=Adp_3k64-WW-YXan_1kCG9mab6rE62VkSwmhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqKOfQ8v=Adp_3k64-WW-YXan_1kCG9mab6rE62VkSwmhQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_034545_050360_16D37549 
X-CRM114-Status: GOOD (  25.69  )
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

On Tue, Mar 09, 2021 at 07:32:28PM -0700, Rob Herring wrote:
> On Sun, Mar 7, 2021 at 10:31 PM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Fri, Mar 05, 2021 at 05:36:57PM -0600, Rob Herring wrote:
> > > On Mon, Feb 22, 2021 at 05:32:58PM +0530, Manivannan Sadhasivam wrote:
> > > > On a typical end product, a vendor may choose to secure some regions in
> > > > the NAND memory which are supposed to stay intact between FW upgrades.
> > > > The access to those regions will be blocked by a secure element like
> > > > Trustzone. So the normal world software like Linux kernel should not
> > > > touch these regions (including reading).
> > > >
> > > > So let's add a property for declaring such secure regions so that the
> > > > driver can skip touching them.
> > > >
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > >  Documentation/devicetree/bindings/mtd/qcom,nandc.yaml | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> > > > index 84ad7ff30121..7500e20da9c1 100644
> > > > --- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> > > > +++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> > > > @@ -48,6 +48,13 @@ patternProperties:
> > > >          enum:
> > > >            - 512
> > > >
> > > > +      qcom,secure-regions:
> > > > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > >
> > > Don't you need 64-bit regions potentially? Though 4GB should be enough
> > > for anyone.
> > >
> >
> > Yes, given the size of current NAND based systems around, I thought 32 bit is
> > enough.
> 
> Huh!? I was joking. 4GB is small nowadays. Make this 64-bit.
> 

Well I was speaking in the context of Qcom chipsets making use of NAND. Mostly
the Qcom modem chipsets have <4GB of memory. But since this property is now not
specific to Qcom, I agree with you and will make it 64 bit.

Thanks,
Mani

> Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
