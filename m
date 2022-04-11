Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092EFC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 08:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QX3aRzZQYR6IsthhlTQdxKbI2z9oVal0bYbg/3k9rLc=; b=SkxvNvbY3zxXWi
	cfkbFobS8Ff/qv/oLTA/JJ1XOLqz2EZhgu5nCxRX2q3zmkL7iLEzPS48nHssk1ci5JU3pX3a4SG8c
	T0H1+GoCMMugV75DALh7YcmyxRZzC5poc1E7MH+3eh0JkpxNfPVqKPzwiXr+gbVa2JBXtMa3vDYNO
	/1Slrup0PX4jxSpg1Y+R2kcvXbNZYCvNRy2JAGUJaXTAlDYzJ8ss7/I/o9i6hVEmVanSvgOvqJRFv
	xZO01t/xeyoxgdvSXF/KkcLbCUW6CA3kAWzdunF7eGSFRVV8E0mR1Bkamb/nuq3UAS4TJxomqcNh/
	IOaf6VIFRryT0Fl8vTXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndpRh-007Ywx-2k; Mon, 11 Apr 2022 08:30:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndpRc-007Ytw-2s
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 08:30:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649665842; x=1681201842;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=x7A3srAh/UehAq5SWBf4idbF3rouhc5oEZZVEUWMMYM=;
 b=gEvJY4ZTfcMdl7bhKKkZ2KA1cvNj3VmUKSaoQvIyq5g3hr4AoIaSVAmP
 IcMuw2fwwUMxF8k2hRZezJvA/QrAupM1K2XDaHzVk41Azo49sBf7vrgJ1
 n2fQ3PaSvNOvcfDWLoPikin9JdRghBn1y26JWwcrW3sC9kg1NBMOjoieX
 QZ3ls9yaICVFUKmdQSzV1oGjMBn0K9F+lNku92mnEs3stuagmkVco1sug
 /j9eHKYLSgr9JcrpHGXGyEdae/zqR/QS9F7M7JKB/TtVlR10x8hZk+qyY
 CHCLQysQ73DNbpQC9XejzZU3P8yuUaPuylkzqSv52Ab0GAq0KWErC9jV4 A==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643698800"; d="scan'208";a="169147600"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Apr 2022 01:30:37 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Apr 2022 01:30:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 11 Apr 2022 01:30:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPfXKi2RiVrvwrY7S8AmzKjjjW5nhRDQ700lqHdbbc6GP7gb+LHABzzYwUFYsmR11jNItVIEm1LT8C+8zDQ8FYvl5VzFF0SxiGiqbr0ynPDMk7YucUtfm2jMesryU64IbE3nLy4ppEdiJkoKkbVE86HR6Hex9X7uRP3vcYkwY5dOxi+NtRMymNUDLjPj24R4II7TTD2iy/LS1aHYjK0zB6SoJqmEUeuIjFh4plMA12uJ8V+3oQxffjhU5XeY+QVRcJ52Ls6qDdOavz6L7kSJNK43vMN4aj3FdIvGvC+6BaJxTOI8gSX2ePbKS9mVWxtpSymz+4x97DOVDYwryW5RqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x7A3srAh/UehAq5SWBf4idbF3rouhc5oEZZVEUWMMYM=;
 b=PtDGlyt129WY3CR17K+jRW4UhBcJXd0tUNwZs7uq/SyybxTvuGiZkQ7jr8qP6PSP7UzTjwsFXDXAEM9iR/OZZCqf9cWiwXuTOElx4JWhbGFcrwvzzY8zU9eA3hEFj/MjrSJ4uHdlIW9ARaVCa49/tbfdAN5lJEb9XAjHlvC8TTyT/Up3OS9DJemeaiUpAXNLekbDwb/xvmriZEnzCGPBKm8GXbejpPRvQZIL0F4/CsEh6jd4VII6uyId8AkjKxGDNPFOATC3hqEdoF0g6zVXAl2J7GK7ck+89UuKZ8erIIPukBlCXrp3RBHwRTo6JayEQV72IWQIpTCUJI4J7SEuNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7A3srAh/UehAq5SWBf4idbF3rouhc5oEZZVEUWMMYM=;
 b=gq9JssdfitzjLasoKLSUgjUqDtIV4Ij6megYBHhuDOaIAd+a1p5l0bledmB6omyWt9wk1EKPMmLSnztgoefjBnS1tI1tr7T7RVWF6BASXUj7wfef2k+UD4bO7PVYAp2HIKQPVGt3by9rnr+pcaMB2c7hiDKUuAGkLM3HhAIuPh4=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BN0PR11MB5726.namprd11.prod.outlook.com (2603:10b6:408:161::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Mon, 11 Apr
 2022 08:30:33 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::39c7:55bc:f22f:ac8a]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::39c7:55bc:f22f:ac8a%5]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 08:30:33 +0000
From: <Tudor.Ambarus@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <p.yadav@ti.com>, <michael@walle.cc>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] dt-bindings: mtd: jedec,spi-nor: remove unneeded
 properties
Thread-Topic: [PATCH v2] dt-bindings: mtd: jedec,spi-nor: remove unneeded
 properties
Thread-Index: AQHYTX5pYWLxo6EySUy1IMk/GZS9Hg==
Date: Mon, 11 Apr 2022 08:30:33 +0000
Message-ID: <3e550deb-7c27-894b-a0b5-62609a60f17f@microchip.com>
References: <20220408063720.12826-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220408063720.12826-1-krzysztof.kozlowski@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 419475d3-72eb-4eeb-020b-08da1b958bb5
x-ms-traffictypediagnostic: BN0PR11MB5726:EE_
x-microsoft-antispam-prvs: <BN0PR11MB57267352738261D41E680F1BF0EA9@BN0PR11MB5726.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uU5qEasVI8ZCdVqyZgylFp6h8afHnLhRK7dV8FglzKfYE/L0NEQk29V6BUFAaO81mu0B0JMtiF0IIHgA3TTGc9W9StwC3WOVg4aYjTrGEApYQixizEf6eAv+MxnXGtBSQAZafu93Ydno4ve7RIpTaZ7hEkl/1TyOAN/hS+HZPY6hCKuA/+z6X93KgZR3Zma6dRdmyQxlvVDM74zghmLJVRv0wx2e+ffELNGSnlmOcFEpe3E1no91NOjGsSLLE+BIMzKlaYSf1J6yNb3QLQXOwBUv2aaX5eB05ZbN8nAYkzjnXKXIg5firdVfv9iuPICj2qps11mZQu2c4VW5vmdYZSJpH+Iy8iX3D3JTXMjG7DwV83eprnArBdy2dUHre6V24bLk+jytQENv8uFpNg4ioPOddqptpK1nD2oE56Qgs+DiDiG8RdglDIa8ocgnRHlB2ATAIbyxFPcVD91VJOpbq8BMjVYLPpPnEtBBUhmf8i1tQ0atlMdd4VycyI9NO0Wg3DNhn6UYbkNkA37xcx8KcqBW0hJgQ4so+LgeEMWZ3bO4WUmJ0/62hd2vx2NC7qWWT3TSiEBVWL9cmCF3bH1qEsxfYMqIXZqNv5aiv8qDqIxXGVS0iHgpouaGX/h6wjb0lRADr7z8dHvgVr7L8+V4NyhSWTzyvUwiGSPvznVa9kcpaEZv1R0iY65fQ1EGfSNzrm89M8JhBN9xeJVRvRnFkWIztkxVeC+sACieDuNda7Yq4lAnOXKfBkG+5s/YasCGEBBM9DkJbJTemWYv5Gh53RkfvHFe5ws76LGEoto8ga4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66556008)(38100700002)(316002)(66946007)(66476007)(8676002)(66446008)(64756008)(31696002)(83380400001)(53546011)(91956017)(76116006)(110136005)(86362001)(122000001)(6512007)(921005)(6506007)(508600001)(186003)(36756003)(26005)(7416002)(31686004)(2616005)(71200400001)(2906002)(6486002)(38070700005)(8936002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWJEU3dXcGh1YmVqcVoxMFRWbmVNbVhodi82MXpRbFBkdXFPZHp4ek1YYUd2?=
 =?utf-8?B?djllQ0lxL0lxRVJDeDR5THY1VE53SXA0bzNxd3k2TmVWSzRPR2xkZW5LVHZn?=
 =?utf-8?B?RXQxYVplY1hkU3E3dmV5VDcrUDc0eUV5VFZtcGlLcTlmcFA1T2Q5S29vOUdy?=
 =?utf-8?B?UHo5clpIODFsbGdPZVpYRHUxNDVneng0VkFYNWdhdktTNUwvWE9oTjFWVGx2?=
 =?utf-8?B?ZmJLalNzSVNtUXE2SHRGaHErOXcwcnl2VDg1R2tpUkVjS2thbkhJN21La1B3?=
 =?utf-8?B?Z2MwcStyVHIxeTF1Wm83bkJ1WEV6UXU1L29vczZGYUN3NE5sRHg3L2hNZzY1?=
 =?utf-8?B?WjMwTVNzaklFV3liUEoxcnR0R0tXTWFkazd6d3MyYXE5VGxNcy8rT1BJaHNr?=
 =?utf-8?B?em8rWk01MlZ4cy9DNFJNdWZsRmxtZnk0YkhLS0h5Yml6c2pUd0dOYnAvOGIr?=
 =?utf-8?B?N2dvM2tBL0FMWDVFcGNPWUpYSVZEdXBRSnNPbmlMdnlodDljYnlQUEJhMlZ6?=
 =?utf-8?B?b0RYdkQ2dDRudmF6eXJaS21nN3U2bWdudUgzSWJjNzk4ZmJtNjJVMDBiRmV4?=
 =?utf-8?B?cE0wbFg3cE8vUUxBT0UyUVk0cERleEcrSVlub0ZqZlFBNTFFZVUzY3JSYzd1?=
 =?utf-8?B?eTVBTHpyMDkwRjlUTnR3cDYzMWUwNmFvcmRVTXd4YjFMa05iQVN6UTJhMGFI?=
 =?utf-8?B?cHJnb0hESGI2WkdIZXRFL1dxdkdlWWdoUmZ1d1B6VVhrWUlmbTlXYXdXNEQ2?=
 =?utf-8?B?LzBmUVQyamdVbzFVdFFPSlZSNW1YRnVLYlQwaDVxU3BUSnJPY2Z0MkhkT0VR?=
 =?utf-8?B?SFdOYUdNdGlDd2oveEFNWUYyaEM1SnZHZm51c0hLMWlnb1cyVjBiTWxZSjV3?=
 =?utf-8?B?cEdWb2h6VnowQlhzcHR4VGRySVVqZ0MxekIxRkVYVVpoUzY1ZDdIMTNtY0Ex?=
 =?utf-8?B?b0tEUUVmdlNWYzZiclBRT1hNUExDWUQ1d3BuZTVrQnU1NWxXM3g3dFU4UlJl?=
 =?utf-8?B?aU9rV0ovYWZiVlZIc0tVMzZXQkpJclhCcncyS29BWml3ZVczSVltSjlCakJ2?=
 =?utf-8?B?RFNGMEN1cVVST2pUMk13b21UVjgvMXRDRjBxMlljQlZtMVhBdDVvSEI1VE5r?=
 =?utf-8?B?eUc2djJiQXFZRjgrNHlSTjU2NHY5YzZZcXpQTnJOTnJJMnZ0L1pONHhOY0RN?=
 =?utf-8?B?c2Y4dUgrUFdzMUt6RFFVSDN0Z0g4NVVJQ3ZaRGJiNEcxZEt5amhQQWJJTWVx?=
 =?utf-8?B?ZjhLb3IwelB1R2pPVXk0S2xjWHpEK2JUTEpMYlFHY0NwczE5K3Exc3hJdjY5?=
 =?utf-8?B?a2ovM21KOWl6SVRrbmFmVnI2VEpJZ2RLRzhBTEJtbHZ0WTdzR2hLeGU3ZFFG?=
 =?utf-8?B?My82d21oaG8yM1FTOGZvdDQzK0dmcVJMZ0dvRzZFRGtXRHNzbVZ5MFVHZjBQ?=
 =?utf-8?B?N0xPNjZGNUZGWU94aWdyMU8vQUJEazF4dEVUcGFMVzBYeWlnUXViZUdRaS9v?=
 =?utf-8?B?V1pYc2EzSDQrL3QveXlTYWlMYlYwWnBXdHY1YVdKZzM0cWI5YXBYQjhuRFFw?=
 =?utf-8?B?a1dzeVhPZVowUXFUMDRISnRoSHgySS9uWlRVSjR0L2ZWOEFoK2RKenUyRG9m?=
 =?utf-8?B?SFZESzl2Y1RuRVgyUkcvMGRPNjlGN0piUklOaForS1RPREhlZHc2SEJZZTVH?=
 =?utf-8?B?TXFWcUwwb0Q1TFhIRHU0aGhJQ2VmeGxGS1c3NEtsQmtLRGlYUTg5RW9BR0wy?=
 =?utf-8?B?MUV1ZllCdFdwZlNTYTROeXFjaW1OWGUvNEQvcDJjbG91SHNITkhCUHIraS9r?=
 =?utf-8?B?dU9EWFJ5aExoY000VHBDMjZjZWhSTHBrRUQvYk5jTFZYUFhpeWw2NTU5T2hR?=
 =?utf-8?B?akxLTW5QeFBuRzJYUnFOQ05JWWZXVkp3VnEzUlNvMW81K3JaL0NIaGZWRC80?=
 =?utf-8?B?V0F1bEdmZW9OTVlOdHlBZEdJYXg1MEdvK252RTFNRElzUmh6RlhXOXozWnFK?=
 =?utf-8?B?SkhQQ3FIeXhxdlg5M25jRk9oaHArWnNMZ2kxUkhuem03U3puRmQ1Ti9JWHUy?=
 =?utf-8?B?NGI2Qk41LzhPOUVhTWdVWmJzdXQ3QXQ4TUhTRzIyVDN4OHN4aVJrQlhjQ3Ir?=
 =?utf-8?B?cTM5aCtReTJTT1lTaVdTTzVQVFFZMUxnUUZKSmIwVVBvUk94TVQxUm9wM1VO?=
 =?utf-8?B?M1pwMTNOdUQzeGNXTEZRYVMvaHRXN29XNW9URkdIb1hLMUFRc2I1bUdKSm5Y?=
 =?utf-8?B?UnVTN1FzRE1rc3BWRFhiQ3Z4OWJkWHZtOXdZbDk3VldUb0dBTFVrMmhBNlVR?=
 =?utf-8?B?VWRaUGFXajBST0VTMlJweDlNbjA0SEx1VVVlMmFkWXQ0UTdGUUZUNzlCc0xi?=
 =?utf-8?Q?7R3GlGI08+6DcIC4=3D?=
Content-ID: <1715A48692F1E3408E1C0168F2785B5D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 419475d3-72eb-4eeb-020b-08da1b958bb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2022 08:30:33.3538 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NeMTQQc2C1+7v2hd9qmj2Qk4Y0owCx6hXonG0Fyw08H3GDiU88IzC07RdhJzr6hjm8EruGMyloUZZolynU1dPY4xbArjczftorqrL7GRNj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5726
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_013044_167689_E3952708 
X-CRM114-Status: GOOD (  15.65  )
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

On 4/8/22 09:37, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> After conversion the jedec,spi-nor DT schema to reference other schemas
> (SPI and MTD) and use unevaluatedProperties, few properties are
> redundant.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> 
> ---
> 
> Changes since v1:
> 1. Do not remove address/size cells (Rob).
> 2. Add Pratyush review.
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index 4abfb4cfc157..7149784a36ac 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -50,10 +50,6 @@ properties:
>      minItems: 1
>      maxItems: 2
> 
> -  spi-max-frequency: true
> -  spi-rx-bus-width: true
> -  spi-tx-bus-width: true
> -
>    m25p,fast-read:
>      type: boolean
>      description:
> @@ -74,8 +70,6 @@ properties:
>        be used on such systems, to denote the absence of a reliable reset
>        mechanism.
> 
> -  label: true
> -
>    partitions:
>      type: object
> 
> @@ -99,8 +93,6 @@ examples:
>          #size-cells = <0>;
> 
>          flash@0 {
> -            #address-cells = <1>;
> -            #size-cells = <1>;
>              compatible = "spansion,m25p80", "jedec,spi-nor";
>              reg = <0>;
>              spi-max-frequency = <40000000>;
> --
> 2.32.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
