Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E4DFC433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 05:33:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D62FA651D1
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 05:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D62FA651D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V/FbSxRQx/51rGjzH/mFBEF1NrZknfKsVCY9cZxEfkg=; b=oA9soYFFPZs+vboeEUAI3vl8r
	9ZxsWpZVEUrL7848TYwVvvhTh7celdizbXiAIKzUE7xj3HTjiBgLE9JNP4KHDj2gwxpbthwkT/IGL
	dxun8vMqvTlmsajCIFqxwXAJhXoOJpYzndel/CSoR5dKi9y0kk2kws/aoYo893YmLGneM/jm+b6lh
	zKTvmPEzQf+3p8rApSNTV9YP9U/67kEPcVLkGIB88M9I170n3Mseg7sY3wSRaw0p7yHBaEjk69J3H
	jvec7tFeKsBZ7QsCoOlxcX9wYU2V8NXcheDkM/S14HwDsRKf4/bJHGtENDNXkXiOpI2bmza0T7Bp9
	KttT0Z7gg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ8Uj-00FH41-Hq; Mon, 08 Mar 2021 05:31:53 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ8Uf-00FH3I-Tz
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 05:31:51 +0000
Received: by mail-pj1-x1032.google.com with SMTP id t9so2383541pjl.5
 for <linux-mtd@lists.infradead.org>; Sun, 07 Mar 2021 21:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6KPV3/KbWE2HuRXQZJZq+2hlPT8uhIFakoNQQIGrqls=;
 b=DX9cwjVgBK75Dkwx+YOKuf4B3lGYlteXC/BzinWqNppm9ZMjzbpTMH1Ivs0Tx9GMRF
 VkhMAIfLQSSE+lJJbbKVfzoqZQoHcNZlgLsAcR5ND6/iJoNKlJVe89V2b68fBwVRKf5C
 bKTfGm3C49XZbC/62uS5eLjx4lB8ZS1AMxEN2zxCKzvrh7mfTHOMfG+Uvm6IDVaFofES
 VU18HGQl6e36QdbqgbkP/F4lkbBJ4DC14nqHdDBBeL2i5VwD2GWYA5WKV5PTFKMu40Kk
 tK/MrA/zkvphtq4g4GcsEF7k0XNoxNA9khe9qiRxCKIHEtqEzcfDteHASfqDsU6FXqyj
 05CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6KPV3/KbWE2HuRXQZJZq+2hlPT8uhIFakoNQQIGrqls=;
 b=WrdRNsAK75rK9ZZ/CC+Lbpt8FqTjYRkIjLdQPI7SiZMjGdsWpfVsw6CkTODuCoJXP9
 PdprrSlgYV99tZSK4qzfS9AEVBxyP8IHmToOAvO9fb/DEPF9PeBKiynT3RlGL8jn163Z
 UGNkDGgWumkQ8xst6NNQEbf6zjAvH18DZSvhe4KzqcOi5n4Yquc+VsPZnJjuRLiZhrSD
 XWebUnrtmYKeYZ8YZswl9fu6x7wASxn64ICZ1zlI/jgzHL+st4Oy9bUZLoqHst35bSoi
 WvZdWVRrMVLihcDnGu0E1B+e+/fi/RAyqFiQDoKqnpC3MvDC6wLsMxwjQhRKK41PEIMa
 YrAA==
X-Gm-Message-State: AOAM530sr/U8zEtmG3Tod7Hc4EHK5iN6swhjYqQzQnW99mwJ4tBwh30D
 DS0G0ORe9TCdF1pcAuV3iifA
X-Google-Smtp-Source: ABdhPJx31x9DVwCjlrBofFQyrwjvdvqlfdUbyu2xgtdfmFEquErlvlidAh6xBqgbkgdBxd/xWYxDsg==
X-Received: by 2002:a17:90b:4008:: with SMTP id
 ie8mr22112177pjb.231.1615181507921; 
 Sun, 07 Mar 2021 21:31:47 -0800 (PST)
Received: from thinkpad ([2409:4072:6e84:fef9:1070:d306:6d0e:bf6b])
 by smtp.gmail.com with ESMTPSA id h13sm2411179pjv.52.2021.03.07.21.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 21:31:47 -0800 (PST)
Date: Mon, 8 Mar 2021 11:01:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com
Subject: Re: [PATCH 2/3] dt-bindings: mtd: Add a property to declare secure
 regions in Qcom NANDc
Message-ID: <20210308053140.GA5457@thinkpad>
References: <20210222120259.94465-1-manivannan.sadhasivam@linaro.org>
 <20210222120259.94465-3-manivannan.sadhasivam@linaro.org>
 <20210305233657.GA839767@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210305233657.GA839767@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_053150_196016_6F298E2C 
X-CRM114-Status: GOOD (  23.87  )
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

On Fri, Mar 05, 2021 at 05:36:57PM -0600, Rob Herring wrote:
> On Mon, Feb 22, 2021 at 05:32:58PM +0530, Manivannan Sadhasivam wrote:
> > On a typical end product, a vendor may choose to secure some regions in
> > the NAND memory which are supposed to stay intact between FW upgrades.
> > The access to those regions will be blocked by a secure element like
> > Trustzone. So the normal world software like Linux kernel should not
> > touch these regions (including reading).
> > 
> > So let's add a property for declaring such secure regions so that the
> > driver can skip touching them.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/mtd/qcom,nandc.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> > index 84ad7ff30121..7500e20da9c1 100644
> > --- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> > @@ -48,6 +48,13 @@ patternProperties:
> >          enum:
> >            - 512
> >  
> > +      qcom,secure-regions:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> 
> Don't you need 64-bit regions potentially? Though 4GB should be enough 
> for anyone.
> 

Yes, given the size of current NAND based systems around, I thought 32 bit is
enough.

> If more than one addr+size, then you need a matrix.
> 

Okay.

Thanks,
Mani

> > +        description:
> > +          Regions in the NAND memory which are protected using a secure element
> > +          like Trustzone. This property contains the start address and size of
> > +          the secure regions present (optional).
> > +
> >  allOf:
> >    - $ref: "nand-controller.yaml#"
> >  
> > -- 
> > 2.25.1
> > 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
