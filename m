Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14p5P9-0005Kj-00
	for mtd-list@infradead.org; Mon, 16 Apr 2001 10:34:43 +0100
Received: from h154.195-230-144.ukrpack.net ([195.230.144.154] helo=srv1.lrpeople.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14p5P7-0005Kd-00
	for mtd@infradead.org; Mon, 16 Apr 2001 10:34:42 +0100
Message-ID: <003d01c0c650$2a262480$4d02010a@lrpeople.com>
From: "Alexander Melichenko" <AlexanderM@lrpeople.com>
To: <mtd@infradead.org>
References: <Pine.LNX.4.21.0104151822270.6721-100000@dagobert.svc.sysgo.de>
Subject: Re: Elan SC520 - problem with MTD
Date: Mon, 16 Apr 2001 12:35:17 +0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hello, Robert!
On  Sun, 15 April 2001, Robert Kaiser wrote :


>
> Hello Alexander
>
> On Fri, 13 Apr 2001, Alexander Melichenko wrote:
>
> > Hello, Robert!
> > I downloaded latest version of MTD from CVS with Your sc520cdp.c file. I
> > compile kernel with
> > MTD support, but result is not very good. During booting I see
> >   physmap flash device: 400000 at 800000
> >   Physically mapped flash : Found no CFI device at location zero
> >
> > After booting file /proc/mtd consists only:
> >    dev:       size      erasesize      name
> >
> > What does it mean?
>
> I suspect that you have not enabled CONFIG_MTD_CFI and/or
> CONFIG_MTD_JEDEC. The two 8MB Flash banks on the SC520CDP
> seem to be CFI compliant devices while the boot ROM is a JEDEC
> device. The sc520cdp.c module just provides a mapping (i.e.
> addresses and access methods for the Flash, but the probing stuff
> is in the CFI and JEDEC section.
>
>
> > Can you sent me your .config file? May be I check wrong option before
kernel
> > compilation?
>
> I'm sending you a copy of my .config file. It is from a 2.4.3 kernel,
> but the CONFIG_MTD_* options should work for you too.
>
> [Be careful not to write to device /dev/,mtd3. (Unless you want to
> overwrite your boot ROM).]
>

I checked my .config file and found following:
  - CONFIG_MTD_PHYSMAP was "CONFIG_MTD_PHYSMAP =y". I uncheked this option.
  - CONFIG_MTD_CFI=y
  - CONFIG_MTD_JEDEC=y
The rest of the options were as in your file.
I recompiled a kernel. During the boot up procces there were no messages
about MTD or CFI. After booting up in
file /proc/mtd was a record:
    dev:       size      erasesize      name

I hoped to see more informations in this file.

What should I do next?
May be I must reset some jumpers on CDP boards?

Thanks.
Alexander Melichenko.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
