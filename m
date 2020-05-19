Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C00DC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 08:27:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0C1920709
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 08:27:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mN5QmmBg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ok8D520l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0C1920709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uK/+cgRhtPoTpfFbF4miKzaEedAavgOKER922QtnssQ=; b=mN5QmmBgZ2MmsQ
	LGWwDQcYsI8RZIMzS11kbg3jVlQgP1yAf9N7w7CAcksyJ/KG2OKJWcThiFxQd4Xh/5R3yTitu3eTe
	t0IiWiwLuUFxvGNlPdEjsrhW1u/dxdtwGuLE55hiMUJwg3ey2E6LXHiASoFo/KMUcDt22cYvi+w3o
	Q9v90WiLpERIJWJjvEkBjUGorcaCoSETKALAnSUJLobSS7POLPylVmKJWN5vRbyqJZ77QzWv3gKZ9
	TcNvU+kT5TLOlPU8bEnBfHJrMXOXWqwe/slhtMD14/wC76eOgsgdAywpuNL3JdVUse3+mwYoJEOmF
	g2pbvrBIVptZeNu/FzPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaxaS-0001vt-ER; Tue, 19 May 2020 08:26:56 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaxaP-0001uo-EX
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 08:26:54 +0000
Received: by mail-qk1-x742.google.com with SMTP id y22so13845741qki.3
 for <linux-mtd@lists.infradead.org>; Tue, 19 May 2020 01:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mhMQZWg1pZCDpzS4WQU/mgYpG86rpDRUHsX26JcW/Z8=;
 b=ok8D520lGjncFUrVo4zv1FrWZHZZgrDX/6hRgaeN4veYDko1YMNM1UQY9yR3VD+LMT
 5uOEiAwJVW64jbUPhEEqh7Z0QXzscIV87PbBJDXlaoQyh9ZQI5kKaVnovgGgXo7tbyHZ
 ZtQVXaRKDAzAvVha21YdN4+KRxbEbKcoAEBmH6qyaHCvrmpN5An8lwemtjt+H4xyvoly
 pQ31NEQ5MLSQ2Zg9FhPmsvXF9IacgJkAF4Qs9lvC9FuKvEBB/VSQH3rGsXUBGRSSVwZh
 Ai53LR7qevoaOgZpaN2bcMboXpjHQYZ5N/m442SUNPVkP0V8GgMGcmvYFitpdSD7DRnI
 0/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mhMQZWg1pZCDpzS4WQU/mgYpG86rpDRUHsX26JcW/Z8=;
 b=tc2qeKhUlqHA+Isp2S4wZnLWJnJYa88T1IE0XUudbg7AUiic3QGvv5Wb+lK3bUhGDG
 JzBz3dV8b2b+Ysso/6qLTiIM8Hf5iWG71Rix4cKbKhL91qvLL6iP8/w/e6LiRukWGMt9
 NniLnDubxZ8kvjCodL3VKdT+2RkjwkssH3FYdUO3gx6EBM5uH7tcE2GqbjsQ46Im+yNX
 R+otxQfvpb+pOPPZoVMaM3jRldbaQuIXadYjtdcO6QHzniUeW65b0sqSSRKpHbJOoIiO
 R+sjCAmzoJ8kZ3IvoQFbP1m+3ktVpnv0xB++e0idW4w+T8A0AVgs6NqHM2qaIIN2jydZ
 CdFQ==
X-Gm-Message-State: AOAM533yQdSAVMWqxMvspHWrsG7v0lVwvG75JhLiYn2tv5DRTXjRG66N
 ntuJZYJYZoPk+CfCVbvI5Lq26Azxw7c3ri236pA=
X-Google-Smtp-Source: ABdhPJzPCaVyZbcye/H+Kda8o2N2ulYqcfk5cLzzJIhka2wdjBSqmYfJdxc5tg5VWkzQo9xCyqKVqomGY/QYy+lJtf0=
X-Received: by 2002:a37:7105:: with SMTP id m5mr20541969qkc.370.1589876812015; 
 Tue, 19 May 2020 01:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200502204137.37134-1-kdasu.kdev@gmail.com>
 <f0e781e6-a7ac-37be-13c3-885eb65a0921@gmail.com>
In-Reply-To: <f0e781e6-a7ac-37be-13c3-885eb65a0921@gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 19 May 2020 10:26:41 +0200
Message-ID: <CAFLxGvzFHzcMnWx35mzvMrj=Y1CxGDAb+3YXNbYCOnyMDEXc2A@mail.gmail.com>
Subject: Re: [Patch] mtd:rawnand: brcmnand: Fix PM resume crash
To: Florian Fainelli <f.fainelli@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_012653_504913_F554BFA4 
X-CRM114-Status: GOOD (  10.54  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, May 2, 2020 at 10:52 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
>
>
> On 5/2/2020 1:41 PM, Kamal Dasu wrote:
> > This change fixes crash observed on PM resume. This bug
> > was introduced in the change made for flash-edu support.
> >
> > Fixes: a5d53ad26a8b ("mtd: rawnand: brcmnand: Add support for flash-edu for dma transfers")
> >
> > Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> --
> Florian

Applied for fixes, thanks!

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
