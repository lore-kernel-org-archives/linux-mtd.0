Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CgHWP-0004wn-Jt
	for linux-mtd@lists.infradead.org; Mon, 20 Dec 2004 01:59:58 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Charles Manning <manningc2@actrix.gen.nz>
In-Reply-To: <20041217044111.066064A07@blood.actrix.co.nz>
References: <3C5AD150.1A3B9AAE@comdev.cc> <3C5ADFC8.BD97CFFF@comdev.cc>
	<3C5AF025.F61F91F6@comdev.cc>
	<20041217044111.066064A07@blood.actrix.co.nz>
Content-Type: text/plain
Date: Mon, 20 Dec 2004 07:59:52 +0100
Message-Id: <1103525992.27708.80.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: PATCH to help understanding
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-12-17 at 16:24 +1300, Charles Manning wrote:
> Hi folks
> 
> I propose the following patches to mtd.h to help the understanding of these 
> functions.
> 
> read_ecc() and write_ecc() use the argument eccbuff, but this is really oob 
> data being passed. The oob data might contain ecc info as well as other 
> stuff. With the preferred autoplacement model, this will not have ecc info in 
> it. Therefore I suggest a rename on this parameter.

Makes sense.

> suspend() and resume() are surely the functions for erase suspend and erase 
> resume (for those NOR devices that provide this). Perhaps I goofed here and 
> these are really power control functions (which would seem rather dodgy). If 
> these are really power control fns, then where does erase suspend/resume get 
> exposed?

Those are PM functions. The sole purpose of suspend is to disable the
access to the chip until resume is called, so you can power down safely.
I will add those to the NAND driver for completeness.

Erase suspend/resume is nowhere exposed. It is handled inside the chip
family drivers. For NAND we removed the erase suspend because it does
not work on all chips and the erase time is short anyway so it's not
worth the extra trouble.

tglx
