Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0usB-00047J-Dc
	for linux-mtd@lists.infradead.org; Thu, 22 Oct 2009 10:26:27 +0000
Received: from themisto.ext.pengutronix.de ([92.198.50.58]
	helo=jupiter.intranet.kreuzholzen.de)
	by metis.ext.pengutronix.de with esmtp (Exim 4.63)
	(envelope-from <jbe@pengutronix.de>) id 1N0us2-00032P-Do
	for linux-mtd@lists.infradead.org; Thu, 22 Oct 2009 12:26:17 +0200
From: Juergen Beisert <jbe@pengutronix.de>
To: linux-mtd@lists.infradead.org
Date: Thu, 22 Oct 2009 12:26:06 +0200
References: <20091020131157.GR8818@pengutronix.de>
	<200910211330.38141.gianlucarenzi@eptar.com>
In-Reply-To: <200910211330.38141.gianlucarenzi@eptar.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200910221226.07328.jbe@pengutronix.de>
Subject: Re: About the mxc nand driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mittwoch, 21. Oktober 2009, Gianluca Renzi wrote:
> On Tuesday 20 October 2009 15:11:58 Sascha Hauer wrote:
> > Hi all,
> >
> > I frequently get reports about bugs in the Freescale mxc nand driver.
> > Juergen Beisert and me invested some time to see what's going on in this
> > driver, so here are some results.
>
> The problem is caused by the fact the FreeScale's NAND Core Controller
> manages the 2K Largepage NAND as 4 SmallPage pages joined with their own
> ECC codes and badblock markers positions i.e. the smallpage badblock marker
> is located at 6th byte of the oobpage data (offset 5) (repeated for each
> page).

I can currently speak only about the i.MX35 NFC. But it handles larger pages 
than 512 byte in the same way the i.MX27 NFC does. The tables in the 
datasheet suggests they define a fixed location for the bad block marker in 
the spare area and this will be repeated 4 times for a 2048 byte page. But it 
seems the NFS does not touch any other byte than the ones defined for ECC 
usage.

jbe

-- 
Pengutronix e.K.                              | Juergen Beisert             |
Linux Solutions for Science and Industry      | Phone: +49-8766-939 228     |
Vertretung Sued/Muenchen, Germany             | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686              | http://www.pengutronix.de/  |
