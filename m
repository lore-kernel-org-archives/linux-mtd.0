Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CC7C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 00:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eIYPgNYTEUNqwmkCuJthp83nLTUsDT5Y3NKwPSZlkqs=; b=pjGjVQ9/Q7mMtb
	GdKnY2B70yBmePgMNOqjP5sYXNL56VKSLmZK6UPFmhFFRQ6Fj0VRsdBi8m334aeSMyENQRhJk0yUx
	T3oTVhu7yYv942MSakdTbt8I0EYRN2d+swxXancmAzILSwSuy7fZW8gSG16S732uJbrcQzSgAM925
	8tK+B/9h5F1AXdZB7nU3Ny1NLGJsFFz9WZT6CKcihs6w0oV1oGErmJb3VQ4kRifo4+2p60eE0Gtsa
	RUVFhy7ZFW9FxgDiOo6TXRpfOJZXnZn43tW4pPqMN9TjgzpI8lrZ69viJUawROVLUoCLzInncxnxR
	JebAFgFzWtvlAICzuljA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovSd1-008wCY-MQ; Thu, 17 Nov 2022 00:19:39 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovScy-008w7x-Av
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 00:19:38 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1ovScc-0002P6-CE; Thu, 17 Nov 2022 01:19:14 +0100
Date: Thu, 17 Nov 2022 00:19:10 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Jens Axboe <axboe@kernel.dk>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Matthew Wilcox <willy@infradead.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Michal Orzel <michalorzel.eng@gmail.com>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v5 3/4] partitions/efi: add support for uImage.FIT
 sub-partitions
Message-ID: <Y3V9/pmHs7ypE7lb@makrotopia.org>
References: <cover.1668548123.git.daniel@makrotopia.org>
 <7526fc5a461a0d68eb1dab575f9c1950638fc21a.1668548123.git.daniel@makrotopia.org>
 <Y3R8oQXRQ8uq8p4P@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y3R8oQXRQ8uq8p4P@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_161936_383828_E75FC5BC 
X-CRM114-Status: GOOD (  22.51  )
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

Hi Christoph,

On Tue, Nov 15, 2022 at 10:01:05PM -0800, Christoph Hellwig wrote:
> On Tue, Nov 15, 2022 at 09:47:06PM +0000, Daniel Golle wrote:
> > Add new GUID allowing to parse uImage.FIT stored in a GPT partition
> > and map filesystem sub-image as sub-partitions.
> 
> NAK, we should not go out from the partition code to parse random
> weird image formats.

While weirdness is certainly subjective, uImage.FIT is not just a
random image format but used by a great majority of headless embedded
Linux devices out there. It's the default image format of many of the
SDKs distributed by chip vendors such as Allwinner, Marvell, MediaTek,
NXP, Qualcomm/Atheros, ...

Having better support for it in Linux hence doesn't seem too far-fetched
to me, especially given that we got partition parsers for all sorts of
historic (Acorn, Amiga, Atari, ...) or actually exotic (Karma?) formats.
Even Microsoft Windows' Logical Disk Manager is supported natively by
the kernel...

> If you want to support uImage.FIT just write a tiny stackable block
> driver or dm table for it.

As this is used on rather tiny embedded devices my hope was to keep
things simple and not having to enable device mapper on systems which
have anyway only very small amounts of storage and won't ever need
most of the device mapper features.

Using a tiny block driver instead is an option, I've implemented this
approach in the past couple of hours and it works just as fine.

In this case I would introduce a new kernel cmdline option allowing
to specify which block device (ie. a partition on eMMC, or mtdblock
or ubiblock device) to launch the uImage.FIT parser on.

Allowing this new driver to add block partitions by exporting a new
helper functions for that in block/partition/core.c would greatly
simplify things, as then the existing partitioning code could still
be used (instead of basically having to re-implement loopdev and
introduce a whole new type of block devices).

I will post an RFC series illustrating this approach.

Please let me know if this sounds acceptable, so I won't put effort
into implementing something which will then be rejected again after 5
iterations on the mailing list for reasons which could have been
expressed from the beginning. An RFC for this series was posted on
2022-04-25 [1], I wouldn't have worked months to fix all requests of
other maintainers and tested it on a variety of different hardware
knowing that the whole approach will be NACK'ed...

And, of course, thank you anyway for reviewing!


Cheers


Daniel

[1]: https://patchwork.kernel.org/project/linux-block/list/?series=635369&state=*

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
