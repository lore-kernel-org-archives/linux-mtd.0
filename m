Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I1hIn-0003Iw-Td
	for linux-mtd@lists.infradead.org; Fri, 22 Jun 2007 07:27:49 -0400
From: "Joakim Tjernlund" <joakim.tjernlund@transmode.se>
To: "'Linux MTD mailing list'" <linux-mtd@lists.infradead.org>
Subject: jffs2_mark_node_obsolete race w.r.t erase_free_sem?
Date: Fri, 22 Jun 2007 13:27:30 +0200
Message-ID: <005601c7b4c0$52207d90$0e67a8c0@Jocke>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I belive this jffs2_mark_node_obsolete can race against
jffs2_erase_pending_blocks(run in pdflush context).

During jffs2_build_filesystem, the flag JFFS2_SB_FLAG_BUILDING is set and
the erase_free_sem is NOT taken. There is nothing I can see that
holds pdflush back from erasing blocks during this time.
Confirmation would be great.

Dunno what the fix should be. Gut feeling is to prevent pdflush
from running until after build phase as erasing blocks is
a background task that shouldn't interfere with other tasks if
it can be helpt.

I think this is the root cause to the OOPS:es I seen lately

 Jocke
