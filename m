Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48CDDC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 18:23:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E65C60F5A
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 18:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E65C60F5A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d3W8CvYlW9+sLF7+QCh82MvSkDnriP6WHb5Ry0vfzqw=; b=3OH6NkLRNLV93l
	32v1litr93UfdIluTLjoZ/ZcLEV3VNNa/VXe430K37OWVpj+CQY8g+fFdWa94uV8emlcnBucAwVEb
	G5H3+wvPwiCSIOXTJUdvtK50IXMwiVgO8XvPT43HZaFOxYOwP48/FsyhhukRJojFUsiTQk/pVzK+H
	dCBfDsQVKra/0OmIItOxnn31N8iFYsgMeeFKQw/gRURw7ibjXcmo0DIK7+gAhlpRpos06ptSZkVYo
	8YIDxI2fGbLvg/V4AIR7cC32Asjetvg6anlGmDJm30Ax6/hebVMu5sHpuVrtbQb5GcB3SeAljUajZ
	k5ogKyRJUPEJkXCXhR6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miKuO-006BoF-Bh; Wed, 03 Nov 2021 18:22:48 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miKsp-006BG3-Cq
 for linux-mtd@lists.infradead.org; Wed, 03 Nov 2021 18:21:12 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6319F68AA6; Wed,  3 Nov 2021 19:21:09 +0100 (CET)
Date: Wed, 3 Nov 2021 19:21:09 +0100
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
Subject: Re: [PATCH v4 2/4] ataflop: address add_disk() error handling on probe
Message-ID: <20211103182109.GE7745@lst.de>
References: <20211103181258.1462704-1-mcgrof@kernel.org>
 <20211103181258.1462704-3-mcgrof@kernel.org> <20211103182016.GB7745@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211103182016.GB7745@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_112111_624969_4641DA5B 
X-CRM114-Status: UNSURE (   8.90  )
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

Or maybe I should stop nitpicking for these cruft drivers.

I'm ok with this and the next patch:

Reviewed-by: Christoph Hellwig <hch@lst.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
