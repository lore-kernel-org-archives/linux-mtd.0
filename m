Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JKbMF-0001gO-Cf
	for linux-mtd@lists.infradead.org; Thu, 31 Jan 2008 15:29:49 +0000
Received: from esebh105.NOE.Nokia.com (esebh105.ntc.nokia.com [172.21.138.211])
	by mgw-mx03.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m0VFSsNo031416
	for <linux-mtd@lists.infradead.org>; Thu, 31 Jan 2008 17:29:38 +0200
Message-ID: <47A1E795.5010407@nokia.com>
Date: Thu, 31 Jan 2008 17:21:57 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH][MTD-UTILS] ubi-tools: fix ubinize
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ubinize reserves 2 eraseblocks for the volume table at the start of the
output file and then never seeked back to the start of the file.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 ubi-utils/src/ubinize.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/ubi-utils/src/ubinize.c b/ubi-utils/src/ubinize.c
index 4c3fd97..9660b09 100644
--- a/ubi-utils/src/ubinize.c
+++ b/ubi-utils/src/ubinize.c
@@ -618,6 +618,11 @@ int main(int argc, char * const argv[])
 
 	verbose(args.verbose, "writing layout volume");
 
+	if (fseek(args.fp_out, 0, SEEK_SET) == -1) {
+		errmsg("cannot seek file \"%s\"", args.f_out);
+		goto out_dict;
+	}
+
 	err = ubigen_write_layout_vol(&ui, vtbl, args.fp_out);
 	if (err) {
 		errmsg("cannot write layout volume");
-- 
1.4.4.2
