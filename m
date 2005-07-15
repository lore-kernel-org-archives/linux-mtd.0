Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DtkEa-0002O1-Ju
	for linux-mtd@lists.infradead.org; Sat, 16 Jul 2005 06:49:36 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Andriy Korud <a.korud@vector.com.pl>
In-Reply-To: <60E856FD577CC04BA3727AF4122D3F161135CD@3bit.vector.com.pl>
References: <60E856FD577CC04BA3727AF4122D3F161135CD@3bit.vector.com.pl>
Content-Type: text/plain
Date: Fri, 15 Jul 2005 16:40:53 +0200
Message-Id: <1121438453.24449.111.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Please explain bbt_create (problems)
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Please fix your mail client to do a line wrap at 76 characters

Read 

On Fri, 2005-07-15 at 16:18 +0200, Andriy Korud wrote:
> Hi, 
> I'm trying to understand how initial bbt_ceate works? 
> I have NAND chip erased for jffs2 (flash_erasall -j) with some data in
> OOB (jffs2 clean masrkers). And bbt_create() calls check_pattern()
> which compare each byte with 0xff, in my case comparision fails (jffs2
> cleanmarker != 0xff) and I have every block marked as bad.
> Should not check_pattern() checks only byte at 0x05 in OOB (according
> to http://www.linux-mtd.infradead.org/tech/mtdnand/x255.html )? 


Maybe you read also:

http://www.linux-mtd.infradead.org/tech/mtdnand/x144.html

"...Therefor we scan the chip(s) when we detect them the first time for
good blocks and store this information in
a bad block table before erasing any of the blocks." 

Emphasis is on the phrase "first time".

I can see that this could have been described more clear, but it
definitely makes no sense to create a flash based bad block table
_after_ using the chip.


> Also is it possible to scan chip for bbt starting from certain block
> (not 0) without dirty changes in mtd code?

no

tglx
