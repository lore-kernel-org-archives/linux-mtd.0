Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14VaGZ-0004oA-00
	for mtd-list@infradead.org; Wed, 21 Feb 2001 14:29:15 +0000
Received: from smtp.alcove.fr ([212.155.209.139])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14VaGN-0004o3-00
	for mtd@infradead.org; Wed, 21 Feb 2001 14:29:14 +0000
Received: from champlain.alcove-int ([10.16.110.20])
	by smtp.alcove.fr with esmtp (Exim 3.12 #1 (Debian))
	id 14VaG6-0001qN-00
	for <mtd@infradead.org>; Wed, 21 Feb 2001 15:28:46 +0100
Received: from raceme by champlain.alcove-int with local (Exim 3.12 #1 (Debian))
	id 14VaFx-00039Y-00
	for <mtd@infradead.org>; Wed, 21 Feb 2001 15:28:37 +0100
Date: Wed, 21 Feb 2001 15:28:36 +0100
From: Christophe Boyanique <raceme@alcove.fr>
To: mtd@infradead.org
Subject: M-sys or MTD for production use ?
Message-ID: <20010221152836.A12119@fr.alcove.com>
Reply-To: Christophe.Boyanique@fr.alcove.com
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi folks,

I'm relatively new with embedded system and DiskOnChip so I'll try to
avoid asking dumb questions.

I'm working on a embedded project using an almost standard pc arch,
one DiskOnChip and rtlinux.

The driver used are old ones from M-sys (version 2.2) and we are using
plilo (0.20) supplied with the drivers and a 2.2.17 rtlinux kernel.

The first problem we encountered was the inability to send command line
parameters to the kernel (neither by lilo.conf nor lilo commande line).
After some hacking thru the kernel and lilo sources we found that lilo
use 0x90000 memory address to store parameters, and later during the
init, the kernel read the parameters from this area. But at this moment
all the data are scrambled and obviously command line arguments are gone.

I tried to port the lilo-patch 0.20 to version 0.21 of lilo by hand (the
patch is pretty small) and tried my new plilo. With that, I just get the
L of LILO and an infinite loop displaying AA.

Just for testing, I tried to compile myself plilo 0.20 (from the
official lilo 0.20 sources and the patch supplied by M-sys) and I found
that it doesn't produce the same binary ! I get to LIL with this one, but
no more kernel booting.

After that I began to search some fresh meat about the DiskOnChip ;) and
found the new M-sys drivers (4.2.1) and the MTD project.

>From now I have to choose one solution that will be used in production
and I'd like people to correct my following reflexions if I made
some mistakes:


M-sys:
------

- new drivers seem to be GPL compliant if used as module event if the
  closed linked .obj file is not really nice.
  -> use of a ramdisk is required.

- new version needs the updated firmware to work.

- the new pLilo 0.21 supplied seems to make some manipulation from
  preventing command line corruption (it uses a temporary buffer
  at 0x80000 and paste it at 0x90000 later).
  BUT I didn't find any statement to be sure that the pLilo/firmaware
  combination is now entirely safe.

- For booting from the DOC, only pLilo is usable.


MTD:
----

- I didn't find any statement about the stability of MTD and the use in
  a production environment.

- MTD supply an hardware-specific kernel driver (the DOC firmware is no
  more needed).

- For booting from the DOC, mtd-lilo or mtd-GRUB (developping stage and
  reliability ?) are usable.


Common points:
--------------

- the driver patch supplied apply to 2.2 and 2.4 kernel.


I have also silly questions:
----------------------------

- What are the differences between pLilo 0.21 and mtd-lilo ?


and some requirements:
----------------------

- we have another model using a Compaq flash card seen as an IDE drive
  by the system (so nothing special here) and we want to use the same
  distribution (same boot loader: for example we want to type lilo, and
  it will find itself that this is a DOC or a regular IDE drive, and
  choose the right loader by himself).

- we need to use the kernel command line (by typing on the bootloader
  command line or by lilo.conf (grub.conf?)).

- we need the serial console support in the bootloader.


Thanks for having reading all that and I'm looking forward reading
you ;)

Christophe.

-- 
Christophe Boyanique - Free Software Engineer

-------- Alcove : Liberating Software --------
 http://www.alcove.com - Tél: +33 149 226 795


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
