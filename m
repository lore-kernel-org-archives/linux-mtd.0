Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uZN5-0005Cb-00
	for <linux-mtd@lists.infradead.org>; Tue, 01 May 2001 13:35:15 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3AEE6920.89563C1B@Rikers.org> 
References: <3AEE6920.89563C1B@Rikers.org>  <3AEE1067.599A8ACF@Rikers.org> <Pine.LNX.4.33.0104302356320.10289-100000@imladris.demon.co.uk> <13672.988701676@redhat.com> 
To: Tim Riker <Tim@Rikers.org>
Cc: mtd <linux-mtd@lists.infradead.org>, jffs-dev <jffs-dev@axis.com>
Subject: Re: Wear Leveling in JFFS2 NOT working!(?) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 01 May 2001 13:35:29 +0100
Message-ID: <3890.988720529@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Tim@Rikers.org said:
> > The 'jiffies mod' trick would give repeatable results.

> RTC should not be relied on as some hardware has this broken (iPAQ at
> present ;-) What about totaling the checksums for each block as we
> scan them at mount time and then mod that by numblocks? This would
> also be repeatable given the same original filesystem.

By 'repeatable' I meant it would give a badly-distributed pattern, which is
a bad thing. It's not at all necessary that it's predictable given the 
filesystem state before mount.

Totalling the checksums as you suggest would work, but I'm a little 
reluctant to do that because of the layering implications. It would be 
nicer if we could use information which is already available to the code at 
that point. How about just rotating the lists by (highest_inode + 
highest_version_in_it) ?

Over the lifetime of the filesystem, the range of 
	(highest_inode + highest_ver) % nr_blocks
is going to be fairly evenly distributed, isn't it?

--
dwmw2
