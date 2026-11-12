Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263BB606A888
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 00:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dimrp0Tv;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=ZEaIEhDc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MxMXdFpWpH07Zxkiko1JAwFwv8zD19++hVKXWIolVTE=; b=dimrp0Tvn+JiwyMKU9XP2vu/aV
	eL+fbm7BO0nLcJd8qhJCe0JvxG7mWGN+yVQVjReZ7CxxOSzKzKhYQRxCsceQDXq3J6aT1cLzYYFXM
	jCcToLV0//19oqe0G1Wh9yUEpzbD1I5TF0hgIeiTCaURo/zjskMQG/0zfigh/AlCvhjYbziUU2KJS
	QFMgVPmb3zLKcq8JyyGWJQEcvir1HjkTGwfuQJtfUuiHoFKyR7GbfFfbIqH3uMMPBVSyde88HPaHd
	1Ens+yKiPWNUsw8LexCCB5j3KdOKLx0pyRA498DD4t3XNPWZSmOrlOQA9gGfDdq4QKWpNOJExqswr
	x4wUBCEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRITW-00000008DUl-3SV4;
	Thu, 12 Nov 2026 00:15:34 +0000
Received: from smtp9.infineon.com ([217.10.52.204])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRITS-00000008DRi-22sm
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 00:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1794442531; x=1825978531;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=J7xiuHu8kEvR6ZlxF6M5Zmz9k5Q+n7FylxaOjMfzFU4=;
  b=ZEaIEhDcmyYdlWupbhCq90SSlvYYJcdCK6GytL7kNXCKEY+++nBg+XOM
   X8BVPcXlf13mt5Nr4lzo4ps1gs20YQiDFQtyIEJN+4g0vLq00poiFOaRb
   rhQ6YDi5QqWwwgtYsPeSu3ToDgQz4YvLswdu8ZE8YCWl74+GzJm862M8u
   0=;
X-CSE-ConnectionGUID: iDLFsdWsRp+UjkfNLKCEuQ==
X-CSE-MsgGUID: DaDuatSdS/CU0v5Vs2Oehg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="117413237"
X-IronPort-AV: E=Sophos;i="6.27,208,1787004000"; 
   d="scan'208";a="117413237"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE812.infineon.com) ([172.23.29.38])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 01:15:03 +0100
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 12 Nov
 2026 01:15:02 +0100
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.056; Thu, 12 Nov 2026 01:15:02 +0100
From: <Takahiro.Kuwano@infineon.com>
To: <changhuang.liang@starfivetech.com>, <pratyush@kernel.org>,
	<mwalle@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH v1 1/3] mtd: spi-nor: Support mixed 1S-xD-xD DTR protocols
 in spi_nor_spimem_setup_op()
Thread-Topic: [PATCH v1 1/3] mtd: spi-nor: Support mixed 1S-xD-xD DTR
 protocols in spi_nor_spimem_setup_op()
Thread-Index: AQHdccU7vDdb+C7/3E+0a9kRwM+hPrcpkglA
Date: Thu, 12 Nov 2026 00:15:02 +0000
Message-ID: <a10258d08b07408cb35a935f42218ea9@infineon.com>
References: <20261111101240.7378-1-changhuang.liang@starfivetech.com>
 <20261111101240.7378-2-changhuang.liang@starfivetech.com>
In-Reply-To: <20261111101240.7378-2-changhuang.liang@starfivetech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_161530_858629_E01FED80 
X-CRM114-Status: GOOD (  12.89  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Currently spi_nor_spimem_setup_op() sets all four phases (cmd, addr,
> dummy, data) to DTR whenever spi_nor_protocol_is_dtr(proto) is true.
> This is too coarse: the 1S-xD-xD DTR protocols (1_1_1_DTR, 1_2_2_DTR,
> 1_4_4_DTR, 1_8_8_DTR) send the command phase in STR on a single line,
> and only the address, dummy and data phases in DTR. SPIMEM supports
> such mixed DTR modes.
> 
> Split the handling:
> 
>   - For SNOR_PROTO_8_8_8_DTR, keep the existing behavior: set all
>     phases to DTR and use a 2-byte opcode (opcode + extension).
> 
>   - For the other DTR protocols, set the command phase to STR and only
>     the address, dummy and data phases to DTR. Double op->dummy.nbytes
>     since DTR transfers 2 bytes per clock cycle, matching how the dummy
>     cycle count is specified for these protocols.
> 
>   - Move the SWAP16 handling into the 8D-8D-8D branch as well, since
>     it only applies there.
> 
> No in-tree flash currently declares SNOR_HWCAPS_READ_1_x_x_DTR, so
> this is not a bug fix but preparation for enabling these protocols.
> A follow-up patch will enable 1S-4D-4D for the MX66L1G45G. The
> 8D-8D-8D path is unchanged.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
