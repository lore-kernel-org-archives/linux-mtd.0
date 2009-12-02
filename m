Received: from mail-px0-f183.google.com ([209.85.216.183])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NFegW-0005ff-Kl
	for linux-mtd@lists.infradead.org; Wed, 02 Dec 2009 02:11:21 +0000
Received: by pxi13 with SMTP id 13so1435969pxi.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 01 Dec 2009 18:11:13 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 2 Dec 2009 10:11:13 +0800
Message-ID: <6b6744400912011811r4cecda08hd0a2502bc3083fc3@mail.gmail.com>
Subject: JFFS2: jffs2_symlink/jffs2_mkdir/jffs2_mknod bug?
From: Tao Huang <ulysses.huang@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On jffs2_symlink/jffs2_mkdir/jffs2_mknod, after jffs2_write_dnode,
any call jffs2_clear_inode will no call jffs2_mark_node_obsolete because
pino_nlink is not zero. This will make kernel BUG on jffs2_garbage_collect_live.

Run fsstress on NANDSIM can easy see this bug when no space, for example:
fsstress -p 2 -n 100000 -d /data -l 0 -s 100000 on 128KB NANDSIM.
