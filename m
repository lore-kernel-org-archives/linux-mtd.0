Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HyRNK-0004eR-VG
	for linux-mtd@lists.infradead.org; Wed, 13 Jun 2007 07:52:29 -0400
Subject: Re: [PATCH] Fix hanging close for /dev/mtd
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
In-Reply-To: <1181735301.30670.277.camel@gentoo-jocke.transmode.se>
References: <1181728411.30670.270.camel@gentoo-jocke.transmode.se>
	<1181735052.7065.57.camel@zod.rchland.ibm.com>
	<1181735301.30670.277.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Wed, 13 Jun 2007 13:50:53 +0200
Message-Id: <1181735453.30670.279.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-06-13 at 13:48 +0200, Joakim Tjernlund wrote:
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
> > 
> > josh
> 
> Wow, someone is reading my mails :)
> 
> Just did for mtdchar, the others are a bit more complex
> so I won't bother with them.
> 
>  Jocke

BTW, I don't think syncing is needed on NOR flashes at all.

 Jocke
