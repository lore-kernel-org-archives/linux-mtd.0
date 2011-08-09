Received: from na3sys009aog116.obsmtp.com ([74.125.149.240])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QqtMq-0000T3-SU
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2011 20:57:42 +0000
Received: by mail-vx0-f181.google.com with SMTP id 39so411754vxi.12
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Aug 2011 13:57:36 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] nandtest: print number of bits corrected during test
Date: Tue,  9 Aug 2011 16:57:28 -0400
Message-Id: <f46b9092828dde57ea4bb4ce661c4f15ff2e0888.1312922073.git.bengardiner@nanometrics.ca>
In-Reply-To: <e51a260aa56112648b5413c66d4036e489ae09f7.1312922073.git.bengardiner@nanometrics.ca>
References: <e51a260aa56112648b5413c66d4036e489ae09f7.1312922073.git.bengardiner@nanometrics.ca>
In-Reply-To: <cover.1312922073.git.bengardiner@nanometrics.ca>
References: <cover.1312922073.git.bengardiner@nanometrics.ca>
Cc: Ben Gardiner <bengardiner@nanometrics.ca>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The nandtest program monitors the corrected ecc stat to determine if an
ECC correction has taken place during the last write-read. If so, it
prints "ECC corrected".

The mtd subsytem will store the number of bits corrected in the corrected
ecc stat so update the nandtest output to print also the number of bits
corrected when performing the test.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
---
 nandtest.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/nandtest.c b/nandtest.c
index d03dc11..dc28d09 100644
--- a/nandtest.c
+++ b/nandtest.c
@@ -98,7 +98,9 @@ int erase_and_write(loff_t ofs, unsigned char *data, unsigned char *rbuf)
 	}
 
 	if (newstats.corrected > oldstats.corrected) {
-		printf("\nECC corrected at %08x\n", (unsigned) ofs);
+		printf("\n %d bit(s) ECC corrected at %08x\n",
+				newstats.corrected - oldstats.corrected,
+				(unsigned) ofs);
 		oldstats.corrected = newstats.corrected;
 	}
 	if (newstats.failed > oldstats.failed) {
-- 
1.7.3.5
