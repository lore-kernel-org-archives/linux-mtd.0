Received: from maila.telia.com ([194.22.194.231])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16e1rU-0004Yd-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 22:38:48 +0000
Message-ID: <006d01c1bb2a$0a78e440$e0d9b5d4@jocke>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: <gleixner@autronix.de>
Cc: <linux-mtd@lists.infradead.org>
References: <IGEFJKJNHJDCBKALBJLLAEKJFBAA.joakim.tjernlund@lumentis.se> <02022123225211.18560@thomas> <004501c1bb26$eb668380$e0d9b5d4@jocke> <02022123441312.18560@thomas>
Subject: Re: jffs2_scan_make_ino_cache() in scan.c very slow
Date: Thu, 21 Feb 2002 23:49:37 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

> On Thursday, 21. February 2002 23:27, Joakim Tjernlund wrote:
> > > On Thursday, 21. February 2002 23:05, Joakim Tjernlund wrote:
> > > the inode cache thing
> I tried with 8 and 16MB both ~60% used

Very slow mounts has happened to me in the past. Never found the cause.
Finally
solved it by starting with a fresh copy linux and than add JFFS2&MTD to
it again.

I have seen 1 or 2 reports on this list about very slow mounts, maybe you
should do the same?

           Jocke
