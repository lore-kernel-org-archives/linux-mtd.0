Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Al2Ia-0007cK-KB
	for linux-mtd@lists.infradead.org; Mon, 26 Jan 2004 08:40:49 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: joakim.tjernlund@lumentis.se
In-Reply-To: <000d01c3e3e7$385e71d0$0a01a8c0@LUMENTIS02>
References: <000d01c3e3e7$385e71d0$0a01a8c0@LUMENTIS02>
Content-Type: text/plain
Message-Id: <1075106302.19924.9.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Mon, 26 Jan 2004 08:38:22 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: "'Eric W. Biederman'" <ebiederman@lnxi.com>
Subject: RE: Q: Filesystem choice..
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-01-26 at 09:34 +0100, Joakim Tjernlund wrote:
> size = 63*1024*1024/50 = 1321205
> size += 252*100 = 1321457
> size += 256*1024 -1 = 1583600
> 
> resv_blocks_write = 2 + 1583600/(256*1024) = 2 + 6 = 8
> resv_blocks_gcmerge = 2+1 = 3
> 
> So now I need 8(2 MB) reserved blocks instead of 5?
> I never had any trouble with 5 reserved blocks, maybe one could do a
> resv_blocks_write = MIN(5, resv_blocks_write) iff NOR flash?

I'd be happier about reducing the 2% figure to 1% or 1.5%, maybe.

-- 
dwmw2
