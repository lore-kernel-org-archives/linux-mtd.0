Return-Path: <SRS0=GAYx=BO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09C9C433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2020 19:58:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A479920842
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2020 19:58:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cgeDQw7/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="eK5LMIJb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A479920842
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i2/RECRjaw5tlam0Kod5eJ2KmBjRg3OADRIqbdpbRrw=; b=cgeDQw7/x8S2/rzcIyBIvi6yd
	Q5blv55WbJs9X7cjKkfan+tRk9PhJzXPrKSe0x5CLiNNNWRAs/lNzwc6rYAhlyWKe8JtrKDn1Hpkl
	tGBscf3FgjBqlCNtHzXWku7nyJKu5so0QWqgJEYBBX3F0Viu7ROPsTGGyPz0mxF19GerOav7ueYwQ
	FKAGnAS38GnxlxP+YO4AIrVdA0xiU4ohU0BLPgleNg+EmsrM78slEb0cLB5G+z1BoyKcvjkkP0jhu
	MYlsVC//SJeQF369ct45/AZ+dtbnj76CN+EyeLXC2p+KrgRdg3BUdX8trW+PUXFaQvztesxRk1WVH
	tugMeYgkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k333v-0007WS-Tj; Tue, 04 Aug 2020 19:57:27 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k333s-0007Vl-Kp
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2020 19:57:25 +0000
Received: by mail-qk1-x744.google.com with SMTP id b14so37878028qkn.4
 for <linux-mtd@lists.infradead.org>; Tue, 04 Aug 2020 12:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rW2BRGX/Sbv+gGj9FdTRztmdZP7QOIjZDIipDKfRWKE=;
 b=eK5LMIJbJ9NjqaqvVkl+OzCuK4cud6Gd/EYg8VIYsoMyx68onSz/IpWrz0Nw5pEXOP
 cYKwsQO/BGtvqnJlEkwaA5svMn0FErGbplWqNn4nWci/+YGxmqB4bYlIf+ZGlgfRYj7s
 ffrJY5I7NrW+L+4SvFbpeRfb+OqKMFOJw9A5n96XTUqA9dlZTM2Kp9HKdLM2sJO0VdhG
 eILxKvpX3sAKVbj+ufiaprnyfw0xTZ1DyJekpJML4KGnc0mpysYv3wwGfmxseBBSt4VM
 32XLogPbppKD9QrHkbHSXTUcvz9nKCuhwXiFgwtxFahwiGMCyHZlkJ90GJ6T4A7TpiYw
 9nGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rW2BRGX/Sbv+gGj9FdTRztmdZP7QOIjZDIipDKfRWKE=;
 b=CRS90rRikF7W+RnbY6XBeZwTR6k8AJdhuIgDffj+HGM02BqGBX7OdoIKM0JgsPqY9N
 aOflGHiLUovwMrzsOV/jYabGN/JonTyQp1MPiYF3XHKbsUIRzUvPMDbpokryPyGPeIt8
 LDpMu6p6Hem/MzHJXhats1wtHWsj8fKWMZxErxJ2MgUesUcGvlpyEJiD3o9+R4cPWkH7
 XLhel4qrFi85GPx/fSXr8PZOkylH1pKleVGjnX5oa6m4hdEh4QFJVwg0JGC3ath+Q5Ty
 9jDR+ksiIi5b9WnHY7Vun8Z5Qp6BhKG63JO5x6UaiBMzwswlk8DjvyRARde7bkLr5vW5
 MZmA==
X-Gm-Message-State: AOAM532l/t7Sd26keV9E8AobGv6scibrASr0KCDUU0NPHwSv9xnvNQ8C
 Sv9WSeEXgey+Q98owSxq0fgAsZWlsw6Zr9LIKRR27Vja
X-Google-Smtp-Source: ABdhPJwfUyTmi7+YxwDcFb9y4O5WFQe1gX8+zuoljzZScW7TDgKuw4P0Shm+c9asxfdUTewciSF0Df1bxydY8BKpBUk=
X-Received: by 2002:a37:9f0a:: with SMTP id i10mr23651469qke.368.1596571042691; 
 Tue, 04 Aug 2020 12:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200804135817.5495-1-daniel.gutson@eclypsium.com>
 <CAK8P3a0_fJ0BfD5Qvxdo0s7CbjPWaGA8QTgYhbXR=omafOHH4Q@mail.gmail.com>
 <CAFmMkTHEm8k+5GZkVJbDZMEhMwpsqVKRb-hGskSpBstdLRuFyA@mail.gmail.com>
 <CAK8P3a27bTYyn3N+tX=i_6f4KrQkOmkUA1zUQfvCW7qw6smSkQ@mail.gmail.com>
In-Reply-To: <CAK8P3a27bTYyn3N+tX=i_6f4KrQkOmkUA1zUQfvCW7qw6smSkQ@mail.gmail.com>
From: Daniel Gutson <daniel@eclypsium.com>
Date: Tue, 4 Aug 2020 16:57:11 -0300
Message-ID: <CAFmMkTF9eVm0tpOKEy2rzdX=Scr3RwqHDFy_i24R3F5ok-4=eA@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Do not try to make the SPI flash
 chip writable
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_155724_997223_2BB35AF2 
X-CRM114-Status: GOOD (  26.96  )
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

On Tue, Aug 4, 2020 at 4:06 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Aug 4, 2020 at 5:49 PM Daniel Gutson <daniel@eclypsium.com> wrote:
> > On Tue, Aug 4, 2020 at 12:21 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >>
> >> On Tue, Aug 4, 2020 at 3:58 PM Daniel Gutson
> >> <daniel.gutson@eclypsium.com> wrote:
> >> >
> >> > Context, the intel-spi has a module argument that controls
> >> > whether the driver attempts to turn the SPI flash chip writeable.
> >> > The default value is FALSE (don't try to make it writeable).
> >> > However, this flag applies only for a number of devices, coming from the
> >> > platform driver, whereas the devices detected through the PCI driver
> >> > (intel-spi-pci) are not subject to this check since the configuration
> >> > takes place in intel-spi-pci which doesn't have an argument.
> >>
> >> This is still factually incorrect, as explained at least three times
> >> now.
> >>
> >> Please either make the same change for both the Bay Trail
> >> platform driver and the PCI driver, or explain why you want them to
> >> be different rather than incorrectly claiming that you change them to
> >> be the same.
> >
> >
> > What about just saying
> >
> > "This patch removes the attempt by the intel-spi-pci driver to
> > make the chip always writable."
>
> Yes, that is much better, though it still sounds like it would at the
> moment allow writing to the device from software without also
> setting the module parameter. I would say something like
>
> "Disallow overriding the write protection in the PCI driver
> with a module parameter and instead honor the current
> state of the write protection as set by the firmware."

But wait, Mika, the author of the file, asked earlier not to remove
the module parameter of intel-spi,
and just remove the unconditional attempt to turn the chip writable in
intle-spi-pci.
So I'm not touching intel-pci, just removing that code from
intel-spi-pci without adding
a new module parameter.

Are you aligned on this?


>
> (note also: imperative form in the patch description rather than
> "this patch ...").
>
>       Arnd



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
