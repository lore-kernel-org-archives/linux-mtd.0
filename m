Received: from aponcelet-101-2-1-11.abo.wanadoo.fr ([193.251.42.11] helo=rostra.safetech.fr)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15eFrr-0000yD-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Sep 2001 14:03:51 +0100
Received: from tagada.safetech.fr (norbert@tagada.safetech.fr [192.168.1.86])
	by rostra.safetech.fr (8.11.1/8.9.3) with ESMTP id f84D55f14980
	for <linux-mtd@lists.infradead.org>; Tue, 4 Sep 2001 15:05:05 +0200 (CEST)
	(envelope-from norbert@safetech.com)
Date: Tue, 4 Sep 2001 15:09:52 +0200 (CEST)
From: Norbert Leon <norbert@safetech.com>
To: linux-mtd@lists.infradead.org
Subject: Problems with Intel TE28F320 B3
Message-ID: <Pine.LNX.4.21.0109041443430.1177-100000@tagada.safetech.fr>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

I'm working on an intel te28f320 b3ba110 (complete reference) and i can't
get my system to recognize it ... 

Here is my kernel configuration :

CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3

CONFIG_MTD_SLRAM=y
CONFIG_MTD_RAM=y
CONFIG_MTD_ROM=y
CONFIG_MTD_CFI=y
CONFIG_MTD_CFI_GEOMETRY=y
CONFIG_MTD_CFI_B1=y
CONFIG_MTD_CFI_B2=y
CONFIG_MTD_CFI_B4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_CFI_I4=y
CONFIG_MTD_CFI_INTELEXT=y

CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=0x8000000
CONFIG_MTD_PHYSMAP_LEN=0x4000000
CONFIG_MTD_PHYSMAP_BUSWIDTH=2


and here are the kernel messages at the boot :

mtd: Giving out device 0 to Raw memory
Registered physmem device from 98304Kb to 131072Kb
Mapped from 0xc2808000 to 0xc4808000
physmap flash device: 4000000 at 8000000
Physically mapped flash: Found no CFI device at location zero


finally, when i type cat /proc/mtd, here is what i get :

/ # cat /proc/mtd
dev:    size   erasesize  name
mtd0: 02000000 00010000 "Raw memory"


it's all weird because the kernel seems to find the flash, however there
is this message "Found no CFI ..."
I've tried to put a jffs filesystem on /dev/mtd but it doesn't work ... i
also tried the various utilities provided along with jffs (erase,
ftl_check ...) and it didn't work as well


can some of you help me ?
did some of you already succeed in mounting a filessytem on such an intel
flash card ??

Thanks in advance
