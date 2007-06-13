Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HyRzj-0005T8-DJ
	for linux-mtd@lists.infradead.org; Wed, 13 Jun 2007 08:30:41 -0400
Date: Wed, 13 Jun 2007 13:54:45 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: [PATCH] Fix hanging close for /dev/mtd
Message-ID: <20070613115445.GA24502@lazybastard.org>
References: <1181728411.30670.270.camel@gentoo-jocke.transmode.se>
	<1181735052.7065.57.camel@zod.rchland.ibm.com>
	<1181735301.30670.277.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1181735301.30670.277.camel@gentoo-jocke.transmode.se>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 13 June 2007 13:48:21 +0200, Joakim Tjernlund wrote:
> On Wed, 2007-06-13 at 06:44 -0500, Josh Boyer wrote:
> > On Wed, 2007-06-13 at 11:53 +0200, Joakim Tjernlund wrote:
> > > Figured I should send this on its own.
> > > 
> > > Stracing a process using /dev/mtd shows that
> > > it sometimes hangs for a long time when pdflush is erasing
> > > sectors. /dev/mtd* close method calls the mtd->sync method
> > > which can hang for a long time(minutes).
> > > 
> > > Futher, the sync method "syncs" all flash chips. It should
> > > only sync the chips that a /dev/mtd* spans.
> > > Also, the mtdchar/mtdblock drivers does not need to
> > > call sync for readonly mappings.
> > 
> > So were you going to submit a separate patch for those issues?
> 
> Wow, someone is reading my mails :)

I read most of them.

In this case you made me wonder.  What is the mtd->sync method supposed
to accomplish anyway?  mtd->write is synchronous, mtd->erase de-facto
also is.  So it cannot be a sync in the sense of "flush all dirty data
to flash and don't return before you're finished".  Or can it?

Jörn

-- 
The strong give up and move away, while the weak give up and stay.
-- unknown
