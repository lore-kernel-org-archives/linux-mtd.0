Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19IPqk-0002iC-AL
	for <linux-mtd@lists.infradead.org>; Wed, 21 May 2003 10:25:30 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20030521090516.GB22310@wohnheim.fh-wedel.de>
References: <002701c31f11$e009ce70$1200a8c0@JOHNB>
	 <20030521090516.GB22310@wohnheim.fh-wedel.de>
Message-Id: <1053509146.20074.2584.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 21 May 2003 10:25:47 +0100
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: John Burch <jburch@vincisystems.com>
Subject: Re: Mtd block access (jffs2 formatted) and mtd char access
 (unformatted) on different partitions of a single flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-05-21 at 10:05, Jörn Engel wrote:
> > I've adopted a system that uses a driver with its own flash support to
> > read/write raw (non-jffs2) portions of the flash, while application code
> > uses standard file I/O to read/write jffs2 partitions on the same
> > device.
> 
> What does "driver" mean? If you have two in-kernel drivers for the
> same flash chip, they will use different locks and things will break.
> If that is a user-space driver, using the /dev/mtdX devices, you are
> perfectly safe. Which one is it?

Hmmm. What he actually said was 'driver with its own flash support',
which sounds bad. As long as everything accessing the flash goes through
the MTD driver for the flash, using its read/write/erase functions
rather than banging on the hardware directly, it'll be fine. If your raw
driver is actually dealing with the flash driver directly, that's
broken.

-- 
dwmw2
