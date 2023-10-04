Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F524E7C4DB
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Oct 2023 16:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sasyoaUydfy9ij5Fvc78orDEnlQVJyHnPLRsjE8wkMc=; b=VFhMuvcsU5HLA9
	z7pvj27I6BXm8uCTFIJAd+9qkFRdT3H6VASguqZke34dpndJJwJQMzj2J+t/XbMVUZ6mUVrcc4XNl
	YByHKXhjmNJcR+dozzinMPXJ54Hm2Z3V7Q3XEJLhajO/m/zLNhPkcmGaouq03BhLPb4cgIMBpCeUf
	7o3rlrodF/zraegQSTzBcgkMX85qlBt2SpoJDvnECcLIFpowfOhIrfSJvhfpQSyapJ6yYmH8EUn3Z
	GBriy5BiWhFAdDKyH4iQS1zF8skBrXKfteuJ3xPa1IIIlz+GQ0/9Z9Ltm2YPJM3Z7ACzLmyh6Ys44
	sSdshMMUsJpImfnG95Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo4O8-000Qzj-2x;
	Wed, 04 Oct 2023 16:06:16 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo4O6-000Qxc-0X
	for linux-mtd@lists.infradead.org;
	Wed, 04 Oct 2023 16:06:15 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-523100882f2so3953907a12.2
        for <linux-mtd@lists.infradead.org>; Wed, 04 Oct 2023 09:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696435571; x=1697040371; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pen+iO+M2gIPTh3d/Qy4b5+52uIYKXLIWWiVeTqgDBs=;
        b=mCYHmDjsI3wWlWAGUC22VjHeqnuN46p3IMy9J93eS/Sd60CR2K3O1f55dqSVqe7wF/
         87tdg3Yb6P0Dqu6MH66jVA3wre9enhRDkcPuu6/m2BXaZlxxHycPXgyB+xGUdT5799bv
         qjxNs6Bu+Isn16mSUZSClaEcYDVe+cs5xPF1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696435571; x=1697040371;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pen+iO+M2gIPTh3d/Qy4b5+52uIYKXLIWWiVeTqgDBs=;
        b=foS+67D5nyMUIhSH6Uf0C6cxujQY0LMh3VD49oIYbAdO43MqYS/vZ5twVPfoYcgOSM
         vlWQaSomHdDW3HCHuTa9ywhzPwMcCoSQZOIJQM4R0ehPLYvMI1YP5vPT+gjbD1T+y+g5
         t7FRL9OnDZ9ygPRddwHynREqabmQSxkSm5j3kA227rtA7gDUu5wLRLJDxrGpvoqVKnp0
         +fVNutboSaUGo2ASbSQ1/HhsLBkOfJFynZWDLoAThyU2qM9qYsBebZhSlPjvRAmK/ifq
         fvyb6v4JncrbOmVRkDgW2SGClnQaQihsH36kXdyUIwrjSl+onZFXPd7JnLXEtD+wpAVn
         ELvw==
X-Gm-Message-State: AOJu0Yy7TP4mHi2GbtocNhd1qMWd1rCXOwgfxxsl9TAiXBLnL91S4C33
	uYpptbn766IUPMi5Ue2UvFnzKa8n8hlERuVCwalfAw==
X-Google-Smtp-Source: AGHT+IGC+HjXrGlVggpLaITJAvjTLO3ivScXGdLTl7cSIhhUny2iwKVgBzqzdOgwmGmUkk091aGpHrbJD3kXd8yip/Q=
X-Received: by 2002:a17:907:7613:b0:9ae:55ae:587f with SMTP id
 jx19-20020a170907761300b009ae55ae587fmr2416199ejc.37.1696435570826; Wed, 04
 Oct 2023 09:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <20231004093620.2b1d6917@xps-13> <20231004113458.531124-1-mwalle@kernel.org>
In-Reply-To: <20231004113458.531124-1-mwalle@kernel.org>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Oct 2023 10:05:59 -0600
Message-ID: <CAPnjgZ2hWE6Sc=rg55W=-r-TnoWP7Y5gSpn41kwoyja-AMVw+w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: fixed-partitions: Add binman compatible
To: Michael Walle <mwalle@kernel.org>
Cc: miquel.raynal@bootlin.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, ptyadav@amazon.de, rafal@milecki.pl, 
	richard@nod.at, robh+dt@kernel.org, robh@kernel.org, trini@konsulko.com, 
	u-boot@lists.denx.de, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_090614_210736_5ED61CEB 
X-CRM114-Status: GOOD (  26.52  )
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

Hi Michael,

On Wed, 4 Oct 2023 at 05:35, Michael Walle <mwalle@kernel.org> wrote:
>
> Hi,
>
> >> Add a compatible string for binman, so we can extend fixed-partitions
> >> in various ways.
> >
> > I've been thinking at the proper way to describe the binman partitions.
> > I am wondering if we should really extend the fixed-partitions
> > schema. This description is really basic and kind of supposed to remain
> > like that. Instead, I wonder if we should not just keep the binman
> > compatible alone, like many others already. This way it would be very clear
> > what is expected and allowed in both cases. I am thinking about
> > something like that:
> >
> >       Documentation/devicetree/bindings/mtd/partitions/brcm,bcm4908-partitions.yaml
> >
> > this file is also referenced there (but this patch does the same, which
> > is what I'd expect):
> >
> >       Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
> >
> > I'll let the binding maintainers judge whether they think it's
> > relevant, it's not a strong opposition.
>
> What is the overall goal here? To replace the current binman node which is
> usually contained in the -u-boot.dtsi files? If one is using binman to
> create an image, is it expected that one needs to adapt the DT in linux?
> Or will it still be a seperate -u-boot.dtsi? > Because in the latter case
> I see that there will be conflicts because you have to overwrite the
> flash node. Or will it be a seperate node with all the information
> duplicated?

The goal is simply to have a full binding for firmware layout, such
that firmware images can be created, examined and updated. The
-u-boot.dtsi files are a stopgap while we sort out a real binding.
They should eventually go away.

>
> Maybe (a more complete) example would be helpful.

Can you please be a bit more specific? What is missing from the example?

Regards,
Simon

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
