Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AA3C4345F
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2024 20:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=849C6rPNO43RuPq/r0u9elk8Vv875jJ/XrTCvfkpPiY=; b=01lhoJh821oI4L
	Fcnw5MFPu2bvJ++zVhISbtcR6iYT/yOxkvXvTeQOJFMWRgsFLfHx2cDWnbrda+0LGNM9oA6brYgBk
	PGhxaI/SCd8su/hsedsztscIuZGtHcgKxCl1fbOV+BtRFIQB8f0n9BUgn5oVopZuu+fxN2B84/98R
	UHl09kRLkBOprrcajFCEW+ua5luhz12FYNvl874iKIj1gnNhZhCuuA5UgQNlOPW4TVemWdBxSGjwF
	jbjvYe9t6/vOfHtiG81NkuHIr2lThMviCPfMV0SciramfusYtWSKpACVjkLqHzg+hG2avfrWdzh+P
	Mh1TjR5+WyQ0tt1C7+OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2crc-0000000DpJF-3VwE;
	Thu, 02 May 2024 20:17:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2crZ-0000000DpGz-1jk9
	for linux-mtd@lists.infradead.org;
	Thu, 02 May 2024 20:17:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 442Diu4v014399;
	Thu, 2 May 2024 20:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:to:cc; s=qcppdkim1; bh=s3c
	hDQOo+tPipRQL0+QuH7LkgscBLH/TgsRVja2GR4s=; b=nGbUYAhsCuZfzhXlOmf
	R99NhUyDSFSOzLL58xrPgBVRH8xYFDR8wMKAjJE50hWqgpUkY8wZmWsqYfl8/PNV
	8kbwzUp146blZdw5T51CuXQschtebA/fF+tsWcq+hAVszqoh/6s2dm4+5RdrnmXC
	8biA6jeCGO0u1eZ7UEn2hlhbwglynhQbrME7ZX66KFCSm68L+7m9tKk0M6zeL4xx
	QjBRO6AdNnuz2eDVRT5kA7KA/T/w9zsMXFFEl1S6PK53JecRJ6Sv/jxD+2P/HmRf
	xZkRtoDwbgaAX9W5YnddmoVDuqUOqGzRcaf41ii+pGTjK1WbRTNtb3Wn9PiMcs/f
	E+g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xv6q0skb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 May 2024 20:16:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 442KGvta027282
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 May 2024 20:16:57 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 2 May 2024
 13:16:56 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Thu, 2 May 2024 13:16:55 -0700
Subject: [PATCH] ubifs: fix kernel-doc warnings
MIME-Version: 1.0
Message-ID: <20240502-ubifs-kdoc-v1-1-59c35a325141@quicinc.com>
X-B4-Tracking: v=1; b=H4sIALb0M2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUwMj3dKkzLRi3eyU/GRdg1QDc4u05DRzS0NzJaCGgqLUtMwKsGHRsbW
 1AEIrgIpcAAAA
To: Richard Weinberger <richard@nod.at>,
        Zhihao Cheng
	<chengzhihao1@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RUrIjTeK6LkW3D9-HtP-bizJM07yAN3J
X-Proofpoint-GUID: RUrIjTeK6LkW3D9-HtP-bizJM07yAN3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-02_12,2024-05-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 adultscore=0 clxscore=1011
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405020133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_131705_547956_43B2FFCE 
X-CRM114-Status: GOOD (  17.93  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

make C=1 reports the following kernel-doc warnings:

fs/ubifs/compress.c:103: warning: Function parameter or struct member 'c' not described in 'ubifs_compress'
fs/ubifs/compress.c:155: warning: Function parameter or struct member 'c' not described in 'ubifs_decompress'
fs/ubifs/find.c:353: warning: Excess function parameter 'data' description in 'scan_for_free_cb'
fs/ubifs/find.c:353: warning: Function parameter or struct member 'arg' not described in 'scan_for_free_cb'
fs/ubifs/find.c:594: warning: Excess function parameter 'data' description in 'scan_for_idx_cb'
fs/ubifs/find.c:594: warning: Function parameter or struct member 'arg' not described in 'scan_for_idx_cb'
fs/ubifs/find.c:786: warning: Excess function parameter 'data' description in 'scan_dirty_idx_cb'
fs/ubifs/find.c:786: warning: Function parameter or struct member 'arg' not described in 'scan_dirty_idx_cb'
fs/ubifs/find.c:86: warning: Excess function parameter 'data' description in 'scan_for_dirty_cb'
fs/ubifs/find.c:86: warning: Function parameter or struct member 'arg' not described in 'scan_for_dirty_cb'
fs/ubifs/journal.c:369: warning: expecting prototype for wake_up_reservation(). Prototype was for add_or_start_queue() instead
fs/ubifs/lprops.c:1018: warning: Excess function parameter 'lst' description in 'scan_check_cb'
fs/ubifs/lprops.c:1018: warning: Function parameter or struct member 'arg' not described in 'scan_check_cb'
fs/ubifs/lpt.c:1938: warning: Function parameter or struct member 'ptr' not described in 'lpt_scan_node'
fs/ubifs/replay.c:60: warning: Function parameter or struct member 'hash' not described in 'replay_entry'

Fix them.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
Note ubifs still has C=1 warnings from smatch that are not addressed:

fs/ubifs/journal.c:307:9: warning: context imbalance in '__queue_and_wait' - unexpected unlock
fs/ubifs/journal.c:322:13: warning: context imbalance in 'wait_for_reservation' - different lock contexts for basic block
fs/ubifs/journal.c:368:13: warning: context imbalance in 'add_or_start_queue' - different lock contexts for basic block
---
 fs/ubifs/compress.c | 2 ++
 fs/ubifs/find.c     | 8 ++++----
 fs/ubifs/journal.c  | 2 +-
 fs/ubifs/lprops.c   | 2 +-
 fs/ubifs/lpt.c      | 1 +
 fs/ubifs/replay.c   | 1 +
 6 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/compress.c b/fs/ubifs/compress.c
index 75461777c466..0b48cbab8a3d 100644
--- a/fs/ubifs/compress.c
+++ b/fs/ubifs/compress.c
@@ -82,6 +82,7 @@ struct ubifs_compressor *ubifs_compressors[UBIFS_COMPR_TYPES_CNT];
 
 /**
  * ubifs_compress - compress data.
+ * @c: UBIFS file-system description object
  * @in_buf: data to compress
  * @in_len: length of the data to compress
  * @out_buf: output buffer where compressed data should be stored
@@ -140,6 +141,7 @@ void ubifs_compress(const struct ubifs_info *c, const void *in_buf,
 
 /**
  * ubifs_decompress - decompress data.
+ * @c: UBIFS file-system description object
  * @in_buf: data to decompress
  * @in_len: length of the data to decompress
  * @out_buf: output buffer where decompressed data should
diff --git a/fs/ubifs/find.c b/fs/ubifs/find.c
index 6ebf3c04ac5f..643718906b9f 100644
--- a/fs/ubifs/find.c
+++ b/fs/ubifs/find.c
@@ -73,7 +73,7 @@ static int valuable(struct ubifs_info *c, const struct ubifs_lprops *lprops)
  * @c: the UBIFS file-system description object
  * @lprops: LEB properties to scan
  * @in_tree: whether the LEB properties are in main memory
- * @data: information passed to and from the caller of the scan
+ * @arg: information passed to and from the caller of the scan
  *
  * This function returns a code that indicates whether the scan should continue
  * (%LPT_SCAN_CONTINUE), whether the LEB properties should be added to the tree
@@ -340,7 +340,7 @@ int ubifs_find_dirty_leb(struct ubifs_info *c, struct ubifs_lprops *ret_lp,
  * @c: the UBIFS file-system description object
  * @lprops: LEB properties to scan
  * @in_tree: whether the LEB properties are in main memory
- * @data: information passed to and from the caller of the scan
+ * @arg: information passed to and from the caller of the scan
  *
  * This function returns a code that indicates whether the scan should continue
  * (%LPT_SCAN_CONTINUE), whether the LEB properties should be added to the tree
@@ -581,7 +581,7 @@ int ubifs_find_free_space(struct ubifs_info *c, int min_space, int *offs,
  * @c: the UBIFS file-system description object
  * @lprops: LEB properties to scan
  * @in_tree: whether the LEB properties are in main memory
- * @data: information passed to and from the caller of the scan
+ * @arg: information passed to and from the caller of the scan
  *
  * This function returns a code that indicates whether the scan should continue
  * (%LPT_SCAN_CONTINUE), whether the LEB properties should be added to the tree
@@ -773,7 +773,7 @@ int ubifs_save_dirty_idx_lnums(struct ubifs_info *c)
  * @c: the UBIFS file-system description object
  * @lprops: LEB properties to scan
  * @in_tree: whether the LEB properties are in main memory
- * @data: information passed to and from the caller of the scan
+ * @arg: information passed to and from the caller of the scan
  *
  * This function returns a code that indicates whether the scan should continue
  * (%LPT_SCAN_CONTINUE), whether the LEB properties should be added to the tree
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 74aee92433d7..f997a85bcdce 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -359,7 +359,7 @@ static void wake_up_reservation(struct ubifs_info *c)
 }
 
 /**
- * wake_up_reservation - add current task in queue or start queuing.
+ * add_or_start_queue - add current task in queue or start queuing.
  * @c: UBIFS file-system description object
  *
  * This function starts queuing if queuing is not started, otherwise adds
diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index a11c3dab7e16..8788740ec57f 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -1005,7 +1005,7 @@ void dbg_check_heap(struct ubifs_info *c, struct ubifs_lpt_heap *heap, int cat,
  * @c: the UBIFS file-system description object
  * @lp: LEB properties to scan
  * @in_tree: whether the LEB properties are in main memory
- * @lst: lprops statistics to update
+ * @arg: lprops statistics to update
  *
  * This function returns a code that indicates whether the scan should continue
  * (%LPT_SCAN_CONTINUE), whether the LEB properties should be added to the tree
diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index 778a22bf9a92..441d0beca4cf 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -1918,6 +1918,7 @@ int ubifs_lpt_init(struct ubifs_info *c, int rd, int wr)
  * @pnode: where to keep a pnode
  * @cnode: where to keep a cnode
  * @in_tree: is the node in the tree in memory
+ * @ptr: union of node pointers
  * @ptr.nnode: pointer to the nnode (if it is an nnode) which may be here or in
  * the tree
  * @ptr.pnode: ditto for pnode
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 17da28d6247a..a950c5f2560e 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -29,6 +29,7 @@
  * @lnum: logical eraseblock number of the node
  * @offs: node offset
  * @len: node length
+ * @hash: node hash
  * @deletion: non-zero if this entry corresponds to a node deletion
  * @sqnum: node sequence number
  * @list: links the replay list

---
base-commit: b8a77b9a5f9c2ba313f2beef8440b6f9f69768e7
change-id: 20240502-ubifs-kdoc-0e078fcf7917


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
