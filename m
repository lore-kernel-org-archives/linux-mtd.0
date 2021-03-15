Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6509DC433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 08:21:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCD5F64E81
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 08:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCD5F64E81
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=71NO44CwBM0RPHbQgQZs2iOG8RT/SyKHlpCSgdveG3s=; b=ABPC1w7IaN6+0v6WhYEYm9wf4
	lcZCamEatD1RnM6fB8G7dKF/ZME65BL5Xci16K2B3ADYDM02H+30dGV981YofpZltCxc4vYq+Pub8
	qetxEdNh9+AzCwidSlivRiN1XqWmHacgcsYhp1Lijfg4LE7UIXpL56yxLnahh14mLEO8Vmen/B6fy
	9r/mE+wi5CV9G9k5AHVXnXYiYh0HYWeO3HVZ70/oekY660JFMX5ZBfS91eVDSpULeeyGoiRE/JIpQ
	lpt+g9iAaMVT3NwZc4Ci0mfa8RGO0HwhoggcNdjLuRH/8y4ENAauvfqVMZX2bEEoTVut3mo6VSaGM
	WJAzKQmfA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLiT3-00FDFK-2n; Mon, 15 Mar 2021 08:20:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLiSo-00FDE3-48
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 08:20:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615796434; x=1647332434;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Ksv9XRQqT69yyZ9ZIiSApm99SjF5JNZeYohZNR4AZeM=;
 b=SkwRBe2k6UQZLTegCEZ6rhNj3uaxWggkskH6oIddqsDMJ2C7/00wHRU/
 aNHyNEUCQVYA+xiDUZmauqsTWw1oNmH1o7bloxJU4rwa+4leuckZz0Rkq
 LEX7erHD6+IVtrIdbllkXwezk8VIvtiYtaGc5RTgwxxh9C5EMxY5GObSm
 qZYbjaRW3ur6Yhx3TCEy+1tlmM0FCIwdrBRRnBoUhGgAQZseRe86f33c3
 HEwEznyzwUURnLqEbcfSeWQX2cAmLPp+EVW3hrUGcgnGSN2jKoMdwuP4x
 XC3R3Nw+ljW8InffO57R1pKuJgAbzpVc24X21DB2FJ6xHf+CoGPlK7PA8 g==;
IronPort-SDR: NqOXKSZjcVaN8704YpAq3HxS2/Qor6dXbIZXMZtKYrEOtDftg6sNTgPO9Ws9XPNpH96tE0M1ef
 wE8UmIWppv2FsujNaQ8qTGX+4YIBjCMXU4WNhKGXTxs4XhHVoRM2OB50A0kQfe6Xz2+TKiybWh
 Vtfji5dVF8FwoyurT/r+AfBng82Evc6bzn+ukZuTk6PD230CPdywya6cJFHljkSV2WNfiF24W0
 mUu2R4XNp9ICH0lLTb3YjTlGiPCFFuQ0xb3+xgd3ohykmB+Vjon4+pniI3CIfZDf8mphiYMnbH
 X/Y=
X-IronPort-AV: E=Sophos;i="5.81,249,1610434800"; d="scan'208";a="113222708"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Mar 2021 01:20:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 15 Mar 2021 01:20:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Mon, 15 Mar 2021 01:20:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRYM7rxPhsV4XUBBfT7+Mof8vfh5/j3lOw1fApqH7pJ5ValFlxf36pPabxRpj42QdVSX9KAn7i1YZ69RZrF+MqN+8rqiyqNTCgpyyBR35Wa3uiFlJrSZVlGDgsYCLPp8S3t0wrvMv5qpXCUK/ZvpU+EdU1jOYrzDI8qFy9WWmT8iT2knInUnjZJ7UaB7ve2i72CBv8N5vJe8VEKOB+TXhauiCFbFWxEAefTD3aRakdhsKEAHvTtvGYKrb5Cr8Sl11Q1Ro0MFom+x4j16vDJcYL+iNvZeCPFaGIDi6sx3B9s4/4Y3l/MaPkS/JqBGHJvJPFCd4PiL90SFp3yfFRvI1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ksv9XRQqT69yyZ9ZIiSApm99SjF5JNZeYohZNR4AZeM=;
 b=hxYD7FauVYS8fYT0aL++tZvDWNPnHc2MY/AMECt7BuB0tDON+JNEkohZkNh5nGGgH8AFsoV/WqJ6hRFEg83T40d8p/5eru2gXgu1Y5rhkzqNQ/NIpLczjAH4/uSbBs3KZ/M5v+FCGkbRxKHYn+bgSZJEfG8Qr6bkYd8zcay5l8ZU2C568P/1DnUi0JJPy6lKLwzXqSH+6bXdVWNqf1L1BtxlGuXv5Hkw41HfNteq87TevPdfM25bKQIVcg9OdMwUeNcjsCX400ZK1Xr4JAbZCCVjUoxKM+G56XbnHVm7p9wZ9I0Vr/2eQ4vATzD/DHHkmfCFTiQtuOf/SOOiX7k4ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ksv9XRQqT69yyZ9ZIiSApm99SjF5JNZeYohZNR4AZeM=;
 b=tjteaN6Dr8riW8hlGhVbza3xYHtoFKyB91aAagJQWuIEYF5ppmE1HNXdcGBM2VwGMriOc43UPcPmKHWEJYESiQgtZTCwH3J4DNcxut6yERsEVtOj/2ukn8YBDRNav482Qv3umVtNnAhvg5mX5IIZIG9v1e0GRQddN5D3OouwlnA=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4526.namprd11.prod.outlook.com (2603:10b6:806:96::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 08:20:29 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 08:20:29 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Subject: Re: [PATCH v4 2/4] mtd: spi-nor: implement OTP support for Winbond
 and similar flashes
Thread-Topic: [PATCH v4 2/4] mtd: spi-nor: implement OTP support for Winbond
 and similar flashes
Thread-Index: AQHXGXQOjGgv6AWSAkquJAUSVZICiw==
Date: Mon, 15 Mar 2021 08:20:28 +0000
Message-ID: <b2baa942-6018-16a6-a5b7-76ed61b5eb8b@microchip.com>
References: <20210306000535.9890-1-michael@walle.cc>
 <20210306000535.9890-3-michael@walle.cc>
In-Reply-To: <20210306000535.9890-3-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95dafc15-d5f8-4800-75de-08d8e78b3197
x-ms-traffictypediagnostic: SA0PR11MB4526:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB4526A3DBD78DFF16CC6E1AE3F06C9@SA0PR11MB4526.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nZvx0KXH7Sg/qKulyO/EQLvXkmv/B4knr+C+ktIaRK9tpORtzfEF7pmFwk3DayxlBD/bGrdpL7KNgpMvJOd+i+m0udETFapKlCWRdwGH+cRzkDB1I6ldQTPy2whduWOASwHq5l+6Xt+9dYUttdRRQBwdZWvczLFRaBNMcwLk9dTtAfiDmIbWZTQNCCm49XoAELrNrw2Hwl931f2ihARhZHlJ9rGM1l/ZsYnBiR0W1jyixJwQjYwosZohQrdj9/XjSMQO7tvPw4OfxMoGusykmFJ8E7nl6XPe3jYoy+4gLC5qLFyJ/ly4O1+Dp7GQEogQlAVNyuLDR8C8nPhPSTGtVnGC6JN/wh5/79Uyw0ycL7uzDxTdgK0tm4RQRcVmMjoRLFaDP4Aen7LlUEPXeUSxF4etZjJ6ddr/Q3lOfRkla0ggc2gTjLyWY4KPqLrYxCyyEfyfrY5nDXRI5LTXnHJK9E7Kd5ktvW4G2HT4+LoB3R6i1+5I+0owDSCxQl0rleJu6vd2BughB/8i+gPnR014ibvoFingI/41XiZJctBwdc4de5FZ7X1w1Lsz/DPUCO1qdo7C9i3a7yITK2LUqUiHPZIZKcY+NDy4CkCaa5uRf5qkvMhewVJX5xW3grwGr2EiLbaTmDRAFs7HcuYIG6RGiA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(366004)(39860400002)(136003)(376002)(71200400001)(64756008)(6506007)(8676002)(66946007)(86362001)(66476007)(110136005)(6486002)(5660300002)(53546011)(36756003)(66556008)(54906003)(91956017)(31696002)(83380400001)(31686004)(2906002)(186003)(66446008)(8936002)(316002)(2616005)(6512007)(26005)(76116006)(4326008)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?YXRGUXE4WlF3SFB6TXVvZ0F3L3hITVNWN2tLNHpvQWpUNFBvOWlIOTVOQmw5?=
 =?utf-8?B?WTBScEl6c2VjZWJOT054ME5HUXFLTG03NllXR0ErdVpVREJnS0VVanY2UnJp?=
 =?utf-8?B?UnlXOGU4NFJ0Yjc2N2xpYStNNXJOSkZFbDEyWmZ0azVGbnJwNkNMZjJFT0lW?=
 =?utf-8?B?eW5XUmtWUWZjOGlpRUxWWE9rWEVIZ1p0TjYyQm5YSS9PV2Y5aC80YXFOTTJi?=
 =?utf-8?B?dFo2ZkJBUkNITU10Y2loUGgyemtFcGV0UVRiUHA3ZEtNKzZDeTJjWm5vOEQw?=
 =?utf-8?B?VllHT003Mm10M2VFZ1RYYitzUUVYajNSOFQ3S1NVYWR5S09XRGsvU295dWZW?=
 =?utf-8?B?ejBvRUlka1NaMW5pWmlEbXh0emFkM2tYYXR5a1l6UVUyb0JWSExXOVFtSURM?=
 =?utf-8?B?ZFNOUG5ZR3dlY2lQZXUzdXFGR2owcDI2NXNTb0dpUmVoQUtxcy9mRTc4WHJ4?=
 =?utf-8?B?L0pTZTJublp3TXhDdEwwcEVGakhuejJKdEdPK01oQ3BxMEl6VDJVeXlQUGl4?=
 =?utf-8?B?cmNSSjNVQTdMdXpJWlh0WDZsT3NHMUR5RWRGcDJFNUhzS0lJNE1heUZma0tm?=
 =?utf-8?B?czN0UUx0cHJxT3grajk5UHR6QjZleGF2eGFDc1Rib2ZmNHVPdnhndHR3dnI2?=
 =?utf-8?B?WjZDeTZRc1BLRDIvQlBKWnorV0g4NkhhODRDWk13ZDZicSsyM0hkcWt2V0U1?=
 =?utf-8?B?d0o2RVFZRkxqYm5oeDYvQ1JOUVVBdWJ3YmtKRERNaGNCS1Vvd2E4MHV1SjJD?=
 =?utf-8?B?SGNaLzhJNFZRMUFSWXpQUGdVZjBUeWdjOHoxZ3FQeitpdVIzYjBvajROditn?=
 =?utf-8?B?eVlSSDFZdkpNT3E5RmJ1YysxL2tRSGIxMVNibXF0SmNjOGs0L1ZnQjRsZW5y?=
 =?utf-8?B?aHBQM1orZFkrdWFiTjBVZy91SDMrY0w5L2luMWM1dGJZWi9MU0hGN28xWmtE?=
 =?utf-8?B?OUtCd0F2Tm4rZ2haMTRHVFdhbjRaYjhwWFRwM25oOVF0dmVpMFBDQkczYm9o?=
 =?utf-8?B?dEQyWUlXTmRWOW9yL2M4V0UxNzFnSUdveGE4Sjh4WjZodlIva2RaRWZ5Mk5x?=
 =?utf-8?B?RDZ6K2VDWVRRRDFIRkZkRzhtTlNpc0FadDJDcXk4dERCd1V6M3hDdFhRbG52?=
 =?utf-8?B?WmppWXlVV2FYYmFKakZ4aGx2dXZTK2I5ckFIV0d2eE9PWWxjbG1XVkZWSzlJ?=
 =?utf-8?B?TGtqQzFxQ1ZMSVc2VzlqbjB4S0VsT0lxWCtZU0s2SGVNOVZrbVNwUVBsbXI2?=
 =?utf-8?B?S0REcWJlR0tpVldpOVpSWWFTK1RKNzRVUWxKZ2g3bjViOGRyaERKcExEK3V1?=
 =?utf-8?B?cnpkZVhSZVF4WVZaaXVIM0NQSGdPeUJKb3RoS29wT1dFY2R3RE4wTldvbW1H?=
 =?utf-8?B?cDZhekE1aFUzQ3RMOVVnZU9BNWRueEVpUmwydytVUjlJTnVtUEt0c2J6bENU?=
 =?utf-8?B?WFl4VUhJRXNlK0k1RTVjZzJiaGM5VTBjNlpwUWExR1RnN0FPQ3M5a1FOY1hZ?=
 =?utf-8?B?VlB3WXZaTHFGSmtyMHNTZnJoSDdhMzM4c0JCNkNlUVpvK1FRMzFxSUhrMVlU?=
 =?utf-8?B?MXBFMkNkc05YNFN1OWhWcS9qYTZNY2pBelozb0N3NE5PdXM5TStPVDdMU1Q1?=
 =?utf-8?B?SS9XZXp6TVRtc2VrV2lqV0xHaGdLTGhyTXVCVXcraFhLYU9OOUw3YjNjcUZ2?=
 =?utf-8?B?Rm12NFN2U3dSZzBjbHRPeVdPWjVjTDFNVHIvOG9oRm1oOVV1MllYVWplcUNh?=
 =?utf-8?Q?h/PGvhU4awf18yW7q0=3D?=
Content-ID: <49B7DBFDD863524482B1BBA827DBB14E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95dafc15-d5f8-4800-75de-08d8e78b3197
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2021 08:20:28.9941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wu9YIsZSiXDqGMUAlU3VrdBjFRsGLs2eag5jqgI8IZ5mkYU8wCZ6h/podeIygSaEDnTAL5wUczZPOMGAlAxKHKXDtagWDusyaodDV983QzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4526
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_082035_257943_9C55E593 
X-CRM114-Status: GOOD (  23.41  )
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

On 3/6/21 2:05 AM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Use the new OTP ops to implement OTP access on Winbond flashes. Most
> Winbond flashes provides up to four different OTP regions ("Security
> Registers").
> 
> Winbond devices use a special opcode to read and write to the OTP
> regions, just like the RDSFDP opcode. In fact, it seems that the
> (undocumented) first OTP area of the newer flashes is the actual SFDP
> table.
> 
> On a side note, Winbond devices also allow erasing the OTP regions as
> long as the area isn't locked down.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/core.c  |   2 +-
>  drivers/mtd/spi-nor/core.h  |   6 ++
>  drivers/mtd/spi-nor/otp.c   | 164 ++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h |   9 ++
>  4 files changed, 180 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0c5c757fa95b..ef7df26896f1 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1034,7 +1034,7 @@ static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 sr1)
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int spi_nor_write_16bit_cr_and_check(struct spi_nor *nor, u8 cr)
> +int spi_nor_write_16bit_cr_and_check(struct spi_nor *nor, u8 cr)
>  {
>         int ret;
>         u8 *sr_cr = nor->bouncebuf;
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index ec8da1243846..dfbf6ba42b57 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -496,6 +496,7 @@ int spi_nor_read_sr(struct spi_nor *nor, u8 *sr);
>  int spi_nor_read_cr(struct spi_nor *nor, u8 *cr);
>  int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len);
>  int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1);
> +int spi_nor_write_16bit_cr_and_check(struct spi_nor *nor, u8 cr);
> 
>  int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr);
>  ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
> @@ -503,6 +504,11 @@ ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
>  ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
>                            const u8 *buf);
> 
> +int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf);
> +int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf);
> +int spi_nor_otp_lock_sr2(struct spi_nor *nor, unsigned int region);
> +int spi_nor_otp_is_locked_sr2(struct spi_nor *nor, unsigned int region);
> +
>  int spi_nor_hwcaps_read2cmd(u32 hwcaps);
>  u8 spi_nor_convert_3to4_read(u8 opcode);
>  void spi_nor_set_read_settings(struct spi_nor_read_command *read,
> diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
> index 4e301fd5156b..4e8da9108c77 100644
> --- a/drivers/mtd/spi-nor/otp.c
> +++ b/drivers/mtd/spi-nor/otp.c
> @@ -15,6 +15,170 @@
>  #define spi_nor_otp_region_len(nor) ((nor)->params->otp.org->len)
>  #define spi_nor_otp_n_regions(nor) ((nor)->params->otp.org->n_regions)
> 
> +/**
> + * spi_nor_otp_read_secr() - read OTP data
> + * @nor:       pointer to 'struct spi_nor'
> + * @from:       offset to read from
> + * @len:        number of bytes to read
> + * @buf:        pointer to dst buffer

is buf DMA-able?

> + *
> + * Read OTP data from one region by using the SPINOR_OP_RSECR commands. This
> + * method is used on GigaDevice and Winbond flashes.
> + *
> + * Return: number of bytes read successfully, -errno otherwise
> + */
> +int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf)
> +{
> +       u8 addr_width, read_opcode, read_dummy;
> +       struct spi_mem_dirmap_desc *rdesc;
> +       enum spi_nor_protocol read_proto;
> +       int ret;
> +
> +       read_opcode = nor->read_opcode;
> +       addr_width = nor->addr_width;
> +       read_dummy = nor->read_dummy;
> +       read_proto = nor->read_proto;
> +       rdesc = nor->dirmap.rdesc;
> +
> +       nor->read_opcode = SPINOR_OP_RSECR;
> +       nor->addr_width = 3;
> +       nor->read_dummy = 8;
> +       nor->read_proto = SNOR_PROTO_1_1_1;

any winbond/gigadevice flashes with octal dtr support? Do they
provide SEC Register opcodes for octal dtr?

> +       nor->dirmap.rdesc = NULL;
> +
> +       ret = spi_nor_read_data(nor, addr, len, buf);
> +
> +       nor->read_opcode = read_opcode;
> +       nor->addr_width = addr_width;
> +       nor->read_dummy = read_dummy;
> +       nor->read_proto = read_proto;
> +       nor->dirmap.rdesc = rdesc;
> +
> +       return ret;
> +}
> +
> +/**
> + * spi_nor_otp_write_secr() - write OTP data
> + * @nor:        pointer to 'struct spi_nor'
> + * @to:         offset to write to
> + * @len:        number of bytes to write
> + * @buf:        pointer to src buffer
> + *
> + * Write OTP data to one region by using the SPINOR_OP_PSECR commands. This
> + * method is used on GigaDevice and Winbond flashes.
> + *
> + * Please note, the write must not span multiple OTP regions.
> + *
> + * Return: number of bytes written successfully, -errno otherwise
> + */
> +int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf)
> +{
> +       enum spi_nor_protocol write_proto;
> +       struct spi_mem_dirmap_desc *wdesc;
> +       u8 addr_width, program_opcode;
> +       int ret, written;
> +
> +       program_opcode = nor->program_opcode;
> +       addr_width = nor->addr_width;
> +       write_proto = nor->write_proto;
> +       wdesc = nor->dirmap.wdesc;
> +
> +       nor->program_opcode = SPINOR_OP_PSECR;
> +       nor->addr_width = 3;
> +       nor->write_proto = SNOR_PROTO_1_1_1;
> +       nor->dirmap.wdesc = NULL;
> +
> +       /*
> +        * We only support a write to one single page. For now all winbond
> +        * flashes only have one page per OTP region.
> +        */
> +       ret = spi_nor_write_enable(nor);
> +       if (ret)
> +               goto out;
> +
> +       written = spi_nor_write_data(nor, addr, len, buf);
> +       if (written < 0)
> +               goto out;
> +
> +       ret = spi_nor_wait_till_ready(nor);
> +
> +out:
> +       nor->program_opcode = program_opcode;
> +       nor->addr_width = addr_width;
> +       nor->write_proto = write_proto;
> +       nor->dirmap.wdesc = wdesc;
> +
> +       return ret ?: written;
> +}
> +
> +static int spi_nor_otp_lock_bit_cr(unsigned int region)
> +{
> +       static const int lock_bits[] = { SR2_LB1, SR2_LB2, SR2_LB3 };
> +
> +       if (region >= ARRAY_SIZE(lock_bits))
> +               return -EINVAL;
> +
> +       return lock_bits[region];
> +}
> +
> +/**
> + * spi_nor_otp_lock_sr2() - lock the OTP region
> + * @nor:        pointer to 'struct spi_nor'
> + * @region:     OTP region
> + *
> + * Lock the OTP region by writing the status register-2. This method is used on
> + * GigaDevice and Winbond flashes.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +int spi_nor_otp_lock_sr2(struct spi_nor *nor, unsigned int region)
> +{
> +       u8 *cr = nor->bouncebuf;
> +       int ret, lock_bit;
> +
> +       lock_bit = spi_nor_otp_lock_bit_cr(region);
> +       if (lock_bit < 0)
> +               return lock_bit;
> +
> +       ret = spi_nor_read_cr(nor, cr);
> +       if (ret)
> +               return ret;
> +
> +       /* no need to write the register if region is already locked */
> +       if (cr[0] & lock_bit)
> +               return 0;
> +
> +       cr[0] |= lock_bit;
> +
> +       return spi_nor_write_16bit_cr_and_check(nor, cr[0]);
> +}
> +
> +/**
> + * spi_nor_otp_is_locked_sr2() - get the OTP region lock status
> + * @nor:        pointer to 'struct spi_nor'
> + * @region:     OTP region
> + *
> + * Retrieve the OTP region lock bit by reading the status register-2. This
> + * method is used on GigaDevice and Winbond flashes.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +int spi_nor_otp_is_locked_sr2(struct spi_nor *nor, unsigned int region)
> +{
> +       u8 *cr = nor->bouncebuf;
> +       int ret, lock_bit;
> +
> +       lock_bit = spi_nor_otp_lock_bit_cr(region);
> +       if (lock_bit < 0)
> +               return lock_bit;
> +
> +       ret = spi_nor_read_cr(nor, cr);
> +       if (ret)
> +               return ret;
> +
> +       return cr[0] & lock_bit;
> +}
> +
>  static loff_t spi_nor_otp_region_start(const struct spi_nor *nor, int region)
>  {
>         const struct spi_nor_otp_organization *org = nor->params->otp.org;
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index a0d572855444..6d1956049e90 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -107,6 +107,11 @@
>  #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
>  #define SPINOR_OP_WD_EVCR      0x61    /* Write EVCR register */
> 
> +/* Used for GigaDevices and Winbond flashes. */
> +#define SPINOR_OP_ESECR                0x44    /* Erase Security registers */
> +#define SPINOR_OP_PSECR                0x42    /* Program Security registers */
> +#define SPINOR_OP_RSECR                0x48    /* Read Security registers */
> +
>  /* Status Register bits. */
>  #define SR_WIP                 BIT(0)  /* Write in progress */
>  #define SR_WEL                 BIT(1)  /* Write enable latch */
> @@ -138,8 +143,12 @@
> 
>  /* Status Register 2 bits. */
>  #define SR2_QUAD_EN_BIT1       BIT(1)
> +#define SR2_LB1                        BIT(3)  /* Security Register Lock Bit 1 */
> +#define SR2_LB2                        BIT(4)  /* Security Register Lock Bit 2 */
> +#define SR2_LB3                        BIT(5)  /* Security Register Lock Bit 3 */
>  #define SR2_QUAD_EN_BIT7       BIT(7)
> 
> +

not needed. You can catch this when running ./scripts/checkpatch --strict patch-name

>  /* Supported SPI protocols */
>  #define SNOR_PROTO_INST_MASK   GENMASK(23, 16)
>  #define SNOR_PROTO_INST_SHIFT  16
> --
> 2.20.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
