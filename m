Received: from bs1.dnx.de ([213.252.143.130] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1765kM-0000SF-00
	for <linux-mtd@lists.infradead.org>; Fri, 10 May 2002 09:27:27 +0100
Received: from p50861435.dip.t-dialin.net ([80.134.20.53] helo=callisto.pengutronix.de)
	by bs1.dnx.de with asmtp (Exim 3.34 #1)
	id 1765kL-0007QH-00
	for linux-mtd@lists.infradead.org; Fri, 10 May 2002 10:27:25 +0200
Date: Fri, 10 May 2002 10:27:03 +0200
From: Robert Schwebel <robert@schwebel.de>
To: linux-mtd@lists.infradead.org
Subject: Re: mtdblock and devfs
Message-ID: <20020510102702.U15258@schwebel.de>
References: <20020510100655.T15258@schwebel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20020510100655.T15258@schwebel.de>; from robert@schwebel.de on Fri, May 10, 2002 at 10:06:55AM +0200
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

On Fri, May 10, 2002 at 10:06:55AM +0200, Robert Schwebel wrote:
> using devfs and mtd from CVS I see only the char device nodes in /dev/mtd,
> although I've enabled CONFIG_MTD_BLOCK=y: 

stupid me - I've just discovered /dev/mtdblock :-) 

Robert
-- 
 +--------------------------------------------------------+
 | Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de |
 | Pengutronix - Linux Solutions for Science and Industry |
 |   Braunschweiger Str. 79,  31134 Hildesheim, Germany   |
 |    Phone: +49-5121-28619-0 |  Fax: +49-5121-28619-4    |
 +--------------------------------------------------------+
