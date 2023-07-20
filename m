Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D13AEB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 14:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GG7lk8TKrnyoNV45u/zgvN+kv9BgnWtrmRiXH92qq4k=; b=tAB7nYB8XGe8Pd
	OVdDrN1nEqlq5uIesrb1Ub18uH1j3DRu2wKEVGJJl4xYiVbMN7u7rqHHltEusaaJws5pwV131l8V+
	eSwXA12sKa9IftXgkLdqJewXZXzVBxvnXpcxP/mJ8eydfhn3HwRvbfjI0+Jr+VFgWdjcgCQKjj2gA
	G6by1yrmJg0vRYIA7JW9wfNQHdWS+JqMh6ks8qcj6aCvPOul4dxeCEDFL+hzDKa2vvZo7Mffp3WI+
	gT6cFdZkNjGSzFjsre0K3poP5PhhoWAdVnq286n8v8l67GZeF6bIYUa9luRYxnwhPTe5Ck4SVzxjx
	kMdSuoFJoaw5BtB2UTWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMUeT-00BO6N-12;
	Thu, 20 Jul 2023 14:29:09 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMUeO-00BO5H-1y
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 14:29:08 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qMUds-0004Lw-39;
	Thu, 20 Jul 2023 14:28:33 +0000
Date: Thu, 20 Jul 2023 15:28:23 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Hannes Reinecke <hare@suse.de>
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
	Jack Wang <jinpu.wang@ionos.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Yeqi Fu <asuk4.q@gmail.com>, Avri Altman <avri.altman@wdc.com>,
	Hans de Goede <hdegoede@redhat.com>, Ye Bin <yebin10@huawei.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 3/6] block: add new genhd flag GENHD_FL_NO_NVMEM
Message-ID: <ZLlEhxspjyMPl29b@makrotopia.org>
References: <cover.1689802933.git.daniel@makrotopia.org>
 <96510d925cb0ca1a3a132f8f8affd4bbdafd8fc9.1689802933.git.daniel@makrotopia.org>
 <0592e021-237d-6d41-7faf-e5b93aefbeea@suse.de>
 <ZLk6-aARrlAGenk3@makrotopia.org>
 <f6256c2c-0fd5-764b-92ec-343b99e79c36@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f6256c2c-0fd5-764b-92ec-343b99e79c36@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_072907_044540_C10E7468 
X-CRM114-Status: GOOD (  41.08  )
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

On Thu, Jul 20, 2023 at 04:03:22PM +0200, Hannes Reinecke wrote:
> On 7/20/23 15:47, Daniel Golle wrote:
> > On Thu, Jul 20, 2023 at 10:24:18AM +0200, Hannes Reinecke wrote:
> > > On 7/20/23 00:03, Daniel Golle wrote:
> > > > Add new flag to destinguish block devices which should not act as an
> > > > NVMEM provider, such as for example an emulated block device on top of
> > > > an MTD partition which already acts as an NVMEM provider itself.
> > > > 
> > > > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > > > ---
> > > >    include/linux/blkdev.h | 3 +++
> > > >    1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> > > > index 2f5371b8482c0..e853d1815be15 100644
> > > > --- a/include/linux/blkdev.h
> > > > +++ b/include/linux/blkdev.h
> > > > @@ -80,11 +80,14 @@ struct partition_meta_info {
> > > >     * ``GENHD_FL_NO_PART``: partition support is disabled.  The kernel will not
> > > >     * scan for partitions from add_disk, and users can't add partitions manually.
> > > >     *
> > > > + * ``GENHD_FL_NO_NVMEM``: NVMEM emulation is disabled.  The kernel will not
> > > > + * emulate an NVMEM device on top of this disk.
> > > >     */
> > > >    enum {
> > > >    	GENHD_FL_REMOVABLE			= 1 << 0,
> > > >    	GENHD_FL_HIDDEN				= 1 << 1,
> > > >    	GENHD_FL_NO_PART			= 1 << 2,
> > > > +	GENHD_FL_NO_NVMEM			= 1 << 3,
> > > >    };
> > > >    enum {
> > > Please reverse this flag. Most of the devices will not have an NVMEM
> > > partition, and we shouldn't require each and every driver to tag their
> > > devices.
> > > So please use GENHD_FL_NVMEM and only set this flag on devices which really
> > > have an NVMEM partition.
> > 
> > The idea here was to exclude all those devices which already implement
> > an NVMEM provider on a lower layer themselves, such as MTD.
> > In this cases it would be ambigous if the OF node represents the
> > NVMEM device registered by the MTD framework or if blk-nvmem should be
> > used.
> > 
> Hmm; not sure if I follow.
> In the end, it doesn't really matter whether you check for
> GENHD_FL_NO_NVMEM or !GENHD_FL_NVMEM.
> With the difference being that in the former case you have to
> tag 99% of all existing block devices, and in the latter you
> have to tag 1%.

That's not exactly true. In the current case I only have to flag MTD
(and UBI in future, I'm working on a UBI NVMEM provider as well) with
GENHD_FL_NO_NVMEM, so a 'compatible = "nvmem-cells"' in the
corresponding device tree node should not result in blk-nvmem creating
an NVMEM device based on the (mtd/ubi)block device, simply because the
MTD framework (and UBI in future) will already have created their own
NVMEM device attached to the very same device tree node.

In all other cases of block devices, the compatible string can be used
to unambigously decide whether an NVMEM device should be created or
not. blk-nvmem is opt-in, so unless the device is flagged by
'compatible = "nvmem-cells"' it will not do anything.

For all devices which anyway do not have any device tree representation
it won't do anything (think: loop, nbd, ...), we would not need to opt
them out using GENHD_FL_NO_NVMEM. Also all other drivers which do not
already bring their own NVMEM implementation won't need GENHD_FL_NO_NVMEM,
the absence of 'compatible = "nvmem-cells"' is enough to indicate that
they should not be considered as NVMEM providers.

The way you are suggesting will require that, in addition to selecting
the targetted block device in device tree, the block driver will also
have to set GENHD_FL_NVMEM. Hence we will need changes in MMC, NVMe
and potentially also SATA disk drivers setting GENHD_FL_NVMEM when
registering the disk.

> 
> > In all other cases device tree can unambigously indicate whether a
> > block device should serve as NVMEM provider (and right, most of them
> > never will).
> > 
> > However, reversing the logic seems fine just as well.
> 
> Thanks. Please do.

Either way is fine with me, just 99% vs. 1% is not the right argument
in this case.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
