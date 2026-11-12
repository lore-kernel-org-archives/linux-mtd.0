Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421B3606A337
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 00:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kCxHcyBC;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=Xa6OG/uU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1gCEqoZlGyf45NO2Hyj+YWRnVHdl2ghtUmcoSFhtD2U=; b=kCxHcyBC4T9nE/EYVOqM56P0xX
	HEva6HIN9+TvHBZKhOOK6P+ILEdz9jHTBMQANgwZ1YMUlnYx6ikLbRCgsveb8KaynAA/C6S3pvg5H
	yH+YxJqY5vlnCYFU66M/5Rf94hSMBI7JnuwdCBd/5w8WXuojFMFw17APyCqJcDdv1MSt/lmARVOTh
	jC3cfRxaQwjTw2bto+mWvdQe/2McpduMQBkXKKwXfbzE8+E/9h58UxiyX6hd4tnv6n/EKFlq5sM3X
	hXfB0vOOWbj+DaHw2Jcp4tqE05sG8RVqc3g4/IdF6qNVlb7HdQj3Zpr6xzqkTjWcQ1bb/j3634XGE
	Kb348zVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRIS7-00000008DIM-0cS7;
	Thu, 12 Nov 2026 00:14:07 +0000
Received: from smtp11.infineon.com ([2a00:18f0:1e00:4::5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRIS4-00000008DHX-0nL0
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 00:14:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1794442444; x=1825978444;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Gjj8XrtdGf75bTN04E+EJ60Af0aZGvGLYuMFY0/g4K8=;
  b=Xa6OG/uUa3BWolmgiURywjW8cpwU/zsTU5nkFvKFKB5PLVZQj85kyCUR
   +yCWY/Elo6SGYplotirfyhkr8wYfEOn27/PsiXU9SCXD491rLgOYNqJ++
   niSKKm3ViC6O/qaHyC2uY8PPDvGpdXHO/XAidYPHmQB3sdFFAw0qv37j0
   E=;
X-CSE-ConnectionGUID: pSyOsSnRQ+qVXrRISUb0YA==
X-CSE-MsgGUID: tOlzg8wgQ2SHC0KGJW7FEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="169882909"
X-IronPort-AV: E=Sophos;i="6.27,208,1787004000"; 
   d="scan'208";a="169882909"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE819.infineon.com) ([172.23.29.45])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 01:14:00 +0100
Received: from MUCSE820.infineon.com (172.23.29.46) by MUCSE819.infineon.com
 (172.23.29.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 12 Nov
 2026 01:13:59 +0100
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE820.infineon.com
 (172.23.29.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 12 Nov
 2026 01:13:59 +0100
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.056; Thu, 12 Nov 2026 01:13:59 +0100
From: <Takahiro.Kuwano@infineon.com>
To: <changhuang.liang@starfivetech.com>, <pratyush@kernel.org>,
	<mwalle@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH v1 3/3] mtd: spi-nor: macronix: Add 1-4-4 DTR read support
 for MX66L1G45G
Thread-Topic: [PATCH v1 3/3] mtd: spi-nor: macronix: Add 1-4-4 DTR read
 support for MX66L1G45G
Thread-Index: AQHdccU75kEGd21+l0yxtHbv82cQY7cpkaAg
Date: Thu, 12 Nov 2026 00:13:59 +0000
Message-ID: <ee182cedf0d94d5fa9dfc9696bb0b890@infineon.com>
References: <20261111101240.7378-1-changhuang.liang@starfivetech.com>
 <20261111101240.7378-4-changhuang.liang@starfivetech.com>
In-Reply-To: <20261111101240.7378-4-changhuang.liang@starfivetech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_161404_541127_C3EDF51C 
X-CRM114-Status: GOOD (  13.85  )
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

> The MX66L1G45G supports the 1-4-4 DTR read mode. This flash uses 6
> dummy cycles by default in 1-4-4 DTR mode.
> 
> For 1S-4D-4D, its support bit is located in the 21st DWORD of the
> BFPT table, while the dummy cycles are described in the 23rd DWORD.
> Unfortunately, the BFPT of this flash model only provides 16 DWORDs,
> and the kernel's SFDP parser does not derive any
> SNOR_HWCAPS_READ_1_4_4_DTR capability from the BFPT table.
> 
> Since this information is expected to be in the BFPT, add a post_bfpt
> fixup which declares the 1-4-4 DTR read capability with the default 6
> dummy cycles and the 3-byte address opcode (0xED).
> 
> The SFDP of this part provides a 4BAIT table, which also advertises
> the 4-byte 1-4-4 DTR opcode (0xEE). As the capability is now set
> before the 4BAIT table is parsed, the 4BAIT parser keeps it and
> converts the opcode to its 4-byte variant, like it does for the other
> read commands.
> 
> Add a dedicated fixup for the part (SNOR_ID 0xc2, 0x20, 0x1b) that
> keeps the existing QPP 4-byte post-SFDP fixup and additionally
> advertises the 1-4-4 DTR read capability in post_bfpt.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
