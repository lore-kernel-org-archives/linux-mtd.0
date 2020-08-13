Return-Path: <SRS0=wA1i=BX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C8CC433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2020 21:41:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E9ED20768
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2020 21:41:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QmOIxliA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="V5j1ZdhL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E9ED20768
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VHw/mMznGBHWBLVbs3hGhCNCP60sNkFdOds4037JFQ0=; b=QmOIxliAKq/YJhNEWZD+RwSLo
	ifKH1uq8136QlUlvvs97azZnO3uvo5GK9pQBEFkfuwv92jmKxwkmqe7BoYewbqILYVkJhpa4l9FHy
	pqqclg3v3uak5a7GPNfA8zX859W06jtyDLUc7k5OZn5512gZy85q3WxelO+1tejc7AjPGljS1r7z9
	63avKDiOhyERmLFlDGqq6lDmpEO9LKAIAbHHFb9DjVtRCZa/lpyZRqayyP9ZTFPbbw+TKvIw2Zz2q
	ENNRYpAN2t0ffvqFo20VgyMVZK7a/C+QUeAzFYHSPUF+E+FXM6sOx+sLV586Yc2TzIfQ4KQ52goCx
	Zd+KJ007w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6Kxv-0001JL-Sx; Thu, 13 Aug 2020 21:40:51 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6Kxt-0001Ij-Pu
 for linux-mtd@lists.infradead.org; Thu, 13 Aug 2020 21:40:50 +0000
Received: by mail-qv1-xf42.google.com with SMTP id b2so3375545qvp.9
 for <linux-mtd@lists.infradead.org>; Thu, 13 Aug 2020 14:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q0ojIysJtPe9HFSEWoGVpZim3QRqJX9wLnTMO9Q2Ah4=;
 b=V5j1ZdhLi9JoGsI1Mg59PBoNNDoUiDIptYbdhxaXyy9hzzbT1Agh3YKti4OfRdPLXq
 XpzGEB/84iroQZQQU07vwFQHNGIq4cK4qJf6uhxBGZVxk6Am7k/KVA4Dbl/IVpK+d7DS
 IJ5cZd8fvRfyxk8lxoH5uRks8ypm1mF3uAGmNoQK2HtdlMX97NJa2vZl/zfzOw2UhIbg
 27Uuz4l4sHV58/a3/2D0jlOrVpoluSjM/UiAuInA9tnmE5B32As7a8YaE0JEg6HPfM9i
 l89FeKArSLc6CmYcNxRBK63JTJp7uut9pVWy7T1dxj8R2ErbvE6RiJhqb501/9N2Ft5d
 GZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q0ojIysJtPe9HFSEWoGVpZim3QRqJX9wLnTMO9Q2Ah4=;
 b=VPhwO38ZbugLWcu+fxz1Y4038wI7VC9eMrOnHm65qgatMTTObqzbJ3WUSRb5EJMvo3
 NMlR5+Hbo+ooSEJB3EozduC1kQKPp1Iw+wAnq+vtkmZwWOf/nj4czcWQKrE3eB7lbwia
 oF1EWIpOqy+YMt8Js3kksx1mlldLGJ0QXSW1FHXPqdYny6CIdUD53qcxIZj7rPgBBdlE
 BgHUh0UrT95ZvXAtdUPLago6RNC96hUhT4vpn0igdfPal+Ut5gaXkaHDYeF1e+9BVoU5
 ho4b4VOBl57fE8Ck0NsyhacNJLQCinesrNfPmMQU1YF/PTjx+wGQz+VyKtia95tdqOME
 PCxw==
X-Gm-Message-State: AOAM5301kTDNL4FNdFSu0WjxIii4K+4d28kkg8hXvXzFmeZKodS9AvB2
 gGKfkjKAmBqQLlR8PRx4l3dg1LLPgxBePbcuhAeXOg==
X-Google-Smtp-Source: ABdhPJz26JMnJY2pl3AV9GgZ7zaj6tqMi0U/+2mh3l4fvVM2Jgrrb6S5lOzCQeSKmO9F2GpbSDh/RhfijmRfBdAN6e4=
X-Received: by 2002:ad4:46ac:: with SMTP id br12mr6701109qvb.236.1597354845858; 
 Thu, 13 Aug 2020 14:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200804135817.5495-1-daniel.gutson@eclypsium.com>
 <CAK8P3a0_fJ0BfD5Qvxdo0s7CbjPWaGA8QTgYhbXR=omafOHH4Q@mail.gmail.com>
 <CAFmMkTHEm8k+5GZkVJbDZMEhMwpsqVKRb-hGskSpBstdLRuFyA@mail.gmail.com>
 <CAK8P3a27bTYyn3N+tX=i_6f4KrQkOmkUA1zUQfvCW7qw6smSkQ@mail.gmail.com>
 <CAFmMkTF9eVm0tpOKEy2rzdX=Scr3RwqHDFy_i24R3F5ok-4=eA@mail.gmail.com>
 <CAK8P3a3mf8_Y4DWe3WuBO-Xo0N4Jj=-rrtFzD6w0TriGZPu1_g@mail.gmail.com>
 <CAFmMkTFzmC=aY0gR6urLu-8Oq8aeHBUWi-TodG8XhXKCcC057A@mail.gmail.com>
 <CAK8P3a13N_wNORz_3cYHTN8t29pPrY+dJ+g+1Ga_MmG1TmrUQw@mail.gmail.com>
In-Reply-To: <CAK8P3a13N_wNORz_3cYHTN8t29pPrY+dJ+g+1Ga_MmG1TmrUQw@mail.gmail.com>
From: Daniel Gutson <daniel@eclypsium.com>
Date: Thu, 13 Aug 2020 18:40:34 -0300
Message-ID: <CAFmMkTGm3pMsBzEenYOsRbhOZKFhbHiZ5LxPyVmTdYTTRpKzVQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Do not try to make the SPI flash
 chip writable
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_174049_880114_49953E9E 
X-CRM114-Status: GOOD (  34.94  )
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

On Thu, Aug 13, 2020 at 12:41 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Aug 4, 2020 at 11:26 PM Daniel Gutson <daniel@eclypsium.com> wrote:
> > On Tue, Aug 4, 2020 at 5:46 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > But wait, Mika, the author of the file, asked earlier not to remove
> > > > the module parameter of intel-spi, and just remove the unconditional
> > > > attempt to turn the chip writable in intle-spi-pci.
> > >
> > > Yes, and I think that is fine (aside from the inconsistency with bay trail
> > > that you have not commented on),
> >
> > There are two inconsistencies before any of my patches:
> > 1) in intel-spi.c: uses the module parameter only for bay trail.
> > 2) intel-spi.c uses a module parameter whereas intel-spi-pci doesn't
>
> Neither of these matches what I see in the source code. Please
> check again.
>
> Once more: intel-spi.c has a module parameter that controls writing
> to the device regardless of the back-end (platform or pci), purely
> in software.

If I understand you correctly, this is not what I see:
If the deviceID is listed in intel-spi-pci.c
(https://elixir.bootlin.com/linux/latest/source/drivers/mtd/spi-nor/controllers/intel-spi-pci.c#L66)
then intel_spi_pci_probe will be called, where it unconditionally will
try to make the chip writable
https://elixir.bootlin.com/linux/latest/source/drivers/mtd/spi-nor/controllers/intel-spi-pci.c#L44
These devices correspond to the BXT and CNL devices (lines 19 and 23 resp.).

Lines later (53), it will call intel-spi.c 's intel_spi_probe
function, which ends up calling intel_spi_init,
which checks for the type
(https://elixir.bootlin.com/linux/latest/source/drivers/mtd/spi-nor/controllers/intel-spi.c#L313)
It is in this switch where the module parameter is checked, but only
in the BYT case; however,
flow coming from intel-spi-pci is BXT and CNL as mentioned before,
landing in their case labels (lines 343 and 351 respectively)
where the module parameter is not checked.

Therefore, for BXT and CNL probed in intel-spi-pci, the chip is turned
writable and later the module parameter is not honored.

> The hardware write-protect setting where available
> works in addition that and prevents writing even if the module
> parameter is set to writeable.
>
> > > but that only touches the hardware
> > > write-protection, which doesn't really have any effect unless user
> > > space also configures the driver module to allow writing to the
> > > mtd device.
> > >
> > > > So I'm not touching intel-pci, just removing that code from
> > > > intel-spi-pci without adding a new module parameter.
> > > >
> > > > Are you aligned on this?
> > >
> > > One of us is still very confused about what the driver does.
> > > You seem to have gone back to saying that without the
> > > change a user could just write to the device even without
> > > passing the module parameter to intel-spi.ko?
> >
> > What I'm trying to say is that, if the BIOS is unlocked
> > (no driver involvement here), the intel-spi-pci turns the
> > chip writable even without changing the module parameter of intel-spi.
> > This is because the attempt to turn the chip writable occurs in
> > the probing of intel-spi-pci, that is, earlier than the intel-spi
> > initialization.
>
> My question was why you even care whether the hardware
> bit is set to writeable if the driver disallows writing. I think the
> answer is that you misread the driver.
>
>        Arnd



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
