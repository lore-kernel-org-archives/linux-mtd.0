Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74103C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 12:37:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 325386109E
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 12:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 325386109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ol8f5Is1Elq99sRsRI9GQd/4ajGRO+TPHbve+YV37eE=; b=1km9jdTrKQOdN7
	Hp3aqNUuP91Butow94+/k7BZaHVgPDl/l6G1wPc5vklTpPXqMyzyJMH640a0ixD+zQcVpQMXS/rza
	OZa+dHnzT8tVHQygjq3xRDYZziey4w/WsSlEaHx2XynGKwoVn7HVMlq16GNdDImEsb0AVVpN5QRHW
	/rAhoLC6HgtO9qhttrG3la2jucyscYskinfxMACsPwBnceRnrujhM25JFf+8q1uBm+Lm20vSENPAl
	bZYiuaAFk3jFALax94XT0yEnc+/7iIvvNGgpUGpeL4DPELfbw6NIiPtfcHVWLy9KKGC/Uk8pLRsLX
	z6l/15Q2xpMZHU/1oIQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdtnK-00AtaP-Ng; Fri, 22 Oct 2021 12:37:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdtnH-00AtZU-9Z; Fri, 22 Oct 2021 12:37:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1634906227; x=1666442227;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=b9LU25P4IKEJ66WEnYA+sClVXcqlkXbaOskVjreAWoo=;
 b=cGzWCMfros/gxzJ/GgIJUo0jSiJOcsTnMVc7nWCWt3QtpmoudTfPxB7q
 mzTDG0LCsdh7ucBUB7W5Uw8xTHfOSnumZ7icFzPuoljt1DV8EJRmVKxOi
 aLB6N6vyr8nG/oCq+hXCi/7nVdoMMPQKtQ66HBq7sh/V4FxoN+PduTBet
 IoYkLdLibye0FNP9ioZXmM4O5fXwPfWtJP6DOnNrgdsQEnR3OQLCUV4gK
 kHgAl99OF8jGk0Vk+VGQ1E8F8o/W28hENe/JkWKYVGBIMqRGdlkSpJIRL
 7OYEqGmWFROtqM3VmPaS6wEC1f+r5G1MucQ6qeavsl5NKSzURH0gOoMdO Q==;
IronPort-SDR: aqJXiD3Zh7NI9f0O2J5QzMSuHwdXmgIoW5IHjHEEkNLnkOrL1J0h4YwFvO1iMAiclluHUpzKQC
 yvFnyX+PdQiGBN9qNCZj3SHdaTIjPUN1lfheDfQmTdHgh0FdExE3lp1SnR5CGtILEsvs0JPBh0
 1xx6wTZyAbYyrSNHfmLf7XnghQ7jhJvzKwDncJIKbT+AiLMJsDEhvKZ1dBnxI7CSGrsoIIugyg
 0qeL2EdhBlx7W3e33Pw0jgGpo9XoM0vEyKhB4kbpvXZqdrXpKLoGozRp7glj7rTrmLfIROzV6E
 LdC+y8VB3QmSb0N6GP40ZB58
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="134031852"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Oct 2021 05:37:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 05:37:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Fri, 22 Oct 2021 05:37:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=heaRxmlprnawjTYBSIm1jRS4GYs0ioRqtTAeQqRItJF4pdsO4By5Deen3VM3Dk4ayXumm1q5viSWyRT9Tc4EENJqQ+5z7mhjGRUFNtGpejVLfAYjJNpVNqsskmRZOdmeW3/ruMR+bz8Pgt2GgEJEopGZ2MJOicioJZd3eSOMFaFHuzHOiXjfOa9n/+2P5RBMelhCYEck/eptHY3/9ZF9oX4NJwO8LTaf7bi9SysBWYzm9lj0XQTM46te3NYbbMunJgh/KHoyEp1Ce0c3GkzZ9EHcMEkKOzznfEkCMSpMuLZElHYPLvRdgzy/LC20P5SbpI5XhuemIktg+vCE5xDpqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9LU25P4IKEJ66WEnYA+sClVXcqlkXbaOskVjreAWoo=;
 b=obKsIiKsE3V+mKmQIEvZBcUkdp5wYoIkN7MemToZ8TE448N1iM0sOR/j4OhPCtwVhYSKhItb+mvuon8a/9cuaqrFLZYwYSCtVtQA5aqpFHnMSe4A9B/ACEEfljjgNLlNmMPUcdZqKgGp8ITmVwc/BLasajx3EfbRJA2q3l3G5SRysBXVJnrlv5IwOFSsTY6JxvmC3MRRnv74///qcvOfvGHCQ0LuMYJ1YU345nWKUlLbB+zMub23sse2bWFXdJ/N/yW/5IyWdinJ2OQrpR3DQtsjTrZ8BXrM1d4OTSBGgiTJ7NTQmAwNBByb6uQHkd+3JdIy+hi3gYuCowLUETDEfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9LU25P4IKEJ66WEnYA+sClVXcqlkXbaOskVjreAWoo=;
 b=R7jPHvGYizlVryRY9InhU4BCfVmjr7hKwjuN+/UK35PY7LpifxEUX28EVl5Mbb7qDrkTBkUOv2X1gxUK75shPOj9gNVH6zWZZPUVfLpSWpMxzlpcCjFFicdAln8kn0sN9ukFePPdCrDL3mgO2wwWxLSHBOyo5NeBHAh3oBlDz0g=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3293.namprd11.prod.outlook.com (2603:10b6:805:be::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Fri, 22 Oct
 2021 12:36:59 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%6]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 12:36:58 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v2 25/35] mtd: spi-nor: core: Move
 spi_nor_set_addr_width() in spi_nor_setup()
Thread-Topic: [PATCH v2 25/35] mtd: spi-nor: core: Move
 spi_nor_set_addr_width() in spi_nor_setup()
Thread-Index: AQHXx0GBhH05A/TAe0ir30IVxUxj9w==
Date: Fri, 22 Oct 2021 12:36:58 +0000
Message-ID: <d48f232c-de8c-257f-bc21-be2354dd6106@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-26-tudor.ambarus@microchip.com>
 <4375732149fe8c96a85ee119395e7400@walle.cc>
In-Reply-To: <4375732149fe8c96a85ee119395e7400@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3372cc93-f3f8-4d98-2774-08d99558a3f4
x-ms-traffictypediagnostic: SN6PR11MB3293:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB3293027E60FA840E7BBBDD39F0809@SN6PR11MB3293.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IKRyilIItszpH8bURt8LFL0AQMWbb//0oueN6ASxWjV7ZS+/6QjUBze4JH6qi33/xs24cs0X8ZvT/QWTZpdREExrqRSd7LqzUuJinyBBoXJ5Gl0/M2sWsgscs6XUT08Z14PY+PDCUuqRR0GiaDtA8k0hPDKyyfVpsrKiE+pIB9nIaBYhrkjFyoqfgUfnPDqgKnq41siOe+j2PBmKaLpz9P2uzpHhXye8cOKzHVXFw5H8JeNSo22OYXzrjU7tKth9yU8mgcCOuBUnWWbol8tKVjt1nDgLCvu7EckH2GMLBVvZySE8eSMfdR/o1/7N4LVr151AXN2RJA6agtMy+g5D4PVv4VWWAbYtRY2ttpxG84/S2I6zm4tsWhUzBHydW6WlZPEnbVq4C5pcGSDE4xrxPBXMIrXa0ntsCZiLhM6OhpewP4gPm7+UdizGz03W33h87Vl5zWZRZ80Wgoe3s6Hzfiihs3MRbUUOFc2b8vm6+lMlr1TtNfOaHR9YI6sLQUlE8hHEVsy1qUjuEMDDxEzAIGXtpFEcOncP8VYPvNshT6KbEC9+nJPk2xPz/36I6zRN9HpURdsdJqg05lVZu+gqbV3dNsg6qog3qcPCa8kgkl5rKcn2mmJ+FzHSCyMoW1ltkL7iEJBp0iAdSsLShNFH8Oy4UQVGbxU3tB0inaefAgO5PnO9ahkZHJec7oV+gRbLBkTfmJFUSxXUlepYgAyqpn5Go9bUYLmDbylVeL/IQ793/wLo25rajO9foms4I5SbZNx0I686xNO70zqHw0brjg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(91956017)(8936002)(66946007)(66556008)(76116006)(66476007)(86362001)(7416002)(2616005)(122000001)(4326008)(6486002)(31686004)(31696002)(5660300002)(2906002)(64756008)(8676002)(6916009)(66446008)(508600001)(316002)(54906003)(38070700005)(6506007)(6512007)(36756003)(53546011)(71200400001)(107886003)(186003)(26005)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NzljRVo5T1BiSC9Mc0MyZzhGdis0TGdsaWYxYmp0ODFUdGtvMTdvWU90OHd2?=
 =?utf-8?B?YXVlT1FYUmZGaTc4d1lPNVZ1cVFKM3VOaUNMVWkzZXg3ZE1QYzFPUFh4cElN?=
 =?utf-8?B?dUM2K1BvNzVZMkNJV2VQbmZvM0JTTVozeVlUQjFqKytiZU9pT1lMZWpXWkFv?=
 =?utf-8?B?aHNSck5WZTBleVpFd3RTbGsxQlAxWFRBaG9menh4dUQzcEJleS95WHRUajRM?=
 =?utf-8?B?eFUzNEVkV2Fyc1BSdW1BSnlacHZoY1h6UU43aVFEVGpvTXU3NU5iMzJDZEdk?=
 =?utf-8?B?OGV1S0FidnQ4aFJ5THNzM1dMNFc4ZTJOK2JtWFM5SXpaYWpJWGw4YVdObkFP?=
 =?utf-8?B?MFduSk9Obkd2NzVHVis0bkVxVC9FOGpJT0dyOWRTSFU5NmVJT1MyZ1I4cUJZ?=
 =?utf-8?B?ZUNveGp4UGxaZC8xM2ZodjZlekYzdEhJcWJXa0JrQXNmRzdKU3VaMnBqZERt?=
 =?utf-8?B?YU9lYmdrSHZEdGFiL1FQTTZ2bUlQSnBZZWRaWnJQOFBjN0lWSjg1eDVUQ2dm?=
 =?utf-8?B?cHNYM1g2aVNlOU9pNUxpVHcwblRMNDJLb3RpdmEvSEk4M1VxRDMyWGNiQlNi?=
 =?utf-8?B?aEl6UFJiZTBQaGpGa0krb1N5QlFvcGNPbVdLaUo2akNmbDNIMWlid01TWkEv?=
 =?utf-8?B?U1VYeGhIM3R6WnNHcHBPTURNR0lBVWI2MTJreU00ZVNZekhQWE5Yam11d3oz?=
 =?utf-8?B?RWs5ck01RUh1QVZuM0FLQ3Bncm91TkZpTGhYUW90WlF2L21aSHVLNFRaRWtY?=
 =?utf-8?B?dWN1ZUNpb3c5QjFSV3c2TDBJUGEwOVFzSDZyYi9WNGhWbGUzSHhTZG9DazRY?=
 =?utf-8?B?ODhDMUY4Y3RGZTZadzVZWEFWa3NWalVXWlRYeHU2Q1YzRjc2YjdKVmQ3MHdy?=
 =?utf-8?B?WnNkbkJoZmJ3TTdGMDEzYU1kcEtYS3FhU2pBbXJ6VmJna0h3akNFQi82UEZv?=
 =?utf-8?B?V3ZPaDNibnppR3dONWJ6NVk4cC9ZT3c0aHFrSnlzRjBzWGFqN080V0NmZVp0?=
 =?utf-8?B?RnRmTzE2TXZISS9zT1BUcDNSaGlLWkJiOVZBeGxmdFFBTlRtODJ5VmVRTDhJ?=
 =?utf-8?B?dWxxcm1ZSnljVHVyOEFjZjcwTEl6WnpRUlp3bXFoSFRYby90UWJDMjlmM1Fn?=
 =?utf-8?B?TjhRNUQ4NDMzc0pwa0tCS3pCMVlVQzBpcW90VWtYSXU4c1M3b0ZEK0w0emZv?=
 =?utf-8?B?eUYzSXM0YTF0RzlZeURJWHMxVzdNZnVpT2FTeldndVN1WitrS0pkdGh5NEdO?=
 =?utf-8?B?RzJUSGNSeTFwV3FsTTBsWDJtYkV3bXI3aTVsU0lKUWZDWi9vS1NYeUpUcnR2?=
 =?utf-8?B?WUtXaXJQNUV0UkFiRGpueE5nQnU3RDdGQWRMblBteGMwZjF0L0d0elFjSG5V?=
 =?utf-8?B?cmVyejlWSDVpZ0tLcFZKeU1yRy9vVGxvemxYWU13WTF0ak9XQll2YmxuZjNJ?=
 =?utf-8?B?OVNKQkV5cHNGR2lBM0lwQ0lpSUdna29NYW9xWSs3RE11bzhJQzRUQ0NabXlq?=
 =?utf-8?B?bFM0eWlmOVp6VC9Vd1d1c2pud29UcUp5RnR1VFVIN3dEY2RuaDd0UTRMN3Z3?=
 =?utf-8?B?d2xwbWFqaU9JRzl3cXRTUC8yNC93ZHplWHlVN0lFMWVabHh6a1ZrMDEvSEJV?=
 =?utf-8?B?alkzbWgycVd2Tmk5REYwUFBuaHZobDdSNGVDQnM4WElLREFsdEdROWZ2SnAx?=
 =?utf-8?B?ZVFZUWJ3UUJVYlBzeXl1bEVBY1Z6U2VveU9GK1Qya05PUDdCcU5IRFM3N2tq?=
 =?utf-8?Q?Bz02gJL7AAGh8BCoU8=3D?=
Content-ID: <4C019CC126BEF64AAB14167E7ABC37EE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3372cc93-f3f8-4d98-2774-08d99558a3f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 12:36:58.9077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3293
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_053707_552903_42C70E9F 
X-CRM114-Status: GOOD (  13.94  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTAvMjIvMjEgMzoxMiBQTSwgTWljaGFlbCBXYWxsZSB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBBbSAyMDIxLTA3LTI3IDA2OjUyLCBzY2hyaWVi
IFR1ZG9yIEFtYmFydXM6DQo+PiBzcGlfbm9yX3NldHVwKCkgY29uZmlndXJlcyB0aGUgU1BJIE5P
UiBtZW1vcnkuIFNldHRpbmcgdGhlIGFkZHIgd2lkdGgNCj4+IGlzIHRvbyBhIGNvbmZpZ3VyYXRp
b24sIGhlbmNlIHdlIGNhbiBtb3ZlIHRoZSBzcGlfbm9yX3NldF9hZGRyX3dpZHRoKCkNCj4+IGlu
IHNwaV9ub3Jfc2V0dXAoKS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUdWRvciBBbWJhcnVzIDx0
dWRvci5hbWJhcnVzQG1pY3JvY2hpcC5jb20+DQo+IA0KPiAuLg0KPiANCj4+IMKgc3RhdGljIGlu
dCBzcGlfbm9yX3NldHVwKHN0cnVjdCBzcGlfbm9yICpub3IsDQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3Qgc3BpX25vcl9od2NhcHMg
Kmh3Y2FwcykNCj4+IMKgew0KPj4gK8KgwqDCoMKgIGludCByZXQ7DQo+PiArDQo+PiDCoMKgwqDC
oMKgIGlmICghbm9yLT5wYXJhbXMtPnNldHVwKQ0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gMDsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHNwaV9ub3Jf
c2V0X2FkZHJfd2lkdGgobm9yKTsNCj4+DQo+PiAtwqDCoMKgwqAgcmV0dXJuIG5vci0+cGFyYW1z
LT5zZXR1cChub3IsIGh3Y2Fwcyk7DQo+PiArwqDCoMKgwqAgcmV0ID0gbm9yLT5wYXJhbXMtPnNl
dHVwKG5vciwgaHdjYXBzKTsNCj4+ICvCoMKgwqDCoCBpZiAocmV0KQ0KPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Ow0KPj4gKw0KPj4gK8KgwqDCoMKgIHJldHVybiBzcGlf
bm9yX3NldF9hZGRyX3dpZHRoKG5vcik7DQo+PiDCoH0NCj4gDQo+IFdoeSBub3QNCj4gDQo+IHN0
YXRpYyBpbnQgc3BpX25vcl9zZXR1cChzdHJ1Y3Qgc3BpX25vciAqbm9yLA0KPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBzcGlfbm9y
X2h3Y2FwcyAqaHdjYXBzKQ0KPiB7DQo+IMKgwqDCoMKgwqDCoCBpbnQgcmV0Ow0KPiANCj4gwqDC
oMKgwqDCoMKgIGlmIChub3ItPnBhcmFtcy0+c2V0dXApIHsNCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXQgPSBub3ItPnBhcmFtcy0+c2V0dXAobm9yLCBod2NhcHMpOw0KPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+IMKgwqDCoMKgwqDCoCB9DQo+
IA0KPiDCoMKgwqDCoMKgwqAgcmV0dXJuIHNwaV9ub3Jfc2V0X2FkZHJfd2lkdGgobm9yKQ0KPiB9
DQo+IA0KPiAtbWljaGFlbA0KDQpyaWdodCwgSSdtIHJld29ya2luZyB0aGUgc2VyaWVzIHJpZ2h0
IG5vdywgdGhhdCdzIGhvdyBJIHVwZGF0ZWQgaXQgdG9vLg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
