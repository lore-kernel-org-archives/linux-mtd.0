Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BtZDS-0000cC-DS
	for linux-mtd@lists.infradead.org; Sat, 07 Aug 2004 17:59:03 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Russell King <rmk+lkml@arm.linux.org.uk>
In-Reply-To: <20040807135056.C2805@flint.arm.linux.org.uk>
References: <20040807135056.C2805@flint.arm.linux.org.uk>
Content-Type: text/plain
Message-Id: <1091915937.1438.103.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sat, 07 Aug 2004 22:58:57 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] 2.6.8-rc3 redboot.c tries to kmalloc 256K
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2004-08-07 at 13:50 +0100, Russell King wrote:
> Hi,
> 
> With 2.6.8-rc3, I'm unable to mount the jffs2 root filesystem on one of
> my test systems.  The system uses redboot, so has a redboot partition
> table.  However, the kernel was not detecting the table.
> 
> After prodding about for a while, I've found that redboot.c seems to
> be trying to kmalloc 256K of memory.   The largest size that kmalloc
> supports is 128K on MMUfull systems.

We can switch to vmalloc().

-- 
dwmw2
