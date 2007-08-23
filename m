Received: from bart.se.axis.com ([193.13.178.9])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IOBMr-0003PD-8r
	for linux-mtd@lists.infradead.org; Thu, 23 Aug 2007 08:01:20 -0400
Date: Thu, 23 Aug 2007 14:00:42 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Tushar Kapse <tusharkapse@gmail.com>
Subject: Re: MTD nand driver help
In-Reply-To: <3db60e760708230439n5cde0461r8444f46664c570ba@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0708231357410.8989@lnxricardw.se.axis.com>
References: <3db60e760708160941g3d2978f8i7e07c4d85a34685e@mail.gmail.com>
	<3db60e760708222317o22392948g1f3cbf69e246eba6@mail.gmail.com>
	<Pine.LNX.4.64.0708230823000.8989@lnxricardw.se.axis.com>
	<3db60e760708222340g49294138w9ce3372ab5eb50bf@mail.gmail.com>
	<Pine.LNX.4.64.0708230841590.8989@lnxricardw.se.axis.com>
	<3db60e760708230211g27b99f93o67da774f64d7c556@mail.gmail.com>
	<46CD5B75.2060105@cetrtapot.si>
	<3db60e760708230439n5cde0461r8444f46664c570ba@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 23 Aug 2007, Tushar Kapse wrote:

> thanx for your valuable suggestion..
> Here are the steps followed to create JFFS2 and dumped into the NAND=20
> using Boot Loader utility for NAND:
> ...
> Once we have followed above steps,and when i Boot the Linux we found
> the error as follows:
> "Kernel panic - not syncing: VFS: Unable to mount root fs on
> unknown-block(31,0)"

Have you tried specifying the file system type of the root file system on=
=20
the kernel command line (i.e.  rootfstype=3Djffs2 ) ? Depending on the file=
=20
system support configured in the kernel, it may not necessarily=20
auto-detect a jffs2 file system.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
