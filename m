Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12W722-0005hO-00
	for mtd-list@infradead.org; Sat, 18 Mar 2000 00:23:54 +0000
Received: from pulse.flatline.de ([194.42.82.219] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12W720-0005gv-00
	for mtd@infradead.org; Sat, 18 Mar 2000 00:23:52 +0000
Date: Sat, 18 Mar 2000 01:23:24 +0100 (CET)
From: Andreas Kotes <count@flatline.de>
To: "Mr. Oogie Boogie" <rpreston@mitre.org>, mtd@infradead.org
Subject: Re: LILO and booting from DiskOnChip
In-Reply-To: <38D29904.DA66D6E@mitre.org>
Message-ID: <Pine.NEB.4.20.0003180119300.8571-100000@pulse.flatline.de>
References: <38D29904.DA66D6E@mitre.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


Hi Ralph,

On Fri, 17 Mar 2000, Mr. Oogie Boogie wrote:

> Simply, when boot/root is set to the DoC, kernel messages during
> bootup *do not* appear over the serial line. Strangely, when a boot
> floppy (identical kernel) is used with the DoC as root the kernel
> messages *do* appear over the serial line. 
>  
> Has anyone encountered this problem before?

yes.

> Do you think this is an error with the DoC or kernel?

neither. the LILO you're using is stripped and doesn't parse any
commandline-parameters you want to pass to the kernel.

> Any helpful suggestions on how I can fix this?

I patched the kernel (just calling the function that is called when a
console=-parameter shows up in the commandline upon kernel init).

Works like a charm.

   Count

P.S: Please fix your From:-Header

-- 
  -= Andreas Kotes - mailto:count@flatline.de - Questions? Just ask =-
 -= Are you doing what you are able to do to support peace on earth? =-
-= Commercial use of my email address NOT allowed. PGP key available. =-




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
