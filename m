Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11xWri-0002G5-00
	for mtd-list@infradead.org; Mon, 13 Dec 1999 14:54:18 +0000
Received: from [216.211.97.50] (helo=gizmo.adis.on.ca ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11xWrS-0002Fz-00
	for mtd@imladris.mvhi.com; Mon, 13 Dec 1999 14:54:08 +0000
Date: Mon, 13 Dec 1999 09:01:06 -0600 (CST)
From: Adi Linden <adi@adis.on.ca>
To: ralph stickley <ralph@datalux.com>
cc: "Tkatchouk, Pavel" <PTkatchouk@squirrelsystems.com>,
        "'linux-embedded@waste.org'" <linux-embedded@waste.org>,
        MTD <mtd@imladris.mvhi.com>, Oron Ogdan <Orono@m-sys.com>
Subject: Re: Anyone embedding RH 6.1 / 2.2.12 ?
In-Reply-To: <384ED6E8.59F54440@datalux.com>
Message-ID: <Pine.LNX.4.10.9912130854360.3723-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

> >I was wondering if anyone has sucessfully "embedded" the 2.2.12 kernel
> >from the RedHat 6.1 distro...
> >2.0.36 worked fine but I am required to do an upgrade and there seems to
> >be quite a few differences.

Doing just. Took Redhat 6.1 and created minimal tar balls of packages.
Stribed binaries and libs and no docs, man pages, etc. It's up and running
including networking in an 8MB partition. df tells me it's consuming about
5MB.

> >Currently, I can boot to the M-Systems chip as single user .  With a
> >normal boot, the login prompt shows but does not allow anyone, even
> >root, to login (I've copied the passwd, shadow, tons of library files
> >and pam.d stuff, but still no luck).

Compile util-linux, sysutils, shutils, ppp without PAM and shadow
password. Get's rid of a lot of libs. You can grab my work so far at:
http://projects.adis.on.ca/Embedded/embedded-0.13.tar.gz
No docs, though,except for some noted in 'FileList'...

Regards,
Adi



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
