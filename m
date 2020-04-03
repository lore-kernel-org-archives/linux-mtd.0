Return-Path: <SRS0=2QCa=5T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5654C43331
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2020 20:41:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3036207FF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2020 20:41:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DpUjjpA8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="EFBVprzK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3036207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s9nmnfr0wZey45u+Z8iQOK6AFx/iazHgySXyaC/v8mw=; b=DpUjjpA8dPL7is
	YxehKSQKmjMZLyi8sgavOrMvN5cH6D2T3T76v8Dl+lsSbhqH2xG4hy8iD01ab990WN5XSPY0y2dqv
	w1+mVH9lJCDnyk3B5FjFytmi8LpcbsNrqrcfzAVySJ/GLtx4Fplmn/+FCwHtud+UtMZ22gcV2b7/U
	TtxQhezaUT1fB4+sw1LXXv1HnMQ7HsBf1//LMdMA9UjWl6S59cOV+A9pGCTH9E+qqjt3IebhOB9gt
	i7w2EMy45TKO7hoNHsToWgE+XRzj99oXXiqry8Ub5SQ1PEtxGAoRHkmVrLwOX6q9hwBiyPz1ej1Uw
	6UiR2YsZvtm+cCN9nPng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKT89-00070F-DG; Fri, 03 Apr 2020 20:41:33 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKT86-0006xu-OI
 for linux-mtd@lists.infradead.org; Fri, 03 Apr 2020 20:41:32 +0000
Received: by mail-lf1-x142.google.com with SMTP id r17so3340167lff.2
 for <linux-mtd@lists.infradead.org>; Fri, 03 Apr 2020 13:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+slmtley1jCXhKQLgxF5IMEzSagvlN4ByObQY1GK57A=;
 b=EFBVprzKDjamgabpakGgIxHFfAxy0gb02BOS9DXNPBY4eIPVP1emLadLdFdKaynyyc
 uphuA/+GtvkHohS+cApELND47kDgUMCkyzxq/B0rsnIpBHCg3ibZgq9awCQMxU6RQkdk
 ZoXlq/WpIJ3XFQt+5HOEKZo/ae7zhuQFfgRsZ5QEil36fPj4ICb9O88oRz74E81mIwHS
 nUcbB06CLar4WOdc76GnHiCEnBPD0PUBR+0bEY8vWag5PsaP8EZOoTDbVJ8R+e3f0JZ3
 seuZs4XQA5XDHHMwI8HNbNoQVpMVFsIaBuYFealvpUu4XL7rk156tUZ823SVeJMLl9lL
 gU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+slmtley1jCXhKQLgxF5IMEzSagvlN4ByObQY1GK57A=;
 b=RaTZKqmJ33YiX8rw5I2MUrDOdRlSOwwkZmeWqdSRzXZ/JhmZ6ZgRl/AU7RRqUZUVpZ
 TLj2oF+T+A6cEOp7FyCN7b53xP8vmJlOuLs7Rf5zXOYF+LTfxAGQf4AVFsYqFrKvyJEi
 IdfcJ2DPoGkO/oNkClwhm2DJPQrkIy4K/ezZdqJjAoYIB38tkIcSCyKQ5WNd/zPtEniF
 FUkJwtsH3JEmm65X4fLHptSti9m8QN3A04gh7H79VtsKEzO5EEXI86qEjs/l21XbtWt2
 I4NnB9XQ98V/Bm/piTkSd3k9HKZPj1C+dneQy6EdSPnHbjRtsfpyDBj8xrDVpXM7/oWl
 cCZA==
X-Gm-Message-State: AGi0Pua3OD8ODhxtfr6uwB5pgyyhz/9t2UsP8MjsGXSd4syB2gFAPRHD
 cqjAEgngrum4Q+VlsVi1vvywZw==
X-Google-Smtp-Source: APiQypJk3KnOwBWPfwTjZ/pRc2lt9J02HfFxJEjsO/Yx7WS3J01xChmw7X/KzvTodwT8Y2DCvHvWhw==
X-Received: by 2002:ac2:4350:: with SMTP id o16mr6525080lfl.136.1585946488988; 
 Fri, 03 Apr 2020 13:41:28 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:41a:7e80:40ac:b40e:d552:2978])
 by smtp.gmail.com with ESMTPSA id y20sm1519854lfh.25.2020.04.03.13.41.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Apr 2020 13:41:28 -0700 (PDT)
Subject: [PATCH v2 1/5] mtd: spi-nor: fix kernel-doc for 'struct spi_nor'
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <b82675c7-9c90-d0a5-f221-9f51f89e448e@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <ce0a4ce0-fefb-7238-5ed8-bec8b27708ea@cogentembedded.com>
Date: Fri, 3 Apr 2020 23:41:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <b82675c7-9c90-d0a5-f221-9f51f89e448e@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_134130_792023_11516A61 
X-CRM114-Status: GOOD (  14.23  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When introducing 'struct spi_nor', a number of issues was added in its
kernel-doc comment:

- double article in the heading kernel-doc comment;
- "point" instead of "pointer" for the 'mtd' and 'dev' fields;
- "a" articles instead of "an" for the 'dev' field;
- acronyms in the lower case for the 'dev' field;
- missing "pointer to" for the 'priv' field.

Fix all of those at once...

Fixes: 6e602ef73334 ("mtd: spi-nor: add the basic data structures")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 include/linux/mtd/spi-nor.h |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

Index: linux/include/linux/mtd/spi-nor.h
===================================================================
--- linux.orig/include/linux/mtd/spi-nor.h
+++ linux/include/linux/mtd/spi-nor.h
@@ -327,10 +327,10 @@ struct spi_nor_manufacturer;
 struct spi_nor_flash_parameter;
 
 /**
- * struct spi_nor - Structure for defining a the SPI NOR layer
- * @mtd:		point to a mtd_info structure
+ * struct spi_nor - Structure for defining the SPI NOR layer
+ * @mtd:		pointer to an mtd_info structure
  * @lock:		the lock for the read/write/erase/lock/unlock operations
- * @dev:		point to a spi device, or a spi nor controller device.
+ * @dev:		pointer to an SPI device or an SPI NOR controller device
  * @spimem:		point to the spi mem device
  * @bouncebuf:		bounce buffer used when the buffer passed by the MTD
  *                      layer is not DMA-able
@@ -354,7 +354,7 @@ struct spi_nor_flash_parameter;
  *                      settings that can be overwritten by the spi_nor_fixups
  *                      hooks, or dynamically when parsing the SFDP tables.
  * @dirmap:		pointers to struct spi_mem_dirmap_desc for reads/writes.
- * @priv:		the private data
+ * @priv:		pointer to the private data
  */
 struct spi_nor {
 	struct mtd_info		mtd;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
