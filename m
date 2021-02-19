Return-Path: <SRS0=dRpU=HV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258A5C433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Feb 2021 08:33:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B776064D9F
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Feb 2021 08:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B776064D9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dbWbxhMouioST7FFcpwOJLhJZemx+jS276BbiTaRqCc=; b=kAAi4Derbscmn2ee4ea3HKsn5X
	s40cD4aC1LqOQts1K+xjOTD9M5L8aXODd0wJepw4UXT3IKNW90V2boTMPUCMvJXR6AiS+CZn4dh2X
	8KHKD5ckrbQdvDR0KlU5y6sZKFe7U1xSyuLvXEj5XSf+gWZ3DZ4oa6lXfMTQX2LPfJ97DH/Y1JyVz
	bWJnNy/BpMGRbnPH5uqpa1Pmq2LcmCbXJWlQv9ParAAHZBjYv8t7+ecq9tBTALJRCA9wsGh9rIW4Z
	UiX4BmMxEO7b1WKndYW9rRpw5JGUnUhleC2FdSiDWkSVuLL9T7/riNDO4iI72x9DTIObnM8W1mE4y
	SnQSqehA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lD1DH-0007nb-S8; Fri, 19 Feb 2021 08:32:35 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lD1DE-0007mZ-De
 for linux-mtd@lists.infradead.org; Fri, 19 Feb 2021 08:32:33 +0000
Received: by mail-pj1-x102e.google.com with SMTP id my11so4015860pjb.1
 for <linux-mtd@lists.infradead.org>; Fri, 19 Feb 2021 00:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=WSN2nCd7ehopB1fbP9nmBNTf5GDQl/nfkRiUecNb/jY=;
 b=HZbaOBIcwN2pluP8dY3Zqx5Yp0XTf0p81GIPkrxvPQLFrDLesFbFxURo8c5gEvRtq/
 iDBK897oTp/AMbaY/WiPp4h9fg19r6jC9dBH2oKoEbt4PofkuuBr7Sdz5EZdMED2okyR
 iex1IsJ2uZn7CUmj8W64/Vs1vN6saEGItY8e8Zs1nSOsDHra7mGmpgIxMvoIgaWyW92q
 kjFxeV4hWgkA9JwhRXq9jFGUQ5a80CS2HG9e7dmbbAwnwJ4neJt4oscTf7GOHxvhFMGt
 uY1hKlkgQ5qNGfyqjru03YBZqVpRRd7lpmhfTWeoVVEZ23Fz0jKugRigMp3n2fNpTSd3
 N6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WSN2nCd7ehopB1fbP9nmBNTf5GDQl/nfkRiUecNb/jY=;
 b=FnVu9WNM9meNfrW3TjpvUV8SzBhW68KqGmau/18bcaHFggzRXCw44tnVHNLDT7eJ92
 RtdVETn4eSoQyZuw7YvZuYQ7Z3BTTl5rG3A7/bdvlIIQgcFIoHFyGGPkxR77dx8iTg8q
 oDMCvdT6mz1htkUTXORWZBMu479EZWr799sAjFUOiOlqGVCwx2c0IyjU4ZigRpM8QLaI
 NpqGsymzfa/mTyUvRF349IRzyoq+Zt7ICOPIZ2rASq03kfRNS9a1DDJMhntxBc5hxL4g
 zGGK9T1ziRZ3Zy5G20lJCctHRd51TgRCyCZBNiVn5raLBK9dd8Yw7r3OqOLHv3RP+2wb
 0Oeg==
X-Gm-Message-State: AOAM531HUXy4106JaclNgigR/UuUrykXXAgrFQgQgOR58mHxwF4VlqUr
 1nDFXjgQI8xLPB/kAgs9vTg=
X-Google-Smtp-Source: ABdhPJwyrTjy+j/1QXa9u6klVKgG+xh584WRqYGDEh3LlB+f0CD68WQEasAWtdPy1NA6yf77ERUxng==
X-Received: by 2002:a17:90a:e7cd:: with SMTP id
 kb13mr8043201pjb.10.1613723549288; 
 Fri, 19 Feb 2021 00:32:29 -0800 (PST)
Received: from rayare.domain.name ([106.51.141.71])
 by smtp.googlemail.com with ESMTPSA id 4sm7881341pjc.23.2021.02.19.00.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 00:32:28 -0800 (PST)
From: chakravarthikulkarni <chakravarthikulkarni2021@gmail.com>
To: 
Subject: [PATCH] fs:jffs2: Fixed return statement in if and else statement
Date: Fri, 19 Feb 2021 14:02:12 +0530
Message-Id: <20210219083214.11583-1-chakravarthikulkarni2021@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210219_033232_624105_586E64FF 
X-CRM114-Status: GOOD (  17.57  )
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
Cc: Richard Weinberger <richard@nod.at>, chakravarthikulkarni2021@gmail.com,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Error:  Fixed Error found by checkpath.pl script.
	switch and case should be at the same indent
Warning: Fixed Warning found by checkpath.pl script.

Signed-off-by: chakravarthikulkarni <chakravarthikulkarni2021@gmail.com>
---
 fs/jffs2/acl.c | 105 ++++++++++++++++++++++++-------------------------
 1 file changed, 52 insertions(+), 53 deletions(-)

diff --git a/fs/jffs2/acl.c b/fs/jffs2/acl.c
index 093ffbd82395..e66a1c4eaefd 100644
--- a/fs/jffs2/acl.c
+++ b/fs/jffs2/acl.c
@@ -38,18 +38,20 @@ static size_t jffs2_acl_size(int count)
 static int jffs2_acl_count(size_t size)
 {
 	size_t s;
+	int ret = 0;
 
 	size -= sizeof(struct jffs2_acl_header);
 	if (size < 4 * sizeof(struct jffs2_acl_entry_short)) {
 		if (size % sizeof(struct jffs2_acl_entry_short))
 			return -1;
-		return size / sizeof(struct jffs2_acl_entry_short);
+		ret =  size / sizeof(struct jffs2_acl_entry_short);
 	} else {
 		s = size - 4 * sizeof(struct jffs2_acl_entry_short);
 		if (s % sizeof(struct jffs2_acl_entry))
 			return -1;
-		return s / sizeof(struct jffs2_acl_entry) + 4;
+		ret = s / sizeof(struct jffs2_acl_entry) + 4;
 	}
+	return ret;
 }
 
 static struct posix_acl *jffs2_acl_from_medium(void *value, size_t size)
@@ -82,39 +84,37 @@ static struct posix_acl *jffs2_acl_from_medium(void *value, size_t size)
 	if (!acl)
 		return ERR_PTR(-ENOMEM);
 
-	for (i=0; i < count; i++) {
+	for (i = 0; i < count; i++) {
 		entry = value;
 		if (value + sizeof(struct jffs2_acl_entry_short) > end)
 			goto fail;
 		acl->a_entries[i].e_tag = je16_to_cpu(entry->e_tag);
 		acl->a_entries[i].e_perm = je16_to_cpu(entry->e_perm);
 		switch (acl->a_entries[i].e_tag) {
-			case ACL_USER_OBJ:
-			case ACL_GROUP_OBJ:
-			case ACL_MASK:
-			case ACL_OTHER:
-				value += sizeof(struct jffs2_acl_entry_short);
-				break;
-
-			case ACL_USER:
-				value += sizeof(struct jffs2_acl_entry);
-				if (value > end)
-					goto fail;
-				acl->a_entries[i].e_uid =
-					make_kuid(&init_user_ns,
-						  je32_to_cpu(entry->e_id));
-				break;
-			case ACL_GROUP:
-				value += sizeof(struct jffs2_acl_entry);
-				if (value > end)
-					goto fail;
-				acl->a_entries[i].e_gid =
-					make_kgid(&init_user_ns,
-						  je32_to_cpu(entry->e_id));
+		case ACL_USER_OBJ:
+		case ACL_GROUP_OBJ:
+		case ACL_MASK:
+		case ACL_OTHER:
+			value += sizeof(struct jffs2_acl_entry_short);
+			break;
+		case ACL_USER:
+			value += sizeof(struct jffs2_acl_entry);
+			if (value > end)
+				goto fail;
+			acl->a_entries[i].e_uid =
+				make_kuid(&init_user_ns,
+						je32_to_cpu(entry->e_id));
 				break;
-
-			default:
+		case ACL_GROUP:
+			value += sizeof(struct jffs2_acl_entry);
+			if (value > end)
 				goto fail;
+			acl->a_entries[i].e_gid =
+				make_kgid(&init_user_ns,
+						je32_to_cpu(entry->e_id));
+			break;
+		default:
+			goto fail;
 		}
 	}
 	if (value != end)
@@ -139,32 +139,31 @@ static void *jffs2_acl_to_medium(const struct posix_acl *acl, size_t *size)
 		return ERR_PTR(-ENOMEM);
 	header->a_version = cpu_to_je32(JFFS2_ACL_VERSION);
 	e = header + 1;
-	for (i=0; i < acl->a_count; i++) {
+	for (i = 0; i < acl->a_count; i++) {
 		const struct posix_acl_entry *acl_e = &acl->a_entries[i];
+
 		entry = e;
 		entry->e_tag = cpu_to_je16(acl_e->e_tag);
 		entry->e_perm = cpu_to_je16(acl_e->e_perm);
-		switch(acl_e->e_tag) {
-			case ACL_USER:
-				entry->e_id = cpu_to_je32(
-					from_kuid(&init_user_ns, acl_e->e_uid));
-				e += sizeof(struct jffs2_acl_entry);
-				break;
-			case ACL_GROUP:
-				entry->e_id = cpu_to_je32(
-					from_kgid(&init_user_ns, acl_e->e_gid));
-				e += sizeof(struct jffs2_acl_entry);
-				break;
-
-			case ACL_USER_OBJ:
-			case ACL_GROUP_OBJ:
-			case ACL_MASK:
-			case ACL_OTHER:
-				e += sizeof(struct jffs2_acl_entry_short);
-				break;
-
-			default:
-				goto fail;
+		switch (acl_e->e_tag) {
+		case ACL_USER:
+			entry->e_id = cpu_to_je32(from_kuid(&init_user_ns,
+						acl_e->e_uid));
+			e += sizeof(struct jffs2_acl_entry);
+			break;
+		case ACL_GROUP:
+			entry->e_id = cpu_to_je32(
+				from_kgid(&init_user_ns, acl_e->e_gid));
+			e += sizeof(struct jffs2_acl_entry);
+			break;
+		case ACL_USER_OBJ:
+		case ACL_GROUP_OBJ:
+		case ACL_MASK:
+		case ACL_OTHER:
+			e += sizeof(struct jffs2_acl_entry_short);
+			break;
+		default:
+			goto fail;
 		}
 	}
 	return header;
@@ -196,13 +195,13 @@ struct posix_acl *jffs2_get_acl(struct inode *inode, int type)
 			return ERR_PTR(-ENOMEM);
 		rc = do_jffs2_getxattr(inode, xprefix, "", value, rc);
 	}
-	if (rc > 0) {
+	if (rc > 0)
 		acl = jffs2_acl_from_medium(value, rc);
-	} else if (rc == -ENODATA || rc == -ENOSYS) {
+	else if (rc == -ENODATA || rc == -ENOSYS)
 		acl = NULL;
-	} else {
+	else
 		acl = ERR_PTR(rc);
-	}
+
 	kfree(value);
 	return acl;
 }
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
