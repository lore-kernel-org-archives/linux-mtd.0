Received: from mail.dsa-ac.de ([62.112.80.99])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I6QqT-0002Qp-Fo
	for linux-mtd@lists.infradead.org; Thu, 05 Jul 2007 08:54:09 -0400
Received: from localhost (unknown [127.0.0.1])
	by mail.dsa-ac.de (Postfix) with ESMTP id 4E33B3C3AB
	for <linux-mtd@lists.infradead.org>;
	Thu,  5 Jul 2007 12:53:48 +0000 (UTC)
Received: from pcgl.dsa-ac.de (PCGL.dsa-ac.de [172.29.17.23])
	by mail.dsa-ac.de (Postfix) with ESMTP id 6B2273C363
	for <linux-mtd@lists.infradead.org>;
	Thu,  5 Jul 2007 14:53:47 +0200 (CEST)
Date: Thu, 5 Jul 2007 14:53:46 +0200 (CEST)
From: Guennadi Liakhovetski <gl@dsa-ac.de>
To: linux-mtd@lists.infradead.org
Subject: Bogus usage of HZ in cfi_cmdset_0001.c
Message-ID: <Pine.LNX.4.63.0707051445440.8578@pcgl.dsa-ac.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

There are several places in cfi_cmdset_0001.c (possibly others?) like

		} else if (usec >= 1000000/HZ) {
		if (sleep_time >= 1000000/HZ) {
			sleep_time = 1000000/HZ;
	udelay = (!extp || !(extp->FeatureSupport & (1 << 5))) ? 1000000/HZ : 0;

which means timeout (e.g., waiting for hardware) are hard-coded in ticks, 
which can have variable duration. What should they really be?

The problem I am seeing is that on a PXA270-based system the unlock 
operation sometimes returns with a timeout, when the CPU is running with 
520MHz, no problem up to 416MHz. Any idea?

Thanks
Guennadi
---------------------------------
Guennadi Liakhovetski, Ph.D.
DSA Daten- und Systemtechnik GmbH
Pascalstr. 28
D-52076 Aachen
Germany
