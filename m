Received: from mistral-243-146-ban.mistralsoftware.com ([203.196.146.243] helo=Mistralsoftware.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18JovW-0001FA-00
	for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2002 05:51:58 +0000
Received: from skumar [192.168.13.30]
	by mistralsoftware.com [192.168.10.12]
	with SMTP (MDaemon.PRO.v5.0.0.R)
	for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2002 12:00:50 +0530
Message-ID: <001401c29c29$89845ae0$1e0da8c0@skumar>
From: "Skumar" <skumar@mistralsoftware.com>
To: <linux-mtd@lists.infradead.org>
Subject: mkfs.jffs2 not wroking properly
Date: Thu, 5 Dec 2002 12:12:53 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Hi ,

[root@embedded_linux del]# ls -la
total 44
drwxrwxr-x    2 skumar   skumar       4096 Dec  5 11:48 .
drwxrwxrwx   25 skumar   skumar       4096 Dec  5 10:45 ..
-rwxr-xr-x    1 root     root        13830 Nov 14 17:56 erase
-rwxr-xr-x    1 root     root        14751 Nov 14 17:56 eraseall
-rw-rw-r--    1 skumar   skumar         13 Nov 14 12:51 test.c
[root@embedded_linux del]# cd ..
[root@embedded_linux skumar]# ./mkfs.jffs2 -r del -o tmp/jffs2.image
[root@embedded_linux skumar]# /usr/src/redhat/SOURCES/mtd/util/jffs2reader
tmp/jffs2.image
-rw-rw-r-- 1    503      503             13 Nov 14 12:51 /test.c
-rwxr-xr-x 1    0        0             4096 Nov 14 17:56 /eraseall
[root@embedded_linux skumar]#

as seen though the del directory contains 3 files the jffs2.image contains
only 2 file & the size of one of the files(eraseall)
is 0

Regards
sharath
