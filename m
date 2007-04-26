Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HhAT6-0005e8-1E
	for linux-mtd@lists.infradead.org; Thu, 26 Apr 2007 16:21:34 -0400
From: "Joakim Tjernlund" <joakim.tjernlund@transmode.se>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Subject: RE: OOPS at mount
Date: Thu, 26 Apr 2007 22:21:26 +0200
Message-ID: <02ad01c78840$77514dd0$020120ac@Jocke>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1177616362.2755.441.camel@pmac.infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> On Thu, 2007-04-26 at 16:37 +0200, Joakim Tjernlund wrote:
> > Most pkg files seems OK, 
> > pkg --list /tftpboot/download/cuappl02a-r8a-070425_2.powerpc.pkg
> > is OK 
> > but pkg --list cuappl02a-r8a-070221_10.powerpc.pkg 
> > isn't, but thats an old file that could have been damaged earlier.
> 
> I strongly suspect it was deleted while you had summary support.

Since that one was built in februari I think it must have been deleted
at some point.

So, you still think this was all due to removing summary in kernel while
still mounting an image that had summary nodes in it?

> 
> > I don't get any CRC errors on the restored image
> 
> That's expected. You'll only see those if you mount with summary
> support. The summary leads the kernel to expect that those nodes are
> valid, but in fact they've been marked obsolete.

OK.
