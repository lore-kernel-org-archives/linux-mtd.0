Received: from mailout01.ims-firmen.de ([213.174.32.96])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C0K2N-0005a8-1b
	for linux-mtd@lists.infradead.org; Thu, 26 Aug 2004 09:11:34 -0400
Received: from [192.168.1.18] (helo=scanner02.ims-firmen.de)
	by mailout01.ims-firmen.de with esmtp (Exim 4.30) id 1C0K2I-0004t0-0L
	for linux-mtd@lists.infradead.org; Thu, 26 Aug 2004 15:11:26 +0200
Received: from [80.133.246.52] (helo=susemail.lightmaze.com)
	by scanner02.ims-firmen.de with asmtp (Exim 4.30) id 1C0K2H-0000qv-Nq
	for linux-mtd@lists.infradead.org; Thu, 26 Aug 2004 15:11:25 +0200
Received: from LIMZKarrer (unknown [192.168.1.181])
	by susemail.lightmaze.com (Postfix SuSE 2.0) with SMTP id F24168D5E8
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Aug 2004 15:11:24 +0200 (CEST)
From: "Jochen Karrer" <j.karrer@lightmaze.com>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 26 Aug 2004 15:11:22 +0200
Message-ID: <MKELJOLMMOHJCMIPKLJKCEMOCAAA.j.karrer@lightmaze.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Bug in cfi_cmdset_0002.c in linux-2.6.8.1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
jffs2 did not work in linux-2.6.8.1 because single word writes at the end
of a buffer write are done with the wrong address:

--- /home/jkarrer/kernel/linux-2.6.8.1/drivers/mtd/chips/cfi_cmdset_0002.c
Sat Aug 14 12:55:20 2004
+++ cfi_cmdset_0002.c	Thu Aug 26 14:33:42 2004
@@ -1128,7 +1128,7 @@
 	if (len) {
 		size_t retlen_dregs = 0;

-		ret = cfi_amdstd_write_words(mtd, to, len, &retlen_dregs, buf);
+		ret = cfi_amdstd_write_words(mtd, ofs + (chipnum<<cfi->chipshift), len,
&retlen_dregs, buf);

 		*retlen += retlen_dregs;
 		return ret;


Jochen
