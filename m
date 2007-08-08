Received: from mtaout3.barak.net.il ([212.150.49.173])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IIjRe-0002Am-Er
	for linux-mtd@lists.infradead.org; Wed, 08 Aug 2007 07:11:22 -0400
Received: from mail.linux-boards.com ([62.90.235.247])
	by mtaout3.barak.net.il (Sun Java System Messaging Server 6.2-7.04
	(built Aug
	17 2006)) with ESMTP id <0JMG00GTJCEOLQ41@mtaout3.barak.net.il> for
	linux-mtd@lists.infradead.org; Wed, 08 Aug 2007 14:11:12 +0300 (IDT)
Received: from [10.1.1.95] (. [10.1.1.95] (may be forged))
	by mail.linux-boards.com (8.12.5/8.12.8) with ESMTP id
	l78B6OtA004556	for
	<linux-mtd@lists.infradead.org>; Wed, 08 Aug 2007 14:06:34 +0300
Date: Wed, 08 Aug 2007 14:06:15 +0300
From: Mike Rapoport <mike@compulab.co.il>
Subject: unlock address for non-CFI chip
To: linux-mtd <linux-mtd@lists.infradead.org>
Message-id: <46B9A3A7.9040305@compulab.co.il>
MIME-version: 1.0
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
I'm trying to add Eon EN29SL800 chip to jedec_probe.c, and I don't quite 
understand why in 'finfo_uaddr' the unlock address is always reset to the 
8-bit-mode entry, and what should be the contents of 'uaddr' field in the 
                 flash chip definition in the 'jedec_table'.


-- 
Sincerely yours,
Mike.
