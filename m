Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14yz4D-0006Ac-00
	for <linux-mtd@lists.infradead.org>; Sun, 13 May 2001 17:50:01 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3AFC3CD1.1AEBE5EF@mvista.com> 
References: <3AFC3CD1.1AEBE5EF@mvista.com> 
To: "George G. Davis" <davis_g@mvista.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Does MTD include support for STM M58LW064? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 13 May 2001 17:54:03 +0100
Message-ID: <22562.989772843@redhat.com>
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

davis_g@mvista.com said:
>  But I'll ask the question anyway in case I missed it: does MTD
> include support for the ST Microelectronics M58LW064 flash device?
> This device supports CFI commands. But I don't see any support for it
> in the current MTD CVS sources.

There's no such thing as 'CFI commands'. The only thing that's _common_ 
about the Common Flash Interface is the way you probe the chip to find out 
what commands it supports.

Looking at the datasheet for that chip, it seem to support command set 
number 0x20, which we don't currently have code to recognise. But at first 
glance, the command set described seems identical to the Intel chips.

Compare the commands listed in the datasheet with the ones in the Intel
datasheets, and if the latter really is a subset of the (parts we actually
use of the) former, then try hacking the CFI probe to treat cmdset 0x20 as
if it was cmdset 1, and see what happens. It'll probably work.

--
dwmw2
