Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A4Tsd-0008VD-VX
	for <linux-mtd@lists.infradead.org>; Wed, 01 Oct 2003 00:26:08 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Cam Mayor <cmayor@iders.ca>
In-Reply-To: <0309301819230B.25773@kilauea.iders.ca>
References: <0309301819230B.25773@kilauea.iders.ca>
Message-Id: <1064964311.6154.271.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Wed, 01 Oct 2003 00:25:11 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: a-linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: MTD/JFFS2 bug - misreported filesystem usage
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-09-30 at 18:19 -0500, Cam Mayor wrote:

> 4) erase mtd partition which had jffs2 filesystem
> 5) mount jffs2 on newly erased partition
> 6) 'df' to see filesystem usage.
> 	"Used" and "Available" fields are switched; switch is reflected in the 
> "Use%" field

We make crap up in statfs().

In particular, we account erasing but not-yet-erased blocks as
unavailable, since the erase may fail. After mounting a newly-erased
device, JFFS2 sticks every single erase block on the list to be erased,
and that's why the space accounting goes haywire. It's not assuming that
any of those erases will succeed until such time as they actually do.

After mounting, just keep running 'df' and watching the free space
rise...

-- 
dwmw2
