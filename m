Return-Path: <SRS0=MAvX=B2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35559C433E1
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Aug 2020 08:43:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 030A62067C
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Aug 2020 08:43:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qk0+Nxm0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 030A62067C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NkJVd+cu/2B5zFJ0GCle8MQOQNyanCsd7wZG3TLje/Y=; b=qk0+Nxm0k157YMrzrDNvfJOsr
	yLLxFrGpifx84CEJhQZfTEnEFbLGnHJ3yzoJnndIeKGF3qqm6W07g9X4lHC5WafyrITOyPXZ4h+GN
	c1U3/fwUce6uEB1YPdAq3rhPPuFy8MPJ2hBz3jvwZFED/T/q9tWh18YT7iiCxIRpZJSTr3Hf/Enz9
	N3OIRZYndZylDXbKQ2kWfx3qJgEzMOBAG2zivJoBFNOUuxABeOTCkFgF8SVP3uRb95G4f5Fd72ovD
	WwcXVQZ4V9V6nDzJqPAK0ML+M5P01RWdInhDdlulAKd+hbvvr2SLIcvRrT1CvCGaYsMni4rD1TXBW
	LAlhC0BTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7EFJ-0001zC-Mx; Sun, 16 Aug 2020 08:42:29 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7EFG-0001yN-JX
 for linux-mtd@lists.infradead.org; Sun, 16 Aug 2020 08:42:27 +0000
Received: from mail-qv1-f44.google.com ([209.85.219.44]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MEFCF-1jzlz54BTJ-00AHnK for <linux-mtd@lists.infradead.org>; Sun, 16 Aug
 2020 10:42:19 +0200
Received: by mail-qv1-f44.google.com with SMTP id x7so6364322qvi.5
 for <linux-mtd@lists.infradead.org>; Sun, 16 Aug 2020 01:42:13 -0700 (PDT)
X-Gm-Message-State: AOAM5318HpaWVIS94GTphoj+w1I5II9bVfBqPr6Jwy6aIsTrIvYnv4gf
 oOvPMi7qQFF04CZgmKBVjq/FGtc1diRaT/BvOS8=
X-Google-Smtp-Source: ABdhPJyT4ba0KjtjvrTFsQR8K9en1ajCsl5ivlE6fwXu46F/qDg96TBozqonUPhoUOVqk1XJE/qc0o+pw2NR84KPM6g=
X-Received: by 2002:a0c:e604:: with SMTP id z4mr9908333qvm.222.1597567332693; 
 Sun, 16 Aug 2020 01:42:12 -0700 (PDT)
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
In-Reply-To: <CAFmMkTGm3pMsBzEenYOsRbhOZKFhbHiZ5LxPyVmTdYTTRpKzVQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 16 Aug 2020 10:41:52 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2_RV33kiJ0c34aopZ4iG7LYBR-u=-+BbC+Upyjh1T0Eg@mail.gmail.com>
Message-ID: <CAK8P3a2_RV33kiJ0c34aopZ4iG7LYBR-u=-+BbC+Upyjh1T0Eg@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Do not try to make the SPI flash
 chip writable
To: Daniel Gutson <daniel@eclypsium.com>
X-Provags-ID: V03:K1:mXBLbdPtQk4tYs/O4bovwc8eqPsBESmmoj88ZyYAMAljDkOuoXU
 7v+JKz3O8PUgrRJfqLECsnKrHIiPTUGAC2ZiVNTStAkXvjf1t+QVX+OrYG1CF4YF8tn5s7e
 lHBrUTOj8SRiXHwFsTxP4G85xNwXxgBy5a6lOv5eRdC4cILEIQZ7WDm2FLxsVDG6zvPC9wB
 oHOWS+3tyq/tzviuFRerw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6Drfukl5pKw=:XwHy6P8zOB8XRK8B79A3DF
 lD9t3FpkCAlZyNjVJLiqkwpWeRMlAOvIx8ipDJNT0juCbT9kmU126x9ZaCxIeHn69MB5sHnyS
 raaXVerF94cvOkVbrlJiT+GTLDbFfsljVHC5PssBGPm86qfRAgKZTyVquCHT5ucz0rwWPTMy/
 NuTLyoGVAHUm5plZcnb2ymmHsQLgIm1EG90yu/+1PgRvofhG4iiUbaxhSiJ5Rb2oeJxvlFU0w
 WBdLkz7F6BAp8Zf5NVOx8U5OnXvNnvg+LQHYsS20C92UhkXtnM3pH0oYz8iW62YwyfMqPP2f9
 AYwP480JZmIvCsAFlk7DbYRIAhEMCrQqbFx7oj2Ti2utgtIU0IYayvzL83tnmSZ1aFAJIE7LC
 lODBWt0Frh0d2k1rBSgaDsNg7QhlNevqTebtDf0cUUi3Usuc/5cAvM0NESAY+ee9FvB5uv/Iy
 eIgSMSTQFJb1se5fIUmqFemzoc4snKNgnPPxUgzVKcJgUU1TSSYkTlNxczFSzUUs9tSmlvkqI
 FYf0OtvNSKxmfiP8yvujZTz5bp/a79tMElEJ0XYBlCfKZj9I/92G8UU1KsFcNF4zUTym4cQtA
 R5zhSkLqCmBtbp89d7PYjOTK2SSX3IxWQW82KJPFpbCYsEaCwvTxCaHouHYgpQEw8Nydr6Sog
 2S7hB9H9Yeb0byFjWAWQ3SdjU58crOJgs/veBw/DGjkiTQgoMgllwLR12R5JpJmeIkI9TUHUK
 u3vlkCl+nLD6Re1Gz004v/oflflzS5hq2fkjwSNN4/spePjtRfJZQHAmA6H9gscAiu7jqozfl
 /G9Wesqxyz4480FY8gs4gxLHvvR04QoKTbhuC+z0n7KnduOLagklMSTQDzI/J8Ek0x5Y2J6Wh
 dhZX4bqi1TleAHOmd8fzh3d3zx0glF501XGNsJlHrMvGIkylwzHmpRJOR2qc38Wxt7w3OXGqR
 68VMlojSK/1RUQ6w8XIWYamZZGI7dZ8uHIOjuJqNmLVxUvmYPQidu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200816_044226_866929_41EDB207 
X-CRM114-Status: GOOD (  27.55  )
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

On Thu, Aug 13, 2020 at 11:40 PM Daniel Gutson <daniel@eclypsium.com> wrote:
>
> On Thu, Aug 13, 2020 at 12:41 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Tue, Aug 4, 2020 at 11:26 PM Daniel Gutson <daniel@eclypsium.com> wrote:
> > > On Tue, Aug 4, 2020 at 5:46 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > > But wait, Mika, the author of the file, asked earlier not to remove
> > > > > the module parameter of intel-spi, and just remove the unconditional
> > > > > attempt to turn the chip writable in intle-spi-pci.
> > > >
> > > > Yes, and I think that is fine (aside from the inconsistency with bay trail
> > > > that you have not commented on),
> > >
> > > There are two inconsistencies before any of my patches:
> > > 1) in intel-spi.c: uses the module parameter only for bay trail.
> > > 2) intel-spi.c uses a module parameter whereas intel-spi-pci doesn't
> >
> > Neither of these matches what I see in the source code. Please
> > check again.
> >
> > Once more: intel-spi.c has a module parameter that controls writing
> > to the device regardless of the back-end (platform or pci), purely
> > in software.
>
> If I understand you correctly, this is not what I see:
> If the deviceID is listed in intel-spi-pci.c
> (https://elixir.bootlin.com/linux/latest/source/drivers/mtd/spi-nor/controllers/intel-spi-pci.c#L66)
> then intel_spi_pci_probe will be called, where it unconditionally will
> try to make the chip writable
> https://elixir.bootlin.com/linux/latest/source/drivers/mtd/spi-nor/controllers/intel-spi-pci.c#L44
> These devices correspond to the BXT and CNL devices (lines 19 and 23 resp.).
>
> Lines later (53), it will call intel-spi.c 's intel_spi_probe
> function, which ends up calling intel_spi_init,
> which checks for the type
> (https://elixir.bootlin.com/linux/latest/source/drivers/mtd/spi-nor/controllers/intel-spi.c#L313)
> It is in this switch where the module parameter is checked, but only
> in the BYT case; however,
> flow coming from intel-spi-pci is BXT and CNL as mentioned before,
> landing in their case labels (lines 343 and 351 respectively)
> where the module parameter is not checked.
>
> Therefore, for BXT and CNL probed in intel-spi-pci, the chip is turned
> writable and later the module parameter is not honored.

The module parameter is definitely honored on all hardware, but the driver
only cares about the functionality it provides through the mtd interface:

https://elixir.bootlin.com/linux/latest/source/drivers/mtd/spi-nor/controllers/intel-spi.c#L941

If you care about other (malicious) code writing to the driver, please explain
what the specific attack scenario is that you are worried about, and
why you think
this is not sufficient. What code would be able to write to the device
if not the
device driver itself?

    Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
