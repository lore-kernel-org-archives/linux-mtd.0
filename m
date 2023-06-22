Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B52EB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 14:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1cyQF1owxQ5W6aV4+3hSRVjnbW8pBvFuUKZYIVHRo8=; b=K4Nm7EpfSCJVfs
	dzjPtJQOg5+myYww+a2gn7XICi3VziSjxkqMUmumoBMUhk9rbCoGqQVbxxxZbAS0qcXQ8ovBPgYed
	sd1Ocsgw70rA/J+0tNDmwMaIhhdQnRQ9PdP9M6hbA5yXpwC7jE4dbyFu4gS9h92RK6y41ofL27Zpk
	D4ihsjn3+cokKhpsZyZjzlIZypyYniiSH3BjJGXsS0q9VIdbX9oMXq6WEf7u/SWL+GF4PIykr4780
	AhCzfwipQgWHdDIHpo2mr2eXHKPBu/2GClkjrrGYj1gYKVof3DJA451CqfQQLhnGZhruItdhpeBu+
	bLK7y841crO2Ny6NMrxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCLmZ-00145c-0E;
	Thu, 22 Jun 2023 14:59:35 +0000
Received: from unicorn.mansr.com ([81.2.72.234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCLmW-00143h-0p
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 14:59:33 +0000
Received: from raven.mansr.com (raven.mansr.com [81.2.72.235])
	by unicorn.mansr.com (Postfix) with ESMTPS id 1544D15360;
	Thu, 22 Jun 2023 15:59:26 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
	id 940F921A4DD; Thu, 22 Jun 2023 15:59:25 +0100 (BST)
From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Julien Su <juliensu@mxic.com.tw>, Jaime
 Liao <jaimeliao@mxic.com.tw>, Alvin Zhou <alvinzhou@mxic.com.tw>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, JaimeLiao
 <jaimeliao.tw@gmail.com>
Subject: Re: [PATCH v2 3/3] mtd: rawnand: Support for sequential cache reads
References: <20230112093637.987838-1-miquel.raynal@bootlin.com>
	<20230112093637.987838-4-miquel.raynal@bootlin.com>
Date: Thu, 22 Jun 2023 15:59:25 +0100
In-Reply-To: <20230112093637.987838-4-miquel.raynal@bootlin.com> (Miquel
	Raynal's message of "Thu, 12 Jan 2023 10:36:37 +0100")
Message-ID: <yw1xfs6j4k6q.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_075932_427891_6BE2A0C1 
X-CRM114-Status: GOOD (  23.99  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Miquel Raynal <miquel.raynal@bootlin.com> writes:

> From: JaimeLiao <jaimeliao.tw@gmail.com>
>
> Add support for sequential cache reads for controllers using the generic
> core helpers for their fast read/write helpers.
>
> Sequential reads may reduce the overhead when accessing physically
> continuous data by loading in cache the next page while the previous
> page gets sent out on the NAND bus.
>
> The ONFI specification provides the following additional commands to
> handle sequential cached reads:
>
> * 0x31 - READ CACHE SEQUENTIAL:
>   Requires the NAND chip to load the next page into cache while keeping
>   the current cache available for host reads.
> * 0x3F - READ CACHE END:
>   Tells the NAND chip this is the end of the sequential cache read, the
>   current cache shall remain accessible for the host but no more
>   internal cache loading operation is required.
>
> On the bus, a multi page read operation is currently handled like this:
>
> 	00 -- ADDR1 -- 30 -- WAIT_RDY (tR+tRR) -- DATA1_IN
> 	00 -- ADDR2 -- 30 -- WAIT_RDY (tR+tRR) -- DATA2_IN
> 	00 -- ADDR3 -- 30 -- WAIT_RDY (tR+tRR) -- DATA3_IN
>
> Sequential cached reads may instead be achieved with:
>
> 	00 -- ADDR1 -- 30 -- WAIT_RDY (tR) -- \
> 		       31 -- WAIT_RDY (tRCBSY+tRR) -- DATA1_IN \
> 		       31 -- WAIT_RDY (tRCBSY+tRR) -- DATA2_IN \
> 		       3F -- WAIT_RDY (tRCBSY+tRR) -- DATA3_IN
>
> Below are the read speed test results with regular reads and
> sequential cached reads, on NXP i.MX6 VAR-SOM-SOLO in mapping mode with
> a NAND chip characterized with the following timings:
> * tR: 20 =B5s
> * tRCBSY: 5 =B5s
> * tRR: 20 ns
> and the following geometry:
> * device size: 2 MiB
> * eraseblock size: 128 kiB
> * page size: 2 kiB
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Normal read @ 33MHz =3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> mtd_speedtest: eraseblock read speed is 15633 KiB/s
> mtd_speedtest: page read speed is 15515 KiB/s
> mtd_speedtest: 2 page read speed is 15398 KiB/s
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D Sequential cache read @ 33MHz =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> mtd_speedtest: eraseblock read speed is 18285 KiB/s
> mtd_speedtest: page read speed is 15875 KiB/s
> mtd_speedtest: 2 page read speed is 16253 KiB/s
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>
> We observe an overall speed improvement of about 5% when reading
> 2 pages, up to 15% when reading an entire block. This is due to the
> ~14us gain on each additional page read (tR - (tRCBSY + tRR)).
>
> Co-developed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: JaimeLiao <jaimeliao.tw@gmail.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 119 +++++++++++++++++++++++++++++--
>  include/linux/mtd/rawnand.h      |   9 +++
>  2 files changed, 124 insertions(+), 4 deletions(-)

This change broke something on a TI AM3517 based system.  What I'm
noticing is that the u-boot fw_setenv tool is failing due to the
MEMGETBADBLOCK ioctl reporting some blocks as bad when they are not.
Everything else is, somehow, working fine.  Reverting this commit fixes
it, though I don't know why.  I'm seeing the same behaviour on multiple
devices, so I doubt there is a problem with the flash memory.

Is there anything I can test to get more information?

-- =

M=E5ns Rullg=E5rd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
