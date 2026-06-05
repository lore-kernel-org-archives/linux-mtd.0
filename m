Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5ECCD6E6B
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jun 2026 08:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bTJ9Gv3fNFbg+QKlBjdxrkFYVgTdhHFN+WhD6UY3HTA=; b=p85R6Zs5J1I06H
	pvNAierJl7vJjNZMb+SamhLY9lGkaE5owAe0lvGdx5yQvG024D51Qrn8ulzpQRi52BJ/VycTTHxdD
	TgEOLSzzNDAIcAAWuBKuMoUK9dZzY9Q17zVhBWq+JHU2rZiFvDndeDGSZfCD4SxLZCfuAjF0pIN8T
	qK1AC47fz6fbJgnGV75mYIm3REBMmLqdsdme/Q+BRnmawYHYxFH7QiOhhQjW8klRbk2le6E/NX6Re
	w+0807CFl8mmsNYDvebmDzRRi70jX4aVllO4NGtYc2LwOZqop7xZ0sFN7va7HfFpQr6Kp3AQKEG7f
	Yn5BZ2ef4sYIiFv4mWaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPZ1-00000000HkQ-1EjZ;
	Fri, 05 Jun 2026 08:05:59 +0000
Received: from smtp14.infineon.com ([2a00:18f0:1e00:4::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPYw-00000000Hjr-48si
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jun 2026 08:05:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1780646755; x=1812182755;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jcE8cRQAvGaZZVLXkZ3/dcjTh+d3PRkPEUyw9lvIeJs=;
  b=BiyrLcvzvwt5nPSmz342OAd9v/ey/Uu5qW/EaKKvbyvlutYRmv+oDd2H
   xXU61krQJorh8/cSQfszdBcPlYHPUWQ64gaCRUV7vhz1gD809INhjG+oT
   UAMvHqIdJ89WQpoc4xOOO4/f7TBSQIcFwAUM7xI7nuhlO1BYIJE7Fz8WO
   s=;
X-CSE-ConnectionGUID: Hd/zw3bQQISL5awi8cYjpw==
X-CSE-MsgGUID: gvLgTxR8RfC5pAQS1DzPUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="132641625"
X-IronPort-AV: E=Sophos;i="6.24,188,1774306800"; 
   d="scan'208";a="132641625"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE814.infineon.com) ([172.23.29.40])
  by smtp14.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 10:05:50 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE814.infineon.com
 (172.23.29.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 5 Jun
 2026 10:05:49 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.037; Fri, 5 Jun 2026 10:05:49 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <mwalle@kernel.org>, <pratyush@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <tudor.ambarus@linaro.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [RFC PATCH 1/3] mtd: spi-nor: spansion: s25fl256s0: remove
 SKIP_SFDP flag
Thread-Topic: [RFC PATCH 1/3] mtd: spi-nor: spansion: s25fl256s0: remove
 SKIP_SFDP flag
Thread-Index: AQHc8cXVzTx7OBBKfECVgQVWWP0qW7YvoC+A
Date: Fri, 5 Jun 2026 08:05:49 +0000
Message-ID: <98bd64005890489d9f8f649400b5b16e@infineon.com>
References: <20260601125438.3481722-1-mwalle@kernel.org>
 <20260601125438.3481722-2-mwalle@kernel.org>
In-Reply-To: <20260601125438.3481722-2-mwalle@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_010555_334499_650CBBE3 
X-CRM114-Status: UNSURE (   7.26  )
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

> That flag was added in [1] to not "issue any non supported commands".
> But since we now have the generic SFDP driver, we'll issue the RDSFDP
> command on most flashes anyway and there was no single complaint. Remove
> the only user of this flag so we can rework the parameter initialization
> in the core.
> 
> [1] https://lore.kernel.org/linux-mtd/20211207140254.87681-13-tudor.ambarus@microchip.com/
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
