Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25883D3ABE7
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Dec 2025 03:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YNvRMQnx5P09RFKjPPi/urac454McZU8E1EsIKTYLjw=; b=SBYgYrRFWb6d87
	8CpenGnBRlipB9VfFNUYsvlVWKiGiNUS781YwAbphjyTI26hvDRUf37KTzXsKOloP7Ezqxr90RNX/
	4YdRBkIeI9toJO3iA8qhcCnvZzM1JKczveNsEGs1t6Jg+QgNQayCLqGmzOE3KynIpiW00crWlyx/c
	hzv+J0aLh8OJ99/BdBYTF+fWlbnm77gXkgjS6PYKAxchqSEUP/u/rozLgPLA9KTCmeOAdFyksdM8R
	sq43M2xnxRjylMMQogVnF4ahJSzJdYgY7WWNOmb1PjpvmV3gjY9at6vRr/SOisqax4latppym0UcD
	5pLMksfbQ9LFHe8UnEZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRjMg-0000000AZYY-02ds;
	Sat, 06 Dec 2025 03:53:46 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRjMe-0000000AZY8-04Lh
	for linux-mtd@lists.infradead.org;
	Sat, 06 Dec 2025 03:53:45 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-29d7b8bd6b0so16780465ad.0
        for <linux-mtd@lists.infradead.org>; Fri, 05 Dec 2025 19:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764993223; x=1765598023; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xp4habiAbNow2Q2nLJqK4WvF0gGCPqnNUANZfkwc1F8=;
        b=Teqeng8z62BgBo86r8mgX3kHtvoT+rFzPW7U1fSi+dwJm+WVFoljQQ4dH+1aZdrbL4
         YvMwAanXeC3fkhIUGTTjb8uo15h6hBzkME63TXKhLnnUX2DLvpTwobB1ac+NJlIMSpBj
         9FNghpy4c3bWuk9M4KXc0bdgBOChQhxXNiFIoJAR5NtZn1PL+ntJvEsSry4ozOcf2fSR
         mPHSxRIJlBvyncLKhvrQWTS9gc3sd/IhyALXUtmVpbxXTbJSYhzBRgSP6wmyQXymecvC
         K6jdQjO8qXh0hz9hFh9HpvEi8co0WPRjLw6ue+wzausdnwcG9CYdG2KNhoNwAq+5Tsqp
         iQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764993223; x=1765598023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xp4habiAbNow2Q2nLJqK4WvF0gGCPqnNUANZfkwc1F8=;
        b=ZwCfOQBYAD9Ou9G6NvScyoOXJrpR6KHxUa7oDYBMTI/7XJ1feT1Awc/4v9iPVSNzU2
         KA7mpOnujUi5PHpe8XTaf5sVG1YU+U/Y3/K1COnMn3gNS1Q52tr931FNsqL3y5Oc4YLW
         41DNhfQtsoAbmTMG/UHoz8m99co7D2CZGUd66Wi34sHPAva4knMoLkjxl1GDn1Ones8p
         EoHPRRv3WwEThIP5bhNYTd8WTyQ/AcuRR9g/+GZu2t6d8uOaJUBL8++slAWcJ50bxJIi
         eO6Wy6+759ZRkgKIfObuGkS5XLJ3jFOCH6gZQfyYVOoZxsk7uAouxUlDJ/B+nWT+wl8a
         XVvQ==
X-Gm-Message-State: AOJu0YzXTTg9ES41PkljZR833RQimxNpQ8D6eBRINUXB8Jn8mYb/cZWV
	2hxnqJHEmun/sJoJlN9LUezApctm8PNEzJR3pYInm8rKwNsoeT1gEP2r
X-Gm-Gg: ASbGnctloxXl8wLERBA+uTV64rbB1q7l5+RWYko3x8N+PorKaVs6XehFEdNEBV6uQNY
	2c9T6z14e6aeEX19WuTLipZtN8i1lF/BR8V/e6ABH0QlgHKeVHuPS1VeogVi2H9bp4nDJnTvMbL
	XLqgQwndXoCXbXZaxGgQ6uU1dvuMGPfsATbwzGEhaclZvN87GN0GqB9s7BTgVHKwaxjQ1AsGEuh
	3sldwF0c1JiXzhU6IxAaMx9308lG6vEEs3eRY63nKvPCPtZ229FHpPbcAFOZR8PBcQurDr7pI08
	1KdRh6IgzU9WBoFBBSKA2RqNDSPlZl36SenK76HJBElIUWzLNf//nIMtHQVtdxDjbnkabT5TyyF
	xGLgXqQGDV8as/0zGBXPOSKXdFJmfBZnPrtr8Mmii33DI7dl7mYX+4G5XuqpcPoWalgpgwDJmfF
	7fPbxnXvbOfB/cSDwq8ee1iWzWXMiw/DJF52lXrf/Enw==
X-Google-Smtp-Source: AGHT+IECHCzvg2dPpQMNfR3Ad6XNxcN8LiBrxGsedR08VJUQWMTAG662Cl4arK396Ch6yaQqZcEyew==
X-Received: by 2002:a17:902:c946:b0:267:8b4f:df36 with SMTP id d9443c01a7336-29d9eda6c2fmr113818695ad.29.1764993222583;
        Fri, 05 Dec 2025 19:53:42 -0800 (PST)
Received: from localhost.localdomain ([103.98.63.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaabf5fsm61995125ad.78.2025.12.05.19.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 19:53:42 -0800 (PST)
From: Dharanitharan R <dharanitharan725@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dharanitharan R <dharanitharan725@gmail.com>
Subject: [PATCH v1] mtd: sm_ftl: use strscpy() in sm_attr_show()
Date: Sat,  6 Dec 2025 03:53:13 +0000
Message-ID: <20251206035313.10190-1-dharanitharan725@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_195344_078732_90874677 
X-CRM114-Status: GOOD (  11.07  )
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

In sm_ftl.c, the sm_attr_show() function currently copies
attribute data using:

    strncpy(buf, sm_attr->data, sm_attr->len);
    return sm_attr->len;

Using strncpy() can be unsafe because it does not guarantee
a NUL terminator if the source length equals the buffer size.
Although sm_attr->data comes from internal structures and
is NUL-terminated, it is cleaner and safer to use strscpy(),
which guarantees NUL termination and avoids zero-padding.

The destination buffer is PAGE_SIZE bytes, which is sufficient
to hold sm_attr->data without truncation. The return value
of strscpy() matches the expected behavior of sm_attr_show().

Replace the strncpy() call with:

    return strscpy(buf, sm_attr->data, PAGE_SIZE);

Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
---
 drivers/mtd/sm_ftl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index abc7b186353f..229fdc4a754a 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -44,8 +44,7 @@ static ssize_t sm_attr_show(struct device *dev, struct device_attribute *attr,
 	struct sm_sysfs_attribute *sm_attr =
 		container_of(attr, struct sm_sysfs_attribute, dev_attr);
 
-	strncpy(buf, sm_attr->data, sm_attr->len);
-	return sm_attr->len;
+	return strscpy(buf, sm_attr->data, PAGE_SIZE);
 }
 
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
