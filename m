Subject: Re: JFFS2/xattr problems.
From: David Woodhouse <dwmw2@infradead.org>
To: KaiGai Kohei <kaigai@ak.jp.nec.com>
In-Reply-To: <449CD47E.6010002@ak.jp.nec.com>
References: <1148150486.3875.251.camel@pmac.infradead.org>
	<44704CA9.8010604@ak.jp.nec.com>	<448CCEC8.2080903@ak.jp.nec.com>
	<1150099418.11159.44.camel@shinybook.infradead.org>
	<448D3752.3090605@ak.jp.nec.com>
	<1150105995.8184.17.camel@pmac.infradead.org>
	<448EBDE2.7090408@kaigai.gr.jp>  <449CD47E.6010002@ak.jp.nec.com>
Content-Type: text/plain
Date: Mon, 26 Jun 2006 16:45:16 +0100
Message-Id: <1151336716.6394.169.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: KaiGai Kohei <kaigai@kaigai.gr.jp>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2006-06-24 at 14:58 +0900, KaiGai Kohei wrote:
> [3/5] jffs2-xattr-v6.1-03-redefine-refcnt-as-atomic_t.patch
>    In jffs2_release_xattr_datum(), it refers xd->refcnt to ensure
>    whether releasing xd is allowed or not.
>    But we can't hold xattr_sem since this function is called under
>    spin_lock(&c->erase_completion_lock). Thus we have to refer it
>    without any locking.

Surely c->alloc_sem is sufficient for this purpose? We can never change
the refcount of anything without writing to the medium, so the alloc_sem
ought to be enough.

-- 
dwmw2
