Received: from mail-yb0-x229.google.com ([2607:f8b0:4002:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dQX12-0007vQ-RT
 for linux-mtd@lists.infradead.org; Thu, 29 Jun 2017 10:49:43 +0000
Received: by mail-yb0-x229.google.com with SMTP id 84so27455413ybe.0
 for <linux-mtd@lists.infradead.org>; Thu, 29 Jun 2017 03:49:19 -0700 (PDT)
MIME-Version: 1.0
From: Sergey Zakharchenko <doublef.mobile@gmail.com>
Date: Thu, 29 Jun 2017 13:48:58 +0300
Message-ID: <CADYCxoN60MDB4Vk8yWSAq8ObjDgkmaG+zUimrBG7u-=U8hxWdg@mail.gmail.com>
Subject: JFFS2 write/rename atomicity/ordering issue
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I have firmware doing various equivalents of

generate_data > .tmpfile
mv -f .tmpfile realfile

in parallel (with different filenames).

The files are typically small (<10 kB). POSIX rename atomicity is
expected (leaving a dangling hard link is not a problem). fsync is
properly called before renames. There are no holes in files. There's
plenty of free space on the FS; RAM shortage is a possibility though.

The typical JFFS2 entry sequence for such operations is:

Inode  #ino  TMP, ver 1,   isize 0 (create)
Dirent #pino DIR, ver V,   #ino  TMP, name .tmpfile (add dirent)
Inode  #ino  TMP, ver 2,   isize SIZE (write)
Dirent #pino DIR, ver V+1, #ino  TMP, name realfile (link)
Dirent #pino DIR, ver V+2, #ino  0,   name .tmpfile (unlink)

However, I've stumbled upon a filesystem corruption case and found the
following sequence in the filesystem:

Inode  #ino  TMP, ver 1,   isize 0 (create)
Dirent #pino DIR, ver V,   #ino TMP, name .tmpfile (add dirent)
Dirent #pino DIR, ver V+1, #ino TMP, name realfile (LINK, .tmpfile is
still 0 bytes)
Dirent #pino DIR, ver V+2, #ino 0, name .tmpfile (UNLINK)
.
. similar sequences on other files, writes still absent
.
Inode  #ino  TMP, ver 2,   isize SIZE (the forgotten write to .tmpfile)
Empty space (to the end of the block)

There were no other writes to the TMP inodes of the above-mentioned other files.
The net result was that those files ended up with a size of zero.
There were no signs of hardware-related data corruption.

This happened on mips Linux 3.3.8 as patched by this OpenWrt version:

https://github.com/openwrt/openwrt/tree/4ea8a1f1f62369e3c3055d2cfd09e8d0e01c9766

There have been some changes in the kernel since but I haven't found a
way how they could have helped fix the problem, if any. The only other
"interesting" component is overlayfs but I haven't found a way it
could have affected this.

I'm running tests to attempt to reproduce the issue but to no avail so
far. I've also tried analyzing the write/sync locking patterns but
they seem fine so far. Do you have any ideas?

Thanks in advance,

-- 
DoubleF
