Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14QZl0-0002C4-00
	for mtd-list@infradead.org; Wed, 07 Feb 2001 18:55:58 +0000
Date: Wed, 7 Feb 2001 21:55:51 +0300
From: Ruslan Satlykov <ruslan@mik.ru>
Reply-To: Ruslan Satlykov <ruslan@mik.ru>
Message-ID: <9913.010207@mik.ru>
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org
Subject: Re[2]: M-Sys's driver and public driver
In-reply-To: <18419.981568867@redhat.com>
References: <18419.981568867@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


DW> Ouch. No clue ATM what's caused that.
OK :)

>> And, can I ask the mailing list? I had downloaded
>> the newest MTD distribution by the CVS, and - how I can add this set
>> to the fresh copy of the linux kernel? Yes, I maked the patch, and
>> what I must t do next? :)) Thank you, Ruslan

DW> Drop the contents of the kernel/ directory over the top of your kernel's 
DW> drivers/mtd directory. Likewise the include/linux/mtd directory.
David, I had copyed it to the named directories, but when a try to
make a kernel (after make menuconfig), I got the messages about
undefined variables DEBUG_LEVEL0, 1, etc... After editing file
drivers/mtd/mtdcore.c (I had replaced DEBUG_LEVEL0 with DEBUG_LEVEL_0,
etc, as declared in linux/mtd/compatmac.h, the problem has been solved...
 And, at the first compilation there was error like
  'linux/compatmac.h': No such file or directory. I had copyed this
  file from linux/mtd to linux include dir, but I'm not sure, that it
  was correct. Is it two different files with one name, placed in the
  differents include directories?

  Thank you,
  Ruslan




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
