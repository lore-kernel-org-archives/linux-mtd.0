Received: from a.smtp-out.sonic.net ([208.201.224.38])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18O3Kz-0004oN-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2002 22:03:45 +0000
Message-ID: <D3AF5F134D627243993F2F2FC32EE4D229C4B0@mailman.eason.com>
From: Alex Pavloff <apavloff@eason.com>
To: "'Tobias Otto-Adamczak'" <toa@indakom.de>, linux-mtd@lists.infradead.org
Cc: Alex Pavloff <apavloff@eason.com>
Subject: RE: writing new BBRAM driver
Date: Mon, 16 Dec 2002 14:33:41 -0800
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

> That depends on your hardware and your applications needs. 
> You may want to try minix. How much (KB) is your BBRAM, anyway ? Maybe you

> need no FS at all ?

Alright, I've got most of that stuff done, and the device is there.  It just
reboots when I mount the bbram. :-)  Got some work to do.

I want to use a file system to provide the abstraction layer so that I can
go to a hard drive if needed.  Makes my life easier too, especially on
testing.   My previous product had a 128KB BBRAM that was mapped to a DOS
floppy drive by the bios and formatted with FAT12, and that worked well.
Does the minix fs have a small overhead like FAT12?   Could I use FAT12 if I
was willing to stick with 8.3?  (Which wouldn't be a bad idea anyway, for
other reasons in my project).

Alright, one more question:  What should the erasesize be for BBRAM?
Obviously I'm not worried about wear, so should it be zero or one or
something else?

Thanks!

Alex Pavloff - apavloff@eason.com
Eason Technology -- www.eason.com
 
