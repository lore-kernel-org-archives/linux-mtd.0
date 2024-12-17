Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C8FE7717F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Dec 2024 12:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/rx69sYNPlSGg4NK+fH6Xe62iZ+vxXKbwmF+GQRwAPY=; b=YyiIy0bvbHxHQk
	j7Vdw7hxJ8KgnyWNs+bnee7V3TODlm+SCDOqodgKxo/7JdqQx3BqmqEdAHGrsS72bsy43+myLNo07
	fn3SYCJzdNaI2JT12tyJn7Vy/3bUcjbC7UAYFlU4k5z3YGxHjulhDc4XwIN9q5Z1WvdvMNPe7taJM
	KqeSBRbRnkAmiFfhaQIohd0sSd/LeJSTLBx3j2ItVXxfwrwIGkF8GtG5D2dX8OS2ZzGlk1wftdTii
	HkH/6Cd6ylcVcU+I3LzDhRUKLuoAY92dGOpIvyCekkXzv71pEi5Kww1CzOvHKm2hhTmcuYiqYlrw+
	X9TxMQsRfRtCRdU/uIaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWw7-0000000DQAX-19V1;
	Tue, 17 Dec 2024 12:44:27 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNWvq-0000000DQ4c-0D8x
	for linux-mtd@lists.infradead.org;
	Tue, 17 Dec 2024 12:44:11 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5401ab97206so5462301e87.3
        for <linux-mtd@lists.infradead.org>; Tue, 17 Dec 2024 04:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734439448; x=1735044248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ASuUOJkl6aeFNQWlDGl94pD67KSK548vjrTsRR0oUeg=;
        b=kJN02dZqpyP/G0ey2lfxEXlZGFiJooCS8KYMUhwhpKlpda+0oG3CO04vHRdT7+/w/d
         dWES2THMgP81go96PD7K3meZP1K3VH3kHaBhFxb++P3RHGx6ijHbNsX73wEfeIenFCkV
         zxEcdpEW3QfzbYthZChc6LY5Nzr24O+2gya7IvJ6mWjrivaEfY42v3YEhKPTNsRHfT7F
         8P8LHrGIP86JV43ZnBDnN6Qxyp6EnzgkJ8CDy0XSCUsEfNlS1E+KhGYQJaw9a+mk6c1V
         cKNniPwI+63ehTFQYLRarJR29DQw8Qw8CBjYGGwCxZKia1xc7QUsErBUNxq906j99PEL
         vNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734439448; x=1735044248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ASuUOJkl6aeFNQWlDGl94pD67KSK548vjrTsRR0oUeg=;
        b=FwfSVOD6H9S8KzhLR08PGXmqVOc/ZeiFSWbCM05JXEA2TYw2pickk2j81nExormZgk
         zvQZ9LEPpbgLm+IlrfZWIsGxpmCx+7V9i4A5wnAx1OpW9wWUF0fky3a9neyEqBW1naYO
         fmyQiOrgufKyhNX//johu5D9R/54Ucj7B0/i8Tp5bbNZUGzmPsD+2PYrs39dh3/5ztjG
         /wm0tKFeRihdOuRoR936XmJ/fYXO79t/onL7YUtV+1BdS8qgb0+rO60X4I4NvyPcwSky
         kWUkeQIHy/bdGwXjtCq3nNS9rFoRwhOTdT4Fiut9kBpH8RCm25PxwONm8qg608ImRnw8
         e9hw==
X-Forwarded-Encrypted: i=1; AJvYcCWQmWLi2m+mpNvOu9o0f8pIbz6rUNN8CNopJeD6LxaFHuBX5MvWeXkiXwFwaydLvqOSqt2PcgPCBa8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwxkF3FQrpFtaH8yoBODXMaEx7xF8Wcm1/LB7YTM1/zsIiWHWeS
	0KF83NAkNmKNKIA0oIjxUmEW3vxRL5AtQKiTamxHpgkgCO1vZXIDWVraVGe1BFf49A==
X-Gm-Gg: ASbGnctT5TYqSCrfK1OsUgKjQz8FdWmM3QHlq3XYLQq3GMN7P1+fYD/yjiC9ZkvIY1R
	/FOcMNXQhQ53E81fvRg/RQkujeWSoRg+NmGTaIyVDXh4Mo/a3ZDPbkPstm8S4Fj5vjR0Zv3ZSxf
	mc3iXnR+R6P+kWdQQc0XfMXsvOdkA8VLqMhkMzZpFtKjxfxgld8Wh1ruV6Zq5JgYL/vcYxhxqUb
	wYnzgNCzVxcUW6Oh1sGUe5pxlpS4Sxh51HhvAQLisIGVxqaWp7Em+8JjSNy9WR4pGKPLcqu6ULZ
	f6iDVOXs1Oc9bQrjwLTX9+BR19l8ZOwiFAo3rw==
X-Google-Smtp-Source: AGHT+IECI3I4wPzW4K85NdVKpHL907eRpIIQZV/dmLp5IaVzAemIdRmYUu77wcGVLfuVBWajlyB+Mg==
X-Received: by 2002:a05:6512:318d:b0:540:2339:375b with SMTP id 2adb3069b0e04-54090560c0emr6006854e87.32.1734439447679;
        Tue, 17 Dec 2024 04:44:07 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30344061882sm12796991fa.53.2024.12.17.04.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 04:44:07 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] misc-utils: Fix integer overflow in docfdisk.c
Date: Tue, 17 Dec 2024 15:44:22 +0300
Message-Id: <20241217124422.245489-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_044410_087563_EA55D2D3 
X-CRM114-Status: UNSURE (   9.09  )
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
Possible integer underflow: left operand is tainted. An integer underflow may occur due to arithmetic operation (subtraction) between variable 'block' and value '1', when 'block' is tainted { [-2147483648, 2147483647] }

Corrections explained:
Added the block <= 0 check, which prevents integer underflow when calculating block - 1 and ensures that block is always positive.

Triggers found by static analyzer Svace.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>

---
 misc-utils/docfdisk.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/misc-utils/docfdisk.c b/misc-utils/docfdisk.c
index 486ce29..e473ceb 100644
--- a/misc-utils/docfdisk.c
+++ b/misc-utils/docfdisk.c
@@ -255,6 +255,10 @@ int main(int argc, char **argv)
 		ip->firstUnit = cpu_to_le32(block);
 		if (!nblocks[i])
 			nblocks[i] = totblocks - block;
+		if (block <= 0) {
+			fprintf(stderr, "Error: Invalid block value (%d). Block must be greater than 0.\n", block);
+			return -1;
+		}
 		ip->virtualUnits = cpu_to_le32(nblocks[i]);
 		block += nblocks[i];
 		ip->lastUnit = cpu_to_le32(block-1);
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
