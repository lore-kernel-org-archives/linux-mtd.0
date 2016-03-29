Received: from mail02.rohde-schwarz.com ([80.246.32.97])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1akspP-0005rG-M8
 for linux-mtd@lists.infradead.org; Tue, 29 Mar 2016 12:33:00 +0000
In-Reply-To: <AD0D0F08-0871-4B7B-AEDA-DF969E0675D3@arris.com>
References: <AD0D0F08-0871-4B7B-AEDA-DF969E0675D3@arris.com>
To: Francois.Bussery@arris.com
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
MIME-Version: 1.0
Subject: Re: Deadlock issue in jffs2 (related to reverted patch "jffs2: Fix
 lock acquisition order bug in jffs2_write_begin")
From: Thomas.Betker@rohde-schwarz.com
Message-ID: <OFE6A9E412.54AAF9F2-ONC1257F85.00415EE4-C1257F85.0042B468@rohde-schwarz.com>
Date: Tue, 29 Mar 2016 14:08:35 +0200
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Francois:

> I encountered same as the one that drive you to remove this patch (
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/
> commit/fs/jffs2?id=157078f64b8a9cd7011b6b900b2f2498df850748)
> Unfortunately, this patch solved some big deadlock issues in jffs2. 
> So, my concern is that we return back to our initial issue.
> 
> So, do you have any update for this issue? May be the 2015 patch was
> just not suffisant. 

David Woodhouse has provided a patch "jffs2: Fix page lock / f->sem 
deadlock" which was added to linux-4.5 (alternatively, you can get the 
patch here: http://git.infradead.org/users/dwmw2/jffs2-fixes.git).

Hope this helps,
Thomas
