Return-Path: <SRS0=wiZC=WP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F45C3A5A0
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2019 19:22:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FF8E206C1
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2019 19:22:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UV1Gambl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0PqPUCX/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FF8E206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W6tBXgBFQyXZu0sO8FgN9mHsFB6RVEuQK0CJrAQC7k0=; b=UV1GamblemCyV/
	x+8kQn+GEkg7Xlc7MS4OdOMznMzDAaPZdSm2/+F6L7x5B649R2BPj0ME+fwJ4k4yubwJlncX3Fezh
	GOhS50z/8HICN2MXHZ8kerX3hYrLnJgiGeM+xnznf8YBCjcf6Q/aTd9N+786eX6DAC052z7JrYvnK
	QVQIXgNk53dETte7eiftVIxPtZgEVe5UwF4829d5/FM/uVkm7aTGKvo3xQS2MfefL6tRiAAtRvCN/
	CwTD/VRwxAMLqQu6cxrZYtkloj+gdhr7h7h2i/HQFlqqNuRGHezvgoToF4Er0/pEQN1zXMaCqv0u7
	TIZe2rJE0Tr03iY01F9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hznE7-0006nO-KD; Mon, 19 Aug 2019 19:21:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hznE3-0006mz-Pd
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2019 19:21:56 +0000
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D0F522CF8
 for <linux-mtd@lists.infradead.org>; Mon, 19 Aug 2019 19:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566242515;
 bh=ZnqWddNa7Rz+t2BiSJ6GxPgyyCMa9QmktYNfzRHXveI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=0PqPUCX/5rAahyjp2+wMnTU1KMuIi8N50pI0o/yTankh4WaSJSUlDPThE5a477H98
 hTjg3Bvg+xEew88kmWrNPeCarrrBCk+dfQOyYTMAj9ei5FQG+k8TxyhVbcaf3N779h
 cw9VGm314vA31G7Dx3Ir5T0E5gOEhDp6J56Kk/yU=
Received: by mail-qt1-f174.google.com with SMTP id v38so3190369qtb.0
 for <linux-mtd@lists.infradead.org>; Mon, 19 Aug 2019 12:21:55 -0700 (PDT)
X-Gm-Message-State: APjAAAWksdtkqoPvkMllNQWHOVtmvfoH/+KIbi90pu2uzn7rrbQGOHHz
 qd37gB9GnqlYil/SVk70K0eUfjo5GC3H5GPyaw==
X-Google-Smtp-Source: APXvYqx9XuvRiV2Apgg4lwgIvKoE2Nklh9cbFOgdE0XW6cxtwo8T75kyR2R5r1nXiQF1fSxb2DxbmmBvu5nb+yGMf2Q=
X-Received: by 2002:ac8:368a:: with SMTP id a10mr22391797qtc.143.1566242514433; 
 Mon, 19 Aug 2019 12:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <1566199149-5669-1-git-send-email-masonccyang@mxic.com.tw>
 <1566199149-5669-3-git-send-email-masonccyang@mxic.com.tw>
In-Reply-To: <1566199149-5669-3-git-send-email-masonccyang@mxic.com.tw>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 19 Aug 2019 14:21:43 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJB7JgSTcp9oVhnqxp7Xq4P1wj_sxggN-r7RXd8pOQ2xQ@mail.gmail.com>
Message-ID: <CAL_JsqJB7JgSTcp9oVhnqxp7Xq4P1wj_sxggN-r7RXd8pOQ2xQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] dt-bindings: mtd: Document Macronix raw NAND
 controller bindings
To: Mason Yang <masonccyang@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190819_122155_857325_63893D16 
X-CRM114-Status: GOOD (  11.40  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 anders.roxell@linaro.org, Vignesh R <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stefan Agner <stefan@agner.ch>, Paul Cercueil <paul@crapouillou.net>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>,
 Paul Burton <paul.burton@mips.com>, Liang Yang <liang.yang@amlogic.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Lee Jones <lee.jones@linaro.org>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 19, 2019 at 1:55 AM Mason Yang <masonccyang@mxic.com.tw> wrote:
>
> Document the bindings used by the Macronix raw NAND controller.
>
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> ---
>  .../devicetree/bindings/mtd/mxic-nand.txt          | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mxic-nand.txt

I would ask for this to use DT schema, but given it is v7 already:

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
