Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0130C43458
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2026 01:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q0w+zACPnZVURsjl1lqcDmgGaV7MZQokgwPj+1+LE88=; b=YML6aU7n91FCQ/
	wJrwv9japGiZ7JFACXnrm63ZaA338qFsRUx6ZFuazk3Xjt9hdua3q6JctOo3UxqLnxzKerJ/ZUjnt
	By0zkOkIVC8n6ffOOTb2bJQH4geQleOcEOBsWMsjzkFXFSNz03+kb+E1rJ5iWf0PzUSh1O0cq6Aef
	rv6wZQKyTwSebtEaEVjsIJYYsc7nSfdJvF2R5GisH+bea6VvE7JLoinW41eXF2VSi/NKJTR6mUZhb
	7njjWpf8FyJA/oqchPbg/bAmn5P1r82OwsEb6CDgv8GUSG9qPV5ri/SzoaDLek9mdwtX+QDmG9Y6S
	VJtlKkPO1+bY/KNsQ9uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf67a-00000003Kv4-3soN;
	Thu, 02 Jul 2026 01:21:42 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf67X-00000003Kug-1qhi
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jul 2026 01:21:41 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 0A63E2C097B;
	Thu,  2 Jul 2026 13:21:33 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1782955293;
	bh=sS5zMoHzPHzcDAgX4IQ77Av+EmYkR4pA9mushDRgPiI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=zf90e0Xd6ygndDLXzTcATL0wdMUsIJt8i++Dk7lJTyxUqi42xuWpDSAbZZN/2agOk
	 GBZ33PWHtZc327I8tHaSr4xnlygmQOY0r5uSqQgS3oHyO8ibuLREDI2YjGxA1IEITQ
	 53rtq3Ghhdy0zmFopb+TZj5vCcjGRFWrcGKUKCkkxC9qp9AmtDHQ8f4MNcwBK27jF7
	 9cxGC1gr9+glFsdpyQF6jp39cawvVEMluIH3YMvDwKruaTfRufhvABvWhreCHrat7r
	 5UnRqkT0g6cCXymF4yh/W7rYbOQ/XsCOhZKPts0fpG1Z4cai83+HzLueecjFV9V+wT
	 rp+WzrpsBSlMQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6a45bd1c0000>; Thu, 02 Jul 2026 13:21:32 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Thu, 2 Jul 2026 13:21:32 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1748.039; Thu, 2 Jul 2026 13:21:32 +1200
From: Ronan Dalton <Ronan.Dalton@alliedtelesis.co.nz>
To: "Takahiro.Kuwano@infineon.com" <Takahiro.Kuwano@infineon.com>
CC: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
	<richard@nod.at>, "pratyush@kernel.org" <pratyush@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"vigneshr@ti.com" <vigneshr@ti.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "mwalle@kernel.org" <mwalle@kernel.org>,
	Aryan Srivastava <Aryan.Srivastava@alliedtelesis.co.nz>, Chris Packham
	<Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v2 1/3] Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT
 support"
Thread-Topic: [PATCH v2 1/3] Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT
 support"
Thread-Index: AQHdBRJ8+HvBPYSwmEi4Lf0sk+8LHLZV9jcAgADe8oCAAER1AIAAEDcAgACAk4CAAQSDAA==
Date: Thu, 2 Jul 2026 01:21:32 +0000
Message-ID: <8baaf8a603f7f351b4f7acb7a2df4cb60be9f083.camel@alliedtelesis.co.nz>
References: <2b8390c0aaae4203af318f9a5edbb0eb@infineon.com>
	 <20260701020856.217664-1-ronan.dalton@alliedtelesis.co.nz>
	 <490fc98b2996487fba3abd62176bb1dd@infineon.com>
In-Reply-To: <490fc98b2996487fba3abd62176bb1dd@infineon.com>
Accept-Language: en-US, en-NZ
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.12.18]
Content-ID: <C5B0921D5873034EAC5DEFEE7F2841D5@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=TI3mSEla c=1 sm=1 tr=0 ts=6a45bd1c a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=BhaoXNk7gXQA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=bUQKSiCPAAAA:8 a=IMAtbdSSmuXookCt3LEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-fHZXUhsFbuwFN3fwQAr:22
X-SEG-SpamProfiler-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_182139_958627_FF2DFCCF 
X-CRM114-Status: UNSURE (   8.68  )
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

Hi Takahiro,

On Wed, 2026-07-01 at 09:49 +0000, Takahiro.Kuwano@infineon.com wrote:
> 
> I didn't mean any kernel features, but we can dump tmpfs contents
> from/to FRAM chip (exposed as NVMEM device) by 'dd'. Doesn't it meet
> your system's requirement?

Do you mean something like creating a tmpfs and then say, using `tar`
and copying the data to nvmem with dd and restoring this data at boot?

Regards,
Ronan.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
