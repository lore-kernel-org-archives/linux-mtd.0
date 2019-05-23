Return-Path: <SRS0=uaub=TX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E77EC282DD
	for <linux-mtd@archiver.kernel.org>; Thu, 23 May 2019 09:01:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2EEC2081C
	for <linux-mtd@archiver.kernel.org>; Thu, 23 May 2019 09:01:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eo+LCTDM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2EEC2081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TEw1TJee5q1ecusXEQknHNfybYTM7c2Xzx2OrToZb/U=; b=eo+LCTDM1dWYg1
	lAleTRkkOTICTwrZIRy812mFg4q2K/mDM3cn10ZCQTMtiDHc/ixkaOi53yigysCC3kgurxVowDKoF
	4ybHk/I2BXgyWXWqn3WSQFdyLf0nTIUsMON7uxOx0ymmcpSklNGRlW8URM12O+On3XCedEewOHrjB
	8JlHflPktQhPFJ3/Hd7f19hjKkgPMHiptTT0NeI9A6T0pxPsXNhaPsiQmoiIxZxUpdZKpkpObbXai
	hT98bZDipgO0IK6Y+RMX9/cRo6PkkQ0/50IkZsXzlBtj4wcgkfmSZ7DvBaRV5A6qF42A6gEWA65ls
	oFR0TwVWvikostbR6moA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTjbb-0000RN-Am; Thu, 23 May 2019 09:01:43 +0000
Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTjax-000851-6M; Thu, 23 May 2019 09:01:07 +0000
Received: from sntmail12r.snt-is.com (unknown [10.203.32.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id 9BAD766118D;
 Thu, 23 May 2019 11:01:00 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail12r.snt-is.com
 (10.203.32.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 23 May
 2019 11:01:00 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Thu, 23 May 2019 11:01:00 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Shawn Guo <shawnguo@kernel.org>, Kuldeep Singh <kuldeep.singh@nxp.com>
Subject: Re: [PATCH] arm64: dts: ls1012a: Add QSPI support for ls1012a
Thread-Topic: [PATCH] arm64: dts: ls1012a: Add QSPI support for ls1012a
Thread-Index: AQHVC90UTCiz+BGzB0G+bjSJzqfmRKZ4Tf4AgAAE1IA=
Date: Thu, 23 May 2019 09:01:00 +0000
Message-ID: <d3605699-24ea-a071-93da-1c04c7e40f1b@kontron.de>
References: <20190516114807.30817-1-kuldeep.singh@nxp.com>
 <20190523084340.GM9261@dragon>
In-Reply-To: <20190523084340.GM9261@dragon>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <A79DD735F1818C4ABCA6F0E3CB9F53EC@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 9BAD766118D.AEB2F
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: ashish.kumar@nxp.com, bbrezillon@kernel.org,
 broonie@kernel.org, devicetree@vger.kernel.org,
 kuldeep.singh@nxp.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, shawnguo@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190523_020104_558007_16A3BB41 
X-CRM114-Status: GOOD (  13.12  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 Ashish Kumar <ashish.kumar@nxp.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 23.05.19 10:43, Shawn Guo wrote:
> On Thu, May 16, 2019 at 11:47:04AM +0000, Kuldeep Singh wrote:
>> QSPI support is added for kernel version greater than 5.0 and supports
>> quad mode defined by
>> TX-WIDTH = <4>, RX-WIDTH = <4>
>>
>> RDB/QDS has one 64MB flash from SPANSION(s25fs512s)
>>
>> Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
>> Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
>> ---
>> Dependency on https://patchwork.ozlabs.org/patch/1100471/
>> Dependency on https://patchwork.ozlabs.org/patch/1100472/
>>
>>   .../arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts | 15 +++++++++++++++
>>   .../arm64/boot/dts/freescale/fsl-ls1012a-frwy.dts | 15 +++++++++++++++
>>   arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts | 15 +++++++++++++++
>>   arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts | 15 +++++++++++++++
>>   arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi    | 15 +++++++++++++++
>>   5 files changed, 75 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts b/arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts
>> index f90c040fd5e8..8826278b37bf 100644
>> --- a/arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts
>> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts
>> @@ -61,6 +61,21 @@
>>   	status = "okay";
>>   };
>>   
>> +&qspi {
> 
> Please sort these labeling nodes alphabetically.  That said, &qspi
> should go after &i2c0.
> 
>> +	status = "okay";
>> +
>> +	qflash0: flash@0 {
>> +		compatible = "spansion,m25p80", "jedec,spi-nor";
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		m25p,fast-read;
>> +		spi-max-frequency = <20000000>;
>> +		spi-rx-bus-width = <4>;
>> +		spi-tx-bus-width = <4>;
>> +		reg = <0>;
>> +	};
>> +};
>> +
>>   &i2c0 {
>>   	status = "okay";
>>   
>> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dts b/arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dts
>> index 8749634c55ee..0246e8c97628 100644
>> --- a/arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dts
>> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dts
>> @@ -20,6 +20,21 @@
>>   	status = "okay";
>>   };
>>   
>> +&qspi {
>> +	status = "okay";
>> +
>> +	qflash0: flash@0 {
>> +		compatible = "spansion,m25p80", "jedec,spi-nor";
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		m25p,fast-read;
>> +		spi-max-frequency = <20000000>;
>> +		spi-rx-bus-width = <4>;
>> +		spi-tx-bus-width = <4>;
>> +		reg = <0>;
>> +	};
>> +};
>> +
>>   &i2c0 {
>>   	status = "okay";
>>   };
>> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts
>> index 2fb1cb1f7d8f..c304fa20c1c9 100644
>> --- a/arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts
>> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts
>> @@ -90,6 +90,21 @@
>>   	};
>>   };
>>   
>> +&qspi {
>> +	status = "okay";
>> +
>> +	qflash0: flash@0 {
>> +		compatible = "spansion,m25p80", "jedec,spi-nor";
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		m25p,fast-read;
>> +		spi-max-frequency = <20000000>;
>> +		spi-rx-bus-width = <4>;
>> +		spi-tx-bus-width = <4>;
>> +		reg = <0>;
>> +	};
>> +};
>> +
>>   &duart0 {
>>   	status = "okay";
>>   };
>> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts
>> index 5edb1e137a52..6017e9cfe40a 100644
>> --- a/arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts
>> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-rdb.dts
>> @@ -38,3 +38,18 @@
>>   &sata {
>>   	status = "okay";
>>   };
>> +
>> +&qspi {
>> +	status = "okay";
>> +
>> +	qflash0: flash@0  {
>> +		compatible = "spansion,m25p80", "jedec,spi-nor";
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		m25p,fast-read;
>> +		spi-max-frequency = <20000000>;
>> +		spi-rx-bus-width = <4>;
>> +		spi-tx-bus-width = <4>;
>> +		reg = <0>;
>> +	};
>> +};
>> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
>> index ec6257a5b251..268268c6a149 100644
>> --- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
>> @@ -350,6 +350,21 @@
>>   			status = "disabled";
>>   		};
>>   
>> +		qspi: spi@1550000 {
> 
> Please sort node with unit-address in that address.  That said, it
> should go before esdhc@1560000.
> 
>> +			compatible = "fsl,ls1021a-qspi", "fsl,ls1012a-qspi";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0x0 0x1550000 0x0 0x10000>,
>> +				<0x0 0x40000000 0x0 0x10000000>;
>> +			reg-names = "QuadSPI", "QuadSPI-memory";
>> +			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
>> +			clock-names = "qspi_en", "qspi";
>> +			clocks = <&clockgen 4 1>, <&clockgen 4 1>;
>> +			big-endian;
>> +			fsl,qspi-has-second-chip;
> 
> Undocumented property?

Both properties, "fsl,qspi-has-second-chip" and "big-endian" are deprecated.

See: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=78df30808961cd32f0517c7469886386b0680852
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
