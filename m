Received: from mail.fh-wedel.de ([213.39.232.194])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BBaey-0003uw-Uu
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2004 15:37:41 +0100
Date: Thu, 8 Apr 2004 16:37:17 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Steven Scholz <steven.scholz@imc-berlin.de>
Message-ID: <20040408143717.GA1921@wohnheim.fh-wedel.de>
References: <40742192.5030901@imc-berlin.de>
	<1081354787.4799.191.camel@tubarao> <407553A5.5010702@imc-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <407553A5.5010702@imc-berlin.de>
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: kernel oops in cfi_cmdset_0002.c:do_write_one()...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 8 April 2004 15:29:09 +0200, Steven Scholz wrote:
> 
> I just notice that in my old 2.4.20 kernel tree I have a
> 
> 	* $Id: cfi_cmdset_0002.c,v 1.67 2003/04/15 22:32:13 thayne Exp $
> 
> and in a _new_ 2.4.25 tree I have
> 
> 	 * $Id: cfi_cmdset_0002.c,v 1.62 2003/01/24 23:30:13 dwmw2 Exp $
> 
> How could that be !?!?
> 
> Is the MTD code not pushed up into the main kernel sources???

It is, whenever David finds the time for it.

Don't blame him, this is the result of using CVS, which is designed
around the assumption of a single central repository.  If current sync
speed is to slow for you, try to make it easier for him to send
patches forward.

Jörn

-- 
Invincibility is in oneself, vulnerability is in the opponent.
-- Sun Tzu
