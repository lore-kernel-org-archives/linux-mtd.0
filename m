Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A106BE77188
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2024 11:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fK+YNe7ZbH7fr5qJojXIKSsQhPpBimrGwYMbSCBILFI=; b=U0pHFksDv5ca8a
	bjCDVmPggsSHIYXw+WhaYROXDoSbmV9lnZXhNkZrIvdW0esHhHBqMVtob30eSJTY2oG6gLzunhh27
	qKFYxuaqlA6ON639DgnLWa4PY1qFJ+mpk0iDe5MeDshYdhFv3dK3c+UFfW/vatANjKR7Xr8LbzFvI
	D35DC4CuVB7EqvV2ACgCHEzyqlfdQzLtvTD/Dh8eUTkrgeCRCvS2Cr2MzBWkimOtJdbWaDySBurxP
	+gEel7VLnctUUBtsCB7hDLa+yZPqyW9eSIRlvYWV+PkXtJqhGp3yCsoRZ8z2b5V82+flxAijACXKP
	J28XMwIlvnc2eIGbA0yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsR4-0000000GU35-38wI;
	Wed, 18 Dec 2024 11:41:50 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsR1-0000000GU0t-4Bch
	for linux-mtd@lists.infradead.org;
	Wed, 18 Dec 2024 11:41:49 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3011c7b39c7so69926611fa.1
        for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 03:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734522106; x=1735126906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4UPT8RPe5UAFwBH1EJyPwT6RuYITjX1vGfZC0lLq3Ps=;
        b=VVR46lXGkOa6qOdfZa5lvGRtnLTbnX26UOpRmaIeL5cT10o4WO2j/RX+9WcFj9dSpl
         kjPO5Ed4kLi9/09lZZvV0dWkdmV123xSw3ebyn16DZN8vwSL0UAW8Nf7uQT1XSmVXC4T
         DOIqCH+0NxeqxAo52rV0XyZO2NEO3VbQYA1+IkcKfGsZCjln4D1JOBg/U5UMumvOPiza
         z7SOgHDdz0biXOJfOuqavNdQBS69Cqgvqa36NcxqVPKa+gKXak+bacrzcMu80s0fvfk5
         0ByaysTZQsRhSZJHhI9Fpo6vSpvaDRY2zKx7CmKwKbC+SHmGlvJlEYglUUbIz83ZSe2t
         Z/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734522106; x=1735126906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4UPT8RPe5UAFwBH1EJyPwT6RuYITjX1vGfZC0lLq3Ps=;
        b=UnWka7JELyAxedU7vhDJMzoAS9E4dQg3Nlx9QYxUw6G0N99RmtmcuGADE9q127OpuV
         U1KKhVXozDb2mq+UQ+Kn5dPP6vxRQhEccJXlEbUrHF+6AghzsCxsQuiZ1KnMO/0bti5G
         qcMR115vCh+blv8Ud1Jhp9cF2dUwaPXPYpGS3GzDhVCF5nc9b+6vdT4a1o4bB7c44tBk
         x8AR+erYTJNn7vEhdXZ+emqRGKfDsbhva0sKrjyZ7fTZE3KY7+UazTS3ZhMGWhn+/Nfc
         NXbLv/ApoppwpnaVVjTQEXGmFRH1z/Eg2NdUZj/bLTiR2yLTbl1H2vxSZRz0C6dBADnM
         5fNg==
X-Forwarded-Encrypted: i=1; AJvYcCXB+U8xUsaACogHy+zjzqIqBk9S2xboDnmRnDMFzMVBWuMmk8/ElLEJNLDd648Lm4XzskSvQ9Qgjqg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx/5YTyorw+flLdLuKBku4odJvgO/C2W73hOhWDqEVAQN6Jxq4
	JGwvTjQO5fJ8BNgQgaJHuylpGuay9yPC2csvDTrXfbbd6hcdUPp26NfHFh3ekuAKXw==
X-Gm-Gg: ASbGnct5RF4Lfk5E2h8tYx5YUnpGqHeBTAOEAT+ZW6hrvhj/lB4U69zu7DM26qIAGET
	4sfl56gLYHeZ9m/awV2rfg6qmHFqgIFrLGV3OfypEEn/858fcWENbit16JJ7MDZtJ3+C3BOl4Lw
	WAN60K+32ttFDNeKqi+EpEVeTmgoxudUvFZbeQWi/ckwZ0vOnflgzttc3uE9IkFxLRt108NIXXD
	H7og2uMclz6vOLMbsKVqdg2kBcu7cMDSJQmC83qrkvQhnTkrhuB3mFM8LqWOmNpxdSMkWIM2vdh
	t8P28VD8VlnVgBeD9thslkQpeHohzUr5mRax5w==
X-Google-Smtp-Source: AGHT+IH0ZHRKTsLZrLKc/D1KUy3rohOn5CJR4yzJgvM99T1ClW7r6VPnqJNi5NWUNPDmgk/a4o2E2g==
X-Received: by 2002:a2e:b8cb:0:b0:302:3b3f:fdab with SMTP id 38308e7fff4ca-3044db38c58mr11366531fa.28.1734522105527;
        Wed, 18 Dec 2024 03:41:45 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30344175b76sm15530841fa.90.2024.12.18.03.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 03:41:45 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] jffsX-utils: fix integer overflow in jffs2dump.c
Date: Wed, 18 Dec 2024 14:42:02 +0300
Message-Id: <20241218114202.496950-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_034148_029223_BD967568 
X-CRM114-Status: GOOD (  10.24  )
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
