Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8617EC531DC
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Aug 2024 23:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MKsE4l4p6VQoG0JPrAtn5q8lyHe+y0zpgO26jqpXZ7M=; b=uafJjmMDm1QM75
	IkLnbvgrAWm9BN8TmLfHVXxoCPkS1k+p4+gYOHGp9EJxpmK8WNNtcsVPELyj7eqLkzx3IietbVhtL
	29RKjygfrXIxD2YGz7LnnbrqpX+7IBmfAnngPlHs+RlYvmwxud9AB7YhBzWkaoFHZblh9cgpNAoHE
	xtJrN88Sh9ifO2t16Uj8Ov9BQyVhbRgia+ho9FUt5YTaF9uHVl08svLlmBP9yh5j2GUin/dKeFgm6
	L5tiQfN+T52QAf9ipwq6efYxPkKeajUMCuuMtQrZ+qG+hTCHeNaYoXpuffTeGaPrtkefzg/Bm7aXZ
	keDgLEf3KjEIoEOpgbVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scYdB-0000000Ci9b-2k5T;
	Fri, 09 Aug 2024 23:02:45 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scYd3-0000000Ci2P-0JYh;
	Fri, 09 Aug 2024 23:02:39 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-36bd70f6522so1345481f8f.1;
        Fri, 09 Aug 2024 16:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723244555; x=1723849355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mH3iAq1TAeBK36lg95WliQsOcKLSEbditM8M8e4wTwE=;
        b=gXou8smySe7sCaoEDZceQxgYhoj3t7wsUCD8mT5duCZAx7lo1DKkom8Loj431itgz+
         Fp422lopdFwVSfxoXlS8jCG3w9xrMDSDxncP4NaOgapvTgMj7J7FllmsaDyOlscbTiGv
         yA/zAJgjvZz2thIIXXG4WHo3pMg313a7WXFj4isr482o7Dlk+0Gi370I9EFHHGG6DWQs
         fPEbwkln+TIKo/kzsu3HWGCuYArkeACZ5MoA/IdIox7Tnyxi05fCMiJNJKa3X34CJEbe
         6tOYV5MdELUFuh03wY7CYtR6hvSysQew7x11jwyy36uNuyNYJgJncj0XepsRf538NL/T
         i1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723244555; x=1723849355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mH3iAq1TAeBK36lg95WliQsOcKLSEbditM8M8e4wTwE=;
        b=D1PiU7RNJj7dRAlC+IODNJPif5rvtV93zcyuLrRmGw+18P9NIt2Qgv8DLlEFrNK8FU
         oU9ghNDou7HGMeXeH3Ofeii9NeeTHT9UbFhdSHQQtUjHhd0y/SC68O+GHDBfH05P2Zo1
         U1cwJMvKBOR8147BvOg5S7CN38sZld9/rMNIgD1g+kFiEncZh8qSfEDQtNQvmdyDLJ5n
         4SWAeQIuv+DMFcQgrvbOb9wi4l9ssPx3oT2+tfhW6gle3O1HAsVGoiTEzn5u+B/XA5jY
         8y52hB4fl8zACevoCqknzON7crggNmwbQ63UOGW6AO8jjc6jyuYCB9MUmliB+ty5pNpG
         j3Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXAWDy7mFCt6BDmIyrUw8k8w6bR115h4nICMBm06f/4MekgQEBF2dgOhMhlLsee/Pdw9Yu41rmKoCkRV8sbVXDP0jLS7JPkbtUNTy3tRG+6D9LlsuAWWg1qlS9zUib6AwP9qcuEeYwwNxCGZejH
X-Gm-Message-State: AOJu0YxnvgmBv47EeBH30CVqbzRjA99EjZGLLVO/6FvjqeWLNrz83xBM
	0e1wNB03mtw8g7dsPdKwkXKw5LzWVF24LrpLWhiUH5rsnyvKJAG+
X-Google-Smtp-Source: AGHT+IEYUgoe/HmhkLHhfaXC3TnoDjBeLv9p7ql+4nY9eg91VGbHZYMA1St4QZZjnSafD8UlbLFHsQ==
X-Received: by 2002:adf:e98d:0:b0:367:91d8:a1d2 with SMTP id ffacd0b85a97d-36d5e7fa63fmr2252440f8f.30.1723244555242;
        Fri, 09 Aug 2024 16:02:35 -0700 (PDT)
Received: from localhost.localdomain (host-87-10-253-138.retail.telecomitalia.it. [87.10.253.138])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-429c75044a8sm7987485e9.9.2024.08.09.16.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 16:02:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Joern Engel <joern@lazybastard.org>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Saravana Kannan <saravanak@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: [PATCH v4 5/7] of: also export of_update_property
Date: Fri,  9 Aug 2024 19:21:03 +0200
Message-ID: <20240809172106.25892-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240809172106.25892-1-ansuelsmth@gmail.com>
References: <20240809172106.25892-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_160237_141622_A652C63A 
X-CRM114-Status: GOOD (  11.00  )
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

Similar to how is done for of_add_property and of_remove_property, also
export of_update_property to permit kmod to use this additional function
and correctly update entry in DT.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/of/base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 20603d3c9931..b2d523cf4925 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1746,6 +1746,7 @@ int of_update_property(struct device_node *np, struct property *newprop)
 
 	return rc;
 }
+EXPORT_SYMBOL_GPL(of_update_property);
 
 static void of_alias_add(struct alias_prop *ap, struct device_node *np,
 			 int id, const char *stem, int stem_len)
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
