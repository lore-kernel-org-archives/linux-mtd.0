Received: from chaingun.noernet.de ([62.154.254.10] ident=exim)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15aEtT-0002xr-00
	for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2001 12:12:55 +0100
Received: from chaingun.noernet.de ([62.154.254.10] ident=derget)
	by chaingun.noernet.de with esmtp (Exim 3.20 #1)
	id 15aEzE-0000RR-00
	for linux-mtd@lists.infradead.org; Fri, 24 Aug 2001 13:18:52 +0200
Date: Fri, 24 Aug 2001 13:18:52 +0200 (CEST)
From: dennis noermann <dennis.noermann@noernet.de>
To: <linux-mtd@lists.infradead.org>
Subject: jffs2 mount time and min size
Message-ID: <Pine.LNX.4.33.0108241310080.31282-100000@chaingun.noernet.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

hi all

in the mailinglist archive i saw a lot of posting that jffs2 mount time is
long , on my system it is long , too :(

ppc with 66Mhz
2*Intel 28F320 interlanced in 32 Bit mode

to mount an 6Mb partition it takes 20 seconds

is there any kind of way to improve the mount speed ?


I tried to make a 1024k jffs2 partition , it workt
but df schows that 600k is used after cration
and after bringing more then 500k in it it says i am full :(

Normal ?

I tried to make an 640k jffs2 partition , it doesnt work
i made the immage with mkjffs2 , copied it to the partition
mounted it , ok i can read all stuff in it

but if i try to delete something or to put something more in it
it says i am full :(

Normal ?


cu


dennis noermann

ps: i am using kernel 2.4.2 with mtdcvs from 23.08.2001
