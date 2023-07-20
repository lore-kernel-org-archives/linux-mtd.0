Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4A2EB64DC
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 07:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4phqMP0YD7kO4KNZc+AKhlQxV+ye9E9SuHI+ID6kl5g=; b=ZSZHSh9+shK8Oz
	+/K9rz5EZb/l2x6Im+N7DHyMRH5n2SC9toaAyZPytmRpsbsm3cz6vYc+BCJZ+WfQrbnLcCNa5kp9e
	JRHPkUsG7TvthswCehGTkjTMunqixdJKlMsJ+TLNC/lzCEMBw9qGakil9pVL3xDQN2meTqJo7fQ+D
	cCbszYswfo5G1kFznXieNYbxk3DLn0Ccu4YSGw5RhwtCjC3yS/wWmsFmgDkIKHJfT9OvXc181d8uQ
	6nnmaOpbXF+8CDYci+ZO5GMtLlNvtXfWFdsHi06l8fpmsmZxz/ojEPqrYs5Cq5z4T2scxAeRhzXzq
	1q1uaKafjtdO9hVATrKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNiU-00A2sD-22;
	Thu, 20 Jul 2023 07:04:50 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNiO-00A2qs-00;
	Thu, 20 Jul 2023 07:04:44 +0000
Date: Thu, 20 Jul 2023 00:04:43 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Daniel Golle <daniel@makrotopia.org>
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
Message-ID: <ZLjci5bHzTI+/Kxs@infradead.org>
References: <cover.1689802933.git.daniel@makrotopia.org>
 <e5b709e15739dc0563e9497a2dbbe63050381db0.1689802933.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5b709e15739dc0563e9497a2dbbe63050381db0.1689802933.git.daniel@makrotopia.org>
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

The layering here is exactly the wrong way around.  This block device
as nvmem provide has not business sitting in the block layer and being
keyed ff the gendisk registration.  Instead you should create a new
nvmem backed that opens the block device as needed if it fits your
OF description without any changes to the core block layer.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
