Return-Path: <SRS0=G9d8=B4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2F0C433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Aug 2020 15:57:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A76C2080C
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Aug 2020 15:57:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PD3S+GZ4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="fd1JA3ec"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A76C2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+D2hkjx2GmjCU/g+Oum4lcJ1FggsLGDBgyrkH6Kfl0Y=; b=PD3S+GZ4HcnendJ5/npArIBAz
	Zp8uAo3D14MuCZNeeWi1ONiSarv/Tcj0Ase8YK0TxndgAB/0m9SPgUx11gBFVWyqEj3bwp8J21Auk
	swqwQBW2kp43CFDpsAUxcHU6tlDkeLJaNwv3TpXKVuZ8b2N+vbz/aqjdSMxA7Me7kBM5cMI6qWkAL
	LiDtsOAk+ZYbOFUvbKmlHkBKkgBt6CLruim4rjnUFRhVCgsm6r36O1EFf7Q086YMNcsGvwCZLLFot
	cxlOXGNGQWp3IhhLdi4rrOmaAbUMOW4+IsaLOZBFGTR4pULyTysPN4RDpV+cFgj6wgKiXo+lJwPkB
	vGklNcUdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k83yG-0000v3-Qc; Tue, 18 Aug 2020 15:56:20 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k83y9-0000tc-Ij
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2020 15:56:14 +0000
Received: by mail-qk1-x743.google.com with SMTP id 62so18681270qkj.7
 for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2020 08:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uJbb7vuxwMcg5PGEDE75LtUOyXkSQ6j7ZtCpt0SQhKA=;
 b=fd1JA3ec4X/Yc1dQga4oY6qWB3yHJVS9l3G/6X8+7Fdgj2zGbHo3bVsaIlLgUVAi8j
 adD8CH5732YLaS3kwP0A4r6FWZLCDB6MLhoIMMKI5pdvV0fGMw8JzKPVslzUlsDjlsHi
 LHFbmx4tV4rGlcnB8GaA17i4eVONzfkTW2IPKnNK8Q6vbcC63eBBCA6sV90pzGa38uVx
 AstiU6Hp74qfvB6kTYbPvP/yoCsCTgiWIMcfxd1PlXRlY5e/Gg1H3OmUCX/6i+1U377L
 DnwK8PTDRUSHmG/BUEczy48cAKgdMiRygma0QxPJeIiJtFjiooi81A8Ek2g1/h5+La8n
 fwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uJbb7vuxwMcg5PGEDE75LtUOyXkSQ6j7ZtCpt0SQhKA=;
 b=H/iNRV4gHUrXqaXuTMWl3fdvR9LYl91t/rRS5L/yQz3ckda/Yk9DlEcXzX9yTg9QW7
 PhVKG8B7AKg2hpRH+8zsf7EUx8VuHVHEQPxNdJgU7MRyPu+ZAVa7Sb6dQ2wa9zNFD6oU
 eUNcTeepE02uwOxLTTFOdP3Va2s7QmMyIiZkWwpBkxd6G7J7ctcxIe72Y/aqaWJNm8Ef
 hNjXAjkRbLrlMraZszybVogLESJoBEu/C6CgaebFO/ChvOFe5300Q9GjT/LlQkqeK9JD
 uKPONCdpF0/YbHLEmWhbBUXBxNN9s+zqlYdy0KvwJhO5qRWWpP1qOs6OrI+BxW5fo9b+
 iJwQ==
X-Gm-Message-State: AOAM531ynFxTIyced6REr9ENBi+jDg4KywGVkH2BhpIpoFbnfm3bXs0A
 U3MYOmEfvdRoYqqSLuEKyFi8eDpBFfHfLYGi4Fv9dg==
X-Google-Smtp-Source: ABdhPJzELT0jOQ3P2f8/7/Kukh0GQ0RzXLKbxN7cr/TZG7Lw4AbgNsh0svb3XOUs3I5tnpXBorThlZ4wjYcgC/wgrtc=
X-Received: by 2002:ae9:eb81:: with SMTP id
 b123mr17752029qkg.288.1597766169998; 
 Tue, 18 Aug 2020 08:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200804135817.5495-1-daniel.gutson@eclypsium.com>
 <CAK8P3a0_fJ0BfD5Qvxdo0s7CbjPWaGA8QTgYhbXR=omafOHH4Q@mail.gmail.com>
 <CAFmMkTHEm8k+5GZkVJbDZMEhMwpsqVKRb-hGskSpBstdLRuFyA@mail.gmail.com>
 <CAK8P3a27bTYyn3N+tX=i_6f4KrQkOmkUA1zUQfvCW7qw6smSkQ@mail.gmail.com>
 <CAFmMkTF9eVm0tpOKEy2rzdX=Scr3RwqHDFy_i24R3F5ok-4=eA@mail.gmail.com>
 <CAK8P3a3mf8_Y4DWe3WuBO-Xo0N4Jj=-rrtFzD6w0TriGZPu1_g@mail.gmail.com>
 <CAFmMkTFzmC=aY0gR6urLu-8Oq8aeHBUWi-TodG8XhXKCcC057A@mail.gmail.com>
 <CAK8P3a13N_wNORz_3cYHTN8t29pPrY+dJ+g+1Ga_MmG1TmrUQw@mail.gmail.com>
 <CAFmMkTGm3pMsBzEenYOsRbhOZKFhbHiZ5LxPyVmTdYTTRpKzVQ@mail.gmail.com>
 <CAK8P3a2_RV33kiJ0c34aopZ4iG7LYBR-u=-+BbC+Upyjh1T0Eg@mail.gmail.com>
In-Reply-To: <CAK8P3a2_RV33kiJ0c34aopZ4iG7LYBR-u=-+BbC+Upyjh1T0Eg@mail.gmail.com>
From: Daniel Gutson <daniel@eclypsium.com>
Date: Tue, 18 Aug 2020 12:55:59 -0300
Message-ID: <CAFmMkTHqQO1Gj7VeXr4Y_Umb1KzZc2Pf=1pDQvPPpb_XeAFPqQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Do not try to make the SPI flash
 chip writable
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_115613_953306_D850F6B4 
X-CRM114-Status: GOOD (  31.29  )
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

On Sun, Aug 16, 2020 at 5:42 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Aug 13, 2020 at 11:40 PM Daniel Gutson <daniel@eclypsium.com> wrote:
> >
> > On Thu, Aug 13, 2020 at 12:41 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Tue, Aug 4, 2020 at 11:26 PM Daniel Gutson <daniel@eclypsium.com> wrote:
> > > > On Tue, Aug 4, 2020 at 5:46 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > > > But wait, Mika, the author of the file, asked earlier not to remove
> > > > > > the module parameter of intel-spi, and just remove the unconditional
> > > > > > attempt to turn the chip writable in intle-spi-pci.
> > > > >
> > > > > Yes, and I think that is fine (aside from the inconsistency with bay trail
> > > > > that you have not commented on),
> > > >
> > > > There are two inconsistencies before any of my patches:
> > > > 1) in intel-spi.c: uses the module parameter only for bay trail.
> > > > 2) intel-spi.c uses a module parameter whereas intel-spi-pci doesn't
> > >
> > > Neither of these matches what I see in the source code. Please
> > > check again.
> > >
> > > Once more: intel-spi.c has a module parameter that controls writing
> > > to the device regardless of the back-end (platform or pci), purely
> > > in software.
> >
> > If I understand you correctly, this is not what I see:
> > If the deviceID is listed in intel-spi-pci.c
> > (https://elixir.bootlin.com/linux/latest/source/drivers/mtd/spi-nor/controllers/intel-spi-pci.c#L66)
> > then intel_spi_pci_probe will be called, where it unconditionally will
> > try to make the chip writable
> > https://elixir.bootlin.com/linux/latest/source/drivers/mtd/spi-nor/controllers/intel-spi-pci.c#L44
> > These devices correspond to the BXT and CNL devices (lines 19 and 23 resp.).
> >
> > Lines later (53), it will call intel-spi.c 's intel_spi_probe
> > function, which ends up calling intel_spi_init,
> > which checks for the type
> > (https://elixir.bootlin.com/linux/latest/source/drivers/mtd/spi-nor/controllers/intel-spi.c#L313)
> > It is in this switch where the module parameter is checked, but only
> > in the BYT case; however,
> > flow coming from intel-spi-pci is BXT and CNL as mentioned before,
> > landing in their case labels (lines 343 and 351 respectively)
> > where the module parameter is not checked.
> >
> > Therefore, for BXT and CNL probed in intel-spi-pci, the chip is turned
> > writable and later the module parameter is not honored.
>
> The module parameter is definitely honored on all hardware, but the driver
> only cares about the functionality it provides through the mtd interface:
>
> https://elixir.bootlin.com/linux/latest/source/drivers/mtd/spi-nor/controllers/intel-spi.c#L941

That is a logical constraint which doesn't impact in the hardware, which already
was changed before in
https://elixir.bootlin.com/linux/latest/source/drivers/mtd/spi-nor/controllers/intel-spi.c#L924

>
> If you care about other (malicious) code writing to the driver, please explain
> what the specific attack scenario is that you are worried about, and
> why you think
> this is not sufficient. What code would be able to write to the device
> if not the
> device driver itself?

Maybe Mika can answer this better, but what I'm trying to do is to
limit the possibility of
damage, as explained in the Kconfig:
"Intel PCH/PCU SPI flash PCI driver (DANGEROUS)"
"Say N here unless you know what you are doing. Overwriting the
  SPI flash may render the system unbootable."


>
>     Arnd



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
