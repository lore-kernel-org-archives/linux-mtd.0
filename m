Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A438EB64DC
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 11:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7XL0JtSXMtC7KJpIFm+JBNZoVLLfn6BpG1wN3XiNMhU=; b=0t22NEmrm1+iw8
	XbQLbLCEdr9T44pj6WDLd911pa2MWx0W/VMVNJQQMhJzBVPUso8Yh9jVnhZkUR5IWBz/NYaYhOQ8z
	YQl9Un46W13f9j7jM7k2aqYcONFmXGCaKl+gs9ruZQo5mkVQG6/FbYgihYiD2+qRL1pBb9yr8q4ZV
	HH4gg/xkdLsdlNjswODZMkkh478AAzzvnTYgNnyarc6EBawYJaQWpuABwiBHn0x8paDU2aFohfISi
	w3dY67O01gu2i2r0mxb6GuX8AirgmwTrHp6ZXYV+xsdhIVzhgLPAPmPF5tJHYalWnfTdtihBcW6wi
	7SoWp58mFBHwutqgZulA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMo13-00DsyN-0S;
	Fri, 21 Jul 2023 11:09:45 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMo11-00Dsxc-1I
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jul 2023 11:09:44 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qMo0O-0001P2-1P;
	Fri, 21 Jul 2023 11:09:04 +0000
Date: Fri, 21 Jul 2023 12:08:56 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Ming Lei <ming.lei@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Dave Chinner <dchinner@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Jan Kara <jack@suse.cz>, Damien Le Moal <dlemoal@kernel.org>,
	Min Li <min15.li@samsung.com>,
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
Message-ID: <ZLpnSK8sfZnEkcgj@makrotopia.org>
References: <cover.1689802933.git.daniel@makrotopia.org>
 <ZLpCscTMc8h16Tyd@ovpn-8-26.pek2.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZLpCscTMc8h16Tyd@ovpn-8-26.pek2.redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_040943_436392_9D2B5885 
X-CRM114-Status: GOOD (  31.58  )
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

On Fri, Jul 21, 2023 at 04:32:49PM +0800, Ming Lei wrote:
> On Wed, Jul 19, 2023 at 11:01:14PM +0100, Daniel Golle wrote:
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
> Just wondering why you don't use request_firmware() in drivers which consume
> the data, then the logic can be moved out of kernel, and you needn't to deal
> with device tree & block device.

The thing is: Why should the OS need to know about how to read
calibration to be fed into a wireless driver on a specific
hardware/firmware?

Or even worse: The MAC address of the main Ethernet interface? What if
for one of many possible reasons the extraction script in userland gets
broken and you would need to recover the system via SSH (because it's a
router or switch and doesn't even have any local console)?

Having information about the location of firmware artifacts be supplied
by the firmware (via device tree) seems to be the natural choice, and
also how it is done for devices booting off NOR or NAND flash by using
the NVMEM framework. Why should eMMC be the exception?

> 
> Or Android doesn't support udev and initrd?

Yes, sure, but then the OS ROM needs to know about and handle a lot of
very device-specific details in userland and if (unlike Android) the
same OS ROM should run on many devices that would mean it will have to
ship all of them in a huge initrd or root filesystem.

Also using userspace mechanics to acquire things as basic as a MAC
address seems overly complex and much more fragile than having the
firmware instruct the kernel via device tree to do so.

Hence, within the OpenWrt project, we've been working for years now to
push for Device Tree and lately for use of the NVMEM framework, exactly
to **reduce** the amount of hardware-specific knowledge in userland and
get rid of shell scripts acting as hotplug handlers for firmware
requests and such.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
