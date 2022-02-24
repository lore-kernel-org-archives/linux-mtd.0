Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4B2C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Feb 2022 06:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AQbzHb53vmY7Js6I4sEtpfEx+qrFV1DDOd97RKI1ORA=; b=aGMYsFtsfZTCTi
	zN21cJxsehcSFbUiCrvMkvksMLH3B62W//4vbSXd8srg6EkSfZsZwMfae3qUiCEbFp1V7qnWa8m4r
	aTCOtlWUJKWzFNJ7vxLvifnGpUpuPeyVy+xy+2wkU+Mh0B1ES/eMtzwkRYpI/gNWhf0H/P6QYD5AO
	o2YcCpXx9/PF6/nV2+m6Qt5IZhhU5EcRJxJB9CB6OkEQprF0iitLqkcgazMokyhxHDwnjnejknY7V
	8xZ8+8SEF2gTyMkTw56ZEx5s8EmwAEpN1cMRRyMENgN6xlMRQnozLNJxsNhwIe2fkUukwVOI7MUkW
	B0FaY4D+oA3QBGhetjhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nN7l9-00H2zz-33; Thu, 24 Feb 2022 06:37:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nN7l5-00H2yj-QX
 for linux-mtd@lists.infradead.org; Thu, 24 Feb 2022 06:37:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645684669; x=1677220669;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YzPeNkJogoD1nZY6sfoIRHPA/mOLH5eN1O3XBXT6Uwk=;
 b=DCEaJoDfSXEyTH93ytAsFrcS+eVeZeoR+S818KZV38OO7tqGEpKnsG+x
 DwZkHYZDTWVkWt0UbLHjRtrhbdzaX+aCy/7mh6bb5gMVkR/QK+9b0E6sO
 0Hkfse2e/W7+BfJXXXKsbTv1kNLRnyQjMr9WduVNIVPdPgpyxRDHAfxBd
 6rGmBZNBihQBDtUa8mp7F+/UPf5vco7+f8Jvy+hytRXGDgIG0l+o6GG2N
 8mufizbR65jI7xcjqUnNEL1RYgSMW2T/VB1Vvgn4SF4ybYCYCeAIncmIF
 KmDyILswkGffox7LP673jkgAxHE4pLX8JX35LAjuTqBRB24dYVwbP4MGl Q==;
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; d="scan'208";a="154214022"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Feb 2022 23:37:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 23 Feb 2022 23:37:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 23 Feb 2022 23:37:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZ2RZCRV0qW9JEUBo0nMZ99R81kPJQZshMoZRvJRBCOHlMFbu1T8iizxt3aX/vJnORAIwq9m8YN5Epe2i/D9yIvCdeMNGfbSMTtJQD+TFkun8q6THUteb5AU9VYj9DNqnmIyeQoVRVuHkTMnH1MgCbduH5rP+B47MKMg70aZP9edmvK8w2C535AUsktO/upXYi+2gu2bHGAmiOxG+a2To4D2b5sN2NDGTtK2ALKrTGYpQ34dZ5mgINLs4TqeSQSQeTFOq9JtdYjpFDYvzVbccK4w28TMq83wEgWA/9FKoVNc7vvB3uf/VSk91sHAaMZBjLuNXhxYd03oltYfjtb3AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzPeNkJogoD1nZY6sfoIRHPA/mOLH5eN1O3XBXT6Uwk=;
 b=JBnk0vSFzGuSdnZUv0IbbGWwaYnq1Frp3cF8nywJFQLQWzmO54NzYLo+hKpS3Cf4nkqiHuaq90LzIvEEVTD6x2kpbzX2XbM7tHQusImPOHJmCgfYfkoHqnSglzvMgKX4mKcnGvJaWB6HpZY/zNvY6pJ8xLP/h4/66J30qhGiZYeJS/Piao5EpdyeAQj1dw89VSdWT8hwUsCO6PLKag0kHUlFLeJj2GNLtqjkTB74kz70uKUYka1FcRKs/X/UAOJv8WFoaNNsQh9x0o2SgZoJ4/uPrSn0Dd4Tyj0q3uC575LMDU2DK7GNtF1QB9bXq49IYyUmteEznmr/IZEW/kJ0oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzPeNkJogoD1nZY6sfoIRHPA/mOLH5eN1O3XBXT6Uwk=;
 b=Fyo5ofo4korgJ1vaKpDFykCi/ISJ7iL/7/6pX/TGoUHqZNqqntaJkFB8t29cLrqk161eJk/hDKJjZd9YWxGvK7m/v5cwySeAtewwVYRT+SWfpL0iL6xLnXtwUMWpfksBSm9JqaHWXewvA+q5Tvzf3xjIo6SFmguEqi1PSiHccFY=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by CH0PR11MB5331.namprd11.prod.outlook.com (2603:10b6:610:be::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23; Thu, 24 Feb
 2022 06:37:21 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%5]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 06:37:21 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
CC: <michael@walle.cc>, <broonie@kernel.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <Nicolas.Ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH 0/4] spi-mem: Allow specifying the byte order in DTR mode
Thread-Topic: [PATCH 0/4] spi-mem: Allow specifying the byte order in DTR mode
Thread-Index: AQHYJ/PF9hATniilJUe3fAFeGB3/D6yiQgoA
Date: Thu, 24 Feb 2022 06:37:21 +0000
Message-ID: <779069a1-7389-ab70-9f03-81090d0600ba@microchip.com>
References: <20220218145900.1440045-1-tudor.ambarus@microchip.com>
 <44f655d027b49b87065915f6ba2744d2@walle.cc>
 <81d7c569-d6c2-9167-e007-eda72f34842b@microchip.com>
 <23fbbf2dde387e3832b4ca23d46816c0@walle.cc>
 <7cd74ef3-5a7d-4e65-3436-ee3399ca56a3@microchip.com>
 <e39d06684b8f3a63103f40f0e99e030e@walle.cc>
 <3cd510ad-a6ab-d4a0-92e3-9156a0c7ddbf@microchip.com>
 <20220223183849.xcwciv2ybnkdnauk@ti.com>
 <6eb179ec-0b12-de30-829e-83ec6b964f21@microchip.com>
In-Reply-To: <6eb179ec-0b12-de30-829e-83ec6b964f21@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14af72ce-5adc-4cb6-0d36-08d9f7601c47
x-ms-traffictypediagnostic: CH0PR11MB5331:EE_
x-microsoft-antispam-prvs: <CH0PR11MB533139AAA73A212D6FAB69F1F03D9@CH0PR11MB5331.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FzUVZb+q7qUa//vnrCnqumkdKFRP1AnErB8ER7FmMcVCWP0OmWTnU08nyjJ39xEt3SBvzRXCGhf6nWW2UMtxe6o+oW0gCiTv45RVWyCcfD8N5v4g20yFI/A2MAgeMpuURT2bEGjxtdQU6Tm1szoEidqZDLmt7Im2hikyn4dC/ImTYMcbq87vCwaAAiq7ZJ9cRRNZvASmGOmT9oOFfaek/siKfOY8+u2TodmZUZymNevTF4EhQ9qQp69iTJGfo+v6ESaMi0crb7uerGCTtTVMYlDM8HapixKkKwzfILbSRz6pg8GqvW79XNyv8enXdVjku0yPcYCvUPbczYpRDYbwY1pAQFB9zHXq6Ks1Hv/lElOXCC5D3DWeNVDoEBT47xs9+HAlwUOFa+H5uRDniVihzRWvMLWakItTkyRgWNz4jAdo5SQHSDOrMvYpr91+XN8FF7oI68q/xCzpxW9dpffAogNMQIpNbQz+8vb7+f/nfr9rgYYi4ALNMTgzhnBHR4TDyv6QPfrsaUt4mPjdgRB3FqKAj2Spc9D/eTtnBkJXizPu3CZyGu2hPHloK3Jkpvs8ZzoQ4R7JLq0j9Y8yUyADFp3gFubbBpq7tFqtbJ9tLyOhNagSzjZuh9kYJofJy2jbEFxz3buAvzenMyTjxJwmyDVI2NjLdmVkrtt91J/L9B3VFTNOmXklfz7Ay0GpUpW16JXcCM4dnfp5OL/Py7brOrZpqEojlF7nFL/7axKLX7fx3djInxbWrMjpPqB9tOJVh7F409cnqX1k9P9QidDbZ8Ob3wbcXbqllldelYdM4G5EcLV/s9ubez/lKfQwKWjIqw8RbxN5ouGX/HKArmHix2vkjadHQgtX/iYL5oUk5Zs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(83380400001)(36756003)(6486002)(6916009)(86362001)(76116006)(66946007)(31696002)(966005)(508600001)(122000001)(66556008)(66476007)(91956017)(66446008)(64756008)(8676002)(4326008)(53546011)(26005)(38070700005)(6506007)(38100700002)(316002)(7416002)(2906002)(8936002)(54906003)(2616005)(71200400001)(186003)(6512007)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnRxdE9NdEcvanV1Q1NKSERqV3FjbzdyNXd2aEtFMkxlWU9KUjNaQkhXMVJI?=
 =?utf-8?B?dmJMV2xOOXVoVFBaYXF6VTdTQ1ZTWWQ2eG05UHBncE9aeTlVeTduNnl0VVdU?=
 =?utf-8?B?MXp5NkJjZnJnQWtCRTdBQWZOeTFGSTBhcGxSWVFycGo1K2hmUDZydFQyN2Qz?=
 =?utf-8?B?MHQxNlAvTU1vTFRBVkk0U2ZocTlxTENuM2RwNERpMXpIZEU2aWpyTmlFZ25K?=
 =?utf-8?B?K3BwcUVKTFFBcFNHUEdoODR6V0grNHJlbTBSYmJMWEo2d3B2ZStRSHpUMFBQ?=
 =?utf-8?B?TkhWZlFtcHljYjVzczNqd09VNzMxQTBGQXViSllDWm1kem8zNkllbkd1aytp?=
 =?utf-8?B?Nlg3dWFpTk1ZUzNJaDExTVVqSnlGOEVqWmd0c0RCeE1OM05WQ0wxRTVvcHJ4?=
 =?utf-8?B?UXIxd0ZCcDE5aEdQU1Q4QjRJcGYwQ2pjVndiOWEydFc0YkxtQ3N6dHZsQlVY?=
 =?utf-8?B?UklDcUUySFE4SFVmbHhiUTBZLzRTUW5uTFdhWHpZTTlObndxSXA1d1RKeXNs?=
 =?utf-8?B?eWF3bGVmVVVpWTZ2c3l6UERJcE9neEs1TjUvVzZHOHZHZlVlRkNUcTQ5a2VO?=
 =?utf-8?B?ZUFwL3hEaGpEYnNRL3VOWmFBa0RYNXJuZXJIVFRuaEd3ZmRlU2JzRHBLakJY?=
 =?utf-8?B?N3Y2YU56NGt3NE5KckYwSWVwVUN6cm1GbG1WMUtkRFpJUXFUQlJtSU01b3U1?=
 =?utf-8?B?WkRuR0RJSlJXMysrQjBaTWoxWm50WUwxa2VlSVpyN3NuUkNaQnplN28raEFN?=
 =?utf-8?B?L1kwelVFOWM5cEF3WHgrY2hoSklta0JoeXMwNkErZy9IdzRJdXVqTktHSnBB?=
 =?utf-8?B?WFd4NnVxdDlSZm1NMzF1aHJ5YlVQY1RxRnRDZmFYanhTNHFxaGpVU2RtMnhO?=
 =?utf-8?B?M3NFZ3dtY1J5NWlrZDNBKzJoR1ZpSjVLWHVSMlhUOHl1WDhVTlI3K1ZCcWZn?=
 =?utf-8?B?WDN4b24wODRxQzBDR0wxMmNNd1BmbUFRM29mZ3dnUWJFc0dSZ3FMYkRkRmg4?=
 =?utf-8?B?ZXhrM2lnR2JtNGlpWjNmWWlIY1NaMnpDR3A3N3VEYktJRGlRY1VSQmt0T2xT?=
 =?utf-8?B?WWdCSG8vcEtuSG9admpaRUZDVWt0MGtHME5ZaU9HTkg3RkpVeHYzM0ZGOGMy?=
 =?utf-8?B?aVZYdkdEdXhuNGtFbUNKRmh5cGtHUmZrTjlpSDM5NWdHMGxLbW9BQ051YkRP?=
 =?utf-8?B?cGswbzdaOGp4N0l0K2lKVUU0dUNuUzRiSHR6SEJMdUYxZmNMa05BbnFOWFAv?=
 =?utf-8?B?SzNLWGN3T3Ixb2hNWis3WUdEZkM5cnlCdW1sMmFtbGFKRkk5UEhYTzRTQ29M?=
 =?utf-8?B?VzZOcjdRZDhoYkhtUXc2MzhyU2xXS1U0anFkN25PMWwyTEZoZnNzdFREYWlh?=
 =?utf-8?B?clUwOUhGc3pFVXBIdHlhYWZMdlozQ2hDSDhUYXNESjBMa2ljZnhYWVkzNnRu?=
 =?utf-8?B?ekRoRlE5OFRKTE1pTkZ0VU1xV3d5dmF3NjNsM2JtL1RCaUtFWHpYRTN6eitJ?=
 =?utf-8?B?TkR2Skl6Vnd0SW1wZmJGdy9sWWJMVkJqc2JiV1k2N3NJaDBjWWVkYUhENW5a?=
 =?utf-8?B?TEZINWJBMEZtS3Ywb0RmTzJ1UUJjMXk1RXo4eUEremlRTnVvd1FyQUs1VjF4?=
 =?utf-8?B?VE5yY0QzaUZ3dGMyZkZsTUY4SmxsRHB6QVVFWWpZT243ZDc5eTZxcThMUnZ3?=
 =?utf-8?B?ZmFmWHkzZTJHK1orQUZGVWpjZXNsUlJqNHNnYTBsbEFSeGJJYmd2aEJwUlNs?=
 =?utf-8?B?WFp0YW5Db0d6dHo1MGd3S1R3Ykhmd2ZKRlJNRFY5aUxwNFJmUUxmbEFvZFJJ?=
 =?utf-8?B?ODZJVHlNck5oMWMzRTd5SG1XNWRLNHUrQnpWeENMYkc1L2xCYWMxSE15KzV3?=
 =?utf-8?B?UGg0NDhkOE9mcHpjTGNuODBjNUJsZkFlK09SRTB0UmRIQ3lBZnN5UUNLdmRC?=
 =?utf-8?B?b0V5MHhtVnJZNW91dXE5SHNHUzdkdElEUnNtVld2cVlQZFNndThEejNjNDY2?=
 =?utf-8?B?SnBkQUhtRzROOHhBR2wzdmRBd2o5QXhkQWc0aFBuS3FBQ3A1a0dxclNOZFQ2?=
 =?utf-8?B?R0pycFgwTEUxWWF6M2huQWNwMUUyR3grQlptRGhGWlljcGhRZlpXMDhZVktS?=
 =?utf-8?B?cnR3OStvUDdWZ2NXWUVBK1ByaWt5OVRMejlzWm0ySVhtVVdpUStscEFaRFky?=
 =?utf-8?B?c3g3QlFwYitrbG9KejB6N09tUWZ3M2xmVXV6OVBCOTl0N2JaOHlKeWhPSVB1?=
 =?utf-8?B?NU91NEdYQ2xmdEcrMVRtTVpYeW13PT0=?=
Content-ID: <509C0B81FFA97E46A08B69703F58765C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14af72ce-5adc-4cb6-0d36-08d9f7601c47
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2022 06:37:21.2350 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aIGELz5wSv1wtCbgUKrkFHVO2L3r5ZHyOdAcRiOGDmZy+y33Totdiu1uw5tU+Qnp6fJIWh0twcnBReAfj5pnvNKyTHuX6xvdcOK1JlBwJPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5331
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_223747_888765_EC5B24CE 
X-CRM114-Status: GOOD (  23.28  )
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

On 2/24/22 08:08, Tudor.Ambarus@microchip.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 2/23/22 20:38, Pratyush Yadav wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Hi Tudor,
>>
>> On 22/02/22 02:43PM, Tudor.Ambarus@microchip.com wrote:
>>> On 2/22/22 16:27, Michael Walle wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> Am 2022-02-22 15:23, schrieb Tudor.Ambarus@microchip.com:
>>>>> On 2/22/22 16:13, Michael Walle wrote:
>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>>>>>> the content is safe
>>>>>>
>>>>>> Am 2022-02-22 14:54, schrieb Tudor.Ambarus@microchip.com:
>>>>>>> On 2/21/22 09:44, Michael Walle wrote:
>>>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you
>>>>>>>> know
>>>>>>>> the content is safe
>>>>>>>>
>>>>>>>> Am 2022-02-18 15:58, schrieb Tudor Ambarus:
>>>>>>>>> Fortunately there are controllers
>>>>>>>>> that can swap back the bytes at runtime, fixing the endiannesses.
>>>>>>>>> Provide
>>>>>>>>> a way for the upper layers to specify the byte order in DTR mode.
>>>>>>>>
>>>>>>>> Are there any patches for the atmel-quadspi yet? What happens if
>>>>>>>
>>>>>>> not public, but will publish them these days.
>>>>>>>
>>>>>>>> the controller doesn't support it? Will there be a software
>>>>>>>> fallback?
>>>>>>>
>>>>>>> no need for a fallback, the controller can ignore
>>>>>>> op->data.dtr_bswap16
>>>>>>> if
>>>>>>> it can't swap bytes.
>>>>>>
>>>>>> I don't understand. If the controller doesn't swap the 16bit values,
>>>>>> you will read the wrong content, no?
>>>>>>
>>>>>
>>>>> In linux no, because macronix swaps bytes on a 2 byte boundary both on
>>>>> reads and on page program. The problem is when you mix 8D-8D-8D mode
>>>>> and
>>>>> 1-1-1 mode along the boot stages. Let's assume you write all boot
>>>>> binaries
>>>>> in 1-1-1 mode. When reaching u-boot if you enable 8D-8D-8D mode, when
>>>>> u-boot
>>>>> will try to get the kernel it will fail, as the flash swaps the bytes
>>>>> compared
>>>>> to what was written with 1-1-1 mode. You write D0 D1 D2 D3 in 1-1-1
>>>>> mode and
>>>>> when reaching u-boot you will read D1 D0 D3 D2 and it will mess the
>>>>> kernel image.
>>>>
>>>> But you have to consider also 3rd parties, like an external programmer
>>>> or
>>>
>>> Why? If you use the same mode when reading and writing, everything is fine.
>>> I'm not sure what's your suggestion here.
>>
>> So our stance here is that we don't care about external programs?>
>> If that is the case then why bother with all this anyway? Since the swap
>> happens at both page program and read, what you write is what you read
>> back. Who cares the order stored in the actual flash memory as long as
>> the data read is correct?
>>
>> If we do care about external programs, then what would happen if the
>> external program writes data in 8D-8D-8D mode _without_ swapping the
>> bytes? This would also cause data corruption. You can't control what
>> they mode they use, and you can't detect it later either.
>>
>> I think there is no winning here. You just have to say that external
>> programs should write in 8D-8D-8D mode or it won't boot.
>>
> 
> How about swapping the bytes just at user request? Maybe with a Kconfig
> option.

Michael has suggested on #irc to always swap the bytes: if the SPI controller
can't do it, to do it in software at SPI NOR level. I don't know what to say
about this, because JEDEC216 just informs the reader I guess:
"Byte order of 16-bit words is swapped when read in 8D-8D-8D mode compared to
1-1-1 mode.", this doesn't look like a hard request. The downside to doing
the swapping in software is performance penalty which will make macronix
users have second thoughts. I don't have a strong opinion, but I lean towards
doing the swap just at user request, regardless if I do it via the SPI controller
or in software.

I would love to hear Macronix's opinion.

Cheers,
ta

> 
>>>
>>>> another OS. So, there has to be *one correct* way of writing/reading
>>>> these
>>>> bytes.
>>>>
>>>
>>>
>>
>> --
>> Regards,
>> Pratyush Yadav
>> Texas Instruments Inc.
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
