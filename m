Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fp9gs-0000fP-JJ
 for linux-mtd@lists.infradead.org; Mon, 13 Aug 2018 10:03:11 +0000
Received: by mail-it0-x241.google.com with SMTP id 139-v6so13010438itf.0
 for <linux-mtd@lists.infradead.org>; Mon, 13 Aug 2018 03:03:00 -0700 (PDT)
To: dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org
From: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [BUG] fs: jffs2: possible sleep-in-atomic-context bugs in jffs2_iget
Message-ID: <7888c227-0c6b-aa56-297f-a6ec2777a76c@gmail.com>
Date: Mon, 13 Aug 2018 18:02:54 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The kernel may sleep with holding a spinlock.

The function call paths (from bottom to top) in Linux-4.16 are:

[FUNC] schedule
fs/inode.c, 1916: schedule in __wait_on_freeing_inode
fs/inode.c, 826: __wait_on_freeing_inode in find_inode_fast
fs/inode.c, 1107: find_inode_fast in iget_locked
fs/jffs2/fs.c, 263: iget_locked in jffs2_iget
fs/jffs2/fs.c, 665: jffs2_iget in jffs2_gc_fetch_inode
fs/jffs2/wbuf.c, 505: jffs2_gc_fetch_inode in jffs2_wbuf_recover
fs/jffs2/wbuf.c, 462: spin_lock in jffs2_wbuf_recover

[FUNC] mutex_lock_nested
fs/jffs2/fs.c, 273: mutex_lock_nested in jffs2_iget
fs/jffs2/fs.c, 665: jffs2_iget in jffs2_gc_fetch_inode
fs/jffs2/wbuf.c, 505: jffs2_gc_fetch_inode in jffs2_wbuf_recover
fs/jffs2/wbuf.c, 462: spin_lock in jffs2_wbuf_recover

I do not find a good way to fix, so I only report.
Maybe the spinlock should be released before calling jffs2_iget(), and 
then be acquired again.
This is found by my static analysis tool (DSAC).


Thanks,
Jia-Ju Bai
