Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HWALw-0005UJ-1O
	for linux-mtd@lists.infradead.org; Tue, 27 Mar 2007 08:01:11 -0400
Date: Tue, 27 Mar 2007 13:54:23 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: [PATCH] Speed up mount for cfi_cmdset_0001 users
Message-ID: <20070327115422.GB27290@lazybastard.org>
References: <1174995841.26465.431.camel@gentoo-jocke.transmode.se>
	<1174996173.26465.433.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1174996173.26465.433.camel@gentoo-jocke.transmode.se>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 27 March 2007 13:49:33 +0200, Joakim Tjernlund wrote:
> On Tue, 2007-03-27 at 13:44 +0200, Joakim Tjernlund wrote:
> > This will speed up mount greatly for users of point/unpoint method
> > like cfi_cmdset_0001. Please Apply.
> > 
> >  Jocke
> 
> Some feedback from the community would not hurt either...

JFFS2 mount time on OLPC: ~3300ms
LogFS mount time on OLPC: ~60ms

While your works seems useful, pardon me if I don't care too much about
JFFS2 anymore. ;)

Jörn

-- 
Joern's library part 3:
http://inst.eecs.berkeley.edu/~cs152/fa05/handouts/clark-test.pdf
