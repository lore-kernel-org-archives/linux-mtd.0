Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA784EB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 18:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GqbyCJR+zbdHEZPRgfc7d0VFcO5JdquCuyD175myzZ8=; b=2LiamC7V2UcJtL
	ibKU9WAjfx6hO6KmPNh9DAWuYw9lqQig8TNlcqRp4PDPq4hVhVf1/XpriA4Ns3021Ymg92WqnsGhe
	zh07Fe6tYySUkLH84IF8x246wGFwBzwulGq2rQgC0fdS64wLc/WW+vJwsdU3wWx1TMPpjkxbUwpDr
	wg8D4jbIbY2POhHK1OqIUzEEqr5SC7Dc1hi6BUqKBKxEOjCz+wZWpWO4Zttp42vJQ/ji89BekDoEB
	qVsbZab50FtzB20Hs3meGlG2G36W6eZwgrex/CIU66hyGqxC+ghzCpAh9ar6l9QMjBmDG/MIKAr4d
	vufX9dyGp+kj/vU06uEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMY19-00BrZT-2g;
	Thu, 20 Jul 2023 18:04:47 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMY16-00BrYZ-1i
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 18:04:46 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qMY0H-0005Hr-29;
	Thu, 20 Jul 2023 18:03:53 +0000
Date: Thu, 20 Jul 2023 19:03:37 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Dave Chinner <dchinner@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Jan Kara <jack@suse.cz>, Damien Le Moal <dlemoal@kernel.org>,
	Ming Lei <ming.lei@redhat.com>, Min Li <min15.li@samsung.com>,
	Christian Loehle <CLoehle@hyperstone.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Hannes Reinecke <hare@suse.de>, Jack Wang <jinpu.wang@ionos.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Yeqi Fu <asuk4.q@gmail.com>, Avri Altman <avri.altman@wdc.com>,
	Hans de Goede <hdegoede@redhat.com>, Ye Bin <yebin10@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 0/6] nvmem: add block device NVMEM provider
Message-ID: <ZLl2-TW982oKXMnN@makrotopia.org>
References: <cover.1689802933.git.daniel@makrotopia.org>
 <352167df-34fc-ddff-def9-902873796536@acm.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <352167df-34fc-ddff-def9-902873796536@acm.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_110444_570157_D0442E5F 
X-CRM114-Status: GOOD (  32.60  )
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

On Thu, Jul 20, 2023 at 08:30:39AM -0700, Bart Van Assche wrote:
> On 7/19/23 15:01, Daniel Golle wrote:
> > On embedded devices using an eMMC it is common that one or more (hw/sw)
> > partitions on the eMMC are used to store MAC addresses and Wi-Fi
> > calibration EEPROM data.
> > 
> > Implement an NVMEM provider backed by block devices as typically the
> > NVMEM framework is used to have kernel drivers read and use binary data
> > from EEPROMs, efuses, flash memory (MTD), ...
> > 
> > In order to be able to reference hardware partitions on an eMMC, add code
> > to bind each hardware partition to a specific firmware subnode.
> > 
> > This series is meant to open the discussion on how exactly the device tree
> > schema for block devices and partitions may look like, and even if using
> > the block layer to back the NVMEM device is at all the way to go -- to me
> > it seemed to be a good solution because it will be reuable e.g. for NVMe.
> 
> Is my understanding correct that these devices boot from eMMC and not over
> Wi-Fi?

Yes, that's right.

> If so, why does this calibration data have to be stored on a raw
> block device?

It's just how many vendors decided to implement it in their firmware.

I reckon this happened mostly out of habbit and in order to avoid any
potential complexities in their manufacturing and QA processes -- most
of those processes have been created in a time when NOR flash was the
most common way to store firmware on embedded devices with Wi-Fi.

The occurance of raw NAND and SPI-NAND didn't change much about that,
most vendors still just use a raw MTD partition to store all that
per-device 'factory' data. Very few have have started to use raw data
inside UBI volumes (and I've been working on a UBI NVMEM driver as
well).

Also when it comes to eMMC they just keep doing things how they were
always doing them, just that instead of a raw NOR flash, some devices
nowadays come with an eMMC. Some vendors use the 'boot1' hardware
partition to store things like MAC addresses at raw offsets there
(GL.iNet for example [1]), others use small GPT or MBR partitions on
the main hardware partition of the eMMC to store MAC addresses and
calibration blobs (for example Adtran [2]).

> Why can't this information be loaded from a file on a
> filesystem?

Having this information stored in a file on a filesystem is also an
option, of course, but out in the wild you will hardly find it being
done like that, for the reason stated above and also because having
the OS pull the Ethernet MAC addresses somewhere from a filesystem
while in early user-space will require the OS to even know about the
individual hardware and how this should be done, so it's not exactly
beautiful, may need fsck, mounting, ... all before the machine can
become available with it's assigned MAC address on Ethernet.

The RaspberryPi and other brcmfmac-based systems are the exception to
the rule, here a simple text file stored on the root filesystem serves
the Wi-Fi calibration. This file hence needs to be shipped with the OS
instead of being stored on the device, and e.g. Raspbian does so. I
suppose this is mostly because there just isn't any permanent on-board
storage large enough and being a low-barrier DYI system they wanted to
make it easy for users designing systems besed on that (as in: not
having to mess with raw offsets or partitions, but rather just use
tools like Etcher on Windows and edit CR-LF terminated text files on a
FAT filesystem inside notepad...).

However, practically all Qualcomm and MediaTek Wi-Fi AP/Routers which
come with an eMMC come with their MAC addresses and Wi-Fi EEPROM data
stored as raw data inside a hardware or software partition.

[1]: https://github.com/dangowrt/linux/commit/8a24f03efb6b1dd7d8fdf68558146bacc71c2c1b
[2]: https://github.com/dangowrt/linux/commit/b14c0215641047d0447956b40bd344049a11becb

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
