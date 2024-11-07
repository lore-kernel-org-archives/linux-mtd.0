Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC22D4336D
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2024 15:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5Y0bEpn6KMVSGGawikK1vj0+atr3L/61RJww98K1/Ok=; b=kWsvzQBw/McO5I
	sFJJnRsIvlHhyG7DiPHmrxjv7wO32/XKnkpGoV8yGEaHH0k8qWwnfM0A9rlwQ6pIiCguJqMZnT3Kh
	rzKn78m2+rGgSYYM7T7wyFfOj51Fk5dBkFU7DTIxTUXidfI6F+zUh44EY2R1fJf7UFjLIAv8tMm3I
	X1aEh6HeUE7Jr1BoixmyidoXZDc6OfAkgkEseXlluE2HFImNrZVpe5XQ/8mEmt73OfvuONLTVcsH5
	vrmuvAz9EytfE33Rkvv70Hmhq1YCAo3KTtXzFeQLmgJCNK3qvgtG9lb7HYCVYtQY+93gq53Aj0HCf
	HA7YTB7NHUtAfL9z3kUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t94Me-00000007QtS-1sAg;
	Thu, 07 Nov 2024 15:24:04 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t94Ma-00000007QrE-38Sm
	for linux-mtd@lists.infradead.org;
	Thu, 07 Nov 2024 15:24:02 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-37d462c91a9so647504f8f.2
        for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2024 07:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730993039; x=1731597839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iu+6qwj67jqw/aMxFHS0WsWdHyUYLzz5doN8TK6GCeA=;
        b=AYBkBkobKhb+dzVb0R7wMhuvUEqe08D67U01oBLWPxmSpmN1fhtNjwKhDWn23rMtuG
         QAriADZJ7QsZ1LSF+VtdrAVob4SaAd8WrQXFi2h1rJd+DUXRqUgFdETv5S3pnEC3KriU
         O074azC4Q7UxpP73FBoMBhrm4qfbWSw1pzgiUnHX66JSr6aw2VqXXOFsVNdQ8f+54jnU
         b7MQpm55flbYSAjVyb6NOuXrMeD10mQJSyqA5F5nUbfbE6ngunjX1LseU7tsiyPGT+Qw
         Ibo3eIs4Ydk7WWiNLfjuUmndFLyXlnfwLjlNuSSg4H7WflT0a5kwS0/cYSjwkg4sUqVA
         eydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730993039; x=1731597839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iu+6qwj67jqw/aMxFHS0WsWdHyUYLzz5doN8TK6GCeA=;
        b=kbw5o4tfKQrd8Doy63IUXRnNtP7dDJVxgKdWUxC/3PrGsfJrVFp2QzqnXFB9T1BVG4
         yghEmRRqkridrbFDe3QNuJzLrlXW8fLSnl3LMuTXRpOMn6pkwek023C+ZXZq7Z7lY1EU
         UZhXZ+YKWCqNLN1XGC8hJ9V+VZm+Mkg8Tmmvxvyrb0GiodQWsqUC+W1e3foe6PxDR5Yk
         mnPoYBm6WNBDrHtKJV/Mjvh4DdrejWh6wNfgC2p2hdQna1U1+9ioZ3vhe9Zq4mso8O+A
         XJfGlY5AZVOoQet8gxVqRi0hPMO+onl+hdAciA3IPc9zPW8mRoB8aIuC4iHTj0ifUlrH
         y6MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyXoRbAc8SLs4wJSsIB7+9UFFT8QQ9GU79ZEQ5sJqy9Qfnv34nUPbfi15fgckhKl7DqGAZkIWc7N8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5WPW653ThCuHtCb+hXf0tDPqnUkLnkF04sFrt5Ek2/3/5dYse
	7WpKS8M6ljbCbW7f1RYuK1Yn+P1A7jWIWcKgNigJ1/vdRN9jEHoF
X-Google-Smtp-Source: AGHT+IHGtxXAynhb3KJmGzpenqjLjpVrlz+NUezG2N9EzScTrr3fbysZ49WwOOa/gl3juBSTlHoRwA==
X-Received: by 2002:a5d:6d89:0:b0:374:b71f:72c9 with SMTP id ffacd0b85a97d-381f09c6060mr278504f8f.16.1730993038544;
        Thu, 07 Nov 2024 07:23:58 -0800 (PST)
Received: from localhost ([194.120.133.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed97e46bsm1964610f8f.30.2024.11.07.07.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 07:23:58 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: ubi: remove redundant check on bytes_left at end of function
Date: Thu,  7 Nov 2024 15:23:57 +0000
Message-Id: <20241107152357.63387-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_072400_919932_C270E20D 
X-CRM114-Status: GOOD (  13.70  )
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

In function ubi_nvmem_reg_read the while-loop can only be exiting
of bytes_left is zero or an error has occurred. There is an exit
return path if an error occurs, so the bytes_left can only be
zero after that point. Hence the check for a non-zero bytes_left
at the end of the function is redundant and can be removed. Remove
the check and just return 0.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/mtd/ubi/nvmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/nvmem.c b/drivers/mtd/ubi/nvmem.c
index a94a1a9aaec1..34f8c1d3cdee 100644
--- a/drivers/mtd/ubi/nvmem.c
+++ b/drivers/mtd/ubi/nvmem.c
@@ -55,7 +55,7 @@ static int ubi_nvmem_reg_read(void *priv, unsigned int from,
 	if (err)
 		return err;
 
-	return bytes_left == 0 ? 0 : -EIO;
+	return 0;
 }
 
 static int ubi_nvmem_add(struct ubi_volume_info *vi)
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
