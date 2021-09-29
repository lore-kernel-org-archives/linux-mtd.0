Return-Path: <SRS0=NzJj=OT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B13E9C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Sep 2021 16:13:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79A5261353
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Sep 2021 16:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79A5261353
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJtiDIpE95SC8UmokOCRoodmtfOnKf8FsoLJl+8rieI=; b=eec8N1RERZCf8S
	yC+yETmnNWjNVNwTSvIcitDOB0iooeLtjM1NdbJoSJ5BKQ6Eul3Fde32FMSjGgQToQsci/eDrf3Iz
	33neZCyrJpi2b4LAu0jI2ufkB0sX2Ud1d4YcCPO9olikH2w0UptJGElBTW+MptMCvHeLHWHWbu+od
	Ulh1bssEsfZ4J63hSIhvhqjw6czX6p/z70SF1ChnpIgOrcsPlncuJduM7/wPkCU+2oSa+bSTQtN7b
	BhXx3dvRBPcT8hUTQCQzfqZ+9FGOUkz4Sk3JPKtIvTwD/qLUmsziqC4yaMA+dC2ztyiP+02rQz9a/
	5aBdxROaR17rYS29A1eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVcCV-00BjtR-Uz; Wed, 29 Sep 2021 16:12:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVc8f-00BhdB-TQ; Wed, 29 Sep 2021 16:08:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 824406159A;
 Wed, 29 Sep 2021 16:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632931737;
 bh=dijA/w5Ov8JsJ92OsBZBg2039bqDhk6Rb6AyNDbPn44=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=A7HVbOR+DrHvVAUX06jSg7B6Wq4ghOA854/NwvbMD+z7Ftho8qbxSjSp+UTrYAbqY
 L4BWaPwySnxCMvZDR8WQJkZ4TQXHS2yukLJs8glxtY4l5NgFZRwUhOCMhAQyqdowIh
 aOZ/Z4HbZjMsI2RHn8D86gaZS/wglYy274Y+9bbJURjW/kfFyAsREwu5uqBJK8yRz9
 bPX4OIAZWTuffiKZMzKpg2itFCbbX6y8oODCMt0ReMeD7TSyipytfqwfvKE2fejGZ8
 RbojFF89n0E2UqlEZmdYUg98Pb4+r4isqr+RnEZyPfAKa9dUCsE+CIvRqBKm7O21k5
 A+06fLgT+/88Q==
Received: by mail-ed1-f47.google.com with SMTP id dj4so11033174edb.5;
 Wed, 29 Sep 2021 09:08:57 -0700 (PDT)
X-Gm-Message-State: AOAM533LIwkYRV4RGipTUxMSLU46v3tKnaQIFZCZNftl9Bi+LMAIJucY
 nHRU+dpuS0Yk6L9SZP+gQ/TZ8GIKj9zqDxwYZw==
X-Google-Smtp-Source: ABdhPJzrMbYO0rSYnqgmEqL2Di5ODf2KFSFLA0nJG3BUUjFxO4DRvWKc4rYXRSAUryn3020YRQn63vQqdkNzIXSPDII=
X-Received: by 2002:a17:906:7250:: with SMTP id
 n16mr562242ejk.147.1632931694940; 
 Wed, 29 Sep 2021 09:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210929115409.21254-1-zev@bewilderbeest.net>
In-Reply-To: <20210929115409.21254-1-zev@bewilderbeest.net>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 29 Sep 2021 11:08:03 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJH+b5oFuSP+KBLBsN5QTA6xASuqXJWXUaDkHhugXPpnQ@mail.gmail.com>
Message-ID: <CAL_JsqJH+b5oFuSP+KBLBsN5QTA6xASuqXJWXUaDkHhugXPpnQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] Dynamic aspeed-smc flash chips via "reserved" DT
 status
To: Zev Weiss <zev@bewilderbeest.net>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Kerr <jk@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, 
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Andrew Jeffery <andrew@aj.id.au>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_090858_026133_BF9BE6E5 
X-CRM114-Status: GOOD (  32.73  )
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

On Wed, Sep 29, 2021 at 6:54 AM Zev Weiss <zev@bewilderbeest.net> wrote:
>
> Hello,
>
> This patch series aims to improve a scenario that arises in OpenBMC
> and which isn't handled very well at the moment.  Certain devices, the
> example at hand being the flash chip used to store the host's firmware
> (e.g. the BIOS), may be shared between the BMC and the host system but
> only available to one or the other at any given time.  The device may
> thus be effectively off-limits to the BMC when it boots, and only
> usable after userspace performs the necessary steps to coordinate
> appropriately with the host (tracking its power state, twiddling
> GPIOs, sending IPMI commands, etc.).
>
> Neither the "okay" nor the "disabled" device-tree status values works
> nicely for the flash device this case -- an "okay" device gets probed
> automatically as soon as the device and a driver for it are available,
> and a "disabled" one gets forgotten about entirely, whereas we want
> the BMC's kernel to be aware of the existence of the device, but not
> try to actually do anything with it (i.e. probe it) until explicitly
> requested to do so by userspace.

While Linux treats 'disabled' as gone forever, that's not exactly what
the spec says. Either disabled or reserved could change in theory. But
I do agree 'reserved' is the right choice for your use.

> However, while there's no support for it currently in the kernel tree,
> the device-tree spec [0] also lists "reserved" as a possible status
> value, and its description seems like a fairly reasonable fit for this
> situation:
>
>   Indicates that the device is operational, but should not be used.
>   Typically this is used for devices that are controlled by another
>   software component, such as platform firmware.
>
> These patches start making use of this status value in the aspeed-smc
> driver.  The first patch adds a companion routine to
> of_device_is_available() that checks for a "reserved" status instead
> of "okay".  The second patch is a small MTD adjustment to allow an
> unregistered device to be cleanly re-registered.  Patches 3 through 5
> modify the aspeed-smc driver to allow individual chips to be attached
> and detached at runtime, and to avoid automatically attaching any
> marked as reserved.  Finally, patch 6 employs the newly-supported
> status in adding support for the BIOS flash device to the ASRock Rack
> e3c246d4i BMC.

I'm not sure this should be MTD specific. There's other cases where we
may want devices to become available. So the question is whether there
should be a more generic mechanism rather than each subsystem coming
up with their own thing.

There's out of tree support for applying overlays which could be used
here. The issue with it is we don't want it to be unconstrained where
an overlay can make any change anywhere in a DT.

Another possibility is making 'status' writeable from userspace. It is
just a sysfs file. That too may need to be opt-in.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
