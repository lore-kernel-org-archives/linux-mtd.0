Received: from mail.dsa-ac.de ([62.112.80.99] helo=k2.dsa-ac.de)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19vFRR-0004ST-2M
	for <linux-mtd@lists.infradead.org>; Fri, 05 Sep 2003 13:11:53 +0100
Received: from komserver.dsa-ac.de (KOMSERVER2.dsa-ac.de [172.28.1.4])
	3B9974AC9	for <linux-mtd@lists.infradead.org>;
	Fri,  5 Sep 2003 14:11:29 +0200 (CEST)
Received: from PCGL.dsa-ac.de (PCGL.dsa-ac.de [172.29.17.23])
	id 4C52B1D3E	for <linux-mtd@lists.infradead.org>;
	Fri,  5 Sep 2003 14:11:20 +0200 (CEST)
Date: Fri, 5 Sep 2003 14:11:19 +0200 (CEST)
From: Guennadi Liakhovetski <gl@dsa-ac.de>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.56.0309051408170.2669@pcgl.dsa-ac.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: Reading from flash in kernel
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

I need to read data from a flash partition in kernel. At the moment I do

mtd = get_mtd_device(NULL, MTD_MINOR);
ret = MTD_READ(mtd, ppos, len, &retlen, kbuf);
put_mtd_device(mtd);

MTD_READ() returns 0, but nothing is copied to the buffer. Well, I would
guess I am doing it wrong, what's the right way?

Thanks
Guennadi
---------------------------------
Guennadi Liakhovetski, Ph.D.
DSA Daten- und Systemtechnik GmbH
Pascalstr. 28
D-52076 Aachen
Germany
