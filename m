Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 143UJv-0003S6-00
	for mtd-list@infradead.org; Wed, 06 Dec 2000 02:28:35 +0000
Received: from [203.46.70.199] (helo=singularity.tronunltd.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 143UJt-0003S0-00
	for mtd@infradead.org; Wed, 06 Dec 2000 02:28:34 +0000
Date: Wed, 6 Dec 2000 12:28:19 +1000
Message-Id: <200012060228.MAA20125@singularity.tronunltd.com>
To: "Nicolas Pitre" <nico@cam.org>
Subject: Re: Problems with r/w on mtdblock0
From: "Ian" <Relativity@HumanHeuristic.com>
Cc: mtd@infradead.org, linuxbios@lanl.gov
Reply-To: "Ian" <Relativity@HumanHeuristic.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Well, that's how this started;


 >    bash# dd if=/dev/zero of=/dev/mtdblock0 bs=512 count=1 
 >    end_request: I/O error, dev 1f:00 (mtdblock), sector 0 
 >    dd: /dev/mtdblock0: Input/output error 
 >    1+0 records in 
 >    0+0 records out 
 > 
 >    bash# /bin/dd if=/dev/mtdblock0 of=/dev/null bs=512 count=1 
 >    end_request: I/O error, dev 1f:00 (mtdblock), sector 0 
 >    /bin/dd: /dev/mtdblock0: Input/output error 
 >    0+0 records in 
 >    0+0 records out 

.. and Ollie said ...

 >        The /dev/mtdblockN device the the "block device" node for MTD devices. 
 >  In the DoC case, it can only read/write data in 8KB block (the erase size). 
 >  You can not read/write 512B on itm it will get "cached" by the driver. If 
 >  you are playing with the IPL stuff, WRITE TO /dev/mtd0. 
 
... which then started a series of questions about whether or not its being cached
and I'm just rebooting too soon, if that's possible.  *BUT* .. as above .. I'm getting
errors to that device (that I didn't used to).

See my next message (I'm currently writing) re access level via /dev/mtd0 ...

.. but then all of this thread is irrelevant (to me) if I can get my BIOS warez onto
the chip at the right location (which it appears the doc_loadbios has done), but
I still don't get my BIOS app touched  ... so something still isn't sitting right ...
I'm doing testing at the moment ... there *shouldn't* be a driver error ... I'm
stickin' with the Wookie defence ... ;)



> However using /dev/mtdblock0 should produce the same result as if you wrote
> to a disk partition or a file.  The latest MTD block interface always erase
> the flash region it is going to write to.  Even for large erase sectors the
> code is backing the entire sector, patching the data to write into it and
> eventually rewriting the whole sector back.
> 
> So doing
> 
> 	dd if=some_file of=/dev/mtdblock0 bs=512 count=1
> 
> or even
> 
> 	cp foobar.fs /dev/mtdblock1
> 
> should just work.  If it doesn't then there is a bug.  It actually works
> just fine with NOR flash devices.
> 
> 
> Nicolas
> 
 

--
http://HumanHeuristic.com/
"Bringing people together in a world full of computers"



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
