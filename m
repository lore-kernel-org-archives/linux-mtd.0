Received: from xproxy.gmail.com ([66.249.82.199])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eua1n-00052h-Hi
	for linux-mtd@lists.infradead.org; Thu, 05 Jan 2006 13:40:04 -0500
Received: by xproxy.gmail.com with SMTP id s12so2060498wxc
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Jan 2006 10:39:55 -0800 (PST)
Message-ID: <b2a468ae0601051039r2cd0b823r@mail.gmail.com>
Date: Thu, 5 Jan 2006 19:39:55 +0100
From: <priewasser@googlemail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: Question: jffs2_mark_node_obsolete() with NAND
Reply-To: priewasser@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

as far as i understand, jffs2_mark_node_obsolete() gets the
raw_node_ref of the flash node to delete, flash_reads the appropriate
common header in a struct jffs2_unknown_node, sets the node type to
~JFFS2_NODE_ACCURATE and writes the common header into the flash. The
existing common header is overwritten. This works for NOR as there is
some "valid" bit that flips from 1->0 (?). But what about NAND? I do
not understand how obsoleting nodes can work in the described
overwrite-way, with a 2KiB-granularity and wbuf......

Thanks for your answer,
Bernhard
