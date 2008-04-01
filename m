Received: from [63.81.120.155] (helo=imap.sh.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JggAg-0003R5-8u
	for linux-mtd@lists.infradead.org; Tue, 01 Apr 2008 13:05:02 +0000
Message-ID: <47F232D2.9040200@ru.mvista.com>
Date: Tue, 01 Apr 2008 17:04:18 +0400
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: Laurent Pinchart <laurentp@cse-semaphore.com>
Subject: Re: [PATCHv2] powerpc: Describe memory-mapped RAM&ROM chips OF
	bindings
References: <200803311839.10519.laurentp@cse-semaphore.com>
	<200804011047.42971.laurentp@cse-semaphore.com>
	<Pine.LNX.4.64.0804010217470.3571@t2.domain.actdsltmp>
	<200804011439.04905.laurentp@cse-semaphore.com>
In-Reply-To: <200804011439.04905.laurentp@cse-semaphore.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, MTD mailing list <linux-mtd@lists.infradead.org>,
	Trent Piepho <xyzzy@speakeasy.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Laurent Pinchart wrote:

>>>On Monday 31 March 2008 19:06, Sergei Shtylyov wrote:

>>>>>       p) Freescale Synchronous Serial Interface
>>>>>-	  q) USB EHCI controllers
>>>>>+      q) USB EHCI controllers
>>>>>+      r) Memory-mapped RAM & ROM

>>>>    Memory-mapped RA/RO Memory again? Should better drop this. :-)

>>>You're quite picky, aren't you ? :-)

>>>I suppose "Memory-mapped RA & RO" won't be accepted, so what about "Auxiliary
>>>RAM & ROM" ?

>>Direct-mapped?

> Fine with me. Sergei ?

    I agree. The only thing that somewhat worries me it that it will have no 
"compatible" prop...

WBR, Sergei
