Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 143WGd-0003sH-00
	for mtd-list@infradead.org; Wed, 06 Dec 2000 04:33:19 +0000
Received: from [203.46.70.199] (helo=singularity.tronunltd.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 143WGb-0003sB-00
	for mtd@infradead.org; Wed, 06 Dec 2000 04:33:18 +0000
Date: Wed, 6 Dec 2000 14:33:05 +1000
Message-Id: <200012060433.OAA20620@singularity.tronunltd.com>
To: "Nicolas Pitre" <nico@cam.org>
Subject: Re: Problems with r/w on mtdblock0
From: "Ian" <Relativity@HumanHeuristic.com>
Cc: mtd@infradead.org
Reply-To: "Ian" <Relativity@HumanHeuristic.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



Check this out ...

  bash# dd if=/dev/mtdblock0 of=crap count=1 bs=16384
  end_request: I/O error, dev 1f:00 (mtdblock), sector 0
  end_request: I/O error, dev 1f:00 (mtdblock), sector 8
  end_request: I/O error, dev 1f:00 (mtdblock), sector 16
  end_request: I/O error, dev 1f:00 (mtdblock), sector 24
  dd: /dev/mtdblock0: Input/output error
  0+0 records in
  0+0 records out
  bash#



.. thoughts?


  ----- Original Message -----
>From: "Nicolas Pitre" <nico@cam.org>
>To: "Ian" <Relativity@HumanHeuristic.com>
>Subject:  Re: Problems with r/w on mtdblock0
>Date: Tue, 05 Dec 2000 21:52:37 -0500
>
> 
> 
> On Wed, 6 Dec 2000, Ian wrote:
> 
> >
> > Well, that's how this started;
> >
> >
> >  >    bash# dd if=/dev/zero of=/dev/mtdblock0 bs=512 count=1
> >  >    end_request: I/O error, dev 1f:00 (mtdblock), sector 0
> >  >    dd: /dev/mtdblock0: Input/output error
> >  >    1+0 records in
> >  >    0+0 records out
> >  >
> >  >    bash# /bin/dd if=/dev/mtdblock0 of=/dev/null bs=512 count=1
> >  >    end_request: I/O error, dev 1f:00 (mtdblock), sector 0
> >  >    /bin/dd: /dev/mtdblock0: Input/output error
> >  >    0+0 records in
> >  >    0+0 records out
> 
> The above should be considered as a mtdblock bug IMHO.
> 
> > .. and Ollie said ...
> >
> >  >        The /dev/mtdblockN device the the "block device" node for MTD devices.
> >  >  In the DoC case, it can only read/write data in 8KB block (the erase size).
> >  >  You can not read/write 512B on itm it will get "cached" by the driver. If
> 
> It shouldn't matter.  The driver will actually write 8k if that's the erase
> size regardless of the size of your access.
> 
> >  >  you are playing with the IPL stuff, WRITE TO /dev/mtd0.
> 
> Hmmm....  What's IPL?
> 
> > ... which then started a series of questions about whether or not its being cached
> > and I'm just rebooting too soon, if that's possible.
> 
> No it's not, unless you actually reboot before dd return to the shell
> prompt.
> 
> > *BUT* .. as above .. I'm getting
> > errors to that device (that I didn't used to).
> 
> ... and that you shouldn't.
> 
> I just don't have any hardware with DiskOnChip or NAND flash to test and fix
> the problem... therefore I'm not aware of the difference with NOR flash as
> far as the block interface is concerned.
> 
> Any hints someone?
> 
> 
> 
> Nicolas
> 
> 

--
http://HumanHeuristic.com/
"Bringing people together in a world full of computers"



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
