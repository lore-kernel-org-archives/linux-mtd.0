Received: from [213.39.233.138] (helo=wohnheim.fh-wedel.de)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19dVUL-0002SV-FL
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jul 2003 14:41:33 +0100
Date: Fri, 18 Jul 2003 15:41:02 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Mialkowski, Andrzej" <Andrzej.Mialkowski@intel.com>
Message-ID: <20030718134102.GC27671@wohnheim.fh-wedel.de>
References: <ED688E0C6B23DC46861D0B6ED6C19C629CFEB4@swsmsx403>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ED688E0C6B23DC46861D0B6ED6C19C629CFEB4@swsmsx403>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: hardcoded maximum number of CFI chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 18 July 2003 13:24:14 +0100, Mialkowski, Andrzej wrote:
> 
> Have a problem with limit of 8 CFI chips, my board has currently 10. It
> would be nice to allow specify this in (advanced) configuration. Patch
> proposal below.

My vote is against this patch.  With sufficient chips,
genprobe_ident_chips() will overflow the stack and cause interesting
things to happen.  A better fix would be to look closely at that
function and the other two users of that macro, have them use
kmalloc() and get rid of the whole problem.

Care to have a look?

Jörn

-- 
Simplicity is prerequisite for reliability.
-- Edsger W. Dijkstra
