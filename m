Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13wm5a-0003hI-00
	for mtd-list@infradead.org; Fri, 17 Nov 2000 14:02:02 +0000
Message-ID: <004601c0509e$b10d5630$e3e8b2c6@hawk>
From: "Mike Hill" <mhill@bustech.com>
To: <mtd@infradead.org>
Cc: <mtd@infradead.org>
References: <20001117005926.A829@portablue.linux-apollo.org> <3A14EFF6.EE574112@auriga.ru>
Subject: Re: MTD on intel 28F320B3 flash memory
Date: Fri, 17 Nov 2000 08:59:15 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

The CFI code will not work with this chip without modification.

The 28F320B3 is a BOOT BLOCK flash part.  It contains Eight 8K regions and
63 64K regions.  The CFI code assumes that all regions are of the same size.
I am currently using this part in a design.  To get around this problem, I
changed the CFI code to treat the 8K regions as a single 64K region.

-Mike

----- Original Message -----
From: "Nick Ivanter" <nick@auriga.ru>
To: "Peter De Schrijver" <p2@portablue.linux-apollo.org>
Cc: <mtd@infradead.org>
Sent: Friday, November 17, 2000 3:44 AM
Subject: Re: MTD on intel 28F320B3 flash memory


> Are you sure it's not CFI complaint?
> I've been working with 28F640 which is CFI complaint and
> is detected and operated by the existing code fairly well.
> I believe the only difference between 28F640 and 28F320 is
> that the latter is smaller. They are even described in a
> single datasheet.
>
> Nick
>
> Peter De Schrijver wrote:
>
> > Hi,
> >
> > Is this type of flash memory supported ? It seems to use the standard
> > intel/sharp command set (command set #3), although it's not fully CFI
> > compliant.
> >
> > Thanks,
> >
> > Peter.
> >
> > To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
>
>
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
