Received: from blackbird.intercode.com.au ([203.32.101.10]
	ident=[oFWANE6KpxyIAsdCb0oDUzX+53VbG1me])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Llox-0007Y1-Uy
	for <linux-mtd@lists.infradead.org>; Fri, 30 May 2003 16:29:32 +0100
Date: Sat, 31 May 2003 01:29:42 +1000 (EST)
From: James Morris <jmorris@intercode.com.au>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20030530144959.GA4736@wohnheim.fh-wedel.de>
Message-ID: <Mutt.LNX.4.44.0305310101550.30969-100000@excalibur.intercode.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
cc: "David S. Miller" <davem@redhat.com>
cc: matsunaga <matsunaga_kazuhisa@yahoo.co.jp>
cc: David Woodhouse <dwmw2@infradead.org>
cc: linux-kernel@vger.kernel.org
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH RFC] 1/2 central workspace for zlib
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 30 May 2003, Jörn Engel wrote:

> The following creates a central workspace per cpu for the zlib.  The
> original idea was to save memory for embedded, but this should also
> improve performance for smp.
> 
> Currently, each user of the zlib has to provide a workspace for the
> zlib to draw memory from.  Each workspace amounts to 400k for deflate
> or 50k for inflate.  Four users exist, as of 2.4.20:
> jffs2:	inflate & deflate, initialized once, 450k
> cramfs:	inflate,	   initialized once,  50k
> zisofs:	inflate,	   initialized once,  50k
> ppp:	inflate & deflate, per channel,      450k * n

In 2.5 (and soon 2.4), the crypto/deflate.c module makes use of zlib as
well.  This is typically used in ipsec for ipcomp.  Each ipcomp security
association has a zlib context, and access to the workspace is serialized 
by the security association's bh lock.

(Something needs to be done for this particular case in general: a box
with 1000 tunnels could use use 450MB of atomic kernel memory just for
zlib workspaces alone.  A solution I've been looking at for this is to
allow workspaces to be dynamically sized based on the compression
parameters instead of using worst-case figures.  The memory savings may be
up to 90% in this case).

> This patch creates an extra workspace of 400k per cpu, that is used for
> both inflate and deflate.  One of the central workspaces is used for
> users that don't provide their own.  Semaphore protection is done in
> zlib_(in|de)flateInit() and zlib_(in|de)flateEnd, so the user has to
> call those functions more often to release the semaphores before
> returning to userspace.

This won't work for the bh lock protected case outlined above, and will
cause contention between different users of zlib.


- James
-- 
James Morris
<jmorris@intercode.com.au>
