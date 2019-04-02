Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B776FC4360F
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 08:50:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C35E2070B
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 08:50:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kYt8O5VM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GwZkVh/L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C35E2070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4BZxMArBTJkT251ZCJG1P6kv5BsOwoKuN6HmBuiPqM=; b=kYt8O5VMwzr7ph
	fglDEON/mHmFjzyBBrOARKY1SNTsSCXaZAJL8Rct2UdZV4EdO7KxbJ4NHMLOLfZG3GThiwVTaAf/L
	8oWgVSCsg0hSLZQkrepM8WZA1PE7Uyf1gddXxKiHZZDfMz69V6Al+H2SZydoL5GXUl6RnNd/2lxSU
	7JYbNc7pVEmBKXTPmtzkuy8iFqff365zkHaRSdvsKeIJ+6Y7KbW8FS1Hp7ZiflOsE9fWVE3va8BnR
	+kn1BNCsDIBTdQmiA2DTnfvRD5NBfVC00Dl99sMxq9jDGv4/iUjvyUNNftjgt2uOlFhxhfq0Ns/Zj
	AOi2A8hAxEaqzE2cXQOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBF7P-0006F6-P9; Tue, 02 Apr 2019 08:50:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBF7D-0005lx-6p; Tue, 02 Apr 2019 08:49:56 +0000
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7FC5020883;
 Tue,  2 Apr 2019 08:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554194994;
 bh=ZuQIpkEHtkLBZH8hHJNbeVIwqekUJEUgZ8NIJNIKzME=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GwZkVh/LGEfYoYcdT0XzH33Vw17wLYNizfi5L71rWblwGiFZ3dBcPOzWZXWiqYMLe
 ig+AdIgU+1+iTJYLqcbtMOycadJUhFnQQiW4Lqy8p21kkVbj2trWOBqoGVVobeVLDI
 DWq3trkh7iHn/U78PeNj/9Zas5z5bddmEcG4pgl0=
Received: by mail-qt1-f178.google.com with SMTP id h39so14304266qte.2;
 Tue, 02 Apr 2019 01:49:54 -0700 (PDT)
X-Gm-Message-State: APjAAAXpXfH9/NKhx+OEizjMcq2IgcGSNKd9GfUfXMexrOfbPTks8dg3
 DRwedxYAV+uD1YZWk/ztghR2Hj+mxYJT+EGl2w==
X-Google-Smtp-Source: APXvYqx5/Y+vmwICqomrGv7FROIi3y5uF//ok8EB2LCLPDYAa8EzTTI+CkCQLSM06+OW25ZGn2EEBfx0UaW4+kY7FtI=
X-Received: by 2002:ac8:3f6f:: with SMTP id w44mr57338587qtk.59.1554194993721; 
 Tue, 02 Apr 2019 01:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <75ad3b89e4a6f8ad5bc414c3dccbb1f99361495a.1554153146.git-series.maxime.ripard@bootlin.com>
 <20190402101917.4f38b9a4@xps13>
In-Reply-To: <20190402101917.4f38b9a4@xps13>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 2 Apr 2019 03:49:41 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+yfng=wZtKuTdjbLHvz-+QGxG=EKkhH6JckpPNG_nFwQ@mail.gmail.com>
Message-ID: <CAL_Jsq+yfng=wZtKuTdjbLHvz-+QGxG=EKkhH6JckpPNG_nFwQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: mtd: Add YAML schemas for the generic
 NAND options
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_014955_271805_415554EE 
X-CRM114-Status: GOOD (  19.64  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Apr 2, 2019 at 3:19 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Maxime,
>
> Maxime Ripard <maxime.ripard@bootlin.com> wrote on Mon,  1 Apr 2019
> 23:13:53 +0200:
>
> > The NAND chips in MTD have a bunch of generic options that are needed in a
> > device tree. Add a YAML schemas for those.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 131 +++++++-
> >  1 file changed, 131 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/nand-controller.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> > new file mode 100644
> > index 000000000000..05b1afb34972
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> > @@ -0,0 +1,131 @@
> > +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NAND Chip and NAND Controller Generic Binding
> > +
> > +maintainers:
> > +  - Boris Brezillon <bbrezillon@kernel.org>
>
> Unfortunately Boris is leaving.
>
> > +  - Miquel Raynal <miquel.raynal@bootlin.com>
> > +  - Richard Weinberger <richard@nod.at>
>
> Is this really needed? There is already a section for that purpose in
> MAINTAINERS.

Yes, because MAINTAINERS is a kernel file and bindings are somewhat
independent. And I found most binding files don't have a maintainer
(other than me as default).

If we ever go to per subsystem/directory MAiNTAiNERS files, then we
can easily generate one from bindings for the kernel.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
