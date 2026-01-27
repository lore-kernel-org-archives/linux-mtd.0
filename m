Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15575D2F000
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jan 2026 12:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RNMYKfIhrwQKfKceCWK5AuO6XIMR0B9VGwbyTelgYfg=; b=vU92c5TM2Y2rhB
	Y6Hh92d4nQ7jfZB7RQApFCOSlny37RCUKj5UGlE/Tk9F7Nh1LG0FBYGYUf3B9KbRZRmFZsl3Q2Z2P
	4XPqv6I3FzlL7AikouhfoIPr/GNG0AQEveEHeUt3GpsIGfnGwnJct+K77/msInLh0jv6ltr4i/+mD
	LKHRIW3ye+fA4IJvXl0r9X2uvxFNpmJoFonJ0EwVkiXUc5Mvvvummjmu1AIhYzp+R0j0Md6lkXMNO
	hRiH20DtxOXVHotmczLZ1lfc6XUu62DGu3DjDduDjbO4/Ju5HKNrK16kXDBTzxoYV1mISnmBFm1IV
	buwrKrrRFAq3WtazLCPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkid0-0000000EHRX-2ww9;
	Tue, 27 Jan 2026 12:57:06 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkicy-0000000EHQj-1mwp
	for linux-mtd@lists.infradead.org;
	Tue, 27 Jan 2026 12:57:05 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-38316445a67so45724801fa.3
        for <linux-mtd@lists.infradead.org>; Tue, 27 Jan 2026 04:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769518622; x=1770123422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CGrxqlHzNMQeiVoywnrVnMTjya8BAHM6PM6nVP9XmDA=;
        b=ilnByHVsNJmDJF57X2agoQMXr++xmZVabuD/mt3bYn5+2XIKMXRfMtIILweo0Or5h9
         c9gabLoRM22LZypu2ZtVXPX7t1s9ck+9P2N06xSJLutkMDRGTZcOaX3I/9ZBWaSfvmmB
         4iE7VNo2sRYDIwVY2Co4ZDxLSwW3lb2fArG4OyNJTvw7pTeCRqDtrZjxAxN662YUVao3
         XIVo8T9lcStkg5oQaLGxU0g0YCVnGARj6zAwUVhsKli75xnK1VhzHrnuV01idgIqFcPx
         /taVOSM08GJv14w1sjaSB+OH80az3lDK0nbHo6J4I0bz9vO4NTwUkj/hNvqWtDUXT9Tm
         s+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769518622; x=1770123422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGrxqlHzNMQeiVoywnrVnMTjya8BAHM6PM6nVP9XmDA=;
        b=gzCf2Im/uwSGZlbMUoPsRS3cwLkXHSZD1dzuI5AP2JyzfeLPQgGmz4KJ5c/6/nhqH7
         SSgKaOZyDgMbPrVFziBFwVMmEGlS1sk38whvuTSFY0FJ8KweocNlLasvsRwdXNPvTSnM
         pPvj5DCpZpd5BkYkXRuCwGoiYhZKmJtdDCxeshJ4A+C4w/qYmV61fJyt+1fzbec1No2I
         oMWQ6idXmTZInoUQtI/oRhUoJLaF5CmG5PYs34XcCa9/nTbxqKUqOU8M1Fx5Sg6M6yvl
         VHauwLUHoj7Ybxj0aGOPwnN4YWkVa/mg6v6KM6sxchH4alyPLGDN2Yjx/TukErHVUQUO
         qd+g==
X-Gm-Message-State: AOJu0YzcqjVYYnEa+SOWx1w9x4kwFvlTRWtxNSnhazt0r9K97MchoLg1
	DzU8ifyOKO63YfnYxyr6ToDg75cCoRhnckUg78KI/PS/KOLzsJHAPjQCoJf4d9x+h0Q=
X-Gm-Gg: AZuq6aJxl/59cQwa4xettx+4XZbZMfik8pBWURfM2JRdSXQmPyF6UUjUIya1uTsG4IK
	ZzsXOA6cShHbMOwrMnWsj81xt3wfPRjyziM8kRfCSXx5oiqfD60fLqJjGmQZd8SFR2l/DDl4ia7
	F4WHknxRQaJtQv5ORhBoaKcVojtZ9LzePKwM8InZHD702Ni2UjpLxal9+/ReLxBLmplcBYBXqJH
	1MzP3yZJcWWJ+XkkiWAPFTs7u01aOuPznX8Gla1OAKtVgTqLfADv1+U5olTT/26Lo8l9YpuLhGi
	EGJ8Ti9Y+GEOmjP7fCha2nZJ9TEiYEYe/lrqvWOKfzkMCfEBnJ+t1qCXHdo3U8os70vjeXFcpx5
	29FVEOwaCKbT9XyDfMzsLn3WixX/FcdHY4hTk+hCqZ4zQxpUPjef3vWxoIP3DoXSwF6IJvn4QLA
	fu46BVRzSVdQPlsNnOtmzScJzjipLTEI0DKt15uKvbdD7ZrlBOkqaSCYMCXf+L52YhEzYcYA==
X-Received: by 2002:a2e:a547:0:b0:383:213c:fc41 with SMTP id 38308e7fff4ca-3861c835edbmr7887291fa.7.1769518621720;
        Tue, 27 Jan 2026 04:57:01 -0800 (PST)
Received: from lnb0tqzjk.rasu.local ([178.66.156.79])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9e55b3bsm33028481fa.0.2026.01.27.04.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 04:57:01 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
	Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH] iniparser: prevent signed integer underflow in line length calculation
Date: Tue, 27 Jan 2026 15:56:57 +0300
Message-Id: <20260127125657.50784-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_045704_510505_C789282D 
X-CRM114-Status: GOOD (  11.69  )
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

In iniparser_load_file(), the code computed:
    len = (int)strlen(line) - 1;
If the input line was empty (e.g. started with a null byte), strlen()
returned 0, leading to len = -1. This caused:
  - A signed integer underflow (detected by static analyzers)
  - Potential out-of-bounds access when checking line[len]

Fix by:
  - Using size_t for strlen() result
  - Checking for zero length before subtraction
  - Computing len as (int)(line_len - 1) only when safe

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>
---
 lib/libiniparser.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/libiniparser.c b/lib/libiniparser.c
index 4b21b34..1d6dbac 100644
--- a/lib/libiniparser.c
+++ b/lib/libiniparser.c
@@ -697,7 +697,13 @@ dictionary * iniparser_load_file(FILE * in, const char * ininame)
 
     while (fgets(line+last, ASCIILINESZ-last, in)!=NULL) {
         lineno++ ;
-        len = (int)strlen(line)-1;
+        size_t line_len = strlen(line);
+                if (line_len == 0) {
+            memset(line, 0, ASCIILINESZ);
+            last = 0;
+            continue;
+        }
+        len = (int)(line_len - 1);
         if (len<=0)
             continue;
         /* Safety check against buffer overflows */
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
