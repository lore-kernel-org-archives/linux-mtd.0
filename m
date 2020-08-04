Return-Path: <SRS0=GAYx=BO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE0FC433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2020 21:27:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6BEB22B42
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2020 21:27:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T2qc2QmA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="NnLic8Mv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6BEB22B42
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GsEvm8ZaNNQnrQiVhUrF198vbJUly+z7AI0HB794hQE=; b=T2qc2QmAEyKAxnMYtejkLdr4m
	QM/UMNIFES33OmYFtyD8xTZs3UH9Pb9ynCJZiSLSBt9ccg7zDVixhcXcoRNJ6lJALXJeLHvaup0F7
	LH8wTgmLQUFMH+b8CCN0rROyHxS1qRPr+3Q9C9y9dJS3NQDCAP4a26jyzeANX+RXGdfaNIDJ/gUVl
	RM75yJ8iOTUEWt5abf3VslSZoa3NKsjypMecOY2FTgW5Cgue7AqGtnzCBvv0aJQHSssvPi8zPNDdd
	zbVN5Cm2jSDrfVsFBHVtyqFR70wXIC1mnhndw/OOInnXrRqTupUUZKC9QBJ5w12bU3isDmctnYQsx
	Gs2Q9qicg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k34S7-00018Z-Rl; Tue, 04 Aug 2020 21:26:31 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k34S4-00017j-Qf
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2020 21:26:30 +0000
Received: by mail-qv1-xf43.google.com with SMTP id r19so11296375qvw.11
 for <linux-mtd@lists.infradead.org>; Tue, 04 Aug 2020 14:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EIijXqczA+fJ6ljet3cDCIUDRtSrnljLBcPwrEPIX1I=;
 b=NnLic8Mve8V7Vn5BnI+2aE5Qj9cAudq14M8IldzGj4HmlvW/KE+/PvgoPdjFUIzzVA
 ovpOrHj6UrwT/KFYHpe2OF2gPnl434X7L9XP5gyfwBlzPGhvBU4IHO/Ia+ZTNUMzLmtB
 Gu78Ru+PyTpkN8YLdM5zvj7fj0EmcMiRT8Fn1nIQNTq7O/C/k29VTasIfZvhsES96FsW
 16jj98++LlFxieMbt8m2oLc2i9Llz6HrmTPt5lYYfZp1d78kXWx+HMnyvoX8axmRU+bw
 NtFKluqhjAqZaoRrq6T39LyCkITvmN25fmY2VrUmdVyHx3kYHW5+A66gQaX0SwYDSiDf
 7lIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EIijXqczA+fJ6ljet3cDCIUDRtSrnljLBcPwrEPIX1I=;
 b=nFQbdLFLncnKJYV7qUvUNngHk2toD5W4xykR27Teh8nhqHe0N67etIfPkkULzzJOZp
 y3lCRRCz/sBVKYlSMO8wfAhk0DLK1nQjvYdA854Es+0cdq2Zmr+YN9LiG6HvLore/1kM
 MYCijm/mQcZW2bfQVLnmKFotPsBlSu2GXGKJEw1k/bcS6DJx/9cZKq7yZp9BoqQcpxxC
 U0r1DTVhVDv2RR5OUS4/wzA74SaSJIcyjE8ZCMBjaenT21sU8aD+NQFyKgZ/1mSen0oA
 xH4x885VmQX3QPAq1PSYWMUx9TW31xAguB2QC7UjfiwTWQbNs/K1eYUYR9UOzjT5cD8o
 dJwQ==
X-Gm-Message-State: AOAM533/a2cvr879zyNwI8+c49BiassZCXl3kQ+bNS9RuGZMjF2vRT4B
 hFxa9Qo1BhOG9xDs+QXWlZ53s5ejCvBQ/jH2DCk3jA==
X-Google-Smtp-Source: ABdhPJwIUJCuwei8hSV3a4TkiS+iC3YNpjfJ4ecvLLDgt9aGNNY9t56c7/1MEk2DbmD6pDwFam+EQdlp2nNaYzfUAF8=
X-Received: by 2002:ad4:5502:: with SMTP id az2mr377046qvb.148.1596576386950; 
 Tue, 04 Aug 2020 14:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200804135817.5495-1-daniel.gutson@eclypsium.com>
 <CAK8P3a0_fJ0BfD5Qvxdo0s7CbjPWaGA8QTgYhbXR=omafOHH4Q@mail.gmail.com>
 <CAFmMkTHEm8k+5GZkVJbDZMEhMwpsqVKRb-hGskSpBstdLRuFyA@mail.gmail.com>
 <CAK8P3a27bTYyn3N+tX=i_6f4KrQkOmkUA1zUQfvCW7qw6smSkQ@mail.gmail.com>
 <CAFmMkTF9eVm0tpOKEy2rzdX=Scr3RwqHDFy_i24R3F5ok-4=eA@mail.gmail.com>
 <CAK8P3a3mf8_Y4DWe3WuBO-Xo0N4Jj=-rrtFzD6w0TriGZPu1_g@mail.gmail.com>
In-Reply-To: <CAK8P3a3mf8_Y4DWe3WuBO-Xo0N4Jj=-rrtFzD6w0TriGZPu1_g@mail.gmail.com>
From: Daniel Gutson <daniel@eclypsium.com>
Date: Tue, 4 Aug 2020 18:26:15 -0300
Message-ID: <CAFmMkTFzmC=aY0gR6urLu-8Oq8aeHBUWi-TodG8XhXKCcC057A@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Do not try to make the SPI flash
 chip writable
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_172629_198432_C1E8DE38 
X-CRM114-Status: GOOD (  38.69  )
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

On Tue, Aug 4, 2020 at 5:46 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Aug 4, 2020 at 9:57 PM Daniel Gutson <daniel@eclypsium.com> wrote:
> > On Tue, Aug 4, 2020 at 4:06 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Tue, Aug 4, 2020 at 5:49 PM Daniel Gutson <daniel@eclypsium.com> wrote:
> > > > On Tue, Aug 4, 2020 at 12:21 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > >> On Tue, Aug 4, 2020 at 3:58 PM Daniel Gutson
> > > >> <daniel.gutson@eclypsium.com> wrote:
> > > >
> > > > What about just saying
> > > >
> > > > "This patch removes the attempt by the intel-spi-pci driver to
> > > > make the chip always writable."
> > >
> > > Yes, that is much better, though it still sounds like it would at the
> > > moment allow writing to the device from software without also
> > > setting the module parameter. I would say something like
> > >
> > > "Disallow overriding the write protection in the PCI driver
> > > with a module parameter and instead honor the current
> > > state of the write protection as set by the firmware."
> >
> > But wait, Mika, the author of the file, asked earlier not to remove
> > the module parameter of intel-spi, and just remove the unconditional
> > attempt to turn the chip writable in intle-spi-pci.
>
> Yes, and I think that is fine (aside from the inconsistency with bay trail
> that you have not commented on),

There are two inconsistencies before any of my patches:
1) in intel-spi.c: uses the module parameter only for bay trail.
2) intel-spi.c uses a module parameter whereas intel-spi-pci doesn't

My initial patch addressed #2 by also adding a module parameter to
intel-spi-pci,
but then some of you discouraged me to use module parameters.
Mika showed up and suggested to leave intel-spi.c as is (with its
module parameter),
and remove the code in intel-spi-pci that tried to turn the SPI chip
writable if the BIOS
was unlocked.

> but that only touches the hardware
> write-protection, which doesn't really have any effect unless user
> space also configures the driver module to allow writing to the
> mtd device.
>
> > So I'm not touching intel-pci, just removing that code from
> > intel-spi-pci without adding a new module parameter.
> >
> > Are you aligned on this?
>
> One of us is still very confused about what the driver does.
> You seem to have gone back to saying that without the
> change a user could just write to the device even without
> passing the module parameter to intel-spi.ko?

What I'm trying to say is that, if the BIOS is unlocked
(no driver involvement here), the intel-spi-pci turns the
chip writable even without changing the module parameter of intel-spi.
This is because the attempt to turn the chip writable occurs in
the probing of intel-spi-pci, that is, earlier than the intel-spi
initialization.

>
> Maybe you should start by explaining what scenario you
> actually want to prevent here. Is it

Was it clear from above?

Before commenting below, it's important to note again that
the driver will succeed in turning the chip writable only if the
BIOS is unlocked by its build time specification.
The WPD field (Write Protect Disable) bit only has effect if
the BIOS is not locked. This WPD bit is the one that the intel-spi-pci
driver tries to set unconditionally. If the BIOS is locked, it will cause
no effect. But if the BIOS is not locked, the chip will
end up in Write Protect Disabled state.
My latest patch simply leaves alone the WPD bit in intel-spi-pci,
not trying to set it to 1.

I'm not sure the options below are now fully compatible
with my explanation above.

>
> a) the hardware write-protect bit getting changed, which
>     introduces the possibility of corrupting the flash even
>     if nothing tries to write to it,
>
> b) root users setting the device writable with the intention
>    of writing to it even though firmware has politely asked
>    for this not to be done (by setting the write-protect bit
>    but not preventing it from being disabled again), or
>
> c) a writeable mtd device showing up even without
>     the module parameter being set at all?
>
> I thought the initial patch was about c) which turned out
> to be a non-issue, and then the later patch being about b).
>
>      Arnd



-- 
Daniel Gutson
Argentina Site Director
Enginieering Director
Eclypsium

Below The Surface: Get the latest threat research and insights on
firmware and supply chain threats from the research team at Eclypsium.
https://eclypsium.com/research/#threatreport

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
