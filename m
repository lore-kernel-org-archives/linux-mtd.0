Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD07C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 22:20:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C0032077B
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 22:20:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FsE2yM3n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C0032077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/EA6LPny04tquOjZEc2p3iCWsruROUQhpiFpZd652q0=; b=FsE2yM3n3QXq0+
	KFravf6Ls2TNHtlpHVY3RHgF5o/q02DC/hn5ayhqieXwwzaIgLoOaQNwslkD5HC0PzFfhLWUKExJO
	sLTx7bZTo48gAsKQjmblFnIol33WXedxGLWhm7oJtZ/IfG44JDPEwa36YOCwEYQoGn7DU8fWBQypO
	IihCX+M5Qtq1NVRyfgLe1b0m14pK4+YwP8QrvORe5yAXp1MAEfmh6L8po7LEPo2PVVtVlTV9Tjkvn
	UrY+DxGTShRhiQiE1RETf+wuNe4nhem7HsFEjoy05jZJOPgm13Xrmg0cKNQGpvLmCEDgYivljsEMD
	NzsxUuB09LuubEGlTnMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipg9t-0005U7-HU; Thu, 09 Jan 2020 22:20:05 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipg9q-000527-6l
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 22:20:03 +0000
Received: from mail-qk1-f173.google.com ([209.85.222.173]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MGR3r-1iutEG44Q1-00GtOJ for <linux-mtd@lists.infradead.org>; Thu, 09 Jan
 2020 23:19:58 +0100
Received: by mail-qk1-f173.google.com with SMTP id j9so140686qkk.1
 for <linux-mtd@lists.infradead.org>; Thu, 09 Jan 2020 14:19:57 -0800 (PST)
X-Gm-Message-State: APjAAAWWHVzA6HYJ2CnAizuGv9KxlfetnTnrlUtGUyOYL7GgeeHv/L/F
 Syfsxz7gb9VZJ0A5mzM6N65tur10JL3PFHvmV88=
X-Google-Smtp-Source: APXvYqyT8y2PQRDEVJJy8s5BknNwJ1sBDnC3Pl/5gE07byX63pRmUHqBZ8Pq5Y6k/CRVXUZbJKuYf7bI8G/0FQ1vGb4=
X-Received: by 2002:a37:84a:: with SMTP id 71mr146826qki.138.1578608396826;
 Thu, 09 Jan 2020 14:19:56 -0800 (PST)
MIME-Version: 1.0
References: <20191210200014.949529-1-arnd@arndb.de>
 <20200109202110.2af111dc@xps13>
In-Reply-To: <20200109202110.2af111dc@xps13>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 9 Jan 2020 23:19:40 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1mKOt+LMiECJn8uvgbwPkA+DNR9=cJGjKmhsgRP+p9+w@mail.gmail.com>
Message-ID: <CAK8P3a1mKOt+LMiECJn8uvgbwPkA+DNR9=cJGjKmhsgRP+p9+w@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: cadence: fix address space mixup
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-Provags-ID: V03:K1:6uA+pzuIpW+gk12r9vVkAon9DIzVhEuNbHK8aoMnpCHia3N+ozh
 ehSRubaXFMeWu6VJSY77+fmvwUPoBwZxjZtek2tmWU/ZiFDNP9b51ArKLW1myMTAFu1K76E
 7adBj8afWP3YVRCXI/Rt8aWNn9RDJtaO9G8c4gnOKq1umoEjLts6VAWKLkfi33TZjvkLxBT
 leibbLl9TO9gjGeMYpudA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9DcOtPMwou0=:iQN+DwubwvLOp8bx02lq3e
 Kwn0TCmKF0iNru30UQXsUdypE+nsvFRlQH8+xV6EFOXBWKp/RhsKm/UVG0RSQO+Yxz6vAx3f1
 6jkRMYjnfTzf5cBAKptNwjGwBbujh01B2jE2KJgqR2S3VrnZ0YujbGIheR2HBeoNvK35kq6ok
 T2Cvq57VJey2lPuK7nRGdfVDMfhS2Q5NlJjjJov5sPYbr048eh6gHKtLXiOxZvc6swlrC3OEV
 3AwaUdUxeBCCKn3TWsnJNsUZmyBEcjZiYQ/i6EXPcKDkkkvfZtriS6mq2RVrspYOmpNdiPgc2
 bmRVqICTKP6/LCIoZZoQEcQCc8q7pVj0f1SY73k+L/9DOdgXqJq2sn+LQvPyFKMSFQM5YU0zW
 5nsRp3q4K8lJ1sWdVw1rh4HZW4FvVTIEGtywZ+CXVJLraKeqUoauOzB3SXcTa8vnftCI7tCTP
 oJcqlT8miDBke5Ngz+TYFIz+k5V7FpCgKlWf5DdmeYnj0BR/wDVgSahHTGJ73YsOc7jVfHP1R
 d5p+pI8RSzRtjmtq+E+DO7VCEOcIfYC2TvppvRR+v1qYcIAW2vBOjlzth6fp9fYGO2mZXiUj9
 y1enLT7wkNuF3VzO7Mf++31c4R+uF812+W9x3xH4We0dKg5RYCQNZOjow2vjsXzfKb8Fv0pop
 FVutLALCmRY/zD973+zV3Nw+As+G43STFJbHA9nBrRWRcykYzIxIn5B75M5qjINn8OhwF+CM8
 canQjX2f1JycoqPG9pmx9rEueyK/UxqgG+v2HYAX0Ctk44aAQoQNDkI2Y/bqrNef91yh/OeAW
 1WrSR3E3gpi2mmQ7LXwddyHD12r2EJ8xlUeUIm+2ALDgy/kpm02oELBJJudHnjnMmXLnM0SPZ
 XerXTez+LCQDhTViT6HQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_142002_600362_F718C7BC 
X-CRM114-Status: GOOD (  13.50  )
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
Cc: kbuild test robot <lkp@intel.com>, Richard Weinberger <richard@nod.at>,
 YueHaibing <yuehaibing@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Julia Lawall <julia.lawall@lip6.fr>, linux-mtd <linux-mtd@lists.infradead.org>,
 Piotr Sroka <piotrs@cadence.com>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jan 9, 2020 at 8:21 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Arnd,
>
> Arnd Bergmann <arnd@arndb.de> wrote on Tue, 10 Dec 2019 20:59:55 +0100:
>
> > dma_addr_t and pointers can are not interchangeable, and can
> > be different sizes:
> >
> > drivers/mtd/nand/raw/cadence-nand-controller.c: In function 'cadence_nand_cdma_transfer':
> > drivers/mtd/nand/raw/cadence-nand-controller.c:1283:12: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
> >             (void *)dma_buf, (void *)dma_ctrl_dat,
> >             ^
> > drivers/mtd/nand/raw/cadence-nand-controller.c:1283:29: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
> >             (void *)dma_buf, (void *)dma_ctrl_dat,
> >                              ^
> >
> > Use dma_addr_t consistently here, which cleans up a couple of casts
> > as a side-effect.
> >
> > Fixes: ec4ba01e894d ("mtd: rawnand: Add new Cadence NAND driver to MTD subsystem")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> I just realized that I received three patches for the same issue in a
> very tight timeframe about a month ago, yours was of course entirely
> valid but I choose to apply the one from someone not contributing a lot
> to encourage him, hope you don't mind :)

Sounds good to me, thanks for getting it fixed

      Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
