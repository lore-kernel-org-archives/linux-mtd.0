Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 148JH1-0000Lc-00
	for mtd-list@infradead.org; Tue, 19 Dec 2000 09:41:31 +0000
Received: from green.csi.cam.ac.uk ([131.111.8.57] ident=exim)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 148JH0-0000LW-00
	for mtd@infradead.org; Tue, 19 Dec 2000 09:41:30 +0000
Date: Tue, 19 Dec 2000 09:41:15 +0000 (GMT)
From: David Vrabel <dv207@hermes.cam.ac.uk>
To: Shane Nay <shane@agendacomputing.com>
cc: mtd@infradead.org
Subject: Re: cfi_cmdset_0001.c: do_write_buffer: wrong length
In-Reply-To: <0012182224162J.11759@www.easysolutions.net>
Message-ID: <Pine.HPX.4.21L.0012190929510.12642-100000@punch.eng.cam.ac.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 18 Dec 2000, Shane Nay wrote:

> Okay, last message was way cryptic again..., I'm not a master communicator.  
> Anyway, I have succesfully tested the following change on two interleaves.  
> First device:
> two x16 devices in x8 mode interleaved
> Second device:
> one x16 device in x16 mode
> 
> It's only one change... cfi_cmdset_0001.c:
> /* Write length of data to come */
> -cfi_write(map,CMD((len/(cfi->device_type*CFIDEV_INTERLEAVE))-1),cmd_adr);
> +cfi_write(map,CMD((len/(cfi->device_type))-1),cmd_adr);

However this would break the case 1 in the table below.  Whereas 
    cfi_write(map, CMD(len/CFIDEV_BUSWIDTH-1), cmd_adr);
would work.

To add to the table...

device type  interleave  bus width  buf write len
2 (x16)      1           1 (x8)     len/1-1
2 (x16)      1           2 (x16)    len/2-1
2 (x16)      2           4 (x32)    len/4-1
2 (x16)      2           2 (x16)    len/2-1

It's still len/buswidth-1.

David Vrabel



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
