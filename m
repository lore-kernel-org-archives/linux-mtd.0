Received: from mail1.danielind.com ([12.19.96.6])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15PkPN-0005em-00
	for <linux-mtd@lists.infradead.org>; Thu, 26 Jul 2001 13:38:30 +0100
Message-ID: <30724FF712DFD2119E6200104B244892011974BC@mail1>
From: Vipin Malik <Vipin.Malik@daniel.com>
To: 'Jan Debiec ' <jan.debiec@jurca.de>,
	"'linux-mtd@lists.infradead.org '" <linux-mtd@lists.infradead.org>
Subject: RE: JFFS and RTLinux
Date: Thu, 26 Jul 2001 07:29:53 -0500
MIME-Version: 1.0
Content-Type: text/plain
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

I know that at least with RTAI, you can set the SMP flag off and then use
the 8259 timer UP scheduler. RTL does not have something similar?

Vipin

P.S. I assume that without the SMP flag (and RTLinux) everything works fine?

-----Original Message-----
From: Jan Debiec
To: linux-mtd@lists.infradead.org
Sent: 7/26/01 5:08 AM
Subject: JFFS and RTLinux

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

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
