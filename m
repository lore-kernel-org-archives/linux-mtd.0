Received: from [202.108.35.197] (helo=vip.sina.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 197FMT-0006pB-IH
	for <linux-mtd@lists.infradead.org>; Sun, 20 Apr 2003 15:00:05 +0100
Message-ID: <001301c30745$438c1e60$0365a8c0@leeyang>
From: "leeyang" <leeyang@ycig.com>
To: <linux-mtd@lists.infradead.org>
Date: Sun, 20 Apr 2003 22:00:51 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit
Subject: mmap on jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am using jffs2 on a ppc860 system(amd29lv160).
Things seems ok,but when I am trying mmap.

I want to mmap a file in flash,so i can treat
the file like some records.

I mean operation like
 fd = open("/usr/dat/sot.dat",O_RDWR,FILEMODE);
 
 ptr1=mmap(NULL,filesize,PROT_READ|PROT_WRITE,
   MAP_SHARED,fd,0);

fd returns 3 and it is ok,however ptr1 returns -1.
I checked the errno it said invalid argument.

I have to say arguments "filesize" above is not
aligment to any requirements,just the real file
size?Does it matter?

The same procedure can done on common ext2
so i wonder jffs2 implement all the features like
ext2?

leeyang
