Received: from smtp2.macqel.be ([109.135.2.61])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDJ1V-0008Et-SN
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2014 19:29:38 +0000
Received: from localhost (localhost [127.0.0.1])
 by smtp2.macqel.be (Postfix) with ESMTP id A1FB6130F27
 for <linux-mtd@lists.infradead.org>; Tue, 11 Feb 2014 20:29:12 +0100 (CET)
Received: from smtp2.macqel.be ([127.0.0.1])
 by localhost (mail.macqel.be [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CCT+1dNkSgxh for <linux-mtd@lists.infradead.org>;
 Tue, 11 Feb 2014 20:29:10 +0100 (CET)
Received: from frolo.macqel.be (frolo.macqel [10.1.40.73])
 by smtp2.macqel.be (Postfix) with ESMTP id BD2F9130F14
 for <linux-mtd@lists.infradead.org>; Tue, 11 Feb 2014 20:29:10 +0100 (CET)
Date: Tue, 11 Feb 2014 20:29:10 +0100
From: Philippe De Muyter <phdm@macq.eu>
To: linux-mtd@lists.infradead.org
Subject: which driver for mmap-able battery-backed SRAM ?
Message-ID: <20140211192910.GA23223@frolo.macqel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi mtd experts,

I try to find the right driver for a memory-mapped battery-backed SRAM chip.
I have tried two drivers : 
	"mmio-sram"	drivers/misc/sram.c
and
	"mtd-ram"	drivers/mtd/chips/map_ram.c
but none of them provides me the expected interface : being able to mmap
it in a user program, and ensure that every write access to it happens
at the moment it is executed in the user program.

Is there already a driver that has those functionalities, or which one should
I enhance ?

TIA

-- 
Philippe De Muyter +32 2 6101532 Macq SA rue de l'Aeronef 2 B-1140 Bruxelles
