Received: from imladris.demon.co.uk ([193.237.130.41] ident=exim)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 191h6C-0007lh-GG
	for <linux-mtd@lists.infradead.org>; Sat, 05 Apr 2003 07:24:20 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: simonlee <simonwebook@163.com>
In-Reply-To: <20030405030104.6EE261C7DB804@sm206.163.com>
References: <20030405030104.6EE261C7DB804@sm206.163.com>
Message-Id: <1049523855.7159.99.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sat, 05 Apr 2003 07:24:15 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: newbie questions:how can I port JFFS2 to my OS-less platform?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2003-04-05 at 04:04, simonlee wrote:
> Hi,all
> 	JFFS2 is written for linux,but I want to port it to my OS-less environmen

Your lines are too long. Please limit them to 70 characters.

You need at least some flash drivers, memory allocator, zlib, some
higher-level file system I/O stuff.

I suggest you use eCos, which can be configured to give you those those
parts which you need, and no more. JFFS2 already works in eCos.

-- 
dwmw2
