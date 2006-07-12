Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G0bMi-0000V4-Fg
	for linux-mtd@lists.infradead.org; Wed, 12 Jul 2006 05:52:00 -0400
Date: Wed, 12 Jul 2006 11:50:48 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ville Herva <vherva@vianova.fi>
Subject: Re: [PATCH] [MTD] block2mtd.c: Make kernel boot command line
	arguments work (try 3)
Message-ID: <20060712095048.GB14333@wohnheim.fh-wedel.de>
References: <20060707122221.GW6240@vianova.fi>
	<20060711062342.GY6240@vianova.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060711062342.GY6240@vianova.fi>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 11 July 2006 09:23:42 +0300, Ville Herva wrote:
> 
> Jörn, the #ifdef MODULE do clutter up the code, so I leave it to you as the
> maintainer to decide if they are worth it.

Good enough for now.  If the klibc discussion ever settles, the early
initialization code could get moved to userspace.

Jörn

-- 
Schrödinger's cat is <BLINK>not</BLINK> dead.
-- Illiad
