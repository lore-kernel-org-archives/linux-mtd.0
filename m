Received: from qb-out-1314.google.com ([72.14.204.174])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L1xV7-0006gF-Vm
	for linux-mtd@lists.infradead.org; Mon, 17 Nov 2008 06:22:22 +0000
Received: by qb-out-1314.google.com with SMTP id q13so2346072qbq.26
	for <linux-mtd@lists.infradead.org>;
	Sun, 16 Nov 2008 22:22:20 -0800 (PST)
Message-ID: <7719d8030811162222t1e2d2ba2m7702300d64310d81@mail.gmail.com>
Date: Mon, 17 Nov 2008 14:22:19 +0800
From: "edw edwardone" <edwrd.won@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [JFFS2] kernel BUG at fs/jffs2/readinode.c:252!
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,everyone:
I found a bug in the function jffs2_add_tn_to_tree() that may cause kernel oops.
See these lines in this function below:

static int jffs2_add_tn_to_tree(struct jffs2_sb_info *c,
                struct jffs2_readinode_info *rii,
                struct jffs2_tmp_dnode_info *tn)
{
    uint32_t fn_end = tn->fn->ofs + tn->fn->size;
    struct jffs2_tmp_dnode_info *this;

...

    /* Find the earliest node which _may_ be relevant to this one */
    this = jffs2_lookup_tn(&rii->tn_root, tn->fn->ofs);
    if (this) {
        /* If the node is coincident with another at a lower address,
           back up until the other node is found. It may be relevant */
        while (this->overlapped)
+        {
            this = tn_prev(this);
+            /* CAUTION!!! >>>>>>>>> Kernel oops may occur when
pointer 'this' got NULL value on some occasions<<<<<<<<<<<<< */
+            /* if (!this) printk("\njffs2_add_tn_to_tree:2! this ptr
is NULL!"); */
+        }

        /* First node should never be marked overlapped */
        BUG_ON(!this);
        dbg_readinode("'this' found %#04x-%#04x (%s)\n",
this->fn->ofs, this->fn->ofs + this->fn->size, this->fn ? "data" :
"hole");
    }

...
}

Please check following logs :

	read inode #314
	ino #314 nlink is 1
	ino #314
	read 336 bytes at 0x4fb2b0(0).
	Calculates CRC (0x24d7ded4) for 268 bytes, csize 2340
	dnode @004fb2b0: ver 15, offset 0x00, dsize 0xfc0, csize 0x924
	insert fragment 0x00-0xfc0, ver 15 at 004fb2b0
	root c1899c1c, offset 0
	read 336 bytes at 0x4f8cb0(0).
	Calculates CRC (0x4e2b63fc) for 268 bytes, csize 2284
	dnode @004f8cb0: ver 14, offset 0x00, dsize 0x1000, csize 0x8ec
	insert fragment 0x00-0x1000, ver 14 at 004f8cb0
	root c1899c1c, offset 0
	'this' found 0x00-0xfc0 (data)
	Ponder this ver 15, 0x0-0xfc0
	Node is overlapped by c1d9ba60 (v 15, 0x0-0xfc0)
	read 160 bytes at 0x480360(0).
	Calculates CRC (0x2274ab49) for 92 bytes, csize 2284
	dnode @00480360: ver 13, offset 0x00, dsize 0x1000, csize 0x8ec
	insert fragment 0x00-0x1000, ver 13 at 00480360
	root c1899c1c, offset 0
	'this' found 0x00-0xfc0 (data)
	Ponder this ver 15, 0x0-0xfc0
	Ponder this ver 14, 0x0-0x1000
	check node 0x00-0x1000, phys offs 0x4f8cb0
	check node at 0x4f8cb0, data length 2284, partial CRC 0x4e2b63fc,
correct CRC 0xe66cd067, data starts at 0x4f8620, start checking from
0x4f8e00 - 2016 bytes.
	JFFS2 notice: (914) check_node_data: wrong data CRC in data node at
0x004f8cb0: read 0xe66cd067, calculated 0x95c34d6c.
	CRC error, mark it obsolete.
	Bad CRC on old overlapping node. Kill it
	Node is overlapped by c1d9ba60 (v 15, 0x0-0xfc0)
	read 252 bytes at 0x2f5b04(0).
	Calculates CRC (0xc0ee02f5) for 117 bytes, csize 117
	dnode @002f5b04: ver 12, offset 0x1600, dsize 0x104, csize 0x75
	insert fragment 0x1600-0x1704, ver 12 at 002f5b04
	root c1899c1c, offset 5632
	'this' found 0x00-0xfc0 (data)
	Ponder this ver 15, 0x0-0xfc0
	Ponder this ver 13, 0x0-0x1000
	read 40 bytes at 0x2f59d8(0).
	read more 512 bytes
	Calculates CRC (0x2ceaa5f5) for 230 bytes, csize 230
	dnode @002f59d8: ver 11, offset 0x1400, dsize 0x200, csize 0xe6
	insert fragment 0x1400-0x1600, ver 11 at 002f59d8
	root c1899c1c, offset 5120
	'this' found 0x1600-0x1704 (data)
	Ponder this ver 12, 0x1600-0x104
	read 380 bytes at 0x2f5884(0).
	Calculates CRC (0xc189bb7b) for 270 bytes, csize 270
	dnode @002f5884: ver 10, offset 0x1200, dsize 0x200, csize 0x10e
	insert fragment 0x1200-0x1400, ver 10 at 002f5884
	root c1899c1c, offset 4608
	'this' found 0x1400-0x1600 (data)
	Ponder this ver 11, 0x1400-0x200
	read 232 bytes at 0x2f5718(0).
	Calculates CRC (0xd46d3f0) for 164 bytes, csize 294
	dnode @002f5718: ver 9, offset 0x1000, dsize 0x200, csize 0x126
	insert fragment 0x1000-0x1200, ver 9 at 002f5718
	root c1899c1c, offset 4096
	'this' found 0x1200-0x1400 (data)
	Ponder this ver 10, 0x1200-0x200
	read 152 bytes at 0x2f5568(0).
	Calculates CRC (0x9ebf5675) for 84 bytes, csize 361
	dnode @002f5568: ver 8, offset 0xe00, dsize 0x200, csize 0x169
	insert fragment 0xe00-0x1000, ver 8 at 002f5568
	root c1899c1c, offset 3584
	'this' found 0x1000-0x1200 (data)
	Ponder this ver 9, 0x1000-0x200
	Node is overlapped by c1d9b6a0 (v 13, 0x0-0x1000)
	read 80 bytes at 0x2f53b0(0).
	Calculates CRC (0x483cea98) for 12 bytes, csize 372
	dnode @002f53b0: ver 7, offset 0xc00, dsize 0x200, csize 0x174
	insert fragment 0xc00-0xe00, ver 7 at 002f53b0
	root c1899c1c, offset 3072
	'this' found 0x00-0xfc0 (data)
	Ponder this ver 15, 0x0-0xfc0
	check node 0x00-0xfc0, phys offs 0x4fb2b0
	check node at 0x4fb2b0, data length 2340, partial CRC 0x24d7ded4,
correct CRC 0x9258eba7, data starts at 0x4fabe8, start checking from
0x4fb400 - 2072 bytes.
	JFFS2 notice: (914) check_node_data: wrong data CRC in data node at
0x004fb2b0: read 0x9258eba7, calculated 0x223cf224.
	CRC error, mark it obsolete.
	Bad CRC on old overlapping node. Kill it
	Node is overlapped by c1d9b6a0 (v 13, 0x0-0x1000)
	read 516 bytes at 0x2f51fc(0).
	Calculates CRC (0xf545a856) for 365 bytes, csize 365
	dnode @002f51fc: ver 6, offset 0xa00, dsize 0x200, csize 0x16d
	insert fragment 0xa00-0xc00, ver 6 at 002f51fc
	root c1899c1c, offset 2560
	
	jffs2_add_tn_to_tree:2! this ptr is NULL!
	(and then an OOPS occured ...)

yours sincere edw.
