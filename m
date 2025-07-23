Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D03CC83F17
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jul 2025 11:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PXNNsXnE2egrwgiZU/w5blvRN2uiDnOna1C4AqRbm1s=; b=Rpxtyz/jD1OGw2
	E1Fh5evN3iRblmFNu1I9QKWaUOAPQ0CQN3fXUnDmvAi3zLPWmqpKefBfmhZT5beIrA+uL7Ey0xtJt
	/RPXLQRlMhPjVCWbPUnl1rt0jwcJmvJNy6w3wRQk0iZVSYZm+gGIvy/hb6OpgyMjt017WcPGlyqk+
	PrigcLbMhWb7whedM+eTjVUFoMMXed9BB5GsfVEh7IxavjJKOxlK9wBfw6wwXrHyFuQraO4Q+Qp1c
	i+d1qopMAHbw4VqGkHm36g6n+FA8NEyxhhpi4EbQ3V3oUt9DKzD7iLd6DWAZVjWG+f83M9JMMUnCf
	LIaG7AzWgwwvbeMet9/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXfZ-00000004o8v-0i61;
	Wed, 23 Jul 2025 11:29:57 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXea-00000004o6E-1Mbq
	for linux-mtd@lists.infradead.org;
	Wed, 23 Jul 2025 11:28:57 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a522224582so3248514f8f.3
        for <linux-mtd@lists.infradead.org>; Wed, 23 Jul 2025 04:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753270135; x=1753874935; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MNtVSfvPq68nyZPQYEg1tChxsEZu9PFTd7vPPYftT9w=;
        b=fw5XMIORbGAg/+YqXITufV3S28u/tYnABUnzHjOmxTZPmVy/CFrDctzhXl9qUJJzt1
         3FXag2CUPL4QU6yRDJN9//2XpQl9jnN37bE8+rfcw3gm/R6LeUAyiv4+1/yoB7zH69Vl
         KcT32Ok2wgGNqQLKbtf2GoWjwfKteKeX54JCamQlJeGqm2eL1vwNdteXRMUbyVKAT4j/
         D1jwxe2+TlC9bexnW+MNfCg/Q3DPv02Tu6dw/xvqtWODFqWC/eqjiWmF9+bsnU4nJ2bc
         20CmOLdWCNOqDqnMV3BmuBelmGAMM4GBHqQNs+jPS1n5Zh/KA6g/Mv9e5KMFcHVQQxmP
         U9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753270135; x=1753874935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNtVSfvPq68nyZPQYEg1tChxsEZu9PFTd7vPPYftT9w=;
        b=VQg3oDJYaIde0BLbF9WZhYiTmUKGLi+GNLiICInMFkjOmmW283WX4Hdx5+UkJZRJXL
         Y/hJgJMD75a+ljV2/MxcRHg8Xd7gQg+xYTQvpqr7cGZMj6fOZqucda3SmH/lZHcfsEXU
         K3rTi/F7kEtH38o7OkKQrpKnastvnrK46+yUUcYNmXpF/M7fQsLwldK/1rpyvBlU5Ggt
         YuruoeAZkC3+ic/uTRCXLdXWCvVASoO+qKkHlZqWukERcu26yl2FchHvS6hYs4E0WQ2I
         IuQfYkb265WtX4fzjkOA9vxPCqVdoMLZOudTJL1GxNGslHnm3iCNuRm8RuK65XRcP1UJ
         9dag==
X-Gm-Message-State: AOJu0Ywcafx8a5JvTq8JzQbzs7nT8e00NWB2qvi5ybeP8RrG9JQmMPKg
	JclcTQ4NgZsSd5Le14Xos7HGXua7Cl5GPRauc5vA6jGlgKrY2or5BwN5lPuE6A==
X-Gm-Gg: ASbGncvF8fF8QtPFBHETTq9ypaEdDISaS/6GaSr9NxS8OpGXBBUYq6wQU/dbpLgXZY3
	3jPAduQf01feipXLhw4DOQFs3x4UjxGsit02hzSCZTktlswMra2VNN8EDG3fiNplngEgaSMtsMy
	D2OZIkHF/KtZYbPfca8czFp13Qjv+cTh7QfXeTsFAY6IwGlmm+F0MyyeuJbA8BCmOgCnuhQm2HL
	6Ygc6sL75OUfzdD4Fhxln9LMwEDPA1pw88QH1WJPaa7r9LtaNnozpzStqUKgdYrSElMaLjrqL5F
	0+bibBAeTEazEK2g56HqzimMl0ojIqd4qm3HQAHw9KDmu0u0QulljiEbSwSWrX6uKzEMnuRJWUA
	nvAnP8AWL5HIhVKNrx9YShBlIYVfTQ+J/3nXPgQ+rn8ZCiuOrUvQ=
X-Google-Smtp-Source: AGHT+IFZK5jMAeh5nggkbS9rVev/DwrQtdQCfmepYiPF4NLGJgDslJiggXQsqe1dn20j9C2EnIN3gA==
X-Received: by 2002:a05:6000:2209:b0:3b5:e6bf:5e0c with SMTP id ffacd0b85a97d-3b768ef952bmr2143639f8f.31.1753270134632;
        Wed, 23 Jul 2025 04:28:54 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61d7fe48fsm14880259f8f.14.2025.07.23.04.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 04:28:53 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 23 Jul 2025 13:28:42 +0200
Subject: [PATCH mtd-utils 2/2] mtd-tests: flash_speed: fix error message in
 read_eraseblock()
MIME-Version: 1.0
Message-Id: <20250723-flash_speed-fixes-v1-2-9a7e52d26fa9@gmail.com>
References: <20250723-flash_speed-fixes-v1-0-9a7e52d26fa9@gmail.com>
In-Reply-To: <20250723-flash_speed-fixes-v1-0-9a7e52d26fa9@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_042856_366504_802C75F6 
X-CRM114-Status: GOOD (  12.62  )
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

Replace 'write' with 'read' in the error message of the read_eraseblock()
function to indicate the correct direction of the operation.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 tests/mtd-tests/flash_speed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/mtd-tests/flash_speed.c b/tests/mtd-tests/flash_speed.c
index ee162891d5c9288ffb9d09eb2c649db027eedcba..3319452194a54124a7f691994b41043fe0413229 100644
--- a/tests/mtd-tests/flash_speed.c
+++ b/tests/mtd-tests/flash_speed.c
@@ -190,7 +190,7 @@ static int read_eraseblock(int ebnum)
 {
 	int err = mtd_read(&mtd, fd, ebnum, 0, iobuf, mtd.eb_size);
 	if (err)
-		fprintf(stderr, "Error writing block %d!\n", ebnum);
+		fprintf(stderr, "Error reading block %d!\n", ebnum);
 	return err;
 }
 

-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
