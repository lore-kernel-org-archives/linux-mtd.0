Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cp951-0008TQ-6t
	for linux-mtd@lists.infradead.org; Thu, 13 Jan 2005 12:48:21 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: "David A. Marlin" <dmarlin@redhat.com>
In-Reply-To: <41E699F9.10704@redhat.com>
References: <41E699F9.10704@redhat.com>
Content-Type: text/plain
Message-Id: <1105638483.5993.2.camel@lap02.tec.linutronix.de>
Mime-Version: 1.0
Date: Thu, 13 Jan 2005 18:48:03 +0100
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

On Thu, 2005-01-13 at 16:55, David A. Marlin wrote:
> Is there a simple way (using existing drivers and utilities) to "wear 
> out" one byte on a NAND type chip by repeatedly rewriting a single byte 
> (single address)?
> 
> I want to cause a single byte failure on a chip in order to perform 
> tests on erase and write error processing, but I only see how to write a 
> 'page' of data, not a single address.
> 

We have blocked the access to short writes. You can do the following:

Erase a block from userspace with flash_erase
Write a page of all 0xff except one byte to the first page using
nandwrite

Repeat until you get an error

tglx
