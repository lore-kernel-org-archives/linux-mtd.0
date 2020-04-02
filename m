Return-Path: <SRS0=KHzd=5S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D0EFC43331
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Apr 2020 21:45:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18DBD20737
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Apr 2020 21:45:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IlBh7ud0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="TMVEZI6i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18DBD20737
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gGdszEKgOxjtYGWtQtJ5WcGeNqTwPGH8ToLFqOTUo/M=; b=IlBh7ud0Z8M7xO
	G2gyW2oY82dAC+jNHfNvcO1YU1ZN2RNMNCLhcde7W1NY8E/MK8chRQKJxUbhPNSC1Dha/Zg2l5Y6D
	w8R8BkFkoMHpu5GXNq2UCEPenUdqLQOzqfH6dhkHrtlsqsaolKVnnxva0fzdG6Sn34NPvwaNerkV2
	zCdQ0ejpw5QgZJnxn60dbYHH5tNN6fFEoR0xIFkBxOAZU/nqP9aAPboYl5VG9NZiVH56/7jRyAo/d
	9NBHNS+lt9fnAMM7MeYDkYIJszffWW0v52PZAlLRIH4IIGNp1Wo+KNMvZN4LGd4ImXZFm0tQajoyN
	+RfeUK68IbBb6k09nFtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jK7eW-000440-JD; Thu, 02 Apr 2020 21:45:32 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jK7eT-00043b-6s
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2020 21:45:30 +0000
Received: by mail-lf1-x12f.google.com with SMTP id f8so2683689lfe.12
 for <linux-mtd@lists.infradead.org>; Thu, 02 Apr 2020 14:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W8BTYVfsoG2fA+QzvXXy/LiqFKoCoJswy+1EdpYXAuI=;
 b=TMVEZI6iAvEvU4x2nC4meTTzKO+ihbWHPW0OD1crmtzu5O33WxQtPyS8vSl/YFIx8u
 PtPYUbQQD0jYe+3gjqvblWVRlv1YJ7rygmlMpYxKWJpComhs+GZJuwBzjzugRj7gdG+j
 6XAPxmyqGIR473SW1svlDqja8TtNpO7VzLbX1vNp0ILALq6jQsBg0pBwhmUtjBP0YBbh
 5PGuMW8Oe1wbHDnZdJgBwdsdotLo9hfG7BkOueTbOx5Eh8Y5DIeW9d5MNJFNEc/LxgMl
 ION0MzlzTotO7FLpVoFgZmgnnGpcI1wXgjYMR/LiHSNLQdD8IlZFrRUUnUAvV5ZgdimX
 sy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=W8BTYVfsoG2fA+QzvXXy/LiqFKoCoJswy+1EdpYXAuI=;
 b=PbX3P4jCN44ymvLOBm3xjcl/+mIyIGIOsd6NpuvKVHExiQf1KeQ+NLYF5idH+j55Fi
 T7hkqQ7+awSYJUuUiNq0OZc3Yd0HU2wlIwRn0zkm0z91DGRpfGKciTONMaPTIwkEJ9XA
 qYQ4sCe7591I1MFf2x64m3wxAq8zkQyzhYjOtmfdSRBXvkYZfI05h9YAkllRtojppw45
 Qge+8YOJ8dXbn71I0QBbVX+AFmAniNZWlTJaVI1nWV8yKXCBGb/VogpN1jowwPqoKeJ4
 mWNKv8R9r6QG3abkCEERK4QbJnPcz9NgIMuzUpSrj1i3sOyKgPxaZncJaP3SqggoF73d
 5pCQ==
X-Gm-Message-State: AGi0PubQkNTr6wGJ5Y4AKk+fRPv1m5LzzUAp7kPOMD6Mx7YnBk8CzbLi
 R44+vr9IgBFoCkCvBYLq12DsaQ==
X-Google-Smtp-Source: APiQypK42r6CqJiJMewpO6WdKHnpJ87bZop1lCCW3CyVav4MQMPzJZtTq2Saos082UgFxc4p+7DsiA==
X-Received: by 2002:ac2:545b:: with SMTP id d27mr3293047lfn.187.1585863927530; 
 Thu, 02 Apr 2020 14:45:27 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:638:9d01:50cb:2c0c:a09a:3ff3])
 by smtp.gmail.com with ESMTPSA id l20sm4015159lji.74.2020.04.02.14.45.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Apr 2020 14:45:26 -0700 (PDT)
Subject: [PATCH 3/5] mtd: spi-nor: fix kernel-doc for spi_nor::reg_proto
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <a2577f42-a21b-e7c4-c550-f6ea1cf94cf0@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <1c3ff5da-6798-34df-b05b-eea7abda5885@cogentembedded.com>
Date: Fri, 3 Apr 2020 00:45:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <a2577f42-a21b-e7c4-c550-f6ea1cf94cf0@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_144529_250840_09C13994 
X-CRM114-Status: GOOD (  14.07  )
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

When adding the '{read|write|reg}_proto' fields to 'struct spi_nor', a
colon was missed in the comment for the spi_nor::reg_proto' -- add it.

Fixes: cfc5604c488c ("mtd: spi-nor: introduce SPI 1-2-2 and SPI 1-4-4 protocols")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 include/linux/mtd/spi-nor.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: renesas-devel/include/linux/mtd/spi-nor.h
===================================================================
--- renesas-devel.orig/include/linux/mtd/spi-nor.h
+++ renesas-devel/include/linux/mtd/spi-nor.h
@@ -572,7 +572,7 @@ struct flash_info;
  * @flags:		flag options for the current SPI-NOR (SNOR_F_*)
  * @read_proto:		the SPI protocol for read operations
  * @write_proto:	the SPI protocol for write operations
- * @reg_proto		the SPI protocol for read_reg/write_reg/erase operations
+ * @reg_proto:		the SPI protocol for read_reg/write_reg/erase operations
  * @controller_ops:	SPI NOR controller driver specific operations.
  * @params:		[FLASH-SPECIFIC] SPI-NOR flash parameters and settings.
  *                      The structure includes legacy flash parameters and

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
