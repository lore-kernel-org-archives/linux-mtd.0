Received: from ns.sysgo.de ([213.68.67.98] helo=mailgate.sysgo.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BhOS1-0006Vb-JD
	for linux-mtd@lists.infradead.org; Mon, 05 Jul 2004 04:03:53 -0400
Date: Mon, 5 Jul 2004 10:03:38 +0200 (CEST)
From: Marius Groeger <mgroeger@sysgo.com>
Sender: mag@sysgo.com
To: Wolfgang Denk <wd@denx.de>
In-Reply-To: <20040702160247.55F4BC109F@atlas.denx.de>
Message-ID: <Pine.LNX.4.56.0407051001290.1879@mag.sysgo.com>
References: <20040702160247.55F4BC109F@atlas.denx.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
Subject: Re: adding cmd-line partitioning to rpxlite.c 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2 Jul 2004, Wolfgang Denk wrote:

> In message <Pine.LNX.4.56.0407021650140.8560@mag.sysgo.com> you wrote:
> >
> > > >>          lubbock_maps[flashboot^1].name = "Lubbock Application Flash";
> > > >>          lubbock_maps[flashboot].name = "Lubbock Boot ROM";
> ...
> > spaced into it (YMMV). Still, I also like reusing things, and maybe it
> > would be a good thing to add code that replaces the embedded spaces
> > with underscores?
>
> Better use shorter names. Wast^H^H^H^H Using  41  characters  of  the
> kernel command line for the MTD id's alone is IMHO not a good idea.

Probably. Still, the current implementation is misleading and should
be resolved. Things were easier if command line partitioning was
default for all maps, and not something to add in later on demand.

Regards,
Marius

-- 
Marius Groeger <mgroeger@sysgo.com>           Project Manager
SYSGO AG                      Embedded and Real-Time Software
Voice: +49 6136 9948 0                  FAX: +49 6136 9948 10
www.sysgo.com | www.elinos.com | www.osek.de | www.imerva.com
