Received: from chambertin.convergence.de ([212.84.236.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14ux55-00078G-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 May 2001 14:54:16 +0100
Received: from router-dmz.convergence.de ([212.84.236.1] helo=convergence.de)
	by chambertin.convergence.de with esmtp (Exim 3.16 #7 (Debian))
	id 14ux5L-0000TC-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 May 2001 15:54:31 +0200
Message-ID: <3AF01004.D38B940E@convergence.de>
Date: Wed, 02 May 2001 15:47:48 +0200
From: Frank Neuber <neuber@convergence.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: map.h is broken
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Hi,
I think the /include/linux/mtd/map.h is broken. After the daily
(2.5.2001) cvs
update my kernel don't complile.
After inserting the following two lines (++) into map.h (struct
map_info) 
the "make modules" work well.
--- cut---
        void *fldrv_priv;
++       void (*fldrv_destroy)(struct mtd_info *);
++       const char *im_name;
        struct mtd_chip_driver *fldrv;

---cut---

Regards
Frank

-- 
Dipl.-Ing. Elektrotechnik     convergence integrated media gmbh / HW
Frank Neuber                        Rosenthalerstr.51 / 10178 Berlin
Email:  neuber@convergence.de           Phone:  +49(0)30-72 62 06 50
WWW:    www.convergence.de              Fax:    +49(0)30-72 62 06 55
