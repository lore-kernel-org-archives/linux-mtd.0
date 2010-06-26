Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OSJjg-00054i-0J
	for linux-mtd@lists.infradead.org; Sat, 26 Jun 2010 00:59:09 +0000
From: "Brian Norris" <norris@broadcom.com>
To: "Artem Bityutskiy" <Artem.Bityutskiy@nokia.com>
Subject: [PATCH 1/2] mtd-utils: formatting of odd-sized OOB in nanddump
Date: Fri, 25 Jun 2010 17:58:03 -0700
Message-ID: <1277513884-14715-1-git-send-email-norris@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Changed OOB output formatting in nanddump.
Most NAND devices have OOB regions with multiples of 16 bytes.
With newer devices, a 218-byte OOB does not split nicely into
lines of 16 bytes. This patch fixes the formatting, allowing a
last line of 10 bytes instead of 16.

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 nanddump.c |   31 ++++++++++++++++++++++---------
 1 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index e44ab36..190a653 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -381,15 +381,28 @@ int main(int argc, char * const argv[])
 			}
 
 			for (i = 0; i < meminfo.oobsize; i += 16) {
-				sprintf(pretty_buf, "  OOB Data: %02x %02x %02x %02x %02x %02x "
-						"%02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n",
-						oobbuf[i], oobbuf[i+1], oobbuf[i+2],
-						oobbuf[i+3], oobbuf[i+4], oobbuf[i+5],
-						oobbuf[i+6], oobbuf[i+7], oobbuf[i+8],
-						oobbuf[i+9], oobbuf[i+10], oobbuf[i+11],
-						oobbuf[i+12], oobbuf[i+13], oobbuf[i+14],
-						oobbuf[i+15]);
-				write(ofd, pretty_buf, 60);
+				/* Check if we have a full 16 bytes left in the OOB */
+				if (i+15 < meminfo.oobsize) {
+					/* Print 16 bytes */
+					sprintf(pretty_buf, "  OOB Data: %02x %02x %02x %02x %02x %02x "
+							"%02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n",
+							oobbuf[i], oobbuf[i+1], oobbuf[i+2],
+							oobbuf[i+3], oobbuf[i+4], oobbuf[i+5],
+							oobbuf[i+6], oobbuf[i+7], oobbuf[i+8],
+							oobbuf[i+9], oobbuf[i+10], oobbuf[i+11],
+							oobbuf[i+12], oobbuf[i+13], oobbuf[i+14],
+							oobbuf[i+15]);
+					write(ofd, pretty_buf, 60);
+				} else {
+					/* Print 10 bytes */
+					sprintf(pretty_buf, "  OOB Data: %02x %02x %02x %02x %02x %02x "
+							"%02x %02x %02x %02x\n",
+							oobbuf[i], oobbuf[i+1], oobbuf[i+2],
+							oobbuf[i+3], oobbuf[i+4], oobbuf[i+5],
+							oobbuf[i+6], oobbuf[i+7], oobbuf[i+8],
+							oobbuf[i+9]);
+					write(ofd, pretty_buf, 42);
+				}
 			}
 		} else
 			write(ofd, oobbuf, meminfo.oobsize);
-- 
1.7.1
