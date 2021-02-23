Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80667C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 17:46:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46B8464E83
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 17:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46B8464E83
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mR+FGp2u+3GJIyrbGyPXR27DxfKuczDJRDMQEcqocUU=; b=I91fMeo2mXEK0GTRUqeGfnUyR
	P28zW316SpBxxDinWVy1w13Taq0BzkApjTFqoHLTLV+z5R8UMDUxWZE7iOoCBLSnbWsrk8OQGSriW
	8pnOBskVVGf6lKWZVpaKtx7w5XGoHtRnb5k1OZ18Zk52onJhFbKsyvh7Zo637ujRkss3FE0UPuwMk
	UVznMGCCeW8wJVFrNS7gVYNX8amUgn5fMDgP+UDF2Y9av2JgE8rJYihaB7HUm3/gxOT7SuOAypV5G
	Q4uvYGMfJ4YcRk3WJEvZf1xifu5YgBivWo47gf0MQoiJ9BiHZAiLRf2kashTnEQqRYYv7A8rleKgK
	Wd11YRTbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEbkz-0002FZ-9S; Tue, 23 Feb 2021 17:45:57 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEbkv-0002Di-Qu
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2021 17:45:55 +0000
Received: by mail-pf1-x42d.google.com with SMTP id b145so9257724pfb.4
 for <linux-mtd@lists.infradead.org>; Tue, 23 Feb 2021 09:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=VyGG3ok5+hvim2EHZCOhmqRAJkjtLpgTA1iWhCaD6x0=;
 b=FqgAcuUSeyzDfUyHurWW7F4mjvfwNy68igadpk1ez352+ZeNULvxkGYibJLLplgkO5
 q3u1ZNHMEqO2G5UraZTEoq5G/0cXD6Bnt5aCjqvctqqn4Nfj2xY5vtamgJs6kBcBLxvh
 uvGOoGECAvPXZIkB4fJeawVGE/r0GSiUVcwab4GfCDNrmlsmC5Rv1CW6dkG0OdIsUu7Q
 9IkjFszTrePyCmHnq2SDyrQgYzgucohC2ZtZY1g0k6Ac4t+QygwV9rNtekYPvicm7dOb
 /hIptnnmW77v/TTchOjx20VRMTFiQv5CkrQqtuZN0ZsOI0TvimfyuQmyWemfDy4eriyz
 CkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=VyGG3ok5+hvim2EHZCOhmqRAJkjtLpgTA1iWhCaD6x0=;
 b=mTugrIHPdu3QQ2WLt72JLcigf3gCtd3peJv1Q6mI8RBA/bSeT1wF0wcgfZHVjWLpk2
 0pHOX4CtlKxCYJGRVULkCTGKsAw7hRRn7FYK0PrACwdjHJ3qNAEj6AKErG6vdewJaX4L
 D2cpV503tObt1y+gezq8blljogcmfY4og0O1ieLQpMQXU4bJA3pZxWThew4GwLtGuwI6
 mMjmE9tizEjzumUoJNVmRGM3En4mp21628DpzE1GlXkgLOtlyJqBX84u3Xof54+dd4wJ
 q9iEqRFuHbcG5UC4+hwk/0VY6cl4kJtJJmS7jinJObESzaCpovfHfDq5mT+6oKBrAZSA
 WqnQ==
X-Gm-Message-State: AOAM532/zgSrY7/xadPFbCa5zid2Nodm9ExC0NwDZw3kdxVuZLIyekXD
 0X8TqGiFIAusnZlilsr8jc84cS8JmJvn
X-Google-Smtp-Source: ABdhPJzA7fHOoHjX3O7xgr26Ckw+I6nd4J989A7PeyvQ1mbO3Fz+HGL78AX7076LEi4TPjBHYyTQLQ==
X-Received: by 2002:a65:654e:: with SMTP id a14mr25432204pgw.265.1614102351464; 
 Tue, 23 Feb 2021 09:45:51 -0800 (PST)
Received: from work ([103.66.79.25])
 by smtp.gmail.com with ESMTPSA id s27sm117050pgk.77.2021.02.23.09.45.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Feb 2021 09:45:50 -0800 (PST)
Date: Tue, 23 Feb 2021 23:15:46 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/3] dt-bindings: mtd: Add a property to declare secure
 regions in Qcom NANDc
Message-ID: <20210223174546.GA27945@work>
References: <20210222120259.94465-1-manivannan.sadhasivam@linaro.org>
 <20210222120259.94465-3-manivannan.sadhasivam@linaro.org>
 <20210223174922.052f9776@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210223174922.052f9776@xps13>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_124554_183368_68F38156 
X-CRM114-Status: GOOD (  29.06  )
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
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Tue, Feb 23, 2021 at 05:49:22PM +0100, Miquel Raynal wrote:
> Hi Manivannan,
> =

> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote on Mon,
> 22 Feb 2021 17:32:58 +0530:
> =

> > On a typical end product, a vendor may choose to secure some regions in
> > the NAND memory which are supposed to stay intact between FW upgrades.
> > The access to those regions will be blocked by a secure element like
> > Trustzone. So the normal world software like Linux kernel should not
> > touch these regions (including reading).
> > =

> > So let's add a property for declaring such secure regions so that the
> > driver can skip touching them.
> > =

> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/mtd/qcom,nandc.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > =

> > diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Do=
cumentation/devicetree/bindings/mtd/qcom,nandc.yaml
> > index 84ad7ff30121..7500e20da9c1 100644
> > --- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> > @@ -48,6 +48,13 @@ patternProperties:
> >          enum:
> >            - 512
> >  =

> > +      qcom,secure-regions:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        description:
> > +          Regions in the NAND memory which are protected using a secur=
e element
> > +          like Trustzone. This property contains the start address and=
 size of
> > +          the secure regions present (optional).
> =

> What does this "(optional)" means? If you mean the property is optional
> then it should be described accordingly in the yaml file, or am I
> missing something?
> =


IIUC, if a property is not listed under "required" section then it is
optional. But I've added the quote here to just make it explicit.

> I wonder if it wouldn't be better to make this a NAND chip node
> property. I don't think a qcom prefix is needed as potentially many
> other SoCs might have the same "feature".
> =

> I'm fine adding support for it in the qcom driver only though.
> =


Hmm, sounds good to me.

Thanks,
Mani

> > +
> >  allOf:
> >    - $ref: "nand-controller.yaml#"
> >  =

> =

> Thanks,
> Miqu=E8l

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
