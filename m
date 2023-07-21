Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25133EB64DC
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 11:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wu6FRbT+XO8kRI+gN7rHVFpRHlYvX7x35p+ihpaSGsk=; b=bGL5Vk6DP1Rw+N
	X42P4V/mqwmvn5bRMEh6lq7karcrndsx1e/3S20dAn7i66TTlx6a17/vo0gTJG2DDs81jpOXY/qwc
	hnBwbcEDNCS3MCot5ryhk7k7KKXQnsQISduwiXtWov/ds514yQoKpN/8bpNDpx7ahI2uIcKAFahr0
	9pd24gi0K8iYXEA7X7a+Q3clpIebLH+EOBH3G4tBeD3F/fKOxMloM1qy/WdSwSyEDXv9vbpTixzoP
	K2dbICdb8TpsViF59l9WdliLhhb5vmDT+emOMAIJ3mSQuhuOAaiSP4Bth9igewCRNuaP17sIh8xsf
	HczGJRjjFi8qvxWXdTGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMoTm-00Dx7B-1R;
	Fri, 21 Jul 2023 11:39:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMoTj-00Dx6A-09
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jul 2023 11:39:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4052861A00;
	Fri, 21 Jul 2023 11:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 021E2C433C8;
	Fri, 21 Jul 2023 11:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689939561;
	bh=PMNh2QFy+gw37kYrRWosLj1slA/IC/7XBzvdMwf52B4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eqx2QmBQR+y2S043or4uUfKmBOjKkAmdOcHbqjtBnd/3stvhl36OkglbVW17JgX/g
	 1y+ZwDLnRh2Wfc9UD6HFSBbyCFUR0FDsQNd/SerHhQpQ+2d+K0BzUTjq3IJ0lw4RNt
	 GmfrZWmklx1RQKj44L1bK0Szg3dKZb1pEkQ7xekQ=
Date: Fri, 21 Jul 2023 13:39:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Christoph Hellwig <hch@infradead.org>, Jens Axboe <axboe@kernel.dk>,
	Ulf Hansson <ulf.hansson@linaro.org>,
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
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 6/6] block: implement NVMEM provider
Message-ID: <2023072106-partly-thank-8657@gregkh>
References: <cover.1689802933.git.daniel@makrotopia.org>
 <e5b709e15739dc0563e9497a2dbbe63050381db0.1689802933.git.daniel@makrotopia.org>
 <ZLjci5bHzTI+/Kxs@infradead.org>
 <ZLlaOB1sb8wSd7Aq@makrotopia.org>
 <ZLomKmNe+EhpjI1K@infradead.org>
 <ZLpgs-aZVHCQooi0@makrotopia.org>
 <2023072128-shadow-system-1903@gregkh>
 <ZLpsQg3tDj2gEelv@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZLpsQg3tDj2gEelv@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_043923_175339_605A7F72 
X-CRM114-Status: GOOD (  42.84  )
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

On Fri, Jul 21, 2023 at 12:30:10PM +0100, Daniel Golle wrote:
> On Fri, Jul 21, 2023 at 01:11:40PM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Jul 21, 2023 at 11:40:51AM +0100, Daniel Golle wrote:
> > > On Thu, Jul 20, 2023 at 11:31:06PM -0700, Christoph Hellwig wrote:
> > > > On Thu, Jul 20, 2023 at 05:02:32PM +0100, Daniel Golle wrote:
> > > > > On Thu, Jul 20, 2023 at 12:04:43AM -0700, Christoph Hellwig wrote:
> > > > > > The layering here is exactly the wrong way around.  This block device
> > > > > > as nvmem provide has not business sitting in the block layer and being
> > > > > > keyed ff the gendisk registration.  Instead you should create a new
> > > > > > nvmem backed that opens the block device as needed if it fits your
> > > > > > OF description without any changes to the core block layer.
> > > > > > 
> > > > > 
> > > > > Ok. I will use a class_interface instead.
> > > > 
> > > > I'm not sure a class_interface makes much sense here.  Why does the
> > > > block layer even need to know about you using a device a nvmem provider?
> > > 
> > > It doesn't. But it has to notify the nvmem providing driver about the
> > > addition of new block devices. This is what I'm using class_interface
> > > for, simply to hook into .add_dev of the block_class.
> > 
> > Why is this single type of block device special to require this, yet all
> > others do not?  Encoding this into the block layer feels like a huge
> > layering violation to me, why not do it how all other block drivers do
> > it instead?
> 
> I was thinkng of this as a generic solution in no way tied to one specific
> type of block device. *Any* internal block device which can be used to
> boot from should also be usable as NVMEM provider imho.

Define "internal" :)

And that's all up to the boot process in userspace, the kernel doesn't
care about this.

> > > > As far as I can tell your provider should layer entirely above the
> > > > block layer and not have to be integrated with it.
> > > 
> > > My approach using class_interface doesn't require any changes to be
> > > made to existing block code. However, it does use block_class. If
> > > you see any other good option to implement matching off and usage of
> > > block devices by in-kernel users, please let me know.
> > 
> > Do not use block_class, again, that should only be for the block core to
> > touch.  Individual block drivers should never be poking around in it.
> 
> Do I have any other options to coldplug and be notified about newly
> added block devices, so the block-device-consuming driver can know
> about them?

What other options do you need?

> This is not a rhetoric question, I've been looking for other ways
> and haven't found anything better than class_find_device or
> class_interface.

Never use that, sorry, that's not for a driver to touch.

> Using those also prevents blk-nvmem to be built as
> a module, so I'd really like to find alternatives.
> E.g. for MTD we got struct mtd_notifier and register_mtd_user().

Your storage/hardware driver should be the thing that "finds block
devices" and registers them with the block class core, right?  After
that, what matters?

confused,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
