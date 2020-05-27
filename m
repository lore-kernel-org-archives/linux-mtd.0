Return-Path: <SRS0=kTjQ=7J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D4EC433E1
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 14:38:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BD90207D8
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 14:38:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c0wUATXi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BD90207D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3i9+lkQIiiKmLjumKWe79npNUls3kANPhMoSNaWr3U=; b=c0wUATXi999O+y
	UciBAZMdynhmC/muc/fyLZgWHW/N0aAix8iiHNGjMsCUQ4SPS9i17dtvJ0bm0zVW1OEzRsCEZXIHE
	kGT35MUOhCqPrs97L873IvKWRQBZTkC1Xc+z7Dy1o2WzRCybDIKgtJ3iPsnuRbdRr6d7dKOzwvc2X
	Pwf/Z+osNmCQnN0UDgu5TOKV6vCRZGMj1wWLcJLOXZnPNbtwWbZZvYTp+hYSFvCZVVh7jjP2s8Dbi
	cnX6VYhfQH+POtfBzbrlZXpCoij9DLlv9vlRFKoTf/AV1NkROW/E1o04BMeQnNOpYxi2ZW9TgTt2L
	Dqivt0+7ZLMs4r9PUNjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdxBw-0007Sx-Rh; Wed, 27 May 2020 14:38:00 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdxBt-0007SB-QF
 for linux-mtd@lists.infradead.org; Wed, 27 May 2020 14:37:59 +0000
Received: from mail-qv1-f48.google.com ([209.85.219.48]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N18MG-1itEMq1rCs-012bL0 for <linux-mtd@lists.infradead.org>; Wed, 27 May
 2020 16:37:54 +0200
Received: by mail-qv1-f48.google.com with SMTP id p4so11213494qvr.10
 for <linux-mtd@lists.infradead.org>; Wed, 27 May 2020 07:37:52 -0700 (PDT)
X-Gm-Message-State: AOAM531R+9ydbWbSu7XifkYY8Y70ve/kG0mvw+QPIg+Vhtnwi+OdlDDJ
 wVpH+OChXtEEDI0GHoRlWfGcl0/TTsybvOFY10s=
X-Google-Smtp-Source: ABdhPJyr//A2QIA6/VozIoK3hiWlXU4CoTxPNHDB40HBdX5R7LVfN9VrEtLqLnwnDTFroCXlHhy1X69ousiROtCYm50=
X-Received: by 2002:a05:6214:370:: with SMTP id
 t16mr25364732qvu.197.1590590270488; 
 Wed, 27 May 2020 07:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200527134210.847411-1-arnd@arndb.de>
 <20200527155304.0cf42848@xps13>
In-Reply-To: <20200527155304.0cf42848@xps13>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 27 May 2020 16:37:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2DKqO_LUCTpyRrow_9i5OudMdedjczbydrq+hC_CERmg@mail.gmail.com>
Message-ID: <CAK8P3a2DKqO_LUCTpyRrow_9i5OudMdedjczbydrq+hC_CERmg@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: arasan: select CONFIG_BCH
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-Provags-ID: V03:K1:knEhahCoCj0Lurm6JwArjLQSUn0YAo+lmOwopOlv7cPcLsOU9+a
 fOWgjRKzNWx5Y65NVmqDxV8NeOseGT5saGUweMNUupdsVMLWfNHyKkqFAJBO8lGY0ZI18pF
 qCem4MIIhbsbC2pyge2HwBhY+nmFZzVCWHrwaKD3JH+xM2a5eeuuT/Z5L70WI+rQ3KVSKYQ
 aIRn+xHZZnR2A0cRbohfw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:p/r0z2FMmUo=:g9oX8azksOzEko2ohkdTAO
 HhuJb760dJPrLmHOUca0rgdxMNjQ+Vv8QVGEfeF3g+c215bRC1jrVKa7F4g70ehFtTI/qNRG9
 bRJINM2AlB2m702KOtHagP7sBJ3pKEIZsrPuCCmmw4IXTPw1eFk8l7SuNi6gSum2mnlS35McC
 P9boFs28v0Ffu3JWjbdoQq3G1yNwS/xSTJIXv9F+DiHaGpJnhzwmPB1QgupiePsSLi+I/+acc
 Gs8mA6hzO/TpXB5013aJwKICO5TBHhP0w0z1bEs1nFJ3CLUq/2+sC4eaSBkGGKKhEE5uKRbqZ
 W1kut7yqAI2tbSP/x6Iy0uOFWoYX6Dobbhqdud7ZIyJj20NFXGmTltVgIp0TTPkLX6ENaT2G8
 t+URWrehR0yiI1FyPCdaGZpxYSYJDqRPWSG8asssoPgUZZa2TaT/gReIQo3LRH8znvxVYvaLH
 frVKMM+B7JgyXn0MJEzlsxmDcqHYziW8b3Vn80naP2CECoVSIhjExnxUXwJSIFDl0LAUzZMCQ
 qOP68C3YmohX00J90II07h26IHSkLa7xAR9nOvTnmxqjtDH0wUGrF85vAikoABEHGlN410exO
 KK2IiScUvdTTJtzCCxPMXs1ulSTDamOqkzLGdUTKP9O/n54E3XkPuF0b6Vd7h6oE3X/KWpZCT
 jp2/t3szVUxHTPV33oRNsy0rr4jNa+m2NhW8P1nfftJ4xZ6VUyGR+ZhKJCYzzBUbdCfCRvpxH
 qbWkCjgflsCP/2lVRa86Vb5RuUCJmkpqnb65IwQEx5Le3OJ0Jpv+Me6KFIrg8uxNZbGzJ3yFd
 8VpZ5wvdqvLwwJZuRLCiUl1Cf0XXEubcWLGy003eNdQkRBFmjo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_073758_143614_77BCAC4B 
X-CRM114-Status: GOOD (  14.16  )
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
 Brendan Higgins <brendanhiggins@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Mason Yang <masonccyang@mxic.com.tw>, Piotr Sroka <piotrs@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, May 27, 2020 at 3:53 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Arnd,
>
> Arnd Bergmann <arnd@arndb.de> wrote on Wed, 27 May 2020 15:42:03 +0200:
>
> > Like several other nand flash drivers, this one requires the BCH
> > library to be selected from Kconfig.
>
> Actually most of the time these drivers do not depend on BCH directly.
> Here it is a bit particular: the hardware ECC engine logic being
> broken, I found a workaround by using BCH's library functions directly
> to verify the hardware correctness.
>
> Anyway, thank you very much for the fix but if I didn't make a mistake
> it should have been fixed yesterday night already, so it's probably not
> in linux-next yet.

I'm still on yesterday's linux-next, so I was probably just a little late.
Thanks for fixing it already.

      Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
