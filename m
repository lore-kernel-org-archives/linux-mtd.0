Return-Path: <SRS0=wFkH=YL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC598CA9EA0
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2019 19:33:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C3EB2082C
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2019 19:33:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iaiJ6xL5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C3EB2082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajLwDOjV9iVYwVqlbys3t/3X4oGZP10BV49SF5mVX2w=; b=iaiJ6xL54fA8vq
	KK+Gsd143F0NVln3BCgm889QGJW7PqHq0XriBROoHYwIUOyFrqzambYHHM36oyCMml0nA7JqyfsV/
	WyxTZ+15PgY5PPbrQy40BtOU6nnUbE3XfGAnFZ3h/StlfMdR7HPSR0di76PUkDvxqHx7Ro0u9kzwA
	dPuN3xEIO7tR77MCcFQCQpbzb198MSQ4zNz8SERfwPA3e9CNTI3Sua9zI5v4uAsNlc39GwCJUCeC/
	2DQKTSwwtjxNHGkflVgpFEOwQi86b/K/IRdodpMzDv3/mhSUp/WcreckezTsInPWRxSDi4+3436xg
	0dyocXKb3oc4c+lCoC5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLXzp-0001O7-7j; Fri, 18 Oct 2019 19:33:09 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLXzf-0001ER-KH; Fri, 18 Oct 2019 19:33:01 +0000
Received: from mail-qk1-f176.google.com ([209.85.222.176]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mow4E-1hgSwS1bTi-00qOw1; Fri, 18 Oct 2019 21:32:54 +0200
Received: by mail-qk1-f176.google.com with SMTP id y189so6381214qkc.3;
 Fri, 18 Oct 2019 12:32:54 -0700 (PDT)
X-Gm-Message-State: APjAAAWoMeW7XQndBfJEzgYqVdYQnHH0jCjgAEGsXvjwu5voRYZeNwHP
 GhI4Aa6t2E+sqnzWyk//fmp3alj+8DFyzsjwX3A=
X-Google-Smtp-Source: APXvYqzndIi4+lrEFsQAJTvDSAykrBEjXYWBlihPsFokm/QiIqztK3NntxmM4iVAVoSe7PNdrIRvDpgwbQhfLS5cKrs=
X-Received: by 2002:a37:db0a:: with SMTP id e10mr10369877qki.3.1571427173049; 
 Fri, 18 Oct 2019 12:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154052.1276506-1-arnd@arndb.de>
 <87v9slg9k5.fsf@belgarion.home>
 <CAK8P3a1JDtHsOW=iaxEycbJ4TBkR9MHUyDMeJnwxCtb=tefnBQ@mail.gmail.com>
In-Reply-To: <CAK8P3a1JDtHsOW=iaxEycbJ4TBkR9MHUyDMeJnwxCtb=tefnBQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 18 Oct 2019 21:32:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0376Anmoc8VWXcEBg+z2B+1vcxJoywYYROBQNxpVmZuA@mail.gmail.com>
Message-ID: <CAK8P3a0376Anmoc8VWXcEBg+z2B+1vcxJoywYYROBQNxpVmZuA@mail.gmail.com>
Subject: Re: [PATCH 00/46] ARM: pxa: towards multiplatform support
To: Robert Jarzmik <robert.jarzmik@free.fr>
X-Provags-ID: V03:K1:oVxVVROF7CdkHyfWKdI6PCQrM0NTe3NiNlNYmyf6A/UCuBDJfg9
 GuZ9rmwHtnpHjjHsVHRNpM9jrQDtGniDggK5MId0bh0uu/JH2f6riovxVgC7qXpgrAw98xI
 1bJI79Wbm2VNHC0T273821Wn5bnFLXrFZm+MFzseQ2YYIExWjMo8e8AYwNu+sMEtrNyZ/HC
 I7bRAg0Pk4F1gOKBh5J9Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uOwyo+Gtsn0=:BymXWljFFF3QRJ/hIT/KBC
 IN5sVfq/OdAXurlgZ+ocFeQBq5MLlJoW847NV57n4i4SS+bwN9in5/SGuuGi8G9ZsxIT1IRkX
 taEq3fqA4PXVHDAZsM9i8umsMHWsprdEzNp1d4RcTu4tHb0jVVujiAT9RWPkHyQTs+4NXlRKe
 wB71z4edVJ2krPLAe65HrYvUh+wyz9/dggjgYNByuLy3wrS8537hFuFsvsXq4y2fLb+3MdsPw
 zJ8jxYiZIWWLi6nviZy09U7J3JHYOJIyecXEtMrYMTfqBoeS30rC5cr0p5QHq2h2UQG/shuzo
 12z650AU2hJKMfe7uM9NPXYL4pWAFLQXV0/DAWbJzraE1MFbMp/QIkeNtkqQ+GXm+fqZ7kzw5
 QOa3BNSPyLeNIWv8w/75aAL2fiADWvhBG41wQy92qmv8GHW+uJkN1zoqcbgWLLBKZFVH6shhQ
 3C7O7zQ7o5Vj7tuDLiOymS0hp0+8CMpvKsNDbiJZoCX0KRLPLsYGrg7/DW2iTRZwp0AvgQbBR
 DJwdKSaflbZH9CtrGZiht2jsBPs0ULk4QUYpfjQ8IF4E1KlAnTw9WolrJoGWro30dH9m1RYeV
 GRjDOzn+hzEwaitSLTvDbEtaSakOgPPpH43y8/DP44/7PAgMVX3NLLL2w2jD2ttpoA2e2g8wL
 N0gn6RkbrA245mYKw20aApj1A3KA9XPQ+av6eolwdjm81cUwjMlFsJYiwLlZJB2c2a1aq0Ggp
 k/qGMgf5X5YYkIO+OuHgHf0Af5adriSfpAxvDJCFUrnHeon/vxZj6CQriHAmuCz13vZDofSPJ
 GtgJq8Kez8UfzbbKhC/KgpwY8pR5iKHMfBhZV8eTzD4b4hhOKZsbimrCShK8H1LBQMd4bK5YA
 zA1dVuLG4skFA/rY9vTQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_123259_957387_EE371F74 
X-CRM114-Status: GOOD (  18.70  )
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
Cc: linux-rtc@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, IDE-ML <linux-ide@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, Daniel Mack <daniel@zonque.org>,
 linux-leds@vger.kernel.org,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Oct 18, 2019 at 9:17 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Oct 18, 2019 at 9:04 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> > Arnd Bergmann <arnd@arndb.de> writes:
> >
> > > Hi PXA maintainers,
> > >
> > > I'm in the process of getting the old ARM platforms to all build
> > > in a single kernel. The largest part of that work is changing all
> > > the device drivers to no longer require mach/*.h header files.
> > >
> > > This series does it for arch/pxa/.
> > >
> > > As with the omap1 and s3c24xx series I sent before, I don't
> > > expect this all to be correct in the first version, though
> > > a lot of the patches are fairly simple and I did exhaustive
> > > compile-time testing on them.
> > >
> > > Please test if you have the hardware, or review!
> >
> > Hi Arnd,
> >
> > Would you have a git tree I can pull from ?
> > That would make my life easier than applying manually 46 patches...
>
> I've now pushed it to
>
> git://git.kernel.org:/pub/scm/linux/kernel/git/arnd/playground.git
> pxa-multiplatform

Sorry for the duplication, I had some problems with email configuration
so my reply got rejected, let's see if it goes through this time.

       Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
