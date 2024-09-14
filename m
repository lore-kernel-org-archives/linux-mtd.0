Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672DDC021A3
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Sep 2024 15:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r8lEUm1FuSkXvAu+oNfbyuUM7ZqX5tTjPAsrNk22C3o=; b=QZDYqjdPskTOlS
	BBIFlSy+loBCFCtixeVdrIdqYbxPcDZbVPnEi3FcJd54Nj8IHfZAkcgAAoK54/Td9uBBO3H6l4Lwe
	jzdQZR/NN2WrBrqEbTszScWLXmbhzdk5iFKZnavzxJN5rx4x1cYqIyqjroE2bTq+TJobdETbFg7kW
	CqH6VoqKUIJkXQNpRVlzDRMy+BhmGfgUUziACDY8wM174g9RKEkBpyQBO3Ggcso7qmr4wgt+mKcO0
	ygDWNzhK1bm7Br8u1s82NhGRPSCdgJcRc2e46rFkH/7UJV2rj48gsYW5lVgRNs6FytjGv5VKdRTm7
	ah28xZXCNz49xBxadxrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spV7i-00000000trE-0AcT;
	Sat, 14 Sep 2024 15:55:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spV7f-00000000tqc-1WAr
	for linux-mtd@lists.infradead.org;
	Sat, 14 Sep 2024 15:55:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F2375C5A6D;
	Sat, 14 Sep 2024 15:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F21AC4CEC0;
	Sat, 14 Sep 2024 15:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726329341;
	bh=T4UC6EuwygE96XKhPWekPObb7/by0g5184sGxfCAaQA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UsGpEMs9jPAdDd7dgLFqRTMO3jg7NNtnHIuduFI6UvMDrvA4oIrDY8918LfVfn3nG
	 th67gVmVW8t7l6NVOjm6m1y5p1zsF03L08CoaUwb0q92Q7jR6GckJb2FlthfDAOypX
	 ru49g8ON2wStyp5XQl0aKVp7V4QHSoxA7e2DWx3C2X45TowcTe+YFhUaVjRUtcRcvD
	 DCo+ybvFKAyRIxfSPtnChwMnziTvO4Pfi5BnEIdOMRNPDdQU+hYGnsuJDOu/+9beB1
	 Q6GMci5isw+cpHhLrIbHP1wzvuktdOvVrGiXEBNiXqFZSLgsT9Ogh3G/GpdyuqIkQ6
	 C/J1WN//MHbJw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Michael Walle <mwalle@kernel.org>,
  linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: spi-nor: changes for v6.12
In-Reply-To: <20240913195915.4bd2a88c@xps-13> (Miquel Raynal's message of
	"Fri, 13 Sep 2024 19:59:15 +0200")
References: <mafs0bk0tf9na.fsf@kernel.org> <20240913195915.4bd2a88c@xps-13>
Date: Sat, 14 Sep 2024 17:55:39 +0200
Message-ID: <mafs0v7yy9qmc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240914_085543_666308_A471B28B 
X-CRM114-Status: GOOD (  21.54  )
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

On Fri, Sep 13 2024, Miquel Raynal wrote:

> Hi Pratyush,
>
> pratyush@kernel.org wrote on Thu, 12 Sep 2024 12:28:57 +0200:
>
>> Hi Miquel,
>> 
>> Here are the SPI NOR changes for v6.12. I usually base my branch on top
>> of -rc1, but this time around it seems I did it a few commits after
>> v6.11-rc1. Probably just didn't notice torvalds/master had moved. Should
>> make no difference in practice anyway.
>
> I don't think I can merge your tag without the 4 minmax patches, which
> means they will appear in my final merge request to Linus, unless I
> explicitly don't use an -rc as a base, but this must be justified I
> believe. Can you please fix the branch and regenerate the tag? I don't
> mind personally if you force push, if it makes the history more clear.

TL;DR: I'll rebase and send you a new pull request.

I thought it wouldn't matter since Linus' tree already has those minmax
commits anyway. I did a test merge just now and seems I was right. When
I merge current spi-nor/next into mtd/next, and then merge mtd/next into
torvalds/master, here's the merge I get:

    Merge branch 'mtd/merge-test'

    * mtd/merge-test:
    mtd: spi-nor: fix flash probing
    mtd: powernv: Add check devm_kasprintf() returned value
    mtd: spi-nor: spansion: Add support for S28HS256T
    mtd: concat: Use kmemdup_array instead of kmemdup for multiple allocation
    mtd: parsers: bcm47xxpart: make read-only array possible_nvram_sizes static const
    mtd: Use of_property_read_bool()
    mtd: slram: insert break after errors in parsing the map
    mtd: spi-nor: winbond: add Zetta ZD25Q128C support
    mtd: spi-nor: micron-st: Add n25q064a WP support
    mtd: spi-nor: sst: Factor out common write operation to `sst_nor_write_data()`

But since mtd/next doesn't have the minmax commits, here is what the
merge of spi-nor/next into mtd/next looks like:

    Merge branch 'spi-nor/next' into mtd/merge-test

    * spi-nor/next:
    mtd: spi-nor: fix flash probing
    mtd: spi-nor: spansion: Add support for S28HS256T
    mtd: spi-nor: winbond: add Zetta ZD25Q128C support
    mtd: spi-nor: micron-st: Add n25q064a WP support
    mtd: spi-nor: sst: Factor out common write operation to `sst_nor_write_data()`
    minmax: simplify min()/max()/clamp() implementation
    minmax: don't use max() in situations that want a C constant expression
    minmax: scsi: fix mis-use of 'clamp()' in sr.c
    minmax: make generic MIN() and MAX() macros available everywhere

Essentially, your merge to Linus would be fine but my merge to your
branch will (appear to) have these extra commits.

I don't think any of this is worth the extra confusion so I will just
rebase my branch on v6.11-rc1 force push. Will send you a v2 of the pull
request soon.

Side note:

> [...]unless I explicitly don't use an -rc as a base, but this must be
> justified I believe.

I am curious why that is so. I don't see how using an -rc as base is any
better than using any other commit in Linus' tree. For git it doesn't
matter since an -rc commit is the same as any other commit. I suppose if
everyone does it, the history might be a bit cleaner, but I don't see
how it would make much of a difference in practice.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
