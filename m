Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A54C021B5
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Feb 2025 09:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QpnG1Z1ewNMuYcSDeS9skrxCX9kypMMoHVfy4mb3kaU=; b=Tw3MdznO3VB66L
	G1Ooh6hHT7hZZCHrt1ngIrQuK/6clh1cKIvC9l6jT/zDSXIJBj8B4K0/0VtlInq8Z4j6a4KutHK0k
	iW7QrbU5XGEc6RtGWvIFejlllfZIUKSnLxQ4d1aTHSsZ8Ln2L/7eVoeY3t2sLvXcYvW9WJqj+zXti
	jVdO1F2fPMeD9HWN6fGprOYRqKFM2jaG+0maEyRyKU6ZoCKp/Xk5EZQwZfVBGgPi60FrruiMjn3xD
	XoTp7nTwjKllvgwrw+FZZumB9NeJ7chioPdUXgTP+Za3D16uYT4AGar4JpWdj+n3as3AGn3UlRuQw
	DnFL9c/5/Mx6Ut1R/PqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPhk-000000051Oo-3jWZ;
	Fri, 21 Feb 2025 09:52:20 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPTZ-00000004xmm-3qIi
	for linux-mtd@lists.infradead.org;
	Fri, 21 Feb 2025 09:37:43 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-220c4159f87so25823525ad.0
        for <linux-mtd@lists.infradead.org>; Fri, 21 Feb 2025 01:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740130661; x=1740735461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qnMo1WEwQ/BmVupvZbzAM+bCOTzLXXqhIMeYEqG++fc=;
        b=ByurF/GfV+NRdPPcjbcOCevdefcxMcoFkk0KiQjD8XGmMJxYEh1qWmlPBaEC+Ky/tZ
         nyVqmz2v7WrT7Zv3lP30r0QpKBUuPMMJ+15hpgqqUgRnOJHVKBjrule+5rA68r57DV5T
         Hty2CT/y/BDScaF32xiC+y13EFUZJYdBRU1xvbQLBWa+fvEm7BZxaMJsVpoXyQVR8V+R
         4wW4Z1MX5EHTFAKQ1KjJw0zdRzyfBYum4LkyXFZYsYVkRnVktvvAK+1Vx20kffkcclf7
         ojwDQutGP5L56pke13miIGUo+VK2BnRUjvuF/MAJDQ+YeMr6i2+BYuC+e8s5Ok7eH4HW
         Lvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740130661; x=1740735461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qnMo1WEwQ/BmVupvZbzAM+bCOTzLXXqhIMeYEqG++fc=;
        b=xM8PSKl2nY+q4z18TluSSz+H4zV66rfm7mHmoj9UcUQ7xh47Pd6VJQL/a4jlFuqc8X
         pzNIJNsLzmRpEyXKJIabUbZjDh6A4Xy2ck/HPgg4ZMWNz10rP9uidxksiOT33QvoWfuO
         JHmCatDyjAtPh+Z9f8dDoSyxZb9OYnHLbPzVOZkV4k7xnMB13c8O5q2nefjow8wuOaWE
         OtF/1llP934/ilhR/DDwpz3mOxd43zfEcDOHrtdHM5ag7K7oAcxgbmz93ATokOtM3ONm
         7MfayR9kFMfZlzD29OEGZO8VgaokqfLK5wsRzs7TFda0rQSJ5OvKefb7lPT9Y/mqsMxa
         gxmw==
X-Forwarded-Encrypted: i=1; AJvYcCVUSyGnHvJS0xFPIIoWP7jkcB2s568qEfhh1VUJlKObUnEOiK/VzikUOSkJ1rjD5BCC/9CN1559gno=@lists.infradead.org
X-Gm-Message-State: AOJu0YyajSmYJu2XNKDcuGmPobxI9HFrtukOW1eknBUT7os/KjoHoJUL
	gdTSB6R6EaaNdP8ErYcRj7WGEubLsbPwvSx/QcqVonbxWPzTFh/5
X-Gm-Gg: ASbGnctHIGxrmgzGfowEiRxWivXraBYA9Q57F1XhwOUOYRgfWFIrcxAU8cfRGn5pNHW
	G/KYIyB6e1DOkvmYRd1Bagnn9UCZBHTr8lnVQMBntO/8uCLU90TsJaiF8KLQO/BQC5I9rrZhcmE
	wAfHjfnfF8FKPHayAOXhnP/jlsZJCjc//AP8bEW/vGxeN6K5WRYJynb8pWtYIx4cmxAi+FVs3Q8
	RTFbkLvZMx4mZe9ySDOUVmYPM7ofX+HQhT1l9E1kB4/sVr0VC3dxfqSj6hC5kiVfRs917vjZN3G
	cxalL1Aqfyl+dG6wLnWhS3ruLrNu2u9fWBh+ztonqwUHd2flwQ==
X-Google-Smtp-Source: AGHT+IFMGGM864UQUgG10ghybDKw9ooluRG1HgWZV1ZIVwKCndiDqk7V/e+nltWImTE2xNzNfDJIog==
X-Received: by 2002:a17:903:2f06:b0:21f:2ded:76ea with SMTP id d9443c01a7336-2219ffa36d9mr41553025ad.36.1740130660877;
        Fri, 21 Feb 2025 01:37:40 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d536455esm134261835ad.74.2025.02.21.01.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 01:37:40 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 4CC56800B3;
	Fri, 21 Feb 2025 17:47:53 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v4 0/2] Add support for read retry
Date: Fri, 21 Feb 2025 17:32:58 +0800
Message-Id: <20250221093300.430994-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_013741_975151_56E3ABB3 
X-CRM114-Status: UNSURE (   9.03  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

When the host ECC fails to correct the data error of NAND device,
there's a special read for data recovery method which can be setup
by the host for the next read. There are several retry levels that
can be attempted until the lost data is recovered or definitely
assumed lost.

For more detailed information, please refer to the link below:
Link: https://www.macronix.com/Lists/Datasheet/Attachments/9034/MX35LF1G24AD,%203V,%201Gb,%20v1.4.pdf

v4:
* If set_read_retry fails, it should back to read_retry level 0

v3:
* If set_read_retry fails, it should return an error

v2:
* Remove fixups
* Remove the function of init_read_retry

Cheng Ming Lin (2):
  mtd: spi-nand: Add read retry support
  mtd: spi-nand: macronix: Add support for read retry

 drivers/mtd/nand/spi/core.c     | 35 ++++++++++++++-
 drivers/mtd/nand/spi/macronix.c | 79 ++++++++++++++++++++++++++-------
 include/linux/mtd/spinand.h     | 14 ++++++
 3 files changed, 111 insertions(+), 17 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
