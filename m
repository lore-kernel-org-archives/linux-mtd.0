Received: from smtprelay03.ispgateway.de ([80.67.18.15])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E7ZGY-0001AB-NU
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2005 09:56:44 -0400
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.120.114])
	(envelope-sender <priewasser@gmail.com>)
	by smtprelay03.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 23 Aug 2005 13:56:36 -0000
Message-ID: <430B2B12.8000307@gmail.com>
Date: Tue, 23 Aug 2005 15:56:34 +0200
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: kyungmin.park@samsung.com
References: <0ILE00C40SBNBO@mmp1.samsung.com>
In-Reply-To: <0ILE00C40SBNBO@mmp1.samsung.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] OneNAND: Simple Bad Block handling support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

trying patching a today's snapshot I get:

patch -p1 < onenand-bbm.patch
patching file drivers/mtd/onenand/Makefile
Hunk #1 FAILED at 3.
1 out of 1 hunk FAILED -- saving rejects to file 
drivers/mtd/onenand/Makefile.rej
patching file drivers/mtd/onenand/onenand_base.c
Hunk #1 FAILED at 311.
Hunk #2 succeeded at 1033 (offset -29 lines).
Hunk #3 succeeded at 1101 (offset -29 lines).
Hunk #4 succeeded at 1158 (offset -29 lines).
Hunk #5 succeeded at 1444 (offset -29 lines).
Hunk #6 succeeded at 1504 (offset -35 lines).
1 out of 6 hunks FAILED -- saving rejects to file 
drivers/mtd/onenand/onenand_base.c.rej
patching file drivers/mtd/onenand/onenand_bbt.c
patching file include/linux/mtd/bbm.h
patching file include/linux/mtd/onenand.h
Hunk #3 FAILED at 101.
Hunk #4 succeeded at 109 (offset -1 lines).
1 out of 4 hunks FAILED -- saving rejects to file 
include/linux/mtd/onenand.h.rej

.rej files are available.
Perhaps it's a silly fault... I'm new to diff/patch, sorry.

Regards,
Bernhard
