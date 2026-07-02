Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443BEC43458
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2026 23:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzok21NvD15xH98HCteJY+p09c0FY0m5iCnzEHCLKFc=; b=Rr6PtcB7hlNZ4M
	+4m5CCzgkY0b7LYlwbOdry9k5vqIfotmkGJ+bJy/rvEiu11uiczr9CFSguUFBNFjq/CqsenPYB+0V
	fOqg/QFLq+1cBGHipD6ZJKF5WYgGM5OyWW+YPA7CuzwcA7m/FqWCTOYUjmY//l+cVBEwBStZe+2JG
	nHjij4KUML7xr7toMu8Nr6LrXLO8pvco0YEkCEmni4KaO8eO6KVOoxYVt8Lmi/m8X8m+CP1c3vlew
	h47fbuIVTpGmJsuNeIMEDuQ7gmTJaaYYqU1oaviKL9ZSyIvKx3mn3t6AIkF9CVVPH60G8S1z7yIhj
	50gvzgNsHcwynxiDGsNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfR8n-00000005kvA-1g4X;
	Thu, 02 Jul 2026 23:48:21 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfR8f-00000005ktc-3I2A
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jul 2026 23:48:19 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A47AA2C02D4;
	Fri,  3 Jul 2026 11:48:02 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1783036082;
	bh=pDX4s94+PabMb6i9h40+2pGl0tOE4N6qYffYc5pXUyg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Oqc9T5KTMgZ3+5jFi526Zs4wn+7TC5Hcqy4lxz8+9ENY6q9UJR3cctCXg8A7DUDuC
	 k5iWoZVpuz5yEiMRTQdxtN2SLSARqpMF/KchIGkRLKOMnhO5dJGo0hxszBSt0cYu5A
	 VAViFuz6gfRDU4bypO8wy4cSMXMBhw+7b0gSz3GY4scymjaeZBjxaGbnSqPr5/GBpr
	 3wO6EFTqahxIRAchom8cmzg8w13fJlfi4hwN1ZwXZ0Gm1sXTthFo2occ6t0BTA9aj3
	 va3CJSNUDqknc15Fw0l6uFVzaPonzLx1UqwSAMWanpB31Zdh3IErktfrD+/Pi/NKe9
	 bI5AvY9ULSvkw==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6a46f8b20000>; Fri, 03 Jul 2026 11:48:02 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Fri, 3 Jul 2026 11:48:02 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1748.039; Fri, 3 Jul 2026 11:48:02 +1200
From: Ronan Dalton <Ronan.Dalton@alliedtelesis.co.nz>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>, "richard@nod.at"
	<richard@nod.at>
CC: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"Takahiro.Kuwano@infineon.com" <Takahiro.Kuwano@infineon.com>,
	"pratyush@kernel.org" <pratyush@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Aryan
 Srivastava" <Aryan.Srivastava@alliedtelesis.co.nz>, "mwalle@kernel.org"
	<mwalle@kernel.org>
Subject: Re: [PATCH v2 1/3] Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT
 support"
Thread-Topic: [PATCH v2 1/3] Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT
 support"
Thread-Index: AQHdBRJ8+HvBPYSwmEi4Lf0sk+8LHLZV9jcAgADe8oCAAER1AIAAEDcAgACAk4CAAQSDAIAAFjqAgAAHAgDqoturHpVef02A
Date: Thu, 2 Jul 2026 23:48:02 +0000
Message-ID: <a86e2233c6ea01b1dcefb8c7f7f582725a25b5e5.camel@alliedtelesis.co.nz>
References: <2b8390c0aaae4203af318f9a5edbb0eb@infineon.com>
	 <20260701020856.217664-1-ronan.dalton@alliedtelesis.co.nz>
	 <490fc98b2996487fba3abd62176bb1dd@infineon.com>
	 <8baaf8a603f7f351b4f7acb7a2df4cb60be9f083.camel@alliedtelesis.co.nz>
	 <99731a393e5649e692afe57f59d5926b@infineon.com>
	 <e946b3c6-304a-4015-a144-285e7f2f4e6a@alliedtelesis.co.nz>
	 <490633873.5619.1782970758317.JavaMail.zimbra@nod.at>
In-Reply-To: <490633873.5619.1782970758317.JavaMail.zimbra@nod.at>
Accept-Language: en-US, en-NZ
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.12.18]
Content-ID: <3831264DCC7D3D478CD01936EE28E658@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=TI3mSEla c=1 sm=1 tr=0 ts=6a46f8b2 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=BhaoXNk7gXQA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=efkteKykisSJ_N_ILTMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_164814_304118_EC137516 
X-CRM114-Status: GOOD (  10.44  )
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

Hi Richard,

On Thu, 2026-07-02 at 07:39 +0200, Richard Weinberger wrote:
> Do you really need (POSIX) file system semantics?
> You could partition the FRAM into cells and then work with them.
> e.g. Just dd into it and erase it when needed...
> Maybe the NVMEM cells mechanism needs some polishing but this sounds
> reasonable to me.

Yes, that could work for secrets storage. However we also store
persistent logs and DHCP leases on this flash to minimize read/writes
on the main flash, and this data is stored as files of varying lengths.
A filesystem provides the most straightforward way of storing this data
for us.

That's not to say we couldn't develop some system of using the nvmem
device as a backend for this data. This may be something we look at in
the future.

Thanks,
Ronan.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
