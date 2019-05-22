Return-Path: <SRS0=Q6Kj=TW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116CAC282CE
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 13:56:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9DD621473
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 13:56:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kZIJ/+lw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="duF47EnJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9DD621473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MLqpS0dqG8MEbWdzGWBSIXTikvQLZHuyCqb0LxxLkno=; b=kZIJ/+lw/8wcRe
	ihQytnAAwyPAn1FnH9nnrgigGUroFPLt57jeWTEVeDPUkI+rtsKn5ENBpmnJW/VpP3B0dRZ7LwSRT
	R5FAlod+KOwK3tFKpyL24jmmvSMsX9VzQAadt5hN9NKYYr8vkxPQJd0Yq68SGFwlKe0XkwkBs+WBL
	yCywdsaVz0McbA3bNNf6ipbQd9TaVV/9u9WVGjBHNoJlkZX1srdwv8vBF5ZYdwWo5Vb1OC6TQrFvJ
	JY72bCpIjqj/GMiNPunLiByg3BY6jO+eWeSJGAS1Unm/DA6QVJ8uHcRpVFos5KVluCFJ76zLmbUc7
	balnSGC4GqDRWe1nnnOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTRj5-0003Ia-Qb; Wed, 22 May 2019 13:56:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTRiw-00039B-9d; Wed, 22 May 2019 13:56:07 +0000
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A03B421851;
 Wed, 22 May 2019 13:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558533365;
 bh=CpWRPFDFDeEz2FasTJpU7xC9m9MJZ5sBPRt83HEYgfo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=duF47EnJ1olpUVNwqtjHV8UOkB/JftPjhDIWWr5H4ZMBt7IDtYQ1C/3BKouXzaL0v
 f3jygMikKv5/BWPNiA3P92IWbjeorOYEupad+Hlhua/d6y7btM+ZP6HzFBgM/1PR/F
 gF+k03o4CdD3kYEN6+YfFHKpbwJPIm2lkyOB1Qxs=
Received: by mail-qk1-f172.google.com with SMTP id m18so1497083qki.8;
 Wed, 22 May 2019 06:56:05 -0700 (PDT)
X-Gm-Message-State: APjAAAXRNr35U3ambEnRM0/3jzwGCY3LQGNaOPavRdtYCox++gWT7KR/
 hQZiuydN5SQsiTIVL6doojhkBPD8MHR7tTRqdw==
X-Google-Smtp-Source: APXvYqzvt+EFGiFr6y2zsSRBs4qOUs7e+/z+bJpZu4CMkQbtQjvYCr7ioBnDYS6ibBsbagsPUO0sVjALMvR6IRu+67E=
X-Received: by 2002:a37:dc03:: with SMTP id v3mr70538862qki.151.1558533364775; 
 Wed, 22 May 2019 06:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <1558466890-45471-1-git-send-email-kdasu.kdev@gmail.com>
 <CAL_JsqKd53W1E33YdtJwagi4=7DrVQ5+N3rSY=Rxo5J0RiW46g@mail.gmail.com>
In-Reply-To: <CAL_JsqKd53W1E33YdtJwagi4=7DrVQ5+N3rSY=Rxo5J0RiW46g@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 22 May 2019 08:55:53 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ+zNQ3CeBh8K=oBiZZsiBQ8w1w=6vs8zOQeqUf_qhqcg@mail.gmail.com>
Message-ID: <CAL_JsqJ+zNQ3CeBh8K=oBiZZsiBQ8w1w=6vs8zOQeqUf_qhqcg@mail.gmail.com>
Subject: Re: [PATCH] dt: bindings: mtd: replace references to nand.txt with
 nand-controller.yaml
To: Kamal Dasu <kdasu.kdev@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_065606_357307_AF239461 
X-CRM114-Status: GOOD (  13.04  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Mans Rullgard <mans@mansr.com>,
 Lucas Stach <dev@lynxeye.de>, Vignesh Raghavendra <vigneshr@ti.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stefan Agner <stefan@agner.ch>,
 David Brown <david.brown@linaro.org>, Liang Yang <liang.yang@amlogic.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Richard Weinberger <richard@nod.at>,
 Jonathan Hunter <jonathanh@nvidia.com>, Marek Vasut <marek.vasut@gmail.com>,
 Andy Gross <agross@kernel.org>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-oxnas@groups.io,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, May 22, 2019 at 8:19 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Tue, May 21, 2019 at 2:28 PM Kamal Dasu <kdasu.kdev@gmail.com> wrote:
> >
> > nand-controller.yaml replaced nand.txt however the references to it were
> > not updated. This change updates these references wherever it appears in
> > bindings documentation.
> >
> > Fixes: 212e49693592 ("dt-bindings: mtd: Add YAML schemas for the generic NAND options")
> >
> > Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
>
> Mauro already sent a similar patch.

Actually, Mauro's patch missed a bunch of cases that aren't full
paths, so I'll take this one.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
