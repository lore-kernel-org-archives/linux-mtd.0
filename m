Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0EmM-0005li-O1
	for linux-mtd@lists.infradead.org; Tue, 20 Oct 2009 13:29:38 +0000
From: Juergen Beisert <jbe@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
Date: Tue, 20 Oct 2009 15:28:54 +0200
References: <20091020131157.GR8818@pengutronix.de>
In-Reply-To: <20091020131157.GR8818@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200910201528.55271.jbe@pengutronix.de>
Subject: Re: About the mxc nand driver
Cc: Vladimir Barinov <vova.barinov@gmail.com>, mathieu.berland@eads.com,
	linux-mtd@lists.infradead.org, Eric Benard <ebenard@eukrea.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Dienstag, 20. Oktober 2009, Sascha Hauer wrote:
> [...]
> The original Freescale driver uses this ecc layout for 8/16 bit busses:
>
> static struct nand_ecclayout nand_hw_eccoob_8 = {
> 	.eccbytes = 5,
> 	.eccpos = {6, 7, 8, 9, 10},
> 	.oobfree = {{0, 5}, {11, 5}}
> };

This one is bogus, as it describes an 8 byte OOB with more than 8 bytes... In 
the current driver this layout is used for soft ECC. Maybe this is the 
reason, why there wasn't any failure messages, because all people are using 
hardware ECC.

jbe

-- 
Pengutronix e.K.                              | Juergen Beisert             |
Linux Solutions for Science and Industry      | Phone: +49-8766-939 228     |
Vertretung Sued/Muenchen, Germany             | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686              | http://www.pengutronix.de/  |
