Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BDtwW-0005AV-I4
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2004 00:37:20 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: dkey <dk.dbox2@gmx.net>
In-Reply-To: <200404141209.42563.dk.dbox2@gmx.net>
References: <200404141209.42563.dk.dbox2@gmx.net>
Content-Type: text/plain
Message-Id: <1081985392.8150.155.camel@tubarao>
Mime-Version: 1.0
Date: 14 Apr 2004 17:29:52 -0600
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: cfi_cmdset_0002.c (AMD interleaved chips) fix
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-04-14 at 04:09, dkey wrote:
> hi,
> 
> attached a cif_cmdset_0002.c diff against the current cvs tested on AMD 
> interleaved chips and it works!
> thx @ David Vrable who provided this patch!!

Nice that it works.

FWIW, next time you diff, use "-b".  The patch was very difficult to
read because there were more lines with whitespace changes than lines
that had code changes.

Thanks.

-- 
Thayne Harbaugh
Linux Networx
