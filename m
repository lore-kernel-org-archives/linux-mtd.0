Received: from mikonos.cyclades.com.br
	([200.230.227.67] helo=firewall.cyclades.com.br ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Scvg-0001FA-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 13:20:16 +0100
Received: from cyclades.com.br (danielb.cyclades.com.br [200.246.93.113])
	by firewall.cyclades.com.br (8.9.3/8.9.3) with ESMTP id JAA28991
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 09:37:44 -0300
Message-ID: <3D2D79FE.5C54CC78@cyclades.com.br>
Date: Thu, 11 Jul 2002 09:28:46 -0300
From: Daniel Belz <danielb@cyclades.com.br>
MIME-Version: 1.0
To: MTD <linux-mtd@lists.infradead.org>
Subject: Mounting JFFS2, Bootloader
Content-Type: text/plain; charset=us-ascii
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

Hi,

I have a proprietary board with the MPC860 processor.
For this board, I have a ROM Startup code that lives in a
256k Atmel flash chip (is my BIOS). This code initialize
the needed features, read a "boot sector" from a compact
flash (just for check some integrity) and read a linux
kernel and a ramdisk from previous defined locations.
This works fine, but I like to change this schema to
support the JFFS2 file system.
For this, I like to mantain my ROM startup code, modifying
just the process that load the kernel and ramdisk. The process
must load a bootloader (something like lilo) that allow
read a configuration file from the JFFS partition, choose a kernel to
boot from a list or boot from network.
I'm studing various codes from different bootloaders, and i think
that this isn't very complex. The most complex task is support the
JFFS2. 
To do this, i like to solve some doubts:
1 - How i do to mount the JFFS2 without before load the kernel?
2 - I need mount the JFFS2 to read files from them, or I can read files
from the partition without mount them?
3 - When I mount the partition: on startup of the BL or just when I need 
to read something?
4 - Which are the steps to mount the FS? Which functions are needed call
to do this? 
5 - Which files I need to include in the software?
6 - Someone have a sample code that explain these process?

I like to known some opinions and hints to do this!

PS.: I don't like to use the PPCBoot!!!

Tanks

-- 
------------------------------------------------- 
 Daniel Belz           danielb@cyclades.com.br
 Cyclades Brasil       R&D 
 Sao Paulo - Brazil    +55 (11) 5033-3393
---------------------------------------
