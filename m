Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PwzKp-0004Fa-Vo
	for linux-mtd@lists.infradead.org; Tue, 08 Mar 2011 16:00:32 +0000
Received: from gallifrey.ext.pengutronix.de
	([2001:6f8:1178:4:5054:ff:fe8d:eefb] helo=localhost)
	by metis.ext.pengutronix.de with esmtp (Exim 4.72)
	(envelope-from <jbe@pengutronix.de>) id 1PwzKm-0003Lg-2H
	for linux-mtd@lists.infradead.org; Tue, 08 Mar 2011 17:00:28 +0100
From: Juergen Beisert <jbe@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: S3C24xx NFC: Bad oob layout and partial write count violation
Date: Tue, 8 Mar 2011 16:58:03 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201103081658.03969.jbe@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

when I tried to get the NAND memory on my S3C2440 based mini2440 to work, I 
noticed the NFC driver uses its own 'nand_ecclayout' for small page NANDs and 
this layout may overwrites the bad block markers.
On the other hand this driver sets up the 'ecc.size' to 256 bytes for large 
page NANDs which ends up with 8 partial writes into one 2048 byte page. This 
violates the spec of at least my NAND device, which only allows 4 partial 
writes per page.
Does anyone know why the setup is done in this way?

For both cases I see no hardware restriction. I think for small page NANDs the 
generic OOB layout can be used, and for large page NANDs the 'ecc.size' 
should be increased at least to 512 (to be compatible with the S3C2410) to 
decrease the partial write count. But a change of these settings would break 
existing installations. How to proceed in this case?

jbe
