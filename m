Received: from [80.71.104.230] (helo=www.ptl.com.mt)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A2rSd-00031H-Os
	for <linux-mtd@lists.infradead.org>; Fri, 26 Sep 2003 13:12:36 +0100
Received: from acilia.ptl.com.mt (andrew.ptl [10.1.1.45])
	by www.ptl.com.mt (8.9.3/8.9.3) with ESMTP id MAA09620
	for <linux-mtd@lists.infradead.org>; Fri, 26 Sep 2003 12:11:45 GMT
Message-Id: <5.1.0.14.2.20030926122953.054eb6e8@mail.ptl.com.mt>
Date: Fri, 26 Sep 2003 14:11:34 +0200
To: linux-mtd@lists.infradead.org
From: Andrew Cilia <acilia@ptl.com.mt>
In-Reply-To: <5.1.0.14.2.20030924232021.05645038@mail.ptl.com.mt>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: Re: compilation problems with Kernel 2.4.20-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Continuing on from this posting, I have managed to compile the mtd 
components against 2.4.20-8 (RH Ver 9) but still haven't managed to do the 
same with jffs2.  I have shelved the latter and am looking at getting nftl 
working over mtd. In this regard, I am seeing /dev/mtd0 and have run 
nftl_format on it. When I reboot, I get a message re: no valid partition 
information for nftla. I have not compiled mtd partitioning into the kernel 
so could this be the problem here? Is mtd partitioning mandatory? I also 
see nftla1 coming up on boot but I do not have this under /dev. Do I need 
devfs up and running also or is it just a matter of running MAKEDEV?


Thanks.



At 23:21 24/09/2003, you wrote:
>I have just downloaded today's mtd  snapshot, run a patchin.sh and tried 
>to compile. Compilation falls over with problems in compatmac.h. In 
>particular, it doesn't like current being passed to recalc_sigpending 
>(around line 24) and set_user_nice conflicts with another definition.  I'm 
>now past mtd compilation and continuing onwards (slow process ...300Mhz Geode).
>
>Cheers
>
>
>______________________________
>Andrew Cilia B.Sc. MCSE ICSE
>Philip Toledo Limited
>Notabile Road, Mriehel BKR01,Malta
>
>Tel: +356 21445566
>Mob:+356 99430588
>Fax: +356 21484316
>
>Email: acilia@mail.ptl.com.mt
>______________________________
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________
Andrew Cilia B.Sc. MCSE ICSE
Philip Toledo Limited
Notabile Road, Mriehel BKR01,Malta

Tel: +356 21445566
Mob:+356 99430588
Fax: +356 21484316

Email: acilia@mail.ptl.com.mt
______________________________
