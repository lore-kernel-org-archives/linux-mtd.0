Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta03.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17kfm8-0005qM-00
	for <linux-mtd@lists.infradead.org>; Fri, 30 Aug 2002 08:01:01 +0100
Received: from sitemail.everyone.net (dsnat [216.200.145.62])
	by omta03.mta.everyone.net (Postfix) with ESMTP id 2171C48E0B
	for <linux-mtd@lists.infradead.org>; Fri, 30 Aug 2002 00:00:59 -0700 (PDT)
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Fri, 30 Aug 2002 00:00:55 -0700 (PDT)
From: Mateo Anderson <mateo@posta.star.si>
To: linux-mtd@lists.infradead.org
Subject: DOC 2000 on PC104 +
Reply-To: mateo@posta.star.si
Message-Id: <20020830070056.094013948@sitemail.everyone.net>
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

Hi all

I found a lot of helpful information on this site, but still can get my device to work.

I have a PC 104+ with ZFx86 on it and a socket for DOC.
First I made my own kernel, and all the required binaries and libraries on an IDE disk, that was connected to this device. Everything works fine from the IDE disk (the way I want it). Then I wanted to transfer everything to the DOC 2000 from M-Systems, size 48Mb.

First problem was, that I was unable to boot the kernel form the disk with the DOC in the socket. I found a patched version of LILO on m-sys site.
Then I tried the driver for DOC from m-sys, but I could not get it to work, besides all that GPL stuff I did not like.
I found this site and I successfully compiled the kernel (it is 2.4.7-10 from RH 7.2) with the MTD support. When I booted the new kernel, it found the DOC 2000. 
Run the fdisk and erased 4 partitions.
Made a new partition, and this was the first weird thing:
This is what fdisk reports:

1 head, 96160 sectors and 1 cylinder.

Device        Boot  Start   End   Blocks  Id  System
/dev/nftla1    *      1      1    48079+  83   Linux

Partition 1 has different physical/logical endings
phys=(512,0,32) logical=(0,0,96160)

I was unable to make more than 1 partition. 
What is wrong?

I was able to mkfs.ext2 on it, copied everything on it, but first I was unable to make it bootable, because LILO ended with error "Sorry, don't know how..."

The I used the lilo-mtd and it successfully written everything.
When I reboot the computer from the DOC I get:
"LI" and hangs.

Please help me.

BTW: Did I mention that I am a new comer to the Linux.

Thank you and best regards,
Mateo



_____________________________________________________________
Brezplacen E-mail - http://email.star.si
Brezplacen prostor 100 MB,lastna domena - http://www.slohosting.com

_____________________________________________________________
Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
