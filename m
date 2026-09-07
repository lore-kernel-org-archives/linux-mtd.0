Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D72C79F8C
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2026 00:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1ooiMiMQ1NDhQeWVvtv2vEM1jMnYotlWvPS4J7fFHsQ=; b=NgkB4I5PxCJuSt
	pwSiYLMR8lW0RNJ3v9ol5uI5Xbp52+P9+M6D8yUPA9A77VW/PMPhb+YyASZjQ0QHu6wKENsfmJLDG
	hsQdVtcT7O21xnvdiJZbFyp70M1IGpEBS7JlGectwmH5C6efO2P+/eR91UHNxDJnStJWrj3Hi+6aX
	8ZnUHVXp7ilW4ZXDyXWeqHViAMPU/No4nksQxWIln9/GTX0gsz0cLFk49TV9WAPFTWTs9I+r82e8t
	njwvYhMnS+/+5dYCoObrKv5vlbAn1o3lV8uUfFjkLPSn8+BtIvBwToHKMb+Bja/yslXdyiIk79SQy
	WrHEikvhIN265ITtfDOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3NX9-00000005eWo-3qoh;
	Mon, 07 Sep 2026 00:48:27 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3NX6-00000005eWM-2WOd
	for linux-mtd@lists.infradead.org;
	Mon, 07 Sep 2026 00:48:26 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cc328b43a56so2417535a12.2
        for <linux-mtd@lists.infradead.org>; Sun, 06 Sep 2026 17:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788742104; x=1789346904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EjzyVrQd4HnZ/HqhVkU3Ug/THJKIvvL7NvTJ9zdzp98=;
        b=qSzhNaNgo203vRhmU/8SXLPG/0MTHEpcH8ltacE6+dn/zt/MRkWyI4fh7xOMyAZRt3
         M50AEIhgGCNtFSJOWeU33R+fPmUNUUcKjcexj4WuT1FVi981iS/ewUproTyUHwcTKOfc
         deMOy0MInVVSwpKDFbU4jLZLVEwpGn3VLP16LO+VCntJ/cat4ke2BQ5Wi/Yh1ulzu1VS
         Hr+pkowzaO7oBVAtWV9oxEd8AUERHKEvq85uvgAuf0AH20trNldckUwpyuKM9w7Qr5P7
         8KL6PlGZo+hrNmJ1RBKwinfe8rYzXXMKGokIq7ruCBuAAfLf+z07uPIMv9mkHJV82JQH
         ROpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788742104; x=1789346904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjzyVrQd4HnZ/HqhVkU3Ug/THJKIvvL7NvTJ9zdzp98=;
        b=pPNrm9Fo8lGy+iIiMhyfFWPjKmLAFBSCmWRAjAFnWhhWZR5dag+XoUPEssoAdx3DCe
         3JQPiZhn9mvfZebrbVW3MGR7eQS5UkdIHUhihzC958AGqWNSLOpCdpY1o9ysZVuSLgc2
         zbOV8IGCJUFCop3EQFjVeQY9jb5zwEY3NFqvTyBIidSL12dc3o52nLwTBA6HZgqTul9v
         kfD06gZ+OKD/1DXYbIM63OCmdNZsTy5fqdv7riGGeLSNePtmkG4Hmd4WCly4+meX8jSG
         hQWI2Ymqu62+53vIZUTNhxvpEOwbQtB6eYaKHJFktas2te7QDrWxDO2/zyXBvX12hC+e
         PoDA==
X-Gm-Message-State: AFuF++kJsh+56LpSuS/tGTsbNMgLgmZRjmMX8JtlH0Yn8xI5aGLdeoLr
	m3d0UF1le2MUhld9PXB2APzCcqKQJkBBQTLQq8Wg9M0Lp51y1sBv1tnOPOqVqw==
X-Gm-Gg: AYBFou1wBShWWwHT4nIz0Hs6vh0xOuUbj1qPwkdxa8xKLmOeDI4Cu/t92s+NqSYPBQu
	lLIGr2utYmDYcx4Y91zaN5dUQ8pTBkcbZ2NfK7DFSDGGqObp96htHdD/Z0V9TsJAS7cahN9kbgk
	N5Rm7eVfGkJCm5wHO1mRtqCv8VoiP5mSX9cvaWsxWklVLgym48d73lUQi97RR1nb10T4TNRMAn5
	ouXTLYuVCrHkDeua+kKiMXeM8IDZ5xb/U3FrKbpJCM6n7YAE2lW3wjcaDg2BusxhxTYO72xZerh
	0xChojXc4w3Cgwoqr8PPD55o0IfaxbCI16oMlYJ5Aqpk54bfNKMpsFYN952mEV5O9gSQwIw8+Bw
	HdGV0G2B9jkKa/ZkYkAo5g74wFDN7l3MXGo/56Ktc0vLlq4I3TNguwGxAG1s9r0C6tZeiRZWU71
	+sCA9Ph/Jx8EeWQXzVzsxe7uV+qVHFEdSy83JMmOGhOgIBS+ARWdCvOA+/sb62jo6OyCz2kheHM
	lozyJlU36fyDBnGMQln/+ewQXd+ElttafhhjsH+RYN51fjwgN4hpAUbZQy8kmWkCl5J3sfNkoiB
	G0yytYPrGVepubvPyVhq2N437X0k7qPKn4NH7g==
X-Received: by 2002:a17:90b:4c03:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39b26130698mr27921852a91.11.1788742103701;
        Sun, 06 Sep 2026 17:48:23 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm20043166c88.3.2026.09.06.17.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 17:48:23 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: powernv_flash: fix kernel-doc for powernv_flash_release
Date: Sun,  6 Sep 2026 17:48:21 -0700
Message-ID: <20260907004821.225576-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_174825_076812_D140EBBA 
X-CRM114-Status: GOOD (  11.55  )
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

The function is powernv_flash_release, not op_release. Update the
kernel-doc comment to match.

Fixes W=1 warning:

Warning: drivers/mtd/devices/powernv_flash.c:271 expecting prototype for op_release(). Prototype was for powernv_flash_release() instead

Assisted-by: Opencode:BigPickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/devices/powernv_flash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index a12427d9e20f..fe1d6684d0bd 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -263,7 +263,7 @@ static int powernv_flash_probe(struct platform_device *pdev)
 }
 
 /**
- * op_release - Release the driver
+ * powernv_flash_release - Release the driver
  * @pdev: the platform device
  *
  * Returns 0
-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
