Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16AzAi-0008OE-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Dec 2001 19:54:36 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.31.0112032043040.22767-100000@sisley.ri.silicomp.fr> 
References: <Pine.LNX.4.31.0112032043040.22767-100000@sisley.ri.silicomp.fr> 
To: Jean-Marc Saffroy <saffroy@ri.silicomp.fr>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Rational for JFFS2 deletion dirent ? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 03 Dec 2001 20:05:01 +0000
Message-ID: <31275.1007409901@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

saffroy@ri.silicomp.fr said:
>  I'm currently looking at the JFFS2 code, and I was wondering why the
> unlink operation creates a deletion dirent. Isn't it sufficient to
> mark the old dirent as obsolete ?

On NAND flash you can't do that.

> BTW, I can't find where deletion dirents are actually removed, except
> when their parent directory is removed or their erasure block is
> garbage collected, have I missed other places ?

Nope, they should only be removed when their erase block is garbage 
collected, if there's no longer any requirement for them. 

Actually, now I come to mention it I'm not convinced I actually did that bit
right - they may be removed unconditionally on GC, and to make NAND flash
work right we'll need to remove them only if they're no longer required
(because all previous dirent nodes which they obsolete are already GC'd).


--
dwmw2
