Received: from smtp6.mindspring.com ([207.69.200.110])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157GtA-0004lD-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2001 14:28:52 +0100
Date: Tue, 5 Jun 2001 09:32:50 -0400
Message-Id: <200106051332.f55DWof11707@risacher.yi.org>
To: <Yopy-general@gmate.co.kr>
Cc: linux-mtd@lists.infradead.org
Subject: success with JFFS2 as root filesystem on YOPY
From: Daniel R Risacher <magnus@alum.mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

I just thought I'd mention that I did manage to get the YOPY to boot
with JFFS2 as the root filesystem with the 2.4.2-yopy1 kernel (which
is based on 2.4.2-rmk2-np2).  I needed to modify mtd/sa1100-flash.c to
use all the available flash space on the device.

-- 
              "If I have been able to see further, 
         it was only because I was surrounded by dwarves." 
                         -- Risto A. Paju
Daniel Risacher	                                   magnus@alum.mit.edu
