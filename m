Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC358C433ED
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 17:13:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 649766101B
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 17:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 649766101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QyN6XIu1CCHYQ9X4AI0gijicZ+pHV3WJfE8BVJbyS0A=; b=i6pSqsiBbODJSbh/I6X5xBhin
	FnHpsufeDIVFQSx/5vLRIYAidwNpyeb/k6YT+Q4fhn94MajkpkDgBAjblRA+evhtrAOXROpBq9Qva
	DwNo1sdaiyJDU2VdWreI6n7a/AL2jNeTEQoKEZjBpvnkzyco2DO06W9ys+KQhJ/jE0WW4OUzkFgI0
	tzEjTdQvuuS7QIiUvmsXxlyDyAdru6VvUddr/x2aQ/M6grNnizy/LazbgVDB/CFnmT79CIMuXMqi0
	3FW8YV2rPZoHCQwR452N2jIqrjc56kPw12fValKv11t6kONa3wBsxeF06yKlUpdXzPaLWE1zS67Rd
	FbnQ9tmyA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leL54-001sTJ-Sb; Wed, 05 May 2021 17:13:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leL51-001sSq-0Y
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 17:12:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=sYEeOLVMdJz3if+0nTi25SGNzwSnRfdV3Io7PzqsWAY=; b=TP5JTzUFb7YbcMLyv/I8QuvPyP
 FD7TXiUTjVvbX2b+QoLYfdxu/l6ZDQgFRSLFxuAhL0k5lf4tmtEupoFoqEOruJjAEIX1DfYds9fEA
 bOgnF8hVSJ0eKj0DntkYAqJ0ixqjOLUW2id59idQy15rHFOYmJrdZZb964itXIxCgdePYZeMEKQ7+
 c0E8Xtpcn0bKwdJ8LgOVQRB05Hh5W5+sxojpqioqj7JYHpMMelCfGNouJaC6RVWlEJ/GFXam0qbS3
 xUZoQ+KISDHPTWbqoay4HVKXADRXgd1wh1SfvVLhVAgX0kPDGrNeIFlFGdCINYIXHrTl3TMq1RdIK
 WGLL0FaQ==;
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leL4x-0053CX-8g
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 17:12:57 +0000
Received: by mail-ua1-x930.google.com with SMTP id z7so800353uav.4
 for <linux-mtd@lists.infradead.org>; Wed, 05 May 2021 10:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sYEeOLVMdJz3if+0nTi25SGNzwSnRfdV3Io7PzqsWAY=;
 b=ZtjRg+nBEQtSEGpfHLS23h0b7Js4SstedcRvMYmTQmw9adHOXbdEDxVOs1iXVtsGYQ
 AH426lOZWMolKltecv5N9iBRcegwpilm4/5FK2IMcZH8O0fCRrUVnDjZV2b0grg7Ckt+
 kCYWuhMFZdwJo9pWe2C78cQVYAeIwIC7uqw0mnP21spaCIsgC7jZsHGNCUOY9HnhkPQx
 Bi6LuFrcmnBhMdC5VSCPTmo4lZqOM146iPX8k04A+rmIbY4HGNseRnnpt+NSgaBzxKNU
 0BpBySW9TgESuhsoojyBRkHRNEioPNbuNEfsgaZNnuipUINcXx6eFV0kvJsl43l+awrD
 MJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sYEeOLVMdJz3if+0nTi25SGNzwSnRfdV3Io7PzqsWAY=;
 b=lCYFGxchyg3IL33Hw3NXuc0YK4o+CGeK7eJ4Lf7RReqjtZFJH7k0W0qwzR5ohSsfEm
 BCwcp7eSkAB+liMta4r5pZJUxpu07R9sndRjsvNUh0QEHwF/JP13OS1RqKFUTHpok3OW
 ZwGRKC2ckckrVADi1WbzdE2WEn6XFuQ6qGW+d4aqbkeFVtr+BuNqQ9n+ESW9WpeIJJ7y
 7vZ2/jJS0Jkg+yVD93He5dz2UEgVyEByDv7AmkVR0opTDtPBvyHFIlde8hIqQAzTTyyc
 VsmeNKLH+Ujd996kyiO8R6e8Pv3sqvwJLfqK2QV88lKfJ61XP4hP7jwBW5xhdrPC7NCe
 w9hQ==
X-Gm-Message-State: AOAM532GL7mDDHGVtXQU1JWngwvPxcyUtZcmYfZV+plEDAd414t4hJZ0
 jKjX1oV0cyq7HgUsl3eRfd8=
X-Google-Smtp-Source: ABdhPJxrl6CVBgay6XwS8cB/nO+08T3TYNuo4ah7Z3BMR9/JWosO831NgUUU1N02XZJqzIfRjatvsg==
X-Received: by 2002:ab0:4757:: with SMTP id i23mr62507uac.87.1620234774254;
 Wed, 05 May 2021 10:12:54 -0700 (PDT)
Received: from localhost.localdomain ([65.48.163.91])
 by smtp.gmail.com with ESMTPSA id a16sm5968uak.1.2021.05.05.10.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 10:12:53 -0700 (PDT)
From: Sean Gloumeau <sajgloumeau@gmail.com>
To: Jiri Kosina <trivial@kernel.org>
Cc: Sean Gloumeau <sajgloumeau@gmail.com>, kbingham@kernel.org,
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Rasesh Mody <rmody@marvell.com>,
 Sudarsana Kalluru <skalluru@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sean Gloumeau <sajgloumeau@protonmail.com>
Subject: [PATCH v2 3/3] Add entries for words with stem "eleminat"
Date: Wed,  5 May 2021 13:12:19 -0400
Message-Id: <b636dedea2c2ed230bb3d53f45a523eb0f5dfbc0.1620234395.git.sajgloumeau@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <6a526dbf75f6445f3711df0a201a48f8ac3149cd.1620185393.git.sajgloumeau@gmail.com>
References: <6a526dbf75f6445f3711df0a201a48f8ac3149cd.1620185393.git.sajgloumeau@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_101255_330117_73D77722 
X-CRM114-Status: GOOD (  10.44  )
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

Entries are added to spelling.txt in order to prevent spelling mistakes
involving words with stem "eliminat" from occurring again.

Signed-off-by: Sean Gloumeau <sajgloumeau@gmail.com>
---
 scripts/spelling.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/spelling.txt b/scripts/spelling.txt
index 7b6a01291598..4400f71a100c 100644
--- a/scripts/spelling.txt
+++ b/scripts/spelling.txt
@@ -547,6 +547,9 @@ efficently||efficiently
 ehther||ether
 eigth||eight
 elementry||elementary
+eleminate||eliminate
+eleminating||eliminating
+elemination||elimination
 eletronic||electronic
 embeded||embedded
 enabledi||enabled
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
