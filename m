Return-Path: <SRS0=fgf0=YP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0568DCA9EA0
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2019 08:19:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA5062070B
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2019 08:19:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H7gT2zp5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=slb.com header.i=@slb.com header.b="RyEgSxlw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA5062070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=slb.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=COmPJamn61xPVVeRJ2kfGacM/ZRXpqaInrdsI1z9as0=; b=H7gT2zp5vME3VQ
	xTg6CnzeyzDMP2OPOL5vMbZWARhHKMjo9Bk0ploe5Uo9/AdqUpVE6ZVv6eNF11R2HlVjrFe0kjSCN
	6+sjzEC+u97RyUOk2gloeqjbI+S/jV7MVQTaOjjw5Qu8woqBs7j5jxMOxJgMhkt4HsU2pYyKQntCx
	4oX3wA0DdStv2XvFjckxWN2ACPP6PRVywPetlRWRh5IiSUf1hFgEY1r8NBMLPaFyQ6epLs7e7tX4k
	K34sBiZbuxSpFmd/7PrAwsFiDy8daVeB1kozg5mImuFDHwWCq/37sTEr3vsl4RoRK+sJzRZFVzeK3
	cs7+Oy/ZI2C+G8ln8HrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMpNr-00019J-IL; Tue, 22 Oct 2019 08:19:15 +0000
Received: from mta4.mail.slb.com ([192.23.68.89])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMpNo-00018Y-Qn
 for linux-mtd@lists.infradead.org; Tue, 22 Oct 2019 08:19:14 +0000
Received: from pps.filterd (us1190pfpoint09.mail.slb.com [127.0.0.1])
 by us1190pfpoint09.mail.slb.com (8.16.0.27/8.16.0.27) with SMTP id
 x9M8DNBZ021388; Tue, 22 Oct 2019 08:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=slb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding;
 s=20180320pps; bh=Srw8mBTghadJ5UhaxRpQWzFH/AFDWbxSuV7u7Nb3mK0=;
 b=RyEgSxlwx08FVLZKKcHtR+zul+yv38E+GKMkeNL0MYHbq57LVgLP5ISplWeLhuT3aqMq
 nHb/y7jZJLVycCPpZwJRcqf+tkG4q1er6Wy9neYJ9ABzBhIUdcZpwRjBqoMrEziYS3iE
 3aLolPAnne3mISlRzjvq9HOIAaBhrxOydCK6qnWxSjQI/2EZ7QF4hMZEt8Zh6NowQWRA
 pkx1uEg+4T3ocRZQ5wjfIm+n9SZQb0OFC19J/AoRQOIhUm2brIb/bvoYEiaUq0MmGFTl
 qirF6EIG4pqTYwHIym7YpsKMTGcxz56YfU+JZNIbahQ00dO4CDV5Moc9DDu1okKx9MdA PQ== 
Received: from mmsbuildserver2.dir.slb.com ([136.254.53.89])
 by us1190pfpoint09.mail.slb.com with ESMTP id 2vqu80vhyd-1;
 Tue, 22 Oct 2019 08:19:04 +0000
From: aabyzov@slb.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] flashcp: Add option -A/--erase-all
Date: Tue, 22 Oct 2019 10:18:57 +0200
Message-Id: <20191022081857.128874-1-aabyzov@slb.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-22_03:, , signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191022_011912_960185_6BE32E20 
X-CRM114-Status: GOOD (  14.55  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Andrij Abyzov <drolevar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Andrij Abyzov <drolevar@gmail.com>

Sometimes there's a need to erase the whole device when
programming an image, and not just the area under the
image itself.

Therefore, option -A/--erase-all has been added which
erases the whole device before writing the image.

Signed-off-by: Andrij Abyzov <drolevar@gmail.com>
---
 misc-utils/flashcp.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/misc-utils/flashcp.c b/misc-utils/flashcp.c
index c46a5b4..b6ad2f9 100644
--- a/misc-utils/flashcp.c
+++ b/misc-utils/flashcp.c
@@ -66,6 +66,7 @@
 #define FLAG_HELP		0x02
 #define FLAG_FILENAME	0x04
 #define FLAG_DEVICE		0x08
+#define FLAG_ERASE_ALL	0x10
 
 /* error levels */
 #define LOG_NORMAL	1
@@ -89,12 +90,13 @@ static NORETURN void showusage(bool error)
 			"\n"
 			"Flash Copy - Written by Abraham van der Merwe <abraham@2d3d.co.za>\n"
 			"\n"
-			"usage: %1$s [ -v | --verbose ] <filename> <device>\n"
+			"usage: %1$s [ -v | --verbose | -A | --erase-all ] <filename> <device>\n"
 			"       %1$s -h | --help\n"
 			"       %1$s -V | --version\n"
 			"\n"
 			"   -h | --help      Show this help message\n"
 			"   -v | --verbose   Show progress reports\n"
+			"   -A | --erase-all Erases the whole device regardless of the image size\n"
 			"   -V | --version   Show version information and exit\n"
 			"   <filename>       File which you want to copy to flash\n"
 			"   <device>         Flash device to write to (e.g. /dev/mtd0, /dev/mtd1, etc.)\n"
@@ -179,10 +181,11 @@ int main (int argc,char *argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "hvV";
+		static const char *short_options = "hvAV";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 'h'},
 			{"verbose", no_argument, 0, 'v'},
+			{"erase-all", no_argument, 0, 'A'},
 			{"version", no_argument, 0, 'V'},
 			{0, 0, 0, 0},
 		};
@@ -202,6 +205,10 @@ int main (int argc,char *argv[])
 				flags |= FLAG_VERBOSE;
 				DEBUG("Got FLAG_VERBOSE\n");
 				break;
+			case 'A':
+				flags |= FLAG_ERASE_ALL;
+				DEBUG("Got FLAG_ERASE_ALL\n");
+				break;
 			case 'V':
 				common_print_version();
 				exit(EXIT_SUCCESS);
@@ -257,8 +264,16 @@ int main (int argc,char *argv[])
 #warning "Check for smaller erase regions"
 
 	erase.start = 0;
-	erase.length = (filestat.st_size + mtd.erasesize - 1) / mtd.erasesize;
-	erase.length *= mtd.erasesize;
+
+	if (flags & FLAG_ERASE_ALL)
+	{
+		erase.length = mtd.size;
+	}
+	else
+	{
+		erase.length = (filestat.st_size + mtd.erasesize - 1) / mtd.erasesize;
+		erase.length *= mtd.erasesize;
+	}
 
 	if (flags & FLAG_VERBOSE)
 	{
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
