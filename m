Received: from mail1.daniel.com ([12.19.96.6] helo=mail1.danielind.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15PVWK-0004p4-00
	for <linux-mtd@lists.infradead.org>; Wed, 25 Jul 2001 21:44:41 +0100
Message-ID: <3B5F31CC.6705F4B0@daniel.com>
Date: Wed, 25 Jul 2001 15:53:32 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@redhat.com>
CC: Vipin Malik <vipin@embeddedlinuxworks.com>,
 	olea@hispafuentes.com, linux-mtd@lists.infradead.org,
 	juan@hispafuentes.com
Subject: Re: Ask for some guidance...
References: <Pine.LNX.4.33.0107252008450.4023-100000@passion.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

>
> > What BIOS is it using? I know that General Software's Embedded BIOS
> > supports that functionality.
>
> Do you know the format used?

Nope-sorry! Though GSW may be willing to share that info (if it is that).

>
> For booting, compatibility with the existing BIOS extension is useful.

Actually, for a x86 solution, most of these BIOS int 13 extensions can detect and
load a "floppy boot sector" format from resident flash disk (I think so, unless
I've lost my mind- which is quite a possibility :)

One can then use rolo (see web site www.embeddedlinuxworks.com under "ROLO: A
developers guide") to load a bzImage kernel into ram and boot it. The kernel can
then just detect the flash as MTD and mount JFFS2 on it.

You really don't even need the BIOS if you don't need thinks like video etc. in
your system- but having a BIOS makes life a bit easy- you don't have to figure out
chipset/peripheral initializations etc.

Vipin
