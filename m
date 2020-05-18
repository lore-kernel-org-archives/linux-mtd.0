Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37108C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 11:57:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 070CE2065F
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 11:57:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GY0GQe1Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 070CE2065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dPaHPZPj3naPIqstmctQC6JJZdCfq/Don6cBRSeRbBg=; b=GY0GQe1Zq34M50
	ebUAF8fU34mpgx1l8BJsAs2m9FnsS4BJYe6f7FmP9Ks0APCwMb2JLylu2e5QFOnGX7P9lJYdWSZEm
	alWvDrGfODguRfnvEtcy/+WSuFT2rvvxEz6FVsL168U54tdbVVdehIbM6mJwFvpRPFMGEjwBBp2jI
	nIhI5gnMiK8+bayf43lHoXXBRMCAL5EJozx6Fcio42kwzZP514CPUMzAqDxgaC/yorK1iaVxGmrt7
	qdiyq6WJ04pUTk1Fqilmj6wG29+PYxZWqSvGGWesGGqVTHt7jDoV+RdZDuZ/IIogLWiti8rofsUyT
	84EStQsM9jjvyH0A+7OA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaeOp-0002X9-7A; Mon, 18 May 2020 11:57:39 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaeOm-0002WK-DY
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 11:57:37 +0000
Received: from mail-qv1-f53.google.com ([209.85.219.53]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mz9hF-1io2Bt3sCh-00wIBx for <linux-mtd@lists.infradead.org>; Mon, 18 May
 2020 13:57:31 +0200
Received: by mail-qv1-f53.google.com with SMTP id z9so4500284qvi.12
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2020 04:57:30 -0700 (PDT)
X-Gm-Message-State: AOAM531UAhQg3Sc/6puIK/Jgrs8qMBjuXGsNC3/KAt2DnrxSV0dhtqHg
 ARObv03tFSIBY2aJ9On+sf9Ohmi3Vah6cW8o8s0=
X-Google-Smtp-Source: ABdhPJyUnKr4SHUFnJe9QsFvJhBBCNQyLNfjUzwAzO8o0fxqdsPeqZBhu6yQh15LV+E3iObLKOIbnTvte/PqUNqOYLg=
X-Received: by 2002:a05:6214:1392:: with SMTP id
 g18mr14567610qvz.210.1589803049670; 
 Mon, 18 May 2020 04:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200515105537.4876-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <202005152142.AWvx4xc5%lkp@intel.com>
 <CAHp75Ven9q-6dDYtP_uXigeS_r2uvpUZVR5Mh0RdEd36MbTG+Q@mail.gmail.com>
 <CAK8P3a3RKJo-C5=19oAppx212s7T8NdnKJVmkj+h=34a8aKMNA@mail.gmail.com>
 <5180e734-ff56-db5a-ab49-8a55cfa2f2c0@linux.intel.com>
 <CAHp75Ve_XjvvGBEQyhy=qVVJMFS+18j3aKxNxSQpGK5qJmzfBg@mail.gmail.com>
In-Reply-To: <CAHp75Ve_XjvvGBEQyhy=qVVJMFS+18j3aKxNxSQpGK5qJmzfBg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 18 May 2020 13:57:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a25GbMwbtvkxgmuGss6nEfAW4_vVbOXPxOYuDOaU_zcjA@mail.gmail.com>
Message-ID: <CAK8P3a25GbMwbtvkxgmuGss6nEfAW4_vVbOXPxOYuDOaU_zcjA@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Andy Shevchenko <andy.shevchenko@gmail.com>
X-Provags-ID: V03:K1:YlVA++C5BF4egVbIRnazfffFaouWDGntwXoQa5KMZpkswgLZv0c
 ZWTPQFs4OHjdO8Mgky4vgd1jIvXyYxZukleSLvGXCN6LIeWnvL8F57gVraeKqOzVtZbLhmH
 ulDm9cbQjRY2g7e5HkzKe52B8dP1jjKGH8p4sla2CriJhzzgDsQ0fb13SfaK8bc52ygH173
 jqlLGfGy6ltp01lIezR8g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7aTerEKpmTY=:LZj0hHJ/rc2fa0JJrPJwL0
 NSs6EtY6GWdrcSy8gUdvt9X+7EMO4FOPat08Gjd+PNZt8qfRnjnPIaWj92sT2ceX0yoIjcRaU
 VmJzk7W7dgSp+lKUMX2uQwexjb6R7eBAgW6Ae0a5qERxNgjb0/T6t1X/khtezi6ZgnSPIp6pf
 li3UZA9Pi+6xC+TLRzscJ9tHyA2r+PilEo5G9TpR3KeMs+SPEEMEOSvlTg3Qgj9bFnWPVCELX
 ISAMiGbM6c0ekJJP13qcMlkA/AnI8E9O5PaZMyftJz3sL6rkIPZBa0FdH+jRxRd5eUs3ioX4d
 gUoIWSPJyWq1J1Fz6LonvZ3s2OH7YSit95i/CB9uS8fsBXXt8ykl3ZqZ0uDbI2UC7F9883nIY
 W2rPnLWIcbYSn7237SDFi3NnmoIVKduPSK9+qIPXZZBDFwifevUM/+dbSLybRC8odtIst5yhP
 no2hF6c0TSAnBtBVF0OE2GwKEtfzX7hDASKmG4Fv8N7ZawoAY3xtrQVQqrwu6wV2B4paFDnde
 8DRktO7du8u8QxxutzXvj0Ql3rFvS/gxEr4eCG2rS6ZqNvPx2gUw/7WjHNqm39bnewDJh84l7
 y6Xph69V0FAGUVcU3oeKMRunaESCbE73tR5MLdjPEJ1wfgIXu559Qoi3oglR5rr4dqSj9ahgr
 0WMWtUvb90a5FT9yrrXWJm/8RU3kuPBFtjyBbwnf6Mj7GDgO0H1G30ouVtNRpZzk3oeX9Lsqc
 Fd48OLhum1fJ9egNUIMk0SJb3VIbjJPjLukGVc/gETAyms4bqdLoxdznPaxriqFOnor1f6vBp
 YdHsuYkBGE1o03RF0Jf9WG7Nz7XK8x73p161ChuSXGfD1A3eG0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_045736_755429_8340A7C3 
X-CRM114-Status: GOOD (  14.86  )
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
Cc: devicetree <devicetree@vger.kernel.org>, kbuild-all@lists.01.org,
 kbuild test robot <lkp@intel.com>, Richard Weinberger <richard@nod.at>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Anders Roxell <anders.roxell@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 masonccyang@mxic.com.tw, Vignesh R <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, May 18, 2020 at 1:43 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, May 18, 2020 at 2:39 PM Ramuthevar, Vadivel MuruganX
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> > On 15/5/2020 10:30 pm, Arnd Bergmann wrote:
> > > On Fri, May 15, 2020 at 4:25 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > >> On Fri, May 15, 2020 at 4:48 PM kbuild test robot <lkp@intel.com> wrote:
>
> > > iowrite_be32() is the correct way to store word into a big-endian mmio register,
> > > if that is the intention here.
> > Thank you for suggestions to use iowrite32be(), it suits exactly.
>
> Can you before doing this comment what is the real intention here?
>
> And note, if you are going to use iowrite*() / ioread*() in one place,
> you will probably need to replace all of the read*() / write*() to
> respective io* API.

The way that ioread/iowrite are defined, they are required to be a superset
of what readl/writel do and can take __iomem pointers from either
ioremap() or ioport_map()/pci_iomap() style mappings, while readl/writel
are only required to work with ioremap().

There is no technical requirement to stick to one set or the other for
ioremap(), but the overhead of ioread/iowrite is also small enough
that it generally does not hurt.

       Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
