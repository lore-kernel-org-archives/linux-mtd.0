Received: from mail.feig.de ([195.145.139.42] helo=srv-mail02.feig.de)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lph5q-0000V5-9N
	for linux-mtd@lists.infradead.org; Fri, 03 Apr 2009 10:57:57 +0000
Message-Id: <49D607C7.187F.00BC.1@feig.de>
Date: Fri, 03 Apr 2009 12:57:43 +0200
From: "Manuel Sahm" <Manuel.Sahm@feig.de>
To: <dedekind@infradead.org>
Subject: Re: Re: Re: Create, Flash and Mount UBIFS Images
References: <49D4BF5A.187F.00BC.1@feig.de>
	<1238674916.20906.93.camel@localhost.localdomain>
	<49D5D7AE.187F.00BC.1@feig.de>
	<1238747429.20906.149.camel@localhost.localdomain>
In-Reply-To: <1238747429.20906.149.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
 
concerning the autoresize flag:
 
As far as I understand:
If a partition is 40 MiB, I have to set the vol_size < Partition size,
and set the autoresize flag to use the whole Partition size of 40 MiB.
right ?
 
Is it correct that the resize depends on the value -c of the mkfs.ubifs
program ?
--> (40MiB / 129024)+1 = c     --> c=326
With c=326 the autoresize feature should make the ubifs use the whole
partitoon sizue of 40 MiB - right ?

concerning the kernel command parameter:
Is it possible to define the ubi device number trough the kernel
command line argument, like it is possible through the ubiattach program
?
Example: ubi.mtd=4 is actually attached to /dev/ubi1 and /dev/ubi1_0.
I want to have /dev/ubi4 and /dev/ubi4_0

possible ?
 

Thank you very much.
Manuel
 

>>> Artem Bityutskiy <dedekind@infradead.org> 03.04.2009 10:30 >>>
Hi,
 
On Fri, 2009-04-03 at 09:32 +0200, Manuel Sahm wrote:
> Hello, thank you for your help.
>  I got something working, but don´t know really what I´ve done:
>  
> OK, let me gibve you some more information about my sytem:
>  
> My 256MB NAND Flash is divided into 7 MTD partitions:
> mtd0: 128KiB        (First Level Bootloader)
> mtd1: 896KiB        (UBoot)
> mtd2: 4MiB           (Kernel)
> mtd3: 40MiB         (RFS) 
> mtd4: 20MiB         (Private Partition)
> mtd5: 20 MiB        (Private Partition2)
> mtd6: 32Mib         (Backup Partition)
 
Well, you have so many MTD partitions which is in general bad design.
The whole idea of UBI spreading wear evenly across the chip is just
not
used. But you probably know what you do...
 
> Now I at first I need to build an ubi image with mkfs.ubifs and with
> ubinze on my host. I tried it with this settings:
> mkfs.ubifs -d /exports/ -m 2048 -e 129024  -c 326    -o RFS.ubifs
>  
> There is my first question:
> ----------------------------------------
> What about the pramater -c ?
> In the FAQ: -c 2047: specifies maximum file-system size in logical
> eraseblocks; this means that it will be possible to use the
resulting
> file-system on volumes up to this size (less or equivalent); so in
this
> particular case, the resulting FS may be put on volumes up to about
> 251MiB (129024 multiplied by 2047); See this section for more
details.
 
Is the description not understandable? If yes, ask specific question
please. And also, try this "See this section for more details" link.
 
> So my MTD Partition is 40MiB; Logical Ersablocksize is 129024 Bytes;

> --> (40MiB / 129024)+1 = c     --> c=326
> Is this correct ?
 
Sounds right.
 
> Now I go on with ubinize:
> ubinize -p128KiB -m 2048 -s 512 -O 512 -o RFS.ubi    config.ini
> with config.ini:
> [RFS]
> mode=ubi
> image=RFS.ubifs
> vol_size=30MiB
> vol_id=0
> vol_type=dynamic
> vol_name=RFS
> vol_alignment=1
> 
> There is my second question:
> -----------------------------------------
> Did I miss something in the ini File ?
> What about the line vol_flags=autoresize - Do I need this one ?
 
I do not know if you need it or not. First of all try to understand
what
is autoresize, this is documented at the MTD web site. If you cannot
understand, ask specific questions please.
 
> There is my third question:
> -----------------------------------------
> vol_size=30MiB -> The mtd partition is 40MiB, but if I use
> vol_size=40MiB there appears an error concerning a table ?
> Which value should I use ?
 
Volume size is the amount of free space in the volume. There is
overhead, which should be taken into account. Volume of size M
needs partition of size F, and F > M. The overhead calculation
is described on the MTD web site.
 
If you want a volume to take whole partition, the easiest way to
do so is to use the "autoresize" flag for this volume, and make
the volume 30MiB in this case. Please, read docs to realize why.
 
> There is my fourth question:
> -----------------------------------------
> Now the ubi image is created -> I flashed it into the nand an put
the
> kernel paramter mtd.ubi in the kernel command line.
> After the ubi images are attached and mounted, there seems to less
> memory ?
You mean "flash memory", i guess.
 
> There should by 30MiB instead of 28 MiB ?
It is also not clear if you refer UBI volume size or amount
of free space in UBIFS. UBIFS sits _inside_ UBI volume. It is
encapsulation. It does not affect UBI volume size.
 
> What about the journal size ?
> Is my user Memory = UBIFS: file system size - UBIFS: journal size ?
 
No, not really. There are many sources of overhead, and in
general UBIFS cannot tell how much space you have. Please,
take a look at UBIFS docs:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_spaceacc 
 
> UBIFS: recovery needed
> UBIFS: recovery completed
> UBIFS: mounted UBI device 0, volume 0, name "RFS"
> UBIFS: file system size:   30191616 bytes (29484 KiB, 28 MiB, 234
> LEBs)
> UBIFS: journal size:       5548032 bytes (5418 KiB, 5 MiB, 43 LEBs)
> UBIFS: media format:       4 (latest is 4)
> UBIFS: default compressor: LZO
> UBIFS: reserved for root:  0 bytes (0 KiB)
> VFS: Mounted root (ubifs filesystem).
> 
> df -h returns
> Filesystem           1K-blocks      Used        Available   Use%   
> Mounted on
> ubi0_0                   27256         17788      9468         65%   
 
> /
 
The available part is usually not accurate.
 
-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
