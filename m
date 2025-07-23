Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F398C83F34
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jul 2025 11:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wQpeeLZppnV7QNoWoH3p2MwAgL1Fbh4jDQhLRgksDbE=; b=awD0w5Z8qZIjiv
	GMc3lNbW/hroPDlB9zqEdofGP7FHeekHB77uFiueKx7r4ToJFZe8wRF7t2prKKvUHu+F9d/m6UXDP
	qgJe22R8UMYlLE2BAV9qOWro5mG2KaSfcQtQW3W17B7l+VRb9gYWjNSWeDo2HM9vVBZfOQJ8P4pwX
	PgLgLSp49A5GnckF0zQiNWah23W/dgzqHeqO56LXSz3EbprTPSt/D4V6b7kwJsoJQbqMRsd9mc38M
	GXiiZFZTU9MCqk9m3xky9J/N9vpCY4+gpFvKirDbFUShJphCylB7g6SxI5qfxNym2mE2wfOkpjiGH
	nq3lSXX8vpdHZEdFf55g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXfY-00000004o8e-0sMc;
	Wed, 23 Jul 2025 11:29:56 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXeX-00000004o5f-3OLB
	for linux-mtd@lists.infradead.org;
	Wed, 23 Jul 2025 11:28:54 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4563cfac19cso57152855e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 23 Jul 2025 04:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753270132; x=1753874932; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N9uQ9+Niy2nJ1FQJEcFaxNp4pMH2iDDt251KGavI8yY=;
        b=g8h9MjkhsrVtQhouqWZPMBezeyuH9lLmCVZQzUX3tJoWYFRuKhk3c0fkHrOFkp2IJm
         //+se4P+BopiQhF32SQ2M5Mn+Sl8XKf502LFsXE7JJBxQbjHDlb/DhatFpQ5uA/ahi3Y
         ox/GbZ+hyGic9kV5Eh/4PM2KqDHmLwLe5H6PgYAzQXlW5E0xFnCtnpXPghspSJQT39FZ
         rFyEovjB/AMC+G89xhcBaMXyfq7Tm9RMo4DMuBFb2twyww1qmjl7WeQJddcN9q7KOZn9
         VWErPHPoFfjVB5NI/nx8d0s/rVL80wmHMYr7pG81kXwSHN8sA8qIsGyTnF4NST11VnP/
         NclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753270132; x=1753874932;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N9uQ9+Niy2nJ1FQJEcFaxNp4pMH2iDDt251KGavI8yY=;
        b=rMIUKEqdBd2Dznn+mzfTJtyd9zkcE81En/HUmve1xccDzdJU+iTeI3vVKWrjGYxG2x
         DaLesSkgpmD+fyplLqbGI1Y1FxsWHhflCTqQ5k3qICZRBSZq3X4CC7RkZfzJXAGn2X1L
         xco4XarxR/QmHHNJ3Fh9k2Gz3/M1MWz7YQ20h9q6INBs5eIHZeHHJ4sGuGBF9r5cmSJC
         8KvyhbMHMe/3IC4mZ3Qk8idvtlJlHb2m7iYRRyXchZ//2JXeH+ErUlz6kN6NPCCxTBXi
         8mo/Qd4/QWxbno6bBTTNSBnxLU0WK4/DRJc4aiijzA183NcPYPCiw4RT5YYIsdrQ/iLb
         h/Fw==
X-Gm-Message-State: AOJu0YyY69bHbIkGFZDNMMs2cyK4jt5xSdhGD0hRmbuQsxfHF+27a+R7
	bs3/YWbZx9/48ktgmQOL9KZ2v0ak6RNHUzESq4GevmS2EjEMSgl3tv5312d5lw==
X-Gm-Gg: ASbGncu7lSUatCFDSJFAobAbAusywmpP400OeJzBxnMp4snqqqy2pEgsvEa3QsEPyAO
	fTrN6oreFYSuPHyWQWGBAjfEIxjbmcb6vYwahGOWQ8MN9hv04+lqTgpGCdCPlvCMt+i5nOj3tzx
	Q4z6QRbU/A5BE07pW5UKnMRTEtpa8o6h4jS3QY1e+TWw8qPbGBdRnXPao8W+k0BXKC6MdZw+4h/
	Mu+2v/vKjETgJs3B8UoF01jOlp4Oa9T3u9qjYvF3wCWAclgmQFdDL1p2+kTHMxfb2oZ68IYPwf6
	AYiZ5eWwTnNgLh76hHbuyIXKNEPL52otKj3r+Z5b/Wp92MWW2fjaV+EztLYidazX7tB2BbVF+wN
	Kh2uXcfEFTV/nPvPfRI/ojy6pYPt2cG3PgKopGyzBcuCnFcMkMn0=
X-Google-Smtp-Source: AGHT+IFi1ckLPBLVyYTxMv0H00l6D3M/d/O4pfQOeT41d3Ar+MmTcHT+RQxREkvLi5pKBuZnAg1KXQ==
X-Received: by 2002:a05:600c:c16d:b0:456:1ac8:cace with SMTP id 5b1f17b1804b1-45868c9791dmr22173825e9.12.1753270131975;
        Wed, 23 Jul 2025 04:28:51 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61d7fe48fsm14880259f8f.14.2025.07.23.04.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 04:28:51 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH mtd-utils 0/2] mtd-tests: flash_speed: minor fixes
Date: Wed, 23 Jul 2025 13:28:40 +0200
Message-Id: <20250723-flash_speed-fixes-v1-0-9a7e52d26fa9@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGjHgGgC/x3LUQqDMBBF0a3IfHfARCStWylFgvPUAbWS0VIQ9
 27w83C5BxmSwqgpDkr4qel3yXCPgroxLgNYJZt86esyeM/9FG1sbQWEe/3DODq8KpEYwtNR/ta
 EO+TtTfMmvG86GX3O8wJebuqzbgAAAA==
X-Change-ID: 20250722-flash_speed-fixes-a1e93dda7781
To: linux-mtd@lists.infradead.org
Cc: Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_042853_850408_42B532D4 
X-CRM114-Status: UNSURE (   8.32  )
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

The series contains two small patches for the flash_speed test.
The first one prevents running destructive tests if those are
not enabled. The second one fixes a presumable copy&paste issue
in an error message.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Gabor Juhos (2):
      mtd-tests: flash_speed: really skip destructive tests
      mtd-tests: flash_speed: fix error message in read_eraseblock()

 tests/mtd-tests/flash_speed.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 77981a2888c711268b0e7f32af6af159c2288e23
change-id: 20250722-flash_speed-fixes-a1e93dda7781

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
