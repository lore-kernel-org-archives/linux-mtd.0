Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cp0oE-0000dW-9O
	for linux-mtd@lists.infradead.org; Thu, 13 Jan 2005 03:58:27 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: "David A. Marlin" <dmarlin@redhat.com>
In-Reply-To: <41E59642.2040508@redhat.com>
References: <41E59642.2040508@redhat.com>
Content-Type: text/plain
Message-Id: <1105606708.3116.20.camel@lap02.tec.linutronix.de>
Mime-Version: 1.0
Date: Thu, 13 Jan 2005 09:58:28 +0100
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: AG-AND requested changes
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

On Wed, 2005-01-12 at 22:27, David A. Marlin wrote:
> Thomas:
> Note: I have two additional comments regarding the proposed solutions.
> 
> 1) The code changes use an array of bad block table addresses (one for 
> each chip) in case the erase spans multiple chips and BBT per chip is 
> used.  Based on my testing I don't think this ever occurs (at least for 
> this device).  If we could assume that it would never occur, the code 
> for this could be simplified (no array or loops required).

Let it this way, so all possible combinations are covered. Please do not
make it dependend on NAND_IS_AND, invent a new option like
BBT_AUTO_REFRESH or what ever nice symbol you imagine.

So in case other chips suffer from the same problem we have the solution
handy without touching the code. The trend is going to those multibit
cells so I expect this to be neccecary for other devices too.

> 2) The command for 'device recovery' is a two cycle command, but the 
> first command byte is 0x00 (same as for READ0).  Since the process 
> requires that we can distinguish between a recovery and a read 
> operation, I added a high order bit to the initial command (0x100) to 
> make it unique and masked it off when actually sending the command. 
> Please let me know if you have a more elegant (or acceptable) solution.

Looks sane. You call this from the board driver I guess ?

tglx
