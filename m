Received: from [202.141.68.3] (helo=desh.cse.iitd.ernet.in)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D5g5W-0005Dh-Di
	for linux-mtd@lists.infradead.org; Mon, 28 Feb 2005 03:17:14 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by desh.cse.iitd.ernet.in (8.12.8/8.12.8) with ESMTP id j1S8GYGJ017975
	for <linux-mtd@lists.infradead.org>; Mon, 28 Feb 2005 13:46:34 +0530
Received: from desh.cse.iitd.ernet.in ([127.0.0.1])
	by localhost (desh.cse.iitd.ernet.in [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 17593-06 for <linux-mtd@lists.infradead.org>;
	Mon, 28 Feb 2005 13:46:34 +0530 (IST)
Received: from [10.20.50.26] (electron.kritikal.iitd.ernet.in [10.20.50.26])
	by desh.cse.iitd.ernet.in (8.12.8/8.12.8) with ESMTP id j1S8GRIH017971
	for <linux-mtd@lists.infradead.org>; Mon, 28 Feb 2005 13:46:29 +0530
Message-ID: <4222D35B.7070909@kritikalsolutions.com>
Date: Mon, 28 Feb 2005 13:46:27 +0530
From: Narinder Kumar <narinder@kritikalsolutions.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: SPI DataFlash interfacing using 2.4.26
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

         Did anyone on the group sucessfully interfaced a JFFS2 
partition on SPI DataFlash on Atmel's AT91RM9200 DK using  kernel 2.4.26 
? I have been able to mount the partition but read/write was giving CRC 
errors. If anyone has been able to do it succesfully please let me know 
your setup and what are the steps that you followed ?

Thanx
Narinder
