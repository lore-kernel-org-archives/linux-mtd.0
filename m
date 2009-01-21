Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LPeeP-00073K-1i
	for linux-mtd@lists.infradead.org; Wed, 21 Jan 2009 15:05:55 +0000
Date: Wed, 21 Jan 2009 16:05:49 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Marco Braga <marco.braga@gmail.com>
Subject: Re: JFFS2 losing files on mount
In-Reply-To: <d459bb380901210129sb54eb47j2a67a11710f185b5@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0901211603040.12232@lnxricardw.se.axis.com>
References: <d459bb380901210129sb54eb47j2a67a11710f185b5@mail.gmail.com>
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


On Wed, 21 Jan 2009, Marco Braga wrote:

> I am doing some power failure tests on an ARM7 based device using
> JFFS2 on NAND flash and I am a bit disappointed by the early results.
> ...
> I'd like to hear your experiences. What do you think?

We use JFFS2 on both an ARM9-platform and on our own CRIS platform. We=20
never unmount the device in preparation for power down; when someone pulls=
=20
the plug, the system just dies. While we do occasionally see warning=20
messages about incomplete nodes during the next boot-up, we have never=20
experienced anything as severe as you mention, and we have not lost any=20
files on the JFFS2 filesystem either.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
