Received: from jerusalem.magic.fr ([195.154.101.82])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15C1rC-0002el-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Jun 2001 17:26:30 +0100
Received: from serveur.inventel.fr (ppp-146.net-1002.magic.fr [195.115.184.146])
	by jerusalem.magic.fr (8.9.0/8.9.0) with ESMTP id SAA10925
	for <linux-mtd@lists.infradead.org>; Mon, 18 Jun 2001 18:31:58 +0200 (CEST)
Message-ID: <3B2E2C7A.F997FDEE@inventel.fr>
Date: Mon, 18 Jun 2001 18:29:46 +0200
From: Xavier DEBREUIL <xde@inventel.fr>
MIME-Version: 1.0
To: Abraham vd Merwe <abraham@2d3d.co.za>
CC: Erik Mouw <J.A.K.Mouw@ITS.TUDelft.NL>,
        MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: CVS updates
References: <20010618131315.A2156@crystal.2d3d.co.za> <20010618142215.M12246@arthur.ubicom.tudelft.nl> <20010618143104.A3715@crystal.2d3d.co.za>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

Abraham vd Merwe a écrit :
> 
> Hi Erik!
> 
> > > I've added a standalone driver for the 28F160xx chips on LART. I've also
> > > removed the LART definitions in the sa1100 maps driver (it's wasn't used in
> > > anycase and it's obsolete now anyway). Same for the LART endian definitions
> > > in cfi_endian.h and the cfi chip driver Config file.
> >
> > Why? If I understood the MTD stuff properly it is layered with the chip
> > drivers at the lowest level, the maps driver on that, and the device
> > drivers on top of the maps driver. As far as I can see (and what my
> > plan was before you started) you only need a new chip driver for LART
> > and reuse the other parts. Because the LART is an sa1100 design we
> > should avoid special casing and just use the sa1100 maps driver.
> 
> The driver I wrote for LART is a standalone driver, so it doesn't need aby
> maps driver.
> 
> Originally I wanted to change the maps driver and just write a chip driver,
> but the sa1100 maps driver is dependant on CFI being configured. Since the
> 28F160xx chips isn't CFI compliant, it makes no sense to put the map
> definitions in there (It's only about 20 lines of code anyway: read/write
> routines and the partition definition), so I decided to just make a
> standalone driver.

Does it mean that I can not use do_map_probe("cfi", ...) with 28F160B3
chips ?

Xavier
