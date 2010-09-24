Received: from tyo202.gate.nec.co.jp ([202.32.8.206])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oz4V9-00024v-Hx
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 09:23:33 +0000
Received: from mailgate3.nec.co.jp ([10.7.69.197])
	by tyo202.gate.nec.co.jp (8.13.8/8.13.4) with ESMTP id o8O9NSQG004842
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Sep 2010 18:23:28 +0900 (JST)
Received: (from root@localhost) by mailgate3.nec.co.jp
	(8.11.7/3.7W-MAILGATE-NEC)
	id o8O9NSx11350 for linux-mtd@lists.infradead.org;
	Fri, 24 Sep 2010 18:23:28 +0900 (JST)
Received: from relay41.aps.necel.com ([10.29.19.9])
	by vgate02.nec.co.jp (8.14.4/8.14.4) with ESMTP id o8O8xkF6029205
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Sep 2010 18:23:27 +0900 (JST)
Message-ID: <4C9C6DED.5040200@renesas.com>
Date: Fri, 24 Sep 2010 18:22:53 +0900
From: Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] nandwrite: Remove redundant 'autoplace' check
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: shinya.kuribayashi.px@renesas.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We're already in 'if (autoplace) { }' block at ths moment.

Signed-off-by: Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>
---

 Along with Mike's nandwrite patches, I'd like to toss out a trivial
 one, too ;-)

 nandwrite.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index 8fe8875..9eb2004 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -331,7 +331,7 @@ int main(int argc, char * const argv[])
 		}
 
 		// autoplace ECC ?
-		if (autoplace && (old_oobinfo.useecc != MTD_NANDECC_AUTOPLACE)) {
+		if (old_oobinfo.useecc != MTD_NANDECC_AUTOPLACE) {
 
 			if (ioctl (fd, MEMSETOOBSEL, &autoplace_oobinfo) != 0) {
 				perror ("MEMSETOOBSEL");
-- 
1.7.2.3
-- 
Shinya Kuribayashi
Renesas Electronics
