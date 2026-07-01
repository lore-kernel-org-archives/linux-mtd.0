Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFBAC43458
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2026 23:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3wBpI2cKfCY05H+D19zNrjGA34SBnrUHPgtkhs3NkJ8=; b=ThzIlr3RMuUzlq
	0XdyOVsNBH73RHw5nGX/EPF6g9sGiFYiuhB3zsHCKr6s5Zh32k/FVNs0vsk6FclCcjPv3x7NKyq3z
	CkHdMVDsogTEVhOWSDfn7f8TkHRpKixkH/68+HJHCYG2TAWxud3D4cbqz/i+TUs4WjrXG4UAG8NIW
	V65KuFfpm2+Rjb6/gYEHxYPS5SIXhN/9FkNPH3hdAGOkFo3CVKfIaaYk+xGfqMuBBYH1XgIwaHsqW
	yBCQh+D52Xn04L7Xq6LHmji65opyrHE0oSgswgqLgHY0LqeFMLYvV2uibUOHfTAvpzuIFemwy5X55
	FpIPRJDN0sX/G/JFR2tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4Za-00000003DhY-1rrC;
	Wed, 01 Jul 2026 23:42:30 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4ZW-00000003Dgm-3HER
	for linux-mtd@lists.infradead.org;
	Wed, 01 Jul 2026 23:42:28 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C1EC12C097B;
	Thu,  2 Jul 2026 11:42:08 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1782949328;
	bh=v7m//nx1bxRLXXTEfs+vJvCrDomDeGzAFO5gBtd6KgI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=RaU7UtLqQKCHFNIPrUvw3wei6Ldeul6CHHHp7/jA/qfRXPAyRHqxHrh3SXgiiY6S3
	 vlYs58AXGKX4GXD05PiT8MIVGkxhhYSRpW1g6Scduk6YiuAjeF79qC1ucC8442CGU/
	 qoFujvK+iEM/33iAXMrcq6yxuO3UYZB6LSWfPPsjPGZ6LK/3EpEuQGwxEhRqtlTLmx
	 ak3qt089xatsZjYcvbCXkZW8yqZf9yLQkfe+XlWknKYk1jjigC2vrJOm2+hFnFacz3
	 GGcr+0HsTGvwBbDv/Otw57pLDxG8W1QVhd0Tf7vFzjiJkGOZVrXtJZp+o8mx8DI+7/
	 HapzNiqtjFpgA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6a45a5d00000>; Thu, 02 Jul 2026 11:42:08 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Thu, 2 Jul 2026 11:42:08 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1748.039; Thu, 2 Jul 2026 11:42:08 +1200
From: Ronan Dalton <Ronan.Dalton@alliedtelesis.co.nz>
To: "mwalle@kernel.org" <mwalle@kernel.org>, "takahiro.kuwano@infineon.com"
	<takahiro.kuwano@infineon.com>
CC: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
	<richard@nod.at>, "pratyush@kernel.org" <pratyush@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"vigneshr@ti.com" <vigneshr@ti.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, Aryan Srivastava
	<Aryan.Srivastava@alliedtelesis.co.nz>, Chris Packham
	<Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v2 1/3] Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT
 support"
Thread-Topic: [PATCH v2 1/3] Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT
 support"
Thread-Index: AQHdBRJ8+HvBPYSwmEi4Lf0sk+8LHLZV9jcAgADe8oCAAER1AIAAEDcAgABljoCAAQPBgA==
Date: Wed, 1 Jul 2026 23:42:08 +0000
Message-ID: <c0b67510d99dd0d3606b316d2780c45498f03f90.camel@alliedtelesis.co.nz>
References: <2b8390c0aaae4203af318f9a5edbb0eb@infineon.com>
	 <20260701020856.217664-1-ronan.dalton@alliedtelesis.co.nz>
	 <DJN30JTAW4NY.28G7HNY6QS299@kernel.org>
In-Reply-To: <DJN30JTAW4NY.28G7HNY6QS299@kernel.org>
Accept-Language: en-US, en-NZ
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.12.18]
Content-ID: <17E83C81170F1E41AE24680981E0143D@alliedtelesis.co.nz>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=TI3mSEla c=1 sm=1 tr=0 ts=6a45a5d0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=BhaoXNk7gXQA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=6IedOMOfVgFJN3ZsrsQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_164227_299527_C874FA97 
X-CRM114-Status: GOOD (  21.56  )
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

Hi Michael,

On Wed, 2026-07-01 at 10:12 +0200, Michael Walle wrote:
> > The SPI-NOR subsystem has support for the cy15x104q chips, which
> > are
> > FRAM chips. There is also support for Everspin MRAM chips, which
> > are
> > comparible to FRAM (and are also of small size).
> 
> Yeah, these are mostly old parts, (except for the newer cypress
> thing, which
> was a mistake to add). But there is little we can do, but to
> eventually remove them in the future when it's likely no boards are
> using them anymore. Thus, we don't want to add newer parts to this
> list and make it even harder for us to get rid of these.

I understand. Thanks for clarifying this.

> 
> > Because of this, we thought there was precident to add support for
> > this
> > chip. I was under the impression that the opcodes used to interact
> > with
> > the chip had a greater significance than the underlying technology
> > used,
> > and this chip fits in with the other spi-nor chips based on that.
> > Feel
> > free to correct me if I'm wrong here.
> 
> I'd argue, if they really wanted to emulate a flash device, they
> would have added an (emulated) erase opcode. Without it, it behaves
> like an EEPROM which has byte granularity access.

Regards,
Ronan.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
