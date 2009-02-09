Received: from krynn.se.axis.com ([193.13.178.10])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LWZ3v-0000uz-Pw
	for linux-mtd@lists.infradead.org; Mon, 09 Feb 2009 16:32:50 +0000
Date: Mon, 9 Feb 2009 17:32:37 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Dzuy Nguyen <dzuy@infinity-studios.com>
Subject: Re: jffs2: Too few erase blocks (1)
In-Reply-To: <49904E48.7000805@infinity-studios.com>
Message-ID: <Pine.LNX.4.64.0902091731030.22663@lnxricardw.se.axis.com>
References: <498FC4BB.7060903@infinity-studios.com>
	<Pine.LNX.4.64.0902090947080.19761@lnxricardw.se.axis.com>
	<49904E48.7000805@infinity-studios.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 9 Feb 2009, Dzuy Nguyen wrote:

> Thanks, Ricard.  I didn't realize that jffs2 is not suitable for a small
> partition.  Yes,
> 64K is all I can afford.  I suppose I can dd the file, but doesn't that
> provide no wear
> leveling feature that jffs2 does?

No. But with one eraseblock you can't get much wear levelling anyway.

It might not be too difficult to write an application that appends=20
new data to existing data to the partition, erasing the whole block when=20
it fills up and write the latest. Then you need something that will search=
=20
for the latest version of the file. Something that jffs2 does, but on a=20
smaller scale, acceptable for your application.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
