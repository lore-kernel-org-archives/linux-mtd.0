Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8770C5DF81
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Aug 2026 07:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yi/j7xqAgKwgvQP+aWquVmMqsDbcKwDIo5AE/+WGtIg=; b=iE6i81yBqw7D1O
	xkEjZyVcSPuw813eHm1phHa+dToRV/FlSUfwy9NNHBugkhXqBDmh8MD+ytn9jINchZD8jkAOT8pGI
	mrwfXNr59kRoyszA7vUmtVN0/1weP2kSRISE9+lpaQbXzrqYqJrXh/6kuv1SnXdwhmPMxXMzSmi1P
	8EImzHq+KqlDH+1AQgNvRHZq/HEIVtm8P8xyC63MGXniTGH2WrudrIoJV/su6EAQZSfVYJcs2Atpg
	gPYrsAGoK08cJasYpJTlXZvzjoslFfOkPSJXMEWkQx0fRjGizaw2czMqX3LmfXegZuwWyN5vU9yMf
	kufF6pwcWBhxMX6cnWOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxHA-0000000B4GG-3MP6;
	Thu, 20 Aug 2026 07:33:24 +0000
Received: from smtp9.infineon.com ([217.10.52.204])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwxH8-0000000B4FM-0bZA;
	Thu, 20 Aug 2026 07:33:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787211202; x=1818747202;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HOkJzEkBMETe+uT6f45jBqKDjwjsvVCYVg1kvaxa8sw=;
  b=d/QT1f/U6D2jrwKMKfqfKaxrgYq3dbGIEAh2bkDKHiutWzy555zE4Fs9
   rysbh173wjwmkgdVTvJipdUieBDI/wYqrI8+kiXVEtTso7DBbFKXyKW3A
   4buZmxKjblvCCyPpf82fd0JA+JfQ7QjEXSA7t6L/nSNumvbesbtUR2/Uv
   E=;
X-CSE-ConnectionGUID: j5L/wBpHQm+iPmq6mVyOIg==
X-CSE-MsgGUID: OgU14aDxQ9yeSY++Kpgprw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="105431057"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="105431057"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE803.infineon.com) ([172.23.29.29])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 09:32:20 +0200
Received: from MUCSE811.infineon.com (172.23.29.37) by MUCSE803.infineon.com
 (172.23.29.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 09:32:19 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE811.infineon.com
 (172.23.29.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 09:32:19 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 09:32:19 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 11/23] mtd: spi-nor: winbond: Add support for
 W25Q12RV-Q/N
Thread-Topic: [PATCH v3 11/23] mtd: spi-nor: winbond: Add support for
 W25Q12RV-Q/N
Thread-Index: AQHdKzdIpVH7yibg9keh3oZJFvnnIbamkPWw
Date: Thu, 20 Aug 2026 07:32:19 +0000
Message-ID: <cc933d88b77b4fb5ad8f22720f08bb19@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-11-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-11-b637cf120d5c@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_003322_538316_96BB86C7 
X-CRM114-Status: UNSURE (   9.57  )
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

Hi Miquel,

> There is an ID collision with the chip of same density from the JV
> family. Both chips are very similar in practice, it is mostly a matter
> of electrical differences (mostly power consumption being lower).
> 
> As a significant difference, RV chips identify themselves as supporting
> the new SFDP (rev F) field which forces an alternate write SR2
> opcode (0x31).
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> + cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
> ef4018
> + cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
> winbond
> + xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 534644500a0100ff00080117800000ffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffe520f9ffffffff0344eb086b083b42bbfeffffffffff
                          ^^^^^^^^
Just noticed size is wrong like patch #18.
BFPT DWORD2 advertises memory density in bits (0-based).
In 128Mb parts, this should be 0x07FFFFFF.
Need post_bfpt_fixup.

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
