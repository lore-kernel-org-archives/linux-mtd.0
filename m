Subject: Re: JFFS2/xattr problems.
From: David Woodhouse <dwmw2@infradead.org>
To: KaiGai Kohei <kaigai@ak.jp.nec.com>
In-Reply-To: <448CCEC8.2080903@ak.jp.nec.com>
References: <1148150486.3875.251.camel@pmac.infradead.org>
	<44704CA9.8010604@ak.jp.nec.com>  <448CCEC8.2080903@ak.jp.nec.com>
Content-Type: text/plain
Date: Mon, 12 Jun 2006 09:03:37 +0100
Message-Id: <1150099418.11159.44.camel@shinybook.infradead.org>
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

On Mon, 2006-06-12 at 11:17 +0900, KaiGai Kohei wrote:
> I fixed the problem when xdatum/xref was removed, and so on.
> 
> [1/2] jffs2-xattr-v6-01-delete_marker.patch
> [2/2] jffs2-xattr-v6-02-fix_posixacl_bug.patch

Thank you. I will look at these this morning.

I have an unrelated question.... what is the maximum size of an XATTR?
Am I right in thinking that it's 64KiB? That's rather large; we won't be
able to write it in a single node on some flash chips, where the
eraseblock size is smaller than that. Don't we need to allow multiple
nodes, to cover the range of an xdatum?

-- 
dwmw2
