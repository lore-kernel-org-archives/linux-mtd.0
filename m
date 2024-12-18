Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA40AE77187
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2024 11:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fK+YNe7ZbH7fr5qJojXIKSsQhPpBimrGwYMbSCBILFI=; b=C4wZ+1mp6b4z0U
	rccMtKJxXgFTGsRabecUh0dqNEENsy0EZSEBygTNVJ92JYdLcKO2UABBH91//FTNQt156Gnq+8Mil
	F8qN73gVURJjjUV5V+AChvnFR/5H3qO1GWs2Z3uK0M52TTSTdR55vHtSOBDj1wWVd8w3yxTylI2D8
	SyJaf3Kd+cHb0Zvkr/m41VAfx6u+3qfymyRDxUqHEbDxa50SznhzS3FJ7quG5TKUCI2sgCuT09hHg
	8H0KpdvnYKI8RfY49yeAdNY6wyePc8GQaB/h03GHUBoLTnkW7dkaXcpYtqYHoEedj1QfmoHrz4Bfr
	8IMM5s2oQmrgTESFfixw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsNV-0000000GTSM-2gjW;
	Wed, 18 Dec 2024 11:38:09 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsMs-0000000GTLW-2B3F
	for linux-mtd@lists.infradead.org;
	Wed, 18 Dec 2024 11:37:31 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-30229d5b22fso66981291fa.2
        for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 03:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734521847; x=1735126647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4UPT8RPe5UAFwBH1EJyPwT6RuYITjX1vGfZC0lLq3Ps=;
        b=f5A6IEovyRt8JS7EBigj8Z2K9vCksZ7Qns9wS0CV0i2ClDJlW18/feEWYk0TtfvlZ5
         ypxUNYhCgEImKHJkqKGGKcBzsfTDFY5Y277UOCXlogu1p6br8Brtu0U6zQ99pePUg34v
         dteBj7WmQCnIOsC2H95UMDmkSCcIaGu4dug9GGFON4fFkkcTDOe7/wBYJXihXlhPeTdb
         VSC871m2OE7mUmTq8/0QV0l2ZcNtQWyovgwOJdlDqZao6rVDhynn1wBL9SoqgrtqRqIc
         ith1jpdRvpJS2xPBe2gSHVV6gm4E8NqiY5z4AMCTHzXm0piEDMj9Amtyc6d7JG8fC83f
         349A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734521847; x=1735126647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4UPT8RPe5UAFwBH1EJyPwT6RuYITjX1vGfZC0lLq3Ps=;
        b=mc/ka5YR4fNWibsQSi8rfGjPvzMvpAgXcenuHlvHg0+muh4fMD+RtWxMU2pevblwCj
         7/Z2JkBiI+i/2Tb3Ii/imq43Y+1130N10gdLhCinZhSNeBY6Sa8OoT+xUXuz85A/xKJO
         LpipBmbJvYeWv/cTLmkS+D7elcZ3iA6vmbG/XCvjlMdcI/w6YHWMvhUo47+73p6OB6l4
         w4tm3SygMAFjEVCDTPGFGvBco6FZoi9NeVYLPVEJSoTzkSFx9go0zu+UmDwJDRTHr/z9
         iZWPPaAhOGFfWqokMyWefVbAJkkvYGUPQd3bnNyV7kVMhFEdUkKLTc6zmSWap+s1RbCH
         lsJg==
X-Forwarded-Encrypted: i=1; AJvYcCW3QCI+Q1LILFUHeNBIIjad3Mt4ZIbaLugYKAxwMCURCcg7RjTWAdC7LlXXzYpINpN4ftOqt6ZgSvg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwmlxqLm95EVXPIHzgwrzsUb8tWBlakEQoaHH82/GCVVGdaSOpI
	hvslVjTj9SDiKV/yV0+0x/cfBYbSat9sem0xEe/ZOSl1oHS70rCC
X-Gm-Gg: ASbGncupLIu0BJO2rE2VElboHtj6QmyvmyEK1bCQxzGb1dveSBv2NsmKTR6GGTO3RRY
	XlDh/XyhObhUm6q5T3ReKBT847ayxv/NNoOttTcg7bwB7ArTSVBzyhH9s7R6+2yjpW2xyRZFeuY
	3amv1D1YPOyEb1+6l/WJWE/VJd3fDw6fr+fTBAErK4/mMzrxq7gUmuwOj6y1ZXb2TDqEC18jWiH
	jzVyqhYG0m/ibyY3c7nJ0KG3hCdlBZvVWCjkPsnfTuSUPuPnlYmAAD7tnUlxL3McvvxTjFMU+cl
	4E+z6q26/6uWq8SIBnp28/LEDkSrSdTF3XnneqQ=
X-Google-Smtp-Source: AGHT+IHlUfk+V9+YY2axXV0qtphNlVZghDr8qJbXRexodpLV9wfmCANxRHW3bgNZyXThnC845pKoHQ==
X-Received: by 2002:a05:651c:10d:b0:302:4130:d186 with SMTP id 38308e7fff4ca-3044dad316fmr7582711fa.16.1734521847137;
        Wed, 18 Dec 2024 03:37:27 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441a6a2asm15342951fa.112.2024.12.18.03.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 03:37:26 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH] FIX: INTEGER_OVERFLOW in jffs2dump.c
Date: Wed, 18 Dec 2024 14:37:43 +0300
Message-Id: <20241218113743.495525-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_033730_552574_E6AECEA9 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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
The value of an arithmetic expression 'datsize + oobsize' is a subject to overflow because its operands are not cast to a larger data type before performing arithmetic

Corrections explained:
Fixed potential overflow in arithmetic operation datsize + oobsize  
by casting operands to unsigned long long to ensure safe computation.

Triggers found by static analyzer Svace.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>

---
 jffsX-utils/jffs2dump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/jffsX-utils/jffs2dump.c b/jffsX-utils/jffs2dump.c
index 30455ea..5be7a5b 100644
--- a/jffsX-utils/jffs2dump.c
+++ b/jffsX-utils/jffs2dump.c
@@ -783,7 +783,7 @@ int main(int argc, char **argv)
 			read_nocheck (fd, oob, oobsize);
 			idx += datsize;
 			imglen -= oobsize;
-			len -= datsize + oobsize;
+			len -= (unsigned long long)datsize + (unsigned long long)oobsize;
 		}
 
 	} else {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
