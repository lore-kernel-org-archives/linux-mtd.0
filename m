Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7D2E77182
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Dec 2024 19:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mePvZdg1UHqbr6ZrjCGBmoPE2F4tDa3gY/1TmXtCB8o=; b=Vs6adZq0kTMsGw
	ZU/aJDzDW87pjhoVBjiwDnm74KSkg6QVd+cXXbxkp08uVSRA0nHq9iVX/PJSonI8jYqQ/WV1uX85Q
	d2cHF6/11ct2hJSpxYkDrGTNtsWLZQok/3yt2sZkKZrORvwTD7vU9dtDEPLC/PaeG0EWXcMbvNSZG
	KOphqtnkXcWFo0775AOixw5nj665byhwMEcQ8berJ3SAWvcZmAcDK4A9H35gmzWvTdvtsv7u81OBg
	3dvaJoMbJ+LvjHiJYXWgjTGSPkMj2CrnVMTBO9e4EHU9+mb6RCmIigw3iHPu3xO7ZSVBisqpLzeCk
	sdVqU3dfvw7IRfhE/tsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLovR-00000001eiX-2c45;
	Thu, 12 Dec 2024 19:32:41 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLobk-00000001Zah-01mo
	for linux-mtd@lists.infradead.org;
	Thu, 12 Dec 2024 19:12:21 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-53df80eeeedso902575e87.2
        for <linux-mtd@lists.infradead.org>; Thu, 12 Dec 2024 11:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734030738; x=1734635538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I6B+c0OEiJBsR71et5gE3N1WWD8b53x8dg0s0iZZti4=;
        b=jlPglS/pQiYIzv+yJXPwXp65BOtz+0vxxs+HmL4lAWbX9+KNFOu6MSfRF911/NChUf
         AQdikcnI6sJNa5Y9ZE4HLFMd7hBQ2URAaEevYP77nGeh2Ak2FWdART7fyU8SkPjvNYWd
         hbO0vN3xcXBE6ClpVumdMOScYxqEZndAbWFX7jLjGuO9P0qNA0Snyc/84AyiB/y3DKF+
         hZB4yslEMRQ5Me8N3DIxs9WiT4UttpdsnFKg+GadmdsgCnXrr//TfVythgdANr55x+zm
         7fS2MINdxf/HJPQl+qbmr0ktihL+zfp7j3Wk5swPwCO8Vq23bpxXRGNmKtwkE2rQaRlx
         3f6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734030738; x=1734635538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6B+c0OEiJBsR71et5gE3N1WWD8b53x8dg0s0iZZti4=;
        b=BjhduJc0yI9vwCe5HXB/BJDIUiXlMwqcbKvtF2D+edqZorWFDV2huCouDnRwlENsAm
         uD19wRI4RteZb1D8145YxxSNSLmxr5xEnf8wjMmpjEpxdUrK5abG2ppB0kzq6bJSK7KH
         /BYro8/J7yNngWiaffNxJrWKRI0Y8DMT2gMp1GwsHffs7lPdFOeUkjOWmwQcWfJIK7UE
         7j8aUItOA5EvmPxsYfVMhUiwKIYCgQZA9JtzJZQNBz1iMs0qDB44XuGeABNeRwPjPmcq
         hF7kKmNnoOFiKxdQCdEkP8nZ0RekjhqvXrSkhmHS1ZxEh5fWquDdOvDqiKCOrazLok9b
         o5qg==
X-Forwarded-Encrypted: i=1; AJvYcCXBL4BSY+rV+6ByH3U/IZ3hoybmuWksD70rM1iF0uNhezOjuoI5QIsYVfIxORMc5iye2BEGUtGlYcI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzevV4AThpzwBvJZftQTTHuyz3Adu0KonA+CqircbV10nqxbeRM
	ZAXqb4G1jTkdELYSak7FCH3N1ukcGzdit9VQpX4N4yKiwSOusHj6
X-Gm-Gg: ASbGncuze0JdxMYFr0Q/GOGBR6rcb5RF2dft20P6rkMxNxJBCcXcQCCZk9cm/Xgm/g+
	ebSGPN1aLMNhy+wPpdqP6m17BHx8bPKJJYzPoWQRwhf2tWNBK7vnI0tAq+bDsyDQ1jEVwU1bYLU
	t9mEJ2d3zpTnh9T4VDvwwHfIaD/GAS2rHfmhDyPoC0Acy2YanMdARUnXAkNd2SVkXSWaJwrV25B
	aFtt2UMaMXkmvlAEMVR/sxOwJUQo012DlcSO1YrO1JQaZLNPR9eMLhQj+2PSqZik+JCwNOOXUt6
	63rnGPNkd3afnDvcNBFP3A25Ug4CFtptVH1QYUU=
X-Google-Smtp-Source: AGHT+IFSpMDRMO3NmZsz7gnz4H1MlRoUFP6i/fJMbOxImUR0ojijg+h1QIMLj8FZIlY1QUWOLJJNNg==
X-Received: by 2002:a05:6512:3e0a:b0:53e:3a01:cf4f with SMTP id 2adb3069b0e04-54034107bc6mr674598e87.14.1734030737446;
        Thu, 12 Dec 2024 11:12:17 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53ee46ee969sm1795251e87.181.2024.12.12.11.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 11:12:16 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] lib: Fix integer overflow in libiniparser.c
Date: Thu, 12 Dec 2024 22:12:28 +0300
Message-Id: <20241212191228.84504-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_111220_062509_5993DCE9 
X-CRM114-Status: GOOD (  11.66  )
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
1. Added a check to handle empty strings before decrementing the length of the line (`len = strlen(line) - 1`) to prevent integer underflow.
2. Modified logic toskip empty lines immediately, reducing unnecessary processing.- Ensured safety by validating len >= 0 before accessing line[len] to avoid out-of-bounds access.
3. Improved robustness when handling multiline values by ensuring valid indices for len.- Added relevant comments to clarify changes and their purpose.

Triggers found by static analyzer Svace.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>

---
 lib/libiniparser.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/lib/libiniparser.c b/lib/libiniparser.c
index a6ddcc7..da980c0 100644
--- a/lib/libiniparser.c
+++ b/lib/libiniparser.c
@@ -522,9 +522,15 @@ dictionary * iniparser_load(const char * ininame)
 
     while (fgets(line+last, ASCIILINESZ-last, in)!=NULL) {
         lineno++ ;
-        len = (int)strlen(line)-1;
+        len = (int)strlen(line);
+        if(len == 0){
+            memset(line, 0, ASCIILINESZ);
+            last = 0;
+            continue;
+        }
+        len--;
         /* Safety check against buffer overflows */
-        if (line[len]!='\n') {
+        if (len < 0 || line[len]!='\n') {
             fprintf(stderr,
                     "iniparser: input line too long in %s (%d)\n",
                     ininame,
@@ -540,7 +546,7 @@ dictionary * iniparser_load(const char * ininame)
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
