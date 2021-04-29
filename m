Return-Path: <SRS0=3Xy9=J2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C2C9C433ED
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 17:39:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA3FC613FF
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 17:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA3FC613FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=soYq3GFWLBFUUnVYbeJHN1T8vcG3FIEF0LnRl0+EQdY=; b=gOEB9A3vzFzAKX3xqcQk/LkcW
	3vkD0wg46nDrO3ZK61KYf7c0703R8haVGBu4b6sLrLNV6I6kh6+yaFCNX0LaRvzhY0d2h+rphqO1i
	Mr/jgf8m6G3kNlXdAsG2907Fn9ueRkVXg6StFQcF+vJ/1RBR8myL1+IxJhHpB0zbZ3uZOTxwSJUaf
	qAckONHummPX2VAEV4B3lhiKrJkXszigYGRjfaznT4ATlXHifoOUdE0dVILOr6mDSNSf7EucsqYFH
	z7gRoZv3PpkYR5iyi/If37C5FyQqwOmyUku2qfc2M1B9ovbOJmsu5sgRoop1eJ7FDb5KbdU34Xed7
	rGkY57VDg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcAcS-00682a-J4; Thu, 29 Apr 2021 17:38:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcAcP-00682E-VE
 for linux-mtd@desiato.infradead.org; Thu, 29 Apr 2021 17:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=JzmdyPVT6sF8v5IJxrF0ePBnI6iwiF+lddMno83ShcM=; b=XW8ihhMg5OiapXSoqB/m1mnnHX
 VbVq5OZAycdhvtpaytKi5eWovANAm/RGAnfv/lEhoTnYtFD1ONgwXlswPWyf91EHY02DQPwDNiIGN
 xBgef4FM3OSDzWfrDn9nTKwo/7FC7UL47bj2Q5U9wOANsjDYr23PzEuOTXRqszTyd0ZlvDeH7JtKI
 pnccpBoZlG14hs6907izYafHUExWiuOekGnF9i8AJGP33+5ukRw1xp/fn6wwIgYtbJTwcxalTrMdI
 AhRPU05FldJwgb48lcIeHVtOlRidrjIclxh4t831mcgr1trZKfec0nBj4ptr7KJCDbuqRd15ydrc4
 pzgKWnFg==;
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcAcN-000pBU-7q
 for linux-mtd@lists.infradead.org; Thu, 29 Apr 2021 17:38:28 +0000
Received: by mail-oi1-x22e.google.com with SMTP id i26so11941704oii.3
 for <linux-mtd@lists.infradead.org>; Thu, 29 Apr 2021 10:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JzmdyPVT6sF8v5IJxrF0ePBnI6iwiF+lddMno83ShcM=;
 b=h2MphwvCyxDj6JAzFv1sqfR7f2S7DjxL7DslZPuSUkInGLmoVHo+4sF9OqLaJY7PI/
 lLcbVYel4gRASRQJDGDVw5o0M4K6J5/8imPRIX5B11M/CwaJkzkCQ3Ms+y0EUqZYpCFR
 gtMyhVcaZFewikF0FoUawV5I4aZ6tk5YNiYHhDWwBzrGcZl/26fB/UMFkQnr0P6+5u9i
 4D3QKXvp3qXmbvoUhg9wsfH99sxU//gdu19oICCDKcJX6JX72PBk45YnirA5y3UNWN5I
 5Ne9QYOtB+UAp+gJdAqu5sg4PZOR/AKLHdy170FgTnjsICAeU8momD0fbgK+IfQA3+61
 941g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JzmdyPVT6sF8v5IJxrF0ePBnI6iwiF+lddMno83ShcM=;
 b=t0jYVvIh9wscWz5ONzSBAr0nnwAvCuxUbfEni8Z3fjXGmsUegpzNNIZhFq5CsOQ4i1
 U2SeDfAdBC++E9pqwJX5RQWZddRSgdFRI6G+7WdMxQirMOSEn4mCgrI5kKsNzRT+6FyC
 9ZUyppMSRfBmOzflqpGVKsusXRspKOPSpeZ1UERSJgnyDMIgCL4hZf1vFNLcvCgyBNzE
 vaSvu+eb3GbBptgA76DmB6XLVDNNK44EMS/P1mLxXnRERjl/+dcLt96rDvbRXWpjYluF
 2OUg4m15Vi+3S7lNuM+brW7SXO1DbaigYtDsPKsbTU/9BULXruUyramYxv7wPHehVVyB
 xLWA==
X-Gm-Message-State: AOAM531iD940jV7ljO9doRN3sVzGEsaUuV7NBH2HXltsq7nZTGM9x6M/
 3i21Ami8FAxgE8Ks3a4oFIVjRVEsamQ2ZacAL6Qp0A==
X-Google-Smtp-Source: ABdhPJw6pE5/BebvKhqFJnBOpU/gbbxqWhhs79qAZMJEcLTmylOvep5ffGlmZR/pcmieWSBqS89v/KWGGwr+pGHsCio=
X-Received: by 2002:aca:f0e:: with SMTP id 14mr7712111oip.16.1619717906062;
 Thu, 29 Apr 2021 10:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210429155713.28808-1-michael@walle.cc>
 <20210429155713.28808-3-michael@walle.cc>
 <CACqsJN8mrHUB9Ls3PG5R_B84+xUjf-2VakA=09mP_bodWnUgmw@mail.gmail.com>
 <04bc3eda0fa5a84ffff4b2f05721e2ac@walle.cc>
In-Reply-To: <04bc3eda0fa5a84ffff4b2f05721e2ac@walle.cc>
From: Alexander Williams <awill@google.com>
Date: Thu, 29 Apr 2021 10:38:14 -0700
Message-ID: <CACqsJN_TU08bzG5mZ5PgtYsJVVJHDdyUPB6yAO9CxpqTfby=-w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: add initial sysfs support
To: Michael Walle <michael@walle.cc>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Yicong Yang <yangyicong@hisilicon.com>, 
 Heiko Thiery <heiko.thiery@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_103827_304598_48999B03 
X-CRM114-Status: GOOD (  37.07  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Apr 29, 2021 at 9:44 AM Michael Walle <michael@walle.cc> wrote:
>
> Hi Alex,
>
> Am 2021-04-29 18:23, schrieb Alexander Williams:
> > On Thu, Apr 29, 2021 at 8:57 AM Michael Walle <michael@walle.cc> wrote:
> >>
> >> Add support to show the manufacturer, the partname and JEDEC
> >> identifier
> >> as well as to dump the SFDP table. Not all flashes list their SFDP
> >> table
> >> contents in their datasheet. So having that is useful. It might also
> >> be
> >> helpful in bug reports from users.
> >>
> >> Signed-off-by: Michael Walle <michael@walle.cc>
> >> ---
> >> Pratyush, Heiko, I've dropped your Acked and Tested-by because there
> >> were some changes.
> >>
> >>  .../ABI/testing/sysfs-bus-spi-devices-spi-nor | 31 +++++++
> >>  drivers/mtd/spi-nor/Makefile                  |  2 +-
> >>  drivers/mtd/spi-nor/core.c                    |  1 +
> >>  drivers/mtd/spi-nor/core.h                    |  2 +
> >>  drivers/mtd/spi-nor/sysfs.c                   | 92
> >> +++++++++++++++++++
> >>  5 files changed, 127 insertions(+), 1 deletion(-)
> >>  create mode 100644
> >> Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
> >>  create mode 100644 drivers/mtd/spi-nor/sysfs.c
> >>
> >> diff --git a/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
> >> b/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
> >> new file mode 100644
> >> index 000000000000..4c88307759e2
> >> --- /dev/null
> >> +++ b/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
> >> @@ -0,0 +1,31 @@
> >> +What:          /sys/bus/spi/devices/.../jedec_id
> >> +Date:          April 2021
> >> +KernelVersion: 5.14
> >> +Contact:       linux-mtd@lists.infradead.org
> >> +Description:   (RO) The JEDEC ID of the SPI NOR flash as reported by
> >> the
> >> +               flash device.
> >> +
> >> +
> >> +What:          /sys/bus/spi/devices/.../manufacturer
> >> +Date:          April 2021
> >> +KernelVersion: 5.14
> >> +Contact:       linux-mtd@lists.infradead.org
> >> +Description:   (RO) Manufacturer of the SPI NOR flash.
> >> +
> >> +
> >> +What:          /sys/bus/spi/devices/.../partname
> >> +Date:          April 2021
> >> +KernelVersion: 5.14
> >> +Contact:       linux-mtd@lists.infradead.org
> >> +Description:   (RO) Part name of the SPI NOR flash.
> >> +
> >> +
> >> +What:          /sys/bus/spi/devices/.../sfdp
> >> +Date:          April 2021
> >> +KernelVersion: 5.14
> >> +Contact:       linux-mtd@lists.infradead.org
> >> +Description:   (RO) This attribute is only present if the SPI NOR
> >> flash
> >> +               device supports the "Read SFDP" command (5Ah).
> >> +
> >> +               If present, it contains the complete SFDP (serial
> >> flash
> >> +               discoverable parameters) binary data of the flash.
> >> diff --git a/drivers/mtd/spi-nor/Makefile
> >> b/drivers/mtd/spi-nor/Makefile
> >> index 136f245c91dc..6b904e439372 100644
> >> --- a/drivers/mtd/spi-nor/Makefile
> >> +++ b/drivers/mtd/spi-nor/Makefile
> >> @@ -1,6 +1,6 @@
> >>  # SPDX-License-Identifier: GPL-2.0
> >>
> >> -spi-nor-objs                   := core.o sfdp.o swp.o otp.o
> >> +spi-nor-objs                   := core.o sfdp.o swp.o otp.o sysfs.o
> >>  spi-nor-objs                   += atmel.o
> >>  spi-nor-objs                   += catalyst.o
> >>  spi-nor-objs                   += eon.o
> >> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> >> index 20c7ee604731..57d8a4dae5fd 100644
> >> --- a/drivers/mtd/spi-nor/core.c
> >> +++ b/drivers/mtd/spi-nor/core.c
> >> @@ -3349,6 +3349,7 @@ static struct spi_mem_driver spi_nor_driver = {
> >>                 .driver = {
> >>                         .name = "spi-nor",
> >>                         .of_match_table = spi_nor_of_table,
> >> +                       .dev_groups = spi_nor_sysfs_groups,
> >
> > Putting these in the driver's dev_groups does create a divergence
> > between
> > different spi-nor controllers. For all the controllers supported in
> > drivers/mtd/spi-nor/controllers/, would their drivers need to add the
> > same sysfs
> > groups to get the same support?
>
> Well, one supports it and one does not, no? If support is added later,
> we should keep an eye on it. Unfortunately, I don't have any hardware
> to see if just adding the .dev_groups to another driver will just work.

Right, I didn't mean to indicate opposition. Since mtd/spi-nor has certainly
got its set of quirky controllers and drivers (e.g. intel-spi does not support
reading the sfdp in its driver, currently), it might make sense to make these
attributes dependent on the driver. This mechanism also makes the attributes
available at KOBJ_BIND time, so spi_nor_scan() will have run, getting rid of
a pesky race condition with user space.

This comment was just to point out the implications and make sure you and
maintainers are okay with that approach.

- Alex

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
