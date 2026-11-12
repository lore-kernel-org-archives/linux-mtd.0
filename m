Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A16606A31C
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 02:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ssByb6kC;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=PV1TWW3x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jv/uxd5+cINs6nB6lMW4edGtzYiPhR7vwB8TzeESxa0=; b=ssByb6kCErFm6M8nH7/xBTNkx2
	8smB7qpK5OpokSjZRUgNMLWC7svQL8QM2KVAAaMTBoB3R939hn2Uyo2EMVvfOPZ1XDdKV+dUXTbI6
	TcMVQkdGZgFBHmZ2KTnWCAp8QOxMcmCQI3QPMtu4NQzf6pgzm+K9wfySVyyOX0hkHgpLt0kllVesp
	JAM9a6Pv3F4liS1yOzggk3s1XEn2L63elku9NxVRuKtQjcvWCLhsLEiBS1KI9a+yGKtqu6Pxm1qJA
	K3yIqCLdl50ajBXNBix11DFCS7y405qdaHDyos/7S7jzU+2ILYmTf9lZIvFhizArvexfRQzKcfBHL
	jRV6JZVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKW7-00000008Vog-2L3f;
	Thu, 12 Nov 2026 02:26:23 +0000
Received: from smtp9.infineon.com ([217.10.52.204])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKW5-00000008Vnd-3EX6
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 02:26:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1794450382; x=1825986382;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uXbRj8A6orQZ4SdQ2U6VzzsZHYKOIW/75PBZOqmy5HU=;
  b=PV1TWW3xK6fPLJAmgLl4zLpzsL//Ojw1ZNn3SHnLisdoNQUZ0coygTTn
   VymM2pYpYWRDrEnYlAVMSC8pKAkgD+c2bTuEzQkvO+ONPNT8kGrM97WrN
   U6a4tEiOwSpZamFMiusivuCZbP98i3anP57FhB+h4gFhP2SdTxr7xiY1s
   0=;
X-CSE-ConnectionGUID: WVtleJhZQwq9BZTiSHe4Mg==
X-CSE-MsgGUID: UIdin4kOQCOnsEz+XVu9Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="117437193"
X-IronPort-AV: E=Sophos;i="6.27,208,1787004000"; 
   d="scan'208";a="117437193"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE805.infineon.com) ([172.23.29.31])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 03:25:19 +0100
Received: from MUCSE811.infineon.com (172.23.29.37) by MUCSE805.infineon.com
 (172.23.29.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 12 Nov
 2026 03:25:18 +0100
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE811.infineon.com
 (172.23.29.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 12 Nov
 2026 03:25:18 +0100
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.056; Thu, 12 Nov 2026 03:25:18 +0100
From: <Takahiro.Kuwano@infineon.com>
To: <nuno.sa@analog.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <pratyush@kernel.org>, <mwalle@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>
Subject: RE: [PATCH v4] mtd: spi-nor: micron-st: Add support for is25wx01g
Thread-Topic: [PATCH v4] mtd: spi-nor: micron-st: Add support for is25wx01g
Thread-Index: AQHdbgxT16z/LCoqo0ucH5OFl4R/+7cpmcow
Date: Thu, 12 Nov 2026 02:25:18 +0000
Message-ID: <f3510faf94ae4f878a96d4382dfd3d35@infineon.com>
References: <20261106-mtd-spi-nor-new-issi-chip-v4-1-7e2b6a361fe0@analog.com>
In-Reply-To: <20261106-mtd-spi-nor-new-issi-chip-v4-1-7e2b6a361fe0@analog.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_182622_131560_38B1D116 
X-CRM114-Status: GOOD (  16.09  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

> Add support for the ISSI IS25WX01G, a 1 Gbit (128 MiB) octal NOR flash.
> The part is fully described by SFDP, so only the flash ID and small
> post_bfpt and post_sfdp fixups are needed.
> 
> WRITE STATUS REGISTER (01h) takes a single data byte and only affects
> status register bits 7:2, so the default 16-bit Write Status assumption
> does not hold. Clear write_sr1_and_sr2 so that the single byte write_sr1
> path is taken; write_sr1 is already set to 01h by the BFPT parsing.
> 
> The flash also has no Status Register 2. Configuration registers are read
> with B5h/85h and written with B1h/81h, and the 35h Read Configuration
> Register command does not exist, so clear read_sr2 as well.
> 
> Software write protection is done through the block protect bits in the
> status register: BP0-BP2 at bits 4:2, BP3 at bit 6 and a Top/Bottom bit at
> bit 5, which is exactly what SPI_NOR_HAS_LOCK, SPI_NOR_4BIT_BP,
> SPI_NOR_BP3_SR_BIT6 and SPI_NOR_HAS_TB describe, so set those flags to get
> the generic locking support.
> 
> The flash also supports 8D-8D-8D, but this could not be tested. Since the
> SFDP has no SCCR map, the core would select 8D-8D-8D on a capable
> controller but never switch the flash into it. Hence, drop the 8D-8D-8D
> capabilities in a post_sfdp fixup for now.
> 
To fix missing SCCR map,
	.fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE
is needed.

Could you check if it works?

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
