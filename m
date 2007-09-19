Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IY6r2-0004Kq-Bf
	for linux-mtd@lists.infradead.org; Wed, 19 Sep 2007 17:13:07 -0400
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	l8JLCsFf032457
	for <linux-mtd@lists.infradead.org>; Wed, 19 Sep 2007 23:12:54 +0200
Date: Wed, 19 Sep 2007 23:12:50 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: mkfs.jffs2 and mksum
In-Reply-To: <46F1586D.7030605@tut.fi>
Message-ID: <Pine.LNX.4.64.0709192310080.28990@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0709191538050.1701@assari.cc.tut.fi>
	<1190206217.14370.155.camel@sauron> <46F12C4D.9060204@tut.fi>
	<1190211192.14370.166.camel@sauron> <46F13100.9020705@tut.fi>
	<1190213260.14370.188.camel@sauron> <46F1586D.7030605@tut.fi>
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


On Wed, 19 Sep 2007, Timo Piiroinen wrote:

> I think jffs2 writes cleanmarkers to padded space, but I'm not sure what
> happens in sumtool with padded space because the padded space is lost.
> It sounds that it's possible get in touble with padding, if writing 0xFF
> into empy space, if it may cause "unstable bits" or somethink like that.
> Well, I'm not sure if I want to use padding anymore :)

When creating an image for NAND flash, you normally don't want=20
cleanmarkers in the image, as the cleanmarkers end up in the OOB anyway=20
(which is not part of the image). Do this by specifying --no-cleanmarkers=
=20
to mkfs.jffs2.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
