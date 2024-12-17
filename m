Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41E3E7717F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Dec 2024 12:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XMIFCyykU9iG2fmlZNnSeBAomnk+ognjAYOzsyqsxSE=; b=Fp3x6fVykwNjLk
	m2FLbK/mUxvlIGtffaGv0zco02Nffug1D27PQG0DHnZ7PIHdZeUaw6/YHf/EQyHnmdH354z2S6jFj
	SbbxFIQpaTh3R5BhYn+Onxjagh41ElR4+F6OXqU3D7UujeW9O9oKO7Opl1Qyz1HBSvAGl8/MBwPN3
	H3C9ROqgLkX/9XdA/APjhUxkc3cVf+RMeRgJaeaYiGyyr9Co+TDl4KngMvm2Or2VjcJ9XCgxB/sJo
	DKEkKkBks5zoECi3jUxV9XO6DWZBCscORCvp6fOp9xghzq4UNRuDrWji6NNdMfv1yUy4SuZFzIUsM
	qCIMXa6r9aCqBGvITkkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWpn-0000000DP7r-0bYt;
	Tue, 17 Dec 2024 12:37:55 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWpC-0000000DP5R-3jI8
	for linux-mtd@lists.infradead.org;
	Tue, 17 Dec 2024 12:37:20 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3003d7ca01cso52555231fa.0
        for <linux-mtd@lists.infradead.org>; Tue, 17 Dec 2024 04:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734439037; x=1735043837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aNjmj3KkGNlyC/BvxTgq6N8unY8IM1xjhJhKQ+J6iKA=;
        b=eugA9LnoZPUeKMvOivoOjdf23Hfo6QR1xrB1ZqNBu23vacve7M5JXvTYlAc6MMmRI7
         zVMyPOd1ZkdcDA1kv4XFr9n0T8QSUc/kj3z8MV2H40gKy6lZ0fXcXoI2IgjFox4CPOzj
         dcjBcLYkarPFS7dNKtRzTUf9kixT2fT7IhcU3+2pUxksRikJQjCNmcEpnAv8XJRPvnXU
         OMHC5SeO83lkO+w+b2pdBHMtfKQArWmnbESrW3ahaU+Lvb3T/p6n6bv5dWjm0rIh5XSW
         7vTW9PHZRJHklH6tP6ge8Md/qpLXUHw0GrIbPBwVPSU4UyDoAk9g6c4KXVSidwJF9zQR
         hN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734439037; x=1735043837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aNjmj3KkGNlyC/BvxTgq6N8unY8IM1xjhJhKQ+J6iKA=;
        b=HgUepVVEFRiAES4fhO5pQflp5YyhjmCaQkBBvZ/UryKD1jxGPlOrmB8Qkwlk5l2pTQ
         lodYLI3qiNZM+r///2s9tiwQ46wBbisghJO9J5eNnFIxUGO9MZOoEGiz2lS/fwsKNyrc
         KVLdr/oqeJAvCkbF21Bq8ENWjTN+t6DjJdxNUxxVTSJV8J9NopxDoVktYfAO8mboIPVE
         SfdXVd6Eb7DA4y74hPxT4Cwz+hCObE/b2Qj6v8xrlz0hFkI0zSRn1WUdn89EtapsFFx9
         7Fuozn/poh10lcz+Ufpf7YBtVJs30qZErf46HXagXB5ghjZM+LARBvBNJnhuhbtlAAtU
         zGsw==
X-Forwarded-Encrypted: i=1; AJvYcCWtHJZw1KJzLFhQvQ1TiBPSNqDt8Jcjmhlr2WQkbn6H377LbWqT1UxtwgB2Mon/YOV6WPPn4uVCzAI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwiUqDw9XX7Vs8sDN3BeNFK9OnABDElKIWl+7j2pQ8SzyDyTF1X
	eeu3XHqC6q49b9obFG8W19H6TuOvM7jBm7tcw8VXWvlphCPP3DoPxaA55lV2+PlpsA==
X-Gm-Gg: ASbGncsmNYnxiL4q1fJrg/wKB0t24yxR463K7AlOorj8EbCk2UH6n3gEV+GWrdoT9uR
	MJbGJgRwtRPd2diR7BDm97zcP/eopUa0EANkEDpZFYRWez8YneeaOnpA6/BHcs74P78sA+fSFM2
	ngz7OdaaLLmZYAOohtnNgMhhRkAxGHAzoqL2SgaVWxYvtjCXEKQ3v19bGZ6tOy6IGaWciRi8eX/
	PG9+6BEgSocqn9tdtohRh5N5LR60O54X39siFuF1PiqGH1Zn0WMspgSib+p2KO7fcJ6NM8Xs7Ys
	g7IyK1h+tSchYlYJbOeIcWzRHGNrfzVRBpipNA==
X-Google-Smtp-Source: AGHT+IGJjz9HGfmzkcIEc53uex1Mz3wjUiwQi0hYhx2AotT/VIYqAc7D55JaDq+Nca/ApFiLAkCc3A==
X-Received: by 2002:a05:6512:3083:b0:53d:e3a6:ae8b with SMTP id 2adb3069b0e04-5413106448amr775055e87.26.1734439036399;
        Tue, 17 Dec 2024 04:37:16 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c13d74sm1141653e87.211.2024.12.17.04.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 04:37:15 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] lib: Fix integer overflow in in libiniparser.c
Date: Tue, 17 Dec 2024 15:37:31 +0300
Message-Id: <20241217123731.243461-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_043718_925839_F47566B9 
X-CRM114-Status: GOOD (  11.70  )
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
Possible integer underflow: left operand is tainted.
An integer underflow may occur due to arithmetic operation (subtraction) between values
{ [-2147483648, 2147483647] } and '1', where the first value comes from the expression '(int)strlen(line)'

Corrections explained:
Modified logic toskip empty lines immediately, reducing unnecessary processing.- Ensured safety by validating len >= 0 before accessing line[len] to avoid out-of-bounds access.

Triggers found by static analyzer Svace.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.co
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>

---
 lib/libiniparser.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/libiniparser.c b/lib/libiniparser.c
index a6ddcc7..9790c75 100644
--- a/lib/libiniparser.c
+++ b/lib/libiniparser.c
@@ -540,7 +540,7 @@ dictionary * iniparser_load(const char * ininame)
             len-- ;
         }
         /* Detect multi-line */
-        if (line[len]=='\\') {
+        if (len >= 0 && line[len]=='\\') {
             /* Multi-line value */
             last=len ;
             continue ;
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
