Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Mrht-00051H-AF
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jun 2003 16:58:45 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20030602155353.GB679@wohnheim.fh-wedel.de>
References: <20030530144959.GA4736@wohnheim.fh-wedel.de>
	 <002901c32919$ddc37000$570486da@w0a3t0>
	 <20030602153656.GA679@wohnheim.fh-wedel.de>
	 <1054568407.20369.382.camel@passion.cambridge.redhat.com>
	 <20030602155353.GB679@wohnheim.fh-wedel.de>
Message-Id: <1054569564.20369.385.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 02 Jun 2003 16:59:25 +0100
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
cc: matsunaga <matsunaga_kazuhisa@yahoo.co.jp>
cc: linux-mtd@lists.infradead.org
cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] 1/2 central workspace for zlib
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-06-02 at 16:53, Jörn Engel wrote:
> Maybe lazy allocation.  vmalloc() it with the first write(), which
> should be never in production use.  So the extra overhead doesn't
> really matter.

Seems reasonable.

> Do you mind if I submit such a patch?

For the CVS code, which is what's in 2.5, please do. Don't bother with
2.4; I rewrote all the block translation layer crap so the individual
translation drivers doesn't have to be too involved with the horridness
of the Linux block layer.

-- 
dwmw2
