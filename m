Received: from ns.sysgo.de ([213.68.67.98] helo=mailgate.sysgo.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BgOfW-0001K3-Tf
	for linux-mtd@lists.infradead.org; Fri, 02 Jul 2004 10:05:35 -0400
Date: Fri, 2 Jul 2004 16:05:28 +0200 (CEST)
From: Marius Groeger <mgroeger@sysgo.com>
Sender: mag@sysgo.com
To: "Robert P. J. Day" <rpjday@mindspring.com>
In-Reply-To: <Pine.LNX.4.60.0407020819380.5155@localhost.localdomain>
Message-ID: <Pine.LNX.4.56.0407021600350.8455@mag.sysgo.com>
References: <Pine.LNX.4.60.0407020819380.5155@localhost.localdomain>
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

On Fri, 2 Jul 2004, Robert P. J. Day wrote:

>          lubbock_maps[flashboot^1].name = "Lubbock Application Flash";
>          lubbock_maps[flashboot].name = "Lubbock Boot ROM";
>
> these name values have embedded spaces.  how exactly does that work in
> trying to use command-line partitioning here?  or did i misread how to

Embedded spaces are not supported: the parser sits on top of the
kernel command line parser which uses spaces to tokenise the command
line. This sounds bad but keeps things simple. (Ok -- cmdlinepart.c
partitioning is an example who to undermine simplicity :-)

Regards,
Marius

-- 
Marius Groeger <mgroeger@sysgo.com>           Project Manager
SYSGO AG                      Embedded and Real-Time Software
Voice: +49 6136 9948 0                  FAX: +49 6136 9948 10
www.sysgo.com | www.elinos.com | www.osek.de | www.imerva.com
