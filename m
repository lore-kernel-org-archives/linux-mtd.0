Received: from dsl093-192-209.stl1.dsl.speakeasy.net ([66.93.192.209]
	helo=newman.jbmsoft.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 196Elq-0001rS-TB
	for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2003 20:10:07 +0100
Received: from brianpc (BriansPC.jbmsoft.com [192.10.10.21])
	by newman.jbmsoft.com (Postfix) with SMTP id B883190306
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 Apr 2003 14:30:10 -0500 (CDT)
Message-ID: <002001c30514$f78e78a0$150a0ac0@jbmsoft.com>
From: "Brian T." <btuch@usa.net>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 17 Apr 2003 14:10:10 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: jffs2 compression question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have jffs2 running on a 2.4.20 kernel custom Embedded box with 16MB ROM
(Intel flash) and 32MB RAM.  The file system is about 52% full, and has
about 22MB of free RAM.  When I copy 4 ~1.6MB programs over to the ROMFS I
loose about 3MB of space with compression.  The system however also uses
another ~3MB RAM once the files are done being copied.  My question is, when
does (if ever) that 3MB RAM get freed up?  If I delete the files I just
copied, the RAM appears to be freed up.   If I reboot the unit, the RAM gets
reset back to the original 22MB RAM free.

Thanks for any insite.

-Brian
