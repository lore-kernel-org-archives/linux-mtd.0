Received: from ns.pmeerw.net ([87.118.82.44] helo=pmeerw.net)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoV0k-0003hO-V0
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 09:14:19 +0000
Date: Thu, 5 Dec 2013 10:13:52 +0100 (CET)
From: Peter Meerwald <pmeerw@pmeerw.net>
To: linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org
Subject: OMAP3 NAND ECC selection
Message-ID: <alpine.DEB.2.01.1312051000270.17561@pmeerw.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

on OMAP3, the NAND area holding MLO and u-boot need a different ECC scheme 
(hw) than the rootfs (sw)

is there a way to tell the kernel which ECC scheme to use on a 
per-partition basis?

I'd like to be able to update MLO and u-boot from within a booted Linux 
system on the device (I have to resort to u-boot for that where I can 
control the ECC scheme used)

thanks, regards, p.

-- 

Peter Meerwald
+43-664-2444418 (mobile)
