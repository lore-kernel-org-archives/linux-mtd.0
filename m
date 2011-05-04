Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QHYM9-0000au-NM
	for linux-mtd@lists.infradead.org; Wed, 04 May 2011 09:26:54 +0000
Date: Wed, 4 May 2011 11:26:50 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: angelo <angelo70@gmail.com>
Subject: Re: R: jffs2 help
In-Reply-To: <4DC11AC2.10000@gmail.com>
Message-ID: <Pine.LNX.4.64.1105041125270.15966@lnxricardw.se.axis.com>
References: <531B6536C9F737458807DF75064873C801ED5F36E7AA@mta-digimail.MTA.INT>
	<4DC11AC2.10000@gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 4 May 2011, angelo wrote:

> The free-electrons site is really a wonderful help. I couldn't find it
> out through googling "mtd jffs2" still.
>
> Anyway, still, following strictly the site help, i can eraseall, mount
> jffs2, write some files, unmount, but at the next mount nothing is still
> there. Option -o sync doesn't help also.
> Writing files, i still get errors like
>
> Node totlen on flash (0xffffffff) !=3D totlen from node (0x0000000c)
>
> I probably will move to UBIFS, but before i would like to understand why
> jffs2, that should be reliable in anyway, is failing on my flash.

I agree, if you cannot get jffs2 to work, there must be something that's=20
not configured properly.

Reliability is one thing, but short term for tests like this any problems=
=20
you encounter are not due to failing bits in the flash etc but some sort=20
of misconfiguration or bug.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
