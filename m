Received: from 225-9.east.net ([202.130.225.9] helo=smtp2)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 197UNJ-0000gE-LT
	for <linux-mtd@lists.infradead.org>; Mon, 21 Apr 2003 07:01:58 +0100
Received: from unknown (HELO leeyang) ([210.5.20.225])
	<????e???[?]??U??WVS???????G???u7?_?S?7?w??w????????????????????w??_???Q?7V??S?_?>)
	by 0 (qmail-ldap-1.03) with SMTP
	for <?O:??linux-mtd@lists.infradead.org?>; 21 Apr 2003 05:57:40 -0000
Message-ID: <002a01c307cb$86dad630$cc00a8c0@ycigrnd>
From: "leeyang" <leeyang@ycig.com>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 21 Apr 2003 14:01:55 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit
Subject: mmap on jffs2(2.4.19)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I need mmap a "writable" file,
and it fails.My code is as below:

 fd = open("/usr/dat/sot.dat",O_RDWR,FILEMODE);
 
 ptr1=mmap(NULL,filesize,PROT_READ|PROT_WRITE,MAP_SHARED,fd,0);

fd returns 3,but ptr1 returns -1 and 
mmap errno says invalid agrument.
These codes runs well on ext2.

Then I checked the old maillist and source code.
It seems jffs2 currently not support mmap writable.
Am I right?

In
http://lists.infradead.org/pipermail/linux-mtd/2002-July/005436.html
dw said "some kind of mtd_remap()",
Has it been implemented now? 


BTW:
My last msg was blocked by 
"Message has a suspicious header"

I'm not sure the reason,I guess 
the smtp server I used is broken,
and I change to another one,
hope this one works.

leeyang
