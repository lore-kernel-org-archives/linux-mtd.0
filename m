Received: from outbound01.mx-relay.com ([5.39.185.33]
 helo=outbound01-b.mx-relay.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEB8J-0005kf-C9
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2016 08:29:53 +0000
Subject: Re: Add --skip-all-ffs option to mtd-utils nandwrite
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 linux-mtd@lists.infradead.org
References: <82cbfdbc-c79b-01b0-bc64-a4259d7a150e@aimvalley.nl>
 <16abefc9-61e8-3b0d-c44c-6d02764ec8e9@sigma-star.at>
From: Kees Trommel <ctrommel@aimvalley.nl>
Message-ID: <33437f45-d3e8-17ec-d5b0-0118d50ff6ec@aimvalley.nl>
Date: Tue, 6 Dec 2016 09:29:24 +0100
MIME-Version: 1.0
In-Reply-To: <16abefc9-61e8-3b0d-c44c-6d02764ec8e9@sigma-star.at>
Content-Type: multipart/mixed; boundary="------------20840417D8206E06E252BE5C"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------20840417D8206E06E252BE5C
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

David,

Attached a rebased patch file.

Kees.

On 12/05/16 20:13, David Oberhollenzer wrote:
> Hi,
>
>
> On 12/05/2016 05:14 PM, Kees Trommel wrote:
>> Would it be possible to add an option --skip-all-ffs option to mtd-utils nandwrite?
>>
>> With this option pages that contain only 0xFF bytes will be skipped and not written to flash.
>>
>> This option is useful when you want to write using nandwrite an UBI image to NAND devices with a HW ECC. Without this option the OOB of a page that is written with all 0xFFs is no longer erased because the HW adds an non 0xFFs ECC to the OOB. If the data of the page contains only 0xFFs then UBI/UBIFS assumes that the page is erased and writes to it without erasing the page first. This causes that a read of this page fails with unrecoverable ECC errors and a subsequent corruption of the UBIFS.
> Yes, that sounds reasonable.
>   
>> Attached is a patch file that adds the --skip-all-ffs option. A nandwrite of UBI image with this option will be successful while it fails without this option.
> Your patch looks good to me, however even after fixing the paths to nandwrite.c (the
> source tree got restructured over a year ago, see commit 7d81790ced) it doesn't apply
> to the current mtd-utils master branch. Could you please rebase your patch onto the
> current mtd-utils master branch (git://git.infradead.org/mtd-utils.git) and resubmit it?
>
>
> Thanks,
>
> David
>
>


--------------20840417D8206E06E252BE5C
Content-Type: text/x-patch;
 name="0001-skip-all-ff-pages-option.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-skip-all-ff-pages-option.patch"

>From 8bf3ad295aee71fdcee48fe462908503ac82ff95 Mon Sep 17 00:00:00 2001
From: Kees Trommel <ctrommel@linvm302.aimsys.nl>
Date: Tue, 6 Dec 2016 09:21:19 +0100
Subject: [PATCH] skip-all-ff-pages-option

Signed-off-by: Kees Trommel <ctrommel@linvm302.aimsys.nl>
---
 nand-utils/nandwrite.c | 41 ++++++++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/nand-utils/nandwrite.c b/nand-utils/nandwrite.c
index 1c00cdf..b376869 100644
--- a/nand-utils/nandwrite.c
+++ b/nand-utils/nandwrite.c
@@ -49,6 +49,7 @@ static void display_help(int status)
 "Writes to the specified MTD device.\n"
 "\n"
 "  -a, --autoplace         Use auto OOB layout\n"
+"  -k, --skip-all-ffs      Skip pages that contain only 0xff bytes\n"
 "  -m, --markbad           Mark blocks bad if write fails\n"
 "  -n, --noecc             Write without ecc\n"
 "  -N, --noskipbad         Write without bad block skipping\n"
@@ -92,6 +93,7 @@ static bool		onlyoob = false;
 static bool		markbad = false;
 static bool		noecc = false;
 static bool		autoplace = false;
+static bool		skipallffs = false;
 static bool		noskipbad = false;
 static bool		pad = false;
 static int		blockalign = 1; /* default to using actual block size */
@@ -102,7 +104,7 @@ static void process_options(int argc, char * const argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char short_options[] = "hb:mnNoOpqs:aV";
+		static const char short_options[] = "hb:mnNoOpqs:akV";
 		static const struct option long_options[] = {
 			/* Order of these args with val==0 matters; see option_index. */
 			{"version", no_argument, 0, 'V'},
@@ -119,6 +121,7 @@ static void process_options(int argc, char * const argv[])
 			{"quiet", no_argument, 0, 'q'},
 			{"start", required_argument, 0, 's'},
 			{"autoplace", no_argument, 0, 'a'},
+			{"skip-all-ffs", no_argument, 0, 'k'},
 			{0, 0, 0, 0},
 		};
 
@@ -172,6 +175,9 @@ static void process_options(int argc, char * const argv[])
 		case 'a':
 			autoplace = true;
 			break;
+		case 'k':
+			skipallffs = true;
+			break;
 		case 'h':
 			display_help(EXIT_SUCCESS);
 			break;
@@ -230,6 +236,8 @@ static void erase_buffer(void *buffer, size_t size)
  */
 int main(int argc, char * const argv[])
 {
+	int allffs;
+	int ii;
 	int fd = -1;
 	int ifd = -1;
 	int pagelen;
@@ -515,14 +523,29 @@ int main(int argc, char * const argv[])
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


--------------20840417D8206E06E252BE5C--
