Received: from tozal.unizar.es ([155.210.3.20] helo=relay.unizar.es)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173bg4-00053b-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 May 2002 12:56:44 +0100
Received: from eupla.unizar.es (eupla.unizar.es [155.210.224.20])
	by relay.unizar.es (8.11.1/8.11.1) with ESMTP id g43BuXp15563
	for <linux-mtd@lists.infradead.org>; Fri, 3 May 2002 13:56:34 +0200 (MET DST)
Message-Id: <200205031156.g43BuXp15563@relay.unizar.es>
To: linux-mtd@lists.infradead.org
From: victor.martin@eupla.unizar.es
Date: Fri, 3 May 2002 06:46:37 EST
Subject: (no subject)
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

Thanks Charles, i think an IDE flash disk should have the same behaviour than 
an IDE disk, but one of them i think it works like a flash card, without 
internal journalling, so it makes incompatible with IDE spec. because of 
accessing times to the disk. 

The problem is that i can install blkmtd module with a device

insmod blkmtd device=/dev/fd0 for example

I can see it in /proc as mtd0

I have a mtdblock 0 with major -minor 31, 0

but when i try to use it, i can't use mtd0 and mtdblock0 and i don't know what 
is wrong.

I have tried to use /dev filesystem but when i use it my kernel doesn't boot

¿What can i do?


---------------------------------------------
Sent using Endymion MailMan.
