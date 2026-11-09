Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB991606A322
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 05:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZgMXcjmY;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=F5faiD27
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Gyja+Df9xYm0xSrM5OwoJZHj2vXh1/hdDrfmBobydAk=; b=ZgMXcjmYmJ9CyqCW+rjXP2c2Kb
	6tIYLqMNmw766UCk6PREoSx+uuOipoOJ0uGpry2bAYQ4gcurE+7tANG4Z2d4kQfJgdH5BqwfbwMu5
	nCZ+uBk3BaMv8nf09RwBYEZC5Vys2FkUpS6bslPf/W8pcRh9FY8/dSuWGUO3JhJCMa9f2haqaTkWN
	XOWwdFZD+oU12eLStq6zFCJITjWTDWBY+ELeuzHt9rsuVBNw2N/FSvnr/eHnp3BCVcH8Q7xyPMRz0
	rjtTySPkCf3D+GNRM1BptQJudkE3Jrs9b1sbX2zpkvtDMOyhuRC0T+a2rqH8GhPojkP3oCoj7NPQ5
	kvPCUW+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQIBY-0000000HRiu-2I2s;
	Mon, 09 Nov 2026 05:44:52 +0000
Received: from smtp11.infineon.com ([2a00:18f0:1e00:4::5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQIBV-0000000HRhx-3tzr
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 05:44:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1794203090; x=1825739090;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=X7E8HrpEX1g48UIcIi/75yDAhrUsrSkw8ZsnU9mUtTM=;
  b=F5faiD27XNsdnUcqkngfd4CNoQ1XelBsuHkrgA420V8ADGTGfHT59n38
   0qcQ3Yu9Y/Gzv0gPZx4X9n9n+rkMUtzCH1FQyyLtQgGhDRCR527oauHip
   3E1bo17F2PWjEsUvW7/jI7nQnKB/RBUbhGMCLEUQMTYBfExWHiX69PAvo
   s=;
X-CSE-ConnectionGUID: t1eH6xMUTbmslgbO4DLpgg==
X-CSE-MsgGUID: dyR6V3G7QrySBqswGM3ARw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="169408831"
X-IronPort-AV: E=Sophos;i="6.27,203,1787004000"; 
   d="scan'208";a="169408831"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE814.infineon.com) ([172.23.29.40])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 06:44:46 +0100
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE814.infineon.com
 (172.23.29.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 9 Nov
 2026 06:44:45 +0100
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.056; Mon, 9 Nov 2026 06:44:45 +0100
From: <Takahiro.Kuwano@infineon.com>
To: <changhuang.liang@starfivetech.com>, <pratyush@kernel.org>,
	<mwalle@kernel.org>, <broonie@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>
CC: <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
Subject: RE: [PATCH v2 5/5] mtd: spi-nor: macronix: Add 1-4-4 DTR read support
 for MX66L1G45G
Thread-Topic: [PATCH v2 5/5] mtd: spi-nor: macronix: Add 1-4-4 DTR read
 support for MX66L1G45G
Thread-Index: AQHdZtV4kyMcQUvb0kSyuhR/PPPjMrclP/Kw
Date: Mon, 9 Nov 2026 05:44:44 +0000
Message-ID: <fd16660e38f24049af5db47d726744d5@infineon.com>
References: <20261028121100.79667-1-changhuang.liang@starfivetech.com>
 <20261028121100.79667-6-changhuang.liang@starfivetech.com>
In-Reply-To: <20261028121100.79667-6-changhuang.liang@starfivetech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_214450_608171_8E2CDE8E 
X-CRM114-Status: GOOD (  15.97  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

> The MX66L1G45G supports the 1-4-4 DTR read mode. This flash uses 6
> dummy cycles by default in 1-4-4 DTR mode.
> 
> For 1S-4D-4D, its support bit is located in the 21st DWORD of the
> BFPT table, while the dummy cycles are described in the 23rd DWORD.
> Unfortunately, the BFPT of this flash model currently only supports
> 16 DWORDs, and the kernel's SFDP parser does not derive any
> SNOR_HWCAPS_READ_1_4_4_DTR capability from the BFPT table.
> 
> Therefore, implement late_init to initialize support for this opcode,
> configuring the read settings with the default 6 dummy cycles.
> 
Since the 1S-4D-4D support and dummy cycles are expected to be in BFPT,
this fix should be done in post_bfpt.

> The SFDP of this part provides a 4BAIT table, which also advertises
> the 4-byte 1-4-4 DTR opcode (0xEE). SFDP parsing converts the read
> opcodes to their 4-byte variants and spi_nor_set_4byte_opcodes() is
> skipped later on, but the 1-4-4 DTR read is only added in late_init,
> after 4BAIT has been parsed, so it is not converted there. Select
> the 4-byte opcode directly in that case.
> 
If 1S-4D-4D support is added in post_bfpt, conversion to 4-byte opcode
is done during 4BAIT table parse, right?

> Also set SPI_NOR_4B_OPCODES like MX66L51235F (0xc2 0x20 0x1a). The
> part supports the 4-byte opcode set, so if 4BAIT parsing does not
> complete, spi_nor_set_4byte_opcodes() still picks the 4-byte variants,
> including 0xEE for 1-4-4 DTR. With 4BAIT parsed, as on the tested
> part, the flag has no further effect.
> 
> Add a dedicated fixup for the part (SNOR_ID 0xc2, 0x20, 0x1b) that
> keeps the existing QPP 4-byte post-SFDP fixup and additionally
> advertises the 1-4-4 DTR read capability in late_init.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> 

Thanks,
Takahiro


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
