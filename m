Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614FBEB64DC
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 06:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7DQ7KDrdYTrxQ2R6lroNnkzgPa3hPVRGchJfI4c3K78=; b=KjyCzcrzoTG1Ud
	HiTyjsQ2KINElFD6frx/MJ0klSOdOdMAPvUL4kKnqXS8RRB21YWxVCNk1RsJcuxZu6dVOBw8zrDWQ
	tcEDHZEQbfp0Ems5ZSLy4qeC9giyf3qJ1SH+7BQiL2Y3dUheJmkv2Eefb9OUeddUWB7K72bdXXv4R
	oF+OHiYgSdbsZ7U0Tsk9g9JomkCRom0wD5UWc63C/mkuVSMPj7jc5CuXcSH/t4zjXN2wIPsp8Hn+z
	au/yLS3AFHAxHdLiKoMTNS4MOWkcKBlHSMWdz7XNzUM9FPkLPqKATWZZzQbGiM2oGGdXAJC3o7lxU
	XgVe9yF3kf8EbgC2tGTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMjfU-00D2dD-2T;
	Fri, 21 Jul 2023 06:31:12 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qMjfO-00D2cj-2W;
	Fri, 21 Jul 2023 06:31:06 +0000
Date: Thu, 20 Jul 2023 23:31:06 -0700
From: Christoph Hellwig <hch@infradead.org>
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 6/6] block: implement NVMEM provider
Message-ID: <ZLomKmNe+EhpjI1K@infradead.org>
References: <cover.1689802933.git.daniel@makrotopia.org>
 <e5b709e15739dc0563e9497a2dbbe63050381db0.1689802933.git.daniel@makrotopia.org>
 <ZLjci5bHzTI+/Kxs@infradead.org>
 <ZLlaOB1sb8wSd7Aq@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZLlaOB1sb8wSd7Aq@makrotopia.org>
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

On Thu, Jul 20, 2023 at 05:02:32PM +0100, Daniel Golle wrote:
> On Thu, Jul 20, 2023 at 12:04:43AM -0700, Christoph Hellwig wrote:
> > The layering here is exactly the wrong way around.  This block device
> > as nvmem provide has not business sitting in the block layer and being
> > keyed ff the gendisk registration.  Instead you should create a new
> > nvmem backed that opens the block device as needed if it fits your
> > OF description without any changes to the core block layer.
> > 
> 
> Ok. I will use a class_interface instead.

I'm not sure a class_interface makes much sense here.  Why does the
block layer even need to know about you using a device a nvmem provider?
As far as I can tell your provider should layer entirely above the
block layer and not have to be integrated with it.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
