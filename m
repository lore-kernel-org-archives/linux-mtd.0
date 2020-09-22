Return-Path: <SRS0=loyI=C7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670EEC2D0E2
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Sep 2020 21:16:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D358B20715
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Sep 2020 21:16:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xk2hit5B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fishpost-de.20150623.gappssmtp.com header.i=@fishpost-de.20150623.gappssmtp.com header.b="KF7i1o4E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D358B20715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fishpost.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=23phWda3Q4qtb4YIaLui6FJ+85R28x3lumRKTa8BH9g=; b=Xk2hit5BFdefTRgyhcJtXtRq4Y
	dMqSjs9yxl9kMSmkZEaty0xOFgIkVvj3SOquKu6qsHGEqTS0Bk/9Joi37oS9ZBqR1fidUq7pUHGMh
	59jgXRCMUNVtLQsr3cVDW9lUk5ELD2K3yuawSmzkYM7gIwzg88PNnJOk8JjXNzvRQ3QtYL0HbQw1+
	D/EK3XXNQ7pWoqg7HThL83BpOP4ndse4DxEz/NSsw0icMJ3FrN3dHn/Xb/3QmnFsqZF+5Boh1xOzW
	NuH5u6INwery63+fxVmU+3OkvX5H0b9DWA/toJlwrAVrIGq21HE2KyFncUuIOd2fIhvf/kSaPfsdV
	KbMbb+fg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKpck-0002Cz-8G; Tue, 22 Sep 2020 21:14:54 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKpcg-0002C5-VK
 for linux-mtd@lists.infradead.org; Tue, 22 Sep 2020 21:14:52 +0000
Received: by mail-ej1-x641.google.com with SMTP id e23so24867487eja.3
 for <linux-mtd@lists.infradead.org>; Tue, 22 Sep 2020 14:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fishpost-de.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K8aILP0mckDUMoEiR1RpS/yOBUzdAZhoou96h2/GkBY=;
 b=KF7i1o4EH/SfUYSRFQ7QoNmQKmdOb1m6CQZBnv8XmjXSKSYFuk8AktXSIgexQdc2L8
 Jg3DKTotJgt1yiJsWcxwY515KuwQ5Wib7xnUHGHtjmACRuvE0mbD7t98AG4GSKg2dcee
 bQ/+/HzMFvS00uZpdLEa3pH4ELo9IejTdxHxqQmPhbcbBqxhXZmh45l2MkbK55k4OSlI
 7DjoeurKvMjuMrV60c3x6xIZaRED/pjeD1TJmyghITF5l93n5mZ0tgV1VNFZca8iRzG+
 24aqoWnr/DEDBl33E8aFGbSrJrejRA6LKyuneBAJgXS+N+hv6e3ZBAwzpUI50fzTCKEa
 zdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K8aILP0mckDUMoEiR1RpS/yOBUzdAZhoou96h2/GkBY=;
 b=Gcn6xz9rXqkJhhvJs2EUBxRZ47/XEhiy3WFhhbblnOcThS+znJnaOUSQ4ARuaOV0yO
 rXzGOCKqy/5QDPGtLjRNY5ZW3QBlf3yWOGNdMywGUG/mt1ZaEe+d90RtsCgutfwb+M9i
 LMp+XfdmnBKhOU898s6kRpbqr8L/JhyGL7Z4nxcUxZducTHsTCDnRW+/eklhB5+KEFJg
 7+5PLUaFyQQHVttR7Z5Ip7F/lPIJBI7OEVWiU5yEgi37Ah0xP96KYwMKqZM2hT/QM3j7
 qZ9+QBmVudS4PZwXUcFr2nnSR2f16xloHGSru/zQnIn/M2WInferposs3nIvJ0pFhOKv
 uFvQ==
X-Gm-Message-State: AOAM532/FZ1kohFY+AFQekwne6NAE1lRRx8RXbIX5eMNSKhouM30L+It
 RL2/VKy2H1qbv1uNagtcoJMcXDEp6g66BROT
X-Google-Smtp-Source: ABdhPJygC8ldsmhJsy3tjJ2AVn9qGzd0CjHCfSSwqgzqhP7MMTK+Djn/kIEgnQZsUtoZSKZTeM6R2Q==
X-Received: by 2002:a17:906:a101:: with SMTP id
 t1mr6848830ejy.203.1600809286659; 
 Tue, 22 Sep 2020 14:14:46 -0700 (PDT)
Received: from thinkbage.fritz.box
 (p200300d06f42a300a5a855abe04a2b61.dip0.t-ipconnect.de.
 [2003:d0:6f42:a300:a5a8:55ab:e04a:2b61])
 by smtp.gmail.com with ESMTPSA id r9sm11646489ejc.102.2020.09.22.14.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 14:14:46 -0700 (PDT)
From: Bastian Germann <bastiangermann@fishpost.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mkfs.ubifs: Fix build with SELinux
Date: Tue, 22 Sep 2020 23:14:37 +0200
Message-Id: <20200922211437.14699-1-bastiangermann@fishpost.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_171451_176889_912FC030 
X-CRM114-Status: GOOD (  12.43  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Bastian Germann <bastiangermann@fishpost.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In v2.1.0, SELinux support was introduced. It never compiled with ubifs
because it uses the old add_xattr signature that also changed in v2.1.0
with a1bd316e23("mkfs.ubifs: Implement fscrypto context store as xattr").

Add the ubifs_ino_node and name to the call and remove the nm that is
contructed in the new function version.

Signed-off-by: Bastian Germann <bastiangermann@fishpost.de>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index cd66d93..8211ada 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -1411,7 +1411,6 @@ static int inode_add_selinux_xattr(struct ubifs_ino_node *host_ino,
 	int ret;
 	char *sepath = NULL;
 	char *name;
-	struct qstr nm;
 	unsigned int con_size;
 
 	if (!context || !sehnd) {
@@ -1442,14 +1441,7 @@ static int inode_add_selinux_xattr(struct ubifs_ino_node *host_ino,
 	con_size = strlen(secontext) + 1;
 	name = strdup(XATTR_NAME_SELINUX);
 
-	nm.name = name;
-	nm.len = strlen(name);
-	host_ino->xattr_cnt++;
-	host_ino->xattr_size += CALC_DENT_SIZE(nm.len);
-	host_ino->xattr_size += CALC_XATTR_BYTES(con_size);
-	host_ino->xattr_names += nm.len;
-
-	ret = add_xattr(st, inum, secontext, con_size, &nm);
+	ret = add_xattr(host_ino, st, inum, name, secontext, con_size);
 	if (ret < 0)
 		dbg_msg(2, "add_xattr failed %d\n", ret);
 	return ret;
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
