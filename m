Received: from smtp-out.hamburg.pop.de ([195.222.210.86])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17jwvF-0000NP-00
	for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2002 08:07:26 +0100
Received: from mail.hamburg.pop.de ([193.98.9.7] helo=mail.provi.de)
	by smtp-out.hamburg.pop.de with esmtp (Exim 3.22 #1)
	id 17jwp1-0005uF-00
	for linux-mtd@lists.infradead.org; Wed, 28 Aug 2002 09:00:59 +0200
Received: from mail.jena.pop.de ([195.222.197.3])
	by mail.provi.de with esmtp (Exim 3.20 #2)
	id 17jwr6-0000vw-00
	for linux-mtd@lists.infradead.org; Wed, 28 Aug 2002 09:03:08 +0200
Received: from goepel2.jena.provi.de (goepel2.jena.provi.de [195.222.197.91])
	by mail.jena.pop.de (8.9.3/8.9.3) with ESMTP id JAA09902
	for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2002 09:07:19 +0200
Received: from goepel.com (goepel109.goepel [172.16.1.109])
	by goepel2.jena.provi.de (8.10.0/8.10.0) with ESMTP id g7S77H224914
	for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2002 09:07:17 +0200
Message-ID: <3D6C76B0.2080001@goepel.com>
Date: Wed, 28 Aug 2002 09:07:28 +0200
From: Michael Palme <m.palme@goepel.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: flash file system for production use
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


[forget CC to the list...]

> hello...
>
> there are 7 mtd partitions on the 32Mb NOR flash right now. (256k
> bootloader, 256k kernel parameters, 1M kernel1, 4M ramdisk1, 1M kernel2,
> 4M ramdisk2 and the rest (21.5M) goes to 1 jffs2 data partition. i want
> no flash- rootfs because of performance issues -- i think a ramdisk is
> always the fastest.
>
> the reason behind the _very_big_ jffs2 partition is that i want to
> assure that the flash will never(?) fail because of weak blocks sometimes.
>
> but thats also my fear -- i think the bigger the jffs partition the
> slower it gets after some time of use because of the effort of the wear
> leveling??? is this right???

I think it gets slower due to fragmentation. A JFFSx file system must scan at 
start up. A big fagmented partition will scan slower. I don't know enough 
about JFFSx, my main knowledge is about YAFFS which works on NAND.

>
> so what i want to know is: is a smaller jffs2 partiton better from the
> performance view??? i will have no complex tree structure on the
> partition, only 2 directorys with some small files...
>
> cheers Michael Palme
>
> Charles Manning schrieb:
> >Have you considered partitioning?
> >
> >One partition for config files etc (stuff you need ASAP on boot).
> >Another for verbose guff that you can mount at leasure.
> >
> >-- Charles
> >
> >On Wed, 28 Aug 2002 07:03, you wrote:
> >>hello...
> >>
> >>i've got a strongarm system with 32mb intel strata flash. i need a
> >>mechanism for storing configuration files etc in the flashes. for this
> >>purpose 20mb of the flashes are free. the performance/ stability thing
> >>is very important for me. i cant wait 10 secs fot mounting/ checking
> >>etc. i' ve tried jffs2 from CVS and it seems to be "fast" on a nearly
> >>empty flash partition, but i have no suggestion about what happens in
> >>hard production use, when the flash will be written  over and over again
> >>and the wear leveling takes place. the device is never shutdown'ed in a
> >>clean way -- always hard power off...
> >>
> >>because i have 20megs free and only small information to store i think
> >>there is no need for a complex wear leveling mechanism but im not an
> >>expert.
> >>
> >>what the best solution fot my problems???
> >>
> >>please give some hints....
> >>
> >>
> >>thanks in advance ... Michael Palme
