Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCA2C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Mar 2022 16:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=81b7ULctIU8V6UiQtDXeigVuSV67cg8CjDmKMXzXkhE=; b=fX4AWU/jTXwCWB
	JFY5j/En+BoAVMOODEgaaJSvE1lFP+nnXGFg/GRn1hCnnKrasRi5jCKeVR8CzG1iVzX7BTaoS0cAf
	gSzLgVZhV+/3Rbn2dtf49/VfPFVIHh8pmdkJfdA5hzqj9t2qr60LGrfgxQyjxJa2r4BFo8BkRpw7i
	ssG4/dHAb7VUnLPjxnfBnL522w5hDQSKXsA1F3lW3yLpO3hWuvGEkaFwxdL1P9aL/SfWqK7uNUNzQ
	5YMbGCPxHyOVmsra2RtphkA3+sQtxN/IBUE9LJIZgGedVJHlbeiebatAQI/mi33gWYjcCV4bXqSPE
	gQbRqoGmtVmIAtpAw39w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUtJn-00GqfU-5p; Thu, 17 Mar 2022 16:49:43 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUtJk-00Gqf6-2B
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2022 16:49:41 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22HGnV6B012906;
 Thu, 17 Mar 2022 11:49:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1647535771;
 bh=+aNB9KHNL1PTMNUTpdQe7rMub1NeQ/aOpyqSHiNlDt4=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=WAzERI4+ZGn+2aQoq1WNPad9nvnMv9/ma9CauR3UQ9K2RC4j5KzbicgEchYsr/23Y
 nxSryQLyTxxzfxez4mspNAdP1DmUS3hENsebv3bjM/Fujn7FVP4sWlQ/4MQn1LlNTt
 llZfIqRapCAnKp4ZrkBpICUqJmjJDqXZBpB2G9zI=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22HGnVHP072116
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 17 Mar 2022 11:49:31 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 17
 Mar 2022 11:49:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 17 Mar 2022 11:49:31 -0500
Received: from [10.250.234.22] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22HGnQdg028012;
 Thu, 17 Mar 2022 11:49:27 -0500
Message-ID: <d755a917-7763-764e-7030-3afd5154053c@ti.com>
Date: Thu, 17 Mar 2022 22:19:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 0/6] spi-mem: Allow specifying the byte order in DTR
 mode
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>,
 "'Michael Walle'" <michael@walle.cc>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, "p.yadav@ti.com"
 <p.yadav@ti.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, "nicolas.ferre@microchip.com"
 <nicolas.ferre@microchip.com>
References: <20220311080147.453483-1-tudor.ambarus@microchip.com>
 <76eb13b6-9263-975f-3196-312259634301@ti.com>
 <b60064231d33581c20279172cf8f765e@walle.cc>
 <0f271365-354b-82e2-02a2-9d69a6ac85b1@ti.com>
 <9bc530d1fdaf4490a00fee150f963ac7@AcuMS.aculab.com>
 <bc2083a8903fdabc65083f7e5232ca2d@walle.cc>
 <8b765d24cb9a422bb383aad07251b65f@AcuMS.aculab.com>
 <c17fe9c6-0757-dbb6-6efb-69d05d7ff589@ti.com>
 <fcae2d955b3f43af8d64f1aa50fbc685@AcuMS.aculab.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <fcae2d955b3f43af8d64f1aa50fbc685@AcuMS.aculab.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_094940_226060_CD6A4D4B 
X-CRM114-Status: GOOD (  19.13  )
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



On 17/03/22 4:40 pm, David Laight wrote:
> From: Vignesh Raghavendra
>> Sent: 17 March 2022 10:24
> ...
>> Modern OSPI/QSPI flash controllers provide MMIO interface to read from
>> flash where DMA can pull data as if though you are reading from On chip RAM
> 
> So the cpu does an MMIO read cycle to the controller which doesn't
> complete until (for the nibble-mode spi device I have):
> 1) Chipselect is asserted.
> 2) The 8-bit command has been clocked out.
> 3) The 32bit address have been clocked out (8 clocks in nibbles).
> 4) A few (probably 4) extra delay clocks are added.
> 5) The data is read - 8 clocks for 32bits in nibble mode.
> 6) Chipselect is removed.
> 
> Now you can do long sequential reads without all the red tape.
> But a random read in nibble mode is about 30 clocks.
> 16 bit mode saves 6 clocks for the data and maybe 6 for the address?
> 
> The controller could do 'clever stuff' for sequential reads.
> At a cost of slowing down random reads.
> 
> So even at 400MHz it isn't that fast.

Random CPU reads would be inherently slow, its just how HW is.

But, there are cases like image load from flash and Filesystem over
flash which would use DMA to maximize performance, such cases would be
greatly affected if we do SW byte swap

> 
> If the MMIO interface to the flash controller is PCIe you can
> add in a load of extra latency for the cpu read itself.
> 
> While PCIe allows multiple read requests to be outstanding,
> the Intel cpu I've looked at serialise the reads from each
> cpu core (each cpu always uses the same TLP tag).
> 
> Now longer read TLP help a lot (IIRC max is 256 bytes).
> But the x86 cpu will only generate read TLP for register reads.
> You need to use AVX512 registers (or cache line fetches) to
> get better throughput!
> 

Direct CPU fetch from SPI would not be able to make use of full
Bandwidth for high speed flashes and its not the only usecase.

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
