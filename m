Return-Path: <SRS0=7+w2=BB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C55CC433E5
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 17:04:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1270207CD
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 17:04:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w74YVTvl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="LF6B6kRl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="fj5FTlN0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1270207CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wIqBKTd/JqQot084sXvO7CNHny/G5fgviC/AxLLzmg0=; b=w74YVTvlGaeqPdt0V3gT0IYqW
	kQG61jQ+jF4yw9zN18NtJV+f9ZY8ezu7Pa8MzT/LmiEmpFG3Ueqnpzg0XrBcRvf/3Zqs78ZkoVpZs
	j8i4CJDHy/NQXYrrx/cxzoAX29u8ZlwqeVQaYTx/Htl4XybLLqgptodexduayyIR6luABYn91Ney9
	V5XiiuaxrgoK9nJ7nsnDf8lpp9z1sIUaRswHwSJYY4kaHkt1EbkTJu9MJ2NFvj8Aob0oGbbly0EnK
	8+Mew31ts8DF4ZtofePVXviVhHDmXWeRvF5su+w4vq3BbN512gNESPe5wepbwcboFySnrsyKYjfQH
	okJ/VNnng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyI9b-0005RV-7G; Wed, 22 Jul 2020 17:03:39 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyI9Z-0005Qj-5d
 for linux-mtd@lists.infradead.org; Wed, 22 Jul 2020 17:03:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1595437417; x=1626973417;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=B7CAeF1WEBbFoztntOaniu2dd+J1CmpwQ7M9cxbhOb8=;
 b=LF6B6kRlfCbMmKjMMhE8Gy1EeuGliEwrrwiwc1XPPOL3FD1zJtZD/hwT
 gjVoIn8exBOYSu49N7JzdgE0mH4KAo+wDJttMPX8g7EUvWmCsgk8Oxe//
 LgRbTsWLFf65+CyZ3INu78klo1qS+W8p8MFt/aQUVZhaZh0UyZ38poGZg
 dTf96hYVkDfOQaBEwI72m7/gchhJLjngfIc5jT6n+WpTQW1sRJMPC335g
 k4gNidufRhDBLUMpUQE/AhlgMZlJL4s1UOBsfhvA2CRe3/X+xaDGQYurb
 2bnDvmGyRUenyBY4HcEFu+Ckelsfnw4Il41y/e/iJjMBORph+EIQNrn9m g==;
IronPort-SDR: 2lyGhiPUosLt5urtgZxV0B16aIDuX88zTM2tWxLVjiwuZqNJQSu+AywD1OkmZggx9n548UFOOJ
 BJ0t1sZdATxZLdHCsWmi2iEW3yBHoD4bfD2g6JbgtH6ya7FQpctWqo3nCqEw11BgksyAwYBPYm
 HCWFWCpuepMB+5ytfhVZ7RNs1NL+n36dcUlITfXaSHDliqiKfFjfL3106hCEwoydtuRDfDPEdo
 fTXerz3V3okoqiVh8BZGMVon5yY+Xqdgst4npt69tgt997gmt89NZ/OWn8+MM2FAfLHp6zyGeh
 49A=
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; d="scan'208";a="80930555"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Jul 2020 10:03:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 22 Jul 2020 10:03:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 22 Jul 2020 10:02:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJ+yJpUPYJ97+FK/ox8lLHNJFBD9UoeHM4D28MHt6UO2ZQFC+o8H4nutFn4o22FZXmOWKF4vllnO6vTOypZZW83LiLt4Fk1ftZdzRI7QRqIVriY45FVCt8zNwQlLrx0H4H6jOA20G9/LCkYIEYc+vfU0iSr40fFjSxguOsxVrd3tzvpT9u57Aqgkt2SXoKh7mtRFmgiHZTZUn75pTejKdKZ6pCJzJwww8ZahHbqYK7tXnSIf21S8Mm47CQsSeMeUe7bUCTNIZMTAO5rIJsUMH95fhGpcBujzAPqfwgeiQKkvcc08aB4zP7PL0WIVgVmcKvJ+lYzMTflIODWIdVG/YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7CAeF1WEBbFoztntOaniu2dd+J1CmpwQ7M9cxbhOb8=;
 b=B+2Monr4plgR9ZoNBqSvSFHvXIplspu0AM4u53l/kRwVr5WxV/4Ka1ImrcaiMgS1Z8xO++/joNmhj1fyKiU09OK1FVdVqkKrgkQU8DNu80qDUG0cHznMPNj/3DrzfbJWT71Tjb9+qCMWBdJdrOe6XK+K44Z2L6AEYhKVB4UaQ2dWiyWn3Ys/Qg/FH5Kh1zhJGyAoNyEQfCxdnLxPRIZlBL0g9wzCiIBb4/bCGhX6Vo14/zlz+PFx4sCeOMYVO0NhdfkJ+DPETThCLGqBI7ALX9JDK7CebX+fc+lFCNtxWfvFwO3xSdlYJ7LWB63mUP/0D7zpflK+OlayI9GYz18blw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7CAeF1WEBbFoztntOaniu2dd+J1CmpwQ7M9cxbhOb8=;
 b=fj5FTlN0O02sVdgEn+LTyvbVV/Ft3Zxkz+8b7HrKm0FPyg7elW4TXrngb4bueYthd3/K4dpZdkzCuQpcMx7c22NO1iBYluEwGXDgJPAChiqAmwZSHLnmMs5IludUbbaZcSgrUNJf6kHBQAx2CN2I8oP06PwzC0f0jmeZbRElYso=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB2741.namprd11.prod.outlook.com (2603:10b6:a02:bf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Wed, 22 Jul
 2020 17:03:32 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::7424:cb9d:3c63:5181]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::7424:cb9d:3c63:5181%7]) with mapi id 15.20.3216.022; Wed, 22 Jul 2020
 17:03:32 +0000
From: <Tudor.Ambarus@microchip.com>
To: <alexander.sverdlin@nokia.com>, <luisalberto@google.com>
Subject: Re: [PATCH] mtd: revert "spi-nor: intel: provide a range for
 poll_timout"
Thread-Topic: [PATCH] mtd: revert "spi-nor: intel: provide a range for
 poll_timout"
Thread-Index: AQHWYEoGCAqTB2Up30yP+LHzC/Sy+w==
Date: Wed, 22 Jul 2020 17:03:32 +0000
Message-ID: <df774dcb-edd1-ae7a-0e26-2e7c324406ff@microchip.com>
References: <20200610224652.64336-1-luisalberto@google.com>
 <40ef3da0-56f4-3c78-f875-a750afaf2ec5@nokia.com>
In-Reply-To: <40ef3da0-56f4-3c78-f875-a750afaf2ec5@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: nokia.com; dkim=none (message not signed)
 header.d=none;nokia.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.183]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 971a7bdb-1fdd-44d3-6842-08d82e6129e2
x-ms-traffictypediagnostic: BYAPR11MB2741:
x-microsoft-antispam-prvs: <BYAPR11MB274109645EC69F3AFABD534CF0790@BYAPR11MB2741.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7kr/UyWc2hDxS9afRSjiM4wciwepAYogq7bd+AJ+uLpZH6skRraJ7FKFkgo+PLp5X/f+NNv8YeHj/8H8XXaU/i/r84OVS5iHuX0G4yG8UWjkfADXsUa1IzHuLY5bZG+lkfs2X9rZFTL1IR1GPcblEgHoN3BE9ZwiuLYro09vnthHmV83exa5IRNriG5/UXChytKnL2bhu3pgeCVCwNGroMt8iAvk3CkVp5Hf96WiDHSSL4LQLj2/dWFcs8/ij94/5pk23KAj71GPiPLX972LKXoIYtSs0Zg1KGBr2ZGdxAlqLo+RMr6okMrID4yR6L7CBIhhEQccTmPCC/tT00vJzivfabnySqbwhjN1HTVDgHlWa2CmpLPdp6GZphE4P4GxiRjwlzE8oAdmP2cZtlVhbg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(136003)(376002)(346002)(366004)(396003)(110136005)(71200400001)(31696002)(8936002)(316002)(8676002)(4326008)(6512007)(296002)(2906002)(54906003)(6486002)(7416002)(186003)(86362001)(6506007)(53546011)(26005)(31686004)(478600001)(83380400001)(64756008)(66556008)(66476007)(76116006)(66946007)(91956017)(5660300002)(66446008)(2616005)(36756003)(21314003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: fAyQZvCHPleIUEErzQz/ZQt69oYOfKJkW0mjJuZHl6RCwTDXwfchs2t0ghXQNvSRTfhoL573pqsPxvzh5RpY++m7b6J+JbCW9hyo8SPABagtCK+MKaab0fPqAhRGaS/uD8Jnque7gaUb9UOzz6PQf/AB7t0xj2aLcNNIL7hawLwOlzLMCMkw3iAn5isvhiOUAsDTBqAOokN9DAqUwtmnSKEYPH5Q8mGEqSceO2I+swUi2COqJkz2I+dwLxlOf//SUS3o4X7uWTVtBU+gj/TL8h493WkhdXtPZDEVdbsdtPjNFn7AV8S8Tj915898v2q//pJftKMVOBCpJC1rY1B1xeohHVBRHLyaQxyyEA06tDYX060OEroGlKnFvMVVoQm7Fvik9lf5A1gOP+g6YXRCtTvpGm/KNJl3Rzo5y2pEpvXfqLKcxG55qMr089ZhrjICNOmrnRmIilmG+gkMak8c2acOekafnBqNcvR6YHxneXQ4yyA2ZFCSSLthjZYPZ1Bk
x-ms-exchange-transport-forked: True
Content-ID: <0C3580F987ED9B42A9AB149179A1CCB6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 971a7bdb-1fdd-44d3-6842-08d82e6129e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 17:03:32.1164 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rmaJFo4UnVyhvzbcqq2Bqu0Q2yxt+ced3mJqBTns4cqTnmeEh420kSxIMRLYnG1nbfMGyQP7y0UgvgnSK+bQxVWPpr71ChTxfI5rwfSx/s4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2741
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_130337_561984_317542D2 
X-CRM114-Status: GOOD (  21.05  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, bbrezillon@kernel.org, richard@nod.at, jethro@fortanix.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, mika.westerberg@linux.intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Alexander,

On 7/22/20 7:37 PM, Alexander Sverdlin wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hello Luis,
> 
> thank you for the patch!
> 
> On 11/06/2020 00:46, Luis Alberto Herrera wrote:
>> This change reverts aba3a882a178: "mtd: spi-nor: intel: provide a range
>> for poll_timout". That change introduces a performance regression when
>> reading sequentially from flash. Logging calls to intel_spi_read without
>> this change we get:
>>
>> Start MTD read
>> [   20.045527] intel_spi_read(from=1800000, len=400000)
>> [   20.045527] intel_spi_read(from=1800000, len=400000)
>> [  282.199274] intel_spi_read(from=1c00000, len=400000)
>> [  282.199274] intel_spi_read(from=1c00000, len=400000)
>> [  544.351528] intel_spi_read(from=2000000, len=400000)
>> [  544.351528] intel_spi_read(from=2000000, len=400000)
>> End MTD read
>>
>> With this change:
>>
>> Start MTD read
>> [   21.942922] intel_spi_read(from=1c00000, len=400000)
>> [   21.942922] intel_spi_read(from=1c00000, len=400000)
>> [   23.784058] intel_spi_read(from=2000000, len=400000)
>> [   23.784058] intel_spi_read(from=2000000, len=400000)
>> [   25.625006] intel_spi_read(from=2400000, len=400000)
>> [   25.625006] intel_spi_read(from=2400000, len=400000)
>> End MTD read
> 
> I've performed my testing as well and got the following results:
> 
> Vanilla Linux 4.9 (i.e. before the introduction of the offending
> patch):
> 
> dd if=/dev/flash/by-name/XXX of=/dev/null bs=4k
> 1280+0 records in
> 1280+0 records out
> 5242880 bytes (5.2 MB, 5.0 MiB) copied, 3.91981 s, 1.3 MB/s
> 
> Vanilla 4.19 (i.e. with offending patch):
> 
> dd if=/dev/flash/by-name/XXX of=/dev/null bs=4k
> 1280+0 records in
> 1280+0 records out
> 5242880 bytes (5.2 MB, 5.0 MiB) copied, 6.70891 s, 781 kB/s
> 
> 4.19 + revert:
> 
> dd if=/dev/flash/by-name/XXX of=/dev/null bs=4k
> 1280+0 records in
> 1280+0 records out
> 5242880 bytes (5.2 MB, 5.0 MiB) copied, 3.90503 s, 1.3 MB/s
> 
> Therefore it looks good from my PoV:
> 
> Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> 
>> Signed-off-by: Luis Alberto Herrera <luisalberto@google.com>
>> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>> ---
>>  drivers/mtd/spi-nor/controllers/intel-spi.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
>> index 61d2a0ad2131..2b89361a0d3a 100644
>> --- a/drivers/mtd/spi-nor/controllers/intel-spi.c
>> +++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
>> @@ -292,7 +292,7 @@ static int intel_spi_wait_hw_busy(struct intel_spi *ispi)
>>       u32 val;
>>
>>       return readl_poll_timeout(ispi->base + HSFSTS_CTL, val,
>> -                               !(val & HSFSTS_CTL_SCIP), 40,>> +                               !(val & HSFSTS_CTL_SCIP), 0,

would you put 10 us here
>>                                 INTEL_SPI_TIMEOUT * 1000);
>>  }
>>
>> @@ -301,7 +301,7 @@ static int intel_spi_wait_sw_busy(struct intel_spi *ispi)
>>       u32 val;
>>
>>       return readl_poll_timeout(ispi->sregs + SSFSTS_CTL, val,
>> -                               !(val & SSFSTS_CTL_SCIP), 40,
>> +                               !(val & SSFSTS_CTL_SCIP), 0,

also here, and re-do a test? I'm curios if the performance will be
as it was before.

Thanks!

>>                                 INTEL_SPI_TIMEOUT * 1000);
>>  }
>>
>>
> 
> --
> Best regards,
> Alexander Sverdlin.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
