From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <4193B304.1010009@yandex.ru>
References: <4193B304.1010009@yandex.ru>
Content-Type: text/plain
Message-Id: <1100262876.21273.115.camel@baythorne.infradead.org>
Mime-Version: 1.0
Date: Fri, 12 Nov 2004 12:34:36 +0000
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: spin_lock() needed ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-11-11 at 21:44 +0300, Artem B. Bityuckiy wrote:
> So, I think we should hold the c->erase_completion_lock here. I mean:
> 
> jffs2_add_physical_node_ref(c, raw);
> spin_lock(&c->erase_completion_lock); /* <--------- this */
> raw->next_in_ino = f->inocache->nodes;
> f->inocache->nodes = raw;
> spin_unlock(&c->erase_completion_lock); /* <--------- and this */
> 
> 
> Can anybody comment this please?

I think you're right -- if the first node in the per-inode list is
obsolete, then this can happen. README.Locking agrees with this
assessment. 

But I'm not sure the first node _can_ be obsolete. After all, nodes
become obsolete because we do something to make them so, and we can only
do that by writing a _new_ node... which ends up at the head of the
list.

But it certainly wants a bloody great comment to that effect, at the
very least -- I suppose we might as well just take the lock.

In fact I suspect it may be possible to get an obsolete node at the head
of the list, immediately after booting. There's no real ordering on the
list at that point. 

Well spotted.

-- 
dwmw2
