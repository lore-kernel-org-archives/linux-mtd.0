Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0D5C433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Nov 2022 08:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZyr3S7Pk7odSXv9585bHUMhACkeu5LXUCbijqRm9tI=; b=eEE3XKQUxpKOAD
	7o/i1r3ev8byvjMfl4f6hNxr+0lTLBHEAyRVZGslsfRamp65LYEI3OmqqkuypdnMhLTm0u9bpFvKJ
	zdqBYcHTX96p31v6/y/EiE98kdB3Z81iqQam1QLrKEgm21ABMYjuYCqXSsenURzZ7gro9ACVjh0GC
	qqiyDrUoH2d46w9XSeWDf1EEakEr+bdOzBatIRG3zhnARePhPudqMXewbr/bWVyEZH5vmCi1+3s5v
	DB74j4yqIZqXnV4x7BRkcmbUg4w3y0Mk5lESD4/E4YymFvjSIHFxL2xtvtV3stGFaq8KkdSErZRvC
	LWFcEmtJHvIA5gPUPk9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opmvJ-003H4o-Gc; Tue, 01 Nov 2022 08:47:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opmvG-003H1x-9N
	for linux-mtd@lists.infradead.org; Tue, 01 Nov 2022 08:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1667292423; x=1698828423;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=D1nXM2ackreGhsCv0J7aa5GQWcE1yjB1Oj3hZjeHdPc=;
  b=PxYRrInKtZ80dYO2DOlbaHgAZ5BnlPVqLKsU15kBjRSNtfPql8j+StED
   gJbYhBAN5gN0OzhcfYn1sPDuPCiWR24uU0XV3Xnpb4XK2QUngDU4ki0xf
   pQcFGTTuydl/7hNYEQ++oIA0SIf/lR9dPpWp1tAZYux3RHS06oajKLFDX
   PwI2V4TuYU2tu553pnnrPm0VKfTdvN1sdb3FMRafvcRZQeBjVqCVIrjhv
   rT5Iyx77870gMOjJB0P0T95w15236DdDtsRcdik17CdGxnIR72iRtHXG+
   QkAY/3OeAr/jzHyRsf18VYIperG1+pDVvXLmq8ztCrhxBodSnRfilt/W1
   Q==;
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; 
   d="scan'208";a="181378759"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Nov 2022 01:46:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 1 Nov 2022 01:46:52 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 1 Nov 2022 01:46:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QwlckPuCVLgluvxn8iBnIfoBNenOv0hpSsvhUVFDrln/9Pokrjjyjot7M7Jd9N+TpFMwFzom3fhL5CHbnGWtHwP/a9k6LFrCHesCb3ubVmh16Zs0ndiywhqYieRGbAKn7UsnLLYKcm3TN+ypLAVG/l7E29jv52X5HRXyCGxGFAX16GYaTUHTCDp/TxNjPw5wnGVDGbG8DlZOZL0hrPkE5n+MylbWghs+FtL7PYWtDUDPUQdCai7rwTvLDDwZrenLQ1UJaAZ6r5vXRtbwyUWzHgAiEFXTnPzmHFb4CG6unM+uLoGVJ41lngyiGI+rKvGpywEBY0q5Z94ABgliDRvV8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1nXM2ackreGhsCv0J7aa5GQWcE1yjB1Oj3hZjeHdPc=;
 b=LSAfzolktUliy5g68Mz51a+vR7EJCQ8eEJ36tMlELaf76HbQpATJsj1a0UpXHetBXWMPWR3doFeOq4+Pwy10jFRUZJrzhkDvPG+xW7n4dsQe35oiJyuKB/Q+aFVZ6lFFTB8euGvi8oyipaWRe9e6/dJFFGvKCIYiiS+xSvDCWRvTX7GRoxTNt+R93R5FzVH0rouxRaGRzBV3bwSX5bFEn7+eBG14Dk2sU9w307x943xU1dZIwAmHvYZbAnDzGtiucZeGXoH7wYTp8ITkWjz28Nh9oGZgZb12+YRePb9ztKX54+7Z7p36Zpsie3u9oUEoxwo2lTRYTN9CVFTMh1RK5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1nXM2ackreGhsCv0J7aa5GQWcE1yjB1Oj3hZjeHdPc=;
 b=Ql8PRAZMiHj7eSjYZk984ruWXIfGPD1ub+PmHs8I4XtLkeAdBn91D9LFI3eTHonGMVi5Ohf67U1j2jrkqO+waZNNrj/sILQpbAQakt/DZ1Co3MAva6OsLziAAN7canTldQvXczHUlcJnz+yf4/Gb5RvGtOYfc2fTLd9o3+t+lfM=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 PH7PR11MB7477.namprd11.prod.outlook.com (2603:10b6:510:279::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Tue, 1 Nov
 2022 08:46:51 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::cf13:1785:f79d:9eb9]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::cf13:1785:f79d:9eb9%8]) with mapi id 15.20.5769.016; Tue, 1 Nov 2022
 08:46:50 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <pratyush@kernel.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v2 6/7] mtd: spi-nor: add generic flash driver
Thread-Topic: [PATCH v2 6/7] mtd: spi-nor: add generic flash driver
Thread-Index: AQHY7c58iDTi1a3iJE2+xt2R4rtYtg==
Date: Tue, 1 Nov 2022 08:46:50 +0000
Message-ID: <848f22da-7f1b-ae93-99d3-65a5f31cb122@microchip.com>
References: <20220810220654.1297699-1-michael@walle.cc>
 <20220810220654.1297699-7-michael@walle.cc>
In-Reply-To: <20220810220654.1297699-7-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6479:EE_|PH7PR11MB7477:EE_
x-ms-office365-filtering-correlation-id: 8513d260-7f3b-4e18-3bc0-08dabbe59e94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LZoRZHK7CFnJ5khy8qmMxOpFAaoeFUt3Tg83sjY1ikd96Xeq74rGpixNqXG45TJ3mY+Nx2iWvnBLLiYthqSAxEPl3BOtFi+BIk+zr51SOmhKP61JNJhsaWORjcl69rGB/xKYtj6LwJf7dLHgM4LHYMmR2Fn64pSOYJ+gABykfIrOjDKSYk+h4xiAILEfOQbXkVt3lVcsPyVAUyOm79EtZRvtjbLHPMJw3fxBc7igv+AIYxcLrNIcqfC3R1Vni8oUCnH+AWd8FWMjltJGP7j3ReCsz0/9UFXK4cRuol1C7tLXPhD9rajTtBzi8CcQShmK69dnPM8lVPbg/wl78LTbLaMHtdo8HtJRV2d+vGzi52RythDucNWlGr2jhZ8dYH7gXpZXT/sqFzTqeDdB47xKhzCfWg8CSl1ZcuJPbWunShdBHOIr0Zv8/slSPPlbEEfuZN6wy58FT3V0Ga4UIqU9S/N3mnyGKtpSgxeAJym3vDvuWntJepZJyP/ChYArzUh8gPOM0QQ9NYg+ADlfTSKyjAZBD4NfIfsIF7l1m6vBUzk6nKra5o16/lza/Fk2AkstQby1Q56M9oFCNTV5mx1Mq0Iby2Sivzkjm7Q4cH7bqT1+rGxkc5cWA9yMeoyt4TIfIqZhStOVA+/6v6h92vAON0OGupy0dXHAi3QVMsxNt7eLyWjtg2r3ZDKtL8zokTrnu2ajHnnNEn/6l1Ppog+6exIFkr8dcOgjHjoGHYalDA5xICpxUmiQAWCf5xc1NQutvdEnPMv3boKWhMhHg4CbGg47PEjHHQqit5qD2DDyXAupluBiS6R7Lm8v8mJyt4s9mcJtfJFSjVPFqO3OjG6cXw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(396003)(39860400002)(376002)(366004)(451199015)(66446008)(38070700005)(38100700002)(478600001)(110136005)(86362001)(31696002)(54906003)(316002)(6506007)(36756003)(4326008)(53546011)(66556008)(66476007)(91956017)(71200400001)(66946007)(8676002)(76116006)(8936002)(64756008)(31686004)(4744005)(186003)(5660300002)(2616005)(2906002)(26005)(122000001)(6512007)(41300700001)(6486002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjh2VUp3bnVhcnNacmRCMDVkY2VGTFk3YmsxazZtVnRnSjRROWlaZUFoUEZB?=
 =?utf-8?B?Y1d4cHRvNHQvQ0hNZUF0THB1VXZ2dDBRUmI3U2w4Y1IrdzU2Z2dEVVRGanF1?=
 =?utf-8?B?UDNydmVZYW44NUZ3aEF2ZWtSRWcwaUpsNEp6ZWFoME5hZWFhaE54WVBXUUR0?=
 =?utf-8?B?RUtqUGFyWVlXUVc0MTVzeU1VbzJGTHNiRFZYOElMLzVDRkJybHpkd2lsemt3?=
 =?utf-8?B?dElOQmFLNnZhT0Y1bFZqS2o0TXRnUWI3TldKS2dpZUttVXRDVEowR0FNZisz?=
 =?utf-8?B?Ky8vc1RRcDVURnBneElxVlBrRWdCbStBOGo3Z3h5ZHdrTTQ4SndZNHJBb3U1?=
 =?utf-8?B?OHVySUdSSlFUK1dnT3Jmdk0rVE1XaStKa21ybytjNXpCcVNIN0JjR2NrQVNl?=
 =?utf-8?B?RXE4QUZJZ1VwVmh1anplT2tZcENTL29rZUdrQkUzVVAvVTlmaFlTaEx1bEkr?=
 =?utf-8?B?N0wxTlMvNXFpZ0FEd3ZyeHNPbU9Uai9NMjJyK1VWTTkwc1lhMG8xMUZsK2pm?=
 =?utf-8?B?MkRZMlB3c0dLTmZUSVhOdFE1dm5kMy8zMlVSSXdPUFhsL0UxVldVODdOVW5E?=
 =?utf-8?B?QlduaEMvTURsdmwxRVlwREY1K3ltWG4zTitpelFYemhjRUI1VTdlT2NLV2VT?=
 =?utf-8?B?SXpSVVZXbWltdUFzeERNS1MyWmY1cHp4dVd2VGV3NlduY3ZjeVkxNGI3SGNR?=
 =?utf-8?B?VitZUTJ6dDN0UnhCTnVuRGRHQlB5RVFXTTdYNlplS2pZanNQck1rVjA3Yjha?=
 =?utf-8?B?NEZWZThCZ0hqTlc3YUZ1bHdlNm9qT1dKSmdMVGRqUDhaVDg1OENxS2FjbU5L?=
 =?utf-8?B?WGlyQ1J1c2UwajBDTVFUa1Y4OTdvYTI1M3NVRHZXTzZ5Tk83RmRCOGpXVTRZ?=
 =?utf-8?B?SGU0N2ZiN2RJODJBNm4zQ2E0aUpEcDlWaWQyY2tFd0E5ZVlFZzUxS2dQNHVC?=
 =?utf-8?B?WjBKQnVOc2JGbXExd2RrS0ttYnAxTEtNR0l6SGtzMVdzVkdjWXdtY3lyb3JS?=
 =?utf-8?B?V3I1SkdheXRuK214M3lpK0V2eS9RUm9nZnFhdmQvUXg5VE1iWHNFZkJBSTA3?=
 =?utf-8?B?R3FLc2FVRlB6WWQ3SUk3c0tKRDErbHMvL0ZvTkozeDBoUXMzUlhNOUxma2p6?=
 =?utf-8?B?QjdFUkxmMXZOZGNYMXVjeFpMUGx3T2o4NHJHVTZxSytaSHJNKzNPRXRkbDR5?=
 =?utf-8?B?RjlIcGsraEYya3NlOVgwT2JXcDhjWkVZNCtOVExnUVJ1N0tqYk5SaHF2Z1BN?=
 =?utf-8?B?dUhIK2dtc0NpaTJvc3hnOFo1M3lEOVZjdGN1cXJqSXVSOUVJeFREOExsNWFr?=
 =?utf-8?B?TkJLNFE3VXd5SkxWSjNQNEpyS1c2a1R6VVpydXpOYVBBaFhXNnJyVUZDczNE?=
 =?utf-8?B?SHVDZDdGRW1wWTZ2Q016UEtRTzNxdWxFYlkvL1FBdkFYbjZJcGNwUlBCbk1S?=
 =?utf-8?B?UzR3UXlaUDUwcUlXbElDaXRQc2JmZHArQkFCUUtmYU10M2d3NUk5TUgrWDNq?=
 =?utf-8?B?V01zTnV6M0E0Z1dNL1hNRSszWHg2cllrZkI4UzI3UEhsZHlpMUZwa2o1UzMx?=
 =?utf-8?B?U3R0WXFFYVNMcW9USmtvdE55UTN1UHFUcFUzSkN4V2ZQZkQrZlc3MXFraDNt?=
 =?utf-8?B?NmdsYzVRRSt1QzlVYTNLcWswYTM3Q1Z6N1lvK0VZYU9acElZTUxrNFJZRWw4?=
 =?utf-8?B?NHBPd01ndDVSQUZHUjZiK1pybS9RQ0grTk9NaVNHK2lRNnZmTnFWK1RodG45?=
 =?utf-8?B?SHVrcC81TWVKQnBTVzlURTVLQjZqY1NrSTN3amhTb2lXekRFb0o0aGtBYUo0?=
 =?utf-8?B?MStKb3A0WnNQcC8vVXdQaUpUbEJCQmM2T2ZERGNmeUIrcUpTRUg4bHFMa0FM?=
 =?utf-8?B?bFRNU3JHRXFES09JM1Y0TGUyL2R5M253d1pkMFBsRyswU09EcFArSDVPWHp4?=
 =?utf-8?B?aHgwR1dJVmpsYm5yL3pGVGRuaG1kMGlXQUpMTkFWa1I1TVpCS2lOYy9sQzdS?=
 =?utf-8?B?WjMrSXJmT3BoWWk1anVJSkZEb0lGRitXbUZCdkdkYWVTcVJFSFY4SmFVbGl2?=
 =?utf-8?B?cUJaaUFCY20xTU5LbjcxcFBKMFEvWitaWEJ4U1RhM2V5bm5UM3RhSTd0UEs0?=
 =?utf-8?B?aitnYVNEL2VjUkY3NjBUbGFlRjBucitObWpKZjRxdVV0UDlFc3NYK3lKbDY3?=
 =?utf-8?B?WHc9PQ==?=
Content-ID: <B8069E48248C4A4DBBDB4D8E4E99B997@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8513d260-7f3b-4e18-3bc0-08dabbe59e94
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2022 08:46:50.8454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kpley7IN64K2RcNYV6xxv7LvMHY0sybukoF8X9dR1dm7Rpzm8xb5GBF90toxkiMZBHb8fVwZomCUonuIuc4gqBDbOJ2NYUnIBEXOS8F2l0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7477
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_014702_544902_5DACE76F 
X-CRM114-Status: GOOD (  10.04  )
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

On 8/11/22 01:06, Michael Walle wrote:
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1632,6 +1632,16 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
>         &spi_nor_xmc,
>  };
> 
> +static const struct flash_info spi_nor_generic_flash = {
> +       .name = "spi-nor-generic",

How about "jedec,spi-nor" instead? The series looks good, I intend to test it
and apply it soon.

-- 
Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
