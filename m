Return-Path: <SRS0=kfRK=BG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D13C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2020 17:29:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A19C120714
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2020 17:29:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M5VZAQ4z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A19C120714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Sx7GeSQzt2x/KR5BDjXzyuTabhLt321v7+Wa2whP2tQ=; b=M5VZAQ4zRLB7OglM75rgKvXKb
	z2ASqA2esI5Jy16i1IbOuCAJTywSTb/mSt7tpiM/pmw74w9gOG+nEw7Rh60FRD6r/Ix2ZlzgqNwuF
	cUq3xpeCQdqyx6OXlrU/OEZRFJ+XnKBBt9/KcwQOOCVq2ESLDyeG0rJi+dG08XSikNbdXhUuvmFQA
	txwFZAQn/BK+sMiXXU8bcaqqS+HBjXkWGSneT3+aDZg85Iv+4/ahoUDJNDFCTHjLol92jOkSaH/Q4
	QVfcLn6mJTQ6RDhyJP/Eb2PurAddqPwyWoPotwYbn09wehS3uUFJZhhKGTFQh27SmUX9VNjWMH2lP
	5pHb223aw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k06w7-0007pc-CT; Mon, 27 Jul 2020 17:29:15 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k06w5-0007ns-0D
 for linux-mtd@lists.infradead.org; Mon, 27 Jul 2020 17:29:13 +0000
Received: from mail-qv1-f50.google.com ([209.85.219.50]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MrgcU-1kcnCN1Uoe-00nf5d for <linux-mtd@lists.infradead.org>; Mon, 27 Jul
 2020 19:29:11 +0200
Received: by mail-qv1-f50.google.com with SMTP id s15so3402919qvv.7
 for <linux-mtd@lists.infradead.org>; Mon, 27 Jul 2020 10:29:05 -0700 (PDT)
X-Gm-Message-State: AOAM5335tVBVB/cn1AB1FUb0CejdCa7SfKCsWlibbTApJDVV25KRDpUh
 yq6AZuOgFji1WHfptCDXgAlYKUKZqyOh7Rp2PZs=
X-Google-Smtp-Source: ABdhPJwHYsWXKrhNNBX9AEOv5Sdsb6KjcbZuv+0WO3CP9Kq043cRt3WR7NjDU7Z8EcYi1XY8MFGa51xQd9Do5CR2VNk=
X-Received: by 2002:ad4:44e5:: with SMTP id p5mr7056971qvt.197.1595870945046; 
 Mon, 27 Jul 2020 10:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAJKOXPc2w0QHQDEwqoeg9Nm361MszM4LRaCoJD2En-fPgPp+4Q@mail.gmail.com>
 <IBDZDQ.K28R5FAI0BXI2@crapouillou.net> <20200724155436.GA7460@kozik-lap>
 <K5Y0EQ.WYAK00ADM46F3@crapouillou.net>
 <CAK8P3a0HDu15u5dREd6gk_e9D6mrZ9JqT0DJs9AeC9C2602nAw@mail.gmail.com>
 <20200726160616.GA2662@kozik-lap> <RO33EQ.546WD84D5N7K2@crapouillou.net>
 <20200726161545.GA6058@kozik-lap> <B243EQ.VEXGA7ZL5JAE2@crapouillou.net>
 <CAK8P3a1r6AMz2wKBEosAqn7qkuJY4LGFYK7o85sO++d+TSVOgQ@mail.gmail.com>
 <20200727170302.GA3507@kozik-lap>
In-Reply-To: <20200727170302.GA3507@kozik-lap>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 27 Jul 2020 19:28:48 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3zM4M2y1shVnUYCArZxxf9FHbOkVCK0yAK8wbfQTVChg@mail.gmail.com>
Message-ID: <CAK8P3a3zM4M2y1shVnUYCArZxxf9FHbOkVCK0yAK8wbfQTVChg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: ingenic: Limit MTD_NAND_JZ4780 to
 architecture only
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:l6cBI7wQJ8AKZxwWwovXpzwCRbAjwGGnxHnL/pSlFa0My3kzbrr
 nGl2DLPzwW13o0c02H0/gHU+qfUeIHaU5cPt84vSPOFrPgNNH8Kt7J9mmn529FyQ0SOrQ4n
 54EZrqyea+Czh1798tbZ+E9OY3mjefN15cI+AsBizHSfTUhEf4uNXEE7VO0GOVdM0CEmh4J
 AM37ZK8uHpGvaKO9t/5Pg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+QOUfnDgnPc=:J2yEB0roJCbo9xE9WiJazk
 cLRr5YDrlntJa00k2KzI3csM7/UT4b+xYxJ8meVg9c2BiYljjtuixBnUqRlduDJnFngIQ1rwn
 57FBnXn7UGi3jxlAHOv0OdeQ6m/IKO2VT3jiAwO7YpoUxMyCGs9gOCoisrN5iO2GzHCihNcqB
 n8+w0gQaD3r0msTu3cfP2yY9WP9+8hVhNTvlg5TcoeS17WjENyGtO9ZQOJLHxyWWVnG5rWCcy
 5gGoS3V0oV91a2TPommmeuuB8ydf2JVJdsI1WSC0hwPxDgf8eiFmIrBgy9gX5BKoAJBtFIpfJ
 xDPEsq1wJlq7wv6jFbKxbDt4hV7EJrM0iMEJb5tF/CnIdXAu1+7iHZeaKvEXkD+aWGbFxI4yB
 XpoWlHWt/83TYhzqmT0eOIqZ/M0OD0isyP4JV4VYJdw5e9SV0v3A2rup1qCKgm+L30LS32mrd
 yuxNeDeqxYHyc0UOxWQZSKTJgM0iPL4xphjjfcqJpAXf0fBTAslWoRXvv++yhQwq2spHFM3/9
 jtRezTqdqjE8A3akHonOor+9QG+g2qTsXa/2D+hkNtDXV0NRukKltZB6VqNd9wlShbpQHN0xH
 Tp0ak/rD6OtXq3cfGInI1noUz8T0YApd5JrgKCTM5quE/JXoCOUHw+stsiWVx8ITUBEGTX4kQ
 u2vmPhaMch8dY5gEY3vwyikOLS56visSqynip9MPjlHwtwJsguGySicn3kmcG6wwIXpk2i5aI
 VI6uHHgss/e1DFSSqZ3pN+Bs/1odBir6541qC5nSOB0qEet/OaeVOH6g8DGDkGMFp4dIxBoah
 l27YO1wuFhNSCEUf8Qk3qfRjd2m1NU3y2TdtqVEQDjqDwukcGCZY6zwfVFgL+uRozCHlC74CW
 MXLQf3VV9RRBWx5YAGAvWo1Wl5X2hBisvFD8rTmfzbG0qqieJXsJ8d1rV5HTje5k9oCIa1NfO
 KvdY2lvZZclNeAW1u+GDrP9CYRo/8n6B+gRyKaNbQZA6NxjuloLg4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_132913_259188_65BC1A7B 
X-CRM114-Status: GOOD (  20.96  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jul 27, 2020 at 7:03 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Mon, Jul 27, 2020 at 09:55:54AM +0200, Arnd Bergmann wrote:
> >
> > The way we do it on Arm, the machine Kconfig identifiers stay around
> > even for multiplatform targets (which now make up basically actively
> > maintained machines).
> >
> > I don't think it makes any sense for a driver to depend on MIPS_GENERIC:
> > either it is a generic driver that should always be visible or it is specific
> > to a set of SoCs and should depend on some corresponding vendor
> > specific identifiers.
>
> If support for Ingenic is provided also by MIPS_GENERIC (without
> selecting MACH_INGENIC), then it makes sense. This would be just a
> different way than ARM of building multi-platform kernel.

Yes, it would work just as well, my point was just that it is somewhat
confusing to have every architecture do it differently, and that I
prefer the way Arm (and also ppc, x86 etc) handles it today.

On MIPS, most platforms are not yet part of MIPS_GENERIC, so
they are fairly free to pick whatever method works best and is
consistent with the rest of the kernel.

      Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
