Received: from chello080110132030.102.11.vie.surfer.at
	([80.110.132.30] helo=mail.hurricane.at ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B0cUO-0006qO-IX
	for linux-mtd@lists.infradead.org; Tue, 09 Mar 2004 08:21:27 +0000
Date: Tue, 9 Mar 2004 09:16:09 +0100 (CET)
From: Matthias Gorjup <mgorjup@norik.com>
To: Thomas Gleixner <tglx@linutronix.de>
In-Reply-To: <200403090829.36404.tglx@linutronix.de>
Message-ID: <Pine.LNX.4.10.10403090907490.1601-100000@mail.hurricane.at>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
Subject: Re: Compiling kernel 2.4.20 with the latest snapshot of mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Tue, 9 Mar 2004, Thomas Gleixner wrote:

> On Monday 08 March 2004 18:52, Matthias Gorjup wrote:
> > from the mtd CVS repository. I apply the patch by invoking script
> > sh patchin.sh /home/gorjup/temp/linux but I get errors when compiling.
> > Here are the errors:
> 
> Try
> sh patchin.sh -j /home/gorjup/temp/linux
> 
I tried it, but I got errors as well. But does it make sense at all to
take the latest snapshot from CVS and integrate it in our product with
kernel 2.4.20 since there is no guarantee that the latest snapshot from
CVS is stable? 
Our problem is the speed of writing to flash memory (Fujitsu MBMLV650,
16bit, 8MB). It takes us minimum 5 minutes for copying a 2MB large file
from mounted NFS to flash partition. Is that normal? how could we optimize
it?

Matthias Gorjup
Norik Systems
www.norik.com
> -- 
> Thomas
> ________________________________________________________________________
> linutronix - competence in embedded & realtime linux
> http://www.linutronix.de
> mail: tglx@linutronix.de
> 
> 
