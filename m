Received: from [80.71.104.230] (helo=www.ptl.com.mt)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A2H5H-000775-MK
	for <linux-mtd@lists.infradead.org>; Wed, 24 Sep 2003 22:22:03 +0100
Received: from acilia.ptl.com.mt ([80.71.104.233])
	by www.ptl.com.mt (8.9.3/8.9.3) with ESMTP id VAA11212
	for <linux-mtd@lists.infradead.org>; Wed, 24 Sep 2003 21:21:21 GMT
Message-Id: <5.1.0.14.2.20030924232021.05645038@mail.ptl.com.mt>
Date: Wed, 24 Sep 2003 23:21:08 +0200
To: linux-mtd@lists.infradead.org
From: Andrew Cilia <acilia@ptl.com.mt>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: compilation problems with Kernel 2.4.20-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have just downloaded today's mtd  snapshot, run a patchin.sh and tried to 
compile. Compilation falls over with problems in compatmac.h. In 
particular, it doesn't like current being passed to recalc_sigpending 
(around line 24) and set_user_nice conflicts with another definition.  I'm 
now past mtd compilation and continuing onwards (slow process ...300Mhz 
Geode).

Cheers


______________________________
Andrew Cilia B.Sc. MCSE ICSE
Philip Toledo Limited
Notabile Road, Mriehel BKR01,Malta

Tel: +356 21445566
Mob:+356 99430588
Fax: +356 21484316

Email: acilia@mail.ptl.com.mt
______________________________
