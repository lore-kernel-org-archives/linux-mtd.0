Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BBEEB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 08:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w+33KumVpchQTzoRIL4QGb2ktnxvZeyjmzRt7v1Ye1k=; b=tc23B9sRCe3+Sb
	qEE/IkZGE7/gR1N2GVXKFeS+RmIqK9BTYpnN4ijYwaHA8+FUJeW0Z3wo8rMzPsXScoog1F8pgroVR
	pp1wveqbM9t4BuVwJygKu/1h14n80j2NhRcHHic+MpcgB5eHv3xN/eo4r+K+De6m4Gl1uNp6MlD6r
	2zFZkoZ/bLUUa40Wtxe3w16KrcXckeSXPaUfS13LEKXMPFtZUYrWee0IyAlZoybZVKUbWmlTKVf4G
	TiNfud3vz46bcDJyYkZsyr71e1+2hHCHrVYE5xEHMd3ntD9cCbdFshIqvfNjvoMJzit+v9jGU+lUo
	9DwxNpUo3s9GCtIfM4NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2Z2-006MIq-2e;
	Wed, 19 Jul 2023 08:29:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2Z0-006MHd-1P
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 08:29:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5WRSmD7p8kvsp7xa4uhAT4iCZu90Kz42k/8LjgP9Kbk=; b=N09FD90FWlyQc5d+670TOJsUgH
	xzlPVDf+EFy2yxVDdaKRDwlJ7s8qN2m0ZLLlBK2cp7RfMWk42RkpIgzZOf5MVISO4QlCgWln9n6HU
	Hn6v9YD9hUOsU6fTd+BJME1Uxa/rIQ99k9u/9SaV4mCfgiKCtrWvbGww9Wui49RiBAQL2OHjQ0XHy
	6npWaBOK/sTVf5s09Oj5mzAwjofyXDiGnsZDDfwW0RqnfUX2HCHeWETS4vrUMwVxGWh2xefQF4OAB
	zR8D1lhF2wfpDpbzBzO3nUpZNjKbkRxFoFfh5y1ePeoQSPwUxg9FjBJOtQVNREFZqMrP8adpxt1Po
	9C6c9Pfw==;
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLnFN-00BkNs-0t
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 16:08:23 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fb7373dd35so8803453e87.1
        for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2023 09:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689696422; x=1692288422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WRSmD7p8kvsp7xa4uhAT4iCZu90Kz42k/8LjgP9Kbk=;
        b=MQUxkW5qHcrfmo1oCPvFyde/h/ABI8+EysvW9hs1WZ2Lu0PPMp9ZXeW73kiWnupMBb
         CSxXmS0Mi2P2x1BrSsYvpDd7rTT/KuCy7VtjPhLgoupzK++Gq28fAiblgYA7022di4FF
         V1+Uucnha7RyIyTJhk0dNSbc+j+et6sBqdkPCyLHhWNK7UabQcnVYLId75Kln+cD0CrD
         vOIux3FIwac61j4RJIwrI2YR6b84DEGLcSJ+jsOP2a9XLFFwl8yc6our8w46Kh7ppngL
         p64YTfukK5o+M7J1or/l0oteaim6X+uHA4oTBRS6yCFOORVY/TZIQ475JWPij1gmoB/i
         CFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689696422; x=1692288422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5WRSmD7p8kvsp7xa4uhAT4iCZu90Kz42k/8LjgP9Kbk=;
        b=Hsr/grMp7g8WLvnssvO/3+zMu2BoNI9f9oNfudtmfcccHoLBHZwQf3t6zGL6Uq6u6k
         sFeHLsIcsNAaqLX3Tqt0ff+F0gF7cIQKj9fz4SNz/i3g6Hft5gLzwaF54jqJLwlf9yO5
         UELenrcWADcTffXL1n2jxs8li64C0TkpCbmCkOwt1eJ4Y6RPtD6ChTDQ6wjEUJw8LtCG
         9tB7sE+EaVgOTTolq3m/wjn5/eu9aEqZYdee6eFyoqnDplt3DOpcthcZYL61ZJpiR/a3
         FrkHvFYDQ4qnHA8Fl+MBRRGi2ZJ1Bm+BejXb8r4eY0Ji8Qj3afZAiP6OET3h8xZ/vUsP
         A1FA==
X-Gm-Message-State: ABy/qLYNXLKhZ2Wc8UkipwIIQPmEbDYFSYom87H4ULkR24+M1d/8cyBV
	p53OO+/GUUP/2oxZvSkuzXo=
X-Google-Smtp-Source: APBJJlGfSw2ZUglSZJ6Wez+cgAdXqbVCaZGFDRFK6PO594dT9Unip9e1T3kGWlhz+2ufMy435M9gsw==
X-Received: by 2002:a05:6512:3d2a:b0:4fb:7d09:ec75 with SMTP id d42-20020a0565123d2a00b004fb7d09ec75mr5949884lfv.4.1689696422069;
        Tue, 18 Jul 2023 09:07:02 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id t14-20020ac24c0e000000b004f86aef886asm502295lfq.54.2023.07.18.09.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 09:07:01 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michael Walle <michael@walle.cc>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] nvmem: core: export nvmem device size
Date: Tue, 18 Jul 2023 18:06:51 +0200
Message-Id: <20230718160652.26756-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230718160652.26756-1-zajec5@gmail.com>
References: <20230718160652.26756-1-zajec5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_170821_530588_31CC5D41 
X-CRM114-Status: GOOD (  12.66  )
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

From: Michael Walle <michael@walle.cc>

Export the size of the nvmem device. NVMEM layout drivers might need it
and might not have access to the device which is registering the NVMEM
device.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/nvmem/core.c           | 13 +++++++++++++
 include/linux/nvmem-consumer.h |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index a0c9153cda28..57ccd4422e01 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -2224,6 +2224,19 @@ const char *nvmem_dev_name(struct nvmem_device *nvmem)
 }
 EXPORT_SYMBOL_GPL(nvmem_dev_name);
 
+/**
+ * nvmem_device_size() - Get the size of a given nvmem device.
+ *
+ * @nvmem: nvmem device.
+ *
+ * Return: size of the nvmem device.
+ */
+size_t nvmem_device_size(struct nvmem_device *nvmem)
+{
+	return nvmem->size;
+}
+EXPORT_SYMBOL_GPL(nvmem_device_size);
+
 static int __init nvmem_init(void)
 {
 	return bus_register(&nvmem_bus_type);
diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
index fa030d93b768..3270ad81e140 100644
--- a/include/linux/nvmem-consumer.h
+++ b/include/linux/nvmem-consumer.h
@@ -77,6 +77,7 @@ ssize_t nvmem_device_cell_read(struct nvmem_device *nvmem,
 			   struct nvmem_cell_info *info, void *buf);
 int nvmem_device_cell_write(struct nvmem_device *nvmem,
 			    struct nvmem_cell_info *info, void *buf);
+size_t nvmem_device_size(struct nvmem_device *nvmem);
 
 const char *nvmem_dev_name(struct nvmem_device *nvmem);
 
@@ -206,6 +207,11 @@ static inline int nvmem_device_write(struct nvmem_device *nvmem,
 	return -EOPNOTSUPP;
 }
 
+static inline size_t nvmem_device_size(struct nvmem_device *nvmem)
+{
+	return 0;
+}
+
 static inline const char *nvmem_dev_name(struct nvmem_device *nvmem)
 {
 	return NULL;
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
