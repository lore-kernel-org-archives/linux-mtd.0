Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFD6C52D7C
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2024 11:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9pKzQ723TwRDNrJfpLMdTyztiBClajeslM7L40PcMY=; b=k7XKCD3Y8RoWwx
	5iHNSWmysqE4ThlpWbiuj6Xrh0SQ5GgDUHIeHxEfLhKyE3a74Kx7Iuc/tppTtjFXAW0ylgeIXfz0Q
	ktikgsw+c5F8NcOgfBf06n5kObUBA5I3wVjnKMLMstohpjEgMfXyeiWkvdYZLSe5rWB1y1T8T9WIu
	ySH5cQ//3d4JItR/m3tr+6GcSlkge2YY/NDxvL024aCYGHx3Seq1jGYRKNS6z9aCrR7sURUMr6+Go
	9wCXxZb0nrdfjSu55UahrxfgpDW+bpcRywT4bOKc6U7wuab6H47q2ukETTJrIEHttgT0gj2Ab/oSp
	K4qX6mijPaxGazhBVHMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdSyF-000000006YL-05D7;
	Mon, 12 Aug 2024 11:12:15 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdSyC-000000006Xc-0ywU;
	Mon, 12 Aug 2024 11:12:13 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id C778B68AFE; Mon, 12 Aug 2024 13:12:05 +0200 (CEST)
Date: Mon, 12 Aug 2024 13:12:05 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Joern Engel <joern@lazybastard.org>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Saravana Kannan <saravanak@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Florian Fainelli <f.fainelli@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org
Subject: Re: [PATCH v4 2/7] nvme: assign of_node to nvme device
Message-ID: <20240812111205.GC14300@lst.de>
References: <20240809172106.25892-1-ansuelsmth@gmail.com> <20240809172106.25892-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240809172106.25892-3-ansuelsmth@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_041212_434996_F215CFAA 
X-CRM114-Status: GOOD (  15.58  )
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

On Fri, Aug 09, 2024 at 07:21:00PM +0200, Christian Marangi wrote:
> Introduce support for a dedicated node for a nvme card. This will be a
> subnode of the nvme controller node that will have the "nvme-card"
> compatible.

FYI, there really is no such thing as an NVMe card.  There is an
NVMe Namespace, which is the entity that contains the block data,
the Controller which corresponds to the pci_dev for NVMe-PCIe, and
the NVMe Subsystem, which contains Controllers and Namespaces.

> This follow a similar implementation done for mmc where the specific mmc
> card have a dedicated of_node.

That's not a good explanation to be honest.  Most eMMC host controllers
are OF probed devices, so of course they'll have an of_node.

Binding PCIe functions to of_nodes seems completely weird to me, and
you'll need to explain what this totally non-obvious thing makes sense.
Maybe it does, but it needs to be backed up with a very good rationale
that is very clearly documented.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
