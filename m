Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119C3CD6E6B
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jun 2026 08:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PkU3shVbBgdCpUyiaEtP8YVOXWLAYzxWExppvUpgr7c=; b=yN9l/asZ4ovQdZ
	CNdHCiTugXuexVixc5u+JdlfntEqV/+U6lxkmUVCLoaY5jg6ghVLRvq5Kml4kbQk3WJ96ARu+Wopy
	8tUC5rTpeaR+1pwMNAfVUJ6LFWsD4UIkzzeb/Ky5qDlZVmX7jW9ekGGnqlrzQgTCfUfwN9qjEaboD
	jbThKoUp07pLNBr/ieAQhpSAUbtmA7jujUTomKunp0tdeOJBoazp4n9uQlKwPOTge2yDEuz1GO/OV
	6CJHRbJyjb2uhC8u8+1MafNszXWTM5W3LwRUb+kBccSooHT85y8lMON/iJ4caF1TNJtLrxrXNg27J
	YG2Z4nq/MPGP2c1G20nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPi5-00000000IT4-3RBa;
	Fri, 05 Jun 2026 08:15:21 +0000
Received: from smtp11.infineon.com ([2a00:18f0:1e00:4::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPi2-00000000ISG-2oeT
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jun 2026 08:15:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1780647319; x=1812183319;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KcfFM3Ef5kxs3GW7n6kmRe47f+J66FB5vsd6flO/M98=;
  b=VjUWtVvgnU14pt+B2NDSOAQPe22M1Cj051NHat15Bmjqr234ND2jy4HE
   h2sIEZxSXCxuZlZtuKVGBgGPQXRtyDe8QvTgeb1rwXLOFuthRJFx2Q+4c
   oKXL2mhu8eim3qn8vmSMn0hINsifa+sT4rSt1OlNTbvfYqA/TT2irikCw
   Q=;
X-CSE-ConnectionGUID: mxU7hhFJR1WB47CsJwDZhA==
X-CSE-MsgGUID: G7N+IkvxQgGswRTbegT4eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="146041952"
X-IronPort-AV: E=Sophos;i="6.24,188,1774306800"; 
   d="scan'208";a="146041952"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE805.infineon.com) ([172.23.29.31])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 10:15:17 +0200
Received: from MUCSE811.infineon.com (172.23.29.37) by MUCSE805.infineon.com
 (172.23.29.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 5 Jun
 2026 10:15:16 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE811.infineon.com
 (172.23.29.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 5 Jun
 2026 10:15:16 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.037; Fri, 5 Jun 2026 10:15:16 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <mwalle@kernel.org>, <pratyush@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <tudor.ambarus@linaro.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [RFC PATCH 2/3] mtd: spi-nor: don't clear the SNOR_F_4B_OPCODES
 flag on failure
Thread-Topic: [RFC PATCH 2/3] mtd: spi-nor: don't clear the SNOR_F_4B_OPCODES
 flag on failure
Thread-Index: AQHc8cXW+2yTYSc9Ak2Dl3vFTgjg8LYvoNHQ
Date: Fri, 5 Jun 2026 08:15:16 +0000
Message-ID: <2dc8af28c3014903ab2c3d04132ac5cf@infineon.com>
References: <20260601125438.3481722-1-mwalle@kernel.org>
 <20260601125438.3481722-3-mwalle@kernel.org>
In-Reply-To: <20260601125438.3481722-3-mwalle@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_011519_014248_D2F36A1C 
X-CRM114-Status: UNSURE (   7.95  )
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

> 
> This was introduced in commit 548ed6847f530 ("mtd: spi-nor: Add the
> SNOR_F_4B_OPCODES flag"). It looks like it was the rollback mechanism if
> parsing the SFDP failed, but was setting that flag first. Nowadays, that
> flag can only be set if spi_nor_parse_4bait() was successful. IOW, the
> flags won't be left in an undefined state if parsing SFDP fails.
> 
> Remove the unneeded code to be able to rework spi_nor_init_params().
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
