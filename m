Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 148Jge-0000Rd-00
	for mtd-list@infradead.org; Tue, 19 Dec 2000 10:08:00 +0000
Received: from laxmls02.socal.rr.com ([24.30.163.11])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 148Jgd-0000RV-00
	for mtd@infradead.org; Tue, 19 Dec 2000 10:07:59 +0000
From: Shane Nay <shane@agendacomputing.com>
Reply-To: shane@agendacomputing.com
To: David Vrabel <dv207@hermes.cam.ac.uk>
Subject: Re: cfi_cmdset_0001.c: do_write_buffer: wrong length
Date: Mon, 18 Dec 2000 23:07:47 +0000
Content-Type: text/plain;
  charset="US-ASCII"
Cc: mtd@infradead.org
References: <Pine.HPX.4.21L.0012190929510.12642-100000@punch.eng.cam.ac.uk>
In-Reply-To: <Pine.HPX.4.21L.0012190929510.12642-100000@punch.eng.cam.ac.uk>
MIME-Version: 1.0
Message-Id: <0012182307472P.11759@www.easysolutions.net>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Tuesday 19 December 2000 09:41, David Vrabel wrote:
> On Mon, 18 Dec 2000, Shane Nay wrote:
> > Okay, last message was way cryptic again..., I'm not a master
> > communicator. Anyway, I have succesfully tested the following change on
> > two interleaves. First device:
> > two x16 devices in x8 mode interleaved
> > Second device:
> > one x16 device in x16 mode
> >
> > It's only one change... cfi_cmdset_0001.c:
> > /* Write length of data to come */
> > -cfi_write(map,CMD((len/(cfi->device_type*CFIDEV_INTERLEAVE))-1),cmd_adr)
> >; +cfi_write(map,CMD((len/(cfi->device_type))-1),cmd_adr);
>
> However this would break the case 1 in the table below.  Whereas
>     cfi_write(map, CMD(len/CFIDEV_BUSWIDTH-1), cmd_adr);
> would work.
>
> To add to the table...
>
> device type  interleave  bus width  buf write len
> 2 (x16)      1           1 (x8)     len/1-1
> 2 (x16)      1           2 (x16)    len/2-1
> 2 (x16)      2           4 (x32)    len/4-1
> 2 (x16)      2           2 (x16)    len/2-1
>
> It's still len/buswidth-1.
>

Hmm..., good point.  But what about interleaved x8 devices?  Would they be 
fine?  (Brains not functioning at the moment, but my instinct says it would 
be divided by 2 when it should be divided by 1, but I might be messing up the 
"len" calculation that happens before this.  I initially did it the way you 
mention here, but thought I found a flaw, but could definetly be wrong.)

Thanks,
Shane.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
