Return-Path: <SRS0=VDEF=3S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A8CC33CB2
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jan 2020 10:08:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B962820716
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jan 2020 10:08:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hbT/AK2s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="gRKcq4Mt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B962820716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sI+WZYCSKDVczZ1ktqCu0xcZFOjTI6u/2FwZ7ym6bXY=; b=hbT/AK2s/TFDRJ
	/9A00jZ1rAVkrg+XxEuSY6vb+4XG5BkQ+nYMYQLOD2e/i5BsKjxZmDMXE2riQXmtYnjXaAOVXQPta
	YGIAw8PMSrEzFFKsuS7RMIYbvdVklJAlAZ1fE8NU1EhwckTZ/AtKTgrGA3S+y05OY7hmVpGantomb
	G2PaHsLEGetgW/6Q243Je9pDVF1kQmlht9xHSNEpK2iHZBmdEmSZapK2sCKZB5l9c6nNTFgkFnY8g
	R14DoRIGRynrEqrFY6pUP81iTeTwlF82WJrs+BJn5/n2Ltky2iWR1SAGHbEosIACIF6RDf3d6/tq3
	IAgRiVFx70TpsDj2TGhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwkGR-0005G6-22; Wed, 29 Jan 2020 10:08:03 +0000
Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwkGN-0005AL-KA
 for linux-mtd@lists.infradead.org; Wed, 29 Jan 2020 10:08:01 +0000
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id 00TA7NrX026897
 for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2020 19:07:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 00TA7NrX026897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1580292444;
 bh=asGT5gvhVUjsXPA0Xqj1pjk/7V5+RsenU1Ws7cXf5Rs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gRKcq4MtPpT7WifrCx+vbmE/wwvbO3bkB/HuRG9AdoEobkc5LiG8ZOcXaWDfJ3OAT
 nXHJ8RKEO/u3vQsFzWumVZDM2U2/Ma5iOcqm1JAl161HXMuq3v+g8bhfiWQ7dLftBs
 QvTM2Yb9YVNlrlaaOuTR9lc4qRuKLE0Puj3af1a2Am69lN9sDkPv2MVw5py6woQLp6
 k6qqcrIRqU9vzmrZ2/v0WNvTtTlnTbwUWzf5cxyGz69fuZr9oehILgd5gmU8uI+/NO
 CNbHdh9jinyUvyyCjWLFvbBSQ79jXcEv+S48yr+dupaODY4ZllVhlNnziPLGI7Q5Wg
 38V9uK/v0KF4g==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id t12so10035167vso.13
 for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2020 02:07:23 -0800 (PST)
X-Gm-Message-State: APjAAAVUkGf4fBhXdv84dq50bpCbuUozNbuQund7LugH4cI1L11QC8ZU
 qmmzcQT2K+67SgqY225PgNdOvniIkiwOGFlmT0Q=
X-Google-Smtp-Source: APXvYqyjf8eKYGGkx4f79rSsMm3cz3WlcrN0fEaVvE2pcpNj6fJeFSJV9yyTyxsencLDobWKC44c83Dej0J5DrtIAQU=
X-Received: by 2002:a05:6102:48b:: with SMTP id
 n11mr16641316vsa.181.1580292442635; 
 Wed, 29 Jan 2020 02:07:22 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNAR0FemABUg5uN5fhy5LRsOm7n5GhmFVVHE8T57knDM9Ug@mail.gmail.com>
 <20200127153559.60a83e76@xps13> <20200127164554.34a21177@collabora.com>
 <20200127164755.29183962@xps13> <20200128075833.129902f6@collabora.com>
In-Reply-To: <20200128075833.129902f6@collabora.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 29 Jan 2020 19:06:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQyK+jy4pm5M5z58uD5Zdv95Day6C6D3Gwvpv2C4Vh53Q@mail.gmail.com>
Message-ID: <CAK7LNAQyK+jy4pm5M5z58uD5Zdv95Day6C6D3Gwvpv2C4Vh53Q@mail.gmail.com>
Subject: Re: How to handle write-protect pin of NAND device ?
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200129_020759_891375_3B0B8441 
X-CRM114-Status: GOOD (  30.79  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jan 28, 2020 at 3:58 PM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Mon, 27 Jan 2020 16:47:55 +0100
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> > Hi Hello,
> >
> > Boris Brezillon <boris.brezillon@collabora.com> wrote on Mon, 27 Jan
> > 2020 16:45:54 +0100:
> >
> > > On Mon, 27 Jan 2020 15:35:59 +0100
> > > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > >
> > > > Hi Masahiro,
> > > >
> > > > Masahiro Yamada <masahiroy@kernel.org> wrote on Mon, 27 Jan 2020
> > > > 21:55:25 +0900:
> > > >
> > > > > Hi.
> > > > >
> > > > > I have a question about the
> > > > > WP_n pin of a NAND chip.
> > > > >
> > > > >
> > > > > As far as I see, the NAND framework does not
> > > > > handle it.
> > > >
> > > > There is a nand_check_wp() which reads the status of the pin before
> > > > erasing/writing.
> > > >
> > > > >
> > > > > Instead, it is handled in a driver level.
> > > > > I see some DT-bindings that handle the WP_n pin.
> > > > >
> > > > > $ git grep wp -- Documentation/devicetree/bindings/mtd/
> > > > > Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt:-
> > > > > brcm,nand-has-wp          : Some versions of this IP include a
> > > > > write-protect
> > > >
> > > > Just checked: brcmnand de-assert WP when writing/erasing and asserts it
> > > > otherwise. IMHO this switching is useless.
> > > >
> > > > > Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt:-
> > > > > wp-gpios: GPIO specifier for the write protect pin.
> > > > > Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt:
> > > > >          wp-gpios = <&gpf 22 GPIO_ACTIVE_LOW>;
> > > > > Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt:-
> > > > > wp-gpios: GPIO specifier for the write protect pin.
> > > > > Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt:
> > > > >          wp-gpios = <&gpio TEGRA_GPIO(S, 0) GPIO_ACTIVE_LOW>;
> > > >
> > > > In both cases, the WP GPIO is unused in the code, just de-asserted at
> > > > boot time like what you do in the patch below.
> > > >
> > > > >
> > > > >
> > > > >
> > > > > I wrote a patch to avoid read-only issue in some cases:
> > > > > http://patchwork.ozlabs.org/patch/1229749/
> > > > >
> > > > > Generally speaking, we expect NAND devices
> > > > > are writable in Linux. So, I think my patch is OK.
> > > >
> > > > I think the patch is fine.
> > > >
> > > > >
> > > > >
> > > > > However, I asked this myself:
> > > > > Is there a useful case to assert the write protect
> > > > > pin in order to make the NAND chip really read-only?
> > > > > For example, the system recovery image is stored in
> > > > > a read-only device, and the write-protect pin is
> > > > > kept asserted to assure nobody accidentally corrupts it.
> > > >
> > > > It is very likely that the same device is used for RO and RW storage so
> > > > in most cases this is not possible. We already have squashfs which is
> > > > actually read-only at filesystem level, I'm not sure it is needed to
> > > > enforce this at a lower level... Anyway if there is actually a pin for
> > > > that, one might want to handle the pin directly as a GPIO, what do you
> > > > think?
> > >
> > > FWIW, I've always considered the WP pin as a way to protect against
> > > spurious destructive command emission, which is most likely to happen
> > > during transition phases (bootloader -> linux, linux -> kexeced-linux,
> > > platform reset, ..., or any other transition where the pin state might
> > > be undefined at some point). This being said, if you're worried about
> > > other sources of spurious cmds (say your bus is shared between
> > > different kind of memory devices, and the CS pin is unreliable), you
> > > might want to leave the NAND in a write-protected state de-asserting WP
> > > only when explicitly issuing a destructive command (program page, erase
> > > block).
> >
> > Ok so with this in mind, only the brcmnand driver does a useful use of
> > the WP output.
>
> Well, I'd just say that brcmnand is more paranoid, which is a good
> thing I guess, but that doesn't make other solutions useless, just less
> safe. We could probably flag operations as 'destructive' at the
> nand_operation level, so drivers can assert/de-assert the pin on a
> per-operation basis.

Sounds a good idea.

If it is supported in the NAND framework,
I will be happy to implement in the Denali NAND driver.

Thank you.


-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
