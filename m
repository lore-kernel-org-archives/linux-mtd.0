Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14O2eR-00021H-00
	for mtd-list@infradead.org; Wed, 31 Jan 2001 19:10:43 +0000
Received: from awpi.com
	([204.241.40.2] helo=sisko.awpi.com ident=root)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14O2eP-00021B-00
	for mtd@infradead.org; Wed, 31 Jan 2001 19:10:42 +0000
From: " Brian Michalk" <michalk@awpi.com>
To: "Tim Riker" <Tim@Rikers.org>
Cc: <mtd@infradead.org>
Subject: RE: Lilo and device 5d01
Date: Wed, 31 Jan 2001 12:42:07 -0600
Message-ID: <NEBBLKIBMLGPAFMHEJICCEIJCFAA.michalk@awpi.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <3A785DF8.41CBF1A3@Rikers.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I read the man page.
I tried all sorts of combinations.
The most logical:
disk=/dev/nftla
	bios=0x80

doesn't work.  I get the fatal: Sorry, don't know how to handle device
0x5d01.

> -----Original Message-----
> From: timr@sisko.awpi.com [mailto:timr@sisko.awpi.com]On Behalf Of Tim
> Riker
> Sent: Wednesday, January 31, 2001 12:48 PM
> To: Brian Michalk
> Cc: mtd@infradead.org
> Subject: Re: Lilo and device 5d01
>
>
> >From "man lilo.conf":
>
> bios=' parameter.
>
> The BIOS numbers your disks 0x80, 0x81, etc. and
> it is impossible to decide which Linux disk
> corresponds to which BIOS disk (since this depends
> on the BIOS setup, and on the type of BIOS), so if
> you have an unusual setup you need to state the
> correspondence between Linux disks and BIOS
> disks. For example,
>
> disk=/dev/sda
>         bios=0x80
> disk=/dev/hda
>         bios=0x81
> Brian Michalk wrote:
> >
> > This came up a week or two ago.
> >
> > How do I tell Lilo that disk 0x5d01 is really disk 0x80?
> >
> > To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
> --
> Tim Riker - http://rikers.org/ - short SIGs! <g>
> All I need to know I could have learned in Kindergarten
> ... if I'd just been paying attention.
>



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
