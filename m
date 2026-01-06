Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD591CD043F
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jan 2026 06:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ksgdexyPymYQc6xYPeoFVWE0Gd1W0Uic3r+pRBQZyeQ=; b=lT1z9vV6ov9uh5
	s1Vwcu2QbTDeJEqZVMGZ554f1MVg7zaVm3OGBUd1VDJz3nGfO2haPl+orlZjvfy0+svG+S+hBJMHV
	t0k6FsLA2PSqfx+7jq7jbsRxaCx8QlM4OHZLpS5ceof33Z/r8maSqSuEK86TTeAOwW6g5VU96qYuh
	m6JM/XJzrbo6uJc+DiAWrpBzAWftL5idc+89pE61Qa3hwfrJP3Ct0ri1ItpxXHn+TfSKJ0Tg/lD1T
	PmXrR1iRX8fP3kcmkByf8a85intAFTooUvi5tggopONFgox8/8XHbc7es7cPRQ39DMDmBwwWT4gQN
	wxZNSnjNCNbRXYjtT0AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd0UO-0000000CT3h-3u0f;
	Tue, 06 Jan 2026 06:24:20 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd0UM-0000000CT39-0Z7u
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jan 2026 06:24:19 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 630CF6732A; Tue,  6 Jan 2026 07:24:09 +0100 (CET)
Date: Tue, 6 Jan 2026 07:24:09 +0100
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>,
	David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>,
	Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	gfs2@lists.linux.dev, io-uring@vger.kernel.org,
	devel@lists.orangefs.org, linux-unionfs@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org
Subject: Re: re-enable IOCB_NOWAIT writes to files v4
Message-ID: <20260106062409.GA16998@lst.de>
References: <20251223003756.409543-1-hch@lst.de> <20251224-zusah-emporsteigen-764a9185a0a1@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251224-zusah-emporsteigen-764a9185a0a1@brauner>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_222418_315846_C01F2EF8 
X-CRM114-Status: GOOD (  10.91  )
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

> Applied to the vfs-7.0.nonblocking_timestamps branch of the vfs/vfs.git tree.
> Patches in the vfs-7.0.nonblocking_timestamps branch should appear in linux-next soon.

Umm, as in my self reply just before heading out for vacation, Julia
found issues in it using static type checking tools.  I have a new
version that fixes that and sorts out the S_* mess.  So please drop
it again for now, I'll resend the fixed version ASAP.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
