Received: from [196.38.120.139] (helo=ntserver1.secureworx.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16awuj-0002Wg-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Feb 2002 10:45:26 +0000
Message-ID: <9136BE9FE178D411A14F00508B6A0B7B36B7DD@ntserver1>
From: Robert Sandilands <robert.sandilands@secureworx.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: RE: FW: M-SYS Doc Replacements 
Date: Wed, 13 Feb 2002 12:58:33 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Ok, long story... 

The first driver we tried was the MTD driver, but that was Kernel 2.4.0 and
the guy that did it, did not know what he was doing - I also suspect there
was a few problems at that stage with the MTD driver. The binary driver did
work and it was therefore used.

Then problems with the Linux kernels forced us to first update to 2.4.3 and
then to 2.4.5 where we are now. Every time other issues forced us to change
and we wanted to keep everything as stable as possible, so we never tried
the MTD drivers in that process. 

Everything seems stable with the 2.4.5 kernel except with the little problem
with the load. We will most likely upgrade our kernel in the next 2-3 months
to 2.4.10 or later and then will also take the step with the MTD driver, but
up to that stage we have to live with the M-systems driver.

>From initial investigation the driver seems fine and with our next upgrade
that is definitely what we will use.

Thank you.

Robert Sandilands

> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]
> Sent: 13 February 2002 11:18
> To: Robert Sandilands
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: FW: M-SYS Doc Replacements 
> 
> 
> 
> robert.sandilands@secureworx.com said:
> > I really don't want to start a flame war about this, but I 
> think this
> > is a great example of why open-source is better than proprietary
> > software - and this discussions should be seen as such. If 
> not that is
> > how I meant it.
> 
> OK, thanks. Are you now using the GPL'd driver? Do you have 
> any problems 
> with it? I don't expect it to be perfect - but if there's something
> sufficiently wrong with it that caused you to even _consider_ 
> trying the 
> other driver, I'd appreciate a bug report.
> 
> 
> --
> dwmw2
> 
> 
