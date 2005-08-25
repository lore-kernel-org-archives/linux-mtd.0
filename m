Received: from smtprelay03.ispgateway.de ([80.67.18.15])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E8CbJ-0006h1-Qk
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2005 03:56:45 -0400
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.56.56])
	(envelope-sender <priewasser@gmail.com>)
	by smtprelay03.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 25 Aug 2005 07:56:27 -0000
Message-ID: <430D79AA.2050105@gmail.com>
Date: Thu, 25 Aug 2005 09:56:26 +0200
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: kyungmin.park@samsung.com
References: <0ILR00B812WSF3@mmp1.samsung.com>
In-Reply-To: <0ILR00B812WSF3@mmp1.samsung.com>
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

Alright.

1) You could update your mtd sources and diff again, OR
simply replace BBM patch's line 23 "return -EAGAIN" with "return -EIO".

2) In syncread-patch you add "void (*mmcontrol)" on line 103 of 
include/linux/onenand.h.
BBM patch is looking for this "void (*mmcontrol)" to add some new stuff 
here. E.g. it doesn't search the "original" onenand.h (official MTD) but 
the already syncread-patched onenand.h, bbm-patch cannot be run before 
sync-patch was run.
No problem at all if one know's all this :-) Perhaps it would be good to 
change the  struct onenand_chip declaration order in a way that both 
patches can be run independent of each other. Until they are put to MTD 
CVS anyway...

-> THE RULES:
+ Run all the patches inside the kernel tree
+ Be aware of the right order:
   1. onenand-syncread.patch
   2. onenand-bbm.patch
   3. omap-onenand.patch

Regards,
Bernhard
