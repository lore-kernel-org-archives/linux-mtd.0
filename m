Received: from [2002:d4ee:c952::1] (helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D3FgZ-00011r-QJ
	for linux-mtd@lists.infradead.org; Mon, 21 Feb 2005 10:41:24 -0500
Date: Mon, 21 Feb 2005 16:41:21 +0100
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: dsaxena@plexity.net, linux-mtd@lists.infradead.org
Message-ID: <20050221154121.GA31235@xi.wantstofly.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: 
Subject: [PATCH,RFC] remove slowport mode setting from ixp2000 map driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(please CC on replies, not on the list)

Setting the slowport to 8-bit mode is something that ought to be
done in the IXP2000 generic code, not in the MTD map driver.  See
the description for ARM patch 2493/1 for an explanation.

	http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=2493/1

Now that 2493/1 has been accepted and will be upstream soon, this
doesn't need to be done in the map driver anymore.

Signed-off-by: Lennert Buytenhek <buytenh@wantstofly.org>


diff -urN linux-2.6.11-rc4.orig/drivers/mtd/maps/ixp2000.c linux-2.6.11-rc4/drivers/mtd/maps/ixp2000.c
--- linux-2.6.11-rc4.orig/drivers/mtd/maps/ixp2000.c	2004-12-24 22:35:39.000000000 +0100
+++ linux-2.6.11-rc4/drivers/mtd/maps/ixp2000.c	2005-02-21 16:12:03.313753034 +0100
@@ -216,11 +216,6 @@
 		goto Error;
 	}
 
-	/*
-	 * Setup read mode for FLASH
-	 */
-	*IXP2000_SLOWPORT_FRM = 1;
-
 #if defined(__ARMEB__)
 	/*
 	 * Enable erratum 44 workaround for NPUs with broken slowport
