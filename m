Received: from maile.telia.com ([194.22.190.16])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19M8W4-000429-NT
	for <linux-mtd@lists.infradead.org>; Sat, 31 May 2003 16:43:32 +0100
Message-ID: <002101c3278b$7b5d37f0$020120b0@jockeXP>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "Jörn Engel" <joern@wohnheim.fh-wedel.de>,
   "David Woodhouse" <dwmw2@infradead.org>
References: <20030530144959.GA4736@wohnheim.fh-wedel.de>
Date: Sat, 31 May 2003 17:44:06 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

> Hi!
> 
> The following creates a central workspace per cpu for the zlib.  The
> original idea was to save memory for embedded, but this should also
> improve performance for smp.
> 
> Currently, each user of the zlib has to provide a workspace for the
> zlib to draw memory from.  Each workspace amounts to 400k for deflate
> or 50k for inflate.  Four users exist, as of 2.4.20:
> jffs2: inflate & deflate, initialized once, 450k
[SNIP]

450KB looks like a lot considering JFFS2 will never compress more than a PAGE at a time.
I think the actual workspace needed is much less, but none has figured out how to calculate
the  real workspace needed for a fixed buffer size, right?

 Jocke
