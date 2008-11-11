Received: from zimbra-mta.cetrtapot.si ([89.212.80.172])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KzuN5-0004bc-GA
	for linux-mtd@lists.infradead.org; Tue, 11 Nov 2008 14:37:35 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zimbra-mta.cetrtapot.si (Postfix) with ESMTP id 856CF19F9B0
	for <linux-mtd@lists.infradead.org>;
	Tue, 11 Nov 2008 15:28:39 +0100 (CET)
Received: from zimbra-mta.cetrtapot.si ([127.0.0.1])
	by localhost (zimbra-mta.cetrtapot.si [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id kRYlZgkTCUkg for <linux-mtd@lists.infradead.org>;
	Tue, 11 Nov 2008 15:28:38 +0100 (CET)
Received: from [172.31.65.135] (unknown [192.168.66.2])
	by zimbra-mta.cetrtapot.si (Postfix) with ESMTP id CB09719F99E
	for <linux-mtd@lists.infradead.org>;
	Tue, 11 Nov 2008 15:28:38 +0100 (CET)
Message-ID: <491995BE.3080206@cetrtapot.si>
Date: Tue, 11 Nov 2008 15:25:02 +0100
From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: number of MTD partitions
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

What would be better: one big or several small MTD parttions on NAND chip?

It is 32M byte chip, we used to have 4 patitions each 8M byte, now I would
like to use one 32 M byte, and are looking for pros/sons in both cases.

Would n of GC at startup be better than 1?
Would scan of 1 big partition be equal to sum of n small partition scans?

Thank you,
HK
-- 
Hinko Koèevar, OSS developer
ÈETRTA POT, d.o.o.
Planina 3, 4000 Kranj, SI EU
tel     ++386 (0) 4 280 66 03
e-mail  hinko.kocevar@cetrtapot.si
http    www.cetrtapot.si
