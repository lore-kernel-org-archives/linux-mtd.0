Received: from ex.2n.cz ([213.29.92.11])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FSsOM-0002RQ-6j
	for linux-mtd@lists.infradead.org; Mon, 10 Apr 2006 05:09:07 -0400
Date: Mon, 10 Apr 2006 11:09:11 +0200
From: Ladislav Michl <ladis@linux-mips.org>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Message-ID: <20060410090911.GA4987@orphique>
References: <20060322115409.GA2242@orphique> <20060322194939.GA10058@orphique>
	<20060403154933.GA18475@orphique> <44322186.3060800@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44322186.3060800@yandex.ru>
Sender: Ladislav Michl <MICHL@2n.cz>
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 BUG() on mount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 04, 2006 at 11:34:30AM +0400, Artem B. Bityutskiy wrote:
> Actually, there is a jffs2_build_filesystem() function which walks all 
> inodes with nlink == 0 and pretends to dispense with them. I believe 
> that function is the right place to fix. I ganced at it, and it appeared 
> to be thet it calls jffs2_mark_node_obsolete() for all nodes of this 
> inode. jffs2_mark_node_obsolete() is a huge and fearsom monster-function 
> which may do something wrong.

Problem appeared to be GC thread waiting for inode being read. On next run
this inode was incorrectly skipped before jffs2_do_read_inode_internal
marked it obsolete. Bug was fixed by decrementing c->checked_ino before
jffs2_garbage_collect_pass returns (for INO_STATE_READING) so on next GC
run it is checked again.

Many thanks to David Woodhouse and Artem B. Bityuckiy for help with
debugging.

Best regards,
	ladis
