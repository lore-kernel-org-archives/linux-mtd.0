Received: from ip68-6-97-217.sb.sd.cox.net ([68.6.97.217] helo=speedy.datawave.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17BHMw-0003e8-00
	for <linux-mtd@lists.infradead.org>; Fri, 24 May 2002 16:52:42 +0100
From: "Brian J. Fox" <bfox@ua.com>
To: cytang_cn@yahoo.com.cn
CC: linux-mtd@lists.infradead.org
In-reply-to: <20020524153926.81509.qmail@web14402.mail.yahoo.com> (message
	from =?gb2312?q?cytang?= on Fri, 24 May 2002 23:39:26 +0800 (CST))
Subject: Re: Why cannot boot off my doc 2000 ?
Message-Id: <E17BHMf-0007bT-00@speedy.datawave.net>
Date: Fri, 24 May 2002 08:52:25 -0700
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

   From: =?gb2312?q?cytang?= <cytang_cn@yahoo.com.cn>
   Date: Fri, 24 May 2002 23:39:26 +0800 (CST)

   run:  lilo-mtd  -v -C /doc/etc/lilo.conf -r /doc

   Boot image: /boot/bzImage-doc
		~~~~
   Added linuxondoc *

   It seemed ok .but above why not /doc/boot?

Because you specified "-r /doc" to lilo, which says to chroot to /doc
before starting to do anything.

In fact, a simple "lilo-doc -r /doc" will do the right thing for you.

   If i remove my harddisk , I still cannot boot from my
   doc . just get  "boot failure " .

That means that the DoC isn't bootable.  Maybe the first partition
isn't "active". 

Brian
== The Difference Between Cultures: ==
    Einigkeit und Recht und Freiheit
    Liberte', E'galite', Fraternite'
    Sex, drugs and rock'n'roll
