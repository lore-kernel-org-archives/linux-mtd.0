Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O1eMZ-00046m-O1
	for linux-mtd@lists.infradead.org; Tue, 13 Apr 2010 11:33:04 +0000
Received: by wyb33 with SMTP id 33so748303wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Apr 2010 04:33:01 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 13 Apr 2010 14:33:01 +0300
Message-ID: <g2ycc557aab1004130433g537f417ch401a97e5031f77ff@mail.gmail.com>
Subject: [BUG] Rewriting backing_dev_info in MTD
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Cc: linux-fsdevel@vger.kernel.org, David Howells <dhowells@redhat.com>,
	Bernd Schmidt <bernd.schmidt@analog.com>, linux-mtd@lists.infradead.org,
	Alexander Shishkin <virtuoso@slind.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've got NULL-pointer dereference in __mark_inode_dirty() on chmod()
for MTD device node. wb->bdi was NULL in this case.

During investigation I've found that MTD subsystem rewrites
file->f_mapping->backing_dev_info on openning to get mmap() work on
MMU-less systems. But in fact it rewrites
inode->i_mapping->backing_dev_info too, since inode->i_mapping ==
file->f_mapping (see __dentry_open() in fs/open.c). It breaks
writeback of inode changes.

I guess the right way to fix this is changing of __dentry_open() to
create _copy_ of i_mapping to assign to f_mapping since in common case
f_mapping != i_mapping. But I'm not sure were the copy should be
freed.

What do you think?
