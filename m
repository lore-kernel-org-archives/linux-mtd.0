Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 143Uvy-0003c1-00
	for mtd-list@infradead.org; Wed, 06 Dec 2000 03:07:54 +0000
Received: from [203.46.70.199] (helo=singularity.tronunltd.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 143Uvv-0003bu-00
	for mtd@infradead.org; Wed, 06 Dec 2000 03:07:52 +0000
Date: Wed, 6 Dec 2000 13:07:36 +1000
Message-Id: <200012060307.NAA20262@singularity.tronunltd.com>
To: "Nicolas Pitre" <nico@cam.org>
Subject: Re: Problems with r/w on mtdblock0
From: "Ian" <Relativity@HumanHeuristic.com>
Cc: mtd@infradead.org, linuxbios@lanl.gov
Reply-To: "Ian" <Relativity@HumanHeuristic.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


> The above should be considered as a mtdblock bug IMHO.
As long as its not my own doofusness ... but I can't see how ...


> It shouldn't matter.  The driver will actually write 8k if that's the erase
> size regardless of the size of your access.
Yeah ... that's what I reckon too ... but Ollie's part of (if not all of) the DoC
writing team ... so I try not to doubt it (the software's) ability :)
 
> >  >  you are playing with the IPL stuff, WRITE TO /dev/mtd0.
> Hmmm....  What's IPL?
Initial program loader ... there's a bunch of us @ linuxBIOS taking these things
and sticking them into the Motherboard's BIOS socket, then booting linux off of
it.  Unfortunately, I'm the only guy *not* doing that at night .. because mines 
broken :-(   


> No it's not, unless you actually reboot before dd return to the shell
> prompt.
Yeah .. that's what I would've thought .. (after yesterday's thread).

 
> ... and that you shouldn't.
> 
> I just don't have any hardware with DiskOnChip or NAND flash to test and fix
> the problem... therefore I'm not aware of the difference with NOR flash as
> far as the block interface is concerned.
> 
> Any hints someone?
If you want me to try things and send you results, I'm cool with that.  I'd *rather* be 
writing to the block device (at least you should be able to "sync" it).

 

--
http://HumanHeuristic.com/
"Bringing people together in a world full of computers"



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
