Received: from krynn.se.axis.com ([193.13.178.10])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LXXhg-0007IC-Jl
	for linux-mtd@lists.infradead.org; Thu, 12 Feb 2009 09:17:55 +0000
Date: Thu, 12 Feb 2009 10:17:14 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: Re: [patch 4/9] jffs2: force the jffs2 GC daemon to behave a bit
	better
In-Reply-To: <200902112127.n1BLR2HX031153@imap1.linux-foundation.org>
Message-ID: <Pine.LNX.4.64.0902121016250.19761@lnxricardw.se.axis.com>
References: <200902112127.n1BLR2HX031153@imap1.linux-foundation.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "dilinger@debian.org" <dilinger@debian.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dilinger@queued.net" <dilinger@queued.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 11 Feb 2009, akpm@linux-foundation.org wrote:

> I've noticed some pretty poor behavior on OLPC machines after bootup, whe=
n
> gdm/X are starting.  The GCD monopolizes the scheduler (which in turns
> means it gets to do more nand i/o), which results in processes taking muc=
h
> much longer than they should to start.

Can't really comment on how well the patch works, but we've also noticed a=
=20
similar slowdown on our systems during startup, so the idea as such is=20
welcome at any rate.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
