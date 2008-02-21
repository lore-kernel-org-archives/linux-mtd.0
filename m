Received: from outbound-mail-13.bluehost.com ([69.89.18.113])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JS5VM-0008OG-Dc
	for linux-mtd@lists.infradead.org; Thu, 21 Feb 2008 07:06:04 +0000
Message-ID: <47BD22D0.9060008@dlasys.net>
Date: Thu, 21 Feb 2008 02:05:52 -0500
From: "David H. Lynch Jr." <dhlii@dlasys.net>
MIME-Version: 1.0
To: linuxppc-embedded <linuxppc-embedded@ozlabs.org>,
	linux-fsdevel@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>
Subject: Block devices
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

    Sometime recently it seems to have become possible to disable the
whole block device subsystem.
    Though in my tests I can't quit build with it disabled.

     Anyway, for an embedded device this might be appealing.
    how does this interact with initramfs and flash ?
   
    Can I boot an initramfs kernel without a block device ?
    Can I write a filesystem driver for a flash device that does not
require a block device ?
    Are their any examples of something even close ?

   

      







-- 
Dave Lynch 					  	    DLA Systems
Software Development:  				         Embedded Linux
717.627.3770 	       dhlii@dlasys.net 	  http://www.dlasys.net
fax: 1.253.369.9244 			           Cell: 1.717.587.7774
Over 25 years' experience in platforms, languages, and technologies too numerous to list.

"Any intelligent fool can make things bigger and more complex... It takes a touch of genius - and a lot of courage to move in the opposite direction."
Albert Einstein
