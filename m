Received: from mail.feig.de ([195.145.139.42] helo=srv-mail02.feig.de)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LpdtJ-0003tS-57
	for linux-mtd@lists.infradead.org; Fri, 03 Apr 2009 07:32:54 +0000
Message-Id: <49D5D7AE.187F.00BC.1@feig.de>
Date: Fri, 03 Apr 2009 09:32:31 +0200
From: "Manuel Sahm" <Manuel.Sahm@feig.de>
To: <dedekind@infradead.org>
Subject: Re: Re: Create, Flash and Mount UBIFS Images
References: <49D4BF5A.187F.00BC.1@feig.de>
	<1238674916.20906.93.camel@localhost.localdomain>
In-Reply-To: <1238674916.20906.93.camel@localhost.localdomain>
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

Hello, thank you for your help.
 I got something working, but don´t know really what I´ve done:
 
OK, let me gibve you some more information about my sytem:
 
My 256MB NAND Flash is divided into 7 MTD partitions:
mtd0: 128KiB        (First Level Bootloader)
mtd1: 896KiB        (UBoot)
mtd2: 4MiB           (Kernel)
mtd3: 40MiB         (RFS) 
mtd4: 20MiB         (Private Partition)
mtd5: 20 MiB        (Private Partition2)
mtd6: 32Mib         (Backup Partition)
 
Now I at first I need to build an ubi image with mkfs.ubifs and with
ubinze on my host. I tried it with this settings:
mkfs.ubifs -d /exports/ -m 2048 -e 129024  -c 326    -o RFS.ubifs
 
There is my first question:
----------------------------------------
What about the pramater -c ?
In the FAQ: -c 2047: specifies maximum file-system size in logical
eraseblocks; this means that it will be possible to use the resulting
file-system on volumes up to this size (less or equivalent); so in this
particular case, the resulting FS may be put on volumes up to about
251MiB (129024 multiplied by 2047); See this section for more details.

So my MTD Partition is 40MiB; Logical Ersablocksize is 129024 Bytes; 
--> (40MiB / 129024)+1 = c     --> c=326
Is this correct ?

Now I go on with ubinize:
ubinize -p128KiB -m 2048 -s 512 -O 512 -o RFS.ubi    config.ini
with config.ini:
[RFS]
mode=ubi
image=RFS.ubifs
vol_size=30MiB
vol_id=0
vol_type=dynamic
vol_name=RFS
vol_alignment=1

There is my second question:
-----------------------------------------
Did I miss something in the ini File ?
What about the line vol_flags=autoresize - Do I need this one ?

There is my third question:
-----------------------------------------
vol_size=30MiB -> The mtd partition is 40MiB, but if I use
vol_size=40MiB there appears an error concerning a table ?
Which value should I use ?

There is my fourth question:
-----------------------------------------
Now the ubi image is created -> I flashed it into the nand an put the
kernel paramter mtd.ubi in the kernel command line.
After the ubi images are attached and mounted, there seems to less
memory ?
There should by 30MiB instead of 28 MiB ?
What about the journal size ?
Is my user Memory = UBIFS: file system size - UBIFS: journal size ?

UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 0, volume 0, name "RFS"
UBIFS: file system size:   30191616 bytes (29484 KiB, 28 MiB, 234
LEBs)
UBIFS: journal size:       5548032 bytes (5418 KiB, 5 MiB, 43 LEBs)
UBIFS: media format:       4 (latest is 4)
UBIFS: default compressor: LZO
UBIFS: reserved for root:  0 bytes (0 KiB)
VFS: Mounted root (ubifs filesystem).

df -h returns
Filesystem           1K-blocks      Used        Available   Use%   
Mounted on
ubi0_0                   27256         17788      9468         65%     
/




Thank you very much
Manuel

>>> Artem Bityutskiy <dedekind@infradead.org> 02.04.2009 14:21 >>>
On Thu, 2009-04-02 at 13:36 +0200, Manuel Sahm wrote:
> Hello, 
> 
> Could anybody explain me how to build an ubi.img that I could flash
> inside my system ? 
> 
> NAND Flash: Micron 256 MByte 
> Physical Eraseblock Size = 131072 
> Logical Eraseblock Size = 129024 
> Min I/O Size = 2048 
> SubPage = 512 
> 
> The Partition /dev/mtd6 is 32MByte. 
> 
> 
> I did the following steps: 
> On my host I created the file through: 
> 
> mkfs.ubifs -d /exports/ -m 2048 -e 129024 -o ubifs.img -x "none" -c
> 2047 

Are you sure -c 2047 is a sane value for a 32MiB volume? 

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
