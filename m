Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19cujP-0006HU-53
	for <linux-mtd@lists.infradead.org>; Wed, 16 Jul 2003 23:26:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Vikram Mehta <vm6580@hotmail.com>
In-Reply-To: <Law14-OE1840m3DwZpu000076e5@hotmail.com>
References: <Law14-OE1840m3DwZpu000076e5@hotmail.com>
Message-Id: <1058394402.2914.21.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Wed, 16 Jul 2003 23:26:42 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: thread_should_wake() in background.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-07-17 at 02:59, Vikram Mehta wrote:
> Hi ,
> 
> When I mount jffs2 partition
> 
> the system simply stops responding
> after givinng the message
> 
> 
> JFFS2: Garbage collect thread is pid 1792
> thread_should_wake(): nr_free_blocks 1, nr_erasing_blocks 15, dirty_size 0x0
> jffs2_garbage_collect_thread sleeping...
> thread_should_wake(): nr_free_blocks 1, nr_erasing_blocks 15, dirty_size 0x0

Does SysRq not even work? No network activity at all?

-- 
dwmw2
