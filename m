Received: from host61-50.pool80105.interbusiness.it ([80.105.50.61]
	helo=linuxbw2.bwlocal.it)
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FTOCs-0006Lm-To
	for linux-mtd@lists.infradead.org; Tue, 11 Apr 2006 15:07:31 -0400
Received: from igortr (igortr.bwlocal.it [192.168.0.14])
	by linuxbw2.bwlocal.it (8.12.1/8.12.1) with ESMTP id k3BJ7ALH010433
	for <linux-mtd@lists.infradead.org>; Tue, 11 Apr 2006 21:07:10 +0200
From: igor.trevisan@bluewind.it
To: linux-mtd@lists.infradead.org
Date: Tue, 11 Apr 2006 21:10:26 +0200
MIME-Version: 1.0
Message-ID: <443C1B42.8415.2E1D42D@localhost>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: handling a flash split in two parts
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all!

I've a very particular problem:

I've a board that,for reasons that are too long to be explained,
has a 4MB flash chip that is not mapped in a contiguos way.
Physically the microcontroller can see:

2Mbytes of flash -- 2MB of "jump" -- other  2MBytes of flash

I modified the mmu map in the file

arch/arm/mach-mx1ads/mm.c

(I've a custom board with Freescale iMX1)

and this should make things work but it's not so.
With the emulator I can see the memory as if it was
contiguous, but when mounting my Root File System
flash partition, the system look at the wronk address.
It seems that it looks at the physical addresses instead of the virtual 
one fixed with the MMU map.
Is it possible?
If so, how can I solve this?
I tried some workarounds but with no luck!
Any suggestion is very appreciated.
If more details are needed, please tell em and forgive me if
I missed them!
Thanks a lot in advance,

Igor.
-- 
--- BlueWind 
--- Embedded Systems Design 
--- Borgo Pieve 55c interno c
--- 31033 Castelfranco V.to (TV)
--- Tel.: +39 0423 723431 Fax.: +39 0423 744738
--- mailto: igor.trevisan@bluewind.it
--- http://www.bluewind.it
------------------------------------------------------------------
