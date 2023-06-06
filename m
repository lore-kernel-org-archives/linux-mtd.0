Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42622C7EE2A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 08:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2RiGMYiw8Ca3Lu1OhPeqXq/XIq8cP0wOqt6SQ47GMRQ=; b=l+l8eSriaZfa6E
	aQoF1ESoxflcciGVIWBk/68yCl3Z8Q4467hAXaTGE9Q9Kn0Tlpw+Mn04hsrBgOjCtyw+yhdQHa3BZ
	rMU88G/G3ZRqQOmldasUXyOiu3kXhN63srL2Ar3vN9dxnLSyd6qz6tM4WYlo4lMbBHB34pl0vCS58
	2WBi9m7K5+3pLLweq0+X+7dEoJxiWuoWsiEXYFnQF84nK35ioqaWxc0Zmw/MObXsYrdLKTbWj80nu
	gN737l8kuo2l/eWMjNORdH2p17cuNo6gRXKe8bC9hF4GRT94kngIRjBDDYbjHgUj8kJ5b8aCg6Ek3
	mB/SWtN7enOj3Dr9VwXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6S2J-000o0X-2n;
	Tue, 06 Jun 2023 08:27:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6S2H-000nyq-1P;
	Tue, 06 Jun 2023 08:27:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9D24262ECE;
	Tue,  6 Jun 2023 08:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF06C433D2;
	Tue,  6 Jun 2023 08:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686040044;
	bh=Ul2cGfsXNIMiykZwhFC1GhCumtuf5drHj+O/jqIfKC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIGMl8H6ZE1RDdRAyTflrfjbWgwVzW92xqGaMt1JiQ4SA+mJ4HMs0LbcBMXK3XGit
	 s8AH6LT5xvGT0yz9De/gwc9rycYwPfPg/PTSp4QuSkk0vOtIYZ0sGO7Zr/oqRQEn3Q
	 bZTC+xvpq4ZzHyydtCd2+MUht7VjSMVAc+QW6ZPVxfiAMzISs3v9vRyYsu+gqogzM9
	 HTOpqo1f7t7P4IpAfgrmShg7Yu9telb/BuewQOoAVz62LWjeBpYBAlToNuiqrKvZSi
	 OO2A9iQpLezyTGvSBIIeI/aI3LzBW6+Umq+ZCMYqHmmp9Dt2Hg5qaDReScqKNzXi7c
	 tDihS0qt4RtdA==
Date: Tue, 6 Jun 2023 10:27:14 +0200
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>,
	Josef Bacik <josef@toxicpanda.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	Phillip Potter <phil@philpotter.co.uk>, Coly Li <colyli@suse.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, dm-devel@redhat.com,
	linux-block@vger.kernel.org, linux-um@lists.infradead.org,
	linux-scsi@vger.kernel.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org,
	linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: decouple block open flags from fmode_t
Message-ID: <20230606-raumtemperatur-languste-045c5472f6a0@brauner>
References: <20230606073950.225178-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606073950.225178-1-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_012725_507418_539F0597 
X-CRM114-Status: GOOD (  12.15  )
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

On Tue, Jun 06, 2023 at 09:39:19AM +0200, Christoph Hellwig wrote:
> Hi all,
> 
> this series adds a new blk_mode_t for block open flags instead of abusing

Trying to look at this series applied but doesn't apply cleanly for
anything v6.4-rc* related. What tree is this on?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
