Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13N9zD-00069Y-00
	for mtd-list@infradead.org; Fri, 11 Aug 2000 09:16:15 +0100
Received: from pat.uio.no ([129.240.130.16])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13N9zB-00069S-00
	for mtd@infradead.org; Fri, 11 Aug 2000 09:16:13 +0100
Received: from ifi.uio.no ([129.240.64.2])
	by pat.uio.no with esmtp (Exim 2.12 #7)
	id 13N9z0-0003D1-00
	for mtd@infradead.org; Fri, 11 Aug 2000 10:16:02 +0200
Received: from ganglot.ifi.uio.no (1824@ganglot.ifi.uio.no [129.240.66.26])
	by ifi.uio.no (8.8.8/8.8.7/ifi0.2) with ESMTP id KAA06886
	for <mtd@infradead.org>; Fri, 11 Aug 2000 10:16:01 +0200 (MET DST)
Cc: mtd@infradead.org
Subject: Re: Has MTD production quality support for DOC2000?
References: <ylb66p947pd.fsf@ganglot.ifi.uio.no> <5585.965911459@cygnus.co.uk>
From: Sigurd Urdahl <sigurdur@ifi.uio.no>
Date: 11 Aug 2000 10:16:01 +0200
In-Reply-To: David Woodhouse's message of Thu, 10 Aug 2000 13:44:19 +0100
Message-ID: <ylbvgx88b7i.fsf@ganglot.ifi.uio.no>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse <dwmw2@redhat.com> writes:
> sigurdur@ifi.uio.no said:
> >  I'm quite new at embedding my penguin, and will have to embedd it on
> > a DOC2000. But since I'm new at this I am quite confused... I am
> > considering going with MTD instead of m-sys drivers, but after
> > searching the archives I'm still not sure on wether MTD is stable
> > enough for production or not, so please help:=) 
> 
> Not yet, if you want to write to the device. Nobody at the moment seems to 
> be working very fast on it, and I've been busy with JFFS recently.

:(

> Linking the M-Systems drivers into your kernel will place _you_ in violation
> of the GPL and you may be sued,

If the driver is compiled as a module and I use loadlin and initrd to
load it from a Dos-formatted DOC I thought I would be in the clear
_legally_, but I know it's not a very good idea tachnically or moraly.
And I'm probably not going to do it either - I'll rather wait for the
next prototype (there is a whole series of prototypes I'm going to
test - and no, I wasn't part of the team spec'ing them..) to arrive,
and hope it's non-DOC based:)

> so why not help out with the MTD drivers?

I would really like to if I thought I could help, but with my coding
skills and general knowledge of linux-drivers I think I would slow
down rather than speed up the development;)

-sig
-- 
sigurd urdahl


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
