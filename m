Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6F2C04A68
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jul 2022 12:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0zWZ0FEZHFAKRETcJPtsFXM5wlfRmVyGONQcabxLxHM=; b=PrTe8p1YWxYo6p
	oXim5NRY2rQhC/KO8yGVmjJUVW2G7ZKbS7cb0bbR0i0dbZIgL5IOwlVTyUiNupIaa8E5GzX6KMVtd
	Vmw5alaHrncZ5RFw/PKrV2mNBXAEzDuCRvmDkZqqDj2M+w7hMQ97Xg49y9fJ3ITTpuFhqeFP9KaTw
	az9mIYV4uY1HInd31s32wjrUwyGnwpwf/DbpknXK4G4/kzOfY9orHX5ZzIxCJDMrQQzDjSL8y6apc
	dDU1GsFLJr0zY1i8XjiNFgd4ZpzUw9mzGpUCVO4cGHA7GV8xMqnwmpbuVxn+NWBEWcCmUPTfqmgvU
	0BquQIr3+CCkMo1E7N0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGgWE-00DhqN-Fm; Wed, 27 Jul 2022 12:52:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGgWA-00Dhg1-D8
	for linux-mtd@lists.infradead.org; Wed, 27 Jul 2022 12:52:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658926322; x=1690462322;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=EzBP3IMOI1s19fVICdsgCFwa/NjfxNoKS2GLGvsnO8w=;
  b=gVpgYNDlQyWGoXeCjumcXNRvTTdPw0DxF6JfOAiRsr3VbrOW625W9lKO
   FC6yzJlhHRHoSwKTiuNADRwCXZA632QbqvFyVqFr0zbEfe9R0siBTN3B6
   v0rhw/aR60XBARjyJTdp0iZMkS1Xn92+ufKNOMf21pN5jk57m+lIaZmZM
   Yfr5Nm4ANfivYz1hCCDxnAhwgiN87D9AST4quzxaKgAXii5Q+wtlzC20F
   A7Fthwayrbyjfx/mD5enEbdvEJ7LsCiSFBMMXVlZmin0jIMqyX3p4vNIW
   EuVlvmGJEgZa5LW2Z+nXFCs36I5suUNUrQfueY+fr7N4C5RblS3S6h52/
   g==;
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200"; 
   d="scan'208";a="173830213"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2022 05:51:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 27 Jul 2022 05:51:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 27 Jul 2022 05:51:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zk2kTPXDyUWj6w2bJ655BJsFNnEYgKnSbwNffjRnGW15CMWE0Dbh7v5yKb5nFQ4XDp/VmB84Uxlrr5pY+IZaD0Hi9duxxqTMDvJfcLhyPIZUnvggPg0COgPNA4h+Qdz70zonkOxGH0oTcMCb6lT0z3vsc0Es0YvTcfqFjY3SrE5OBIPAlvgX+VObPx6GpirssMsjaNW2mEFPkJ3PLhVA7mKyatm54xH/OuZlYyIVSnxHmHVTbf6W01WHxbVAXSbUUagFCVDpxcoxow++sPojRa2WUvvVh0Cb7AU7d1jevbGVbLP22ZxSqQSIm8p8GBS3Dg7neQ/tOw6q6y1cCy07Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzBP3IMOI1s19fVICdsgCFwa/NjfxNoKS2GLGvsnO8w=;
 b=V9e2Yat+jsD732iMMdeaH/I8SPFTA2y4GNL5wTscNxgdtuWD9b070GANPLvla89M80tqkT33x9pfeR65i9Zmclwx0+sUrOcVK33DkTt245lVfTBFcSTbaY9R009vM9LRfNy6O/chJpVmClr6IfVUKLVBOuHkOhugDnBYfmkdplRbz43bD968zhiG9vN6fJkwTpx0fDujLDYGZgVKe6FEqv/KlHkwTvuJGtxod/lA3l0B0eTaJTgY3tBkyd41oPjU+TjrqaQHjgftYgN/wenK3Xzr0v6MGHT8DTCCjXFGSrO1WtkZAlMjWjV2qDwhN/4oE6mXkw1xYzH1NW/HWKNfHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzBP3IMOI1s19fVICdsgCFwa/NjfxNoKS2GLGvsnO8w=;
 b=XZbEkUNVdBaEmc0loBSiXxeE6NrxVfr5hVUByhF21XPjeV8ZYW3hqXF4fFdXrF1QmZXydIOE+FcSFfboAFkottd+/KeiW4SQsUAsFRnProdu0uxFsIz5aO/EZPOfmNTALedNj9jChxrXr4hCdoXTDKAmlHoUGa280cGNzNhlurg=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 CH2PR11MB4280.namprd11.prod.outlook.com (2603:10b6:610:3f::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.19; Wed, 27 Jul 2022 12:51:42 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::7549:c58c:5e93:7c35]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::7549:c58c:5e93:7c35%5]) with mapi id 15.20.5458.023; Wed, 27 Jul 2022
 12:51:42 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
CC: <p.yadav@ti.com>, <tkuw584924@gmail.com>, <Takahiro.Kuwano@infineon.com>,
	<linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <Bacem.Daassi@infineon.com>
Subject: Re: [PATCH v17 5/7] mtd: spi-nor: core: Track flash's internal
 address mode
Thread-Topic: [PATCH v17 5/7] mtd: spi-nor: core: Track flash's internal
 address mode
Thread-Index: AQHYobeehEMgxNZBv0GiJv2cBxOeJw==
Date: Wed, 27 Jul 2022 12:51:42 +0000
Message-ID: <4e940119-de23-4052-1a48-9190c8a1b300@microchip.com>
References: <20220725092505.446315-1-tudor.ambarus@microchip.com>
 <20220725092505.446315-6-tudor.ambarus@microchip.com>
 <97493d572d27d1b9d2102d0110cc7b70@walle.cc>
In-Reply-To: <97493d572d27d1b9d2102d0110cc7b70@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5af8cef8-6162-4ce6-a4c6-08da6fcec161
x-ms-traffictypediagnostic: CH2PR11MB4280:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 681r6WBnBJrgyp1JXJFFpLJOuvPvS6G8ajjNlNy6RV7rzwbbC0IYBz0S3g7AQIYITOkgJd+NDeWdLFM5wtpiTvWYaKazSz+O1Ok8iIJ9Y3fh262jBUBFdOs/PWOiISVx4fNglgL+BHmX8v4Q8WnyFZPkg4oEEb1XistxNRG+lPT83fCS22pY5miXKo9YGFddzC5WDPf0KW4gS6XJnuaoumPtgfXOu37gfHwMgGTxXoTMiPpNnXhemXfR0Q//TuN0lsBbU0/T6jL8RO38xZZnCo3DtGhJfgqMv1TNFMKA2pn06BVb20gJ3S2iIrfBa+oMb/AB0sVjce6UjzmPTetkcSYCAc5vnJ1gfypuLedqDvY+R5+2Q0y1IWDkczt5ZQ6p0RFIXKRL2BSqyWVPsTjW0RYbk0DFgkr+y8R8dy4XjWH1pxKKRPE5TP5lvvQxfUnb88nUGfJXjJSmVfpFkH8ZFa6BVHf0e+344xma124avEa6NNdEXZtZyubp4fpGC/RDMs+mKtpu1onY0UTFvEWHbK6KcmCNf6lG5Ji5/KhYYsdxJK1xp2woPuUHE1o5l1M4vdT9wpEVDv5bLHW7XJuDj7ax3KkRj1r6mHlaN342xMbrq/kycwGkJCKSJOEMJ5z763uZgV7xKgXelhW7NsFHWA9zUE3fOEkmyU0s5hzcJAcS2Gg2yL+91yG/AcjdHfkIl3geSRngqOlWfRAOATqsEmw0+gtOv2s8daQ+nfrNOdOQW2xW/lqQSqQkX2OV8iequG4pfgrskjqWaGCjm+l3j2K6KVB0Bx34icAli92mYnwW2vB71mf0q/F7qFzm0H5dvXxow59t4xC38HXPt4qFw5BwW1MMoSVBUfXJ9o2Op5002mCo7+cLyyIqULrb6rrU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39860400002)(376002)(346002)(136003)(186003)(38070700005)(86362001)(36756003)(122000001)(31696002)(2616005)(5660300002)(31686004)(2906002)(83380400001)(6512007)(38100700002)(66556008)(66476007)(8676002)(76116006)(66946007)(64756008)(91956017)(66446008)(8936002)(6486002)(6916009)(41300700001)(53546011)(6506007)(54906003)(26005)(316002)(478600001)(4326008)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1krcmFoZE5KNGlIamFGSTl3cFQ4N3B3RTlvOVdmSlR5cC9uTkY1K0VkSFV4?=
 =?utf-8?B?TnNDQVpPNG50bkhVYnNCZ1N0NnRRaEJkZGljUmI4VlVKTHBUczVadkxlbkh4?=
 =?utf-8?B?OUdvMGxQalZualU5Q3g3UGZFOFJMQjF3dmM4Rk1zWk5SYVcyOXY3MStTQ3lq?=
 =?utf-8?B?SFpnU1NiWm1ZWmFOK2I3UVh0M3QvVHM1UTIxbGYwSHMvU3IwVk5kZmNld1pw?=
 =?utf-8?B?bWZWSWFoZTVJemorV0Fqc3VNU0xqQ1NPcStpcG5aMVpjREF1aGtTTHlwNFRx?=
 =?utf-8?B?aXk0L3FsWk02bU5QQ0FOYkRhR0MrSkF6Q2NhZFVLczgwcmcvdUQvc3hWU24r?=
 =?utf-8?B?bUNjQ2Z0MGVDemtNbXQyaUdlR0ZaUEV4Q25YZ0haanhON3l6WUFGcy9zb2RT?=
 =?utf-8?B?THdoT2U4Z1NDUVdzZ0NxSDhSaEZOZVdhL2t0UkNIQllZTDhCbzVYU0c4RWsx?=
 =?utf-8?B?dllWOUFSeTRWT0c3Sy9sNjVIYkNkc3d4ZXdFaWIzTVowWk42ZFVESW4xT0Fj?=
 =?utf-8?B?aWxNbFRaMURWQ2EzaEpmd3JDVGFEK0VVRlpqYjVreVdsNzFjNzUwYS9nNmU5?=
 =?utf-8?B?TXcvdVBTTXdaa0Zrcy9tVThzSUVpVWF6T2x4OUx1WnU3YnF6TXJENllOKy80?=
 =?utf-8?B?S0xtRHZTNEtkbjhKWUFnMXVyS1BGV201ajdpdFpMMzhLd2dOVU4yMHRoV3pa?=
 =?utf-8?B?S1lDdHJiczR4WHpyTHUrOHAvVEdad2pTU05ySjhaMWdlQlZqUmIydXA0dmpa?=
 =?utf-8?B?MnRkc0Z1U3VaR3dIM0dEKzlkRWlrV2dYalM1NG9JVU1FMGNKN1J3VmFWdFR3?=
 =?utf-8?B?UEpFVXR4Z3dBQS9ZSlhQZXA1d3RQdEZUMGRCRkpKK1VwTmVEYzRyM2F2NTRZ?=
 =?utf-8?B?ckJVVkgxNFBReUxZQlJiWUtmazJzOHNiSElSajN3WkRYbUlnWWtsSzNEb0Z2?=
 =?utf-8?B?dUw5K3hrTXJCWnZYY1BtZjRxdW5mT3pnNStHWEFEYU4yQmMzTzVJZVI3SU1i?=
 =?utf-8?B?cStnbVZkN1VjeVJqeTVEVmI5M0NHUkdNakcvZm5KNWQ3OVZVN2NNL3NHZDk0?=
 =?utf-8?B?UW5vSkQ0VEczS2hkQ2ZjaW9GdnUvQ0lRK29ITndSTHlLaWwyNlBqZDZQTmNi?=
 =?utf-8?B?UHM3U21FdVF3VE82V2xlYk0xY1dCQlFlc2JPYXVMWHE4dFJyLzRJQnNIZXds?=
 =?utf-8?B?OFh2enQ3dlpJdmZtWWMvUVRKKytIS1o2eVNyRG8zdDIxcE81cG81SDhCaUhm?=
 =?utf-8?B?dHZUYXpxZ3F2eVorSEV4VkRvbjJwZ2E5TUR0MDVDajBRVTA3OU9xN1V6UW5L?=
 =?utf-8?B?WlZpZCtpaUwrVUdoVTRKbkNFb3dqVEU1Y3Q5eXl2Y1Zxdm9lbXNid1JCWDIz?=
 =?utf-8?B?QWU0YiswT2FDMzFKeEpIRHAwb3ByWTAzc29Sd25vcWxudWVMRFY4NENXQkg3?=
 =?utf-8?B?NUtrSmRsNUlXL1g0aEJkZUNvZThtdHl6UU9WT3Q3MG5TK29aajJjY2RIMEhV?=
 =?utf-8?B?Yld0bDNGYzdNY29xSDdQOVY5WHlDL2hZSU80Y0dVMXRzVXBvRU9CdmZjWkZ3?=
 =?utf-8?B?SHB3cFNIak5sVmIwTURsVnVXQmdhZmFSOExGaXo2Rjhwb0RqUElOZW9vTGtv?=
 =?utf-8?B?c0pOUGpuOG9zeHg1SzZIWXV6YlBLdktwdWhvU0ZIQjQ0UENwRkVkdzRncTlp?=
 =?utf-8?B?eUYwMGdIUzgwcEJXT0QwcmVLc21OTXVnKzhqZVYydVU2aEQ5YktDNWxQWmVG?=
 =?utf-8?B?a3FNUmpaa0svWjA2OTUwVjBQS2tBYitIQXo2RGxVclg2YXpzT0tjNkZDNHpN?=
 =?utf-8?B?Njh2TUtQL1kwR1FwbjFMOHEzSy81YWp1VzQ5ekFoTTVtMHV6RE90am4wUWxL?=
 =?utf-8?B?ck5kb3FaRHliZTR0SWpVNTJENFZkNWs0RGhlZHA0Vm9MVHd0UmJzRjNBdjVl?=
 =?utf-8?B?dTF1QUp1Y0Ywd0UxQ0RkSlltM3JMdElyMDhwbisyZzNVZVlwbTV0NFZKYTB1?=
 =?utf-8?B?VHRPMHZvNittYjljM2lZRnlFazJGQzl3cy9OWVRiYThYeEZGQStVMXUwaith?=
 =?utf-8?B?UmcxRzcvQXdrbWUwdXJHRFBReERvUDV3TVVrY3UxQ3VTSzJoSTZrcDg5M21S?=
 =?utf-8?Q?vy/+F2kVXl0ccr6iKOD9q4npd?=
Content-ID: <31F5F0C4EA954F4EBF73A63B004D9587@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af8cef8-6162-4ce6-a4c6-08da6fcec161
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 12:51:42.4069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M0dhFtV36VsjIbxM8l3v2wpsFB4LINj6/+VXdRs+rofGnVf2JJ50HMrafFwJbp1gBb+VR12gJsXK0nPeG/8JzH6FUUJBcs9eWsa3tHsEy3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4280
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_055202_705193_B612DD2C 
X-CRM114-Status: GOOD (  23.72  )
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

T24gNy8yNy8yMiAxNDoxMiwgTWljaGFlbCBXYWxsZSB3cm90ZToNCj4gRVhURVJOQUwgRU1BSUw6
IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0
aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBBbSAyMDIyLTA3LTI1IDExOjI1LCBzY2hyaWViIFR1
ZG9yIEFtYmFydXM6DQo+PiBXZSBuZWVkIHRvIHRyYWNrIHRoZSBmbGFzaCdzIGludGVybmFsIGFk
ZHJlc3MgbW9kZSBhcyB0aGVyZSBhcmUgZmxhc2hlcw0KPj4gdGhhdCBjYW4gb3BlcmF0ZSB3aXRo
IDRCIG9wY29kZXMgYnV0IHVuZm9ydHVuYXRlbHkgZG8gbm90IGhhdmUgYSA0Qg0KPj4gb3Bjb2Rl
DQo+PiBjb3JyZXNwb25kZW50IGZvciBhbGwgdGhlIDNCIG9wY29kZXMuIFN1Y2ggYW4gZXhhbXBs
ZSBpcyB0aGUgSW5maW5lb24NCj4+IFNlbXBlciBjaGlwcyB3aGljaCBwcm92aWRlIDRCIG9wY29k
ZXMgZm9yIHJlYWQvcHJvZ3JhbS9lcmFzZSBidXQgZG8gbm90DQo+PiBwcm92aWRlIDRCIG9wY29k
ZXMgZm9yIFJlYWQvV3JpdGUgQW55IFJlZ2lzdGVyLiBUaGVzZSByZWdpc3RlcnMgYXJlDQo+PiBp
bmRleGVkIGJ5IGFkZHJlc3MgYW5kIHJlcXVpcmUgdGhlIGludGVybmFsIGFkZHJlc3MgbW9kZSBv
ZiB0aGUgZmxhc2gNCj4+IGJlZm9yZSBSZWFkL1dyaXRlIEFueSBSZWdpc3RlciBvcGNvZGVzIGFy
ZSBpc3N1ZWQuDQo+PiA0QiBvcGNvZGVzIGFyZSBwcmVmZXJyZWQgb3ZlciBjaGFuZ2luZyB0aGUg
Zmxhc2gncyBhZGRyZXNzIG1vZGUgdG8NCj4+IDRieXRlLA0KPj4gYXMgc2V0XzRieXRlX2FkZHJf
bW9kZSBjb3VsZCBiZSBkb25lIGluIGEgbm9uLXZvbGF0aWxlIHdheSBhbmQgY291bGQNCj4+IGJy
ZWFrDQo+PiB0aGUgYm9vdCBzZXF1ZW5jZS4gVGh1cyB3ZSBuZWVkIHRvIHRyYWNrIHRoZSBmbGFz
aCdzIGludGVybmFsIGFkZHJlc3MNCj4+IG1vZGUNCj4+IHNvIHRoYXQgd2UgY2FuIHVzZSA0QiBv
cGNvZGVzIHRvZ2V0aGVyIHdpdGggb3Bjb2RlcyB0aGF0IGRvbid0IGhhdmUgYQ0KPj4gNEINCj4+
IG9wY29kZSBjb3JyZXNwb25kZW50LiBUcmFjayBmbGFzaCdzIGludGVybmFsIGFkZHJlc3MgbW9k
ZS4NCj4+DQo+PiBhZGRyX21vZGVfbmJ5dGVzIGlzIGRpc2NvdmVyZWQgd2hlbiBwYXJzaW5nIEJG
UFQuIEZvciB0aGUNCj4+IEJGUFRfRFdPUkQxX0FERFJFU1NfQllURVNfM19PUl80IGNhc2UsIG9u
ZSBjb3VsZCBpbnRyb2R1Y2UgYSBtZXRob2QNCj4+IHRoYXQNCj4+IHF1ZXJpZXMgdGhlIGZsYXNo
J3MgaW50ZXJuYWwgYWRkcmVzcyBtb2RlIGF0IHJ1bi10aW1lICh3b3JrcyBmb3INCj4+IFdpbmJv
bmQpLg0KPj4gSWYgYSBydW4tdGltZSBxdWVyeWluZyBjYW4gbm90IGJlIGFjY29tcGxpc2hlZCBv
ciBpZiBTRkRQIGlzIG5vdA0KPj4gZGVmaW5lZA0KPj4gYXQgYWxsLCBidXQgdGhlIGFkZHJlc3Mg
bW9kZSBpcyB2b2xhdGlsZSBhbmQgcmVzZXRzIHRvIGEgZGVmYXVsdCBrbm93bg0KPj4gdmFsdWUg
YXQgYm9vdCwgb25lIGNhbiBjaGFuZ2UgdGhlIGRlZmF1bHQgYWRkcl9tb2RlX25ieXRlcyB2YWx1
ZSBvZiAzDQo+PiBieQ0KPj4gaW50cm9kdWNpbmcgYSBmbGFzaF9pbmZvIGZsYWcuIElmIHRoZSBh
ZGRyZXNzIG1vZGUgY2FuIG5vdCBiZSBxdWVyaWVkLA0KPj4gZGlzY292ZXJlZCBhbmQgaXQgaXMg
Y29uZmlndXJlZCB2aWEgYSBub24tdm9sYXRpbGUgcmVnaXN0ZXIsIHdlIG1heQ0KPj4gaW50cm9k
dWNlIGEgZHQgcHJvcGVydHksIGJ1dCBpdCB3aWxsIGhhcm0gdGhlIGdlbmVyaWMgYXBwcm9hY2gg
b2YgdGhlDQo+PiBqZWRlYyxzcGktbm9yIGNvbXBhdGlibGUuIEFsbCB0aGlzIGNvbXBsZXhpdHkg
aXMgbm90IG5lZWRlZCBub3csIHNvIGxldA0KPj4gaXQNCj4+IGZvciBmdXR1cmUgZGV2ZWxvcG1l
bnQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0Bt
aWNyb2NoaXAuY29tPg0KPj4gLS0tDQo+PiDCoGRyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5oIHwg
NSArKysrKw0KPj4gwqBkcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYyB8IDYgKysrLS0tDQo+PiDC
oDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4NCj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuaCBiL2RyaXZlcnMvbXRkL3Nw
aS1ub3IvY29yZS5oDQo+PiBpbmRleCA3ZGM0Y2RhNDFkYjMuLjg1YjBjZjI1NGU5NyAxMDA2NDQN
Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5oDQo+PiArKysgYi9kcml2ZXJzL210
ZC9zcGktbm9yL2NvcmUuaA0KPj4gQEAgLTM0MSw2ICszNDEsMTAgQEAgc3RydWN0IHNwaV9ub3Jf
b3RwIHsNCj4+IMKgICrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRUNDIHVu
aXQgc2l6ZSBmb3IgRUNDLWVkIGZsYXNoZXMuDQo+PiDCoCAqIEBwYWdlX3NpemU6wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB0aGUgcGFnZSBzaXplIG9mIHRoZSBTUEkgTk9SIGZsYXNoIG1l
bW9yeS4NCj4+IMKgICogQGFkZHJfbmJ5dGVzOsKgwqDCoMKgIG51bWJlciBvZiBhZGRyZXNzIGJ5
dGVzIHRvIHNlbmQuDQo+PiArICogQGFkZHJfbW9kZV9uYnl0ZXM6wqDCoMKgwqDCoMKgwqAgbnVt
YmVyIG9mIGFkZHJlc3MgYnl0ZXMgb2YgY3VycmVudCBhZGRyZXNzIG1vZGUuDQo+PiBVc2VmdWwN
Cj4+ICsgKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3aGVuIHRoZSBmbGFz
aCBvcGVyYXRlcyB3aXRoIDRCIG9wY29kZXMgYnV0IG5lZWRzIHRoZQ0KPj4gKyAqwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludGVybmFsIGFkZHJlc3MgbW9kZSBmb3Igb3Bj
b2RlcyB0aGF0IGRvbid0IGhhdmUgYSA0Qg0KPj4gKyAqwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG9wY29kZSBjb3JyZXNwb25kZW50Lg0KPj4gwqAgKiBAcmRzcl9kdW1teTrC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkdW1teSBjeWNsZXMgbmVlZGVkIGZvciBSZWFkIFN0
YXR1cyBSZWdpc3RlciBjb21tYW5kDQo+PiDCoCAqwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGluIG9jdGFsIERUUiBtb2RlLg0KPj4gwqAgKiBAcmRzcl9hZGRyX25ieXRlczrC
oMKgwqDCoMKgwqDCoCBkdW1teSBhZGRyZXNzIGJ5dGVzIG5lZWRlZCBmb3IgUmVhZCBTdGF0dXMN
Cj4+IFJlZ2lzdGVyDQo+PiBAQCAtMzc0LDYgKzM3OCw3IEBAIHN0cnVjdCBzcGlfbm9yX2ZsYXNo
X3BhcmFtZXRlciB7DQo+PiDCoMKgwqDCoMKgIHUzMsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdyaXRlc2l6ZTsNCj4+IMKgwqDCoMKgwqAg
dTMywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcGFnZV9zaXplOw0KPj4gwqDCoMKgwqDCoCB1OMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYWRkcl9uYnl0ZXM7DQo+PiArwqDCoMKg
wqAgdTjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGFkZHJfbW9kZV9uYnl0ZXM7DQo+PiDCoMKgwqDCoMKgIHU4wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZHNyX2R1bW15Ow0K
Pj4gwqDCoMKgwqDCoCB1OMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmRzcl9hZGRyX25ieXRlczsNCj4+DQo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvc3BpLW5vci9zZmRwLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYw0K
Pj4gaW5kZXggM2E0ODE3M2EyZDc4Li5jNzk3MzM2OGY1ZGMgMTAwNjQ0DQo+PiAtLS0gYS9kcml2
ZXJzL210ZC9zcGktbm9yL3NmZHAuYw0KPj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zZmRw
LmMNCj4+IEBAIC00NjIsMTEgKzQ2MiwxMSBAQCBzdGF0aWMgaW50IHNwaV9ub3JfcGFyc2VfYmZw
dChzdHJ1Y3Qgc3BpX25vcg0KPj4gKm5vciwNCj4+IMKgwqDCoMKgwqAgc3dpdGNoIChiZnB0LmR3
b3Jkc1tCRlBUX0RXT1JEKDEpXSAmIEJGUFRfRFdPUkQxX0FERFJFU1NfQllURVNfTUFTSykNCj4+
IHsNCj4+IMKgwqDCoMKgwqAgY2FzZSBCRlBUX0RXT1JEMV9BRERSRVNTX0JZVEVTXzNfT05MWToN
Cj4+IMKgwqDCoMKgwqAgY2FzZSBCRlBUX0RXT1JEMV9BRERSRVNTX0JZVEVTXzNfT1JfNDoNCj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFyYW1zLT5hZGRyX25ieXRlcyA9IDM7DQo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBhcmFtcy0+YWRkcl9tb2RlX25ieXRlcyA9IHBhcmFt
cy0+YWRkcl9uYnl0ZXMgPSAzOw0KPiANCj4gSSdkIHN1Z2dlc3QgdG8ganVzdCB1c2UgdHdvIGxp
bmVzIGhlcmUgYmVjYXVzZSB5b3Ugc3RpbGwgY2FuIGRvIGEgZ2l0DQo+IGJsYW1lIGFuZCAobWF5
YmUpIHNlZSB3aGF0IHRoZSBwdXJwb3NlIG9mIGFkZHJfbmJ5dGVzIHdhcy4gQnV0IEkNCj4gZG9u
J3QgaGF2ZSBhbiBvYmplY3Rpb24gaGVyZS4gWW91IG1pZ2h0IG9yIG1pZ2h0IG5vdCBjaGFuZ2Ug
aXQgd2hpbGUNCj4gY29tbWl0dGluZy4NCg0Kd2lsbCBjaGFuZ2UsIHRoYW5rcyBmb3IgcmV2aWV3
aW5nIGl0IQ0KDQo+IA0KPiBSZXZpZXdlZC1ieTogTWljaGFlbCBXYWxsZSA8bWljaGFlbEB3YWxs
ZS5jYz4NCj4gDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+DQo+PiDC
oMKgwqDCoMKgIGNhc2UgQkZQVF9EV09SRDFfQUREUkVTU19CWVRFU180X09OTFk6DQo+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBhcmFtcy0+YWRkcl9uYnl0ZXMgPSA0Ow0KPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBwYXJhbXMtPmFkZHJfbW9kZV9uYnl0ZXMgPSBwYXJhbXMtPmFk
ZHJfbmJ5dGVzID0gNDsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KPj4N
Cj4+IMKgwqDCoMKgwqAgZGVmYXVsdDoNCj4+IEBAIC02NTMsNyArNjUzLDcgQEAgc3RhdGljIHU4
IHNwaV9ub3Jfc21wdF9hZGRyX25ieXRlcyhjb25zdCBzdHJ1Y3QNCj4+IHNwaV9ub3IgKm5vciwg
Y29uc3QgdTMyIHNldHRpbmdzDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
NDsNCj4+IMKgwqDCoMKgwqAgY2FzZSBTTVBUX0NNRF9BRERSRVNTX0xFTl9VU0VfQ1VSUkVOVDoN
Cj4+IMKgwqDCoMKgwqAgZGVmYXVsdDoNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIG5vci0+cGFyYW1zLT5hZGRyX25ieXRlczsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIG5vci0+cGFyYW1zLT5hZGRyX21vZGVfbmJ5dGVzOw0KPj4gwqDCoMKgwqDCoCB9
DQo+PiDCoH0NCg0KDQotLSANCkNoZWVycywNCnRhDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
