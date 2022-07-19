Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0881C43334
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jul 2022 04:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aIEY/z2urtNDwQbGk4i+03gt5ChYEvWL0lCxKiK3dOE=; b=Y7iRq51LZOo+ra
	zunPkIApvjvC6jPi39SOlc9rVoYitjvZqbH15YgSQ6mKQz12H6HRysM6cCQmtiNw5bG+pkaCI2DEB
	VkRHwZ9lWcHIuaacBjYactU5nEMTNfoJ8BMAdCn2yQUmBKcctXfrgrHNql2sifM/+a37UECdwTUNG
	1TYrwrZoWN1v6XlY/Or2Sf1RvL1DYPu2WitCC4REqwMfeuCvwJ/ycmrNC7x8xhjj+rUBGpeGx5TIc
	xJlxMO7HCuKZtC3PQgDXD1swFkrkznBtqFUe6Q7q4UF9AQvS+eOZLojkeHUeKD6CJS2OI6f/6fw+O
	+4D9a4F9iPfa7aBrkWKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDewK-004thA-1o; Tue, 19 Jul 2022 04:34:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDewG-004tge-Mv
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2022 04:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658205268; x=1689741268;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=neKJC/MBJk7HJU48Xebuj3JV9Ozvfki6yw7hkBYle98=;
  b=tRp6kDGuIrgTIIOCBw6y7b69bhzEbiIsn/8S2jSo1g1LskYRQDLnR8Dh
   8qrsEn+GVwHIeUqjbdFoo2XuF9lbOw4kKatAFh40M2z3Dbe7jbuWdqoUn
   BC2j7FzKERMk9QQTuckyzfG3zyq7sx6y71LsTAnXQnt954RP1CwcBJOYK
   +2WGyVaxUh9t3uVzoze/3R79CbvKtOWBZiOmDR4pahvYmct9jWAMg0b4o
   6ypfNb9hIEIC8lWAGJFeMcUkbe5WvusGWVSAlGAgmxVFKX1CU/CpaTKxR
   k+Kd5I64l5XL7jcan9A3sFSl5VcMRjzl927XVIsLn6j6c4P/EZtabL5hW
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; 
   d="scan'208";a="172873871"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Jul 2022 21:34:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 18 Jul 2022 21:34:25 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 18 Jul 2022 21:34:22 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <tudor.ambarus@microchip.com>, <p.yadav@ti.com>
CC: Tudor Ambarus <tudor.ambarus@gmail.com>, <vigneshr@ti.com>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<michael@walle.cc>
Subject: Re: [PATCH] MAINTAINERS: Use my kernel.org email
Date: Tue, 19 Jul 2022 07:34:20 +0300
Message-ID: <165820520992.90015.1804934724521244853.b4-ty@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718151243.1149442-1-p.yadav@ti.com>
References: <20220718151243.1149442-1-p.yadav@ti.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_213428_843887_44869103 
X-CRM114-Status: UNSURE (   5.02  )
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

From: Tudor Ambarus <tudor.ambarus@gmail.com>

On Mon, 18 Jul 2022 20:42:43 +0530, Pratyush Yadav wrote:
> Use the kernel.org email I have for reviewing patches.
> 
> 

Applied to spi-nor/next, thanks!

[1/1] MAINTAINERS: Use my kernel.org email
      https://git.kernel.org/mtd/c/7de3074b218f

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@gmail.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
