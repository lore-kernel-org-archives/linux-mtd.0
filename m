Return-Path: <SRS0=BpRd=LF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A260C48BE5
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 12:02:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5AE9613CD
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 12:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5AE9613CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kIkvkTxcf5qKlkTvLuV+jwW8nyodQ0gXgNfDECGgEvg=; b=HN8be2S4J+xatH
	xkdjOYc6v3YN4x3UOUOWv0AYamY3HY1Q9mH1mksgOpGtFY5eypId9t5ZlwSD4+aluh7GX/oFlffDa
	7hvRzmv0CqLJzuwKSFML8yrQ3FG05UBxwq/YYv4sT5c0FyiDvvGdxJCW6R9eWAorv0HxieGW2oPM3
	whk6/xYjaIgDT9eCRqrDiuJqVVJJ7rOPeLJXdxtGgJEo5rMEC377VYaI7hNKwqVr5/nikaKEKjw7/
	HBYjDcw1g1OScaBMmp6lxDDdZJqIWyVLopnGsamNToXFu+u2k0XWWKpT4k+49FpHwpaMcsTIcbfha
	OL8LhTwjVHbcraBdp3TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrfqk-0059w2-Kf; Fri, 11 Jun 2021 12:01:22 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrfqW-0059uF-Ru
 for linux-mtd@lists.infradead.org; Fri, 11 Jun 2021 12:01:10 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15BC0rr8055506;
 Fri, 11 Jun 2021 07:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1623412853;
 bh=C2uVG4YVhCE3dApRBoiu5fdLGPrE0YldezYKVHCqhUo=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=swzmraxeswhbCies/Qt6wIyk6Trq2nde1reLStkfpjfVqDQHeqmaSdfyCNLVyqc5Y
 WTRzWQ0yLaBuphnUeENnmgkmHmoMNERTzvwVjpU00Yy/xqBSz4CtKnFHf2MX1T87Aw
 /taV4hbBV1NxyPB92vDSqLzVQWvFvCu2bB01qs7o=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15BC0r2f034824
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Jun 2021 07:00:53 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 11
 Jun 2021 07:00:53 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 11 Jun 2021 07:00:52 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15BC0nfa088584;
 Fri, 11 Jun 2021 07:00:50 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <tudor.ambarus@microchip.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>, David Bauer
 <mail@david-bauer.net>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v2] mtd: spi-nor: enable locking support for MX25L12805D
Date: Fri, 11 Jun 2021 17:30:12 +0530
Message-ID: <162341279846.8728.11170182726976489499.b4-ty@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210510133340.487651-1-mail@david-bauer.net>
References: <20210510133340.487651-1-mail@david-bauer.net>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_050109_022444_322BB65D 
X-CRM114-Status: UNSURE (   7.99  )
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

On Mon, 10 May 2021 15:33:40 +0200, David Bauer wrote:
> Macronix MX25L12805D supports locking with 4 block
> protection bits in its status register. Add the corresponding
> flag in order to clear these bits when unloking the flash.
> 
> Otherwise, the flash might not be writable depending on the state
> left by the bootloader.
> 
> [...]

Applied to spi-nor/next, thanks!
[1/1] mtd: spi-nor: enable locking support for MX25L12805D
      https://git.kernel.org/mtd/c/7ea40b54e8

--
Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
