From: David Woodhouse <dwmw2@infradead.org>
To: KaiGai Kohei <kaigai@ak.jp.nec.com>
Content-Type: text/plain
Date: Sat, 20 May 2006 19:41:26 +0100
Message-Id: <1148150486.3875.251.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: JFFS2/xattr problems.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I created a user xattr on JFFS2, then attempted to remove it. On NAND
flash I get the following BUG():

jffs2_flash_writev(): Non-contiguous write to 004ca000
wbuf was previously 004ca000-004ca040
------------[ cut here ]------------
kernel BUG at /root/jffs2/wbuf.c:672!

Call Trace:
 [<c8222aad>] jffs2_flash_writev+0x616/0x6ac [jffs2]
 [<c823eadb>] nand_read_ecc+0x29/0x2f [nand]     [<c823eadb>] nand_read_ecc+0x29/0x2f [nand]
 [<c8221a6a>] jffs2_flash_read+0x8a/0x22b [jffs2]     [<c8222b8b>] jffs2_flash_write+0x48/0x51 [jffs2]
 [<c822364d>] delete_xattr_datum_node+0xcc/0x144 [jffs2]     [<c8223dea>] delete_xattr_datum+0x2c/0x3c [jffs2]
 [<c8223ed2>] delete_xattr_ref+0x32/0x3b [jffs2]     [<c8224e37>] do_jffs2_setxattr+0x1a9/0x5aa [jffs2]
 [<c01c1462>] _atomic_dec_and_lock+0x22/0x2c     [<c82254fc>] jffs2_user_setxattr+0x3c/0x47 [jffs2]
 [<c016e9e8>] generic_removexattr+0x37/0x3d     [<c016ef78>] vfs_removexattr+0x78/0xc8

What is delete_xattr_datum_node() trying to do? It seems to be writing
for a second time to an area of flash which has _already_ been written.
You can't do that.

Also, just 'cp -av /lib/libc.so.6 /mnt/jffs2' is failing to set the
POSIX ACL, with -EINVAL. This happens because posix_acl_equiv_mode()
returns zero, because the ACL is entirely equivalent to normal modes. So
the 'value' passed to do_jffs2_setxattr() is NULL, which should _delete_
the corresponding xattr.

But because the xattr is not found, the code returns -EINVAL. Shouldn't
that error be -ENOATTR? And shouldn't the ACL code then convert it to a
more appropriate return value?

-- 
dwmw2
