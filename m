Received: from 213-229-28-240.static.adsl-line.inode.at ([213.229.28.240]
	helo=contec-int.at)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1By73N-0005IO-A1
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2004 06:55:26 -0400
From: Manfred Gruber <gruber.m@utanet.at>
To: Linux MTD Mailing List <linux-mtd@lists.infradead.org>
Date: Fri, 20 Aug 2004 13:00:05 +0200
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <200408201300.05579.gruber.m@utanet.at>
Subject: Number of CFI chips ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi guys !

I am trying to find out why my 2 AM29LV256M do not work.
See before was: Re: JFFS2 with AM29LV256M

I found out that CFI only detects one chip.

What should CFI detect when I have 2 AM29LV256M chips on a 32 bit bus. Each 
AM29LV256 has 16 bit bus with with connected to the 32bit bus. So CFI has to 
setect 2 chips, am i right ?(wehn interleave is set to 2, and buswith is set 
to 32)

When it only detects one chip, my problem must be in detecting the chips by 
CFI, is this correct ?

Thanks, regards manfred
