Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AD1EB64DC
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 13:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BvR7+FtWrq2Y+Y2AWpR3n1v1ukHmyzajFPEIgyZ7NA0=; b=LVeXRWlttG9szB
	94AGqhPNGLz/ueUv+elSWVZS3A5h/jRsLmskXPHudjFFps0ngnGzxe8Jhi8UHNw1CJNdgC/rZuB0N
	qQIR702Q0i9yrs0sg3fEIh1FKdVlDgOYLdBzoQm8zKVNxV6GdUE29EY627CtO6E+X4WALuP2eWL8F
	fayDoNfEOic3adSQ3V69R3/BrmeGcPFaDlZb9SBsvA3BnyuGplZy56GtIck6LUhFVen89xH/rovv2
	AXO8d2hb7V5xW+PhifM1XtU4b6I/152z//OZGNBh08a+EELa2J2jW8seP1Cy16npnYwV8kmWij8iz
	4g4d5PjetjE7/mwrDSgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMqFI-00E9as-3C;
	Fri, 21 Jul 2023 13:32:36 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMqFG-00E9a3-0V
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jul 2023 13:32:35 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qMqEZ-00024i-03;
	Fri, 21 Jul 2023 13:31:51 +0000
Date: Fri, 21 Jul 2023 14:31:42 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Christoph Hellwig <hch@infradead.org>
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
Subject: Re: [RFC PATCH 6/6] block: implement NVMEM provider
Message-ID: <ZLqIvuK2EX2hROJo@makrotopia.org>
References: <cover.1689802933.git.daniel@makrotopia.org>
 <e5b709e15739dc0563e9497a2dbbe63050381db0.1689802933.git.daniel@makrotopia.org>
 <ZLonS7QXLj2lg4Zg@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZLonS7QXLj2lg4Zg@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_063234_195751_4B6F3F55 
X-CRM114-Status: GOOD (  21.11  )
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

On Thu, Jul 20, 2023 at 11:35:55PM -0700, Christoph Hellwig wrote:
> > +static int blk_nvmem_reg_read(void *priv, unsigned int from,
> > +			      void *val, size_t bytes)
> > +{
> > +	pgoff_t f_index = from >> PAGE_SHIFT;
> > +	struct address_space *mapping;
> > +	struct blk_nvmem *bnv = priv;
> > +	size_t bytes_left = bytes;
> > +	struct folio *folio;
> > +	unsigned long offs, to_read;
> > +	void *p;
> 
> Btw, this function really should be using kern_read on a file
> using filp_open instead of poking into block device internals.

Unfortunately filp_open requires a device inode on a filesystem to be
able to open a block device. What if the root filesystem has not yet
been mounted, or even requires NVMEM (let's say for the Ethernet MAC
address to be known for a nfsroot, nbd or iSCSI to work) to be
available first?

Can you imagine we could implement something like filp_open_bdev which
takes a (struct block_device *) as parameter instead of (const char *)?

That would allow the driver to open and read from the block device
before any filesystems (incl. /dev) become ready.

> That way you can even have a generic file provider that works
> on anything that can be read from.
> 

While this could also be useful, it doesn't fulfil the requirement of
making NVMEM available as early as possible for other drivers to use,
e.g. for the Ethernet MAC address.

And it would also heavily deviate from how things work with other types
of flash storage typically used in embedded Linux devices such as SPI
NOR or NAND flash which is represented as MTD device.

Sidenote: block2mtd is also not an option because one cannot reference
block2mtd devices in device tree, hence they cannot serve as NVMEM
providers.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
