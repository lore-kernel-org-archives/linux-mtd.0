Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DAtSg-0002Ew-4U
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2005 12:34:38 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Frantisek Rysanek <Frantisek.Rysanek@post.cz>
In-Reply-To: <4235D290.15983.3536316E@localhost>
References: <4235D290.15983.3536316E@localhost>
Content-Type: text/plain
Date: Mon, 14 Mar 2005 18:34:36 +0100
Message-Id: <1110821676.4814.53.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: lilo vs. diskonchip (again, sorry)
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-03-14 at 18:06 +0100, Frantisek Rysanek wrote:
> first of all I'd like to apologize for asking for help
> while I still work with Linux 2.4 - I guess my problem
> could be unrelated to the minor kernel version.

:)

> Is this something intrinsic to the re-implemented
> DoC driver? Is "use docboot" the only right answer?
> Or should the block device abstraction work to the
> extent that Lilo should work, using BIOS services
> to load the kernel?

Never tried lilo with DoC. 

> BTW, is docboot only intended for inftl devices, or
> does it work for nftl DoC's too?

Docboot seems to be written for and tested on INFTL devices, but it
should be not that hard to make it work on NFTL DoCs. 

Dan ??

tglx
