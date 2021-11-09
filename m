Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D867C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 12:34:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1657761051
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 12:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1657761051
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LBNRdGTWR0FmZxzR+Y17nAttQKICR9Kk8uJ4opU1PU=; b=nTC+GRXxVngTew
	NLpvTLSZXM2h4O6W0Dqa39rf2HrbvyxOS4uovPaPnNgf0ulSDVnHF3ir+kVqf1u/t84hPtKJK0Met
	Jg3dkovAtDI/KTABDN+5HJr4yRN3QcYchAnKF+bkRXXa/TUZJ5N3VfWaRq5armAnCyO6YW9ZOyPfG
	emTypsFeHs29ddD4p2bDDPtVXj8QDjAKtZTGZYc5pAseHdYaHt24z4Ux2GTpKP6NESkLNuVPVG8nX
	WCAv/ggJ8KGoX/M3d1ofr0ED97A3s+QT4zydM6n2LhG3Bjd2GTVr3A5sq6T8/J4IRoIgw6vVho0pq
	Y24bs5DYc40Fku1mfQCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkQJe-0022yg-SD; Tue, 09 Nov 2021 12:33:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkQJc-0022xt-3X; Tue, 09 Nov 2021 12:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636461208; x=1667997208;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4Wn7TZijkRcwxHD4GCnJ51DiYya7iGY2vxcoX7WvAHU=;
 b=S+EIAHkf9+zvi0O3xuI70HAZP7J2Rw6Hib/L+6dPIBpRUlpZPswhJFzw
 muXfo6lLjvEtdldQmdvasraMP+xHhIsucFBQ4Ctbcx/gmnJUk/+4MLFfG
 gW/U1WQe4VUaTwS07ObHTgcpSPiJ3bKGJ3KLgIkAomS6L/9wSsUzw3aqA
 2hiLuQCfvKxabP70fs7K2cx1OYSR2CQypWN5NlbS3rcnFDm4HkvEiVyol
 fEdZSvSfYZYapYhnSnWIoHe2prNzJOks4xvnIgVYUSJpdXt3r8DZqnBNg
 fa4bn1vA6PaDngyFtKmaMWOeJi3v0pb5RXxIkp7BoZlgDZ1N9PsSCS3cZ g==;
IronPort-SDR: nmWMBVLoaO4Qaq0z6ByMkgd1SmaW40grq99iEMv4WqVhNs0GbKIUOSPQsoVexEXm5oQdSISx6G
 b7/nn34Lo688NrZTODWHynVHGvOV4eOZ6pb6C1P9LYjWNasSPxvlgGlkZp3b3OjhlnYcAanDSI
 MqXfOqbtbmkV0pTqhHOARdDisk5dihZMcpyR73EjuVTm2uFYk/UvmV2+E5KvSC/mJ0hSIPqurM
 232zb2bqjjC7pLJha6YuBLZCPIDVCHx/feAHheOvNyOe03du/602hlXgWWEMIs4ycHsLtBS6j5
 x2h5VeJAdjnPhPAqyN01Sycw
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; d="scan'208";a="138505261"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Nov 2021 05:33:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 9 Nov 2021 05:33:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Tue, 9 Nov 2021 05:33:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFyGsQSmCN8mEkF8M2VTB/yBDScAWuwWkbyNvb0bsjDtmbyyivh/RMAbd4unSS/KvBikQD9+5TN/D6pimPefncu0xW1Uo1qkCWGeo11/d9f7mtAPgAij5s+cypx3XhkpnklAtaSn2doAC+OaYdnwU0lAtc9fq9PyyfcksNuJVY/QgnbNVOejscSh/TEPq5KE7fVvUskbjhQoBSxtmny7K+Wh5iVj+cbsDkb/hY5ufWKB9JepkRGEjevOToPbSkvQt/SpZzLrqY8kRVPp2A9p5jj6vcAXQg+UMKXYUaHNszQ/nRM3HQUVQ0DAEP5b/trnEU2mkKu33kzMrM0f/cn9gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Wn7TZijkRcwxHD4GCnJ51DiYya7iGY2vxcoX7WvAHU=;
 b=cVqRaq2rax64kyRonigw+nz+HyaVMcwyK72P4+Msv7V2qB0jv3D9x9nSb2HF8lG4aKZ1mSDWBokzjKj+UCadoiQbPVoAYajuhG5GzgbO1JAJAnjoiJcgePyCuAjbJ0XHqyJHdd01++PM7O74UTC5BlU43GWgHnSVZg6y+hcdc3FNX8Q1pTaN2GQqZPpaNBtWthrUkfl4F1bDgSlUCfDkRNtUKWktfOZjDhdjIrAZ18IAawx5wrFnly9Mco+i9EduZtIxm0Yy3ZODX05zC/kF168GQ8v53mjeDVmu/s3W0wlF9fyweOaj+sIS5/Ti+g8PWWmPoOV9AmRsJcWfhVbttg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Wn7TZijkRcwxHD4GCnJ51DiYya7iGY2vxcoX7WvAHU=;
 b=X+n9GyIbFUsUj7KNo8Db7/r1Jo0zEqV8czqZG+GFwYi0IfwVa+4kP10BpNTcKGeF2lo1oDL4EfvnIGZv+EW/jwn4M1/CZ/nIUcSm39w52LYq5+xLoefMQP2tf5U5wuC2QAm5Oyf/oEqz/F4BNcHt5MEz9UODTxEwwoPeSCetAno=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5179.namprd11.prod.outlook.com (2603:10b6:806:112::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Tue, 9 Nov
 2021 12:33:22 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%7]) with mapi id 15.20.4690.015; Tue, 9 Nov 2021
 12:33:22 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v3 20/25] mtd: spi-nor: sst: sst26vf064b: Init flash based
 on SFDP
Thread-Topic: [PATCH v3 20/25] mtd: spi-nor: sst: sst26vf064b: Init flash
 based on SFDP
Thread-Index: AQHXzOq9F5LGRzZw3UGPWta7Y8R7tw==
Date: Tue, 9 Nov 2021 12:33:22 +0000
Message-ID: <804938ee-9726-8591-0efb-e9ac40a3d5e3@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-21-tudor.ambarus@microchip.com>
 <11ac4016-94ad-39ce-e845-0324543065fa@microchip.com>
 <feebb504a3d6f27061a1e2faadec8fe9@walle.cc>
In-Reply-To: <feebb504a3d6f27061a1e2faadec8fe9@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 737ed0c8-b94d-44cd-b53d-08d9a37d1e3e
x-ms-traffictypediagnostic: SA2PR11MB5179:
x-microsoft-antispam-prvs: <SA2PR11MB517989EF2FC455D4C5B1605AF0929@SA2PR11MB5179.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XDoLNLN/gcJ3OQJqeuZyXNRJxS2WmBPdKBe2rMQpuAdeYjKYGZxOl/EomzJIvY64gaTx9c10EIr8iwjDHRRdSb0IEGcXS5a9yG1G6wCaaW7fuIknvy4kOgXl7UH1zpxPorOmbmb7E4eDk6mtZ//SKaze6b0KMyaxjginGfG9KK7bZqiCkTb/MXD6hEPju2/qoDjF9fVftHHH+vslLBYhyRjyDRkjM2u7blbD3w6ygcCsAulgfCs95TY41M2swfYGtsMVlAh+3Gaegcvlf9iXfnmagnmfJD57zvgDBvH8cID3MFMjBIRioZhsmEPXOZ+Bh1hbhJ5GGF2In85IcOdlBE7MwdV09NjBq5vGMmDuZnEXIu2GOGCloQJR8YdZ9qYe5bZFIEBDxA/Np2uy20zigPc6KrVAaTadlUrfjqG7QDZgrXu8Wbc/neNn6aO5JAEYJfRAlI3zR92WNKoOeJ3zp9Z6iGYhO5YKqj0TJJ65bguLxFhQGKnPk3EGjXWker25MkUEc1Ebks1vknQ3oQSvFcKAXeJEoLorkWyOnSzIhCZ3ELDS1ilTwxCjcsqqfEBs3bJYWEldZlIh148tAhzGFF8wyTU7trmJ1Jc9LD2x8fGi7X1e0uKGkQczQezI7Ob/ZGoZD75kHgOej3qHHCgW2VLDJQ/9YlZj5OqHXNqL5c9dUNvhXVBBQXoOsZ5Ex3voQsmKQXJVBhpRYKsiHQY16dhrtq3gv5gBw9W9zR1rDo2eRcuW1F6/hb3Dsd6Vs7Rv8f3GZd8HPzY11dnowzyMmA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6512007)(76116006)(53546011)(8676002)(36756003)(4001150100001)(5660300002)(66446008)(66556008)(66476007)(2906002)(66946007)(91956017)(64756008)(38070700005)(38100700002)(31696002)(2616005)(6486002)(122000001)(316002)(508600001)(7416002)(8936002)(86362001)(71200400001)(54906003)(4326008)(186003)(26005)(31686004)(107886003)(6916009)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nk9tSTI4UkZCVkJIei8wZ2xrWFQ2V3RuUkloampCVmQ1YTduajd3TzIrZ0JT?=
 =?utf-8?B?cVZpT05GaDRJczgzOGxvNWFnMnU5S1VxSTJ2T0FkOFlSZkp6SEJSNFlaNEVv?=
 =?utf-8?B?WkJBa21KM3BWaXhTSjFTUFlRM1BucVlHWndxSFNVSkh0SUU5NzY4VFRPM080?=
 =?utf-8?B?S1Z2OFpQWUR5clByZHd2dWVESDVQTHRxSllJWXhpMzM4U2Z3ZUVIWEdMV3lu?=
 =?utf-8?B?eTlRc2F6WDlTUG16OE9IakhlMVk4ejhrK3BwQ3JTQk9iU2k1RDRDOGZqcTlx?=
 =?utf-8?B?d0lKdUVDaEowRGpOZU9KYUdITHVITW9zUkF0cVRqQzdWY3puQU14SWNwOGxN?=
 =?utf-8?B?bjNYcHVKb3Q4RzFpMkdPK1VtVFpXU2ttMytLQjFhTDk3S1ZBSXBFenR6Zyth?=
 =?utf-8?B?dGNLaThwZHVGUkhGZkZoWmpYZklyMm42eHNTTnpZSmcxRVVhcjdYeWRIV0F5?=
 =?utf-8?B?R1lBUXNRcVBDTjJCejNQaVY1UUxUTW93YlZ4NUJxR0ZwUDN2dmc5TEdaSVc3?=
 =?utf-8?B?Q1RvSTdFZ25UaVpkdmxpZUNrY3B2VUttcTI5bks5RVRWZjRHRStlNmlCUWo1?=
 =?utf-8?B?UlB5TU9rN3ZkNU1JdjM1Y21YWkk0a3NVc05OZ1lXNXViR2V2NjhESjgzSVRp?=
 =?utf-8?B?MGIvY21URVExblFac2xYaDJYQVYyVWdiRU5mREwrRlV1eHlhek8wVy92LytZ?=
 =?utf-8?B?R255Zm5uMFVGZTF0QUdGVDd4cnc2Qmxibzk3YzZzZzRxUWYwY2dxNGRHa2cr?=
 =?utf-8?B?TFZvZVU0cUdRL1BGcmlPM3pCVHk4K3pxUHhyQWhiMElYdXFMRzJYeXdud3Br?=
 =?utf-8?B?WGwwOXd4cXJYU2tJaEY4VlJLeVEwS3krN3lLaGpwN0RmTXgyR1o3eFExUERQ?=
 =?utf-8?B?R3RsRWxnTDNucjZoRllSUTFUR1Y3VGdDT0RLeUc0bWZCcndQUG4vVFpFUWhQ?=
 =?utf-8?B?aXpwM3h3ZHJEVm51UnBtbllyZTdSNVpSc1RpT0E2VisxOGhrQU1hLzRHdWgy?=
 =?utf-8?B?WTJSMnV6VkZuUGZXVERrQitXY3pXZXMwRlBxMVFPeVRObk1hWVZ3Q3U4Q25o?=
 =?utf-8?B?bG9iSDFoQ0IyUTE3N3lmdkt0ZFJPamd6WmFxdkN3K0lvRmVHSVlnV2ZkU095?=
 =?utf-8?B?Vmc0TW0rUFNneU5RbWtqUDFTMHR0T2dkcXN1K1BRSDlEcmJCVi9EY1ZWSnRS?=
 =?utf-8?B?dFc3R1dCUWZNcTY4RFBQbWwwcmdic1ZVclQ4M2R0cU1DcmhUTFlRVElxdkY1?=
 =?utf-8?B?L3ZDbzYwV2pVd3UvYndnbHdxL0t4Rno3cXphajJ5RlpRbU15ODZEaEluOTRZ?=
 =?utf-8?B?eis5RWR0djRkVFhTL2oybWZ4QUdPcWZzdGx3TDEwM2xIZms2UEZxb1c4WjFm?=
 =?utf-8?B?M0Y4d0wzZGh3S2VDUkpoN3hJV0ZpQ1BuN0I4aENXcGwyUS9vbGUwcU9MWUJr?=
 =?utf-8?B?dDkzQlI5ekRwbnF4T01mbDMxL2hBMFZveUV0VDBFajF5SUQvUVZjVGU3eWZ2?=
 =?utf-8?B?OGVnQjJ0VGk0cjN1bzY5SUFIUUtXQlEzektCY0NKenJDSXYrTXVqd0NtTTRM?=
 =?utf-8?B?RnQweHFJNXNJZDNTNHFrMXJaN1JOTzZhWEErRWIxd3huK3pJK1NRSmtoRysy?=
 =?utf-8?B?dGNMRi9iNG1rZWwzZ3I0NURXSGdCQ2V5cytiMmt2dmlEWDFVSDVjalZTV2pB?=
 =?utf-8?B?aDFsQmlybGU1RlRKRElydVhJNktDMW5RM1V4WkdlWkJaSmt3YUJhSHd0bkho?=
 =?utf-8?B?MHVIaHhaZFpWOGliUjViVlVNakx6dUQ5VTBKMFF4L1dCQTU2bmMvMWNSc0V0?=
 =?utf-8?B?ajdVMmcyMHc1SkVYeVVJR2pybWZRMFd1Q2x3c3pBaUkwL05QckZlSVM3YU56?=
 =?utf-8?B?Nk1CTnVmMjJZejZIMklmQzFNQTByRzBTRHA4bWNBNG1CUjJjakN5LzhBTkR6?=
 =?utf-8?B?SmJrM3duMEk5Z0JaWmc5SXhUaW5rcCtkaFd6R0QrMHlQaGlTSDI4VlBTbWVM?=
 =?utf-8?B?YnpJZWJVaHdHOWhZVGhlcEVORkJCbTQzRVVrMm9pNXk5eUplOXJmVmh4NUJy?=
 =?utf-8?B?d1h0VXBxVm9GREtZNDBLTGhjOG5Oc2h3aXNNUnQydkJZVkFwN3pLbVI1R1VQ?=
 =?utf-8?B?UlV1Wld6aENXenJJV3JLWnJmbE5IVXNmVFFSN3pLaTg3bCtOTjNEbnZwL0lC?=
 =?utf-8?B?dUpMVFBpL045eWVrOGhFOTJPeVhCR1ZTb3FCNUtCN09MWUdjWmsvSlp5ZGsy?=
 =?utf-8?B?ek1QT3Y1TlhlK1BRSDlkVXYrTm1BPT0=?=
Content-ID: <5AFC438F4070924583B25E8F355BB942@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 737ed0c8-b94d-44cd-b53d-08d9a37d1e3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 12:33:22.2405 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pU5PZD1wKq8X4EFVmst3Yckok1rHLM8a7sp2pG2HgPXxmoOxP8oUlws+c8CcfHsOCHVaRQ8hb6aZShTnqIs0ANUFlH1ovptqx5GVU+7s5YI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_043328_248631_85D726A3 
X-CRM114-Status: GOOD (  13.29  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11/9/21 2:25 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Am 2021-10-29 19:31, schrieb Tudor.Ambarus@microchip.com:
>> On 10/29/21 8:26 PM, Tudor Ambarus wrote:
>>> Get rid of the static initialization of the flash parameters and
>>> init them when parsing SFDP.
>>> Generated a 256 Kbyte random data and did an erase, write, read back
>>> and compare test. The flash uses for reads SPINOR_OP_READ_1_4_4 0xeb,
>>> for erases SPINOR_OP_BE_4K 0x20, and for writes SPINOR_OP_PP 0x02.
>>>
>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>>> ---
>>
>> root@sama5d2-xplained:~# cat
>> /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
>> bf2643
>> root@sama5d2-xplained:~# cat
>> /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
>> sst
>> root@sama5d2-xplained:~# cat
>> /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/partname
>> sst26vf064b
>> root@sama5d2-xplained:~# cat
>> /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp
>> > sst26vf064b-sfdp
>> root@sama5d2-xplained:~# hexdump sst26vf064b-sfdp
> 
> xxd please, and md5sum or sha256sum or really any
> checksum is missing.
> 

right, I forgot the checksum.
Just curious, why do you prefer xxd over hexdump? Does it matter
which tool we use?

> same goes for the other flashes.

ok, will do.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
