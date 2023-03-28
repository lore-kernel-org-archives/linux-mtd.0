Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB60C6FD18
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 16:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pg0aAza6cKUxId582qtOwSI+SY4JpagSVZlQ26Cv3Qc=; b=nNeAN7B2PzHgaU
	XX9vsq+6yRoSVsW0FH+J4DJpnsl+J0qMkQzKpxex5PketrSiRSWkLjpduyXY67ZgUPeVzGE6jKHRs
	/0TZuZaEMUKa6CjFkuF3VEmnwfZ9UHQlBm09a/ifhvqk8idr6ufhFOj7fQFMj7Nj07EyInt/RiblP
	O8RG9YC6LSJQbKUfjp96zeSXMhp69r+lVHy19PJdWRTKevBNSlhg6cSuF4sUtLh99NNdfaXqtRSVQ
	ir4vpJKAnx+ynbNoHfvtbNYAueUi/v0fq/kp2ApMQ39uGnrKmJSVb0Vhtl9d/g4m7R6yUMiRAzF49
	iXNhZrmwO4OntuPoLFsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phCDY-00F8MH-1y;
	Tue, 28 Mar 2023 16:30:40 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phCDV-00F8L1-05
	for linux-mtd@lists.infradead.org;
	Tue, 28 Mar 2023 16:30:38 +0000
Received: by mail-pl1-x635.google.com with SMTP id kc4so12204860plb.10
        for <linux-mtd@lists.infradead.org>; Tue, 28 Mar 2023 09:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680021035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6cp3hZpmMkj3LJBeC/SGV9aCh/7ARFpl+ERfyritQVU=;
        b=NI8a+SZgZ2/8RILumxLjqGrYUxI7+Misxwqzcbo3JtDUMYM4N0UMIM8gJwbsIhc6WB
         reHEU3+jREon5ZIlLEolgafDb2UExAbxbiAmxhDvnobMI0J882SBjoOxqxVNQNFHh1S2
         0taTKxthhehl8TOvsUs8/EPWznDMJWUAbkiePnXrwbUSnl0RZg5jlSah/OWvVphaOkfJ
         5dVHm5cAv84Bqji+Lgr2RtxfXOfBjlmvo1fiXpASeDm1bA5vQ0ghEaqSTbpSDVKSbqKz
         jzpNg3uRrJnOk88X7gUFYN1QlXFS8qlnz/SYCH2KJ9PMqq5gQGDM2c1ZVYkNN5ueO8cm
         MTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680021035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cp3hZpmMkj3LJBeC/SGV9aCh/7ARFpl+ERfyritQVU=;
        b=2f8m60RlrtL/cdonwM9P4fiwmirKStdpCLT7CNqU7I+6nmpYMxXaQhRWyOi0jYv8QS
         9J1ke7oe+KaLf1s96/aPR/XQvUnVR4RUyXkO1zjTh9f4kjK7DVJ/9+la4IRhB2CLCTX1
         sUQZEF8eCxzEU30yOZxcRf2TOO+6jLztteRwMIGIL25z4a5ySfMV9GiwbN85gWh3kWNv
         uISeLaXu9rgqMBElbEHc2AaTmZeSnl3mXoKwyWkEoo4Wq1dhXLVdcJLufhdLfYlziwgj
         JEnaE7B3RAldwKXnBl4X7AGlvvAnpDwyZo4qghavlOYe3+psSGzt1xMOGjCnCQ75rJDW
         JRcw==
X-Gm-Message-State: AO0yUKX8hLZ0dhj0vuMggKPjkVSiyWnGskEPj8C5tgbvbZWCbYtC3+XE
	abjuUsIEHq0nU/tiE0/mNkY=
X-Google-Smtp-Source: AK7set9pDNfylTlDix0ysd/Jj09hT3+N6/Wb/qgtWNiN3xtFp6pVScb+Ln5C2/3K+rULqhF81hV/nw==
X-Received: by 2002:a05:6a20:6695:b0:cc:6699:dd8a with SMTP id o21-20020a056a20669500b000cc6699dd8amr15589058pzh.45.1680021034781;
        Tue, 28 Mar 2023 09:30:34 -0700 (PDT)
Received: from localhost.localdomain ([60.177.121.211])
        by smtp.gmail.com with ESMTPSA id n26-20020aa78a5a000000b006260e5bdd81sm21107337pfa.45.2023.03.28.09.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 09:30:34 -0700 (PDT)
From: Bang Li <libang.linuxer@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bang Li <libang.linuxer@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] mtdblock: tolerate corrected bit-flips
Date: Wed, 29 Mar 2023 00:30:12 +0800
Message-Id: <20230328163012.4264-1-libang.linuxer@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_093037_084370_D7D8EB17 
X-CRM114-Status: GOOD (  13.03  )
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

mtd_read() may return -EUCLEAN in case of corrected bit-flips.This
particular condition should not be treated like an error.

Signed-off-by: Bang Li <libang.linuxer@gmail.com>
Fixes: e47f68587b82 ("mtd: check for max_bitflips in mtd_read_oob()")
Cc: <stable@vger.kernel.org> # v3.7
---
Changes since v1:
- Resend this patch with Cc and Fixes tags
---
 drivers/mtd/mtdblock.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index 1e94e7d10b8b..a0a1194dc1d9 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -153,7 +153,7 @@ static int do_cached_write (struct mtdblk_dev *mtdblk, unsigned long pos,
 				mtdblk->cache_state = STATE_EMPTY;
 				ret = mtd_read(mtd, sect_start, sect_size,
 					       &retlen, mtdblk->cache_data);
-				if (ret)
+				if (ret && !mtd_is_bitflip(ret))
 					return ret;
 				if (retlen != sect_size)
 					return -EIO;
@@ -188,8 +188,12 @@ static int do_cached_read (struct mtdblk_dev *mtdblk, unsigned long pos,
 	pr_debug("mtdblock: read on \"%s\" at 0x%lx, size 0x%x\n",
 			mtd->name, pos, len);
 
-	if (!sect_size)
-		return mtd_read(mtd, pos, len, &retlen, buf);
+	if (!sect_size) {
+		ret = mtd_read(mtd, pos, len, &retlen, buf);
+		if (ret && !mtd_is_bitflip(ret))
+			return ret;
+		return 0;
+	}
 
 	while (len > 0) {
 		unsigned long sect_start = (pos/sect_size)*sect_size;
@@ -209,7 +213,7 @@ static int do_cached_read (struct mtdblk_dev *mtdblk, unsigned long pos,
 			memcpy (buf, mtdblk->cache_data + offset, size);
 		} else {
 			ret = mtd_read(mtd, pos, size, &retlen, buf);
-			if (ret)
+			if (ret && !mtd_is_bitflip(ret))
 				return ret;
 			if (retlen != size)
 				return -EIO;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
