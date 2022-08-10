Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45BEC00140
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Aug 2022 08:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ye1cH8ysSJzJD6ZhjzBfYtWpRP347qC3R6OFPQ/Wg8s=; b=cP0HS6vRT0JpTj
	CljaUdS81DQlJTWpBPeccMrFTnK5UvhEPq0J0WokCxt/36Lb4jiibWRrO4WY/iUltFiAeMOXjmxo/
	I9K6GLdmMelpNq037hS9c2XVJWvQ0mJ0IZ6yBy9fofShouxw2bFJ78DFbjnWLhCmw+98xUV4TwhA0
	ybdlz8M1ikNiDkj+WdZtmLUcgvxocJQNGmMLtIaX1hBs6CwkDSdojJ4Xex7F/7UM6sUPEWYP/8OFk
	a80blIemutrFm4wmKd3833fhHzaSAE0AYA5qbWOBOV/eOFCDSq2TPCCycbzuLvwD/3EkRtcpARw5H
	zVewLV3ZZ6HzpcWLjzig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLgk3-00AbYP-Cu; Wed, 10 Aug 2022 08:07:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLgjg-00AbNv-Ga
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2022 08:06:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660118800; x=1691654800;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=k8lmhiREFfx5dcFLajRLzeEsiI7RV7gK1uPWugeoi7s=;
  b=fzmitKHoy1fP0I9A6m/s6RLYWQ7RC3BBzf5LPCT3drpbWrgUyCjeJpzG
   ZHo4fr5yT2yMFOM/jGhb4u692/MYLJ/jGurvLS0rUw7QiP/V+FsMgpkjs
   tjMNoiv81E6pPyuAXpTjM2aqm6lmgMP+HJ0Th2jGt49JBQDpNWW4Y+RgR
   wA2R2ed6ThRLSUqxuGbsKdWo/UPqBWB5uTFllqp1sUcuaJCCSj/EcTatA
   Z2Yr1C1DVxh+2dfas46beb+BFo63TzNPKLOkE06n2tIKBVdB5ptiRLKnA
   Dry4Kv9mV8Dx7kiMPNh4tJJ+6oE7kaTEYtqCE+K1I6ASolsx3hS60bYkN
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; 
   d="scan'208";a="108375593"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Aug 2022 01:06:32 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 10 Aug 2022 01:06:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 10 Aug 2022 01:06:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPoqytnS59oqbXZlcJiosUxiz0G3KiLo5YtivAH7hCTYpMdb0JRN4FjaZhfXbX817E0gPB5mIhtdEdW/x5HUunigz9pBTY21PUksK5nINQxS9S0TFvtDRFbmG3QXruqWHYRjCSJUk7YQbqp7aZLI3a9zr8XwYLyzmOAZz7qA8bqmquRHs7R5SCWM5t3hVXWgZq1Lj9cx/Hd9W7q7xquEDM3oeeu+1PpO3MLf+UHqvfx0Hh39DwaZM2veWUZyKKgTV2ukPk8ZDFwp7H9ywtDcAYC+51X/pPcWADDH9A62TCaI2Rvxghxt+t4NQGSXoSjWvRM7rjf+IiGHSmQeisN9ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8lmhiREFfx5dcFLajRLzeEsiI7RV7gK1uPWugeoi7s=;
 b=m0hk/FamQScenTTroDJW0EWTc84gmLtoOHX4QOrEZ7cmy9YuFPvyBouX5aasMNuFxgOYMKZsMhlUAKGM201MC5aUoCvO7WJyp69ewZjTahsiXJ1HAcMzCTiiT6imTVKrBr1Egm0oAy8UdVmsxOq2zkyuZ2LexIfXiGzqKwoK5XjeB2EJnixa8l4RbVqsszqR9sapiIAIsTeLdF5AfMQmko2KXS7WWg+x+rR90I0ZwhfX0SOp6bCSd0+L8JJbGvGPf1WPGXFzYynFbaOVX4loGZpWxjtvGgJ4P6DFR/og7ZeQgpBKZ2O0X7S7UJKCigV1+7gnq/pSvwB+CNYMm7UMvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8lmhiREFfx5dcFLajRLzeEsiI7RV7gK1uPWugeoi7s=;
 b=mv5E1j0z8IS+KVax7oyPbMF6Iea2N4VhN+kHmqW0PYgSIQnfcXRwTcPd8uLw+A46rHmgkGVyfe85e/Kh/aYhXRp2mW7Oe+Uz5tjY4XBniiLjFewZTOUwD96vOyVYww6o4v3LDM7+3thlN8n+zetbreorSotKwNDPGl92wT4CJfc=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 DM6PR11MB3322.namprd11.prod.outlook.com (2603:10b6:5:55::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.17; Wed, 10 Aug 2022 08:06:21 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1cf7:6d4b:5e26:3f56]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1cf7:6d4b:5e26:3f56%8]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 08:06:21 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sudip.mukherjee@sifive.com>, <pratyush@kernel.org>, <michael@walle.cc>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <greentime.hu@sifive.com>, <jude.onyenegecha@sifive.com>,
	<william.salmon@sifive.com>, <adnan.chowdhury@sifive.com>,
	<ben.dooks@sifive.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] mtd: spi-nor: add SFDP fixups for Quad Page
 Program
Thread-Topic: [PATCH v2 2/3] mtd: spi-nor: add SFDP fixups for Quad Page
 Program
Thread-Index: AQHYrJASR2XJCCWNYkmLP3pHpwj/WA==
Date: Wed, 10 Aug 2022 08:06:21 +0000
Message-ID: <361fa56d-617c-ee92-151e-5d8fe0a29e53@microchip.com>
References: <20220809201428.118523-1-sudip.mukherjee@sifive.com>
 <20220809201428.118523-3-sudip.mukherjee@sifive.com>
In-Reply-To: <20220809201428.118523-3-sudip.mukherjee@sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3450d509-4958-4b9d-8f19-08da7aa73640
x-ms-traffictypediagnostic: DM6PR11MB3322:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kjRSOAimYTkqF02zKN+zRotoYVKODKxvD6/BE9BY60UhIhnfUfXQVQdKl+T6etA1IS1J75PAMdBLoKSEfncsHQCAE+xx4+d/5JxymPDuglHipJVlBWR6FWzvk2WsbKIvGvkeuiRqhm0J3+Esl8vDyGzOUwLt4grHR/KDNsc83DK3pA9G/F6M9o3EU1DPi3ijxWSoSXxAhLZIuFRWa0OjAidc982lmuSIWd9+pXiHpFOzNd904+L8rq5pGQnxwNTZ9IIdEGW1c2fNIzKeRLvPAzN2ONvYNvVFu+RavG47B4/i7FdxSS+hhCgPmN8p9mJjvd4CtyhDo0umEd5Nw+pI5PV9c9jMG1psjDU44nmh/qm9qoh3Mbo1o74gv712MqZbUdrHaU0R5qcEkJTQVSv9jhDJu3rcQtjVsB7NNFNi6H48e02ih+1KBbUZqOadQ/vCcm3X5PlYsfXd249QA6O84hWWR1RGPsgVCAFS+VfKbzuapWWQBHZRVGvolfEivXwhsdDAHpT5F4cY2Mm+lJHnOn1yjxsMiAJ9mKCRZg857me6++Svh6QdHPuP1ZjtvF4POm5FHzImvufQl4q3LK67+6XmwzW5bB00XcJeHMMwh5fBe9a14TS/hZK+QXbVr0ohNryfPaBbnAjjpT5e466YIr0LP8ybumBeGnLiPjRPwWgI77vD5E7f5T9leRY+CiD27MGy47G65VahvhMIJZLIbXls0Q1pAHJZdgYFhYMbWgWFhiCWd4Bjf0EIq5yAFdgeYmXA5vnHC7PvpSc1gqF6C/aeCChoFlJ8zrkVv33frjJcoKXuvhJBk5xXcBtRefcov0YNwxkc5DcYIAktw7lPueUQUNUXqbPjaeMoPfWBAZVNssTPiZ7T/7o2sNHp/j7tbbLg/yjYhco1MaenETrsew==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(39860400002)(366004)(376002)(136003)(2906002)(36756003)(38070700005)(122000001)(110136005)(38100700002)(54906003)(316002)(4326008)(8936002)(91956017)(66446008)(64756008)(6512007)(26005)(8676002)(6506007)(53546011)(2616005)(5660300002)(6486002)(478600001)(76116006)(186003)(41300700001)(66946007)(7416002)(71200400001)(66476007)(86362001)(31696002)(66556008)(31686004)(45980500001)(43740500002)(352734003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkJ4N3ArS3Raa0x5dnd1RU5WUCtyQ1ZYWCtaMFhIMVdxdDd5UmIxOUhRTkg5?=
 =?utf-8?B?ZDFueGgxYkwzU3BuUkhmTC9yMUlKeHhhRmxyTDVMZ3kzeTZXVzAwWmkvL1Zo?=
 =?utf-8?B?TmE1NW1DbWk3T0pTRy85cU05UlBFc3pkRHN4U2wvbFpQNWpSYjl4eURyckVR?=
 =?utf-8?B?Z2FDS1RRQ2wvWFZHdUFHYitkblNKUnNpRnVDS2NCUWl3a0dLRzBNeHMyaU5Z?=
 =?utf-8?B?MWNheWcvSGNZdDlLS0ZzM2VoY0dpSXF5dXFGN2djZ3ZoOENJR1cvWFY0WTZX?=
 =?utf-8?B?Z0s2Vi83dE5RVXU2SHp5RjdTUDFtUGtYcUhQKzFlbG5xd1ZCMEZtS0JhZ2dZ?=
 =?utf-8?B?WkF2VC9HcjYzTE9IVFMrR0l0bDFsdzRlYk1GUm4wVFM4RllneVgvVUdsbDA1?=
 =?utf-8?B?MHZBWjhkM29OUmRJRDZlVTRUSU5TckZ1N3Y0UW1sVkpQd0UxS1RObkhUekYv?=
 =?utf-8?B?andwT0hvMjRoeFJFN0J5WkFEM29KM1dtcEFndklhNmxrTzZBa3hSMzhwUmls?=
 =?utf-8?B?RHQvOXA3Mmd1R0ZkVyt2akIyQUpxV1VHdVFESWh3aU5DclVrNGp4clNZdWg5?=
 =?utf-8?B?ZkZpR0tvaXg1OWRWc0x5ZzYwOEZyUmVobmNFL1FMTnBkS2FXS1dBRHNsODVF?=
 =?utf-8?B?UTd5am1keVdoK2h4WWYrbTc0SHd1RTNnQUhtd21xVy9VTmNINTJCaXd0VzdO?=
 =?utf-8?B?RnRWRVVXeHRiYnFWcE8ybW1rN0lZUk9pZUJCbVBVNldrNlpTNTRDT01MTlVp?=
 =?utf-8?B?eHR2SXFGWjJtanloRC8rWnA3amp1UElaK0NVMGlKMmN1Z0svN3JmeTFYZ1Qy?=
 =?utf-8?B?dUJtYVdoZDJYRlJQNGp0RHFualgwdEFYSzZFSFN4TjYwbXVhU3NYZEs4TWdD?=
 =?utf-8?B?NS9BWmt4bWxXN1RKeDZKMkxXbUVvMlJSY0NzeklCb3d0TWc3QXdYZkxjQnZN?=
 =?utf-8?B?NFBZRzNkNk9BNFBOcTNmQk03VG5yc01IbTQyaU8vUjhwcXV2dm4va0hHQm0z?=
 =?utf-8?B?bFJ0Nkx1SFg4ZHgyTEhIZHlvSFFMMGlBSTRTbWc3dkR1cGlSRHVSdWdIem5r?=
 =?utf-8?B?WStuZ01MUE9LcmdOQ0I3UjdNVUpuNTFXQytBRk5wL2laTzh1Zll0UkpJL08x?=
 =?utf-8?B?QUR0MklqRlo5Y3B5ZzQ4ZVdiT0F4cGZyUVRRTzByWWw2Zjh2ZGNtUVQyUXpM?=
 =?utf-8?B?Q3F1VG43dnBncWlCRTYzUDUrSVpycmZwa0NsOGJlSVZzVGU0ZHI4MDhzVEZo?=
 =?utf-8?B?U2NXczJvZWI4b0RmRmhXMmhHY0dFRUFPaWY1cXlSc3RDSnF3MjU0R1R2RmNG?=
 =?utf-8?B?ZHVkODExS0U3SkxpczI1QVJlVU44YmdHNUg3Rmh3cDAwa3dWRXI1eVNEbFlv?=
 =?utf-8?B?NmVRMll4Vm5DN3o1aDNoRVJ2Qm55cUVjWjA3ckFvWHlielhjREhpZXBKc0Vi?=
 =?utf-8?B?R25DWkRGWE5pRW93SjdsSXFQTlNXUEd5am5YNzBCeTVzV1hXOWw1VTF2aWJz?=
 =?utf-8?B?aEl1TzhGV3VOUHZoQ0tTVkNpeWpmTnFFUXlxcGJETU8wSHNMMlpNQTR2Qmo1?=
 =?utf-8?B?OGdNNkJjMHlrb09ubndxZ0RRZTQ3SE5yeU9hak1GcmpNVHFWS2xmbEpEbFZo?=
 =?utf-8?B?SkJTVTY1MEhvZ3d4OEE2dWtyWEtudzdOUFFualRxMm5SRUZ5YVZXZzRXanB4?=
 =?utf-8?B?d2Y1NlBwRnJ4djViekNRZkRXcm45RUdIZU5YVUZtcnY2ajlXNVNjVjlDVWlL?=
 =?utf-8?B?U2pYY0tWYy9OWEN6WU51ZGorZ2c2d3Jqd1BVR3haWFpTczhsUUtRcXpYYjV6?=
 =?utf-8?B?TUh4dWpYSEF4djVydC91VUVpMUc0eTUzdHFJSysxeWZrQlhoTE1UQ1hNMFBp?=
 =?utf-8?B?M3VnZW9tbkQ2OHdnSGZtdnhjVTZScStBcktORWlzQU9NdkNUdlhxYUxhR0hD?=
 =?utf-8?B?UUw4RjNLSjA1NWhBQjRHZnRaSEpCbmRLN25kMGRsakVFQkU2dlJ3SnJWWGxq?=
 =?utf-8?B?UnprZTd6OXRYNVJBWmY0Q3JrdEJJREl5SlBOekxYTjVPZDVxaTdld3piTU1U?=
 =?utf-8?B?eHowWGUwOXE0TVBvOXk4bmRSZWErWUQ5Z3VEWmh3WlhFcW1jNVpZQzlXYzNU?=
 =?utf-8?B?TnZzNk9UUjFLb1poMkdxeDd5UHFyVmh4NHFCR0RiNXRrUm5lVmdmcFVIaUt3?=
 =?utf-8?B?Q0E9PQ==?=
Content-ID: <C724B384C0DB4C468B0F3EEBF0BEC305@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3450d509-4958-4b9d-8f19-08da7aa73640
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 08:06:21.4518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mDFAPuiokU2VsMJ7pBg4FkgSaPnSTdqbAi8B+R7Fz22YynWJi/x/ruh6LQhG6i/KDk9JD1vrWrTNTbBKzklawqAFBJmUHKky682xl9M+qw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3322
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_010640_703770_A02BFF66 
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

On 8/9/22 23:14, Sudip Mukherjee wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> SFDP table of some flash chips do not advertise support of Quad Input
> Page Program even though it has support. Use fixup flags and add hardware
> cap for these chips.
> 
> Signed-off-by: Sudip Mukherjee <sudip.mukherjee@sifive.com>
> ---
>  drivers/mtd/spi-nor/core.c | 9 +++++++++
>  drivers/mtd/spi-nor/core.h | 2 ++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index f2c64006f8d7..7542404332a5 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1962,6 +1962,12 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u32 *hwcaps)
>         if (nor->flags & SNOR_F_BROKEN_RESET)
>                 *hwcaps &= ~(SNOR_HWCAPS_X_X_X | SNOR_HWCAPS_X_X_X_DTR);
> 
> +       if (nor->flags & SNOR_F_HAS_QUAD_PP) {
> +               *hwcaps |= SNOR_HWCAPS_PP_1_1_4;
> +               spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_1_4],
> +                                       SPINOR_OP_PP_1_1_4, SNOR_PROTO_1_1_4);
> +       }

setting SPINOR_OP_PP_1_1_4 should be done in spi_nor_late_init_params().
spi_nor_late_init_params() is used to adjust the ops supported by the flash
with the ones supported by the controller.

> +
>         for (cap = 0; cap < sizeof(*hwcaps) * BITS_PER_BYTE; cap++) {
>                 int rdidx, ppidx;
> 
> @@ -2446,6 +2452,9 @@ static void spi_nor_init_fixup_flags(struct spi_nor *nor)
> 
>         if (fixup_flags & SPI_NOR_IO_MODE_EN_VOLATILE)
>                 nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
> +
> +       if (fixup_flags & SPI_NOR_QUAD_PP)
> +               nor->flags |= SNOR_F_HAS_QUAD_PP;
>  }
> 
>  /**
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 85b0cf254e97..7dbdf16a67b4 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -130,6 +130,7 @@ enum spi_nor_option_flags {
>         SNOR_F_IO_MODE_EN_VOLATILE = BIT(11),
>         SNOR_F_SOFT_RESET       = BIT(12),
>         SNOR_F_SWP_IS_VOLATILE  = BIT(13),
> +       SNOR_F_HAS_QUAD_PP      = BIT(14),

you won't need this
>  };
> 
>  struct spi_nor_read_command {
> @@ -520,6 +521,7 @@ struct flash_info {
>         u8 fixup_flags;
>  #define SPI_NOR_4B_OPCODES             BIT(0)
>  #define SPI_NOR_IO_MODE_EN_VOLATILE    BIT(1)
> +#define SPI_NOR_QUAD_PP                        BIT(2)

No, as I previously said, SPI_NOR_QUAD_PP should be declared as a
info->flags, not as info->fixup_flags.

> 
>         u8 mfr_flags;
> 
> --
> 2.30.2
> 


-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
