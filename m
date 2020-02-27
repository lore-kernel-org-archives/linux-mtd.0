Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 158B7C3F34B
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 13:45:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D602520726
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 13:45:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p7VrtpLE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="n4oGvOmw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D602520726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DhQUB9p4RUp9MJAJ9jDqAPyDgOY1p2+uSSJztAMXr5U=; b=p7VrtpLEiMvHHj
	AsZzr5AmV2Zkc6yE+yqmlaf40VKaQNkY/sCwhqAQAIt2RT3FMVLmOgycjEIqR4s7h++XF3lQ1hcHL
	AWW1xv2JP+w5PY/DMPiqE2jUBq3pOrvtshx9EhTfJ+2ipyWXIE/EU58Yj7/EmaGSJUsZ1mtZeeRF/
	lr5c8+RpS5uQQE2AsVcT6b0+UEnrg7n20q+bKPcYauiOp/Q+yfbk391aG1nngDYUbrKk6hxi6Ca/c
	Q6lVSXq1dY8V0LzEIikdc09wVhibSM3dVnot4FLpZfoudut6TQ5AK/AKh+s3BCSS8pUCvqPaPrc57
	/IdjW3Lizg707+efh/kw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7JT9-00026z-Dr; Thu, 27 Feb 2020 13:44:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7JT0-0001zA-PC
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 13:44:44 +0000
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4106E246AE
 for <linux-mtd@lists.infradead.org>; Thu, 27 Feb 2020 13:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582811082;
 bh=UFk4DKDT/RavUVjsZH/Q78QOV9roAST50YZBqSmnO2Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=n4oGvOmwC99Lmi5J+GMCuRBByRgoeP0UELiYzDqyAxyrgXLKSlmUYurL8CUziHp/g
 7oaLvWk/URj2xARQ6zQr+kZDgtfUmsR6JI5EdXIHj8BGK8DP7xIFiJSs4q8Y1xjmtp
 Bqpeh4X7pTULE1qoDzvp+wnP0IKWvL/BlppoM/dc=
Received: by mail-qk1-f178.google.com with SMTP id z19so3125644qkj.5
 for <linux-mtd@lists.infradead.org>; Thu, 27 Feb 2020 05:44:42 -0800 (PST)
X-Gm-Message-State: APjAAAWgjVpUS0sKVhq30+bJYHBkeDZQ0IVpHYPkU2XKxGnzlKXyaRo4
 6YMis3Jn4x+l1GiyDvd1WcxW5UwGd53+jRgHtA==
X-Google-Smtp-Source: APXvYqxJt8vQFSvhhMBaDRNc9+rWFwZOnJGWrPvzbGPu2EaTUhy2OiKjS2GBDVr9kzPAE6HvyHbvr3auJoAsonMv+HE=
X-Received: by 2002:a05:620a:1237:: with SMTP id
 v23mr5784092qkj.223.1582811081310; 
 Thu, 27 Feb 2020 05:44:41 -0800 (PST)
MIME-Version: 1.0
References: <20200222141927.3868-1-yamada.masahiro@socionext.com>
 <CAK7LNAQmzYzK_A4iF6b-LxTT-o5Ut2=TyBeRQPSfCdj7FHhgBQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQmzYzK_A4iF6b-LxTT-o5Ut2=TyBeRQPSfCdj7FHhgBQ@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 27 Feb 2020 07:44:29 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ1Je+Tmwrb2vX=0c+FKSk19qKFWg1Au=k35AZKL=R1Pg@mail.gmail.com>
Message-ID: <CAL_JsqJ1Je+Tmwrb2vX=0c+FKSk19qKFWg1Au=k35AZKL=R1Pg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: Convert Denali NAND controller to
 json-schema
To: Masahiro Yamada <yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_054442_834098_52676E22 
X-CRM114-Status: GOOD (  18.48  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Feb 26, 2020 at 7:59 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Hi Rob,
>
>
> This was applied, but I just noticed one stupid mistake.
>
>
>
> On Sat, Feb 22, 2020 at 11:20 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > Convert the Denali NAND controller binding to DT schema format.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> >  .../devicetree/bindings/mtd/denali,nand.yaml  | 149 ++++++++++++++++++
> >  .../devicetree/bindings/mtd/denali-nand.txt   |  61 -------
> >  2 files changed, 149 insertions(+), 61 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/denali,nand.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/mtd/denali-nand.txt
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/denali,nand.yaml b/Documentation/devicetree/bindings/mtd/denali,nand.yaml
> > new file mode 100644
> > index 000000000000..b41b7e4bfe78
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/denali,nand.yaml
> > @@ -0,0 +1,149 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mtd/denali,nand.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Denali NAND controller
> > +
> > +maintainers:
> > +  - Masahiro Yamada <yamada.masahiro@socionext.com>
> > +
> > +properties:
> > +  compatible:
> > +    description: version 2.91, 3.1, 3.1.1, respectively
>
>
> Please delete this description.
>
> This is a copy-paste mistake, which
> came from my other patch
> "dt-bindings: mmc: Convert UniPhier SD controller to json-schema"

Done.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
