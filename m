Received: from mx1.auerswald.de ([212.185.163.234] helo=mail.auerswald.de)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nfv3Q-0001bb-N0
	for linux-mtd@lists.infradead.org; Fri, 12 Feb 2010 12:55:33 +0000
From: "Kai-Uwe Bloem" <kai-uwe.bloem@auerswald.de>
Subject: Re-2: Why erase_pending_blocks in write_super? (was: [PATCH]
	JFFS2: Erase max 3 EB's in ...)
To: linux-mtd@lists.infradead.org
Date: Fri, 12 Feb 2010 12:55:28 +0000
Message-ID: <DIIE.00001512002444D3@mail.auerswald.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset="us-ascii"
Content-Transfer-Encoding: 7Bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Just a note here to you, I only see these delays at umount time. A rm in 
> normal
> operation doesn't block. This is because my NOR flash supports erase 
> suspend.
> If you see this during normal operation it is because your flash/driver 
> doesn't
> support erase suspend. cms_set0002 just recently got support for erase 
> suspend.

No, it uses cfi_cmdset_0001.c. That has cond_resched in cfi_udelay which should prevent this if the process priorities are set accordingly.

I suspect that a sync() operation also triggers a write_super. At least I can see that sync needs a long time after erasing a large file, although the jffs2 sync method only flushes the write buffer.


To: joakim.tjernlund@transmode.se
Cc: linux-mtd@lists.infradead.org
