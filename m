Received: from n1.cetrtapot.si ([212.30.80.17])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DbObh-00083U-2x
	for linux-mtd@lists.infradead.org; Thu, 26 May 2005 16:05:31 -0400
Received: from localhost (localhost.dmz.cetrtapot.si [127.0.0.1])
	by n1.cetrtapot.si (Postfix) with ESMTP id ACDBCBAA6
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 May 2005 22:05:10 +0200 (CEST)
Received: from n1.cetrtapot.si ([127.0.0.1])
	by localhost (n1.dmz.cetrtapot.si [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 64251-01 for <linux-mtd@lists.infradead.org>;
	Thu, 26 May 2005 22:05:03 +0200 (CEST)
Received: from [192.168.1.101] (BSN-210-238-154.dsl.siol.net [195.210.238.154])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by n1.cetrtapot.si (Postfix) with ESMTP id 47312B99D
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 May 2005 22:05:03 +0200 (CEST)
From: Simon Posnjak <simon.posnjak@cetrtapot.si>
To: linux-mtd@lists.infradead.org
Date: Thu, 26 May 2005 22:05:01 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200505262205.01979.simon.posnjak@cetrtapot.si>
Subject: Toshiba NAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I am working on board specific driver for our board. While writing hwcontrol 
function I discoverd that I can set it up to drive CLE, ALE, nCE, WP (not 
used according to nand.h) signals, but when I checked the timing diagrams in 
the FLASHes data sheet 
(http://www.toshiba.com/taec/components/Datasheet/TC58DVM92A1FT_030110.pdf)
I found that I shoud also drive the RE and WE signals. So am I missing 
something or is our FLASH chip (TC58DVM92) not yet supported in NAND MTD?

	Regards Simon
