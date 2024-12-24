Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292FDE77188
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 12:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f+6nEaIOHH5ZhkUf27bQbnqMnVsoA8OzmABOROHAKno=; b=XYfbZH1HErO0vY
	rI98q2lQPo9L0SFf9UtJOTfikKKTnqfCjUmfq3c0nDPhN2F36zeYp9j14j2WKZn10md/0Fy4HF3bz
	u2D3J87jNqjMp33huf/UhjoLN9uHi1me3UNEiwYLEkuljMgS4EgZwWCmYUus3+V3Aj6gnkii1zEPQ
	S3Nf1xiFVqqzHJXEXe1H/3QedzFNKsizgy5CPmlDjJJ5fCt+PEzD6OYRL2BLBWgjxrPkTvpWYXm0K
	FbEaxar6B9nW4ldRxLya/nT7ava21K34EFJtPZ0YDlECa3pqzhptfvzJU/4QKHiTgF5+OtYsepC0s
	OuUFW0/bv3kxwVoX4qqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ3zz-0000000BwTx-2Rv6;
	Tue, 24 Dec 2024 12:26:55 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ3zx-0000000BwTM-0XMv
	for linux-mtd@lists.infradead.org;
	Tue, 24 Dec 2024 12:26:54 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so5271199e87.3
        for <linux-mtd@lists.infradead.org>; Tue, 24 Dec 2024 04:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735043210; x=1735648010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nzbjmq3vzSNrFS01hdXsBhJh+8X9kQ+6kCKkB2II2rQ=;
        b=RwjoHIG+nYkgcXdqxKTYYhj2iFhVsp533RyI2XTP9YJBQo6/tkIMnc6yw21rFEe/H9
         Am9S3pPrnoOCJV3z8pzPW/TpD8tkKy9xZ5Eo1icnaqhPpkPyIFLdR5sAyMB62wabqEVG
         +rLnszexHkThrMNn2Wqi+2hmxN6eQEQz2R21Zn93Uc25FwaPXkt48e6obHy12A4ePLGz
         qmtyafvC8w/Kqtt/BZNiNy7QUE3dDNbxlVaB4oTF+slMaPAO1PIKKlcfT7E0C2bZeO+P
         6esIIpoAYgjjcLlvHpValGini6LcQePBx0iINQyDY3vEznh4S2xGIifBuXtv1UavPDG3
         bogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735043210; x=1735648010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nzbjmq3vzSNrFS01hdXsBhJh+8X9kQ+6kCKkB2II2rQ=;
        b=RMIqtXQjNAA9JGAi8HCBvp4ycZR2hokqRLSQ3cbOciVpFm2Tkaaf9n8+JOgDhpxPnK
         5tIT+qeYXRpsZH/hgN8cgwrkXsq+a2tQPRLYt2uoOCdHjkh37trE4b2/w3fmggS5veat
         jPzXJUJqeKUy6mm1L+NPLdv8+Jc7R7r/MbXMysLEHX2Uq7CGifOLZGHQ0gWX3AVmww1H
         esSQ6nEKpmczU0yAmP6MNVXokrdILPc8PGaoP54wXFZvrbkc9m288CzC49lBimPI7Wkl
         C0ei2Gqi5phSJ9KiSFDU5UwTq7U896UqoAd/Agy8dkRTg98Ny8XkaoanKMu8RQ/RMOHj
         icGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbiaHFeQoz0G/gQ9zn20uuAoQU7nIbQIFxkpxvBaCtQ54T3m5V4kcBdgS9FUCd07AbckOQ3PJ5ccQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg47BlZhf8sVGsN0OQWw6oTHpVxmWlMpJVtIyRQ6mi3quR51II
	RdStkCMHrLa2bsJ32DHcpqIYFDL+AzsfTNovnZGwUzTLnSwwrtNM1zv2yfAK
X-Gm-Gg: ASbGncvnpYlybtF6sUB/ZScFIFJRIunqgGxz2tMZsbhiDPJU8w3aaG7Y2XnQFK0573a
	di2j5AlPARCyYMTYs8UVX3CBNTtkPXIXtikP/KSuhoVrRdwJ98jB7xyU6PZUtizo+VecKM3Ol9O
	hGE2aBa/mCkWZpVY84KQJLlgWxbNs9SjJxXsuvuprPgXezvV45dfgvLvAppx5ythGZFh7aUYHaz
	cKgaSE9noYA9Sb13p/hjXCssPVJXUDBLWzpd20B+9uB24jKzZ8a3dbdAulp3mDz7uPfTeb2Et2o
	8XhmIRHLvVlk0sUZOmrxi64xQKMH3ErpP338GXM=
X-Google-Smtp-Source: AGHT+IFz9gc+CnTg2Kk1MFIivZxidZF5iRnp+aTCfEWvZNB2hZNMH1xvboH90NqaPYE5SJlep/talA==
X-Received: by 2002:a05:6512:438c:b0:542:2990:84ab with SMTP id 2adb3069b0e04-54229908932mr5314305e87.20.1735043210233;
        Tue, 24 Dec 2024 04:26:50 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6509sm1562583e87.25.2024.12.24.04.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 04:26:48 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] jffsX-utils: fix integer overflow in jffs2dump.c
Date: Tue, 24 Dec 2024 15:27:09 +0300
Message-Id: <20241224122709.39295-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_042653_174730_434C7F66 
X-CRM114-Status: GOOD (  11.10  )
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

Report of the static analyzer:
The value of an arithmetic expression 'datsize + oobsize' is a subject to overflow because its operands are not cast to a larger data type before performing arithmetic.

Corrections explained:
- Added a check to validate datsize and oobsize to ensure they are non-negative and within a safe range.
- Cast datsize and oobsize to long before performing arithmetic to prevent potential integer overflow.

This change ensures safe computation of offsets and prevents undefined behavior caused by overflow.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>
---
 jffsX-utils/jffs2dump.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/jffsX-utils/jffs2dump.c b/jffsX-utils/jffs2dump.c
index 30455ea..5b0e144 100644
--- a/jffsX-utils/jffs2dump.c
+++ b/jffsX-utils/jffs2dump.c
@@ -772,6 +772,13 @@ int main(int argc, char **argv)
 		exit(EXIT_FAILURE);
 	}
 
+	if (datsize < 0 || oobsize < 0 || datsize > imglen || (long)datsize + oobsize < 0) {
+		fprintf(stderr, "Error: invalid datsize/oobsize.\n");
+		free(data);
+		close (fd);
+		exit(EXIT_FAILURE);
+	}
+
 	if (datsize && oobsize) {
 		int  idx = 0;
 		long len = imglen;
@@ -783,7 +790,7 @@ int main(int argc, char **argv)
 			read_nocheck (fd, oob, oobsize);
 			idx += datsize;
 			imglen -= oobsize;
-			len -= datsize + oobsize;
+			len -= (long)datsize + oobsize;
 		}
 
 	} else {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
