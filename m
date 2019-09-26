Return-Path: <SRS0=cKKb=XV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EAF0C432C2
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2019 09:28:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E84E217F4
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2019 09:28:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jsauWifE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E84E217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=winbond.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TczU6cyfFPOgvnKCnPNLlzts1+58sKvIHoa5nwlnPcw=; b=jsauWifEY7OWNx
	B6WfzWI913eqbH5t8FJwWBNDvlthJv9FCQbspUMI+q+6Rel5VU2srtH2bSZEEFONe98IgOb9GXSFs
	ki3Akhdpc5uFf5Z3koTiUxJ2HHDa+QZqVclSKxDK6EnWQS1TSCjYT2bTInnxpyPenyVrTCoKdMCmA
	ssbs9JXyMctfzHoIViH11swNA6r/pRRmX0cVQ6Vk81sftr4OPoCQx+N7SppQqAc0HZeWCqwK+4dP1
	GYGbQdI+wa1RVQtFQeYXh+y7v/cT7LqjS0dVW6dWncs8wGdbNfn6SSc4c3lPQgqDfJBx5THMS/J3m
	5TeIpkTyG97x04EXhmPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDQ4q-0000sc-SE; Thu, 26 Sep 2019 09:28:44 +0000
Received: from wehq.winbond.com ([202.39.229.15])
 by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDQ4n-0000rt-CM
 for linux-mtd@lists.infradead.org; Thu, 26 Sep 2019 09:28:42 +0000
Received: from mail.winbond.com (wectmlgw02.winbond.com [10.6.10.76])
 by wehq.winbond.com (Postfix) with ESMTP id 3B727342429
 for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2019 17:28:26 +0800 (CST)
From: Shih-Ting Lin <STLin2@winbond.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: spi-nor: add Winbond 1.8v SPI NOR Flash ID
Thread-Topic: [PATCH] mtd: spi-nor: add Winbond 1.8v SPI NOR Flash ID
Thread-Index: AdV0TLr+8Rk0PqjGQBmzD1KAUfW3uw==
Date: Thu, 26 Sep 2019 09:28:25 +0000
Message-ID: <745f82b2f6a34b87a4c356561cfc11e2@wectmlbox04.winbond.com.tw>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.8.58.50]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190926_022841_561346_8F7E9265 
X-CRM114-Status: UNSURE (   4.26  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Winbond SPI NOR Flash have new product for 1.8V production line.
Following is the patch add new device ID and part number information in spi-nor.c file.

Signed-off-by: Shih-Ting Lin <stlin2@winbond.com>

--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2153,6 +2153,22 @@
>  { "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K |
> SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },  { "w25m512jv",
> INFO(0xef7119, 0, 64 * 1024, 1024,  SECT_4K | SPI_NOR_QUAD_READ |
> SPI_NOR_DUAL_READ) },
> +{ "w25q32jwxxIM", INFO(0xef8016, 0, 64 * 1024,  64, SECT_4K |
> +SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK |
> +SPI_NOR_HAS_TB) }, { "w25q64jwxxIM", INFO(0xef8017, 0, 64 * 1024,
> +128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) }, { "w25q128jwxxIM",
> +INFO(0xef8018, 0, 64 * 1024, 256, SECT_4K | SPI_NOR_DUAL_READ |
> +SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) }, {
> +"w25q256jwxxIM", INFO(0xef8019, 0, 64 * 1024, 512, SECT_4K |
> +SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK |
> +SPI_NOR_HAS_TB) },

TEST=rebuild kernel,update to DUT
    check DUT:
    cat /var/log/messages | grep mtk-nor
    ---
    localhost ~ # cat /var/log/messages | grep mtk-nor
    2019-07-08T04:42:51.636356-07:00 INFO kernel: [0.301351] mtk-nor \
    1100d000.spi:w25q32jw (4096 Kbytes)



________________________________

The privileged confidential information contained in this email is intended for use only by the addressees as indicated by the original sender of this email. If you are not the addressee indicated in this email or are not responsible for delivery of the email to such a person, please kindly reply to the sender indicating this fact and delete all copies of it from your computer and network server immediately. Your cooperation is highly appreciated. It is advised that any unauthorized use of confidential information of Winbond is strictly prohibited; and any information in this email irrelevant to the official business of Winbond shall be deemed as neither given nor endorsed by Winbond.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
