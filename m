Received: from pd953a7e9.dip.t-dialin.net ([217.83.167.233] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16cq2R-0007Dk-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2002 15:49:11 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 & NAND
Date: Mon, 18 Feb 2002 17:02:59 +0100
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
References: <02021810263602.00860@thomas> <19529.1014024551@redhat.com> <02021810483303.00860@thomas>
In-Reply-To: <02021810483303.00860@thomas>
MIME-Version: 1.0
Message-Id: <02021817025909.00860@thomas>
Content-Transfer-Encoding: 8bit
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

I hacked it, so that JFFS2 uses the c->mtd->ecctype to decide which oob 
layout is given. I tested the system again and destroyed the ECC data on one 
page. When i tried to mount JFFS2 again it failed, because the nand driver 
returned -EIO, as the bad page ECC was seen. 
That's not the way it can go. You have one bad ECC page and all your data are 
lost. 
There are two possibilities to react:
1. Return the raw page data without ECC correction and return 0 (success) and 
let the fs driver detect the invalid stuff on it's own, what JFFS2 actually 
does.

2. Return the raw page data without ECC correction and return a value > 0 to 
inform the fs driver that ECC failed and data maybe corrupted.

I think the 2nd one is the better one. But it gives us a lot of hacking 
inside JFFS2.

-- 
Thomas
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
