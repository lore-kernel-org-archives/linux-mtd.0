Received: from miranda.se.axis.com ([193.13.178.8])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IsmVx-00022D-Do
	for linux-mtd@lists.infradead.org; Thu, 15 Nov 2007 21:44:47 +0000
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	lAFLiULH019629
	for <linux-mtd@lists.infradead.org>; Thu, 15 Nov 2007 22:44:30 +0100
Date: Thu, 15 Nov 2007 22:44:15 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: How to map nand chip ?
In-Reply-To: <473C9D46.9060007@kenati.com>
Message-ID: <Pine.LNX.4.64.0711152241450.11612@lnxricardw.se.axis.com>
References: <4739FA7A.9050403@kenati.com> <473C9D46.9060007@kenati.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 15 Nov 2007, Carlos Munoz wrote:

> When I load the nand driver module, the nand chip is detected correctly
> but it seems all the erase blocks are bad. I wonder if it's caused by
> the wrong timings when accessing the nand chip. However, the
> manufacturer and chip id are read correctly. Does anyone know what may
> be the cause for these errors ?

The timing requirements when reading chip id's are not as severe as when=20
actually accessing the memory, so if you are just below the limit, you can=
=20
get the id ok but other things fail.

Another thing that can cause this is if the ready/busy-pin is not read=20
properly by the chip driver. Again, the chip will probably respond quickly=
=20
to an id request, but when reading or writing the memory array, the access=
=20
times will be longer causing failure.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
