Received: from krynn.se.axis.com ([193.13.178.10])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9amg-0003eX-Qf
	for linux-mtd@lists.infradead.org; Wed, 05 May 2010 09:20:51 +0000
Date: Wed, 5 May 2010 11:20:42 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: Some questions on bit-flips and JFFS2
In-Reply-To: <1273049480.3702.129.camel@localhost>
Message-ID: <Pine.LNX.4.64.1005051119100.22753@lnxricardw.se.axis.com>
References: <201005031505.18604.muehlfelder@enertex.de>
	<4BDFE8D6.1050704@aimvalley.nl>
	<201005041659.26262.muehlfelder@enertex.de>
	<4BE12D86.2070605@aimvalley.nl>
	<Pine.LNX.4.64.1005051039490.22753@lnxricardw.se.axis.com>
	<1273049480.3702.129.camel@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	=?utf-8?B?VGhvcnN0ZW4gTcO8aGxmZWxkZXI=?= <muehlfelder@enertex.de>,
	=?utf-8?B?UmljYXJkIFdhbmRlcmzDtmY=?= <Ricard.Wanderlof@axis.com>,
	Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 5 May 2010, Artem Bityutskiy wrote:

> Unless you supply your device with an UPS :-)

Or rather, unless you never power down you're device. An UPS is great for=
=20
unexpected power outages, but sooner or later you might want to power down=
=20
your device under manual control anyway... :-)

> I did not really follow the discussion, so sorry if the following is=20
> unrelated: I think it should not be too difficult to teach JFFS2 to=20
> force GC on eraseblocks with bit-flips.

I think in this case the partition in question just held a raw Linux=20
kernel with no file system, so JFFS2 is out of the picture here.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
