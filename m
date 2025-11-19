Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98406CF258F
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Nov 2025 06:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WE6SJl+Y3bLOdurV8+sYLpkOCCEjhje5UbVfOUm2sFk=; b=W/D/JrJPMqPe4H
	ZNMudH2C8T/mP4C82N8wtFPuMEi8WJk5W+V41vZC5RBudFzAnbkPOil5XOOGhgfZ+VnZtoFjgkas8
	pk3T+daSxbBPDCnYuJqd5oT6XLzJx3+mOoN78B03Ni6kS0rpoI3oRrnJSvS7CMdrKWHtoy5nH6Inu
	E9f9fMuF2RaNimNx0j1IcxKbANtFIddxs4/QnVmRNl+/46cW/RGF1KJW5tFxpTOUQIP6KpLsTkpkY
	oCDocUlAlWrbqCtycbU8NgcJsh2z7g8VgrBkk0pIMXJGEZIckeo9nT9XHVqjmovNT4cERyelzqrgK
	hF0SfcmRXsmtsiJSKWiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLbcr-00000002dAW-3cHD;
	Wed, 19 Nov 2025 06:25:09 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLbcp-00000002dA9-21Hy
	for linux-mtd@lists.infradead.org;
	Wed, 19 Nov 2025 06:25:08 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id C1E6768AFE; Wed, 19 Nov 2025 07:25:01 +0100 (CET)
Date: Wed, 19 Nov 2025 07:25:01 +0100
From: Christoph Hellwig <hch@lst.de>
To: Chaitanya Kulkarni <chaitanyak@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
	Jan Kara <jack@suse.cz>, Mike Marshall <hubcap@omnibond.com>,
	Martin Brandenburg <martin@omnibond.com>,
	Carlos Maiolino <cem@kernel.org>, Stefan Roesch <shr@fb.com>,
	Jeff Layton <jlayton@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
	"gfs2@lists.linux.dev" <gfs2@lists.linux.dev>,
	"io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
	"devel@lists.orangefs.org" <devel@lists.orangefs.org>,
	"linux-unionfs@vger.kernel.org" <linux-unionfs@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>
Subject: Re: [PATCH 05/14] fs: remove inode_update_time
Message-ID: <20251119062501.GA20592@lst.de>
References: <20251114062642.1524837-1-hch@lst.de> <20251114062642.1524837-6-hch@lst.de> <813f36d3-2431-4266-bb2e-faa3fc2a8fd7@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <813f36d3-2431-4266-bb2e-faa3fc2a8fd7@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_222507_665251_834EF6FB 
X-CRM114-Status: GOOD (  14.53  )
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

On Mon, Nov 17, 2025 at 06:59:25AM +0000, Chaitanya Kulkarni wrote:
> > -	ret = inode_update_time(inode, sync_mode);
> > +	if (inode->i_op->update_time)
> > +		ret = inode->i_op->update_time(inode, sync_mode);
> > +	else
> > +		generic_update_time(inode, sync_mode);
> >   	mnt_put_write_access_file(file);
> >   	return ret;
> >   }
> 
> do you need to catch the value from generic_update_time() to match
> if case ? although original code was returning 0 for generic_update_time()
> case :

Yes.  It doesn't matter for this series, but it's good future-proofing.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
