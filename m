Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5974DC4360F
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 12:01:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2397520883
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 12:01:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iF2comsi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2397520883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=12kZN1IdPcHOP53WMnhGhZnAZqUoYe+gr3yMDB7tFG0=; b=iF2comsi5kWc02
	QdHahVjknPRF2iiXhjUvVLH3DnBkGqi0YxIdWNkZpcIb0WMKMmymMqKYlTCYVpTnptC/f2XSfmPl5
	LggK5cD4QbigjOnuYjdJyoRQeo2EjcO3zuEFGvJUzJ6u0EXyYo11UoqXtApn2nP6/+WFS6ZrposIl
	aEqIyPw9/2CIPfarxPrx0TanXBs6NxH0iXs2uqkHecHOXIrHlWVUtlKVZIB2/cnSw1apnKWJWytSl
	mAqeevITsA7WuwuEkeXewUADrx8UFRnLL8LEaX2AEE53B6fsUQ4g/c4iw/VcbzwS3baapQPN7Thzw
	VJXhmhCvKnbK1bxSWVkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBI6v-0005UG-U5; Tue, 02 Apr 2019 12:01:49 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBI6s-0005Tb-Mg
 for linux-mtd@lists.infradead.org; Tue, 02 Apr 2019 12:01:48 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E60F7265D34;
 Tue,  2 Apr 2019 13:01:44 +0100 (BST)
Date: Tue, 2 Apr 2019 14:01:41 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Zhuohao Lee <zhuohao@chromium.org>
Subject: Re: [PATCH v1] mtd: core: add sysfs nodes for querying the flash
 name and id
Message-ID: <20190402140141.385a79d8@collabora.com>
In-Reply-To: <CABD5yb=JnwY_rMYwTOHjU3izoA8wxfRVgfAGK9zWh=7NZ7H23Q@mail.gmail.com>
References: <20190328045910.98250-1-zhuohao@chromium.org>
 <20190401112748.4a3d5539@collabora.com>
 <CABD5ybm_1BjKSsMFGy=LuM0bsCcBnnY7Eid_Ni3OQ5e+aFZ7pg@mail.gmail.com>
 <20190402095628.5d376263@collabora.com>
 <7077290a-8acc-465b-6ed0-fddd35ab8fd6@ti.com>
 <CABD5yb=JnwY_rMYwTOHjU3izoA8wxfRVgfAGK9zWh=7NZ7H23Q@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_050147_005217_19E3C522 
X-CRM114-Status: GOOD (  23.13  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, bbrezillon@kernel.org, richard@nod.at,
 Brian Norris <briannorris@chromium.org>,
 Marek =?UTF-8?B?VmHFoXV0?= <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2 Apr 2019 19:06:37 +0800
Zhuohao Lee <zhuohao@chromium.org> wrote:

> On Tue, Apr 2, 2019 at 4:26 PM Vignesh Raghavendra <vigneshr@ti.com> wrote:
> >
> >
> >
> > On 02/04/19 1:26 PM, Boris Brezillon wrote:  
> > > On Tue, 2 Apr 2019 15:39:54 +0800
> > > Zhuohao Lee <zhuohao@chromium.org> wrote:
> > >  
> > >> Thanks Boris for the comment. Please take a look the reply at below.
> > >>
> > >> On Mon, Apr 1, 2019 at 5:27 PM Boris Brezillon
> > >> <boris.brezillon@collabora.com> wrote:  
> > >>>
> > >>> On Thu, 28 Mar 2019 12:59:10 +0800
> > >>> Zhuohao Lee <zhuohao@chromium.org> wrote:
> > >>>  
> > >>>> Currently, we don't have sysfs nodes for querying the underlying flash
> > >>>> name and flash id. This information is important especially when we
> > >>>> want to know the flash detail of the defective system. In order to
> > >>>> support the query, we add two pointers (*flashname, *id) into the
> > >>>> mtd_info structure and create two sysfs nodes (flashname, id). This
> > >>>> patch is modified based on the SPI-NOR flash system as we only have
> > >>>> that system now. But the idea should be applied to the other flash
> > >>>> driver like NAND flash.
> > >>>>
> > >>>> The output of new sysfs nodes on my device are:
> > >>>> cat /sys/devices/platform/soc/11010000.spi/spi_master/spi1/spi1.0/mtd/mtd0/flashname
> > >>>> w25q64dw
> > >>>> cat /sys/devices/platform/soc/11010000.spi/spi_master/spi1/spi1.0/mtd/mtd0/id
> > >>>> ef6017  
> > >>>
> > >>> I'm not sure I like the idea of exposing this kind of info through
> > >>> sysfs as it then makes part of the ABI. Did you consider exposing that
> > >>> through debugfs?  
> > >>
> > >> Yes, i did consider the debugfs. I think the debugfs is depended on
> > >> CONFIG_DEBUG_FS.
> > >> If removing that config, the partname and partid will be lost. So, i
> > >> proposed to use
> > >> sysfs.  
> > >
> > > Then just enable debugfs if you need this information :P.  
> My original intention is adding the new sysfs nodes (i.e partname and
> partid) into the common place like mtdcore.c
> so that the userspace program can just read the common sysfs nodes.
> So far, what i can contribute is for the spi-nor but if the other
> flash drivers, like nand-flash, can also support
> the partname and partid query, then, we can have common sysfs nodes to
> query the underlying device info.
> Compare to the debugfs, i think different drivers may have different
> name for the partname and partid.

We've recently unified how MTD related stuff are exposed through
debugfs and you can now have generic MTD fields exposed there.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
