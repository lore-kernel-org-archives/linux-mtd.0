Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QHWJC-0007lt-QX
	for linux-mtd@lists.infradead.org; Wed, 04 May 2011 07:15:43 +0000
Date: Wed, 4 May 2011 09:15:39 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: angelo <angelo70@gmail.com>
Subject: Re: jffs2 help
In-Reply-To: <4DC02DE3.8080302@gmail.com>
Message-ID: <Pine.LNX.4.64.1105040908570.15966@lnxricardw.se.axis.com>
References: <4DC02DE3.8080302@gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
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


On Tue, 3 May 2011, angelo wrote:

> hi all,
>
> i have a specific issue that seems realted to jffs2,
> i tried to subscribe to jffs2-dev list but seems no more existing.
>
> Just a suggestion, is there some jffs2 list/support still alive from
> Axis ?

Axis pioneered the development of the original JFFS, but did not drive the=
=20
development of JFFS2, and so there is no active support from Axis for=20
either file system, and hasn't been for many years.

The right place to ask for JFFS2 help is on the linux-mtd mailing list,=20
i.e. right here.

> Is jffs2 the right way to go to store some non volatile data to a nor=20
> flash or is it better i move directly to UBIFS ?

I leave that one up to others, but basically I think the take is this:

ubifs resides on top of UBI, which works with both NOR and NAND flashes,=20
but several of the features that UBI brings (transparent bad block=20
management and bit scrubbing) are primarily intended to cover up the=20
deficiencies of NAND flash. On the other hand, the whole logical volume=20
concept which is also a feature of UBI is useful for any type of flash.

ubifs seems to mount faster, I think because it doesn't scan the whole=20
flash at mount time like JFFS2 does, although I seem to recall there's an=
=20
option to store summary info on the flash rather than built it at mount=20
time. Not to sure exactly the various permutations here though.

In more general terms, jffs2 is pretty stable, on the other hand, there's=
=20
not much maintentence going on either; the main work goes into UBI and=20
ubifs, so the that's where the real development is.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
