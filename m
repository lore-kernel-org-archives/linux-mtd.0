Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13FYdK-00038j-00
	for mtd-list@infradead.org; Fri, 21 Jul 2000 09:58:14 +0100
Message-ID: <39781EAE.58A56DA3@zentropix.com>
Date: Fri, 21 Jul 2000 10:58:06 +0100
From: Trevor Woolven <trevw@zentropix.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>, MTD <mtd@infradead.org>
Subject: Re: building M-Sys DOC driver as a module
References: <Pine.LNX.4.10.10007201601430.1064-100000@infradead.org>
Content-Type: multipart/mixed;
 boundary="------------37FCF4E0556161DE8012872E"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multi-part message in MIME format.
--------------37FCF4E0556161DE8012872E
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

David Woodhouse wrote:

> On Thu, 20 Jul 2000, Adi Linden wrote:
>
> > I'd be quite interested in the modular DOC driver as well. So far I've
> > seen it talked about quite a bit but never seen it.
> >
> > I produces a 2.2.14 kernel patch for the M-Systems DOC driver but that's
> > in violation of GPL for a production environment...
>
> Modular drivers and initrd are a horrible waste of space in an embedded
> system, IMO. Far better to cut out module support completely, and even
> also block device support, putting JFFS on the DiskOnChip instead of NFTL.

Ok, IMHO using an initrd doesn't actually cost you too much, the bulk of it
is used to store the kernel which has to go somewhere, right? I haven't done
a comparison on the relative sizes of a kernel with the driver compiled in vs

one without to measure what the difference is but that would be quite a
simple
thing to do - especially if space was getting tight. I agree that there's a
bit of
a waste having a DOS partition on the DOC to boot syslinux from but neither
LILO nor GRUB are perfect either.

I agree that getting JFFS on DOC is a good thing but when will it happen?
I don't see the M-Systems driver being the driver of choice in the long run,
most people would much rather use a GPL one and that's where MTD wins big
time!

All I'm doing is a short-term fix for expediency.

>
>
> The free driver isn't far off being usable in production - there's not a
> lot to do, it's just that I haven't had time to do it. Patrick is close to
> having ECC support, now we just need to properly thread the NFTL code and
> make it deal correctly with bad blocks, and for better efficiency, stick
> in the state handling for the individual flash chips, like I did for the
> CFI chips.
>
> Trevor - Did I miss something of the TODO list that we drew up?
>

I'm a bit out of the loop on this one :-(
I haven't been following all the updates to the driver be sure.
I've attached the list we drew-up as a memory-jogger (bad pun intended!)

>
> --
> dwmw2
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

--
Zentropix Inc - a Lineo company

Tel: +44 (0)1273 234 647         Fax: +44 (0)1273 704 482

Visit http://www.zentropix.com/ for Real Time Linux Tools
Visit http://www.realtimelinux.org/ for Real Time Linux Information



--------------37FCF4E0556161DE8012872E
Content-Type: text/plain; charset=us-ascii;
 name="mtd-todo-list.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mtd-todo-list.txt"

>From - Mon May 22 15:54:41 2000
X-Mozilla-Status: 0001
Message-ID: <39094DF8.7BD43B12@zentropix.com>
Date: Fri, 28 Apr 2000 09:38:16 +0100
From: Trevor Woolven <trevw@zentropix.com>
Organization: Zentropix
X-Mailer: Mozilla 4.07 [en] (X11; I; Linux 2.2.13 i586)
MIME-Version: 1.0
To: MTD <mtd@infradead.org>
Subject: TODO List
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi Everyone,

Dave Woodhouse and I had a meeting yesterday and we came up with the
following list of things that need doing to/fixing in the MTD code:

1	Write Support
	a	ECC
	b	Bad block handling (static)
	c	Bad block detection and handling (dynamic)
	d	Timing constraints
	e	Asynchronous writes

2	FTL fix

3	Support for NOR flash/PCMCIA

4	Support utilities
	a	Formatting
	b	Bad sector/block detection
	c	Consistency checking

5	Documentation
	a	Architectural description
	b	User Guide and API listing
	c	...

6	DOC Millenium support

7	Fix the character device memory copy to/from user space

8	JFFS/FFS2 support

9	GRUB
	a	Filesystem support (NFTL, JFFS etc)
	b	MTD support

10	Execute-in-place

We attempted to prioritize them as we saw fit with the following two
goals: 
	a)	submission to the main-stream linux kernel (2.4/2.5)
	b)	production of a fully GPL alternative to what M-Systems offer

Since Dave's still officially on holiday I agreed to post this to the
list. We're after your opinions and suggestions regarding the TODO list
and the two immediate goals for this work. We're also after volunteers
to take on various parts of the development. Please feel free to comment
upon the above.

Thanks,

Trevor.

--
Zentropix Inc - a Lineo company

Tel: +44 (0)1273 234 647	 Fax: +44 (0)1273 704 482

Visit http://www.zentropix.com/ for Real Time Linux Tools
Visit http://www.realtimelinux.org/ for Real Time Linux Information

--------------37FCF4E0556161DE8012872E--



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
