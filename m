Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Al33Z-0007vg-Ld
	for linux-mtd@lists.infradead.org; Mon, 26 Jan 2004 09:29:21 +0000
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Date: Mon, 26 Jan 2004 10:28:58 +0100
Message-ID: <001001c3e3ee$d4062540$0a01a8c0@LUMENTIS02>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1075106302.19924.9.camel@imladris.demon.co.uk>
cc: linux-mtd@lists.infradead.org
cc: "'Eric W. Biederman'" <ebiederman@lnxi.com>
Subject: RE: Q: Filesystem choice..
Reply-To: joakim.tjernlund@lumentis.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Mon, 2004-01-26 at 09:34 +0100, Joakim Tjernlund wrote:
> > size = 63*1024*1024/50 = 1321205
> > size += 252*100 += 25200= 1321457
> > size += 256*1024 -1 += 262143 = 1583600
> > 
> > resv_blocks_write = 2 + 1583600/(256*1024) = 2 + 6 = 8
> > resv_blocks_gcmerge = 2+1 = 3
> > 
> > So now I need 8(2 MB) reserved blocks instead of 5?
> > I never had any trouble with 5 reserved blocks, maybe one could do a
> > resv_blocks_write = MIN(5, resv_blocks_write) iff NOR flash?
> 
> I'd be happier about reducing the 2% figure to 1% or 1.5%, maybe.

1% results in: resv_blocks_write = 2 + 3.7 = 5.
Much better.

  Jocke
