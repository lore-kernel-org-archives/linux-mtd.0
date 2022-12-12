Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19837C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Dec 2022 18:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZUFptJvCmxmLgQodZr6qRZ7Bw1XZ4IMYDUuIw2typJo=; b=ddeJBaAlUlrQDI
	6hOLlwQYRZl6Emf8SNoNqO04UDU7k+KwZdXbg9uNOUYyhfZa+c8bwXJk6ffxCdtOYwtz/8s5LK+8H
	kj5qS7vJG4vmyW/TTo6iSlfwDQEHLpq1umEmC3hojV78dBT2kRMBwfcPX+LlDGOjdNuEcFL4IF7Uq
	qpiw2OPnU+cFDB4ulzC6SbVnNZ6/QVFAba8S7vA/iJulnIZAhmkzhTLS7O6So5ZwcB758takL5sIn
	5pYzLjlt0wpceBaw0qBYRvF90eU7JVIkCz6Ikqli/SrcZPLhEODiTWCwMU5Tt4C09VkXsOyTGdAeP
	t8h49OsieD7t+qV9soCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4n8F-003OcI-Uo; Mon, 12 Dec 2022 18:02:27 +0000
Received: from mx0b-00105401.pphosted.com ([67.231.152.184] helo=mx0a-00105401.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4n8C-003OWt-Nl
	for linux-mtd@lists.infradead.org; Mon, 12 Dec 2022 18:02:26 +0000
Received: from pps.filterd (m0081755.ppops.net [127.0.0.1])
	by mx0b-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 2BCHwUN3045791;
	Mon, 12 Dec 2022 18:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=bBAN1PGlfNqdwz57J+l7D/AqdaGoH7YC6LCfXRgW8Wg=;
 b=pW2ysjevg5ZYrLZrXlv5dagm+8dz0fUDe6is6lIzlXKHYfrd7f4vtvIRqaHoHEfLjrt0
 jPoMBssxpYeAOk6DEevdjAZUgkXuB6FuhCGE0nlk42oQLqaSS8C9aOI5beXDSu4BNILD
 FFw2G4bsA5wyQBqtH5nxyS8XjDV8VHGgJnarOYJt1xCt1f+NCBgCjj9jxI/DbJHQxFG+
 ef1g1mVeX5COOuScSlS5nDO336CSbmKXLMl0BGP0NO7AF6m0tgVe/LAkx4LlgbvkiXt6
 StE5W2bcsygKHFQvLdZ+kF5qqf1zJumvFp+Bhq12sNjUB14r2w3iE011LP+rLskzdcOm gw== 
Received: from xmnpv38.utc.com ([167.17.239.12])
	by mx0b-00105401.pphosted.com with ESMTP id 3md3sepgbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Dec 2022 18:02:15 +0000
Received: from qusnwafe.utcapp.com (qusnwafe.utcapp.com [10.161.48.101])
	by xmnpv38.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 2BCI2E45129599
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Dec 2022 18:02:14 GMT
Received: from dtulimr02.rockwellcollins.com ([10.172.224.19])
	by qusnwafe.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 2BCI2D5l024458
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 12 Dec 2022 18:02:14 GMT
X-Received: from kirk.rockwellcollins.lab (kirk.rockwellcollins.lab [10.148.204.208])
	by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id B251E20068;
	Mon, 12 Dec 2022 12:02:13 -0600 (CST)
From: Brandon Maier <brandon.maier@collins.com>
To: MTD Mailing List <linux-mtd@lists.infradead.org>
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
        Brandon Maier <brandon.maier@collins.com>
Subject: [PATCH mtd-utils 1/2] libmtd: Add function to get MTD info by device name
Date: Mon, 12 Dec 2022 12:01:57 -0600
Message-Id: <20221212180158.57833-2-brandon.maier@collins.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20221212180158.57833-1-brandon.maier@collins.com>
References: <20221212180158.57833-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-GUID: OKSPinePCPlae_ZCxrOSBwpiBMirFxAH
X-Proofpoint-ORIG-GUID: OKSPinePCPlae_ZCxrOSBwpiBMirFxAH
X-Proofpoint-Spam-Details: rule=outbound_default_notspam policy=outbound_default score=0 clxscore=1011
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_100224_922621_9101413B 
X-CRM114-Status: GOOD (  23.76  )
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

This is a convenience function for end users. In some situations it's
easier to reference MTD device's by their name then by MTD number, as
the name may be more reliable if device partitioning is dynamic or for
porting between systems.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 include/libmtd.h    | 13 ++++++++-
 lib/libmtd.c        | 68 ++++++++++++++++++++++++++++++++++++++++++++-
 lib/libmtd_int.h    |  1 +
 lib/libmtd_legacy.c | 38 +++++++++++++++++++++++++
 4 files changed, 118 insertions(+), 2 deletions(-)

diff --git a/include/libmtd.h b/include/libmtd.h
index 6ab0de5..f909a16 100644
--- a/include/libmtd.h
+++ b/include/libmtd.h
@@ -130,7 +130,7 @@ int mtd_get_info(libmtd_t desc, struct mtd_info *info);
 /**
  * mtd_get_dev_info - get information about an MTD device.
  * @desc: MTD library descriptor
- * @node: name of the MTD device node
+ * @node: path of the MTD device node
  * @mtd: the MTD device information is returned here
  *
  * This function gets information about MTD device defined by the @node device
@@ -151,6 +151,17 @@ int mtd_get_dev_info(libmtd_t desc, const char *node, struct mtd_dev_info *mtd);
  */
 int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd);
 
+/**
+ * mtd_get_dev_info2 - get information about an MTD device.
+ * @desc: MTD library descriptor
+ * @name: name of the MTD device
+ * @mtd: the MTD device information is returned here
+ *
+ * This function is identical to 'mtd_get_dev_info()' except that it accepts
+ * MTD device's name, not MTD character device.
+ */
+int mtd_get_dev_info2(libmtd_t desc, const char *name, struct mtd_dev_info *mtd);
+
 /**
  * mtd_lock - lock eraseblocks.
  * @desc: MTD library descriptor
diff --git a/lib/libmtd.c b/lib/libmtd.c
index 4aee947..f588e09 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -427,7 +427,7 @@ static int type_str2int(const char *str)
 /**
  * dev_node2num - find MTD device number by its character device node.
  * @lib: MTD library descriptor
- * @node: name of the MTD device node
+ * @node: path of the MTD device node
  * @mtd_num: MTD device number is returned here
  *
  * This function returns %0 in case of success and %-1 in case of failure.
@@ -476,6 +476,58 @@ static int dev_node2num(struct libmtd *lib, const char *node, int *mtd_num)
 	return -1;
 }
 
+/**
+ * dev_name2num - find MTD device number by its MTD name
+ * @lib: MTD library descriptor
+ * @name: name of the MTD device
+ * @mtd_num: MTD device number is returned here
+ *
+ * This function returns %0 in case of success and %-1 in case of failure.
+ */
+static int dev_name2num(struct libmtd *lib, const char *name, int *mtd_num)
+{
+	struct mtd_info info;
+	char name2[MTD_NAME_MAX + 1];
+	int i, mtd_num_tmp = -1;
+
+	if (mtd_get_info((libmtd_t *)lib, &info))
+		return -1;
+
+	for (i = info.lowest_mtd_num; i <= info.highest_mtd_num; i++) {
+		int ret;
+
+		ret = dev_read_data(lib->mtd_name, i, name2,
+				    MTD_NAME_MAX + 1);
+		if (ret < 0) {
+			if (errno == ENOENT)
+				continue;
+			if (!errno)
+				break;
+			return -1;
+		}
+		name2[ret - 1] = '\0';
+
+		if (!strcmp(name, name2)) {
+			// Device name collision
+			if (mtd_num_tmp >= 0) {
+				errmsg("Multiple MTD's found matching name %s", name);
+				errno = ENODEV;
+				return -1;
+			}
+
+			mtd_num_tmp = i;
+		}
+	}
+
+	if (mtd_num_tmp < 0) {
+		errno = ENODEV;
+		return -1;
+	}
+
+	*mtd_num = mtd_num_tmp;
+	return 0;
+}
+
 /**
  * sysfs_is_supported - check whether the MTD sub-system supports MTD.
  * @lib: MTD library descriptor
@@ -817,6 +869,20 @@ int mtd_get_dev_info(libmtd_t desc, const char *node, struct mtd_dev_info *mtd)
 	return mtd_get_dev_info1(desc, mtd_num, mtd);
 }
 
+int mtd_get_dev_info2(libmtd_t desc, const char *name, struct mtd_dev_info *mtd)
+{
+	int mtd_num;
+	struct libmtd *lib = (struct libmtd *)desc;
+
+	if (!lib->sysfs_supported)
+		return legacy_get_dev_info2(name, mtd);
+
+	if (dev_name2num(lib, name, &mtd_num))
+		return -1;
+
+	return mtd_get_dev_info1(desc, mtd_num, mtd);
+}
+
 static inline int mtd_ioctl_error(const struct mtd_dev_info *mtd, int eb,
 				  const char *sreq)
 {
diff --git a/lib/libmtd_int.h b/lib/libmtd_int.h
index c0514d2..79200f7 100644
--- a/lib/libmtd_int.h
+++ b/lib/libmtd_int.h
@@ -106,6 +106,7 @@ int legacy_dev_present(int mtd_num);
 int legacy_mtd_get_info(struct mtd_info *info);
 int legacy_get_dev_info(const char *node, struct mtd_dev_info *mtd);
 int legacy_get_dev_info1(int dev_num, struct mtd_dev_info *mtd);
+int legacy_get_dev_info2(const char *name, struct mtd_dev_info *mtd);
 int legacy_get_mtd_oobavail(const char *node);
 int legacy_get_mtd_oobavail1(int mtd_num);
 
diff --git a/lib/libmtd_legacy.c b/lib/libmtd_legacy.c
index 4eb4a70..e0ecf49 100644
--- a/lib/libmtd_legacy.c
+++ b/lib/libmtd_legacy.c
@@ -428,3 +428,41 @@ int legacy_get_dev_info1(int mtd_num, struct mtd_dev_info *mtd)
 	sprintf(node, MTD_DEV_PATT, mtd_num);
 	return legacy_get_dev_info(node, mtd);
 }
+
+/**
+ * legacy_get_dev_info2 - legacy version of `mtd_get_dev_info2()`
+ * @name: name of the MTD device
+ * @mtd: the MTD device information is returned here
+ *
+ * This function is similar to 'mtd_get_dev_info2()' and has the same
+ * conventions.
+ */
+int legacy_get_dev_info2(const char *name, struct mtd_dev_info *mtd)
+{
+	struct proc_parse_info pi;
+	int ret, mtd_num = -1;
+
+	ret = proc_parse_start(&pi);
+	if (ret)
+		return -1;
+
+	while (proc_parse_next(&pi)) {
+		if (!strcmp(name, pi.name)) {
+			// Device name collision
+			if (mtd_num >= 0) {
+				errmsg("Multiple MTD's found matching name %s", name);
+				errno = ENODEV;
+				return -1;
+			}
+
+			mtd_num = pi.mtd_num;
+		}
+	}
+
+	if (mtd_num < 0) {
+		errno = ENODEV;
+		return -1;
+	}
+
+	return legacy_get_dev_info1(mtd_num, mtd);
+}
-- 
2.38.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
