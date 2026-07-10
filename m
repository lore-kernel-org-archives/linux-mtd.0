Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F62C43458
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jul 2026 02:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A1AGUEUwC66Km7fi/3VFcj552YQDoBcbvnnDBhnyV/U=; b=LuMvcosWLH0vPw
	wMdetUua9+IZSVtEgdOzdwGekh1MU9kWTYqj+PXApcHPFYU4agz48XAqPxrpI1BLQByIE3CrScjF3
	dOgcNrEvUyT8cUxL55LDt6GHbBjsEwYpEwZziN1kz4Y4/kzhccGHauamDWlO7tORuQ8StNujiWuvS
	Z38kWhHG3j5yZT4GaCscWgroz6ae8IecdlgJwp1LoxBDmqvLw76xmg3EEtPcrZnrvxfucFvOJEzum
	hrjhDFSQblEbb1+hRH86jR8EYg2G9rtu2xIN8NPwi13ITSyAzOW0E9X7B4B4CONYhRVzYtsl0TpQx
	p5nRzAF7meswyNlmebvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi0sm-00000003xFl-2LUp;
	Fri, 10 Jul 2026 02:22:28 +0000
Received: from smtp2.infineon.com ([2a00:18f0:1e00:4::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi0sj-00000003xFF-01iG
	for linux-mtd@lists.infradead.org;
	Fri, 10 Jul 2026 02:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1783650145; x=1815186145;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JbDNeJ7bRv/XOKpmwCL4w9vOzeh575lyUJeila34R2g=;
  b=YnGgKRfLTZ5VU+RKiPG77O40BdhuhffG7HchlLpjw/nH8XvasA7pPzIT
   QInzydNTQhJp0HCc7IqM2T3L5JU/Zz4wiZ0wTq+76SCyIrRZzrRkccWdc
   c5rCUiydHlWkyMEFYumxtkZcWO+soya2pK0ZZnqPKpj0VcmdU0fMfEKrx
   w=;
X-CSE-ConnectionGUID: +EF5AJzFQfK/Iywwy2mVWw==
X-CSE-MsgGUID: Y6n8gbYISA6Vd2ylQKGqDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="166868194"
X-IronPort-AV: E=Sophos;i="6.25,154,1779141600"; 
   d="scan'208";a="166868194"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE822.infineon.com) ([172.23.29.53])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 04:22:16 +0200
Received: from MUCSE811.infineon.com (172.23.29.37) by MUCSE822.infineon.com
 (172.23.29.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 10 Jul
 2026 04:22:15 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE811.infineon.com
 (172.23.29.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 10 Jul
 2026 04:22:15 +0200
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.043; Fri, 10 Jul 2026 04:22:15 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <mwalle@kernel.org>, <pratyush@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <tudor.ambarus@linaro.org>
CC: <linux-mtd@lists.infradead.org>, <chengminglin@mxic.com.tw>,
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 6/8] mtd: spi-nor: spansion: s25fs256t: move ARCFN
 check into .late_init
Thread-Topic: [PATCH v1 6/8] mtd: spi-nor: spansion: s25fs256t: move ARCFN
 check into .late_init
Thread-Index: AQHdCviYt5PKND7i80GLCykdpBu8K7ZmDxMw
Date: Fri, 10 Jul 2026 02:22:15 +0000
Message-ID: <d23de34853cc4029b6f314e9808c3283@infineon.com>
References: <20260703143003.1809579-1-mwalle@kernel.org>
 <20260703143003.1809579-7-mwalle@kernel.org>
In-Reply-To: <20260703143003.1809579-7-mwalle@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_192225_642698_B7C22431 
X-CRM114-Status: UNSURE (   8.86  )
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

> The SFPD parsing is optional. It not meant to fail if something is wrong
> with the chip (except for the SFDP itself). Thus it doesn't make any
> sense to return -ENODEV.
> 
> Move that check to late_init(), which might fail and abort the flash
> probing.
> 
> Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Tested-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>

Thanks!


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
