Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731D9C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 13:32:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08D7E651C2
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 13:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08D7E651C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nJsSSQZ2GQZgAsk0VUWzf9gqbkTkG/KputTX7/Yw2T4=; b=MNL2mTQ6HZxcMQ/JrFeqlKltk
	+/9IwBAERXcQHzecENxIMsmwhY7SKM1e3H8J0O6nnO20DPzlCwiLdZiYDVQzB2Xmb4DOEjQvw0m1b
	TtZ178u0jWozKLtpdD2+iB/ipqjl1oj2RsCaHw0WSHePEYHYP4m11O6RaIlfsJlDFcVZ2e6sMtOTm
	gouryzYM3HqoMjlTZyVGJa4lG8/RlDFZ6UGSytzUOTNmFffJp/cOIppSjnL9LgEqmfxrvVWCXrAau
	kXBLuwsOIFMRk6wWidjP2Kc0OFGOc942wfnufDVGxe3oNr2Y5PBstm8s86Hg0BaWTPKT5WevKH1uc
	3WEkBXTGQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJFzF-00HT2z-4Y; Mon, 08 Mar 2021 13:31:53 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJFz9-00HT0f-TK
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 13:31:51 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 a22-20020a17090aa516b02900c1215e9b33so2982279pjq.5
 for <linux-mtd@lists.infradead.org>; Mon, 08 Mar 2021 05:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XGoAGNYT6tXYgHeKhW2JDJs/r9xX8kr9hTTKfXjfp84=;
 b=WigFhTulHneEufHF8nv8vUutVojLFmgJDTeNXtaWIU6BPb8zOYLtrlP6k9KxCz7upK
 WM+rXJTkMx5jSH6Dnskkvn1o6moP8tLlEMZJCi7YrJ0k939ChwsqstpuQR7lnUAxzxBl
 ucee8leMGI/ko/e3O64fAxTffuba/YrwHSJXqCHntP10EbeqbbbbliijiU1IoFBtmZXe
 Q/J53WiSAsl9wqEppvQqc4ozTiJcKnSqkvrpPi20tb8KkqDmbyBVxlhsitw6Cw5Xwh/8
 T3teg/0t8/tMtTV9Rf9vAtYZVx24Zr/hgmlvXknmO9/URPDL4zAr6pXjJ1caln+exoXS
 /qMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XGoAGNYT6tXYgHeKhW2JDJs/r9xX8kr9hTTKfXjfp84=;
 b=ZSwquq3usSqew5lZjpTEHrLo2PTaw7hzVI6baTjcvD8R1m3UZpEX409cm1zgm/WTBg
 a6xr03q9Glvi6W5eJSKuGHfgxyjC4WnGEljyRyLLX1OoKw9SyZqHBo2BxNqw5u0TXtUr
 A7kxhfwMgycMDX9V/5SQht7J/uhuLpheGE9f1SiWjRG8iyf01zfvvYSPfpZHcV9nTs9y
 7m9tJ9HD4SsHqILtsPwNs7Tnx4lHB/dX7EE4v+YLyKrXLSjsirVqm1e5NT5SonTzM0sI
 TLywvCQ3mKdk+zgGfAN3CtKiqxLeKcIvG7IDpi+aF+5SG7WmWTFYnBOGNbnOrVDFY0FK
 l3pQ==
X-Gm-Message-State: AOAM5336LHE4qevUTDlfHrHEgK1Ib9+VLzXIT8SalcP3H6WuNZLSK8gs
 LsRhIzQCI/ngpyyCqQJf4kpo
X-Google-Smtp-Source: ABdhPJwn8ZZ3Vko9jfDjEVdgsQIgjWmAgHZxLJB3qCJ/IroL6/2uU4WCwC0b9b9enVnZRNsno+6JbA==
X-Received: by 2002:a17:90a:1485:: with SMTP id
 k5mr24582282pja.103.1615210306421; 
 Mon, 08 Mar 2021 05:31:46 -0800 (PST)
Received: from thinkpad ([2409:4072:638a:aee8:50fe:f77:990e:395b])
 by smtp.gmail.com with ESMTPSA id i1sm10449641pfo.160.2021.03.08.05.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:31:45 -0800 (PST)
Date: Mon, 8 Mar 2021 19:01:34 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, robh+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Daniele.Palmas@telit.com, bjorn.andersson@linaro.org
Subject: Re: [PATCH v4 2/3] dt-bindings: mtd: Add a property to declare
 secure regions in NAND chips
Message-ID: <20210308133134.GC5457@thinkpad>
References: <20210308054447.28418-1-manivannan.sadhasivam@linaro.org>
 <20210308054447.28418-3-manivannan.sadhasivam@linaro.org>
 <20210308101059.08658fbe@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210308101059.08658fbe@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_133149_594509_0FD221DE 
X-CRM114-Status: GOOD (  25.97  )
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

On Mon, Mar 08, 2021 at 10:10:59AM +0100, Boris Brezillon wrote:
> On Mon,  8 Mar 2021 11:14:46 +0530
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> 
> > On a typical end product, a vendor may choose to secure some regions in
> > the NAND memory which are supposed to stay intact between FW upgrades.
> > The access to those regions will be blocked by a secure element like
> > Trustzone. So the normal world software like Linux kernel should not
> > touch these regions (including reading).
> > 
> > So let's add a property for declaring such secure regions so that the
> > drivers can skip touching them.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> > index d0e422f4b3e0..15a674bedca3 100644
> > --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> > @@ -143,6 +143,13 @@ patternProperties:
> >            Ready/Busy pins. Active state refers to the NAND ready state and
> >            should be set to GPIOD_ACTIVE_HIGH unless the signal is inverted.
> >  
> > +      secure-regions:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +        description:
> > +          Regions in the NAND chip which are protected using a secure element
> > +          like Trustzone. This property contains the start address and size of
> > +          the secure regions present.
> > +
> 
> Since you declare this as a generic property, I think it'd be simpler
> to do the check at the core level.
> 

Hmm, so have the parsing logic in qcom driver and check in core or both parsing
and check in core?

I don't think the first one makes sense.

Thanks,
Mani

> >      required:
> >        - reg
> >  
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
