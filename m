Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M9dgV-0005yc-RC
	for linux-mtd@lists.infradead.org; Thu, 28 May 2009 11:22:17 +0000
Received: from sesr04.transmode.se (sesr04.transmode.se [192.168.201.15])
	by gw1.transmode.se (Postfix) with ESMTP id A44F8650003
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 May 2009 13:22:01 +0200 (CEST)
Subject: Bug in erase failed?
To: linux-mtd@lists.infradead.org
Message-ID: <OF19B0B97E.84069DDC-ONC12575C4.003C9262-C12575C4.003E7135@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 28 May 2009 13:22:02 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


When an erase has failed:
 Newly-erased block contained word 0x0 at offset 0x0224df6
You end up in erase.c:490
filebad:
	mutex_lock(&c->erase_free_sem);
	spin_lock(&c->erase_completion_lock);
	/* Stick it on a list (any list) so erase_failed can take it
	   right off again.  Silly, but shouldn't happen often. */
	list_move(&jeb->list, &c->erasing_list);
      ^^^^^^^^^^^^^^^^^^^^^^^^^^^
Here is the sector moved to the erasing list.

	spin_unlock(&c->erase_completion_lock);
	mutex_unlock(&c->erase_free_sem);
	jffs2_erase_failed(c, jeb, bad_offset);
      ^^^^^^^^^^^^^^
jffs2_erase_flailed also moves a sector:
	list_move(&jeb->list, &c->bad_list);
but it is already moved so you end up moving a good sector to the bad
list. Very bad.

 Jocke
