Received: from mailhst2.its.tudelft.nl ([130.161.34.250])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15BxzT-0002QX-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Jun 2001 13:18:47 +0100
Date: Mon, 18 Jun 2001 14:22:15 +0200
From: Erik Mouw <J.A.K.Mouw@ITS.TUDelft.NL>
To: Abraham vd Merwe <abraham@2d3d.co.za>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: CVS updates
Message-ID: <20010618142215.M12246@arthur.ubicom.tudelft.nl>
References: <20010618131315.A2156@crystal.2d3d.co.za>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20010618131315.A2156@crystal.2d3d.co.za>; from abraham@2d3d.co.za on Mon, Jun 18, 2001 at 01:13:15PM +0200
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

On Mon, Jun 18, 2001 at 01:13:15PM +0200, Abraham vd Merwe wrote:

[note that I didn't have a proper look at your patch yet]

> I've added a standalone driver for the 28F160xx chips on LART. I've also
> removed the LART definitions in the sa1100 maps driver (it's wasn't used in
> anycase and it's obsolete now anyway). Same for the LART endian definitions
> in cfi_endian.h and the cfi chip driver Config file.

Why? If I understood the MTD stuff properly it is layered with the chip
drivers at the lowest level, the maps driver on that, and the device
drivers on top of the maps driver. As far as I can see (and what my
plan was before you started) you only need a new chip driver for LART
and reuse the other parts. Because the LART is an sa1100 design we
should avoid special casing and just use the sa1100 maps driver.


Erik

-- 
J.A.K. (Erik) Mouw, Information and Communication Theory Group, Department
of Electrical Engineering, Faculty of Information Technology and Systems,
Delft University of Technology, PO BOX 5031,  2600 GA Delft, The Netherlands
Phone: +31-15-2783635  Fax: +31-15-2781843  Email: J.A.K.Mouw@its.tudelft.nl
WWW: http://www-ict.its.tudelft.nl/~erik/
