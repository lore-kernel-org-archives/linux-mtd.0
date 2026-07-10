Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD615C43458
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jul 2026 02:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9rmjIB7/pzM/4JnDcUH15hrb7bKQeZ0OBxSPWP0eMs=; b=a1gzJoBMn0nX3e
	B7zLQTggWytpHbDhq5cLQSRzLqBkANt4sVbdjWxegBzaSQsae4NCMBHyK4ptQnaWHZx7JIG3bD4P1
	7kSObYlyWx3xXXOSBb2FUg8f52BD6Ii4CZNOpWJuQHPnNbLkYmXRZ0fIiQLryyYVQjK794qqyklki
	FJJyY+3POzKn7vITGX1YGTLikRXG8gYskVB6UVrBYq8yV81XJ0lziYb3pYfVFMw1p07vI9SAv7Dm5
	IB/XwYfI8HkP2qjJmcz37hirz4+d/QOwrCRXsAa7cJypwOAOjm86jZw280+enhFJ33xHfoR58Y9Zo
	v6CdB7ik59mEA59HNbwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi1Hn-0000000400Z-3Ld0;
	Fri, 10 Jul 2026 02:48:19 +0000
Received: from smtp11.infineon.com ([2a00:18f0:1e00:4::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi1Hl-0000000400D-1DY4
	for linux-mtd@lists.infradead.org;
	Fri, 10 Jul 2026 02:48:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1783651698; x=1815187698;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oYzQqgDl8zkjDGEKvpUaO8lMsPhan55tEZ+6jGFiUBo=;
  b=QkdfW30LJDmMoYF4r/uSTz+H9sAcpmaJfPulYLYGwYx9GCj4UwSTVbWq
   dDD3PzwRbz0OdFj6kfijp5yv47CDrodH7iwxa+Y+WWIZki6TaNTcfNEmk
   E6xZNagV3FSSVekVMwU6UO6XE08i5oD9lP6Zc/79LRHjd/qrmba8Bon2x
   E=;
X-CSE-ConnectionGUID: F2UcD3jfR42adX1AdllqVA==
X-CSE-MsgGUID: y4ecJX41SFC9zqVjdq+b+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="151034132"
X-IronPort-AV: E=Sophos;i="6.25,154,1779141600"; 
   d="scan'208";a="151034132"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE814.infineon.com) ([172.23.29.40])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 04:48:15 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE814.infineon.com
 (172.23.29.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 10 Jul
 2026 04:48:14 +0200
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.043; Fri, 10 Jul 2026 04:48:14 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <mwalle@kernel.org>, <pratyush@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <tudor.ambarus@linaro.org>
CC: <linux-mtd@lists.infradead.org>, <chengminglin@mxic.com.tw>,
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 8/8] mtd: spi-nor: rework flash parameter
 initialization
Thread-Topic: [PATCH v1 8/8] mtd: spi-nor: rework flash parameter
 initialization
Thread-Index: AQHdCviJPRSKx17TTEOtTgvCkIfDb7ZmFOMw
Date: Fri, 10 Jul 2026 02:48:14 +0000
Message-ID: <78462545a59c4c6490049db90296840d@infineon.com>
References: <20260703143003.1809579-1-mwalle@kernel.org>
 <20260703143003.1809579-9-mwalle@kernel.org>
In-Reply-To: <20260703143003.1809579-9-mwalle@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_194817_945685_499DCC27 
X-CRM114-Status: GOOD (  13.74  )
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

Hi,

> Rework how the flash parameters are initialized. It used to make a
> difference whether a flash is in the in-kernel database, whether it
> supports multi I/O and so on. Recently, that makes more and more
> problems because flash IDs are reused among legacy flashes (w/o SFDP
> support) and newer flashes [1,2,3,4].
> 
> Simplify the whole parameter initialization, by starting with the
> parameters we have in the in-kernel database and the try to parse SFDP
> (and let it override any settings).
> 
> This has the consequence that all the flashes now get a RDSFPD opcode
> which might be an unknown opcode from the perspective of the flash. With
> the generic SPI NOR flash driver, this was already the case for any
> flashes not listed in the in-kernel database. So far, there was not a
> single complaint.
> 
> [1] https://lore.kernel.org/linux-mtd/CAAyq3SYX9UPwhC_Ume_S2yxhQwimRvB=Y6O_+FFqokhNmw7jQg@mail.gmail.com/
> [2] https://lore.kernel.org/linux-mtd/DGB4745HRCFI.1DRYTHXURWZJO@kernel.org/
> [3] https://lore.kernel.org/linux-mtd/DD10GE4EOCD7.CPTN7198QFUV@kernel.org/
> [4] https://lore.kernel.org/linux-mtd/DD6SI06QNEE4.2YCRTWJHEAAQM@kernel.org/
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Tested-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
> Tested-by: Miquel Raynal <miquel.raynal@bootlin.com> # w/ W25Q02JVFIM
> ---

Tested-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>

Test log is here (I forgot a tag).
https://lore.kernel.org/linux-mtd/28461250e841436e98e67fd7b0d02313@infineon.com/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
