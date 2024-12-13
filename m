Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA38FE7717D
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Dec 2024 13:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KJnOjqj/rkuBburwUbX9r4qPu3ZFZe6QfHVDmoHUEWU=; b=X/Ly8wjY0YVvxU
	uBEQ1SsHc/6kFCpvXOIgdvquDK78421uMjQHLbDog6BnEfZONuR67ZMFZ/jkVGNZY0sAGekD++Eib
	n1rLIiFMJS9nZLPisaQDC4eZpmeZGKVa0q+WzUWwvsJAwB/pWqSPwBubHtZbOy9xpSpQ4yzanAlyJ
	8h93UaLg0mQDa7oX8pkGVQZqO+tyX9adiO/YY2p/L10qvGVwWqZHE+K95xXXPqKVgPNFfvP7mc3zo
	sDtzCWVtxz0qOQnjryE5TxZ9PgpSGaqqXCHIw9Xa2P8bRROKt/ehmnOQAKwNOwPeVVKpAaZAIZnt5
	gOaGd30NMrybFyxB/AYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM5ZX-00000003oZW-3ZOT;
	Fri, 13 Dec 2024 13:19:11 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM5ZW-00000003oYo-0pvU
	for linux-mtd@lists.infradead.org;
	Fri, 13 Dec 2024 13:19:11 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-30227ccf803so18908041fa.2
        for <linux-mtd@lists.infradead.org>; Fri, 13 Dec 2024 05:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734095948; x=1734700748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kpdABj/KYF2E16cpyi0Z7gvZQeMGyfty6hwZFYI+V7Q=;
        b=W1mnQhuZLE57VpK41ryGFF67DkbiwqEd7TPW+wuxZntakWTlbgPPptIuxX8oK7UTNM
         gyNYEf1vI/FZZO184d1uP/wfYeujo6TMlGcBy3NijZh7cewjMC7C90214qggOMFeCyxT
         TkSgcBa1Rmm/br+F32BjHEtWVc78sz6g1pmYeWY1OskA96QT8zvID7ZLuQe2ygOMxZxI
         yAINUujpOmru06PQ64fik1v14mDGj8BtCRrviDlSlP/uueHzjw1DPXJHMyteTRVxH5sM
         h0VagTP2k8k7K+nCuvmurSD0OFzkhMSWJn7lxHGBDoe6FhIpcUYndCrmN9zEFpxs8tLQ
         qXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734095948; x=1734700748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kpdABj/KYF2E16cpyi0Z7gvZQeMGyfty6hwZFYI+V7Q=;
        b=SoBf+2AVSIzp2jebJCQtky9+uWeHbjEdCYVJ8v9beXuOkboT+027wUfYrlWk0Nych9
         nS9sFUDcRQoyCBjsy2BQ9a9xj69sqX2kheTbQdxgtXFWjmUGMRY1Ay3KLt7/h2WmTQx5
         MrXBMSU8TaIvP9jQJjAMGChjka9QzV44z51/sm6HGm/3UL+slC3Clq8Ws9HuZ6h8Dom4
         JqzVFvZoT2Yky4dLLzgwwAaHPD+k5nBZlnXdcM5jQ/4s3q7HpEcWr11ChxUcx6k91F9U
         0tzsLUdHjQzlGd1Zl+Dcy7ce9UP9EexwXWQ3wkVGykd/Z2z+zn9K+kd8Fa3rX9WMzs2d
         DexA==
X-Forwarded-Encrypted: i=1; AJvYcCXb1K9pDQ7yZ+TbXolBqju/2z2adKtnKYcjJ3z1xs6OfdqVvWSW0UHr50n2BN7xsOHtFHX17zrmRi4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyUZMW7kog3oswsePrRlWK1UAqlT1Q7XcZg2K9NmidpsmBG/T4u
	YMRJzR8OqfQH60zHh7KzcJYJWN9JXnlq5ZAJrx35uPUosJAvS6RycsDRih7/7b4EdA==
X-Gm-Gg: ASbGnctyFA38wjkQP29RZkDZmkB89TD4WfVas4eEqrwTjYDkts/VwwR5bEAb7yZ3JQT
	HPM1p0F8MX+kroQG7CBY45b+34ISgMJ6m0kw0mgYPA5NIBR9vG4gwrITh32tuk9JpruzqDuPBtt
	5sgb96IkYD+YqwWkNX+4sjQaa1PcRtnpDcUApQieYFL+KR2Qa4y9Mk4njos2jOcsQYCanqcIXOv
	S5+436PHcdiMHYpWbzjPuq5l5eBMzprzs7YQ3o1EMto41G2auEbb8iLRbFNVF75IyFMl+bJWUy6
	r/qkFLkg/OFamUc+uPnsKhwPCHJDikRDfDNmgvo=
X-Google-Smtp-Source: AGHT+IEL5uB3UJeopWDUX5s06KGjAGsOeIRzvQ4AuZbuLHLdKbNFZH2qJHH060xXZ1RQXy6hlDkhbg==
X-Received: by 2002:a05:6512:12d1:b0:53e:362e:ed3 with SMTP id 2adb3069b0e04-5408cd008f8mr534573e87.1.1734095947735;
        Fri, 13 Dec 2024 05:19:07 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5402542eca8sm1231766e87.116.2024.12.13.05.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 05:19:05 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: chengzhihao1@huawei.com,
	linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] nand-utils:  Fix integer overflow in nandflipbits.c
Date: Fri, 13 Dec 2024 16:19:19 +0300
Message-Id: <20241213131919.100987-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_051910_234834_4D90E259 
X-CRM114-Status: UNSURE (   9.93  )
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
+					   (unsigned long long)bit_to_flip->block * (long long)mtd.eb_size +
 					   blkoffs,
 					   mtd.oob_size, buffer + bufoffs);
 			if (ret) {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
