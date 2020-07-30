Return-Path: <SRS0=Dlpg=BJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FAEFC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jul 2020 05:32:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D64B20842
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Jul 2020 05:32:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EjHNQw2+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VpV2wkx3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D64B20842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6zRT2rpASOK4s5qo3iKJBwd0alXeAKyKR+KcoG867ME=; b=EjHNQw2+ruD1qpKHZRMqpau5O
	+k/AJSO/ntSwg4aTgAVpLzDu/Om5qpXlLIzmo6SeEHGdKKg8vCSWg6ZTPZurCiWzRWtjSmRm35SXk
	EQskmp99iVVenyd6/wOXmhwSBHF2xh9HMpXV1MALMfhl2OgTRSa1oZ0JWMRyWRi6uZ53P2ZXDe5dm
	WDnTCIn6gvLSuYnFWRkafxhy1r6fB3m7SmdNEKOpmjA8z3rfE45YNxUNhUiaW1i7FK3nMxg7TGY0/
	FPR9bA7daLh3v+Lz+nabWNt6il6aT9ebllCWfBtcUPkNukSPs9dkTG9eSCd9l2C3UvgsW+DtdVXfs
	HW1GG8/rA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k11A3-0005rN-H0; Thu, 30 Jul 2020 05:31:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k11A0-0005qt-3V
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2020 05:31:21 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 750DB20842;
 Thu, 30 Jul 2020 05:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596087079;
 bh=Dvo2/mKtVKTG0GN4Ptkmba8k3YXSZeccrO2bOD3DvS4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VpV2wkx35kvXQjleYoNCJcsBGjTxjZ5HYiB+hNWmiqiK671/+WrR5JYbDKTda0Ofe
 iJ2LMYGqOXjIwTDvGjHSf7jefTImzSy1nmFR/UX5WXw1aifCej7tQlxaK4nZGW+MhU
 W9NJrpkDjBfmT5UOj2a/UE8guQgDRF6qPj9UbvVE=
Date: Thu, 30 Jul 2020 07:31:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Gutson <daniel@eclypsium.com>
Subject: Re: [PATCH] Module argument to control whether intel-spi-pci
 attempts to turn the SPI flash chip writeable
Message-ID: <20200730053108.GA3861609@kroah.com>
References: <20200724212853.11601-1-daniel.gutson@eclypsium.com>
 <20200725055649.GA1047853@kroah.com>
 <CAFmMkTE_dT9+WJYyb19uQ_HmgJWZSARBy6PveheQJk++NuGbkQ@mail.gmail.com>
 <20200726071723.GB441916@kroah.com>
 <CAFmMkTFzGfFDrJrdgHztzLK2K-zBWy6T2Tv+G4-rrbVpbahkgg@mail.gmail.com>
 <CAK8P3a1nA7K15Cxz84Q8Grw3tKfgkUmsfURcytJEWb_0Wjqm5w@mail.gmail.com>
 <CAFmMkTExBY3V_Ghej7Bzjatg+vFtWq3UZmKzjAiEoR9EqnFN9Q@mail.gmail.com>
 <CAFmMkTEO7VNKJeYz2uoHsS-yN_aY8UuiQ2GcCq9NyAD5481ZGA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFmMkTEO7VNKJeYz2uoHsS-yN_aY8UuiQ2GcCq9NyAD5481ZGA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_013120_377562_E6FFED92 
X-CRM114-Status: GOOD (  32.22  )
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
Cc: Richard Hughes <hughsient@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Arnd Bergmann <arnd@arndb.de>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jul 29, 2020 at 05:54:35PM -0300, Daniel Gutson wrote:
> On Mon, Jul 27, 2020 at 12:31 PM Daniel Gutson <daniel@eclypsium.com> wro=
te:
> >
> > On Mon, Jul 27, 2020 at 12:15 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Mon, Jul 27, 2020 at 5:05 PM Daniel Gutson <daniel@eclypsium.com> =
wrote:
> > > > On Sun, Jul 26, 2020 at 4:17 AM Greg Kroah-Hartman <gregkh@linuxfou=
ndation.org> wrote:
> > > >>
> > > >> On Sat, Jul 25, 2020 at 02:20:03PM -0300, Daniel Gutson wrote:
> > > >> > El s=E1b., 25 jul. 2020 2:56 a. m., Greg Kroah-Hartman <
> > > >> > gregkh@linuxfoundation.org> escribi=F3:
> > > >> >
> > > >> >
> > > >> > 1) I just did the same that intel-spi.c does.
> > > >>
> > > >> No need to copy bad examples :)
> > > >
> > > >
> > > > Didn't know it was a bad example. What's is the current modern mech=
anism that replaces initialization-time configuration?
> > >
> > > I'd say you'd generally want this to be a per-instance setting, which
> > > could be a sysfs attribute of the physical device, or an ioctl for an
> > > existing user space abstraction.
> >
> > But still, they are not equivalent. The initial configuration remains
> > constant for the rest of the life of the driver, whereas the
> > sysfs attribute is set after the initialization and can be re-set over
> > time. I'm not asking module parameters "to come back" if
> > they are now considered obsolete, I'm just trying to understand.
> >
> > >
> > > In the changelog, you should also explain what this is used for. Do
> > > you actually want to write to a device that is marked read-only, or
> > > are you just trying to make the interface more consistent between the
> > > two drivers?
> >
> > The device can either be locked or unlocked. If it is unlocked, it can
> > be set writable depending on the module
> > argument in intel-spi, or straight writable in intel-spi-pci. Which is
> > dangerous.
> > I wanted to make, as you say, the interface consistent.
> > Exposing an interface to the user (via a sysfs attribute) to try to
> > make the driver writable is definitively a bad idea.
> > I'd rather do nothing (no module arg) rather than open that
> > here-be-dragons door.
> =

> ping.
> This is a real existing problem that I'm trying to address.
> There's currently no way to prevent the kernel to try to turn
> the SPI flash chip writable for the device IDs handled by
> intel-spi-pci. And allowing userspace to switch it between
> writable/non-writable is not an option.
> What other mechanism can I use other than the module parameter,

Again, module parameters are working on a per-chunk-of-code basis, while
you want to work on a per-device basis, which is why you should not use
a module parameter.

good luck!

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
