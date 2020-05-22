Return-Path: <SRS0=/JSY=7E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA24DC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 13:22:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DC7420679
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 13:22:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gW8ZxHPz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DC7420679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nvV4/tw7f/wOGxXL9SLlbtUjJV6RL16xVdrDcT0zPHs=; b=gW8ZxHPz13fTMv
	ZRwAzg5IFQxzh5MU+gsIcU9YS5dXw3SWYsvbdrXXZbmigQxnvzz2a5DVLNIq3dS07TuycXana8jng
	hLTrqroZkKpQ37uQQXTjsxXGZUWnlBSK0BWBfSFiXshyb5VWyEBDMdacRNo/q01mRD4XZjcJXWPjc
	r8KhoIr8UCD145pCNmApHbvtz/tCAgD+K27S0hzqa+TVuizXtxX9sQmHqmrVIxTzcsia3QsUGA7Uk
	S/pMk+X0rhDMyQQ7pvPy/fFaXwFQn3WpyevIKXQKQ8vMrXwz+J97Wq++vFaiZYzRoQjBYuKNKX2s+
	bt31YgTrlWX0L08iNNkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc7dI-000257-U6; Fri, 22 May 2020 13:22:40 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc7dG-00024X-2v; Fri, 22 May 2020 13:22:39 +0000
Received: from mail-qk1-f176.google.com ([209.85.222.176]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mlvr3-1jAnMy1k83-00j45p; Fri, 22 May 2020 15:22:31 +0200
Received: by mail-qk1-f176.google.com with SMTP id g185so10609309qke.7;
 Fri, 22 May 2020 06:22:31 -0700 (PDT)
X-Gm-Message-State: AOAM532kFUkzVxdxXutSr5cRdvl8lIOfYx7Z7ZC1MC7Z0y/Ei22gl8+y
 t2EMcN4EaOz0PdSl9tO5NQ8+LzgEM5sISM5gJP4=
X-Google-Smtp-Source: ABdhPJxhnlG5KCUbhs9s5v3bwa/HT0C7ENLgIwsfSWwbs1luda3nkNB7pXQbPW3nAVV/zeWXF3QLzRH5hBefOaAU2uw=
X-Received: by 2002:a37:bc7:: with SMTP id 190mr14741809qkl.286.1590153750128; 
 Fri, 22 May 2020 06:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200520102125.8934-1-robert.jarzmik@free.fr>
 <CAK8P3a2+auSWBROZR-hobM_qSWtKiG1DRYP3Y7uvbCy_ZLy+gg@mail.gmail.com>
 <20200521071213.GI1118872@kernel.org>
 <CAK8P3a2XdG_u6_o2NbQDTb5dbdzByBkUXZNM6nZ3wz0c-LFT5w@mail.gmail.com>
 <20200521190158.GL1118872@kernel.org> <20200521211016.3ad62148@collabora.com>
 <20200522131818.3adbac78@xps13>
 <CAK8P3a2Z-UxktGn+_aBVaaBTStT7f177V2ED2RfVCQS8QDBamg@mail.gmail.com>
 <20200522151750.369dd4d9@xps13>
In-Reply-To: <20200522151750.369dd4d9@xps13>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 22 May 2020 15:22:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0twq9Uc5B8FrobLt7fzssXGtJb-nafAH49uur_idZTaQ@mail.gmail.com>
Message-ID: <CAK8P3a0twq9Uc5B8FrobLt7fzssXGtJb-nafAH49uur_idZTaQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: pxa: remove Compulab pxa2xx boards
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-Provags-ID: V03:K1:V+QL+QBbLHM6GP+60YtKdpiA47SoyKVlnLzmhJMnVgwCh7KqUht
 wrqXf1Uc1TBg8ZRnJXSa8uAeVl1duIZcuvGz8ZpBpTlcuEl2EgLeMV9jwtssVgUl8cbjVJd
 HyTWWHWd/ZlQrRWJk1oN+JWrytAb97Wo2uYEdDuIThBONtDjgMZIo/UVVG6RfCcF3gaNMva
 iy4FFAzHylNb/cyjNIQGA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:h/Iq43bJUyU=:BN45geNsyye57epcnXIgOV
 I9+49/HWW49qnzYcp1+HbMK0Iss7xlMHBZdqWNX7DY/jShoTa1jscobeWU5IudhoTeIat8CTq
 K7GuSIhpjnnoYvKTumcaJ2XThfrwNW+ouyTPxVaAjoX0sjq+jEW7iI8C+7F6DoDhCGMYEQquq
 snHFooJIiNJlqUtJ1dAiFONoO9cu/BDihPk8Kmav9UuVgA9xd2I8HqoKhxS/zkD8F+FGB1S9e
 PpgmnY1kXz2bRAOXzRZfzExJoGEA9PBk7mDqhPRaweyuc8rrvHrWAXliGUs7KVMsiMmym+xx6
 nPyW1pt0NhSqzZZSRMs4hIi5VpxWETvLmX2T6pZoOTsjDORiWD58PLRl65kgneVYtNeyvo/JQ
 EqXJx4gBrrAMwogESjNTXck+RhrHEKD9ApV5LMsHGuBTx5SM4XFhZOyH0P7Psf+aZT6gNOcok
 2asYgyhTEg63TYsJNpnq9AoqGRgSilfsvHm0BQv51VUlTPIJdEV/CZXcVR/wWMw2uyyQda/Ok
 KFBX9GIS406fGBJkpF0ttdhpK2dMHaR+XKd4pZ9660vUW2Eiy7qu9GnRiw+MAwt41ApWtqn2Q
 aMySQKrEjBmN4f/kcD8Uehnbqj3axu59qi90TFuuHgUFkvIH8jkjgKx2yL3ufgD9hWfQ/YjSD
 GeBcpsu7nWJ4X3pp9k+USbRA3TIPZPUTfHdgQBOpovqliVL/dwsi1jGKO8b4K+z7+xZesMF/H
 WYQqxDbeqYhD22frpS+umP/FeqvDIeEePDAF71/rNthXkF3P8yCqMX5l2e8qzkAt1KUBI/mzd
 qYf04adD5jiHkb4l+goIXBbyn/WfNdflBwbWNxsCCDem/hPKGU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_062238_423944_8FEAA38D 
X-CRM114-Status: GOOD (  17.82  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, May 22, 2020 at 3:17 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> Arnd Bergmann <arnd@arndb.de> wrote on Fri, 22 May 2020 15:14:43 +0200:
>
> > On Fri, May 22, 2020 at 1:18 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > > Boris Brezillon <boris.brezillon@collabora.com> wrote on Thu, 21 May

> > > Actually I was about the merge this patch in the MTD tree because I
> > > have a big cleanup series which depends on it. Arnd could you confirm
> > > that it's okay for you?
> >
> > Yes, that sounds good. I assume the patch is basically identical to the one
> > that Mike just sent, right? If there are changes to arch/arm, I guess those can
> > be dropped now as I'm merging Robert's patches to remove those board
> > files.
> >
> >       Arnd
>
> Here is the diffstat:
>
>  drivers/mtd/nand/raw/Kconfig       |   4 -
>  drivers/mtd/nand/raw/Makefile      |   1 -
>  drivers/mtd/nand/raw/cmx270_nand.c | 236 -----------------------------
>  3 files changed, 241 deletions(-)
>  delete mode 100644 drivers/mtd/nand/raw/cmx270_nand.c
>
> So it should be fine.

Agreed, please apply it.

     Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
