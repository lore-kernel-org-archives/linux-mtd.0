Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 1483lm-0005AJ-00
	for mtd-list@infradead.org; Mon, 18 Dec 2000 17:08:14 +0000
Received: from www.softsys.co.at
	([194.152.163.161] helo=corofin.softsys.co.at ident=qmailr)
	by infradead.org with smtp (Exim 3.16 #2)
	id 1483lj-0005AD-00
	for mtd@infradead.org; Mon, 18 Dec 2000 17:08:12 +0000
Message-ID: <001001c06914$bb3be160$5201a8c0@home.at>
From: "Erwin Authried" <eauth@softsys.co.at>
To: "Nicolas Pitre" <nico@cam.org>
Cc: <mtd@infradead.org>
References: <Pine.LNX.4.30.0012181049550.997-100000@xanadu.gn.com>
Subject: Re: module registration changes
Date: Mon, 18 Dec 2000 18:05:32 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Currently, I have two seperate directory trees for mtd and for the linux
kernel. With a link
to the mtd sources in the drivers directory, and a second link in
includes/linux to the includes/linux/mtd directory, both trees can
maintained with CVS completely seperately. This wouldn't be possible that
easy with files in the include/linux subdir.

-Erwin

----- Original Message -----
From: Nicolas Pitre <nico@cam.org>
To: Erwin Authried <eauth@softsys.co.at>
Cc: David Woodhouse <dwmw2@infradead.org>; <mtd@infradead.org>
Sent: Monday, December 18, 2000 4:50 PM
Subject: Re: module registration changes


>
>
> On Mon, 18 Dec 2000, Erwin Authried wrote:
>
> > there were a couple of small changes necessary to compile on 2.0.
> > Here are some other changes that I would like to commit too, please let
me
> > know if its ok.:
> >
> > * Use #ifdef NO_MM in mtdchar.c to avoid vmalloc if no MMU is used
> > (uClinux).
> >
> > * "list.h" is missing in the 2.0 kernel source. The best thing that I
could
> > think of is to simply add it
> > to MTD in linux/mtd/list.h.
>
> Well...  I would suggest you add it where it belongs i.e.
> include/linux/list.h.
>
>
> Nicolas
>
>



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
