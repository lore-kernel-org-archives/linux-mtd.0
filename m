Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD0EC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Mar 2022 15:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G10w9Gy7eNHaceKtK2ZdMyyHt3pD9l8VZdwjhoZuRKA=; b=c551MJu1FbP6GY
	LD18cm9KFpLxd5q3teeqpWJ7NgI3gb9X0BAKPv8/Bn1vyg5BtThEVzHKucFm4tM896/AKuIeO5qnq
	aroejZXFiyxRaBquNHWa9JjA1TinCDPjoVUhAWVu2EzkWOtHhnp8KUYPtwS3KUC7YlYdt3Q/kYH87
	R+xW7pAjhDv5qlvLgU8Wb54XTdL9CDORa++W5c46vJ4xEnYGPr8+3+SmInDrGZ/JOqG8aKFPSRVXW
	oPgn3TIzr4aGNmKttYvyD5FBiK2AGlRBi8L54VYZfQ9+KM97RzHh+f76ONuJ2q0ba+aCFqUPyUVub
	nGcRmA7eVqilJbeXNG6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRby8-0050Qd-Rn; Tue, 08 Mar 2022 15:41:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRby6-0050Ow-0o
 for linux-mtd@lists.infradead.org; Tue, 08 Mar 2022 15:41:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646754105; x=1678290105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Svmpa5a1Mig8SFByV7N48trL4Ve70J5aZwb03ZhVga0=;
 b=Sc8ogQyqxZLE5JOeoHTCNw4rFa0E8bXasPDNCSHjmaeRo5boAKHoelbI
 IRotkW+xxX7PavfJtd0gigQUtg41FnUjV6AwZkGQbBgpQIMJXTW6jRstu
 9lpBVf1INWKQM9UVxFnJefcllvpX2goDPeFebavRbARFRUouNkAry8wqY
 5zeZcaFSBgQFOVPpO/+i3495zjt6x3NprYZ0cX032g3sF1hwbhLacC6zc
 uS4rbEYu/uFjK9t1sqgFWnPihUO5ekIk5xpRXzgVgTmzT8V8SgWo9NAux
 2eIp1/0rKM8uxXrzX0IPcq8eZxj+H471RVhEEH9rTkXsQoEo2WDRP50FU A==;
X-IronPort-AV: E=Sophos;i="5.90,165,1643698800"; d="scan'208";a="164948817"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Mar 2022 08:41:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 8 Mar 2022 08:41:44 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 8 Mar 2022 08:41:42 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, <p.yadav@ti.com>,
 <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <stable@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, <richard@nod.at>,
 <linux-kernel@vger.kernel.org>, <vigneshr@ti.com>,
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: spi-nor: Skip erase logic when SPI_NOR_NO_ERASE is
 set
Date: Tue, 8 Mar 2022 17:41:39 +0200
Message-ID: <164675405078.4788.10976712851332781674.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228163334.277730-1-tudor.ambarus@microchip.com>
References: <20220228163334.277730-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_074146_107495_209A2B0F 
X-CRM114-Status: UNSURE (   7.46  )
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

On Mon, 28 Feb 2022 18:33:34 +0200, Tudor Ambarus wrote:
> Even if SPI_NOR_NO_ERASE was set, one could still send erase opcodes
> to the flash. It is not recommended to send unsupported opcodes to
> flashes. Fix the logic and do not set mtd->_erase when SPI_NOR_NO_ERASE
> is specified. With this users will not be able to issue erase opcodes to
> flashes and instead they will recive an -ENOTSUPP error.

Applied to spi-nor/next, thanks!

[1/1] mtd: spi-nor: Skip erase logic when SPI_NOR_NO_ERASE is set
      https://git.kernel.org/mtd/c/151c6b49d679

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
