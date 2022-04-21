Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DDBC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 10:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CfXX9LwQHzwkGoOUrWRCWd/pPUwKwXi7MNGmongNE6o=; b=0XWFrmjzkgYngN
	qCrhhCG/PBPZdjLCwd7DITKjQRam/caYAf1NAjd0P+8Hqp0y+Zv3sIdgCczaGxB6d/IXsyYv8s8uC
	ubyGUZqt8eX7+64h5g/jXlLd+dko9McPNVcubvDkWEfhGoDbx8I0q8rOeOE6y1Kzd41QaDTMcFf+A
	wVItF2g0ov6TO04R4oRTeJd4IAZXQoSaGMOAWkthzYCmY3Bk58kBAmlxdc7940hMdXCOECFxVfmXd
	jOoFsYxY04gjvDHdd4v/hihDasLqQQR+/y+fiI4SxwfBktes/0OmKbXjq4zwTXwvf6kc/udVi+Y5m
	YNSrr+q0unujmZslUsXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhUFZ-00D3ei-5i; Thu, 21 Apr 2022 10:41:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhUFP-00D3bU-45
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 10:41:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650537675; x=1682073675;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=QwklllgAfe3lP1Kp/+IXGpJoq6ptimT66WGuqm8wVtA=;
 b=YLahc77yeMbBpArr2MQyQekoONO8br6FFQpB955guQ7/KSYv+ZOkrvMU
 6ZsZ7mCsg3yvb7bsQ9/gcb7oIO5on0UfkumkM3HX9qzt2Q37+VL/i1i//
 Ept2MZSwIj5WkBoCos7/XRTYd/Wey+/leU57paxtsD1L5W6y4TtojGpyv
 8pPNFTrsMYqm6k85HMG3OnAIODC/eT5q/47D5aw22oudZI0rMIgfLrJgl
 EP9mGX/eXZQoGUqcuwQzumPRLoDo6885RAH9tR4hENc2xcEna/xFmTPnk
 bjmuH/Ec3LVJZhgB9Kh9bJ+vTKExVFCvKt9lFtRUfhWJethZjs02ZjVE7 A==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643698800"; d="scan'208";a="170409333"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 03:41:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 03:41:14 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 21 Apr 2022 03:41:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdbpFEXhkfZy4NRk8siQP9J8KEo8B9AmTBYXUf02VnhSdvmmLrTyiooqipmxkqUl6NDXKd6Nqj0Oykd2pdfLDFb562h3iD5UTiBUhc35T9dXh2qqpg0CtOL3eFM+BuSL3ELnjssiY3OpOO+46rmR4vxbflcY/l4Vqx8Z9+CUKf81c7hWTHZYOqFvzsi1FUxi910GnINdI8aAXum0CRzWxlzjXlv5Y3fXJPN8uDb3jLtaUy5zA6nTA7QSRGvPn/iX15hWJftAWbhDZEXLf9szZC21MXTKrtduIl7YHARZVz/0fTttQsDeI9BgfdiWE7aCL3w1iLPNQk/K4oJ360OUfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwklllgAfe3lP1Kp/+IXGpJoq6ptimT66WGuqm8wVtA=;
 b=ORFklOewVgm9bBFEXW+omhTHEDq68TMAJGq2WHrHllpnykEE6m4lGGRzNS2wi2BQY5vzTLvZ3r9a/4UHIVR70EySd08Nrt4v5/UmNcaTO3CgZbXrkOdoUbRRwwP2rjWGQHmDD4UKGGLiV7c+7Bso+7qK+UxsHlZkquy9ElabLfRCZropwfiqi3dFSkveQOUxfpEU5XbKdFmFvA2EQBG84BS+JFOKfUGkbqYBmAV1QLTY+Xe1U1mqHM1d4NJcDEzTyb96h/cH5Nv2iMkCUsCNRrHLhUeNL3wDANw0tXB78f7IUAmyDT6WG1QszimmHIQMizrHn7uS/zqxAuBb1vbVuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwklllgAfe3lP1Kp/+IXGpJoq6ptimT66WGuqm8wVtA=;
 b=Qjt9ynZpdiaQJNatbof94Sr+IAW2XOYlj0cI+C/CHLhtVNPYj4eqdgdLAsxsVWNBSUeshrFW9hTVOb45dpYDdrDp29ESc4dR2C3mVw1ogHxxgSlmCXASRqIaNFQAISGSwlv/tsQ1Wc+pMOa1njoovR9ibuGCIZ3W8Q+Vl2el054=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by MN2PR11MB4208.namprd11.prod.outlook.com (2603:10b6:208:17a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 10:41:09 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.013; Thu, 21 Apr 2022
 10:41:09 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v13 2/4] mtd: spi-nor: spansion: Add support for volatile
 QE bit
Thread-Topic: [PATCH v13 2/4] mtd: spi-nor: spansion: Add support for volatile
 QE bit
Thread-Index: AQHYVWxPC1dIdG4rOEeRpjF1YXhMNw==
Date: Thu, 21 Apr 2022 10:41:09 +0000
Message-ID: <fff074e7-07ca-0334-a6f4-f4c0d57577d8@microchip.com>
References: <cover.1650532121.git.Takahiro.Kuwano@infineon.com>
 <2c04068f34e4dbd25da541062f5309b1d9878c22.1650532121.git.Takahiro.Kuwano@infineon.com>
In-Reply-To: <2c04068f34e4dbd25da541062f5309b1d9878c22.1650532121.git.Takahiro.Kuwano@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aba57dca-e9f3-43c2-f307-08da23837253
x-ms-traffictypediagnostic: MN2PR11MB4208:EE_
x-microsoft-antispam-prvs: <MN2PR11MB420867C7DE33B683BB842DCFF0F49@MN2PR11MB4208.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZikdxHDAVB0KsnFxTnOd8AFZ3GJ2ijZBxKh8Q03khPNoFgKzqIjDrC7lEaIZqB0Ln6gi8G67tcCIABAsRUUiQrNrn+Zg+12rKuQECtZboBn7xrcLJWMVJ483lVUG1udoCtmqpqsXrXVbMV9rUptz4iuKPEWRDooFt9ehXwv3pmWMPEN9wQCHWgTkOg1ax0VLYl6eLG9/0AkVRxqOpW0DquPosaBLjCZ6vXRIby3L2pJ7V2mE/CRmLTuGu0oeGnHwLN64rAjqu83+cIlYCm7Ld7EsvgMUZpEffHvc+lhWrHwXgHzoq7cP/viWqQ9XDrWIYLKlTKBN0PdbsP5eIMhkJ93NZ3cVthVTmpskJvFEpqumw4ukH+ApJhemtUSFGvGqw9/O+d7Mi8aTYQkZmDl/EHK0y6G70/Lp/JOhW/lNzkmRVBNWcQQx0mT2ABoy6ojZSInYPP6nmBc0PUbKi4dV7HG+lo3fCvAJGIgoltlW54F1F+6FuEGMoJG5StF/9exJgY1HZvk08bYkfo9IyRoIIAankAHpuJcSSnur9G18J8jTcbXlaJ1SBtOPsJ8kME0Fpfj/YPLmF5jahKmElbbryb5ew91Air48zHFch+3Zm9ALP0g+FjeZPlY8uvHB+za72wyJFRjAxB0WAx1MVF/Vpuvg8d4hmqvx/mxPs0d3dmNUnbqyQKPW8MLMdwe5ODL0VgyQemxmEIx3QRqevKrm+f5rCckSSu0QgIkkR7XLWfVWxMLYk6yENBcHSJAdAlzBD7tPjjTx+jTV5Zv5C/lc5wyckWEyPyNjU9Ndozo7ZfiZMUk3F+OeYDQ+cv9zMaFeDrV7yjo0WRRBHcI6q+8HTgNgyK5hRqk8TtJkpcvtxGU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(2906002)(86362001)(66946007)(110136005)(38100700002)(38070700005)(122000001)(6506007)(26005)(6512007)(54906003)(91956017)(186003)(2616005)(508600001)(53546011)(6486002)(76116006)(71200400001)(966005)(8936002)(66446008)(66476007)(5660300002)(8676002)(4326008)(66556008)(64756008)(316002)(83380400001)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXBnU0Z2WUFFZ1VCYUlKbGhwYkM2TTFQRjYxSGFkTXpPR3hFaFZwTWtQR2JO?=
 =?utf-8?B?eTB3L0o2bHRYNEFRNVJOWDY4cENKNUt2ekV5em0zUDltcEw1MXpEZE9wbUFZ?=
 =?utf-8?B?aHRubFNwbmNiNmxqcjVZS1lQRFJEa2tDdGlHL0JvMURqKy9VaXRZVkNGcFlu?=
 =?utf-8?B?VjdDV1Zjdm9FQmRZcnQ1Z3ZTVVU1NTI0SlBYT21KdDU2cVpKVGtxbUNhamFR?=
 =?utf-8?B?QUgyRVc5RDFYeVVzbFdBdTUwZzA2V2dZeHk5cnVjR1hWbVNqT0V1TE1CY0Yw?=
 =?utf-8?B?bDNqRG5PVGRMb0tTOFBXbUpoR0NWSEo3VUhTZExRZ1kwV0RzTHJxQ29kalNH?=
 =?utf-8?B?aWM0NXJVM0d3bGw0eDNhMEJoZTVKZGg4dlhMQXpYN09wczBLQVZLdVVkckh5?=
 =?utf-8?B?ZktaTVM3KzAxNjVLOEpDZDE1NWdpZzFHVUZUL0lrdUJSQy9LTU96d0swU1k0?=
 =?utf-8?B?cmdFR08veGt0a2tmS3IvbFRYN1JCNDhHaWFoeTh4YXlFNmZqVnVveDJvUGlV?=
 =?utf-8?B?WmR2RVEvbTZhbkdwOGM5R0dxUWRCYW5WQXR1NjNSOFpMbDU0Zk5BYjdOUGtn?=
 =?utf-8?B?eVU1bFZsTmFJcWlueUVBVkVrSktka3VtSVVyREF0NUZkcWhUOHUraWlGZjV2?=
 =?utf-8?B?SERGOXdnd0hPemRHeXJlYnJ2OVA1Q1dFVnErbDd2cmtqajZMYmJwdXY3NVpk?=
 =?utf-8?B?dXVBNllDYmQweHg2MS81dXh2VEVDUUUzM0Vvd3hmZGYvQWNvOWRSWHVSNTZp?=
 =?utf-8?B?VUJxaWt4VEltM1VkWnNRdTRqd0w3R0dZa0k4My9BNFdEVHNzQ1RvMW5hYnhV?=
 =?utf-8?B?bmowWjh4R1NFSDRhTnVaY1E2SWtsRGlURHpVWk9QTEZUZmt1eFRVQ3I2cGdO?=
 =?utf-8?B?VDFuQW9zbzJtSUZLQ092SnB1cWJKUHU3QkFiQmV4dHBUZkFRbVYzeldqMGlM?=
 =?utf-8?B?QjFkOWVMVmNReGtSeVBuWVp1dmplYVdkNEtJUjdDM1BIWmtkc1FvUjBsRGdK?=
 =?utf-8?B?YmN5Sm1UZ0hrWi9JdnQrUmxrc0ZwN0RPeVhpTFE3cnBVNjJqWncxaWUvQ3cv?=
 =?utf-8?B?RkxCVVpHSHJpNkNkOVVLci9JVkNvUWlyV2JSaEJRQ3J0OUlHOGF3RFBrTkV6?=
 =?utf-8?B?S2tieHhBMGFTTEpkSXE0REpuN1FvdFlLWTlsOUx3Zm5qWE53WDJ3OXVRc2NO?=
 =?utf-8?B?ZkZjaUMzZjZ4a2NHK05LcjBGa2Z0Skc4azdNc2ZPNDdaQ1I2dys3N1haWTB6?=
 =?utf-8?B?RTR3UHQ4RDUwRlpodnB0V2pUZjdxeXpNVXd6TVpFM2xJMWl5YnRXQWJSWmZN?=
 =?utf-8?B?OGZRVmoyYW5ZZHhscUNIWEhFTkVucEtrYWZoUGZQR051dFZ1QnBFVjFyRTVz?=
 =?utf-8?B?ZlJVRm5Dak83MDNmeWNCaTRQNHdmRURPS05PbDFDQTZPYzdKTjVOZENsSUU2?=
 =?utf-8?B?bVhyOU13NGpXYU1OYVZnTHIyYWs5U3RPVG1FK2Uxb0V0UVMxenFGL1FtczBI?=
 =?utf-8?B?S1owUWtMc3ZoWW03cmd4bytxSUtUL0xQOEFCcTFzQ3labW9XaGlkTjF4WThV?=
 =?utf-8?B?QldVTDFnOU5kOCt1ekcwMExTelB6REcwWTNSUUJIOGsyNlVqM0p0dWpVcTd6?=
 =?utf-8?B?eE1nazErU0RVUnA4MG1BNWVkUmFxOHd0U25nM2dzUXNYVExPK1lxcTJUdko0?=
 =?utf-8?B?dElUSmptQm0remRKNFFkZEdXY1g0Z1FXeitVZ1FpenUxZWhBdHRMSTAxRmpO?=
 =?utf-8?B?UWZaOWV2azVYL25NcFAwcjl0QUtWcWwvY0d1Nkd2TlBWTWdJdjZYTnYrREdT?=
 =?utf-8?B?Uld5dVVsbnF6dGl1NWFMYmxBVURqbDZwaW95dXNTS1RXQ3pFdDcvVkR1bng5?=
 =?utf-8?B?NEQ5S2xRZ1Nidkc5Zld1US9tanA0UkpBMndMV0pPSkhYWXBodEd3d1hDYzJv?=
 =?utf-8?B?YVRFbkM1VVU1M1hKSk1DSkFZbi9iL3NOQTRWVDRMbmVvWGlsdmhZTWhYUXJ4?=
 =?utf-8?B?RkZhdDVzcFNESkEzNHJyWk1ab2VGUkVLdWI5YmdRME00bHgrME5acHVBVWdw?=
 =?utf-8?B?NXJ0K0x4dkxVaUhJVnRCQjBhVUNtalNQMEd5ZlNwNUV0cDd5SUhvQkNiNUVv?=
 =?utf-8?B?Q3ZmVmxoZjdJczFDYkNhU3hsWWh0QXQ1cDBHODJSL3laTlB0cEJuVnNQL1pX?=
 =?utf-8?B?Umg1b3h4VFI5VXlZeXlWNTY1aS9HT0JSbFk0emhFZ050Rmc0OUJkVi93Zy9s?=
 =?utf-8?B?UmxqaVdUWEtoTit6QzdQUFg1QThwMkRmeUx1MGtvdFdCd1BUNGFUVUwwTG5j?=
 =?utf-8?B?N1ovdWV4cVFWdS9yblhGbzg3N1pvdE8yQXlDS3Q3NStsSXQzL2pxNW02Q2ww?=
 =?utf-8?Q?eo2dZ6Vt1a9JYcBo=3D?=
Content-ID: <48FB87CD9A5B6B46BCB20B9F8F778A4E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aba57dca-e9f3-43c2-f307-08da23837253
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 10:41:09.1826 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FVdq0mAXue3sUWNoxJ9K2ee8aAOaqn0BBTzHsIuYJnM+uFU+HOcEh8CIw7d2Iiaw/soCBDjKSCNb6ujoWlu7ohP5sK26KMJWkoYa8M6a9a8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_034115_211930_B699DADF 
X-CRM114-Status: GOOD (  27.93  )
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

On 4/21/22 12:40, tkuw584924@gmail.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Some of Infineon chips support volatile version of configuration registers
> and it is recommended to update volatile registers in the field application
> due to a risk of the non-volatile registers corruption by power interrupt.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
> Changes in v13:
>   - Use 3-byte address width
> 
> Changes in v12:
>   - Rebase on top of Tudor's series
>     https://patchwork.ozlabs.org/project/linux-mtd/list/?series=295933
>   - Use macro directly instead of local variable
>   - Use nor->reg_proto instead of SNOR_PROTO_1_1_1
> 
> Changes in v11:
>   - Rebase on top of Tudor's series
>     https://patchwork.ozlabs.org/project/linux-mtd/list/?series=294490
> 
> Changes in v10:
>   - Remove dependencies on other series
> 
> Changes in v9:
>   - Rename function per mwalle's series
> 
> Changes in v8:
>   - Use spi_nor_read/write_reg() functions
>   - Use nor->bouncebuf instead of a variable on stack
> 
> Changes in v7:
>   - Add missing macro definitions in v6
> 
> Changes in v6:
>   - Remove multi die package support
> 
> Changes in v5:
>   - No change
> 
> Changes in v4:
>   - No change
> 
> Changes in v3:
>   - Add multi-die package parts support
> 
>  drivers/mtd/spi-nor/spansion.c | 59 ++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 43cd6cd92537..65ae3ade0b95 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -14,6 +14,8 @@
>  #define SPINOR_OP_CLSR         0x30    /* Clear status register 1 */
>  #define SPINOR_OP_RD_ANY_REG                   0x65    /* Read any register */
>  #define SPINOR_OP_WR_ANY_REG                   0x71    /* Write any register */
> +#define SPINOR_REG_CYPRESS_CFR1V               0x00800002
> +#define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN       BIT(1)  /* Quad Enable */
>  #define SPINOR_REG_CYPRESS_CFR2V               0x00800003
>  #define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24  0xb
>  #define SPINOR_REG_CYPRESS_CFR3V               0x00800004
> @@ -113,6 +115,63 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
>         return 0;
>  }
> 
> +/**
> + * cypress_nor_quad_enable_volatile() - enable Quad I/O mode in volatile
> + *                                      register.
> + * @nor:       pointer to a 'struct spi_nor'
> + *
> + * It is recommended to update volatile registers in the field application due
> + * to a risk of the non-volatile registers corruption by power interrupt. This
> + * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
> + * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
> + * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
> + * also set during Flash power-up.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
> +{
> +       struct spi_mem_op op;
> +       u8 cfr1v_written;
> +       int ret;
> +
> +       op = (struct spi_mem_op)
> +               CYPRESS_NOR_RD_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR1V,
nor->addr_width is 3, isn't it? can we use nor->addr_width instead of 3, please?

> +                                         nor->bouncebuf);
> +       ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
> +       if (ret)
> +               return ret;
> +
> +       if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
> +               return 0;
> +
> +       /* Update the Quad Enable bit. */
> +       nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
> +       op = (struct spi_mem_op)
> +               CYPRESS_NOR_WR_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR1V, 1,
same

> +                                         nor->bouncebuf);
> +       ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
> +       if (ret)
> +               return ret;
> +
> +       cfr1v_written = nor->bouncebuf[0];
> +
> +       /* Read back and check it. */
> +       op = (struct spi_mem_op)
> +               CYPRESS_NOR_RD_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR1V,
same

Thanks!
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
