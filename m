Received: from mx1.redhat.com ([66.187.233.31])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cp9D2-0000Ia-TU
	for linux-mtd@lists.infradead.org; Thu, 13 Jan 2005 12:56:37 -0500
Message-ID: <41E6B637.9070202@redhat.com>
Date: Thu, 13 Jan 2005 11:56:07 -0600
From: "David A. Marlin" <dmarlin@redhat.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <41E699F9.10704@redhat.com>
	<1105638483.5993.2.camel@lap02.tec.linutronix.de>
In-Reply-To: <1105638483.5993.2.camel@lap02.tec.linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: NAND fail testing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Thomas Gleixner wrote:

> 
> We have blocked the access to short writes. You can do the following:
> 
> Erase a block from userspace with flash_erase
> Write a page of all 0xff except one byte to the first page using
> nandwrite
> 
> Repeat until you get an error

Would this not still 'write' all bytes in the page (even though they are 
0xff and unchanged), causing them to also wear and possibly fail?


d.marlin
