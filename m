Received: from eris.discordia.ch ([212.55.212.99])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14xZjh-00031y-00
	for <linux-mtd@lists.infradead.org>; Wed, 09 May 2001 20:35:02 +0100
Date: Wed, 9 May 2001 21:35:14 +0200
From: Peter Keel <killer@discordia.ch>
To: linux-mtd@lists.infradead.org
Subject: Re: Read Flash-Dumps
Message-ID: <20010509213514.A11057@discordia.ch>
References: <20010509192623.A10814@discordia.ch> <20010509190106.A10693@discordia.ch> <27428.989428251@redhat.com> <20010509192623.A10814@discordia.ch> <366.989431089@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <366.989431089@redhat.com>; from dwmw2@infradead.org on Wed, May 09, 2001 at 06:58:09PM +0100
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

* on the Wed, May 09, 2001 at 06:58:09PM +0100, David Woodhouse was blubbering:
> 
> killer@discordia.ch said:
> >  93 nftl 
> 
> You're running the GPL'd drivers, then. Interesting - where did this kernel 
> come from?

Compiled it. Anyway, that's not the Igel. That one's the Igel:

Block devices:                                                                  
 2 fd                                                                           
59 fl                                                                           
62 flashdisk

fdisk -l /dev/fla
Disk /dev/fla: 16 heads, 2 sectors, 999 cylinders
Units = cylinders of 32 * 512 bytes
Device     Boot    Start       End    Blocks   Id  System
/dev/fla1   *        1         999    15983    83  linux  

However:

cat /etc/fstab
# device                directory       type    options         freq pass

/dev/igf1               /               minix   defaults        1       1
/dev/igf2               /usr            minix   defaults        0       0
/dev/igf3               /usr3           minix   defaults        0       0
/dev/igf4               /usr4           minix   defaults        0       0
/proc                   /proc           proc    defaults        0       0

though mount reports:
/dev/igf1 on / type minix (rw)
/proc on /proc type proc (rw)
/dev/igf2 on /usr type ext2 (rw)
/dev/igf3 on /usr3 type ext2 (rw)

> Can you test the hypothesis that the image you have is a hard drive image? 

The ones I mentionned first aren't. They're the update-files from 
ftp.igel.de.

> Take a copy and run 'sfdisk blah.image'. What does it do?

sfdisk fla.img 
Warning: fla.img is not a block device
Disk fla.img: cannot get size
Disk fla.img: cannot get geometry

Disk fla.img: 0 cylinders, 0 heads, 0 sectors/track
Old situation:
Warning: The first partition looks like it was made
  for C/H/S=*/16/2 (instead of 0/0/0).
For this listing I'll assume that geometry.
Units = cylinders of 16384 bytes, blocks of 1024 bytes, counting from 0

   Device Boot Start     End   #cyls   #blocks   Id  System
 fla.img1   *      0+    998     999-    15983   83  Linux
 fla.img2          0       -       0         0    0  Empty
 fla.img3          0       -       0         0    0  Empty
 fla.img4          0       -       0         0    0  Empty

This one with the image of the whole flash. With the so-called 
/dev/fla1 I get nothing, but those /dev/igf's have to be there 
somewhere. It looks like /dev/fla1 contains some bootloader
00000000   EB 48 90 00  00 00 87 01  00 00 46 6C  61 73 68 20  .H........Flash 
00000010   4C 69 6E 75  78 20 42 6F  6F 74 20 56  65 72 73 69  Linux Boot Versi 
00000020   6F 6E 20 30  2E 39 39 00  43 6F 70 79  72 69 67 68  on 0.99.Copyrigh
00000030   74 20 28 43  29 20 31 39  39 36 2D 31  39 39 39 20  t (C) 1996-1999 
00000040   49 47 45 4C  20 47 6D 62  48 00 8C C8  2E 03 06 06  IGEL GmbH.......
About until 00001CF0, then follows a series of 0x00 and then
at 00004000 follows the directory-index of the small rw-partition,
and shortly thereafter (00004150) its contents. 
After that, from 00010000 on, no idea ;) Garbage. 
Judging from some Errormessage in the bootloader, 
"The boot/system partition is not of type CROMDISK !" I'd say
this is compressed.

Still interested in my little reverse-engineering Igel? ;-) 

Cheers
Peter
-- 
"Any good Unix security engineer can clean up any Unix box. But I'm not 
 sure there are people even within Microsoft who know how to clean up 
 an NT box." -- Michael Zbouray
