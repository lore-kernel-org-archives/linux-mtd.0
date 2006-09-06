Received: from www.kernelconcepts.de ([212.60.202.195]
	helo=mail.kernelconcepts.de)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GKxqW-0007AL-Eu
	for linux-mtd@lists.infradead.org; Wed, 06 Sep 2006 14:53:41 +0100
Received: from [212.60.202.194] (helo=[192.168.2.28])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50) id 1GKy5l-0007S4-C3
	for linux-mtd@lists.infradead.org; Wed, 06 Sep 2006 16:09:25 +0200
Message-ID: <44FED214.7090309@kernelconcepts.de>
Date: Wed, 06 Sep 2006 15:50:12 +0200
From: Nils Faerber <nils.faerber@kernelconcepts.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Intel P30, locked sectors?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!
I now did a kernel update (in fact, I started over with a new kernel)
and am now using 2.6.18-RC6 from kernel.org.

I have read access to the flash, rootfs is mounted correctly but at
first write attempt I get:

[42949375.150000] Freeing init memory: 96K
[42949376.480000] Erase at 0x00cc0000 failed immediately: -EROFS. Is the
sector locked?
[42949377.520000] Erase at 0x00c80000 failed immediately: -EROFS. Is the
sector locked?
[42949378.560000] Erase at 0x00c40000 failed immediately: -EROFS. Is the
sector locked?
[42949379.600000] Erase at 0x00c00000 failed immediately: -EROFS. Is the
sector locked?


I had hoped that the P30 chips would be supported now, but it seems they
are not fully. How can I unlock the sectors, if that is really the issue
here.

This is really starting to scare me a little ;)

Thanks in advance!

Cheers
  nils faerber

-- 
kernel concepts GbR      Tel: +49-271-771091-12
Dreisbachstr. 24         Fax: +49-271-771091-19
D-57250 Netphen          Mob: +49-176-21024535
--
