Return-Path: <SRS0=wA1i=BX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73ADBC433E1
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2020 15:42:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33FBC20829
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2020 15:42:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uUPfUTUd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33FBC20829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vvXklX+PZbJtJqx53eYw/fQsNLeBYDr4+MGAZSmfjNg=; b=uUPfUTUdmhaIQov3SZjqgK3zF
	DOMqJUYwKP1QSv2wzRY1agQHOQMDdGbPqagCO06qmv5jowZx8WZxjtKGR7cQHswz0C3awmTYXseop
	MhljFks0Mf69PpXdE1XuRdP3Sk9BxQSn15p8V8FbZPN0jV2VDtOgKomZ0tseJaSbisOzdRGoxPKWR
	A1VZjcjwQrUcJgzd7IKWoJRQ0ZlAXkxGKqPqclrBy1e8GSfJKha0sVeBwK6Jao+hyFJJEHmQyym3v
	zkjWoeTOERg8N5ZhaqQC3A9iBQebL9j4DZExEXVGxpAyVXS0NpP8haJYf2pQO+68Dhc8GsqjcRqGx
	Xs9DVtQFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6FMF-0000Zo-Kh; Thu, 13 Aug 2020 15:41:35 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6FMC-0000YU-O5
 for linux-mtd@lists.infradead.org; Thu, 13 Aug 2020 15:41:33 +0000
Received: from mail-qt1-f175.google.com ([209.85.160.175]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mow4E-1kU2FU2EIw-00qV9d for <linux-mtd@lists.infradead.org>; Thu, 13 Aug
 2020 17:41:26 +0200
Received: by mail-qt1-f175.google.com with SMTP id o22so4649375qtt.13
 for <linux-mtd@lists.infradead.org>; Thu, 13 Aug 2020 08:41:25 -0700 (PDT)
X-Gm-Message-State: AOAM533WvNROKVgddHPLnWaaM7Nn+R8Uqsvz5s4Gy104M3D0h0dHgEE4
 8AHI31NG4LhRbaXghSOL4q4DhEqFhWvIm08bMts=
X-Google-Smtp-Source: ABdhPJwBmHbur4R9QAEADlY4bGOU5Jt/LG8dUKhZzbWmRZKmKNVU9XmwD/IPUYWNtlm4yEdoEp1pVW6E6FaFtYVihzs=
X-Received: by 2002:ac8:688e:: with SMTP id m14mr5976151qtq.7.1597333284188;
 Thu, 13 Aug 2020 08:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200804135817.5495-1-daniel.gutson@eclypsium.com>
 <CAK8P3a0_fJ0BfD5Qvxdo0s7CbjPWaGA8QTgYhbXR=omafOHH4Q@mail.gmail.com>
 <CAFmMkTHEm8k+5GZkVJbDZMEhMwpsqVKRb-hGskSpBstdLRuFyA@mail.gmail.com>
 <CAK8P3a27bTYyn3N+tX=i_6f4KrQkOmkUA1zUQfvCW7qw6smSkQ@mail.gmail.com>
 <CAFmMkTF9eVm0tpOKEy2rzdX=Scr3RwqHDFy_i24R3F5ok-4=eA@mail.gmail.com>
 <CAK8P3a3mf8_Y4DWe3WuBO-Xo0N4Jj=-rrtFzD6w0TriGZPu1_g@mail.gmail.com>
 <CAFmMkTFzmC=aY0gR6urLu-8Oq8aeHBUWi-TodG8XhXKCcC057A@mail.gmail.com>
In-Reply-To: <CAFmMkTFzmC=aY0gR6urLu-8Oq8aeHBUWi-TodG8XhXKCcC057A@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 13 Aug 2020 17:41:07 +0200
X-Gmail-Original-Message-ID: <CAK8P3a13N_wNORz_3cYHTN8t29pPrY+dJ+g+1Ga_MmG1TmrUQw@mail.gmail.com>
Message-ID: <CAK8P3a13N_wNORz_3cYHTN8t29pPrY+dJ+g+1Ga_MmG1TmrUQw@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Do not try to make the SPI flash
 chip writable
To: Daniel Gutson <daniel@eclypsium.com>
X-Provags-ID: V03:K1:RNWcU+gqQ9LIhsuBlY0HgxZL66UVIEmIIUt9CoeVHUZx0b7J8bV
 Tx8ogxaB1uwWWuF2IEJBJVa8ZZAQK218KPoNwujussjyZtVUwZiVgXOhDtultEwuJSABwps
 Ho35xuvBZ9149hHgM493lC9f4o0AXNpSknZfiue23g+Sx6hbkV+D2lGNYIeERGm616JYruD
 FwNl7lUJ1vZ+OFNfSf4PQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:X/UDncSMP6s=:7liksHWiJI5mFFaqu+gSAn
 HhGsQtW3OeMQYGn4w1VBKtiPSeLIFVvyjDWzmv/u7nO1VnABfm9fRu5vM38oUtQu0ZeJrC/R9
 dTrf6AZsKtGR7qNlmdaK1D9+bVpzy0gk8e1gi5J9qmKD6cg9Uhzfx3ziYgqA64UGtJ+O4TOgy
 FI6rCsn0HjvTngVx/UmAV2jiC1FtxZN3/zal1a/8/s3iWsdlKVL9g5ABkdDWiSvNZweZs+ZkO
 IstKWEKK6N3RcxGCBhwsNG9tn4P9DDq4IFb/7U4Wg40p9fPg4MZb1hUvhWt8nEFfA0RLbUy8X
 0MnMjDWtOtv3nYS5GAv9EBu9r4r/W9JFmcKtG4oQcMzXh64zW+M+kXjHhk3gp0dYjjDRIPXuS
 xKHDikU9L4ce+ihor9W7+CRXl614tnP+TTexp7wHjcPoBgeiz9r81izUwJ+0kXLlidhCjwpAw
 KqYxhLk213c8PBBnJrYekeTp5OI/vJo/PVYakbGM22sqNJqU2a3c40x2QkS1Q2rZ8FqgVarUh
 L6a3FdxHvELm0InZu6eTObcGDulAipfoD9ogPEdni2wN8yd10h4Axd9vhFjwjxffw3wkSj76s
 5Vky0KNh4ZwqVXjZHr+KT0Yb+RZrKC2GYjiPyApPJAsfYt5Vbc7Qjve3TV4eF/pdM56davlHG
 q9mI2vvwKVsoM6Hrq3PJsXOXhQsaUGR9S5BggODo/69e12+QdlpG90gGA59o52u3iZTzsI3pQ
 9ETy94fcjyM+W4uYeWUTAcsxlyD33otfJR5B5DZPKHjZcWylMA+GCsWXIslRJv24L36tEXVIm
 qyrNxMePytGciqC4AufWAfgx1609mdrgbJQdNZqhuTlCr8mlc/Y/zxrol+lBAfHb1dmNTzw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_114132_995838_139BE061 
X-CRM114-Status: GOOD (  31.73  )
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

On Tue, Aug 4, 2020 at 11:26 PM Daniel Gutson <daniel@eclypsium.com> wrote:
> On Tue, Aug 4, 2020 at 5:46 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > But wait, Mika, the author of the file, asked earlier not to remove
> > > the module parameter of intel-spi, and just remove the unconditional
> > > attempt to turn the chip writable in intle-spi-pci.
> >
> > Yes, and I think that is fine (aside from the inconsistency with bay trail
> > that you have not commented on),
>
> There are two inconsistencies before any of my patches:
> 1) in intel-spi.c: uses the module parameter only for bay trail.
> 2) intel-spi.c uses a module parameter whereas intel-spi-pci doesn't

Neither of these matches what I see in the source code. Please
check again.

Once more: intel-spi.c has a module parameter that controls writing
to the device regardless of the back-end (platform or pci), purely
in software. The hardware write-protect setting where available
works in addition that and prevents writing even if the module
parameter is set to writeable.

> > but that only touches the hardware
> > write-protection, which doesn't really have any effect unless user
> > space also configures the driver module to allow writing to the
> > mtd device.
> >
> > > So I'm not touching intel-pci, just removing that code from
> > > intel-spi-pci without adding a new module parameter.
> > >
> > > Are you aligned on this?
> >
> > One of us is still very confused about what the driver does.
> > You seem to have gone back to saying that without the
> > change a user could just write to the device even without
> > passing the module parameter to intel-spi.ko?
>
> What I'm trying to say is that, if the BIOS is unlocked
> (no driver involvement here), the intel-spi-pci turns the
> chip writable even without changing the module parameter of intel-spi.
> This is because the attempt to turn the chip writable occurs in
> the probing of intel-spi-pci, that is, earlier than the intel-spi
> initialization.

My question was why you even care whether the hardware
bit is set to writeable if the driver disallows writing. I think the
answer is that you misread the driver.

       Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
