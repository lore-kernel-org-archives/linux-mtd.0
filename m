Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDYjt-0007lN-6o
	for linux-mtd@lists.infradead.org; Wed, 03 Nov 2010 08:30:38 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 07/10] mtd-utils: nandwrite: avoid NULL buffer pointers
Date: Wed, 3 Nov 2010 01:27:24 -0700
Message-ID: <1288772847-8120-7-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1288772847-8120-1-git-send-email-computersforpeace@gmail.com>
References: <1288772847-8120-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, Jehan Bing <jehan@orb.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 07005d915d6a79dbdee14b0c4360df5058c3a98b made changes to the
buffer allocation in nandwrite and did not handle all affected code
areas properly. In particular, we were assigning:
	oob.ptr = noecc ? oobreadbuf : oobbuf;
However, since oobreadbuf and oobbuf are declared dynamically, they
are NULL at this point. If they aren't properly assigned later, we
unwittingly are passing a NULL pointer as oob buffer.

This assignment line is best moved after the buffer allocations and
pointer assignment.

Effects of this problem can be seen when writing oob data with the "-o"
flag and without the "-n" flag:
	$ ./nandwrite -o /dev/mtd0 img.bin
	Writing data to block 0 at offset 0x0
	ioctl(MEMWRITEOOB): Bad address
	Data was only partially written due to error
	: Bad address

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandwrite.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index b362c29..8ec5afe 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -391,7 +391,6 @@ int main(int argc, char * const argv[])
 	}
 
 	oob.length = mtd.oob_size;
-	oob.ptr = noecc ? oobreadbuf : oobbuf;
 
 	/* Determine if we are reading from standard input or from a file. */
 	if (strcmp(img, standard_input) == 0) {
@@ -594,9 +593,7 @@ int main(int argc, char * const argv[])
 				}
 			}
 
-			if (noecc) {
-				oob.ptr = oobreadbuf;
-			} else {
+			if (!noecc) {
 				int i, start, len;
 				int tags_pos = 0;
 				/*
@@ -630,6 +627,7 @@ int main(int argc, char * const argv[])
 			}
 			/* Write OOB data first, as ecc will be placed in there */
 			oob.start = mtdoffset;
+			oob.ptr = noecc ? oobreadbuf : oobbuf;
 			if (ioctl(fd, MEMWRITEOOB, &oob) != 0) {
 				perror("ioctl(MEMWRITEOOB)");
 				goto closeall;
-- 
1.7.0.4
