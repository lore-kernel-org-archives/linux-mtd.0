Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KvfwQ-0007H8-Bu
	for linux-mtd@lists.infradead.org; Thu, 30 Oct 2008 22:24:35 +0000
Date: Thu, 30 Oct 2008 23:24:30 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Cliff Brake <cliff.brake@gmail.com>
Subject: Re: bus access for NAND parts
In-Reply-To: <f96d234e0810301508n773734efp7a72f3da4ee50841@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0810302323100.15815@lnxricardw.se.axis.com>
References: <f96d234e0810290454p7c50e9d5t6bd0ecd65444e883@mail.gmail.com>
	<f96d234e0810301508n773734efp7a72f3da4ee50841@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
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


On Thu, 30 Oct 2008, Cliff Brake wrote:

> Correction -- above should say:  "It seems that most devices simply use a
> _GPIO_ for CE".  The chip select is set low in software, and then
> multiple bus cycles are run to execute the address and data phases of
> the NAND operation.  So what keeps another process from interrupting
> this and running a bus cycle while the GPIO for NAND CE is still low
> -- which would toggle the strobes to the NAND cs.

I don't know in general, but in several systems that have multiple buses,=
=20
the NAND flash can be the only device on a particular bus, so conflicts=20
with other devices are not an issue in those cases. Otherwise, it would be=
=20
as you say, I agree.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
