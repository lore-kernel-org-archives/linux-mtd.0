Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OBlru-00084Y-H5
	for linux-mtd@lists.infradead.org; Tue, 11 May 2010 09:35:15 +0000
Date: Tue, 11 May 2010 11:35:07 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: =?iso-8859-1?Q?Thorsten_M=FChlfelder?= <muehlfelder@enertex.de>
Subject: Re: Some questions on bit-flips and JFFS2
In-Reply-To: <201005110959.36213.muehlfelder@enertex.de>
Message-ID: <Pine.LNX.4.64.1005111131220.15631@lnxricardw.se.axis.com>
References: <201005031505.18604.muehlfelder@enertex.de>
	<1273049480.3702.129.camel@localhost>
	<Pine.LNX.4.64.1005051119100.22753@lnxricardw.se.axis.com>
	<201005110959.36213.muehlfelder@enertex.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Norbert van Bolhuis <nvbolhuis@aimvalley.nl>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 11 May 2010, Thorsten M=FChlfelder wrote:

>> I think in this case the partition in question just held a raw Linux
>> kernel with no file system, so JFFS2 is out of the picture here.
>>
> But unfortunately the Sam-Ba 2.5 tool has a bug: it uses different bad bl=
ock
> table structure and Linux refuses to read/write every block, that was wri=
tten
> by Sam-Ba 2.5 because it recognizes them as bad blocks.
> So for now I have no idea what I can do to reduce the failing rate.

I don't know if this is a good way, but you could patch your kernel so it=
=20
doesn't stop you from erasing/writing badblocks. Then you could write your=
=20
own application which checks for bad blocks in the same way that the=20
Sam-Ba 2.5 tool does, which would allow you to rewrite everything written=
=20
by that tool.

> At least there is still no board using Samsung flash that has failed and =
I
> hope all problems are related to the Micron flash.

Even if you are not using jffs2, mtd will still perform single-bit error=20
correction thanks the the ECC algorithm, so you need to be unlucky enough=
=20
and get two bitflips within a 256 byte region for the system to fail.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
