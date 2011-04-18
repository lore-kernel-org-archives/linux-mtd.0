Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QBnxU-0002nF-8Q
	for linux-mtd@lists.infradead.org; Mon, 18 Apr 2011 12:53:44 +0000
Date: Mon, 18 Apr 2011 14:53:33 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Atlant Schmidt <aschmidt@dekaresearch.com>
Subject: RE: UBI partitioning in embedded device?
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD32A6941578B@dekaexchange07.deka.local>
Message-ID: <Pine.LNX.4.64.1104181449160.30071@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1104180839510.30071@lnxricardw.se.axis.com>
	<0A40042D85E7C84DB443060EC44B3FD32A6941578B@dekaexchange07.deka.local>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 18 Apr 2011, Atlant Schmidt wrote:

> Ricard:
>
> One advantage of moving critical data (such as calibration
> data) into its own partition is that because each partition
> would absolutely positively *NOT* share its PEBs (Physical
> Erase Blocks) with any other partition, data stored in
> those partitions would then be better-insulated from
> "disturb" effects (such as "program disturb" and "read
> disturb") caused by the reading and writing of other data.
>
> Generally, the "disturb" effects only take place within Flash pages and=
=20
> from one Flash page to another.

But is it even possible to have an UBI volume less than one eraseblock in=
=20
size? Normally a UBI volume would be several eraseblocks, so there's no=20
chance of any eraseblocks being shared at any one time between different=20
UBI volumes.

I've always thought that because UBI volumes are measured in=20
number-of-LEBs, that each volume in practice gets its own PEBs, even=20
though of course UBI can move them around in the flash if it wants to.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
