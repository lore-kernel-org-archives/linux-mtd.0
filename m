Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8618DC27C65
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZIsKasaHbFERU/ryTMp+HhpJNhGqciG2XZEkD0bxzoY=; b=g4ZQfeh5MSDrIW
	ELGzW7PCxNMPvuHPQOrMzpzFniA0aABeGHpz54URSNMkV+1z6xVFAFuRyl/zDXrWaSBJsFenki1vS
	9Jfw8ovrMTrFm/TXDyd0XOAW3z5xnJF5LZ+R/gtMCO7RQQs4ftMEFTSrISHuEHtl/mQzMmRF30HGx
	qo2QXGWWkglkpjvz+oWf8bMaZNBneb4CGl/4wSr/0s71wK1Pg3iFzjl9rOK/ME3MmEyEYgH1n1j53
	kZhLceg3WXPIxy0SO6twAXxYxm7hTOHxBI0Ydaj+0Mi8Dk+kkksXu8Oipila+fX7jMbEI0LoMGEU3
	/TpClHRxCBf2H9o2Q+OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRD4-0000000CHHw-46Sl;
	Fri, 07 Jun 2024 04:28:14 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRBp-0000000CGFI-1pnM
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:27:11 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VwShl5wbgzmYTR;
	Fri,  7 Jun 2024 12:22:15 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id A5ABF14038F;
	Fri,  7 Jun 2024 12:26:51 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:26:43 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 023/110] ubifs-utils: Add atomic implementations
Date: Fri, 7 Jun 2024 12:24:48 +0800
Message-ID: <20240607042615.2069840-24-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_212658_154659_7D5E01DB 
X-CRM114-Status: GOOD (  16.72  )
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

Add atomic implementations, because there are some atomic operations
(eg. atomic_long_xxx) used in UBIFS linux kernel libs.

This is a preparation for replacing implementation of UBIFS utils with
linux kernel libs.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/Makemodule.am   |   1 +
 ubifs-utils/common/atomic.h | 133 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 ubifs-utils/common/atomic.h

diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index 13171b74..58162579 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -2,6 +2,7 @@ common_SOURCES = \
 	ubifs-utils/common/compiler_attributes.h \
 	ubifs-utils/common/linux_types.h \
 	ubifs-utils/common/linux_err.h \
+	ubifs-utils/common/atomic.h \
 	ubifs-utils/common/kmem.h \
 	ubifs-utils/common/kmem.c \
 	ubifs-utils/common/defs.h \
diff --git a/ubifs-utils/common/atomic.h b/ubifs-utils/common/atomic.h
new file mode 100644
index 00000000..f287d435
--- /dev/null
+++ b/ubifs-utils/common/atomic.h
@@ -0,0 +1,133 @@
+//Source: http://golubenco.org/atomic-operations.html
+#ifndef __ATOMIC_H__
+#define __ATOMIC_H__
+
+/* Check GCC version, just to be safe */
+#if !defined(__GNUC__) || (__GNUC__ < 4) || (__GNUC_MINOR__ < 1)
+# error atomic.h works only with GCC newer than version 4.1
+#endif /* GNUC >= 4.1 */
+
+/**
+ * Atomic type.
+ */
+typedef struct {
+	volatile long counter;
+} atomic_long_t;
+
+#define ATOMIC_INIT(i)  { (i) }
+
+/**
+ * Read atomic variable
+ * @param v pointer of type atomic_long_t
+ *
+ * Atomically reads the value of @v.
+ */
+#define atomic_long_read(v) ((v)->counter)
+
+/**
+ * Set atomic variable
+ * @param v pointer of type atomic_long_t
+ * @param i required value
+ */
+#define atomic_long_set(v,i) (((v)->counter) = (i))
+
+/**
+ * Add to the atomic variable
+ * @param i integer value to add
+ * @param v pointer of type atomic_long_t
+ */
+static inline void atomic_long_add( int i, atomic_long_t *v )
+{
+	(void)__sync_add_and_fetch(&v->counter, i);
+}
+
+/**
+ * Subtract the atomic variable
+ * @param i integer value to subtract
+ * @param v pointer of type atomic_long_t
+ *
+ * Atomically subtracts @i from @v.
+ */
+static inline void atomic_long_sub( int i, atomic_long_t *v )
+{
+	(void)__sync_sub_and_fetch(&v->counter, i);
+}
+
+/**
+ * Subtract value from variable and test result
+ * @param i integer value to subtract
+ * @param v pointer of type atomic_long_t
+ *
+ * Atomically subtracts @i from @v and returns
+ * true if the result is zero, or false for all
+ * other cases.
+ */
+static inline int atomic_long_sub_and_test( int i, atomic_long_t *v )
+{
+	return !(__sync_sub_and_fetch(&v->counter, i));
+}
+
+/**
+ * Increment atomic variable
+ * @param v pointer of type atomic_long_t
+ *
+ * Atomically increments @v by 1.
+ */
+static inline void atomic_long_inc( atomic_long_t *v )
+{
+	(void)__sync_fetch_and_add(&v->counter, 1);
+}
+
+/**
+ * @brief decrement atomic variable
+ * @param v: pointer of type atomic_long_t
+ *
+ * Atomically decrements @v by 1.  Note that the guaranteed
+ * useful range of an atomic_long_t is only 24 bits.
+ */
+static inline void atomic_long_dec( atomic_long_t *v )
+{
+	(void)__sync_fetch_and_sub(&v->counter, 1);
+}
+
+/**
+ * @brief Decrement and test
+ * @param v pointer of type atomic_long_t
+ *
+ * Atomically decrements @v by 1 and
+ * returns true if the result is 0, or false for all other
+ * cases.
+ */
+static inline int atomic_long_dec_and_test( atomic_long_t *v )
+{
+	return !(__sync_sub_and_fetch(&v->counter, 1));
+}
+
+/**
+ * @brief Increment and test
+ * @param v pointer of type atomic_long_t
+ *
+ * Atomically increments @v by 1
+ * and returns true if the result is zero, or false for all
+ * other cases.
+ */
+static inline int atomic_long_inc_and_test( atomic_long_t *v )
+{
+	return !(__sync_add_and_fetch(&v->counter, 1));
+}
+
+/**
+ * @brief add and test if negative
+ * @param v pointer of type atomic_long_t
+ * @param i integer value to add
+ *
+ * Atomically adds @i to @v and returns true
+ * if the result is negative, or false when
+ * result is greater than or equal to zero.
+ */
+static inline int atomic_long_add_negative( int i, atomic_long_t *v )
+{
+	return (__sync_add_and_fetch(&v->counter, i) < 0);
+}
+
+#endif
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
