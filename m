Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 143UhM-0003Y7-00
	for mtd-list@infradead.org; Wed, 06 Dec 2000 02:52:48 +0000
Received: from modemcable248.137-200-24.mtl.mc.videotron.ca ([24.200.137.248] helo=xanadu.gn.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 143UhL-0003Y1-00
	for mtd@infradead.org; Wed, 06 Dec 2000 02:52:47 +0000
Date: Tue, 5 Dec 2000 21:52:37 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Ian <Relativity@HumanHeuristic.com>
cc: <mtd@infradead.org>, <linuxbios@lanl.gov>
Subject: Re: Problems with r/w on mtdblock0
In-Reply-To: <200012060228.MAA20125@singularity.tronunltd.com>
Message-ID: <Pine.LNX.4.30.0012052137370.2601-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Wed, 6 Dec 2000, Ian wrote:

>
> Well, that's how this started;
>
>
>  >    bash# dd if=/dev/zero of=/dev/mtdblock0 bs=512 count=1
>  >    end_request: I/O error, dev 1f:00 (mtdblock), sector 0
>  >    dd: /dev/mtdblock0: Input/output error
>  >    1+0 records in
>  >    0+0 records out
>  >
>  >    bash# /bin/dd if=/dev/mtdblock0 of=/dev/null bs=512 count=1
>  >    end_request: I/O error, dev 1f:00 (mtdblock), sector 0
>  >    /bin/dd: /dev/mtdblock0: Input/output error
>  >    0+0 records in
>  >    0+0 records out

The above should be considered as a mtdblock bug IMHO.

> .. and Ollie said ...
>
>  >        The /dev/mtdblockN device the the "block device" node for MTD devices.
>  >  In the DoC case, it can only read/write data in 8KB block (the erase size).
>  >  You can not read/write 512B on itm it will get "cached" by the driver. If

It shouldn't matter.  The driver will actually write 8k if that's the erase
size regardless of the size of your access.

>  >  you are playing with the IPL stuff, WRITE TO /dev/mtd0.

Hmmm....  What's IPL?

> ... which then started a series of questions about whether or not its being cached
> and I'm just rebooting too soon, if that's possible.

No it's not, unless you actually reboot before dd return to the shell
prompt.

> *BUT* .. as above .. I'm getting
> errors to that device (that I didn't used to).

... and that you shouldn't.

I just don't have any hardware with DiskOnChip or NAND flash to test and fix
the problem... therefore I'm not aware of the difference with NOR flash as
far as the block interface is concerned.

Any hints someone?



Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
