Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2348DC48BCF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 11:34:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E304761364
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 11:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E304761364
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ge2LQnpqCqJVuSCW75ooGJzao9eO7zszCQMKxmB4QCc=; b=DMp3zXs9MALvJT
	mgxeZupmczhAFrU/PLtgyyturWU0KuG+SRAN3GaKuPdK4UpqwsvZzm1+sNmisq/aD6lrdmfaNomZy
	vGl4gncDkshbHBUxfvypYep2z7n11RcfeurNGNyp6j0t0/X79roywXxVxcbqCP4mUchVtjk3Ay2Gg
	WYf1y4o1AGF5qNJFM86aiLiICIylsfwOevgy2G+Zm74UWqZeKMkysIm0wognAXOHm0e54ayFZqRNx
	NoE4og96Oex75BYYK2TJ12mPNGjBsRXp3Kv+T4B8QR3Cn3R4o0BVzqIoEzgwHhkuyofvSN6a8qJtp
	NWiD1jSRAemsrPyfJsNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqwSd-00DM2k-HW; Wed, 09 Jun 2021 11:33:28 +0000
Received: from mail-lf1-f46.google.com ([209.85.167.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqwHe-00DI2q-6L
 for linux-mtd@lists.infradead.org; Wed, 09 Jun 2021 11:22:07 +0000
Received: by mail-lf1-f46.google.com with SMTP id p7so3356760lfg.4
 for <linux-mtd@lists.infradead.org>; Wed, 09 Jun 2021 04:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1elVfwOvcaESeQvZLqDrd8CapZfzhuucwYU0NEEL3IM=;
 b=zQXh4epnqeNGF/Zt/INy2VLEzNDzcix9fmozTSqK9HrE16nO6LEo0dyozC25DpLjhC
 NQeUL3TatwEp6kFzwvHqWDGGz8ZbWMlRQjEjjoxZFHCGfqtUSgqf85rqWCX2N02VrbOu
 tYjHUt6xdh2BQz1leRLw4KXmOh3nCrANlF3sbFciCAsi7GqR8gckNryRjQEv6vyv8xhI
 OuFWMAXtVN67ZoOtCjP0QMtIqg559UJe9U6d/YRZyuLeZ9yxWY1S53llTCalL79rwwN/
 X9znF/pIhlRhZuHFZUMjUy+Hz7uq7MQppJGqcRaNQUZbK5srBMLIdyJsK0QP4wxK2DKA
 1Xuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1elVfwOvcaESeQvZLqDrd8CapZfzhuucwYU0NEEL3IM=;
 b=pcOVprt2iPQssHFFDZhc4BeN0/2R9c8uhntJmUiUeTOo7YvwUgsA9YARGQ4LvFh0gT
 Q6zyADPrj9LnhV6hA2g05dTFcnpzQGSKEv4Pa4DPsGZ9agjHEcc/ZzmF0m2/ZlsyMj9t
 0u29S2lSisyNax7CX5/gJlv/ihN/9ikYgpximJW0/arrk385D32HNcnyPy3ZVdgCZn5G
 CqIVuDFEt1o7c7vzTrNAwOCqPJPUkThmP5Os1wEKb8nBe58VlFHQMBqYk1rqvq5JAB3z
 G1bSZncdqliZdyvkvAegVwTtefVLCxIVq0bijpWA5zhwkARlu2it55MiK+zg+vZ6xPLZ
 9XJA==
X-Gm-Message-State: AOAM533l2Yu3Qj1ARiFhPMZhD8gFhy3HZJQdwwZkqPPSdK/SpXIZKfP4
 kbdb4ii/HGHnpUY1zJb+GDN94Mc6WWANrdtdHY12bQ==
X-Google-Smtp-Source: ABdhPJxjRNYZa7CArMuSR057imgElswJ0539mWpU00VB+QbDL43HR/W/KXcMY10hVWytT/G6HYIvfW5d9J8On6evxRg=
X-Received: by 2002:a05:6512:3241:: with SMTP id
 c1mr19407580lfr.29.1623237664559; 
 Wed, 09 Jun 2021 04:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210607193500.3085920-1-robh@kernel.org>
In-Reply-To: <20210607193500.3085920-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Jun 2021 13:20:53 +0200
Message-ID: <CACRpkdaghKYiU9AgyEd3arFHiNEq-9+Xo8z4hxUxHFqrJM7n6w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: Convert mtd-physmap to DT schema
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_042206_277756_B827589C 
X-CRM114-Status: GOOD (  11.68  )
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

On Mon, Jun 7, 2021 at 9:35 PM Rob Herring <robh@kernel.org> wrote:

> Convert the mtd-physmap binding to DT schema format. The arm-versatile,
> cypress,hyperflash and intel,ixp4xx-flash are all just an additional
> compatible string, so they are all merged into the main schema.
>
> There doesn't appear to be any users nor support for 'vendor-id' and
> 'device-id', so these have been dropped.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Very nice, thanks for doing this!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
