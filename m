Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7524CF6BF1
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jan 2026 07:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+EC1aC1hItYKMKTY0Ldwf3/hKY6WC8pfEEFWrDPgq/0=; b=1Bj/T6pz8sf0iY
	IXlEcq8PvOUUB33AdzhFaWrwMk7db+cXm+FA8x0yYclfWPPr0uq1lqVpAobEr8UGPFtIc/jCDbzzK
	kKoI+V2yphREvJgKqBAlLzaGyuNSYcuvBtiCE/JVETK7b/ivc2Q87Jx2Wv7PrAwtWy5thqEveb/PR
	9YEEYgI+M2dd17BFkVRsArXP31/7f+xW3sducak/U4OIIjg4+tSvs2F2Ii7ykSYw9+YgDwAXxv46C
	zhfXfx+UPLuwvpQOTyC4tZjuJROZ/7HHjoTCo3HFyBQVQB+jlYGWRuYshvqrztyAJl2NfdkOXZR0K
	YDhErsTNYwysYC0B4S0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdO2N-0000000EI8M-07yh;
	Wed, 07 Jan 2026 07:32:59 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdO2K-0000000EI7r-1Vpu
	for linux-mtd@lists.infradead.org;
	Wed, 07 Jan 2026 07:32:57 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id C876467373; Wed,  7 Jan 2026 08:32:47 +0100 (CET)
Date: Wed, 7 Jan 2026 08:32:47 +0100
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
Message-ID: <20260107073247.GA17448@lst.de>
References: <20251223003756.409543-1-hch@lst.de> <20251224-zusah-emporsteigen-764a9185a0a1@brauner> <20260106062409.GA16998@lst.de> <20260106-bequem-albatros-3c747261974f@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260106-bequem-albatros-3c747261974f@brauner>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_233256_563894_EA5D6FC9 
X-CRM114-Status: GOOD (  13.97  )
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

On Tue, Jan 06, 2026 at 10:43:49PM +0100, Christian Brauner wrote:
> > Umm, as in my self reply just before heading out for vacation, Julia
> > found issues in it using static type checking tools.  I have a new
> > version that fixes that and sorts out the S_* mess.  So please drop
> > it again for now, I'll resend the fixed version ASAP.
> 
> It has never been pushed nor applied as I saw your mail right before all
> of that.

Thanks.  But maybe you can fix up the applied messages to be more
specific?  We had various issues in the past with them, where they
were sent, but things did not end up in the tree for various reasons.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
