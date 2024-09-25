Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8653ECCFA02
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 21:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GWbaBieIfgJJu0IaWrBVtf4Jcb9M9iFp7sgyCHqeTqo=; b=4vczzs+fYIEQW7
	LFWfANxsIny+YybArw0S+RI3hKLNJE1Hul7hxFf8XWMkhpJTXJVj8NXuL/vQdVSM1vr2IQFgqGXIg
	UrDo/BpyH7NzXE+GyfAPrnjNpfZCOLjvHsWuS3p2bLij5w6k3c9J5lS5ooS+ofwGCX2zHkDj9+jlC
	yVQq77rkff6KKBCFMoItNRyG0KnNHcGbIvMk+XeJuGndN1Apr8oIi1CMHgwqinSy72UjLQuagzYrh
	8TCvR4dOoAytGdQq7k7qymh0q5ubcC1q8fW4ffEyHCMepBUja/UK9xAGTlIODHC+80hqP53lnFyO4
	1m1f9bHRhoTfdIQeTsLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stZqS-00000006bD5-0g0h;
	Wed, 25 Sep 2024 21:46:48 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stZqP-00000006bBd-2euY
	for linux-mtd@lists.infradead.org;
	Wed, 25 Sep 2024 21:46:46 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42cb806623eso2234485e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2024 14:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727300804; x=1727905604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=36HmyHvoEEpKMI8/Stc+TIqGBije17bfud9rEk2jFTM=;
        b=X2nZi8/9ifP/yfGu6AmoGGK9mOLQe8asqlbM7zg9uwwku01Qokzysx65gybUE0Cws9
         3Mj+WI0BEc6mCk7MrsnAksgIJMC5yrvv648a1y18GruDiLu5gO9jI62El6Nt9oTw2sId
         CJAmFQHtQDaiCEs0MG9+IuXyMxQOMMqv4zYijKGbZbh30IBHML9tbU69TsmqPnHTbR1U
         5EIzvCK795A95Rr2cxQaMe3S5crNbX8QJhU5UE6TxkLU8qjlYSgVO1kL5r5I/BZZSmWq
         gdzPStMcedYeOKac4oYvHGZwVLnN8EGKXOaTgbaDaVZf4lVkF4fwYeEobrKDMX1P+UuU
         KnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727300804; x=1727905604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=36HmyHvoEEpKMI8/Stc+TIqGBije17bfud9rEk2jFTM=;
        b=mN9Ewduyvd6+9/PCC5vFgYYfJl26/obwHolDv+DvqPUHUBnMhuKWCHv0WChbpZ5uEk
         uLvayeyTdge3Uw0ALwel4KAoAd90Vf0w7o5rKmKfWiE+6HX0rXPl9EMFITBV6nVWmrNu
         cnVbjFB+ItHbMrzSVL82Tv3PMTXgw1wVZiO5TshzaoJ+AcbZuwpXztdf2UTj5PRVK8Mi
         JzYvWcevrgroq0R/u5aiaFXMnnp+3+JMTxhP4zqfrMlbuDmeVwbN4tGaD1wG0FZ5Zs+H
         35g6i06DBH1Fg/7LEZgomG2DaPieGUnfxwjNODzOHP3sfmQpU3bs8ode7O2lJRWZUGEj
         YR/w==
X-Forwarded-Encrypted: i=1; AJvYcCVZ8VMHUxWbx5MKHvBVYBur1Y10v/GPXUDKMp9EW/U1ZkwKR11/WjjDfpp4OKRpX8kJRPOPmJl/Xfk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwipYVMUXG+1WNhX+R1Fx8sJ0vPDtLP9fYSUNfOUJcWp08pKaLj
	veI88NDz95as317pnbkoqyeCADQF3EVQjKWNNQDY+UOpRVABEAIh
X-Google-Smtp-Source: AGHT+IFEGvmVDdovHjIR/TZhLA7blPbTqS8qJmoeaPcP9+ntt5+F1WQucpd+dgUvMfPNjk8XWg9Z1A==
X-Received: by 2002:a05:600c:6003:b0:42c:a574:6362 with SMTP id 5b1f17b1804b1-42f50b68f6bmr21103775e9.11.1727300803624;
        Wed, 25 Sep 2024 14:46:43 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42e96a1f2aasm28802565e9.45.2024.09.25.14.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 14:46:42 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Simon Glass <sjg@chromium.org>,
	INAGAKI Hiroshi <musashino.open@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Li Lingfeng <lilingfeng3@huawei.com>,
	Christian Heusel <christian@heusel.eu>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [RFC PATCH v2 2/5] docs: block: Document support for read-only partition in cmdline part
Date: Wed, 25 Sep 2024 23:45:22 +0200
Message-ID: <20240925214544.6114-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925214544.6114-1-ansuelsmth@gmail.com>
References: <20240925214544.6114-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_144645_705130_DB10A646 
X-CRM114-Status: GOOD (  13.22  )
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

Document support for read-only partition in cmdline partition for block
devices by appending "ro" after the (partition name).

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 Documentation/block/cmdline-partition.rst | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/block/cmdline-partition.rst b/Documentation/block/cmdline-partition.rst
index 530bedff548a..526ba201dddc 100644
--- a/Documentation/block/cmdline-partition.rst
+++ b/Documentation/block/cmdline-partition.rst
@@ -39,13 +39,16 @@ blkdevparts=<blkdev-def>[;<blkdev-def>]
     create a link to block device partition with the name "PARTNAME".
     User space application can access partition by partition name.
 
+ro
+    read-only. Flag the partition as read-only.
+
 Example:
 
     eMMC disk names are "mmcblk0" and "mmcblk0boot0".
 
   bootargs::
 
-    'blkdevparts=mmcblk0:1G(data0),1G(data1),-;mmcblk0boot0:1m(boot),-(kernel)'
+    'blkdevparts=mmcblk0:1G(data0),1G(data1),-;mmcblk0boot0:1m(boot)ro,-(kernel)'
 
   dmesg::
 
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
