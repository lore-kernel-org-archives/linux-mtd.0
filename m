Received: from outbound01.mx-relay.com ([5.39.185.33]
 helo=outbound01-a.mx-relay.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDvuN-0006ht-1D
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2016 16:14:28 +0000
Received: from [145.131.171.178] (rt171bb131-145-178.routit.net
 [145.131.171.178]) by outbound01-a.mx-relay.com with ESMTP id
 kBRIDCZVHpTZrlfI (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <linux-mtd@lists.infradead.org>; Mon, 05 Dec 2016 17:14:03 +0100 (CET)
Received: from localhost (localhost.localhost [127.0.0.1])
 by router38.aimvalley.nl (Postfix) with ESMTP id 9138E639F7
 for <linux-mtd@lists.infradead.org>; Mon,  5 Dec 2016 17:14:03 +0100 (CET)
Received: from mail3.aimsys.nl (mail.aimsys.nl [10.10.0.114])
 by router38.aimvalley.nl (Postfix) with ESMTPS id 8FFA2639F5
 for <linux-mtd@lists.infradead.org>; Mon,  5 Dec 2016 17:14:02 +0100 (CET)
Received: from linvm302.aimsys.nl (linvm302.aimsys.nl [10.10.23.2])
 by mail3.aimsys.nl (8.14.2/8.14.2) with ESMTP id uB5GH0Iq008542
 for <linux-mtd@lists.infradead.org>; Mon, 5 Dec 2016 17:17:01 +0100
From: Kees Trommel <ctrommel@aimvalley.nl>
Subject: Add --skip-all-ffs option to mtd-utils nandwrite
To: linux-mtd@lists.infradead.org
Message-ID: <82cbfdbc-c79b-01b0-bc64-a4259d7a150e@aimvalley.nl>
Date: Mon, 5 Dec 2016 17:14:02 +0100
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------BA99E4EFB3F9F949CEC6C8AA"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------BA99E4EFB3F9F949CEC6C8AA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

All,

Would it be possible to add an option --skip-all-ffs option to mtd-utils 
nandwrite?

With this option pages that contain only 0xFF bytes will be skipped and 
not written to flash.

This option is useful when you want to write using nandwrite an UBI 
image to NAND devices with a HW ECC. Without this option the OOB of a 
page that is written with all 0xFFs is no longer erased because the HW 
adds an non 0xFFs ECC to the OOB. If the data of the page contains only 
0xFFs then UBI/UBIFS assumes that the page is erased and writes to it 
without erasing the page first. This causes that a read of this page 
fails with unrecoverable ECC errors and a subsequent corruption of the 
UBIFS.

Attached is a patch file that adds the --skip-all-ffs option. A 
nandwrite of UBI image with this option will be successful while it 
fails without this option.

Regards,

Kees Trommel



--------------BA99E4EFB3F9F949CEC6C8AA
Content-Type: text/x-patch;
 name="0001-skip-all-ff-pages-option.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-skip-all-ff-pages-option.patch"

>From f5dd8f13b45a37f0375f01a05a3ed41b39b50beb Mon Sep 17 00:00:00 2001
From: Kees Trommel <ctrommel@linvm302.aimsys.nl>
Date: Mon, 5 Dec 2016 16:37:11 +0100
Subject: [PATCH] skip-all-ff-pages-option

Signed-off-by: Kees Trommel <ctrommel@linvm302.aimsys.nl>
---
 nandwrite.c | 41 ++++++++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index 9c3fe8f..722b1bd 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -49,6 +49,7 @@ static void display_help(int status)
 "Writes to the specified MTD device.\n"
 "\n"
 "  -a, --autoplace         Use auto OOB layout\n"
+"  -k, --skip-all-ffs      Skip pages that contain only ff bytes\n"
 "  -m, --markbad           Mark blocks bad if write fails\n"
 "  -n, --noecc             Write without ecc\n"
 "  -N, --noskipbad         Write without bad block skipping\n"
@@ -93,6 +94,7 @@ static bool		onlyoob = false;
 static bool		markbad = false;
 static bool		noecc = false;
 static bool		autoplace = false;
+static bool		skipallffs = false;
 static bool		noskipbad = false;
 static bool		pad = false;
 static int		blockalign = 1; /* default to using actual block size */
@@ -103,7 +105,7 @@ static void process_options(int argc, char * const argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char short_options[] = "hb:mnNoOpqs:a";
+		static const char short_options[] = "hb:mnNoOpqs:ak";
 		static const struct option long_options[] = {
 			/* Order of these args with val==0 matters; see option_index. */
 			{"version", no_argument, 0, 0},
@@ -120,6 +122,7 @@ static void process_options(int argc, char * const argv[])
 			{"quiet", no_argument, 0, 'q'},
 			{"start", required_argument, 0, 's'},
 			{"autoplace", no_argument, 0, 'a'},
+			{"skip-all-ffs", no_argument, 0, 'k'},
 			{0, 0, 0, 0},
 		};
 
@@ -173,6 +176,9 @@ static void process_options(int argc, char * const argv[])
 		case 'a':
 			autoplace = true;
 			break;
+		case 'k':
+			skipallffs = true;
+			break;
 		case 'h':
 			display_help(EXIT_SUCCESS);
 			break;
@@ -231,6 +237,8 @@ static void erase_buffer(void *buffer, size_t size)
  */
 int main(int argc, char * const argv[])
 {
+	int allffs;
+	int ii;
 	int fd = -1;
 	int ifd = -1;
 	int pagelen;
@@ -516,14 +524,29 @@ int main(int argc, char * const argv[])
 			}
 		}
 
-		/* Write out data */
-		ret = mtd_write(mtd_desc, &mtd, fd, mtdoffset / mtd.eb_size,
-				mtdoffset % mtd.eb_size,
-				onlyoob ? NULL : writebuf,
-				onlyoob ? 0 : mtd.min_io_size,
-				writeoob ? oobbuf : NULL,
-				writeoob ? mtd.oob_size : 0,
-				write_mode);
+		allffs = 0;
+		if (skipallffs) 
+		{
+			for (ii = 0; ii < mtd.min_io_size; ii += sizeof(uint32_t))
+			{
+				if (*(uint32_t*)(writebuf + ii) != 0xffffffff)
+					break;
+			}
+			if (ii == mtd.min_io_size)
+				allffs = 1;
+		}
+		if (!allffs) {
+			/* Write out data */
+			ret = mtd_write(mtd_desc, &mtd, fd, mtdoffset / mtd.eb_size,
+					mtdoffset % mtd.eb_size,
+					onlyoob ? NULL : writebuf,
+					onlyoob ? 0 : mtd.min_io_size,
+					writeoob ? oobbuf : NULL,
+					writeoob ? mtd.oob_size : 0,
+					write_mode);
+		} else  {
+			ret = 0;
+		}
 		if (ret) {
 			long long i;
 			if (errno != EIO) {
-- 
2.5.5



--------------BA99E4EFB3F9F949CEC6C8AA--
