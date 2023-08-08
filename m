Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64463C001B0
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Aug 2023 01:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vlRAUQ8D1drqU2ryU11Q7LsYTSmBTttB9MJ65iK/RnI=; b=HwO9OdF+iNINwA
	A3mM/+PaoXvtW4GOXLjlZa9PpWNR7mAa9d85+gYR4Gco+4rc40GwT5ZrPki4XsI1A8ba/T+ZqLgQ+
	4BemMtOt80cKShuJuYpoyBgFFItQdQCWsRyHbaQaPD/POspPdG3zYQdg6k9MNl3e4tesPH6eSNGYq
	fzGZVm2qr9FpjVWNM5avM5xWqR/NovO2/CTWFamGVAIpN96ObsmWtp5koOrW3IVGc9ymBA4el9Grs
	KwvwbOA8+ViiT/4b3dKMRb8oS2dNWqUUoDxvG7g0Qv0eSNQ7kWz8jxSjkrOf6gBu9f/KhYijrrxOd
	cVIOSE+l3Dxpko72mZsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTB8O-001Omc-1r;
	Tue, 08 Aug 2023 01:03:40 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTB8M-001Olu-06
	for linux-mtd@lists.infradead.org;
	Tue, 08 Aug 2023 01:03:39 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qTB7X-0002x3-0M;
	Tue, 08 Aug 2023 01:02:47 +0000
Date: Tue, 8 Aug 2023 02:02:36 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Jens Axboe <axboe@kernel.dk>, Miquel Raynal <miquel.raynal@bootlin.com>,
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
Subject: Re: [RFC PATCH 2/6] mmc: block: set fwnode of disk devices
Message-ID: <ZNGULFxXpLT7zn35@makrotopia.org>
References: <cover.1689802933.git.daniel@makrotopia.org>
 <1ce5f56df546cec25ef741f381286f1d7c33d000.1689802933.git.daniel@makrotopia.org>
 <CAPDyKFqhZtCHVmCNnm_Qm7X+=GtJY8uNJOWOgZXuTTVEw0msNA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPDyKFqhZtCHVmCNnm_Qm7X+=GtJY8uNJOWOgZXuTTVEw0msNA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_180338_073807_2CA6FBB8 
X-CRM114-Status: GOOD (  24.90  )
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

Hi Ulf,

thank you for reviewing and suggesting ways to improve this series!

On Mon, Aug 07, 2023 at 03:48:31PM +0200, Ulf Hansson wrote:
> On Thu, 20 Jul 2023 at 00:02, Daniel Golle <daniel@makrotopia.org> wrote:
> >
> > Set fwnode of disk devices to 'block', 'boot0' and 'boot1' subnodes of
> > the mmc-card. This is done in preparation for having the eMMC act as
> > NVMEM provider.
> 
> Sorry, but I don't quite understand what you are trying to do here.
> Maybe you should re-order the patches in the series so it becomes
> clear why this is needed?
> 
> Moreover, I don't see any DT docs being updated as a part of the
> series, which looks like it is needed too. That would also help to
> understand what you are proposing, I think.

I've prepared a tree on Github which now also includes commits adding
dt-bindings for block devices and partitions, so they can be referenced
as nvmem-cells provider.

The dt-schema addition supposedly explaining this specific patch:

https://github.com/dangowrt/linux/commit/b399a758f0e1c444ae9443dc80902a30de54af09

The whole tree:

https://github.com/dangowrt/linux/commits/for-nvmem-next

Most comments have been addressed, however, I still depend on using
either a class_interface *or* adding calls to add/remove the NVMEM
representation of a block device to block/genhd.c as well as
block/partitions/core.c, simply because afaik there isn't any better
way for in-kernel users of block devices to be notified about the
creation or removal of a block device.

Cheers


Daniel

> 
> >
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >  drivers/mmc/core/block.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
> > index f701efb1fa785..fc1a9f31bd253 100644
> > --- a/drivers/mmc/core/block.c
> > +++ b/drivers/mmc/core/block.c
> > @@ -2413,6 +2413,8 @@ static struct mmc_blk_data *mmc_blk_alloc_req(struct mmc_card *card,
> >                                               int area_type,
> >                                               unsigned int part_type)
> >  {
> > +       struct fwnode_handle *fwnode;
> > +       struct device *ddev;
> >         struct mmc_blk_data *md;
> >         int devidx, ret;
> >         char cap_str[10];
> > @@ -2509,6 +2511,12 @@ static struct mmc_blk_data *mmc_blk_alloc_req(struct mmc_card *card,
> >
> >         blk_queue_write_cache(md->queue.queue, cache_enabled, fua_enabled);
> >
> > +       ddev = disk_to_dev(md->disk);
> > +       fwnode = device_get_named_child_node(subname ? md->parent->parent :
> > +                                                      md->parent,
> > +                                            subname ? subname : "block");
> > +       ddev->fwnode = fwnode;
> > +
> >         string_get_size((u64)size, 512, STRING_UNITS_2,
> >                         cap_str, sizeof(cap_str));
> >         pr_info("%s: %s %s %s%s\n",
> 
> Kind regards
> Uffe

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
