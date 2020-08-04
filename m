Return-Path: <SRS0=GAYx=BO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D7AC433E1
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2020 20:48:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 451E720842
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2020 20:48:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zJOab7AC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 451E720842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wwLPY9pGNH/gkxhz/ngqPR3oCmCdV/v0zEWM2NpuSCw=; b=zJOab7ACxB/C06Y+MMVnY6LdT
	dwfswc8pNRCRrwhJmg6w+cxFxqT/F+q3A/BMnfpRE8gl/goQcd+f5iF19h+uvP9bqlmf58ZH4ENYj
	u+6LMntuLJr6a0NzrHC1q+VhwBe6JEijLLWf9GFtkUc51ry+saWzQUcVdFc3kb0ml0Wc0CbMYWpXj
	mb2IN6/mE53k4xqOu8GZZeGET4FtyGqvOB3R4FMJw7PQDBMGS+vze5/xDyD1RE+RFEq4im6dqWhfb
	N2jbKplnfPG67xJLZBx32v8UxUQdH/x3gx6PfHdbXhoYXq9zV2L+cueSxQHeoYpZIEUkUX8BFP8Dx
	tNlH1ilew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k33pq-0003XF-H1; Tue, 04 Aug 2020 20:46:58 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k33pn-0003Wj-Gm
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2020 20:46:56 +0000
Received: from mail-qt1-f170.google.com ([209.85.160.170]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MlfGs-1kTuON1Yfq-00ihoJ for <linux-mtd@lists.infradead.org>; Tue, 04 Aug
 2020 22:46:53 +0200
Received: by mail-qt1-f170.google.com with SMTP id v22so26142453qtq.8
 for <linux-mtd@lists.infradead.org>; Tue, 04 Aug 2020 13:46:51 -0700 (PDT)
X-Gm-Message-State: AOAM531vbNLsYSTTtTJdIOiFlx+16SrEQPjH+IVgd52/EaZGqcKa7vR5
 KS7Utn7Wy8/AGeLgiuwe8kwfRKDTG8fe8GPQxLE=
X-Google-Smtp-Source: ABdhPJyfKXtZ9bJdr5vNevE8picmWjXgaqtGeRUJwUyWZhYZoWFf+rYjINp1Q7InTjlAu2JhmVavHTYiCQ3CxRC9qDM=
X-Received: by 2002:ac8:688e:: with SMTP id m14mr23733224qtq.7.1596574010244; 
 Tue, 04 Aug 2020 13:46:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200804135817.5495-1-daniel.gutson@eclypsium.com>
 <CAK8P3a0_fJ0BfD5Qvxdo0s7CbjPWaGA8QTgYhbXR=omafOHH4Q@mail.gmail.com>
 <CAFmMkTHEm8k+5GZkVJbDZMEhMwpsqVKRb-hGskSpBstdLRuFyA@mail.gmail.com>
 <CAK8P3a27bTYyn3N+tX=i_6f4KrQkOmkUA1zUQfvCW7qw6smSkQ@mail.gmail.com>
 <CAFmMkTF9eVm0tpOKEy2rzdX=Scr3RwqHDFy_i24R3F5ok-4=eA@mail.gmail.com>
In-Reply-To: <CAFmMkTF9eVm0tpOKEy2rzdX=Scr3RwqHDFy_i24R3F5ok-4=eA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 4 Aug 2020 22:46:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3mf8_Y4DWe3WuBO-Xo0N4Jj=-rrtFzD6w0TriGZPu1_g@mail.gmail.com>
Message-ID: <CAK8P3a3mf8_Y4DWe3WuBO-Xo0N4Jj=-rrtFzD6w0TriGZPu1_g@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Do not try to make the SPI flash
 chip writable
To: Daniel Gutson <daniel@eclypsium.com>
X-Provags-ID: V03:K1:Ry+oEs/Ylkpd+dFM7Mih+J1nIBDWNHga0k8/woecCw7ALxlzZSh
 yWJOhSPedOuWDOVNXSdXExthPKZ5writa4L75p7vv0k2GApOmT05PTf9naJBSGOgDWqllzV
 0l/+ikszB210DoyZ8SeZIkHUePV22MxcT69Gsao9KG7bZb09Nhq8CkY8gtwqzKF9HUnOUE7
 80mjT2oOFll8b6lBIIopQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SbcwnP+fPYM=:70l+uwdeSwOuCC4aBPKRgf
 ECBNI3GY5io/Jl8EWKRL8sMsuelfNzFCSZMFqdwCVwjVuODfQrOo25PATpPnnEv/uIvkhIsUG
 e1vPomXh6emxCyKdm1HLRVHPZCBqzvflFj+BLX0mPk69if1klM3QsPBbaCQJ93XpVl40uraID
 CCZn7Wh6f1VMqdRlUKHRF1ZRvkaGjfwvLHdfsZeanwcLiM6WBpmDJqMA84BhIMtxk3oiUcEER
 FpNU/RvdH5UIraLWb7DnOEWpuDwBZJZtyccxN+pzrwBCjgEqI7xcHFdgyFJ1fMkYxCBSIXXHL
 r/V3Um5FCbse29Uled+ogyPV6QJV033RJ+0x2uEczqEZunzXdAyCo6CjE5sVVgMSMYm7vtCUy
 M7o1Zjkw3Ezm9JveySSVBquCgwotubPAZWk3U791waZuWl7A/Z2dDyP7jMH8C447a5fS6gH63
 ik/qTHN7WC4CEGTbxidC40+2EsHhumgRDh+PV3KcgDuaCMQBQTcXU/z/CDcd2cuhGuKAwVAGz
 uNfeawdiMmUqTRB/OOKEOPb8o9hGXD8WeOYdsU4xmMf8YYYZ8tOTUx8SXQtqFIduZzJR2XOzZ
 O/7YYpXEjn7AnZhTBR9H4XoCA2kkeV9R69sXThbGgAjm+g+hzi9On6dbfUaDjuMQ9DT0yBAg7
 OMjwN4wTKSmCmUER3CnH5NqXDnEW13Je78UhWS39NcvrqmmcrfDIEHGYOB6+5qEc58WcYsA3R
 zApBGmbgpHHTgyzZqBawJv30HgmJU3skQIPMPrIuds/s2qs10Lpz8wCXDG8lkW8+h4ZFhnf6i
 SYweUeAMoIA1ZBEGRfyjy+7jALDwSi5YFj+oHRofORJ23Xq0lh8QPC+cppyTJEpbpITZhGgU4
 DvShxIsnWlZ/GNr9tYg81SNSqCnBcltmekhJpKOfRVATDbIB1mMVLN/PpV8UyBto12T8rVE0S
 iQ7aUwSM2Ihsv6fddYTevxDKyVwDWfY8IFmDkTI58Sj70bMhDgvrK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_164655_778427_1EDC95CE 
X-CRM114-Status: GOOD (  30.49  )
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
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Aug 4, 2020 at 9:57 PM Daniel Gutson <daniel@eclypsium.com> wrote:
> On Tue, Aug 4, 2020 at 4:06 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Tue, Aug 4, 2020 at 5:49 PM Daniel Gutson <daniel@eclypsium.com> wrote:
> > > On Tue, Aug 4, 2020 at 12:21 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > >> On Tue, Aug 4, 2020 at 3:58 PM Daniel Gutson
> > >> <daniel.gutson@eclypsium.com> wrote:
> > >
> > > What about just saying
> > >
> > > "This patch removes the attempt by the intel-spi-pci driver to
> > > make the chip always writable."
> >
> > Yes, that is much better, though it still sounds like it would at the
> > moment allow writing to the device from software without also
> > setting the module parameter. I would say something like
> >
> > "Disallow overriding the write protection in the PCI driver
> > with a module parameter and instead honor the current
> > state of the write protection as set by the firmware."
>
> But wait, Mika, the author of the file, asked earlier not to remove
> the module parameter of intel-spi, and just remove the unconditional
> attempt to turn the chip writable in intle-spi-pci.

Yes, and I think that is fine (aside from the inconsistency with bay trail
that you have not commented on), but that only touches the hardware
write-protection, which doesn't really have any effect unless user
space also configures the driver module to allow writing to the
mtd device.

> So I'm not touching intel-pci, just removing that code from
> intel-spi-pci without adding a new module parameter.
>
> Are you aligned on this?

One of us is still very confused about what the driver does.
You seem to have gone back to saying that without the
change a user could just write to the device even without
passing the module parameter to intel-spi.ko?

Maybe you should start by explaining what scenario you
actually want to prevent here. Is it

a) the hardware write-protect bit getting changed, which
    introduces the possibility of corrupting the flash even
    if nothing tries to write to it,

b) root users setting the device writable with the intention
   of writing to it even though firmware has politely asked
   for this not to be done (by setting the write-protect bit
   but not preventing it from being disabled again), or

c) a writeable mtd device showing up even without
    the module parameter being set at all?

I thought the initial patch was about c) which turned out
to be a non-issue, and then the later patch being about b).

     Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
