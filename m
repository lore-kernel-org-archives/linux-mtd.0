Received: from moutvdom00.kundenserver.de ([195.20.224.149])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Phyx-0005Wg-00
	for <linux-mtd@lists.infradead.org>; Thu, 26 Jul 2001 11:03:03 +0100
Received: from [195.20.224.209] (helo=mrvdom02.schlund.de)
	by moutvdom00.kundenserver.de with esmtp (Exim 2.12 #2)
	id 15Pi4X-00034y-00
	for linux-mtd@lists.infradead.org; Thu, 26 Jul 2001 12:08:49 +0200
Received: from pd9055330.dip.t-dialin.net ([217.5.83.48] helo=jurca.de)
	by mrvdom02.schlund.de with esmtp (Exim 2.12 #2)
	id 15Pi4X-0003QY-00
	for linux-mtd@lists.infradead.org; Thu, 26 Jul 2001 12:08:49 +0200
Message-ID: <3B5FEC30.82309CCC@jurca.de>
Date: Thu, 26 Jul 2001 12:08:48 +0200
From: Jan Debiec <jan.debiec@jurca.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: JFFS and RTLinux
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

Hello,

I'm trying to use RealTimeLinux (RTL 3.0 pre9) on Arcom MediaGX SBC
(2.2.17 with MTD and JFFS1)
AS condition to run RTL, kernel (2.2.17) must be compiled with SMP flag
set on.
But then the JFFS is not running properly, kernel is not able to mount
the /dev/mtdblock2 as root fs. After message "Building JFFS fs crash
recovery tree ... " system is hanging.
Do you know the solution?

Jan
-- 
----------------------------------	
 Jan Debiec    
 Jurca Optoelektronik
 Raiffeisenstr. 5D
 D-63110 Rodgau (Dudenhofen)
 Germany 
 
 tel      +49 6106 8290 20
 fax      +49 6106 8290 26
 email    jan.debiec@jurca.de
 www.jurca.de
----------------------------------
