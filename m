Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A9IJo-0005yt-Eo
	for <linux-mtd@lists.infradead.org>; Tue, 14 Oct 2003 07:06:04 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Robin Gilks <robin.gilks@tait.co.nz>
In-Reply-To: <3F8B814D.3050408@tait.co.nz>
References: <3F8B814D.3050408@tait.co.nz>
Message-Id: <1066111497.3172.37.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 14 Oct 2003 07:04:57 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: mtd list <linux-mtd@lists.infradead.org>
Subject: Re: Mount of jffs2 partition fails
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-10-14 at 17:53 +0000, Robin Gilks wrote:

> / # mount -t jffs2 /dev/mtdblock1 /mnt
> Write clean marker to block at 0x000d0000 failed: -30

-30 is also -EROFS but we don't normally see it there so we don't have a
nice helpful message telling you the reason :)

I have no clue why your flash allows erases but not writes. This is a
flash hardware/driver problem, not JFFS2. Can you do more testing on the
raw /dev/mtd0 device itself using
read/write/ioctl(MEMERASE)/ioctl(MEMUNLOCK) to see what you need to do
to make it work?

-- 
dwmw2
