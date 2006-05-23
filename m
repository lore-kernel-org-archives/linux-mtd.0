From: David Woodhouse <dwmw2@infradead.org>
To: KaiGai Kohei <kaigai@ak.jp.nec.com>
In-Reply-To: <44726D13.3000905@ak.jp.nec.com>
References: <1148312215.12285.79.camel@pmac.infradead.org>
	<44726D13.3000905@ak.jp.nec.com>
Content-Type: text/plain
Date: Tue, 23 May 2006 03:26:01 +0100
Message-Id: <1148351162.10288.58.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: struct jffs2_xattr_datum/jffs2_xattr_ref/jffs2_inode_cache
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-05-23 at 11:01 +0900, KaiGai Kohei wrote:
> Now, I plan to implement that any versions of xattr_datum and
> xattr_ref are chained to physical node list and a real deletion
> of xattr_datum and xattr_ref should be called from
> jffs2_remove_node_refs_from_ino_list().

OK.

> By the way, I have a question about an usage for jffs2_reserve_space().
> 
> Is it permitted to allocate a space for multi nodes by a single
> calling of jffs2_reserve_space()?
> I tried to allocate a space for xattr_datum and xattr_ref by a single
> calling of jffs2_reserve_space(), and it seems to work without any
> troubles.

Yes, it works. But if you have space for just the xattr_datum at the end
of the eraseblock, it's better to write that in the available space and
then write the xattr_ref to the next eraseblock.

By the way, we should implement support for retrying writes in
save_xattr_datum() and save_xattr_ref(). See how jffs2_write_dnode() and
jffs2_write_dirent() do it, for example.

> If it's permitted, it's useful to reduce complexity by exclusion.
> What do you think about?

Once you implement the retry support, you don't reduce complexity, do
you?

-- 
dwmw2
