Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12pzCy-0000S7-00
	for mtd-list@infradead.org; Thu, 11 May 2000 21:05:20 +0100
Received: from mail.transzap.net ([207.239.241.226] helo=tzi.transzap.com)
	by infradead.org with smtp (Exim 3.03 #1)
	id 12pzCx-0000S1-00
	for mtd@infradead.org; Thu, 11 May 2000 21:05:19 +0100
Date: Thu, 11 May 2000 14:14:21 -0600 (MDT)
From: Patrick Higgins <phiggins@transzap.com>
To: mtd@infradead.org
cc: syslinux@linux.kernel.org
Subject: DOC firmware update with PXELinux
Message-ID: <Pine.LNX.4.21.0005111346170.12018-100000@phiggins.transzap.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


I've been using a DOC I got from Neoware which is already setup for Linux,
but I just switched it out with one I got from Flytech, which seems to
have different firmware installed.  I'm not sure if this is what's causing
the problem, but I've been booting my system with PXE (network boot) and
now that I've switched the DOC, it no longer works.  Now I get all the way
through downloading the kernel image, and it says "Ready to start kernel",
but hangs there, instead of uncompressing and booting it as usual.

So, I believe I need to update the firmware on the DOC as specified in the
M-Systems user guide.  However, I have no easy way to boot DOS on this
machine, other than using PXE (it's diskless).  Has anyone gotten this to
work, and might have some tips?

I'm currently using the RedHat pxe-0.1-14 RPM for the initial stages,
configured with an NT server doing the DHCP, my box doing PXE proxyDHCP
and serving up pxelinux.bin (from the syslinux distribution) with mtftp,
and pxelinux finishes off by connecting to my tftp-hpa server to get it's
kernel image.  This seems overly complicated, but I've not been able to
get a simpler configuration to work.  In particular, it seems like I need
to run a DHCP daemon on both the normal DHCP port and proxyDHCP ports, but
I'm not sure what is supposed to be different in the information served
from each port.  If anyone has working config files for ISC DHCP 3.0, they
would be very helpful.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
