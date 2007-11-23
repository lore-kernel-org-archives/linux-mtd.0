Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1IvTBY-0000HO-Cs
	for linux-mtd@lists.infradead.org; Fri, 23 Nov 2007 02:42:54 -0500
Date: Fri, 23 Nov 2007 08:42:16 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: Some news for this: [PATCH] [MTD] BLOCK_RO: Readonly Block Device
	Layer Over MTD ?
In-Reply-To: <20071122132650.GA27525@lazybastard.org>
Message-ID: <Pine.LNX.4.64.0711230836240.523@lnxricardw.se.axis.com>
References: <305035a40711210627p1ea1f2c0me1ee1f8e8d124552@mail.gmail.com>
	<20071121160804.GC20871@lazybastard.org>
	<305035a40711210828k65174f44t3d64e9ee33fe26bf@mail.gmail.com>
	<20071121105817.3adbfbb5@weaponx>
	<Pine.LNX.4.64.0711212145070.24710@lnxricardw.se.axis.com>
	<20071121213257.GI20871@lazybastard.org>
	<305035a40711211433x9054a11r11636ad708a325cd@mail.gmail.com>
	<20071121225425.GA24327@lazybastard.org>
	<Pine.LNX.4.64.0711220858190.523@lnxricardw.se.axis.com>
	<20071122132650.GA27525@lazybastard.org>
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


On Thu, 22 Nov 2007, J=F6rn Engel wrote:

> Please don't reply to the list only.  If you are asking me a question,
> it is really impolite to send it elsewhere.  And I bet others would like
> to stay on Cc: as well.

Sorry, no harm intended. (I tend to view discussions on a mailing list as=
=20
being on the mailing list, not between a couple of people with a cc to the=
=20
mailing list, because other people on the list should feel they can=20
respond to the questions posed. But either way is fine with me).

> http://en.wikipedia.org/wiki/Memory_scrubbing

Thanks for the link. I've never heard of the term being used for Flash=20
memory but of course it must apply there as well.

> Trivial scrubbing could leave the block in an erased or
> partially-written state if power-loss occurs at an inconvenient time.
> So scrubbing should be performed in some higher layer like an FTL, a
> filesystem, system maintenance applications, etc.

In the case of mtd, it would seem that this should be done by JFFS2, or if=
=20
some intermediate layer is used like UBI, by that layer. As far as I know=
=20
though, currently no scrubbing is done by either?

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
