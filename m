Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FC2C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 07:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UefZFWF5gNVEIidpu00vORb8fQOV//gPMRTyD5mbpNs=; b=fVaDvNAQfoc+GC
	BvTmEqWYzWysZO5HerMKZsnqB90TB3Nk1fznEpuioLZzFhEv1ZAygjrr1CB+sOO3Gu95Fh5kRG2dR
	FVWjpkWIbVV00144xgJ4cEFe9Dla59kzIUsco+/GiUwSnlVBeUAVxulWsBsdtY4pQ8jIHNzJYKqlD
	MR5K9vXq2jocGIxsXvW93rv/0VUA46trC5QS7uX7AqwEzqVHyVcTXw1noZwjhk19FBW5Gw+JXVv4Z
	CLCHc2t0hJtceCWdLxxb8GCPOrCWTzXywTnrojxt2fzCRbcedC6D/KvWxIj80NIqqGnQnJgqlvsBJ
	rS4HVK3ckv9a+g6X5M+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhRJK-00C2IG-B2; Thu, 21 Apr 2022 07:33:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRJH-00C2Hd-Rp
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 07:33:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650526384; x=1682062384;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1pk5xH4UPTnedQpm1/si81wG9Gu3BvZuhfvQ7F2APuA=;
 b=xQsI0IISVv84SN78wj/CgXGP2dg9AERBWy7/nTqEX5IkiWMLe7bwY7sN
 RNc384bK212TaNEMC5Ieo8zNr/kHLUzay0Je3dxsFBhd1Wk4HEfwLhtW5
 aTrLdllTm0XpBXN3a0GtvZfT0aldGCWUg2G4Gr9WoTSlR0yI2GGOBXElY
 Nm2NbM1qgn5E6hRzoUE3ZKdWNjnJUQIQZfI+nhkNwZ8HGBAE0XugQZOeF
 8B/4kBq5CVcJhqH2lo1BGdyUlc7GHv9bCBuApJqn1r/l1bQJKWUsRGMYo
 BU3ZkfUSi2ZX3XClPOugzRjjGUpVlOrBoOcAz8nAt21t29DNt6/qWoeV2 A==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643698800"; d="scan'208";a="160809791"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 00:33:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 00:33:02 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 21 Apr 2022 00:33:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DwWGD8CBtq5PiMjqJGxwqP6J3NQ4TeTDeiNrKv6EmyOgWa60bm490nTpTZL75OTjZnE9TEZADyy06CZCxlMAjIiHiutyCxzs4qySOHvEr9JiuPIxp4IIcjXNNvR+O3kSFQj9N9Pk2UrvfN4yPyXU5OZv2osNFdpGXx1OiboZNXn7CEukVY7PDDArSo2+ZWIYbn/oIvzvt6VdFxox7QHVrh8JyPzD+pbW2dM2xzsadW3cK38SkeWFC7diHIS16i0JGePTFJDHeT8ESX9bvHI8neevQb+/q07GoqesmPigeG46rOYjMszqs8Cgw36+GoQEZmrkYrt4DBRrPwkT5FiCVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pk5xH4UPTnedQpm1/si81wG9Gu3BvZuhfvQ7F2APuA=;
 b=Upqd8ApFgnxmqr0Y8E4n8tHo/Gkc5Tpk6qYEqSTkkZDcSpXDx3LTzkDgZ766lW2LIlfj8IcqKSMI7pE29Gum1SkEg579BYEQ7lhKWmySK8Y42MDAs78GSqZHauoo4br+NXEJU2ZaaVvq13Un8d1ck6epPKjtPV7kEg0NJwXuJ3pvj4kJkO7ToIubIQUpxWywscGrTr/kF/3a+ZF7UErgZ7r5YChN737vF1RYhr4MP8HmDlJeZcrAPATXKUK7XFrCDXaEvdesbYokoOsKnLddCGNpr+NnU+B1rgYWjdS2vbG2g9b2Az8+MsMU2DCQbCO3DtHxNuUaCjW5JzewPrLYhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pk5xH4UPTnedQpm1/si81wG9Gu3BvZuhfvQ7F2APuA=;
 b=mqt8KaAIIM0oDpAbQg2uzUXOfabnzY2hI4I3NEta6NwGri3SZefZj5vvySpOoHDFhaKArezrzbPQb2oMr6nuQY1IRAPDTnLW53nXJs+DG7rRLrr85vd7Io11MYA4BAmQD2xJoAVsqBRuuu02WYeks+hPtQwrtIrp+sL5F+b8qDk=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by MN2PR11MB3566.namprd11.prod.outlook.com (2603:10b6:208:ec::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 07:32:57 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.013; Thu, 21 Apr 2022
 07:32:57 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v12 2/6] mtd: spi-nor: core: Call set_4byte_addr_mode()
 before spi_nor_quad_enalbe()
Thread-Topic: [PATCH v12 2/6] mtd: spi-nor: core: Call set_4byte_addr_mode()
 before spi_nor_quad_enalbe()
Thread-Index: AQHYVVIFk/2+rMSgsUmuO+cFBwX9ZA==
Date: Thu, 21 Apr 2022 07:32:57 +0000
Message-ID: <3ca94230-1dbb-6cf9-1c78-f2a591d96113@microchip.com>
References: <cover.1650519576.git.Takahiro.Kuwano@infineon.com>
 <ef57dc6cc0b8b4dbd39cf1bdd2fd64203f08d15b.1650519576.git.Takahiro.Kuwano@infineon.com>
In-Reply-To: <ef57dc6cc0b8b4dbd39cf1bdd2fd64203f08d15b.1650519576.git.Takahiro.Kuwano@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d20bd1f-2cb1-435f-9871-08da23692822
x-ms-traffictypediagnostic: MN2PR11MB3566:EE_
x-microsoft-antispam-prvs: <MN2PR11MB3566BA7A6165762896C9E113F0F49@MN2PR11MB3566.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zEoICllEvTdySU644qapP85o3n/pUMx7sDQtFIDzXo44wP7xW8fGCCl9WKGv2SH93lr5dbL9am/g+DS0quHoSr52SUiK5eHkPxY5qNTagUWRsiYdgVmlBI4FuyvW0DHewe5QAbGZEWjTmyr9lwEfVu825R57ICa4+M2/jVEVHe+LTyoRxt0moNnG1Xwtaj9/uQvlnwTIZkem31H3290a/5FslRx1xVW6yU2ASu0Fm1h1YOB4CgOxDYIWtWj1waZfjNt6ZwB0lpkO81moWYQWAFeNHxrzOQQw8IKiHKvMf5IJp3ogE7uB5bpBJ53LSqXSHSx4p0eerNS+VOH2eCDYbfqRMZudFTP4IHpfIXaVIkXTsvZpD3LMpaS6+BKf76rP2VUOb0QBlrAQY6FF6PPtxsg1zyebJvHIX7TU4JglsYR+p57YFuvPN243bhJQd00ZEkU+5vL9tzfbGgcSmwpoyUXH80k4JLMBWgrBY7ANCv8ZNgXW9prOdFNyRau7OWvhMy8X/Clq87+R58qrhPnIFiP3zAovdfmaKzgQTkIvlhExh1AH2hkhcFuPlaZolS/72WDiRUzEaGC29YWI3IzE19r7fWFbzHL0+Fms0H/t15YWDi42PK4FmvHLhV4XSEdlngPOno8xXeypN4Weoc7zBmipPJwUAXaSy3F3ya/Z6vGuzbt2OkAEl+FwMY6sz+tIQxv9pjDVLxrOxvKapasiNYNaj0v7GmsNGeJPrfxZsgmI4hXaNKYaRxnPAPTe6vCRxoAMG19c0soNG9H26H6lHA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(316002)(31686004)(2906002)(186003)(83380400001)(6506007)(508600001)(6486002)(2616005)(71200400001)(6512007)(5660300002)(26005)(66946007)(66446008)(66476007)(66556008)(76116006)(64756008)(53546011)(4326008)(86362001)(31696002)(8676002)(91956017)(8936002)(110136005)(54906003)(122000001)(38070700005)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VnI0Uy9JMStVWFpTQU5VYXNLTHB6QWpTSDZVZTBIQWdPVkUyak5BL0tlU0hX?=
 =?utf-8?B?REJmTEtJbXd5MkxjZWlCYkFzVWd4SVRTSHBiazJyYXF2NnNOdVVpTTFHb04x?=
 =?utf-8?B?QnRITE42bWVCVUI1aWtycll3ek14L2FMQzF3cUVlemhyWDJaL1U4NUEwRzhX?=
 =?utf-8?B?TGJIdUJRanZvN3JUZjd0RW12cHhsR1Y3SFJTanczZzltV1VvNHJUdi9SdDYv?=
 =?utf-8?B?T2pyMkJkR2ZkT0hraDdlMU9IUlRkMzNCcnpiLzRsMU9TZ1lSZjlKcXFMMXhM?=
 =?utf-8?B?aUJlWTRNSlJnSkQyaDA4U2JvVklQVDkwbzZCUm5RUlRXNHB1MWlrZ3BJYThJ?=
 =?utf-8?B?b29oNlBWYmh2SjZqTk5JRXd4c0xkK25zTjJWN3JMN1JmTmhqY1ArakVDd2Jj?=
 =?utf-8?B?cTQ4bGc1WkJwSGtSaVI5SkowK1NPVGlPOHBLcW5pdDFHcTBxMXpDNDhhcFhv?=
 =?utf-8?B?a2dzWnNlWUpaL0F0eThzZFZPdktIejdIVFFKKzY3by9XdStiOXk5QVhRaERa?=
 =?utf-8?B?ZU1VYWF5VWwvTWtMeFNkLzR5cGRvWkdYREt5M05qaHdxM0ZQd0s2RmdHdTV6?=
 =?utf-8?B?a04va0taWUNBNThndmp2TW9mMUVESlpqRDFyZWZaZi8raFdaSkF4V0JpUXJ2?=
 =?utf-8?B?dnR4TVRwbG81ZlphcUdvNHlESnY1NFI0cU8rYWJIOVZ1dE9zSUZhWEI5d3lV?=
 =?utf-8?B?ZTZWOVg3ZVJMR3VBVmFzNHkvY2JQZHcxTDBEQ1dPOFJiQVc2T0NOUnFPODJQ?=
 =?utf-8?B?ZnFHRm1JTE1oQ2ZidXlkMTI0OVpUTlYySlIzbEgvWU40T0hWK2NxZ25RT293?=
 =?utf-8?B?dW5xYWNnSFZyWG8yKytjVDdvS2psZFhXMUtuWUNzYi93SUs3Q1VyK2I1WTVJ?=
 =?utf-8?B?eFYySUJSTURuMVZudGZzZHI4T0ZWZXNMblY1eElpSUI0NlJQSjVxTDRpQi9i?=
 =?utf-8?B?UFRRUVRXa0xiNDkzOUlZZHM1MUZxcXRlVFcvcDJTci90bjJzTlNZZ2xUWTU3?=
 =?utf-8?B?UUVvOFpmcjU3Wk9xUWJsbit2dGcrSG9mdXI1amFtcmM4NEhScTVSY3RjbDRQ?=
 =?utf-8?B?aEVZYklsQU91SjhlVVJGelpyVHIyMlovaEZXR2h0V2toS3VuWEpQVmxkdW0w?=
 =?utf-8?B?SmRkN05hMWI3aVNPSCt1SUM1UEJuaWU2N0t6OTM1M1hwSTdHODNjVVJibVBT?=
 =?utf-8?B?eHRhNjJyaDd1OHdnNTJRV2NHSThNUFcvbUw2SUhQNTZ0cGZ6c1ZDalZTMVpR?=
 =?utf-8?B?WTZMNGNuKzBLUUxyQkpUYXNKSHpUTmkxMkplczgwaGpTYyswbmFCeE92b2R2?=
 =?utf-8?B?YlozS3Q1MG5FY2x2T2I0YVNoYldyRFY5SHJIQWJZVEVUY3V2bTRpMTB0M3pm?=
 =?utf-8?B?SjhVLzY5ZGRqTGswWnQ1dXk1MGFmNWlOK1U2TE9yUUlScGZmQ1Y2ekxpQ2l2?=
 =?utf-8?B?ekJXcWMwVnZIRjlSbEkweUpRWXc3c0hDRDJzUDBhaVFwU2ZwWmh0UEVYaUdK?=
 =?utf-8?B?S0ozQTN4ek83ZjJCellxcE5STEZQWjBxaU1hWU8rakFnVWJ0WmJLK3laaXNu?=
 =?utf-8?B?aklXNWxhTEpFckVTdVFsUndGdDVYdXRkRnZQLzhzYm9mZXk2RGs4QzRId3B1?=
 =?utf-8?B?dEhEeC9XNTFmdHBxRUtsa0xIVDVDa3A0KzRpRjdOdCt1b2x1a1lIeHlzMWc4?=
 =?utf-8?B?cnpzd1llcnNkMlFVcWFYdmNsUHJ6ZEJIRVZqbU15SDlZam1JNDk4RXJ1YTVR?=
 =?utf-8?B?ZndOK1cvdndIWkkvMHQwbGFqc0E3aW4xdU5hb3N4bjRnQTRNQ3VsUkpicWp5?=
 =?utf-8?B?cU9Cdk95aTQ0NEltKy9CaGt3L1cwTERXbjdHTkc2NUIwM0pNbjNXODdVQ3JK?=
 =?utf-8?B?My9VR0ZmTFBhSzVINk4rZHFMZDJ0eEk1RlpzeWdiMnpQUlZtR2szeHRONlUy?=
 =?utf-8?B?cjdwdmdRK2pQMEJORW1MNmliOW9OQWxYRE1ySG9odFg4eFdjUHlqVnhoajJx?=
 =?utf-8?B?R0ZVYWw4eFhsYWJXVWpZa0dzLzRsUnFWMWFjOTlKeS8wTkhENGRDcUhnWWRH?=
 =?utf-8?B?WW9XblBTSS96R3J4TjQvZmd3YUMwNEpzNE1UeXNMRXhjTDdTa1cxc3pndk11?=
 =?utf-8?B?eWU5Q2Qya25GYjhwOTlhOGRTeEtEZTVQdkhacHhIeGo0V2xMTGVnMzVSTVM2?=
 =?utf-8?B?VGJBdHA3N1FvRFBGTkFXOXZJSVp0RlhTd0ZNdGZxa2taQitPR09lbFloLzlQ?=
 =?utf-8?B?VE9Bd05IaGJ1S2NiMUF3dk1MN2U1Wmx5OWtuZ3VnbjJtYXZ6bEozdjFCTU9p?=
 =?utf-8?B?ZHBNN29Hdk1vZ2tDck5aTDVPdk9wc05YQzVGZXNaWXh2aG04dmhJcEZkY2dL?=
 =?utf-8?Q?inbBuovYTLF4Eklk=3D?=
Content-ID: <8CA3C6962A1E22448DEBB9FA532A3251@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d20bd1f-2cb1-435f-9871-08da23692822
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 07:32:57.7928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6M/020ra8Lw5EtvoYrRQ+mTCCtAv6nQwXnZcQ16glT25GdX1Khaj53PY9x+eR+TQMxfX52gjDMm6qINuJwKsOPjeDf+LVxA6KePT/1TiUUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3566
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_003303_968474_92DA0F0B 
X-CRM114-Status: GOOD (  23.08  )
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

On 4/21/22 09:40, tkuw584924@gmail.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Hi, Takahiro!
> 
> The part specific quad_enable method for s25hl-t and s25hs-t relies on
> address mode. Flash's address mode needs to be set before
> spi_nor_quad_enable() call.

Maybe I haven't understood something, but I thought you were going to use
3-byte addr for enabling quad mode. Can't you enable quad with 3-byte addr?
If not, why?

Cheers,
ta
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>  drivers/mtd/spi-nor/core.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 87603a99938f..748b77eb7841 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2665,6 +2665,21 @@ static int spi_nor_init(struct spi_nor *nor)
>                 return err;
>         }
> 
> +       if (nor->addr_width == 4 &&
> +           nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
> +           !(nor->flags & SNOR_F_4B_OPCODES)) {
> +               /*
> +                * If the RESET# pin isn't hooked up properly, or the system
> +                * otherwise doesn't perform a reset command in the boot
> +                * sequence, it's impossible to 100% protect against unexpected
> +                * reboots (e.g., crashes). Warn the user (or hopefully, system
> +                * designer) that this is bad.
> +                */
> +               WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
> +                         "enabling reset hack; may not recover from unexpected reboots\n");
> +               nor->params->set_4byte_addr_mode(nor, true);
> +       }
> +
>         err = spi_nor_quad_enable(nor);
>         if (err) {
>                 dev_dbg(nor->dev, "quad mode not supported\n");
> @@ -2686,21 +2701,6 @@ static int spi_nor_init(struct spi_nor *nor)
>              nor->flags & SNOR_F_SWP_IS_VOLATILE))
>                 spi_nor_try_unlock_all(nor);
> 
> -       if (nor->addr_width == 4 &&
> -           nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
> -           !(nor->flags & SNOR_F_4B_OPCODES)) {
> -               /*
> -                * If the RESET# pin isn't hooked up properly, or the system
> -                * otherwise doesn't perform a reset command in the boot
> -                * sequence, it's impossible to 100% protect against unexpected
> -                * reboots (e.g., crashes). Warn the user (or hopefully, system
> -                * designer) that this is bad.
> -                */
> -               WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
> -                         "enabling reset hack; may not recover from unexpected reboots\n");
> -               nor->params->set_4byte_addr_mode(nor, true);
> -       }
> -
>         return 0;
>  }
> 
> --
> 2.25.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
