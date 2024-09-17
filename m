Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFED1CAC58F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2024 17:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CrAsNQ2J5cP3TfwCAZFo4wZQfev2sYtsr1WVAD29bsc=; b=f+oDS/9t/r3yBo
	EojRtqDsT9s/UsNte8XZ9AEEo367W3VPpf1eq2Xwxo/9BzSzKo25pa97j2MlV6CxqrXDHNG5m1PTQ
	iuKxgXw3Nbo6wZWFaEEze5vDbzSK300wEckL7maRZCej65DR6vtzs6AigKDZwfz6sRlZTFzfw63fK
	2pg65Unybr++NmnPb4VCdIrYHMEIFG9RaVcGHr6TjCfn0AGj1vI6NPzOYX4QoiW5BAf/qRVZUJVBd
	/7OY/ovlxG+gb9VWasXcU33hlSz3POGq3Q95OV9goRnghe63FJP3ZJuYdjNuoezexOu3uBJJadFT6
	DfW7zR4tIOuYNgrK/Hqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqbjy-00000006ZZy-1P1G;
	Tue, 17 Sep 2024 17:11:50 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqbjv-00000006ZZI-08LE
	for linux-mtd@lists.infradead.org;
	Tue, 17 Sep 2024 17:11:48 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-53661ac5ba1so6108713e87.2
        for <linux-mtd@lists.infradead.org>; Tue, 17 Sep 2024 10:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726593105; x=1727197905; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hog72szpbcL8yTpsTavAS2Iy/j4igbX51PMgLnhSTu8=;
        b=IGo21rf/YpwspimhRvxsmM1MJ7YzS3cCwiTnmRpvb6UDH68lNHtYNyxDZgmn+5AChM
         glSxV+jh52ZE11ODbPN08I1p1XlvJeln0dQ4EXgph66ZAnuV6cZgny/57rVJ+R4Q03mI
         eld9TesxqIz0ZHgab1Il2eGYr9YZvOYg6wjhtJOngc8mSf/f1o3K+AVvDv7GhWanBog4
         wTP/eE/VpBF3wEaBqNCvRPkD/2okOV7a1Sc7HVUspsQSRYSBFGTp4zb0jQ8k1tTg0Amb
         sbxZYRRg62YBQvTNEWunkUkfDHGZN9sojjCv0LX9UclN+1C7F2/41wcuYM3n1WiBk8QX
         plNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726593105; x=1727197905;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hog72szpbcL8yTpsTavAS2Iy/j4igbX51PMgLnhSTu8=;
        b=ALGTjkEeSAg9/F9F7Am+/NAu+8k4wUWI5S9h0PLQBUbq266aKiGSAuoJqcFF1m2UAA
         tvuT7gUkjNErgSNFh28dk+FEaifx3Gm6e1xurHX21BBmg/uFK5sbzowNcM5nhMdTAijx
         JRspnVwoLmQOtjJ+tYs75j0N4vlXbpkoeL+uT62Io1aY1uOqAOFqb0zPpyywbjFPvQcG
         nhDlpn5dbPBeeEceMo5lEaX/OoW2BigiJ7xFQYS/asHC1xI+hE8JhE7ytNx5CeWdgrE3
         cIivyv72n2+SeDgRDzhfTrtre+e4jYwxTMHHqAvEsz18B3t7IHh2MgRPogcBtkt7X1c7
         Hwrw==
X-Forwarded-Encrypted: i=1; AJvYcCV/YSSiTgzBdWgZLsU5zKYuMYkDvh3hr2WJvKNix9LVigbOV9P/W4jiwYLtBRneztLKga2/4wxqAcc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyI4JHIDovV//P95UqrnbhkOv9VnvF+sWnzrZB3hBE8dl0bWOOj
	WO/4LMQnNdEnzaW3y+iZBi9swDBA+N+UuUH0RnZa4o3w59MPHCS+7xTf6JI/QwdQka5sPGTpyIN
	rGbH8SSgPH4zb1oXTJ5DirvWV1w==
X-Google-Smtp-Source: AGHT+IEG1JAQrUiK4lsLr7UsmqM4zC/fV3ngtm8n9NhSvVhCx0F0+RZCQqwayMWioWesSUM7H3D2Pj8ZAa90UpX9750=
X-Received: by 2002:a05:6512:1154:b0:535:6a4d:ed74 with SMTP id
 2adb3069b0e04-53678ff2ec8mr11166979e87.51.1726593104166; Tue, 17 Sep 2024
 10:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240917094956.437078-1-erezgeva@nwtime.org> <20240917094956.437078-4-erezgeva@nwtime.org>
 <9c273945-5a70-408e-a9da-a0797aa6d935@kernel.org> <CANeKEMN+ZUAGKGsqnaToDB3AxX9NN_JeCBWHwd-wwnTWLU3R+g@mail.gmail.com>
 <64ef46b1-7908-4b15-866d-9cabe2e5dc9e@kernel.org>
In-Reply-To: <64ef46b1-7908-4b15-866d-9cabe2e5dc9e@kernel.org>
From: Erez <erezgeva2@gmail.com>
Date: Tue, 17 Sep 2024 19:11:07 +0200
Message-ID: <CANeKEMPwgtECfksgz6jXkR+bjVFwCB9DOh1q7t_3WeojReqxbA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: mtd: spi-nor: add OTP parameters
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Esben Haabendal <esben@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_101147_092986_DBA5A41F 
X-CRM114-Status: GOOD (  23.24  )
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

On Tue, 17 Sept 2024 at 19:00, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 17/09/2024 12:42, Erez wrote:
> > On Tue, 17 Sept 2024 at 12:36, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On 17/09/2024 11:49, Erez Geva wrote:
> >>> From: Erez Geva <ErezGeva2@gmail.com>
> >>>
> >>> Some flash devices need OTP parameters in device tree.
> >>> As we can not deduce the parameters based on JEDEC ID or SFDP.
> >>>
> >>> Signed-off-by: Erez Geva <ErezGeva2@gmail.com>
> >>> ---
> >>>  .../bindings/mtd/jedec,spi-nor.yaml           | 37 +++++++++++++++++++
> >>>  1 file changed, 37 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> >>> index 6e3afb42926e..d502b7fab2ce 100644
> >>> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> >>> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> >>> @@ -90,6 +90,43 @@ properties:
> >>>        the SRWD bit while writing the status register. WP# signal hard strapped to GND
> >>>        can be a valid use case.
> >>>
> >>> +  opt_n_regions:
> >>
> >> No underscores, but hyphens.
> >
> > I'll fix this.
> >
> >>
> >>> +    type: u32
> >>
> >> It does not look like you tested the bindings, at least after quick
> >> look. Please run `make dt_binding_check` (see
> >
> > I run "make dt_binding_check" on kernel 6.6.
>
> Yeah, we are no on kernel 6.6. You can run it also on kernel v4.1 -
> still does not matter.
>
> Don't develop on ancient code because then you ask us to review same
> broken stuff we already fixed.

I test with Beaglebone black for testing, it is difficult to run the
last vanille version.
I did backport the spi-nor driver.
As for "make dt_binding_check" on last kernel, it need to upgrade the tools,
 and I did not think it could change that much.

The patches themself are based on vanile kernel
commit 6b0f8db921abf0520081d779876d3a41069dab95 (origin/master)
Merge: 6b4aa469f049 f50733b45d86
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue Aug 13 16:10:32 2024 -0700


Erez





>
> Best regards,
> Krzysztof
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
