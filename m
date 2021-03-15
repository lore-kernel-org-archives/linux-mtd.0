Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 803F4C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 06:10:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB20664E37
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 06:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB20664E37
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Jg/cJX767h7hqwU4+ofwAH6FjDlEXRSjbkkkthzw3bE=; b=ZizbBMIv3aDNWM8LQitr4llyB
	VVonS4/fSx+e2mR2l6/6Nwg0YU4K48p0EDfLqxuj04DULCYJusNslRZpYBCBjqhCVhSbSFTCu98yc
	NgeT9ED0RGJpH+LdClmeK9A2LG4GdfjwvfFuxzbUf0VaBSCzXkEezg3EDW7HPMCnNGW5lJ7aYsUnh
	PHRzHk2pPiK1LixswB7kDU93gUyZ2q/IPczG7H8tmfwnM3PEEvJXIqzB4LbFo+tQIMDCRBysYHo08
	4EnkAv4FeP2m2OfG0mCR4vxSeXw//tUT6HJZosCEsGUTdoec9Aq5s/EvBemQmbQWyOa6qjASENIjw
	bfOVTPICQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLgQH-00F0or-TM; Mon, 15 Mar 2021 06:09:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLgPt-00F0kd-ON
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 06:09:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615788566; x=1647324566;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=eDdsEbYqxshSJdpCVeVNa34c6hkg+QtuDkEoCYnZqRc=;
 b=OWOg2dAu/WH9awlEZTKh7MfudzHZ4yd+x0ry2REkDjexNzGMoag7SG8B
 eYB8SMfx7mJprKRm6Y+aExncrnnYxYWP1UbK/hcrhg815OxbIHYpJ+lKm
 FxEF1r6G+k7wwqA2bZV3q0n8pDiOVAcrbkLF54UsiEQopZvAv6uPU9bhl
 6p8XNUKtNhXOyWiXjk+W3TZXOlM2mDC/CufR97KJQi1CXeLpR53SjiYrQ
 jb2YQy02ipMuKv8zpLveMuatKrOj6q8yeAQdoRvL03URdUG5a2NcnL/Pw
 6QznIXPiBX4jbxNEoukpOiL2WhgIJdU/rNNdJpb4kYR3kVCx/TRiZ/2wj w==;
IronPort-SDR: onA0U5DJ20QFdnhTDm0tOZHIIAYM+ENshTsJyQ6TlGgdkqJOgeH+Q5UBNRIK22dqg729kRzrh5
 yJA2Kk9Kf+0bQRqpOelP59YjBUtW5GAWF4pUA6+fjqkinpQYBQSnEtmKvW4uL7cskElsQHcd0z
 Q3nwqEANxvL4njY0wOnCpEyv+Mj9r3CxKo8txM95pYKyQ6KV462H+ueUdxN2Jcay+My+C2wbSA
 NZ3VcYQacdI88ngzJQBbep5r/RdgNmKFNjrEY9d+gcaIPShMLz3TN1AP1aNpHq6mN6AZRrNB2f
 GbY=
X-IronPort-AV: E=Sophos;i="5.81,249,1610434800"; d="scan'208";a="109970469"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Mar 2021 23:09:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 14 Mar 2021 23:09:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Sun, 14 Mar 2021 23:09:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbOTQ2DZ3D0S5ZV+eyMTFR9E7gKqCz2w3ecLiiU+qbgBCRqkgiTCFTVqnltSz2OwTwGMKXqaYvLBhplqndQCK8VJLulxhhAKu4WeDIcyoAhCSMYls8Z3lB/dXDUjmzpLhj6fFQCFcudJuyUqZs4XL+fNl6FjhAY4MTjK7c+fjYLa7hfEVEG/FQbICInXTcis7wai3zK9KdqVGpnfI1k5qMiX2vkV9Qzzyl7Ot6PI8wT/FepZVzRn2E+WC8KahUoc1sgUKHwYfp06c9NIjZ4hhFnaSDIc7Dt6gAPeexh5Se3L0S19G3IGzWsVpZHsl0SBkCx8KSx2V6nWyV0ZB3m2Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDdsEbYqxshSJdpCVeVNa34c6hkg+QtuDkEoCYnZqRc=;
 b=I/HG9W/pRByRsONEYOPernPNTrQ5bTkRLD5GWSrAzfuoCdxo9r+p5s0EiG3MATZDehPRBvcLu9orSuCw+cACWpY4RvnPB5JuqT3qTDCuceFl0yqTToQfSkJP4g93/Nl8zPEZTLh1VUlvjr9Ny1heEI7HIS18pQct4Opz55CiJ2ifGNhx+ZaTUEH/1DXJIS2BzobijdYF2OVhDW7dnb8CGmk3tuYIkyqfU+BKNr7SC8ZC8aDwuvghiVFNiegMgvxgK/FLNdSALp37ALbzvRR2xiqaB2JeWQPSp2iHMmv9AFkm1k1TLGoHxbYVsUxtTOCuB0sOzQpTsMirY+TfOBvEXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDdsEbYqxshSJdpCVeVNa34c6hkg+QtuDkEoCYnZqRc=;
 b=dVvpgyr7C2wf4ixxVfSbnmQu76n5Bq+TxS1XG9sZ/Gx7JJT39boXZCeDRYC/Z4t1UWO1WUo2F91wG/uam1GQATxDXsjJsJI5BTpojq3e6nmaRgdDwTxAIAv72M2A4TwBddAWI1jUuvPsPEiktVGF5fuhXv6lPlOhajYeIVyPHZI=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2575.namprd11.prod.outlook.com (2603:10b6:805:57::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 06:09:20 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 06:09:20 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
CC: <vigneshr@ti.com>, <p.yadav@ti.com>, <linux-mtd@lists.infradead.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] mtd: spi-nor: Move Software Write Protection logic
 out of the core
Thread-Topic: [PATCH v2 4/5] mtd: spi-nor: Move Software Write Protection
 logic out of the core
Thread-Index: AQHXGWG8hW+TwdBlzkur1VDkcdYBtg==
Date: Mon, 15 Mar 2021 06:09:20 +0000
Message-ID: <65691b2a-134d-b1f2-617e-5ef09df9a742@microchip.com>
References: <20210306095002.22983-1-tudor.ambarus@microchip.com>
 <20210306095002.22983-5-tudor.ambarus@microchip.com>
 <7fb8af561eda06444ee0e0c592147af7@walle.cc>
In-Reply-To: <7fb8af561eda06444ee0e0c592147af7@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.37]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a78c44b-9b72-40ca-e744-08d8e778dfac
x-ms-traffictypediagnostic: SN6PR11MB2575:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2575B6D5AC0D15881A736CF0F06C9@SN6PR11MB2575.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wv/VNaOztahHmoOo0RX5YHeW8vCDCAUWTMjTnCG5yGa0q1LKV4J/err/9CWZxxe+aNYXpmCmdncRVw6kHj2yo+U/Y0Ap5tI/12QnPz7w3ACP7tRC/4w7wCskRSL1KK9Hm3MEP8OkTaWZE8SxwCcOH/c7191OkriReKH0rc//Iypet3VDsNUYbxHfyZvBMMtCO0hJds4OHpsZCnuoG8BennYfDYbjeSHDGz0L0pZQcJh3wwv605ad7l3G7TWxbbWhUvJJZWhf0k+gM5wFDddJ6jL93Twl0+5kXpkes44/xl3RdkK/Bz5e4Bwyfl/5WcJjlCeKCf/HTRBh1gjuQjMbZ2tuwfaQssrXhJIkkGbi/CWrMolUM/sBGbxTtSZJ7B/KfTy1XGGXg2mW2QKcM3MRFqi8ROD144uFCcaGinTnJ569CzMhplnBoEtUrdP1x5Wg7S+LhyUVTzkoFxjHhCnHE29aefM9MOMkw5Lxz+IA0T+abn6dmTLt8tUXpS6zriDWGHpeTXHUmcxB33BRkl61QRqMZgOV/FHs/xr22SErZ/meS3lS8nwVUzqH9bQklmF7RhCsy9gjIrWuJqvaMrsz2v6Lhwx1dtbxgCqYIQY1/rDMvNt5JzGUXYwhLfOM8dIZs3uR7TC3f7yHXingUrfLXw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(346002)(396003)(39860400002)(376002)(2616005)(186003)(26005)(71200400001)(31686004)(91956017)(83380400001)(66476007)(5660300002)(6512007)(8676002)(66446008)(2906002)(6916009)(478600001)(31696002)(66556008)(64756008)(86362001)(76116006)(316002)(54906003)(36756003)(6506007)(53546011)(6486002)(4326008)(8936002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?akI3Y3M5Tjd5SGNUaE9QT2VpRUZtdFo4Wmk1NXMxbE5SSTQ5aFNFd3BCdTdL?=
 =?utf-8?B?NExYR3BaVWlmZk1MMnErM1FsQXJsVjZZWmM2NlFzVUhzQkF4ZzJuMVBGZXB3?=
 =?utf-8?B?U2JENStyMFhUTmJSMllyb1FGaVhDNXBrQmIrSWphSEpQR2VqR2htUHhJQ3Jj?=
 =?utf-8?B?am1zcFFibHhlZkpuMGMrWEVYZnBQVnliS0h1eENLM1lJNjlWMFdzVGd1Tjh4?=
 =?utf-8?B?dDZQd2d1Mkk3OXIvTXJBVlVvT3M3SzFETDRvYWY0dnlzY1NINjc1UDBtRUV0?=
 =?utf-8?B?NFdRZ2JjanFVS2Z3UGQwYzJwZEtLOHh2VlJkbGw0SlUzeDRuL1lkYk9QT1c0?=
 =?utf-8?B?Qk9hMTNwTzU1OUpSZHlyVCt4dVFCMWZ2TnB4bmVOVUdlZEZkQW1XRVdiQVp3?=
 =?utf-8?B?dlEyYndrdUhYdlNmc3VFbW5VbU56cUhOQmZaQldXdW1MdWdPTy9oenVVQWx0?=
 =?utf-8?B?S1Zwa0NVQnZadFlKTHR2MThLN1JvTWg0Qk9UZnlyRzZQK2QrVXpaRFRCRGNF?=
 =?utf-8?B?OTlrL2lxcnlRMEkrMDYzR3hhdjduWEZ5V3hUZVNHd2NKOXkvUjFQdG9ZZWY1?=
 =?utf-8?B?NXRkTmN2TjVMK0kwTGwrclpaZHZvdWhkWE1LNHAzM1d0UFptelJ3bS9uWE5M?=
 =?utf-8?B?ZEhEZkZpS3R5Q3IxOVk4SDMrbHZtd1NFclc3VjJtUUZsSUl6VnMrc25zZlVn?=
 =?utf-8?B?TWNiL1VqQ0hycGJKYjlNOUhLeTJOd0pJYlVEWU96OFZjWFZmNDBVQ0orMzZW?=
 =?utf-8?B?cE91MmE4cVRacGZaSkdqeUtGSXVhSzFETGpZaXA5V0Frd0s5Q3d1Q0pIdCtq?=
 =?utf-8?B?L0Z2UGpQamhTVDFCSU95R1VLRi9DQ1pYMVFZaWtZOHc3aE9Gb0JGMTNRWUZh?=
 =?utf-8?B?WmFGWWU3dTFyRFEwcldXN2grWE5OTWhFS3pqb1VTVGJkRWVlSTNNNzQxbDBk?=
 =?utf-8?B?cDExQkFtNlRVa1hIbURGMmFYSnd0eVNlYThhQ1RBSzlvT040Q0pVMjQ0NFVr?=
 =?utf-8?B?VkRsQWpXeE5jVDI2NmJVU2VIeUFvUkU5eXdoQnk2WkdFTnptMERZSUEvMitY?=
 =?utf-8?B?UGFVWDBzckxHK0ovdGJ2TzlDYUtpTXhRRWN3Qm5hV3RaeUpwRDN4Tzd3cVhR?=
 =?utf-8?B?bndqdUU3cmNyUWdMS2xmbzJGb0x1dXhaVllBWCsvNStycnIxU01sNWtodnlC?=
 =?utf-8?B?Ui9oUFJDQjBiamp5aHJieXpoQ3dtc2ZVMUtmYUZoczNOTEVDZjhpN1dzbkF0?=
 =?utf-8?B?clp2empaamZYbU1wTzRFbUpDQVI3NVVPVGRETDFsT21tOTdUYS9SUjFxYVQv?=
 =?utf-8?B?K2F5UVlhN2czME5laHhKWnRWZ3h1S2F2Z2NyZFJwZmw3V1l5SG05djVzdUJE?=
 =?utf-8?B?djd2eFJjOUYvRWZ4dnNxYXZXd01vRThBcVhDK0k3dnc4bDZhOHAvV0dnTHVa?=
 =?utf-8?B?WGRvM3FWak1wZndqcDBvYXZoM2MvVkN2OE1Rc2J2d1pHWXJzOVY5V05OQWg4?=
 =?utf-8?B?Qms4Y214WHEwQ0RlOEY4YlFVMHB3dW1pWEhyanVRbEQvL1J0SXdrajFVNUNz?=
 =?utf-8?B?eVpCbi81cWlmVVJvSU10NWoxMkxzTUlqM3NXNlV2eHFKQVorZHBnN1B5U0R5?=
 =?utf-8?B?V1RmRitQYUEwSkNDbFNkeVluOXhPUmV6cmM3dndwK1hsZk9FMU9pcUVSV0Zj?=
 =?utf-8?B?Rk9Zc3AyNEYyWU1LQ0pzM3pkUDZuQ0JKckdZVmREcVBuUXR3TTJSbi9sMUNm?=
 =?utf-8?Q?dcg6n7gl/KasYSFVGw=3D?=
Content-ID: <2A05AC1C1A51564BA32A06B41AA672E6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a78c44b-9b72-40ca-e744-08d8e778dfac
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2021 06:09:20.6233 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aneVmU3pcVcr+ZoeeJrS0OIwMSRctFjxUBJktsScdHnGSwHKggwAptagsG4n/8IMXIJD7aH1TPvVL7RDzfcFbtUjIa41pIpBTWZfTGrIPRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2575
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_060926_513342_5E7EDBDE 
X-CRM114-Status: GOOD (  17.67  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMy82LzIxIDE6MTkgUE0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gQW0gMjAyMS0wMy0wNiAxMDo1MCwgc2NocmllYiBU
dWRvciBBbWJhcnVzOg0KPj4gSXQgbWFrZXMgdGhlIGNvcmUgZmlsZSBhIGJpdCBzbWFsbGVyIGFu
ZCBwcm92aWRlcyBiZXR0ZXIgc2VwYXJhdGlvbg0KPj4gYmV0d2VlbiB0aGUgU29mdHdhcmUgV3Jp
dGUgUHJvdGVjdGlvbiBmZWF0dXJlcyBhbmQgdGhlIGNvcmUgbG9naWMuDQo+PiBBbGwgdGhlIG5l
eHQgZ2VuZXJpYyBzb2Z0d2FyZSB3cml0ZSBwcm90ZWN0aW9uIGZlYXR1cmVzIChlLmcuDQo+PiBJ
bmRpdmlkdWFsDQo+PiBCbG9jayBQcm90ZWN0aW9uKSB3aWxsIHJlc2lkZSBpbiBzd3AuYy4NCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQG1pY3JvY2hp
cC5jb20+DQo+PiAtLS0NCj4gDQo+IFsuLl0NCj4gDQo+PiBAQCAtMzU1NCw2ICszMTUyLDkgQEAg
aW50IHNwaV9ub3Jfc2NhbihzdHJ1Y3Qgc3BpX25vciAqbm9yLCBjb25zdCBjaGFyDQo+PiAqbmFt
ZSwNCj4+IMKgwqDCoMKgwqAgaWYgKHJldCkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiByZXQ7DQo+Pg0KPj4gK8KgwqDCoMKgIGlmIChub3ItPnBhcmFtcy0+bG9ja2luZ19v
cHMpDQo+IA0KPiBTaG91bGQgdGhpcyBiZSBpbiBzcGlfbm9yX3JlZ2lzdGVyX2xvY2tpbmdfb3Bz
KCksIHRvbz8gSS5lLg0KPiANCj4gdm9pZCBzcGlfbm9yX3JlZ2lzdGVyX2xvY2tpbmdfb3BzKCkg
ew0KPiDCoMKgwqAgaWYgKCFub3ItPnBhcmFtcy0+bG9ja2luZ19vcHMpDQo+IMKgwqDCoMKgwqDC
oMKgIHJldHVybjsNCj4gLi4NCj4gfQ0KDQpZZXMsIHRoZSBjaGVja2luZyBzaG91bGQgYmUgZG9u
ZSBpbnNpZGUgc3BpX25vcl9yZWdpc3Rlcl9sb2NraW5nX29wcywNCndpbGwgbW92ZSBpdC4NCg0K
QnR3LCB3aGF0IGRvIHlvdSBmaW5kIGEgYmV0dGVyIG5hbWUsIHNwaV9ub3JfcmVnaXN0ZXJfbG9j
a2luZ19vcHMgb3INCnNwaV9ub3JfaW5pdF9sb2NraW5nX29wcz8gQXBwbGllcyB0byBPVFAgYXMg
d2VsbC4NCg0KVGhhbmtzLA0KdGENCg0KPiANCj4gSSBkb24ndCBoYXZlIGEgc3Ryb25nIG9waW5p
b24gb24gdGhhdCBzbyBmYXIuIEkganVzdCBub3RpY2VkIGJlY2F1c2UNCj4gSSBwdXQgdGhlIGNo
ZWNrIGludG8gc3BpX25vcl9vdHBfaW5pdCgpIGZvciBteSBPVFAgc2VyaWVzLiBUaGV5IHNob3Vs
ZA0KPiBiZSB0aGUgc2FtZSB0aG91Z2guDQo+IA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzcGlfbm9yX3JlZ2lzdGVyX2xvY2tpbmdfb3BzKG5vcik7DQo+IA0KPiAtbWljaGFlbA0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
