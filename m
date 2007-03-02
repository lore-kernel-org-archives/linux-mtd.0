Received: from mtagate7.uk.ibm.com ([195.212.29.140])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HN51t-0002Pk-49
	for linux-mtd@lists.infradead.org; Fri, 02 Mar 2007 05:30:29 -0500
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate7.uk.ibm.com (8.13.8/8.13.8) with ESMTP id l22ATb8L164898
	for <linux-mtd@lists.infradead.org>; Fri, 2 Mar 2007 10:29:37 GMT
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com
	[9.149.37.213])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v8.2) with
	ESMTP id l22ATaFi1171480
	for <linux-mtd@lists.infradead.org>; Fri, 2 Mar 2007 10:29:36 GMT
Received: from d06av03.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av03.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l22ATaq5029812
	for <linux-mtd@lists.infradead.org>; Fri, 2 Mar 2007 10:29:36 GMT
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: Artem <dedekind@infradead.org>
Subject: [PATCH] [MTD] UBI: fix peb scan
Date: Fri, 2 Mar 2007 11:29:30 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200703021129.30577.alexs@linux.vnet.ibm.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

Volumes containing only one PEB got a wrong vtr->last_eb_bytes.

Signed-off-by: Alexander Schmidt <alexs@linux.vnet.ibm.com>
---
 drivers/mtd/ubi/scan.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

--- dedekind-ubi-2.6.orig/drivers/mtd/ubi/scan.c
+++ dedekind-ubi-2.6/drivers/mtd/ubi/scan.c
@@ -588,7 +588,7 @@ int ubi_scan_add_peb(const struct ubi_in
 	seb->scrub = bitflips;
 	seb->leb_ver = leb_ver;
 
-	if (sv->highest_lnum < lnum) {
+	if (sv->highest_lnum <= lnum) {
 		sv->highest_lnum = lnum;
 		sv->last_data_size = ubi32_to_cpu(vid_hdr->data_size);
 	}
