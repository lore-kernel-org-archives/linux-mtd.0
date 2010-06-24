Received: from mail.cvg.de ([62.153.82.30])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ORmAY-0008No-Ds
	for linux-mtd@lists.infradead.org; Thu, 24 Jun 2010 13:08:39 +0000
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.3) with ESMTP id o5OD8MpR028344
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jun 2010 15:08:23 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.72) (envelope-from <ensc@sigma-chemnitz.de>) id 1ORmAI-00042y-4y
	for linux-mtd@lists.infradead.org; Thu, 24 Jun 2010 15:08:22 +0200
Resent-Message-ID: <lytyoso9x5.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: inux-mtd@lists.infradead.org
Subject: [PATCH/mtd-utils] fix integer underflow in jffs2_rtime_compress()
Date: Thu, 24 Jun 2010 15:02:40 +0200
Message-Id: <1277384560-15329-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Artem.Bityutskiy@nokia.com, Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When '*dstlen' is 0 or 1, comparison will return wrong result.  Reported
by valgrind as

==5919== Invalid write of size 1
==5919==    at 0x40564E: jffs2_rtime_compress (compr_rtime.c:51)
==5919==    by 0x40676B: jffs2_compress (compr.c:246)
==5919==    by 0x403EE4: recursive_populate_directory (mkfs.jffs2.c:884)
==5919==  Address 0x4e1bdb1 is 0 bytes after a block of size 1 alloc'd
==5919==    at 0x4A0515D: malloc (vg_replace_malloc.c:195)
==5919==    by 0x40671C: jffs2_compress (compr.c:229)
==5919==    by 0x403EE4: recursive_populate_directory (mkfs.jffs2.c:884)

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 compr_rtime.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/compr_rtime.c b/compr_rtime.c
index 131536c..5613963 100644
--- a/compr_rtime.c
+++ b/compr_rtime.c
@@ -32,7 +32,7 @@ static int jffs2_rtime_compress(unsigned char *data_in, unsigned char *cpage_out
 
 	memset(positions,0,sizeof(positions));
 
-	while (pos < (*sourcelen) && outpos <= (*dstlen)-2) {
+	while (pos < (*sourcelen) && outpos+2 <= (*dstlen)) {
 		int backpos, runlen=0;
 		unsigned char value;
 
-- 
1.7.0.1
