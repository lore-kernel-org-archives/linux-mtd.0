Received: from avasout06.plus.net ([212.159.14.18])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cHE5u-0005yK-Dt
 for linux-mtd@lists.infradead.org; Wed, 14 Dec 2016 18:15:59 +0000
Date: Wed, 14 Dec 2016 18:15:31 +0000
From: Mike Crowe <mac@mcrowe.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/2] Support skipping a certain number of good blocks
Message-ID: <20161214181531.GA31010@mcrowe.com>
References: <1481047457-25427-1-git-send-email-mac@mcrowe.com>
 <20161206181108.GA20416@mcrowe.com>
 <cdfdbe5d-1aa8-e424-7691-338d0d63f7b1@sigma-star.at>
 <20161207095650.GA13752@mcrowe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161207095650.GA13752@mcrowe.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 07 December 2016 at 09:56:50 +0000, Mike Crowe wrote:
> On Wednesday 07 December 2016 at 09:53:49 +0100, David Oberhollenzer wrote:
> > Since both tools already have a --start[address] option to specify an offset,
> > wouldn't it make more sense for your case to add a flag that this offset should
> > not include bad blocks? IMO this would remove the ambiguity of having two
> > different offset options.
> 
> I agree that having two options isn't exactly clear. However, being able to
> specify both a start address and a skip offset together might be useful if
> the partition table is incorrect (this may occur during upgrades to a
> bootloader version that uses a different partition table.)

I've implemented this for nandwrite and it seemed to be straightforward.
Unfortunately getopt_long requires my flag to be an int - I can change it
to bool and add code to set it explicitly if required. I was also unsure
which style to use for my variable names since the file uses a mixture of
runningwordstogether and underscore_separators.

If this solution is acceptable then I can add support to nanddump too.

Thanks.

Mike.

--8<--

Subject: [PATCH] nandwrite: Add --skip-bad-blocks-to-start option

The --skip-bad-blocks-to-start option will increase the seek offset by the
size of each bad block encountered between the start of the partition and
the specified start address.

This can be useful when writing part way through a partition that will be
read using a simple bad-block-skipping algorithm.
---
 nand-utils/nandwrite.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/nand-utils/nandwrite.c b/nand-utils/nandwrite.c
index 9602a6e..c8c7463 100644
--- a/nand-utils/nandwrite.c
+++ b/nand-utils/nandwrite.c
@@ -56,6 +56,8 @@ static void display_help(int status)
 "  -o, --oob               Input contains oob data\n"
 "  -O, --onlyoob           Input contains oob data and only write the oob part\n"
 "  -s addr, --start=addr   Set output start address (default is 0)\n"
+"  --skip-bad-blocks-to-start"
+"                          Skip bad blocks when seeking to the start address\n"
 "  -p, --pad               Pad writes to page size\n"
 "  -b, --blockalign=1|2|4  Set multiple of eraseblocks to align to\n"
 "      --input-skip=length Skip |length| bytes of the input file\n"
@@ -96,6 +98,7 @@ static bool		autoplace = false;
 static bool		skipallffs = false;
 static bool		noskipbad = false;
 static bool		pad = false;
+static int		skip_bad_blocks_to_start = false;
 static int		blockalign = 1; /* default to using actual block size */
 
 static void process_options(int argc, char * const argv[])
@@ -110,6 +113,7 @@ static void process_options(int argc, char * const argv[])
 			{"version", no_argument, 0, 'V'},
 			{"input-skip", required_argument, 0, 0},
 			{"input-size", required_argument, 0, 0},
+			{"skip-bad-blocks-to-start", no_argument, &skip_bad_blocks_to_start, 1},
 			{"help", no_argument, 0, 'h'},
 			{"blockalign", required_argument, 0, 'b'},
 			{"markbad", no_argument, 0, 'm'},
@@ -349,6 +353,25 @@ int main(int argc, char * const argv[])
 		goto closeall;
 	}
 
+	/* Skip bad blocks on the way to the start address if necessary */
+	if (skip_bad_blocks_to_start) {
+		unsigned long long bbs_offset = 0;
+		while (bbs_offset < mtdoffset) {
+			ret = mtd_is_bad(&mtd, fd, bbs_offset / ebsize_aligned);
+			if (ret < 0) {
+				sys_errmsg("%s: MTD get bad block failed", mtd_device);
+				goto closeall;
+			} else if (ret == 1) {
+				if (!quiet)
+					fprintf(stderr, "Bad block at %llx, %u block(s) "
+						"from %llx will be skipped\n",
+						bbs_offset, blockalign, bbs_offset);
+				mtdoffset += ebsize_aligned;
+			}
+			bbs_offset += ebsize_aligned;
+		}
+	}
+
 	/* Check, if length fits into device */
 	if ((imglen / pagelen) * mtd.min_io_size > mtd.size - mtdoffset) {
 		fprintf(stderr, "Image %lld bytes, NAND page %d bytes, OOB area %d"
