Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 148J0U-0000GZ-00
	for mtd-list@infradead.org; Tue, 19 Dec 2000 09:24:26 +0000
Received: from laxmls02.socal.rr.com ([24.30.163.11])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 148J0T-0000GT-00
	for mtd@infradead.org; Tue, 19 Dec 2000 09:24:25 +0000
From: Shane Nay <shane@agendacomputing.com>
Reply-To: shane@agendacomputing.com
To: "D. Vrabel" <dv207@cam.ac.uk>, Nicolas Pitre <nico@cam.org>
Subject: Re: cfi_cmdset_0001.c: do_write_buffer: wrong length
Date: Mon, 18 Dec 2000 22:24:16 +0000
Content-Type: text/plain;
  charset="us-ascii"
Cc: mtd@infradead.org
References: <Pine.LNX.4.30.0012081303110.6716-100000@xanadu.gn.com> <3A313CE7.DFF1BC4E@cam.ac.uk>
In-Reply-To: <3A313CE7.DFF1BC4E@cam.ac.uk>
MIME-Version: 1.0
Message-Id: <0012182224162J.11759@www.easysolutions.net>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Okay, last message was way cryptic again..., I'm not a master communicator.  
Anyway, I have succesfully tested the following change on two interleaves.  
First device:
two x16 devices in x8 mode interleaved
Second device:
one x16 device in x16 mode

It's only one change... cfi_cmdset_0001.c:
/* Write length of data to come */
-cfi_write(map,CMD((len/(cfi->device_type*CFIDEV_INTERLEAVE))-1),cmd_adr);
+cfi_write(map,CMD((len/(cfi->device_type))-1),cmd_adr);

Dividing by CFIDEV_INTERLEAVE there I think is wrong.  The interleave 
_increases_ not decreases the number of bytes/words you are going to write.

Thanks,
Shane.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
