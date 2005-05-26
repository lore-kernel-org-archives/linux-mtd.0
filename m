Received: from metis.extern.pengutronix.de ([83.236.181.26])
	by pentafluge.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DbLVH-0003EQ-E2
	for linux-mtd@lists.infradead.org; Thu, 26 May 2005 17:46:40 +0100
Received: from rsc by metis.extern.pengutronix.de with local (Exim 3.36 #1
	(Debian)) id 1DbLVD-0001Y6-00
	for <linux-mtd@lists.infradead.org>; Thu, 26 May 2005 18:46:35 +0200
Date: Thu, 26 May 2005 18:46:35 +0200
From: Robert Schwebel <r.schwebel@pengutronix.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050526164635.GT6681@pengutronix.de>
References: <20050526152256.GS6681@pengutronix.de>
	<4295ED9E.6000508@arcom.com> <4295EE70.8000608@imc-berlin.de>
	<4295F3A4.70303@arcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <4295F3A4.70303@arcom.com>
Sender: Robert Schwebel <rsc@pengutronix.de>
Subject: Re: Fast rollout process on jffs2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 26, 2005 at 05:04:52PM +0100, David Vrabel wrote:
> Since I happened to have an image lying around I checked and it does
> place the clean markers at the start of every erase zone.

Hmm, sounds good, but that probably means that the jffs2 images have to
be the full flash size (which is 32 MB in my case) compared to about 8
MB at the moment? 

Robert
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hannoversche Str. 2, 31134 Hildesheim, Germany
   Phone: +49-5121-206917-0 |  Fax: +49-5121-206917-9
