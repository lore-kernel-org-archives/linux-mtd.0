Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADDBC0015E
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 10:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZPq3QcDT4AbxsrOsj3Wo/IX3/+8IMfzn247ujvVOPBQ=; b=RTGXC8kU2XG/wq
	YsaKH9NSJ2eJPuZyT8hrPlczi4IEKJvgPzeQ2FPwxUPzp1ct+3e/1FuTdnsRhCAbXnLS5t2ktz+2m
	lJTWVo+yPTLKF7HM5w+I+riRE1I6rVGfkmhdhQicSExC1VevbyXYCfFoYim28pjxpjMxBrhq/WA9T
	v654ezQXBSI6pNlYe5523guG+bW5u1PqASs4DvCC7XVGGO0+Mu9+QvCkclzYlAIhttDTYS8HQ6r9U
	42bRp49i8KGPb2e6qmgWbjhT1ztt0z9tTJxWeY8daloKESPIJYOkcXwnVWn33EOVoGpc8IYJDhIBj
	lvdWlLEkGU1kvqICtS+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMnaA-00Do5Y-2Q;
	Fri, 21 Jul 2023 10:41:58 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMna8-00Do50-18
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jul 2023 10:41:57 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qMnZF-0001IB-0Q;
	Fri, 21 Jul 2023 10:41:01 +0000
Date: Fri, 21 Jul 2023 11:40:51 +0100
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
Message-ID: <ZLpgs-aZVHCQooi0@makrotopia.org>
References: <cover.1689802933.git.daniel@makrotopia.org>
 <e5b709e15739dc0563e9497a2dbbe63050381db0.1689802933.git.daniel@makrotopia.org>
 <ZLjci5bHzTI+/Kxs@infradead.org>
 <ZLlaOB1sb8wSd7Aq@makrotopia.org>
 <ZLomKmNe+EhpjI1K@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZLomKmNe+EhpjI1K@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_034156_391697_9E215CB1 
X-CRM114-Status: GOOD (  22.25  )
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

On Thu, Jul 20, 2023 at 11:31:06PM -0700, Christoph Hellwig wrote:
> On Thu, Jul 20, 2023 at 05:02:32PM +0100, Daniel Golle wrote:
> > On Thu, Jul 20, 2023 at 12:04:43AM -0700, Christoph Hellwig wrote:
> > > The layering here is exactly the wrong way around.  This block device
> > > as nvmem provide has not business sitting in the block layer and being
> > > keyed ff the gendisk registration.  Instead you should create a new
> > > nvmem backed that opens the block device as needed if it fits your
> > > OF description without any changes to the core block layer.
> > > 
> > 
> > Ok. I will use a class_interface instead.
> 
> I'm not sure a class_interface makes much sense here.  Why does the
> block layer even need to know about you using a device a nvmem provider?

It doesn't. But it has to notify the nvmem providing driver about the
addition of new block devices. This is what I'm using class_interface
for, simply to hook into .add_dev of the block_class.

> As far as I can tell your provider should layer entirely above the
> block layer and not have to be integrated with it.

My approach using class_interface doesn't require any changes to be
made to existing block code. However, it does use block_class. If
you see any other good option to implement matching off and usage of
block devices by in-kernel users, please let me know.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
