Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cp9W0-0000sD-U9
	for linux-mtd@lists.infradead.org; Thu, 13 Jan 2005 13:16:16 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: "David A. Marlin" <dmarlin@redhat.com>
In-Reply-To: <41E6B637.9070202@redhat.com>
References: <41E699F9.10704@redhat.com>
	<1105638483.5993.2.camel@lap02.tec.linutronix.de>
	<41E6B637.9070202@redhat.com>
Content-Type: text/plain
Message-Id: <1105640157.5993.11.camel@lap02.tec.linutronix.de>
Mime-Version: 1.0
Date: Thu, 13 Jan 2005 19:15:57 +0100
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: NAND fail testing
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-01-13 at 18:56, David A. Marlin wrote:
> Thomas Gleixner wrote:
> 
> > 
> > We have blocked the access to short writes. You can do the following:
> > 
> > Erase a block from userspace with flash_erase
> > Write a page of all 0xff except one byte to the first page using
> > nandwrite
> > 
> > Repeat until you get an error
> 
> Would this not still 'write' all bytes in the page (even though they are 
> 0xff and unchanged), causing them to also wear and possibly fail?

Since the write is only from 1 -> 0 the page write command always
"writes" all bytes regardless of the number of bytes you have supplied
before. 

tglx
