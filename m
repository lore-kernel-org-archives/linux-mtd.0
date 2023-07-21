Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537A0EB64DC
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 11:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FkCJKuSjrC5W+cmYy8H7x2mUZJYMFzjxaW4nqY4vMPo=; b=o9qzL9KxTy4vH+
	S5uCJO0n2bgDTzwVGXDWfQqmG0sBFqx5+4QHRPXUZ9mx6oKgaBxuqnFsWjJa9miNHSZh+HCW87UeZ
	5F6xC0wyeHch9VSEt2Lh4cbZXeYIRGUP4lMu6uIXOoQfvPeG2HXvr44dt1x1Ifz+qCpwdNZ8E1kza
	A+5jxphJNJGXrqkOSHcU2ELW9oG1BTg+XdS4OqNOTHRouNyXpOSF/G3/2tA/nf1PPyt4Yk9GyISqV
	esBjNs9RT3+X7pEKAa7+fi3f0wYwLVrXaeI2skMGt0yHwc/Gl0BR6kRqMJab/TVNkMlIZ1PEORnyp
	5fo8H8pFPSnTySbQNcMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMo1Z-00Dt6U-0c;
	Fri, 21 Jul 2023 11:10:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMo1V-00Dt4v-1J
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jul 2023 11:10:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 73276619E3;
	Fri, 21 Jul 2023 11:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F39C433C8;
	Fri, 21 Jul 2023 11:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689937811;
	bh=myaPf1oyhAil/xlKJLpDYHkXcaR6WPBFmD+B4wkU+kg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FQ9XT91I62CH2cogbMjmf8eDfG6SRipgBPNykRuxTWkN75Ln4SmW914w52lOO540A
	 8n4Q3BDqaLkQV+sXhj3uZJ3Hr2RZtUq+ud0mjkGmfQVOEZSnH/YBlebfT7DZXwYVvA
	 H8hWIss+8QUC2XC5OJJk32DECJHj2l0W4VGXAn/s=
Date: Fri, 21 Jul 2023 13:10:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ming Lei <ming.lei@redhat.com>
Cc: Daniel Golle <daniel@makrotopia.org>, Jens Axboe <axboe@kernel.dk>,
	Ulf Hansson <ulf.hansson@linaro.org>,
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
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 0/6] nvmem: add block device NVMEM provider
Message-ID: <2023072118-flyable-aspect-060f@gregkh>
References: <cover.1689802933.git.daniel@makrotopia.org>
 <ZLpCscTMc8h16Tyd@ovpn-8-26.pek2.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZLpCscTMc8h16Tyd@ovpn-8-26.pek2.redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_041013_484696_8A0728DD 
X-CRM114-Status: GOOD (  25.41  )
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
> 
> Or Android doesn't support udev and initrd?

It does support initrd, but not really udev last I looked.

But it does allow request_firmware() to be called at boot time, so yes,
finding out why that isn't used here would be good.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
