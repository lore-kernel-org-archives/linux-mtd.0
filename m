Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IYS3b-0000fd-Nc
	for linux-mtd@lists.infradead.org; Thu, 20 Sep 2007 15:51:30 -0400
Date: Thu, 20 Sep 2007 21:51:16 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Adam Nowak <uboot@op.pl>
Subject: Re: NAND08GW3B2AN6E support
In-Reply-To: <1190311244.2922.2.camel@localhost.localdomain>
Message-ID: <Pine.LNX.4.64.0709202148160.16112@lnxricardw.se.axis.com>
References: <1190311244.2922.2.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 20 Sep 2007, Adam Nowak wrote:

> I have to add support for NAND chip on the custom board. The chip is
> NAND08GW3B2AN6E (ST Microelectronics, 8Gbit, bus:8, page:2048B).
>
> Is it already supported by any driver? If not, what is the best way to

Sounds like a fairly standard large-page flash, which should be supported=
=20
already.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
