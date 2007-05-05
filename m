Subject: Re: JFFS2 deadlock with alloc_sem
From: David Woodhouse <dwmw2@infradead.org>
To: Roberts Nathan-mcg31137 <Nathan.Roberts@motorola.com>
In-Reply-To: <F0A7A3D5461CB54F878D218854074FCE01F7425F@de01exm63.ds.mot.com>
References: <F0A7A3D5461CB54F878D218854074FCE01F7425F@de01exm63.ds.mot.com>
Content-Type: text/plain
Date: Sat, 05 May 2007 09:23:36 +0100
Message-Id: <1178353416.11851.17.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-04-30 at 15:41 -0400, Roberts Nathan-mcg31137 wrote:
> [<c006141c>] (__lock_page+0x0/0x98) from [<c006301c>] (read_cache_page+0x21c/0x324)
>  r5 = 00000000  r4 = C0336FE0 
> [<c0062e00>] (read_cache_page+0x0/0x324) from [<c00df8f8>] (jffs2_gc_fetch_page+0x2c/0x64)
> [<c00df8cc>] (jffs2_gc_fetch_page+0x0/0x64) from [<c00dc664>] (jffs2_garbage_collect_pass+0x14a4/0x1c28)
> NOTE3: jffs2_gc_fetch_page() attempts to get page_lock

This bit confuses me.

In jffs2_commit_write() we deliberately mark the page up to date, in
order to avoid this situation -- if the page is up to date,
read_cache_page() won't attempt to lock it.

(Note that we only set it up to date manually there if we're writing the
whole page. If we're writing less than a whole page, then
jffs2_prepare_write() will have read it and marked it up to date anyway.

So it's possible that read_cache_page() will try to lock a page when
called from jffs2_gc_fetch_page() -- but it _shouldn't_ be a page which
is already locked for writing. It should be a _different_ page.

Can you add a WARN_ON(!PageUptodate(pg)) into jffs2_commit_write(), just
before the call to jffs2_write_inode_range(). And/or otherwise try to
check which page each one is locking?

-- 
dwmw2
