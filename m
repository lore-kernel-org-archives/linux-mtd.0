Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 148IqS-0000Eq-00
	for mtd-list@infradead.org; Tue, 19 Dec 2000 09:14:04 +0000
Received: from polaris.uk.insnet.net ([194.177.174.245])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 148IqR-0000Ek-00
	for mtd@infradead.org; Tue, 19 Dec 2000 09:14:03 +0000
Received: from laxmls02.socal.rr.com (laxmls02.socal.rr.com [24.30.163.11])
	by polaris.uk.insnet.net (8.9.3/8.9.3) with ESMTP id JAA15116
	for <mtd@infradead.org>; Tue, 19 Dec 2000 09:16:10 GMT
From: Shane Nay <shane@agendacomputing.com>
Reply-To: shane@agendacomputing.com
To: "D. Vrabel" <dv207@cam.ac.uk>, Nicolas Pitre <nico@cam.org>
Subject: Re: cfi_cmdset_0001.c: do_write_buffer: wrong length
Date: Mon, 18 Dec 2000 22:13:46 +0000
Content-Type: text/plain;
  charset="us-ascii"
Cc: mtd@infradead.org
References: <Pine.LNX.4.30.0012081303110.6716-100000@xanadu.gn.com> <3A313CE7.DFF1BC4E@cam.ac.uk>
In-Reply-To: <3A313CE7.DFF1BC4E@cam.ac.uk>
MIME-Version: 1.0
Message-Id: <0012182213462I.11759@www.easysolutions.net>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Friday 08 December 2000 19:56, D. Vrabel wrote:
> Hi,
>
> Nicolas Pitre wrote:
> > On Fri, 8 Dec 2000, David Vrabel wrote:
> > > In cfi_cmdset_0001.c do_write_buffer writes an incorrect length to the
> > > chip
> > >
> > >     cfi_write(map, CMD((len/(cfi->device_type*CFIDEV_INTERLEAVE))-1),
> > >         cmd_adr);
> > >
> > > Should it it be?
> > >     cfi_write(map, CMD(len/map->buswidth-1), cmd_adr);
> >
> > No.  This will break the case where the interleave isn't 1.
> >
> > Hmmm... Will it?
> >
> > Euh...  Each time I get around this question I get confused...
> >
> > Does someone have the data sheet nearby? (I don't ATM)...  What should
> > the lenght be if a x16 chip is used in x8 mode?  bytes/sizeof(char) or
> > bytes/sizeof(short)?
> >
> > On a 2 x16 arrangement you have buswidth=4, interleave=2, devicetype=2. 
> > In that case it should be len/4 - 1.
> >
> > Maybe you are right after all.
>
> Time to compile a big list of all the arrangements of chips and the
> resultant buffer write length...
>
> So far we have:
>
> device type  interleave  bus width    buf write len
> 2 (x16)      1           1 (x8)       len/1-1
> 2 (x16)      1           2 (x16)      len/2-1
> 2 (x16)      2           4 (x32)      len/4-1
>
> So far it len/buswidth-1...


Yea..., this is what I was _trying_ to say, but communicated very poorly 
about 2 weeks ago.  It's fixed in the patches I posted to the agenda site.

Thanks,
Shane.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
