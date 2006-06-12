Received: from tyo202.gate.nec.co.jp ([202.32.8.206])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fpixe-0002QI-9l
	for linux-mtd@lists.infradead.org; Mon, 12 Jun 2006 05:44:00 -0400
Message-ID: <448D3752.3090605@ak.jp.nec.com>
Date: Mon, 12 Jun 2006 18:43:46 +0900
From: KaiGai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2/xattr problems.
References: <1148150486.3875.251.camel@pmac.infradead.org>	
	<44704CA9.8010604@ak.jp.nec.com> <448CCEC8.2080903@ak.jp.nec.com>
	<1150099418.11159.44.camel@shinybook.infradead.org>
In-Reply-To: <1150099418.11159.44.camel@shinybook.infradead.org>
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Kaigai Kohei <kaigai@ak.jp.nec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> I have an unrelated question.... what is the maximum size of an XATTR?
> Am I right in thinking that it's 64KiB? That's rather large; we won't be
> able to write it in a single node on some flash chips, where the
> eraseblock size is smaller than that. Don't we need to allow multiple
> nodes, to cover the range of an xdatum?

Indeed, the maximum size of an XATTR is limited by eraseblock size.
As it may be smaller than XATTR_SIZE_MAX (=65536), we can't handle
very large xattr in the current implementation.
It was blind spot for me.

But is it actually needed ?
For example, the length of xattr in EXT2 implementation is limited
by block size which is 4096 at most. But nobody (probably) has claimed
yet.

In my opinion, a xattr across multiple nodes isn't neccesary.
What do you think?

Thanks,
-- 
Open Source Software Promotion Center, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>
