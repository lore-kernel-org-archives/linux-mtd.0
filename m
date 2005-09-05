Received: from cpanel1.proisp.no ([207.44.240.101])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ECGAU-0002SE-Nz
	for linux-mtd@lists.infradead.org; Mon, 05 Sep 2005 08:33:53 -0400
Message-ID: <20050905120511.bq6majze2x2sc48g@www.zylin.com>
Date: Mon, 05 Sep 2005 12:05:11 +0200
From: oyvind.harboe@zylin.com
To: =?iso-8859-1?b?SvZybg==?= Engel <joern@wohnheim.fh-wedel.de>
References: <20050901125707.GA1623@wohnheim.fh-wedel.de>
	<1125665087.32593.41.camel@localhost.localdomain>
	<20050904090043.GA9632@wohnheim.fh-wedel.de>
In-Reply-To: <20050904090043.GA9632@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset=ISO-8859-1;
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Subject: Re: PATCH: allow JFFS2 to write to really small disks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> W.r.t. eCos, I expect the WORM capability to be enabled via a CDL
>> option.
>
> I have to admit being clueless about eCos.  For Linux, the parser bits
> are still missing.  How about this patch?  The parser stuff is quite
> large, as this appears to be the first JFFS2 mount option ever.

Do you think this is useful for Linux?

I mostly foresaw it as being useful for deeply embedded systems, like eCos.

=D8yvind
