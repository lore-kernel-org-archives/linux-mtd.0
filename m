Received: from ns.sysgo.de ([213.68.67.98] helo=mailgate.sysgo.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BgPRP-0001iM-8u
	for linux-mtd@lists.infradead.org; Fri, 02 Jul 2004 10:55:04 -0400
Date: Fri, 2 Jul 2004 16:55:01 +0200 (CEST)
From: Marius Groeger <mgroeger@sysgo.com>
Sender: mag@sysgo.com
To: "Robert P. J. Day" <rpjday@mindspring.com>
In-Reply-To: <Pine.LNX.4.60.0407021008070.5746@localhost.localdomain>
Message-ID: <Pine.LNX.4.56.0407021650140.8560@mag.sysgo.com>
References: <Pine.LNX.4.60.0407020819380.5155@localhost.localdomain>
	<Pine.LNX.4.56.0407021600350.8455@mag.sysgo.com>
	<Pine.LNX.4.60.0407021008070.5746@localhost.localdomain>
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

Hi Robert,

First off, I took the liberty of putting linux-mtd on CC.

On Fri, 2 Jul 2004, Robert P. J. Day wrote:

> On Fri, 2 Jul 2004, Marius Groeger wrote:
>
> > On Fri, 2 Jul 2004, Robert P. J. Day wrote:
> >
> >>          lubbock_maps[flashboot^1].name = "Lubbock Application Flash";
> >>          lubbock_maps[flashboot].name = "Lubbock Boot ROM";
...
> ok, so just to confirm, this file is an example that just wouldn't
> work with command-line partitioning, since the partitioning does use
> the map_info "name" field for <mtd-id>, right?

Yep!

Actually, using the map_info name field was added by someone else
after I did the initial implementation. Originally, there was a
separate MTDID #define which made it somewhat less likely to get
spaced into it (YMMV). Still, I also like reusing things, and maybe it
would be a good thing to add code that replaces the embedded spaces
with underscores?

Regards,
Marius

-- 
Marius Groeger <mgroeger@sysgo.com>           Project Manager
SYSGO AG                      Embedded and Real-Time Software
Voice: +49 6136 9948 0                  FAX: +49 6136 9948 10
www.sysgo.com | www.elinos.com | www.osek.de | www.imerva.com
