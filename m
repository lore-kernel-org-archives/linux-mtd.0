Received: from h139-142-224-7.gtcust.grouptelecom.net ([139.142.224.7])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16sSYk-000384-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Apr 2002 18:59:06 +0100
Received: from athlon (24-66-30-3.gatewest-shaw.ca [24.66.30.3])
        by kynes.gatewest.net (8.12.1/8.12.0.Beta19/Debian 8.12.0.Beta19) with SMTP id g32Hx3du018655
        for <linux-mtd@lists.infradead.org>; Tue, 2 Apr 2002 11:59:03 -0600
Message-ID: <005701c1da70$1a0370f0$87657bc8@athlon>
From: "Derek Ross" <dross@iders.ca>
To: <linux-mtd@lists.infradead.org>
References: <01f601c1d9ce$b9a1e5d0$87657bc8@athlon>  <3371.1017706441@redhat.com>
Subject: Re: Are erase suspends possible? 
Date: Tue, 2 Apr 2002 11:59:14 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

> dross@iders.ca said:
> > I was looking through the code in  cfi_cmdset_0001.c, and it appears
> > that erase suspends are not implemented. Is this correct? 
> 
> No. Erase suspend has been working for ages. What version of 
> cfi_cmdset_0001.c are you looking at?

Sorry, I'm still wrapping my brain around mtd.

I'm looking at a recent version, and it has
the function "cfi_intelext_suspend".

I was also looking at the function "do_write_oneword", and
internally, it seems to halt if an erase is in progress.

Also, the function, do_erase_oneblock seems to 
block during the erase.

What would be good for my application is if there
were two more functions:

"do_erase_oneblock_dont_wait",
which doesn't wait for the erase to finish, and
returns immediately,

and

"do_write_oneword_suspend_if_needed",
which will always write without delay, even
if it has to suspend an erase that's in progress.

I'm sure it wouldn't be difficult to write these
extra functions (especially "do_write_oneword_suspend_if_needed", 
which would just need an call to "cfi_intelext_suspend"), 
but I'm worried that it would 
be impossible to call using /dev/mtd and ioctl calls.

Also, my app will effective deactivate any other 
flash interaction during this phase, so I'm not
worried about JFFS interference.

Thanks,
Derek Ross.
