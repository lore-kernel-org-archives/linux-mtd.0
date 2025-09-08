Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBDBCA1013
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Sep 2025 07:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k/cv+prxw30PKDu4ipbVpqKDlAt6ezhHwMWZlSIAF1s=; b=hWvB3ntC4U6Rtx
	fm8jnod430vAqDJd8S9OW9Y4MYHwSfMjpiQ7uSrkMUt+sfrir0TNVAY+gIXU1ehr5qkx2jH+oUd/t
	KCYv6YanAOxRLsKgCwpttBmHKdsPW7loJfARCArPX0/QAR3zinc6ggIdoMuKdWZzSKXHq88cujtWQ
	a0XmOdY14yVuOTfBF8wEVQ45kgvf8a7W98anPl3kDO2U09SnzZ1rkWQ0e14sA2/0Hr7ks3qvUQHHd
	uj2rW5i8tMvNQIKqKQNK6DgynF+7tu9YG75WfzWTJDn7oduzfhYEpGdu9o403NNXQQpk5khDEAC3A
	r/sUaQhG5LhGC7D6gN2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvVwE-0000000FAQF-0KYU;
	Mon, 08 Sep 2025 07:05:18 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvVsg-0000000F97g-1MaQ
	for linux-mtd@lists.infradead.org;
	Mon, 08 Sep 2025 07:01:39 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b4f8bf49aeaso3610680a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 08 Sep 2025 00:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757314897; x=1757919697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DbaEmYlV3AOzGtE83K4L4+Dz35fmJjUox3DLoNP1Lvk=;
        b=UqKuC8HBoqAqG5PZKz3rIVao81fJSoycuqh/HnKznQ7AeyNK4PGueDR/EfHgw6rZPR
         QjlioCquepWryiPAJGTDrNrfpE97nA7R7RLDK5ArkMgwgM/tXp/Fy404fSWalgTApcyi
         1cBBS9umlJFyEvZId1cUuFx+9Y0FwwX9eB2wGuEx4yC+tIxFUW2HpohjkuAQvySgx7YN
         Y5FOgsixEAzRuvrwqe42j0o8DoOjkdzjjEnvOqRMGg1anoGumo77DUP5PGKrR4UxTYi7
         xDFfwv9oNvoT10ytxry+qgUfP2hta5fDpqN2SvLUvbofpmQJjx1lWMw/X5e/9Eiz7ISi
         Xz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757314897; x=1757919697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DbaEmYlV3AOzGtE83K4L4+Dz35fmJjUox3DLoNP1Lvk=;
        b=re0ywfR4xWggU9hKpTVEYCkmxwtFuikTov8a9ad0mvrc7bdL28YW6YCQJERn1OvUTT
         wnEUhLVGJYDvimPEWDOyhnyz3PzzXhMxaV1Proq1FZeg7KFZjeKyg1oARlZGx4XCd9Bd
         pBfq/7Bjy7LgkwSDiGcfVkKfPyQLdxvbEqmCoxlPa0WJ6q393HaU0LxFU5ch/z0nj7XG
         4tDUKsT+mugJlbqLHlaQtPyDpmBCevskI48+GdtZqW7IV434cOz04IqEziaVeaKHPrht
         oovwzJDCqE+cA4qJiaYiOUxZwv5MmW1hSLxkgMeG/7EVBExo14m0IoF4CwnK8wKUkPbq
         KPvA==
X-Gm-Message-State: AOJu0Yxr7dvfxeSk3gq/Gqs7TzXoKsSsyg63n62tciIxTa3ihwXhvuul
	sMTT5IZWXNM1JzTX5j53YY3dTpw6mZwk3Hokx7+q6inqEhant1FwQ3ay
X-Gm-Gg: ASbGncv/oh1zTBnCNfFMt0jBg74DiqiZ0guEft3m9elrp2v4uOhY7z8kU6yHZZYU3w4
	IwdRy7au4zPZC61MiHfm9rRH8/gioQbLz9y5r5bdK8UIPceIz2sCGem2qLphBoSE7cWH6npLsjF
	oyrd9uQqJpyODcHfEZE128ZpIcYdzLAenCfduE5NciIcjIwbpCOhGtfMzWgdWI4USXQ7Nu+QjoL
	o3jbYCNETpcAHA2bufVNXVDDNHj6gNpiadBUlrBpLg6ZLgUC5pe9ho9WL8i293E5GbN+soFu6O0
	Lyjx6LDHnGcRqRgVveiedoPnMQDjp78ZNpTT0w8kryxUbH5By/ZVkzjB6zUwPPKxzPj2Q/hY2U8
	vAbU14tLmK1iCH3WJC1jQTNxzb4c8eAevkqb0HOIHGKWRREDL5J3hjKUazQ==
X-Google-Smtp-Source: AGHT+IGc7TXpRM7rIBs/KpzQNu08oMaqlYYUm4E8f4HgHjSp2FZ4vFD+byutu6dJUmsCyMjNMiob/Q==
X-Received: by 2002:a17:90b:2d81:b0:32c:7693:1155 with SMTP id 98e67ed59e1d1-32d43f2f29amr8015933a91.1.1757314896992;
        Mon, 08 Sep 2025 00:01:36 -0700 (PDT)
Received: from localhost.localdomain ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32d89f32ebfsm1705683a91.0.2025.09.08.00.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 00:01:36 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	rk0006818@gmail.com,
	Pratyush Yadav <pratyush@kernel.org>
Subject: [PATCH v2] mtd: sm_ftl: replace strncpy with memcpy
Date: Mon,  8 Sep 2025 12:31:24 +0530
Message-ID: <20250908070124.2647038-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_000138_361826_C3444069 
X-CRM114-Status: GOOD (  13.47  )
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

Replace strncpy with memcpy in sm_attr_show and explicitly add a NUL
terminator after the copy. Also update the return value to reflect the
extra byte written for the terminator. This aligns with current kernel
best practices as strncpy is deprecated for such use, as explained in
Documentation/process/deprecated.rst.

No functional change, only cleanup for consistency.

Suggested-by: Pratyush Yadav <pratyush@kernel.org>
Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
Changes in v1:
- Update return value to match the extra NUL written.
Link to v1: https://lore.kernel.org/all/mafs0ms7bvcd2.fsf@kernel.org/T/#t
---
 drivers/mtd/sm_ftl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index d28d4f1790f5..3c5d6d0c728f 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -44,8 +44,9 @@ static ssize_t sm_attr_show(struct device *dev, struct device_attribute *attr,
 	struct sm_sysfs_attribute *sm_attr =
 		container_of(attr, struct sm_sysfs_attribute, dev_attr);
 
-	strncpy(buf, sm_attr->data, sm_attr->len);
-	return sm_attr->len;
+	memcpy(buf, sm_attr->data, sm_attr->len);
+	buf[sm_attr->len] = '\0';
+	return sm_attr->len + 1;
 }
 
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
