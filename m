Received: from smtp.mailbox.net.uk ([195.82.125.32])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15HkRi-0003Ek-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Jul 2001 12:03:50 +0100
Date: Wed, 4 Jul 2001 11:49:19 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: "Nikunj A. Dadhania" <nikunj@bindaas.org>
Cc: linux-arm-kernel@lists.arm.linux.org.uk, ndadhania@yahoo.com,
   jffs-dev@axis.com, linux-mtd@lists.infradead.org
Subject: Re: Kernel 2.4.5 dumped on executing Ghostscript.
Message-ID: <20010704114919.A1256@flint.arm.linux.org.uk>
References: <868zi53rkh.fsf@bindaas.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <868zi53rkh.fsf@bindaas.org>; from nikunj@bindaas.org on Wed, Jul 04, 2001 at 04:10:46PM +0530
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wed, Jul 04, 2001 at 04:10:46PM +0530, Nikunj A. Dadhania wrote:
> Unable to handle kernel NULL pointer dereference at virtual address 00000000
> pgd = c0204000
> *pgd = 00000000, *pmd = 00000000
> Internal error: Oops: 0
> CPU: 0
> pc : [<00000000>]    lr : [<c02ba578>]
> sp : c01fddb0  ip : 00000007  fp : c01fde18
> r10: 017ff740  r9 : c01fde54  r8 : c01e8ac4
> r7 : 00000000  r6 : c032c940  r5 : 00000000  r4 : c01fdcd0
> r3 : 00000000  r2 : 00000019  r1 : 00000000  r0 : 00000000
> Flags: nzcv  IRQs on  FIQs on  Mode USER_26  Segment kernel
> Control: C020717F  Table: C020717F  DAC: 0000001D
> Process swapper (pid: 1, stackpage=c01fd000)
> Kernel panic: Attempted to kill init!
> 

Where's the rest of the dump?  Eg, code line, backtrace, stack, etc?
These are _vital_ to interpret what went wrong.  Also, it'd be good if
you could supply the corresponding System.map file for the exact kernel
you were running (or alternatively use ksymoops to decode the values
in [< >], or look them up yourself and post the results here).

Note that if you're sending the System.map file, the mailing list has a
limit of 40KB per message, so you may have to compress it.
   _____
  |_____| ------------------------------------------------- ---+---+-
  |   |        Russell King       linux@arm.linux.org.uk      --- ---
  | | | |            http://www.arm.linux.org.uk/            /  /  |
  | +-+-+                                                     --- -+-
  /   |               THE developer of ARM Linux              |+| /|\
 /  | | |                                                     ---  |
    +-+-+ -------------------------------------------------  /\\\  |
