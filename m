Received: from mailout07.sul.t-online.com ([194.25.134.83])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BgQVC-00021J-EO
	for linux-mtd@lists.infradead.org; Fri, 02 Jul 2004 12:03:03 -0400
To: Marius Groeger <mgroeger@sysgo.com>
From: Wolfgang Denk <wd@denx.de>
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Fri, 02 Jul 2004 16:55:01 +0200."
	<Pine.LNX.4.56.0407021650140.8560@mag.sysgo.com>
Date: Fri, 02 Jul 2004 18:02:42 +0200
Sender: wd@denx.de
Message-Id: <20040702160247.55F4BC109F@atlas.denx.de>
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

In message <Pine.LNX.4.56.0407021650140.8560@mag.sysgo.com> you wrote:
> 
> > >>          lubbock_maps[flashboot^1].name = "Lubbock Application Flash";
> > >>          lubbock_maps[flashboot].name = "Lubbock Boot ROM";
...
> spaced into it (YMMV). Still, I also like reusing things, and maybe it
> would be a good thing to add code that replaces the embedded spaces
> with underscores?

Better use shorter names. Wast^H^H^H^H Using  41  characters  of  the
kernel command line for the MTD id's alone is IMHO not a good idea.

Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-4596-87  Fax: (+49)-8142-4596-88  Email: wd@denx.de
When all else fails, read the instructions.
