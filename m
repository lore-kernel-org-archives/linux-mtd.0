Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2712EC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 18:21:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB5B4610E7
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 18:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB5B4610E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Az4t5YH3b6k7wi/Iw2dYMAKl3THsAM8tEZcqvl+/k2U=; b=1mMBhQ/Hwhylah
	6OFMqRxfx1aslHDXnU5NfEgnS9RDdY8RIDC/xAehMRRl+3hYgjeM42JnAdrmbXgCQnBjCwnm4AQK/
	p2pmM6mgj627XZc/relZ12+Jf1dcQEi3ObPbCmltOBEnr/THwdiRmLpJQEsKx2s4tf1Zbq0i4fjE8
	d6YXVY6t9xOxtvMDJ88VvapqCg3MULIEATT3Warseo+amQSeRqUI264kNdpoThN53SvCd8PSfn6Rv
	r8S+7HNYQnK5BZIWlZTV7yeOREkHGDtNOzuQA9z7n8Tl6mL2hJFiyH1Ub5iiWCpT7T2yNitXLB5Eh
	oU0P5kNUOb15G1Jdqb0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miKsh-006BDj-EI; Wed, 03 Nov 2021 18:21:03 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miKsG-006B2E-B2
 for linux-mtd@lists.infradead.org; Wed, 03 Nov 2021 18:20:37 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 46A60227A99; Wed,  3 Nov 2021 19:20:34 +0100 (CET)
Date: Wed, 3 Nov 2021 19:20:33 +0100
From: Christoph Hellwig <hch@lst.de>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: axboe@kernel.dk, hch@lst.de, penguin-kernel@i-love.sakura.ne.jp,
 dan.j.williams@intel.com, vishal.l.verma@intel.com,
 dave.jiang@intel.com, ira.weiny@intel.com, richard@nod.at,
 miquel.raynal@bootlin.com, vigneshr@ti.com, efremov@linux.com,
 song@kernel.org, martin.petersen@oracle.com, hare@suse.de,
 jack@suse.cz, ming.lei@redhat.com, tj@kernel.org,
 linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] floppy: address add_disk() error handling on probe
Message-ID: <20211103182033.GC7745@lst.de>
References: <20211103181258.1462704-1-mcgrof@kernel.org>
 <20211103181258.1462704-4-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211103181258.1462704-4-mcgrof@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_112036_562537_A9F7C266 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

On Wed, Nov 03, 2021 at 11:12:57AM -0700, Luis Chamberlain wrote:
> We need to cleanup resources on the probe() callback registered
> with __register_blkdev(), now that add_disk() error handling is
> supported. Address this.

Same comment as for ataflop.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
