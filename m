Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D86C433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Oct 2022 21:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LrQclMQuHc0EbitW6ahXrZeFb3ya/hj9xFty/f6qjYw=; b=Ln5W1M2hF9GbhC
	xgZ06JsG5KBYZdJvynpEqmIbP5CHJv/pclX08s5Z2lQZCL2CVY2+3iDtUD4moI0vMBdQb6mEgLJms
	s+IUG/hFnwPsKqx7V/CzQIqBXZXbikL81ZFK0kLRY/mqf82JS8GxtCqoePPaxXm0wTkg8g5yIOd8s
	5YPUmHS2CWl3JPNLHTZOrP0mS9MRrT9rXSnOnqsLJ/KnTGA2RSGx871E24sR2nqUZngKYNnygfLIo
	7C/xsHEVFVO2X6xMjH58NezWtj4pKbU9hoJwkQ2WKxxduUu4sotgl3WztxJz5SVzXyMbQkFIby2sk
	wWyAdmiTQMvLsCSp5yNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofTGr-007o1T-Sj; Mon, 03 Oct 2022 21:46:41 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofTGo-007nzc-6g
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2022 21:46:40 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 91E3B2C0611;
	Mon,  3 Oct 2022 21:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1664833591;
	bh=nCLnLqHdonwr1+7NWZcYuA2lkeak07sLYiUs0PjOmmY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ML+GcHc2WbEy5oDM43Nx2/9px4lotS5Zd1mTh/n0fOggfOYWLWNPqeJRiXshyvK+u
	 bOWGW7rImkrnRWBi4bA0VYGJCedEycTOM1BZuKL4y/3/q+MKtJjHfoRa5mNAaf2m3u
	 YDauHQoR3Zw+4CCYClCLj2MRSz1lVEROG3nbEsUYXOl9MTDxz9RMKkM+aRS+iA6HPB
	 BOMZnAcDfPqx6+G9z+pOdzw1eZxIXlNI4RKz77+y8qjRYdsznDDK1ySr9YqTzsEZcM
	 R2YwdvMpUdnQk+dadnd7h0ITs4Xbw1fmbK8nTvhxXSagsHulp0+vLM7HwClbNIEC8I
	 0j8SJzo4hxacA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B633b58370000>; Tue, 04 Oct 2022 10:46:31 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.38; Tue, 4 Oct 2022 10:46:31 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.040; Tue, 4 Oct 2022 10:46:31 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
	<richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"bbrezillon@kernel.org" <bbrezillon@kernel.org>
CC: Tony O'Brien <Tony.OBrien@alliedtelesis.co.nz>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: rawnand: marvell: Use correct logic for
 nand-keep-config
Thread-Topic: [PATCH] mtd: rawnand: marvell: Use correct logic for
 nand-keep-config
Thread-Index: AQHY0huGvn+cu0p4h0STUiMnaqi9wa38ZQwA
Date: Mon, 3 Oct 2022 21:46:31 +0000
Message-ID: <482a4114-eeb1-2303-2896-8e480abda876@alliedtelesis.co.nz>
References: <20220927024728.28447-1-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20220927024728.28447-1-chris.packham@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-ID: <CFDBC8737F22B045A9F8726F41803F21@atlnz.lc>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=UKij4xXy c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=Qawa6l4ZSaYA:10 a=nZ5tDJ4FkKnVFCT0SwEA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_144638_759637_C4FD5F8E 
X-CRM114-Status: GOOD (  26.44  )
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

Hi All,

On 27/09/22 15:47, Chris Packham wrote:
> From: Tony O'Brien <tony.obrien@alliedtelesis.co.nz>
>
> Originally the absence of the marvell,nand-keep-config property caused
> the setup_data_interface function to be provided. However when
> setup_data_interface was moved into nand_controller_ops the logic was
> unintentionally inverted. Update the logic so that only if the
> marvell,nand-keep-config property is present the bootloader NAND config
> kept.
>
> Fixes: 7a08dbaedd36 ("mtd: rawnand: Move ->setup_data_interface() to nand_controller_ops")
> Signed-off-by: Tony O'Brien <tony.obrien@alliedtelesis.co.nz>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Just following up on this. I know things have probably been busy with 
the 6.0 release but it's been a week so I figured I'd give this a bump.

> ---
>
> Notes:
>      I think this is a bug that's been lurking for 4 years or so. I'm not
>      sure that's particularly long in the life of an embedded device but it
>      does make me wonder if there have been other bug reports about it.
>      
>      We noticed this because we had a bootloader that used maxed out NAND
>      timings which made the time it took the kernel to do anything on the
>      file system longer than we expected.
>
>   drivers/mtd/nand/raw/marvell_nand.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> index 2455a581fd70..b248c5f657d5 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -2672,7 +2672,7 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
>   	chip->controller = &nfc->controller;
>   	nand_set_flash_node(chip, np);
>   
> -	if (!of_property_read_bool(np, "marvell,nand-keep-config"))
> +	if (of_property_read_bool(np, "marvell,nand-keep-config"))
>   		chip->options |= NAND_KEEP_TIMINGS;
>   
>   	mtd = nand_to_mtd(chip);
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
