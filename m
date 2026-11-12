Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ACC606A321
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 00:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d4sc6rAQ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=infineon.com header.i=@infineon.com header.a=rsa-sha256 header.s=IFXMAIL header.b=BmtEGwuN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Z6in19e5yxga3PSr+uzz4BAJzUk10zNdbZyKqk5S6NU=; b=d4sc6rAQ3vj9ZPQfzdBP/UsJec
	iRhp1nKtbXhuGo8XTK7/x1SL5yUy4iqWZaga+RKYX9DNcR0rDTIaXZMrfSDwPUOakxTxlR4GMre86
	+v3OOC/tK12auG92TiG0YmKFF5zu575IzvC+pG6vsSO03NCWt98bF9Q4zliSF8cnrBycgt9fq2HRj
	4qPGKp0Pq6mXyCQ6qZWBbfsuG/sVDdLKyPJc4qn6uKjoVrvOIqLe/RqcJrre3dC/yiNr223o9rtZU
	pX7G4T6aPo42wFru0EEMvJLRqGwJCfHyKwmKnxKJvC6qdgUq3zOl0sNPtq5z0gDd2B7sArOZ1yngX
	YvS8gkjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRITT-00000008DSw-2UHl;
	Thu, 12 Nov 2026 00:15:31 +0000
Received: from smtp9.infineon.com ([217.10.52.204])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRITQ-00000008DRi-1d7G
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 00:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1794442529; x=1825978529;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=k7kpbDZfkdOu+6+Q4eAosh4Dn7tQCdI9lK4TiaOQa1M=;
  b=BmtEGwuNR83iiR6ZDXWTI5T3dDq6MWZy4EoyszLEtS9FFhzG7yblpX1W
   qwJJcfHA/Zm6Zk7fTEolVeu1eABGsM+ZEwjNZqGyYgbcLaWfXUkeh5T2O
   Qv3naIVwyrBqsaXWbx8juYd9URDlWqH++K5eIC0QeHJxcAItQtROd7z3q
   k=;
X-CSE-ConnectionGUID: HcBWqX06T3eMXfcMeEeiRw==
X-CSE-MsgGUID: BhPEGWKUQMuvlhW+Eydr+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="117413051"
X-IronPort-AV: E=Sophos;i="6.27,208,1787004000"; 
   d="scan'208";a="117413051"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE812.infineon.com) ([172.23.29.38])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 01:14:27 +0100
Received: from MUCSE813.infineon.com (172.23.29.39) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 12 Nov
 2026 01:14:26 +0100
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE813.infineon.com
 (172.23.29.39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 12 Nov
 2026 01:14:25 +0100
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.056; Thu, 12 Nov 2026 01:14:25 +0100
From: <Takahiro.Kuwano@infineon.com>
To: <changhuang.liang@starfivetech.com>, <pratyush@kernel.org>,
	<mwalle@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH v1 2/3] mtd: spi-nor: debugfs: Correct DTR protocol names
 for 1S-xD-xD modes
Thread-Topic: [PATCH v1 2/3] mtd: spi-nor: debugfs: Correct DTR protocol names
 for 1S-xD-xD modes
Thread-Index: AQHdccU8ziCaTaZiX0OZMPbBig06S7cpkeuQ
Date: Thu, 12 Nov 2026 00:14:25 +0000
Message-ID: <53feff9e3be2486eadb42bb3302cfc5f@infineon.com>
References: <20261111101240.7378-1-changhuang.liang@starfivetech.com>
 <20261111101240.7378-3-changhuang.liang@starfivetech.com>
In-Reply-To: <20261111101240.7378-3-changhuang.liang@starfivetech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_161528_752089_52132B9F 
X-CRM114-Status: GOOD (  11.53  )
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

> The debugfs protocol names for the mixed DTR modes (1-1-1, 1-2-2,
> 1-4-4, 1-8-8) currently print the command phase as "1D", i.e. dual
> transfer on a single line.  That does not match the protocol
> definition: these modes issue the opcode on a single line in single
> data rate (S), and only the address, dummy and data phases use DTR
> (D).  The "1D" prefix is therefore wrong.
> 
> Rename them to "1S-xD-xD" so the names reflect that the first phase
> is single-data-rate on one line, consistent with the "8D-8D-8D"
> naming for SNOR_PROTO_8_8_8_DTR.
> 
> This only changes the strings printed by debugfs; no functional
> behavior is affected.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
