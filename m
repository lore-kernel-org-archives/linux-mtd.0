Return-Path: <SRS0=/JSY=7E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC34C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 13:15:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 994C4205CB
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 13:15:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iTJFlZRp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 994C4205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9aeVJvbcSb2tZ18qv34K2tOx8lt9PismD6KwMmNASL8=; b=iTJFlZRpBR2WR8
	U0Fgq4L7z5aY2sL0rSrYB8CfiC4TpUnwfGRFbz8DrFymyU8Ulq0TYtGIwg5Hyd9/CGjSPC+Gm+t+/
	PvJmCsrBcqXZlcEtjWVgxtEhJ41JV09t9URTONs9hVKnL3hnUNtWnx1u7vpwnEOkL306LzPjZHNfm
	tc6sDMejplVOFziivN6nJEzOQPgvBxT289apvMxLRiZeY2Gm6rhgFxT3kUiTbQ++w8VXhqRCwtF0h
	d2uUp9jEvUipMhgVZbppz/8tlsp89LEj9KXKavFbC41/9lcaDUPEoOHs0eIdDuyA+/wW5RBgvlGDB
	DBl2aRWqrL0JLP9VE5oQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc7W1-0005wp-HK; Fri, 22 May 2020 13:15:09 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc7Vx-0004lQ-R3; Fri, 22 May 2020 13:15:07 +0000
Received: from mail-qk1-f182.google.com ([209.85.222.182]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MhFpq-1j6cVg2JxC-00eOwl; Fri, 22 May 2020 15:15:02 +0200
Received: by mail-qk1-f182.google.com with SMTP id n11so5122876qkn.8;
 Fri, 22 May 2020 06:15:01 -0700 (PDT)
X-Gm-Message-State: AOAM533R2HMgj8gHr+krUmkbjGV9D57GCLtPmX46gQ2NwaJwyRJ1IxDD
 euzi/Hp+hQ8FcFSQd8SU6agOcaHq9UkSuHngx/E=
X-Google-Smtp-Source: ABdhPJwad6aR4OIQn9sPWHlEXbdp9EOZA/9E2re31lr7EzXs2vTnnoYH10aXj71UgIgOAP2gGEvuTwixXPgmJrhwiik=
X-Received: by 2002:a37:434b:: with SMTP id q72mr15720320qka.352.1590153300062; 
 Fri, 22 May 2020 06:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200520102125.8934-1-robert.jarzmik@free.fr>
 <CAK8P3a2+auSWBROZR-hobM_qSWtKiG1DRYP3Y7uvbCy_ZLy+gg@mail.gmail.com>
 <20200521071213.GI1118872@kernel.org>
 <CAK8P3a2XdG_u6_o2NbQDTb5dbdzByBkUXZNM6nZ3wz0c-LFT5w@mail.gmail.com>
 <20200521190158.GL1118872@kernel.org> <20200521211016.3ad62148@collabora.com>
 <20200522131818.3adbac78@xps13>
In-Reply-To: <20200522131818.3adbac78@xps13>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 22 May 2020 15:14:43 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Z-UxktGn+_aBVaaBTStT7f177V2ED2RfVCQS8QDBamg@mail.gmail.com>
Message-ID: <CAK8P3a2Z-UxktGn+_aBVaaBTStT7f177V2ED2RfVCQS8QDBamg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: pxa: remove Compulab pxa2xx boards
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-Provags-ID: V03:K1:zv2T4X0YGQ3J9I0psbzm8Td6P7xwoYpeEgXP/nlQCGn1rQIvdX1
 HsvCKwP1zq+CLkHv8LxjNkvoxg9jJNe91PTdL7223O4KDWYv2HZRwdDYx72t2JfNvW1+5sw
 rvMgqW14udf1bDNqfl5lBe9+59jdmj8NpcIcxjABensERmC+Xru6Lb2WzAFIx9Rmia4Lcyu
 aMqhl2vnNmwNhv6DqCJZg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nNeVsf8VIdE=:Uz11jb+g9vtm6COuAFc2aA
 vz7hXF2rdZBp5eD7ld7zNVqGJN6+XYvVlrHnyj66qBrbIO59iD3xaEXzcmyY79R6ZNZ4YK0Hb
 NIU0qofmY1FF+RAnMTd04IX0sGnWpsiOgtl7jjRxmJkNBPIONR+B5lMH1qSY+9dEgKhNdcgT2
 nuS3Scp+ullAdWR7OGXplThpWS0j0W5HK3B/TTG4Bvgi6pFf7Bafk8Kxk4JjF/RLb1gXOl9ew
 o8UFefNkoiZomfkqGUxn43NtmL49BylPFDWWAT1XEr6vPM2P+ktF6kbOiXBd35CCDv7SWPxBS
 KDfmlz2cYc+9n8efZ+IjlX1mqMdnORe4NP+oqVHJZRUpP+HwNyGzBtXCK3Bv1UWSixi7Qc+Iq
 02pi24cYHwgygzbjYCGaHsbvJ9ZShF610AKj7xeTF9sOx7bAKU1LWCg/Ye6+DL0usNjU/uXdB
 Q3lJrFCJf8udKp8EVuMIzCRCMhYwt+FTv8c8vabNycIcNdjpwG0P/ec1i9FqxW/Oofv7r69Yk
 QHYwFYJ41FSH0d9bWn8MiC3nIjBwsM/Fzbb7Q9Fe2deypvXUmjU777LM4dHS4Pk/tmPXihO5y
 4bUO1lsETqKkC0GFP7Q683rRcwq89OrwU3Ij5YNXlp6JsnyZLlpiuyepDaCHl+Ygu5EXbNYCJ
 y24e/NitMmrMoMOxtqug78lPt/QIwt74S+p4yIMiLsEocpjJviLBg93yWxWbXJJV8zhntCrVz
 HCnYEJzxYBok0QBfs/Q9kmAvYmw2Op18ov9zj7yPWEifJPmQpvcr/ehUpo0wsCSgvcbZaVEX8
 oa5c+r/jybVl6Ts4x+x28rvJEfO7g46j89hwq/FT4k20+ytbsc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_061506_185392_A7377BA6 
X-CRM114-Status: GOOD (  25.48  )
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

On Fri, May 22, 2020 at 1:18 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Thu, 21 May
> 2020 21:10:16 +0200:
>
> > On Thu, 21 May 2020 22:01:58 +0300
> > Mike Rapoport <rppt@kernel.org> wrote:
> >
> > > On Thu, May 21, 2020 at 09:26:10AM +0200, Arnd Bergmann wrote:
> > > > On Thu, May 21, 2020 at 9:12 AM Mike Rapoport <rppt@kernel.org> wrote:
> > > > >
> > > > > On Wed, May 20, 2020 at 05:21:51PM +0200, Arnd Bergmann wrote:
> > > > > > On Wed, May 20, 2020 at 12:21 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> > > > > > >
> > > > > > > As these boards have no more users nor testers, and patching them has
> > > > > > > become a burden, be that because of the PCI part or the MTD NAND
> > > > > > > support, let's remove them.
> > > > > > >
> > > > > > > The cm-x300 will for now remain and represent Compulab boards at its
> > > > > > > best in the PXA department.
> > > > >
> > > > > I think this series missed the cm-x270 NAND driver, so this could be
> > > > > PATCH 4/3 (not even compile tested).
> > > > >
> > > > > From 56a11987f82ef8b32b25dfc17b849f9bbbf03e4d Mon Sep 17 00:00:00 2001
> > > > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > > > Date: Thu, 21 May 2020 10:09:47 +0300
> > > > > Subject: [PATCH] mtd: rawnand: remove CM-X270 NAND driver
> > > > >
> > > > > The cm-x270 board have been removed and theres is no point to keep this
> > > > > driver.
> > > > >
> > > > > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > > >
> > > > Thanks! Removing that driver was actually how the discussion started,
> > > > so we definitely want to do that. Boris earlier patch "mtd: rawnand: Get
> > > > rid of the cmx270 driver" did it by changing the board file, now your
> > > > patch is the right thing to do, and we should remember to do the same
> > > > for mbxfb.
> > >
> > > Arnd, will you pick this to the SoC tree or should I resend?
> >
> > Actually I sent a v2 removing only the MTD driver. You should probably
> > sync with Miquel to make sure the same patch is not applied twice.
>
> Actually I was about the merge this patch in the MTD tree because I
> have a big cleanup series which depends on it. Arnd could you confirm
> that it's okay for you?

Yes, that sounds good. I assume the patch is basically identical to the one
that Mike just sent, right? If there are changes to arch/arm, I guess those can
be dropped now as I'm merging Robert's patches to remove those board
files.

      Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
