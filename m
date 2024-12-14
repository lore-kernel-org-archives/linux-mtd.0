Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3B7E7716A
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Dec 2024 12:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IivTii0qHLjqaloWpSRPxZp3R0wGRBmdCTw8xbzheWU=; b=lEPP9/xutgguA+
	fydPBXDi/h4ZnwCOa6tgVPF06/6mSD6fcmqM45+HmtOEJRv0bDrha8Azb2vw70mZVCBK1r9jrBX2Y
	J+jKOfzGz4qpwrnJPQbdLelxoHaelJp7EEQHqkre1umoj3s8gVB9oFDjJkl4Bc7hatC21Nbt898Mq
	SujsbiNAOZRXdj+ZD3CtRkOfJL/MVn7odg4SVXU/+Y9VsfTWHMAzol/Q4cIw6BEdIg89blxQRwXxW
	fecbdNpvzIk8/x3qmCQIfBAs1HbyROOVT9xVC+fxJWD/PiMu+Nbwp8j7BoRVrcmSnlsbila14/ujn
	PUhRFVzypICpqyTd10cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMR6m-00000006JMJ-3rEK;
	Sat, 14 Dec 2024 12:18:56 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMR6k-00000006JLw-2Mq7
	for linux-mtd@lists.infradead.org;
	Sat, 14 Dec 2024 12:18:55 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so2908321e87.3
        for <linux-mtd@lists.infradead.org>; Sat, 14 Dec 2024 04:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734178732; x=1734783532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lzHxvKmeSg8nbQ6m5KIhrKUUGfH08pUFVwHbWUg5RII=;
        b=QMYfA1+GBFzY0YRjAEWyChXcUfGGBhW8vZ56D15UJ2KGOyf2UdsXJfUW0IOLCR8KHJ
         IwtbMdyVeAO4kGPHfbkD+nRJcYWJWM87s66npZmTb4i+I/CH+ROLpUvwUgsvqBIL6QVL
         5dftareABcofiwJ6PVqu4w4w2aT+GnglS3UuXIjR3NiGxGUgR1dj0dS+ImzTpYWcJ06h
         Ykm6KDzubxKrcaor+0rAYLfdWB84bm218RElTf6I0wEo+pPW8uwc39jUy9A5omSd6OJH
         gbA5wKAdZdBB3at36uXT1arRUcibNgdkhMx0N8Vo7Qle+JZs1wqQiQMwzScph2/a6S20
         7UEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734178732; x=1734783532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzHxvKmeSg8nbQ6m5KIhrKUUGfH08pUFVwHbWUg5RII=;
        b=SEiz2ve3SZdt689Gws0Y10nMSADt5igUye6dr1COsPuoBZ0SDeUAbto0c9cpsf+Qrb
         FOzExJp43QwQLWP4uWo8aoVb4dTtbYyqXC/inTC8CaOFE38VqqPcACc9BnJ4khOZB1F8
         MBSwwDclppk8IsB0eT+XxustAkarS6lf0brlBVs6H2U9dwDrvOreL+L5mjSZtf3wFuw1
         0sAPpBk1zBNzM0HWOkwFbhb+90AeDyiV9KNkqcBWnhIXDh263D5z7uxDa5SBuJ6vuPyV
         MJVog7YZLe8qS6Cc/TAKgp9HgSzFZK5XlBCTDvG/nUuP6iBmn9u1Wf1pfYVd8gHTRLLq
         TCZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3fpSUQjVTYsil/qu5pSWMaxO3+r/7MK5EgnamKB7fzsdzSwBgqh7sWV6Zv3p+TO2R50PJ2uZKgH4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzqW2j8O8Wk6hyFn3JrCtVyk58tlsJzPkT//rVoE8NHs51OZ1kw
	sK5G63tKeyhycMJMDyywhWB+NLJLNb4gDrfiLxeuzU16EW6IJItJUZlIMxowWnwPaw==
X-Gm-Gg: ASbGncuyW+cs2RnmN+vD80nD342J8J8e4trj6WWwNRHI9IUKRsPlT7YTCYv0Gxzjwd0
	f7BX+vgvL5Or/6yC6GL5MyXgIlvmx8mgmDNjrmS1NFrXzcEeWS9Ro4yA6ZbARdVFNqguF24AgvQ
	HIAwLmarRjV2vZrY1tgthVfB6z5cvYD2sQiiwCnhiFa9Fwi/cFjZbf5K73RDwVrv9VY2SPF59Hj
	nB2scABKAY0WnLenH8q08SuhWKCrV+6iP6asjTuoKWxr0igs6GNDh3NauthIP7YO1w6WPnr91f/
	NA3DVYh31e0wSUdIQYQsu1ARUF0F3VNmb6Zkt1o=
X-Google-Smtp-Source: AGHT+IHwDGqBF1WENRrFeiVOhxVeU9cplaCy0Oi2sP45rPaRY42TDItfKV90nJtL5YGlL0q5RAtKVA==
X-Received: by 2002:a05:6512:280a:b0:540:5b5c:c181 with SMTP id 2adb3069b0e04-5408b800764mr1969406e87.6.1734178731989;
        Sat, 14 Dec 2024 04:18:51 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c0023fsm195039e87.124.2024.12.14.04.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 04:18:51 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] nand-utils:  Fix integer overflow in nandflipbits.c
Date: Sat, 14 Dec 2024 15:18:35 +0300
Message-Id: <20241214121835.69687-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_041854_603877_7F723889 
X-CRM114-Status: UNSURE (   9.91  )
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
The value of an arithmetic expression 'bit_to_flip->block * mtd.eb_size + blkoffs' is a subject to overflow because its operands are not cast to a larger data type before performing arith$

Corrections explained:
Prevent arithmetic overflow in OOB read operation
Resolved an issue where the calculation of the offset in the OOB read operation could overflow due to operands not being cast to a larger data type. Specifically, the multiplication of bi$

Triggers found by static analyzer Svace.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>

---
 nand-utils/nandflipbits.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/nand-utils/nandflipbits.c b/nand-utils/nandflipbits.c
index 7066408..ef663c6 100644
--- a/nand-utils/nandflipbits.c
+++ b/nand-utils/nandflipbits.c
@@ -251,7 +251,7 @@ int main(int argc, char **argv)
 			bufoffs += mtd.min_io_size;
 
 			ret = mtd_read_oob(mtd_desc, &mtd, fd,
-					   bit_to_flip->block * mtd.eb_size +
+					   (unsigned long long)bit_to_flip->block * mtd.eb_size +
 					   blkoffs,
 					   mtd.oob_size, buffer + bufoffs);
 			if (ret) {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
