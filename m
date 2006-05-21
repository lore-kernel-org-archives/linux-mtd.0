Received: from www346.sakura.ne.jp ([202.181.99.66])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FhlyJ-0007Tu-PE
	for linux-mtd@lists.infradead.org; Sun, 21 May 2006 07:19:50 -0400
Message-ID: <44704CA9.8010604@ak.jp.nec.com>
Date: Sun, 21 May 2006 20:19:05 +0900
From: KaiGai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <1148150486.3875.251.camel@pmac.infradead.org>
In-Reply-To: <1148150486.3875.251.camel@pmac.infradead.org>
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2/xattr problems.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, David.

David Woodhouse wrote:
> I created a user xattr on JFFS2, then attempted to remove it. On NAND
> flash I get the following BUG():
> 
> jffs2_flash_writev(): Non-contiguous write to 004ca000
> wbuf was previously 004ca000-004ca040
> ------------[ cut here ]------------
> kernel BUG at /root/jffs2/wbuf.c:672!
> 
> Call Trace:
>  [<c8222aad>] jffs2_flash_writev+0x616/0x6ac [jffs2]
>  [<c823eadb>] nand_read_ecc+0x29/0x2f [nand]     [<c823eadb>] nand_read_ecc+0x29/0x2f [nand]
>  [<c8221a6a>] jffs2_flash_read+0x8a/0x22b [jffs2]     [<c8222b8b>] jffs2_flash_write+0x48/0x51 [jffs2]
>  [<c822364d>] delete_xattr_datum_node+0xcc/0x144 [jffs2]     [<c8223dea>] delete_xattr_datum+0x2c/0x3c [jffs2]
>  [<c8223ed2>] delete_xattr_ref+0x32/0x3b [jffs2]     [<c8224e37>] do_jffs2_setxattr+0x1a9/0x5aa [jffs2]
>  [<c01c1462>] _atomic_dec_and_lock+0x22/0x2c     [<c82254fc>] jffs2_user_setxattr+0x3c/0x47 [jffs2]
>  [<c016e9e8>] generic_removexattr+0x37/0x3d     [<c016ef78>] vfs_removexattr+0x78/0xc8
> 
> What is delete_xattr_datum_node() trying to do? It seems to be writing
> for a second time to an area of flash which has _already_ been written.
> You can't do that.

delete_xattr_datum_node() try to write invalid data to ensure the target
node was already deleted. I was worried about that a xdatum already removed
may be reused as a effective xdatum on next mounting.
But it's purely design problem that should be changed.

Alternatively, I plan to write a delete marker on new node allocated by
jffs2_reserve_space() when xdatum is removed.
I intend to be dealt with a xdatum with 0xffffffff of version number
as a delete marker for xdatum. This node will be ignored on next mounting.

There is a same issue on deletion of xattr_ref, I also plan to implement
with same method.

Some days will be necessary to change it.
Would you wait for a while?

> Also, just 'cp -av /lib/libc.so.6 /mnt/jffs2' is failing to set the
> POSIX ACL, with -EINVAL. This happens because posix_acl_equiv_mode()
> returns zero, because the ACL is entirely equivalent to normal modes. So
> the 'value' passed to do_jffs2_setxattr() is NULL, which should _delete_
> the corresponding xattr.
> 
> But because the xattr is not found, the code returns -EINVAL. Shouldn't
> that error be -ENOATTR? And shouldn't the ACL code then convert it to a
> more appropriate return value?

I agree, I'll fix it.

Thanks,
-- 
KaiGai Kohei <kaigai@kaigai.gr.jp>
