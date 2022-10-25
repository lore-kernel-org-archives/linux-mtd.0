Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB5BC38A2D
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Oct 2022 02:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n2hD62D3OZT1a7fyBEwUsoieBOc7+oXiMQ7FdcMBk70=; b=3JfXR2xF0vfyRC
	2uGMpBme3Y4BHDqvJZ2IBbPaeC/GlChaPrtWybb/rReXbh3FauTNIUsbSKjHBEDK0huljShEVpH7s
	IPIQulwy37kUwm2NjhZjngeiIf8VxVak/CupN80AbqSClGRQXd3MkhZFswEnynOlh6y0Gx5rw0Qq8
	2NTKidE0kosW8pfxWLv28lK8ZSItNrJRk9kF4/A9Dj6wg6HdxzujCJcgm7ETMchb3YNvMbj09wzRR
	QoG5kxvqKzkj0QnDWcW8yQG7zPWVa7ihwYxaXATHZ8xluUzyp3ycGUZP8jZZ49mw24/BXQYD7SreO
	iKUGFP5Q5Ku6UivtazUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on9ky-003ck9-FB; Tue, 25 Oct 2022 02:33:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on9kv-003chP-DQ
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2022 02:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1666665209; x=1698201209;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CtR0Xcu72tjFz5R8+nLQQ/f7nPmRy/8v+lVmRCYk+CU=;
  b=yY8Bqklx8n1wWzX+At6d6EFfbimLc/+SWpsCZOYckHJxWoPbL2hCfsmg
   Ql7bTC/hvsmhwvxYSBlTyge5l7xB5s7irSn0KCTF0A8DVkFUGaCJZWHTH
   WOMlzKUlTTVxuLtvoyui0jjNyAg0cX9EWo92PboFD2P3ux0THfhUnYRqG
   3pJo+1CjCqt0RwH1Dw7Kkd4/xXCI5RYeAN/OGlMPh5IvmWZbJQF5S3N4Q
   GOXcOGO3unzCeNLipAdHa/bYHeuGrEq9IMetYFtmAR23gwQpO4ZHVJkqJ
   CZSjo7H18/17zA4UU2NhnttzjbXto7cSMA3Zs8h2N8OTEQH1bgFZG6ZAD
   Q==;
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="183740034"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Oct 2022 19:33:25 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 24 Oct 2022 19:33:21 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Mon, 24 Oct 2022 19:33:17 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <tudor.ambarus@microchip.com>, <pratyush@kernel.org>
CC: Pratyush Yadav <p.yadav@ti.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: core: Add an error message when failing to exit the 4-byte address mode
Date: Tue, 25 Oct 2022 05:33:02 +0300
Message-ID: <166666517334.181018.17214909395761574180.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728030159.68680-1-tudor.ambarus@microchip.com>
References: <20220728030159.68680-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_193329_530160_7FA135D0 
X-CRM114-Status: UNSURE (   7.00  )
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

On Thu, 28 Jul 2022 06:01:59 +0300, Tudor Ambarus wrote:
> Add an error message when failing to exit the 4-byte address mode. Do not
> stop the execution and go through the spi_nor_soft_reset() method if used,
> in the hope that the flash will default to 3-byte address mode after the
> reset.
> 
> 

Applied to spi-nor/next, thanks!

[1/1] mtd: spi-nor: core: Add an error message when failing to exit the 4-byte address mode
      https://git.kernel.org/mtd/c/bb0e9c600ce2

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
