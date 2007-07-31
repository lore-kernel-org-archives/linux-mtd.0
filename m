Subject: Re: JFFS2 deadlock with alloc_sem
From: David Woodhouse <dwmw2@infradead.org>
To: Dave Kleikamp <shaggy@linux.vnet.ibm.com>
In-Reply-To: <1185813909.9523.42.camel@kleikamp.austin.ibm.com>
References: <af3ea28a0707262032h7ee22775t6ef54e364a9cd704@mail.gmail.com>
	<af3ea28a0707262038i733d0a0rf6fda8e1fc82dd74@mail.gmail.com>
	<1185543729.13873.10.camel@kleikamp.austin.ibm.com>
	<af3ea28a0707270935v3a8191acl5f2dc5780c56a3d9@mail.gmail.com>
	<1185557896.22352.4.camel@kleikamp.austin.ibm.com>
	<1185799508.3083.20.camel@pmac.infradead.org>
	<1185813909.9523.42.camel@kleikamp.austin.ibm.com>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Jul 2007 13:10:27 +0100
Message-Id: <1185883827.3083.109.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Roberts Nathan-mcg31137 <Nathan.Roberts@motorola.com>,
	linux-mtd@lists.infradead.org, ye janboe <janboe.ye@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-07-30 at 11:45 -0500, Dave Kleikamp wrote:
> Thus we conclude that the root cause of the problem is that jffs2 is not 
> conforming to the strict order of acquiring multiple locks, ie., all code 
> paths resulting in acquiring multiple locks must do so in the same order. 
> In this case, gc thread requests first the file lock, then the page lock, 
> however jffs2_readpage function requests the page lock first, then the file 
> lock. Another potential deadlock source is in jffs2_prepare_write, in which it 
> requests page lock, then the file lock. 

If that's the explanation, then the patch which Nathan tried (dropping
f->sem before jffs2_gc_fetch_page(), followed by your cleanups¹) ought
to have fixed the problem. And I'd be happier with that version rather
than introducing a new read_cache_page_async_trylock() solely for JFFS2.

It's actually OK to drop f->sem in jffs2_garbage_collect_dnode(). We
hold the alloc_sem anyway -- nobody's going to be _changing_ the file
under us. In fact, the garbage collector probably doesn't need to grab
f->sem until it's actually going to _change_ something.

-- 
dwmw2

¹ http://lists.infradead.org/pipermail/linux-mtd/2007-June/018588.html
