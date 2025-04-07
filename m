Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2DEC36010
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 08:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TBKjWeM23/W90eP3+yHELJh3RUDXetlfSYIgFDBxaxU=; b=vozF8sQTDhJBWm
	4BJRJg/Cy+G3gtM+DZLlNscmRm8a6XJoPdCV1xpUI2SWtFGyz95oSzShXv7UVfI53y0A27oTqzKRB
	qag/ciR56/86uXeht707++wC8w/16yghLlCyDXW8qQwA0BKIqH/JPR9nWKoiFi2PVWBWsXnRpDsO1
	BazQPgU5TBSxkb9uSb5/qSMhfsuosl7AOIYYPtEkz+wGGWLa0GiyDF1TaY7o2sRMTBECzpxQ2TAb8
	I1Xjx33YDnsMBUD72Y4fidvvkUAJ3KqkGwwG9ur0z30JTMPuYT11JhiAZQK/yLEoymCP4hYGgfEZ/
	Jf0RSJEJvctCEkPXVACw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hVZ-0000000GvnM-3v5p;
	Mon, 07 Apr 2025 08:07:05 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hOR-0000000GuHe-3vz8
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 07:59:45 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-227b650504fso34378365ad.0
        for <linux-mtd@lists.infradead.org>; Mon, 07 Apr 2025 00:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744012782; x=1744617582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wZvQeqbNeFtipMFJh4QLnF8AgkLewuOgWJqAelmysqc=;
        b=TJrUVQbBHBRuBAKdyo6k6T89HYU+VuBy0cx/FIR2ep0b7cR8JAlBu2uM+cZUJurZY+
         VAedNYt7lQGqft4BOfqsIEzHwrhEUjRXm+htt6ZCziLOdRHwEqI56mf1xa3Gx8S+xrVk
         GNK1TvvrsEnhTKrF6wIULkQE46JtpYAzcJNi9mmFqS2rb3u5wVD+WfdDomoW+EAUabfp
         r9evZ0XFA7U9fJmcf148W0hGPPX6ZdC3RQHc45eUyplH7MqZNN5WLW4DbfdD7SGQpmIl
         iVnekbcOSWCM579KA7pr7J5zRbN3jQK1/Y076upOmr1s5QuA0UVebUa5rCbIEJCsG5hW
         bfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744012782; x=1744617582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wZvQeqbNeFtipMFJh4QLnF8AgkLewuOgWJqAelmysqc=;
        b=R85A1dvzpNhVwfIRfUZwpu1t2Hgw1KIQ8Hbasf7IUUgLXGUA3YysWfKfqz+1fxfHXs
         rjCkzr20zxcX8piDU3Cjqb7H9zMTQV8oSr6b47av0cpnYtkgg3PXWHIgDUJshweYtxhn
         9ONoy2Qcdu4Q8UKXw2dj5ZMTc2+s0jDuXAx/BEjBnsAgTDv/JoXlDzCTCHDFOFWswcXn
         +yYQu3XdYtCkyQqFi+RoAiENA+CyOfZmX/JtUXgtQZeajM2ULPy50Yw1BxEpEb2I8UeG
         OnRQef6T2lhXfmckpkvbXpYF4q8gQvWP3MRs37Ya4oamop4peL8frc+HxkrEb9OFL4zK
         QLlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVbf0yM4wZrQip361LH0daMqhpAL6XVZqX1wacVHodJHS3Od2beDTBoSH44Ti5r+CbOVI6wj2kVpQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPrquS7Ypw1aV0Tblj+cACNmlmyHQRgKxf5CKy+hqzcBCdPVmb
	um/lG7LCKtD8qq0dAEy0pQwx9WKzIj2hWP5cf3icRU0706+Pa9WI
X-Gm-Gg: ASbGncu+TH57mQxHwcH/uB1CT/MjyklRnQpr7+0AlzD03KiGQZ/fjWyZr/mxJRDdfaG
	AHjzGvmWVWQl/gNTK5KpgC2CA7oobHYiXa2WXJZON5p+LuT3OXADT0VcT6C2+SwDiX/JgzDJntv
	FuFQbLhxrEoqwErFewpIKft3pb7NILsCzdmG2Bj2WTSZG0F9ykHv4MH5i7MoVO01Ko+vPEQfWzf
	En93BQ/k2NcYDyG4MKtIJvpY75m8FUw8ziofzHlUsC08ILddLJC/TwIyBuY8s+A4O53Q4zTheor
	ralvzKqMkLVhsORDveO3gjjVHXCaV3TYT1zPWOXxM9ewcJjSFLYvPBwL2dt5g74UzEwY
X-Google-Smtp-Source: AGHT+IHLU+fVvi69Vc+tn/XdT8uaHoBkyQQYhXrJ1flpQj5IijSqiWEQOMNP4LSCt4YNzX0V1pOGeQ==
X-Received: by 2002:a17:902:d50e:b0:221:85:f384 with SMTP id d9443c01a7336-22a8a05b5acmr158540105ad.16.1744012782580;
        Mon, 07 Apr 2025 00:59:42 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865bd80sm75046705ad.118.2025.04.07.00.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:59:42 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 7D875801D7;
	Mon,  7 Apr 2025 16:08:38 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v2 0/3] mtd: spi-nor: macronix: Cleanup macronix flash info
Date: Mon,  7 Apr 2025 15:53:57 +0800
Message-Id: <20250407075400.1113177-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_005943_974681_6EBB91CF 
X-CRM114-Status: UNSURE (   6.71  )
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

Organize Macronix flash information to make it more readable.

v2:
* Support 1-4-4 Read and 1-4-4 Page Program by adding fixups for MX25L3255E

Cheng Ming Lin (3):
  mtd: spi-nor: macronix: Drop the redundant flash info fields
  mtd: spi-nor: macronix: Remove duplicate flash info entries
  mtd: spi-nor: macronix: Add fixups for MX25L3255E

 drivers/mtd/spi-nor/macronix.c | 73 ++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 34 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
