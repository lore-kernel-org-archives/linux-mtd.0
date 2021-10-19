Return-Path: <SRS0=PxVx=PH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010FFC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Oct 2021 10:16:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98C4E61381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Oct 2021 10:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98C4E61381
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6mGcVmjzz0nl4J3x5PSeGEXmAzYSqhrr8DPu3ku+5Vo=; b=YHQAzd/V4soO74
	Yc6iY047H75/QULXJAouXwioDlhip3yoglvY8e/Im9frvciZwCzaKlAmKDs+BT2oWvCJoWFOo3Me5
	hUfXRu+/zNJRurqLK/go40UqSjUfbQWAe6pnJuP2ZU2OmJOG+Yyf280QH3cDi1pkz7p7G5mXDNDit
	Umv2HGbz5COEwfRE8TJ46IvhyAgbQ25mRfRdYS+NONOx9dIbKq2UWjYoXozUarQS4G69GwBDLZsHh
	OfClKGDJly2b+Snfs1wx+duBbEDEODaaPlnk8DZH5b2Hm0CTqmx8Bz9K/xPn2CHxRwa7dA0XTKtU7
	5qpVYpkpTvtPtWFKrM7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcm9p-000mUx-7o; Tue, 19 Oct 2021 10:15:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcm9l-000mU6-KY
 for linux-mtd@lists.infradead.org; Tue, 19 Oct 2021 10:15:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1634638542; x=1666174542;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YkTSWGiQlQ1sAqxgso27KLI6l6NWgd/4oquaJ9mqwFE=;
 b=xdgL6z5jQtANviu5rY6mQSSsJDFzonzTZZfRvNbnTnkeBHKydKujtxR3
 M2fk4sYloakgx1GdGPNewxY42CKq0g758Lt6jRyFOf/xFhnlIYI4oJkJJ
 bV17zc1UUX0WjlvqsSajcPPuieMGewIAJByw2hPO/1Tzs88jyuoJi39o0
 8lFEmCFehL15ORmUrEcxwXGK6nrvokO8nU3YEOVz7wIt3tTY2ePxAXXrZ
 BKPet/3+ksPRcyBUCTNqwmx4LSd12aWeWYnvIYNbZGfYfZ8xzOAaJiE6J
 Tulq3Q2Vt8uSR14Lj6zapzRlJ3LGE68XthSsPx5XhSHyCpvu2EXSkHIzd Q==;
IronPort-SDR: US3CuYa211d6db8BC0DDXLZFPS5epqj3vUoQR+tj8ZKKdLXlKoCr97gWvVOBZU9dafLhW6mqju
 r3snzWulTGpb8Q7W/MXQJZNe2/IyylOSvJb/DCxE3ZboaPy2IORPfcvE9vV5IuSOqYr318z9Xl
 znw3xq9VLwGLzfe8GLjq/7v9uw2FuqRyJrpIjaI0TK3DYX53BXlZVhlXxqm2YhOFT1EMaZmIuw
 VGrxnhh6QSm8B/Esv0Y0uYdt5T16a4vpHLDwKjh1pDmzFmvS3lbDV1TDM2hEEAbkEZMXBMUmMG
 Uk/8G0KHu30/O6H8RSxuWx5x
X-IronPort-AV: E=Sophos;i="5.85,384,1624345200"; d="scan'208";a="140265620"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Oct 2021 03:15:39 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 19 Oct 2021 03:15:38 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Tue, 19 Oct 2021 03:15:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDIfQSuLgVziKoFPu7iD0mYSoV+tFHZoPt5jBKqIkB8gWTUvDmVSHcBkvJ/w8uuGXW2DuEt0TwOcdIL/ZkaQ5bo/+aeekoXlA+77/fUI5c64KmeoEyx/+x+/LZ8YBe7IAbyYcBL9MqjUf9GfW3MXbZpme+F44qh3ZcBC3sriVHJrIuAlf0sw4XlZ3Vb2m2iTF6PaIhFLt8VN5F+x3UO0b/pb4a9s99fM6o0PXtHhdBF+uvb6uNj+VfuYKKn+U7hjZtLc/6FtzarKwfUN2d+ik9TP9yK6ZpxCDxn0ID7FVVtG/CnYWEggEmzXQh0ZrvRQCM3XZUPjR4r4AkZBP5jJpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkTSWGiQlQ1sAqxgso27KLI6l6NWgd/4oquaJ9mqwFE=;
 b=VdLqkcrmUQv1yhDw8qYejwCw2ShbeEd4WjQ3r+vrlMQ8tcKSOoP5FMWKu1+V4ClMBnN6d7w4UFszrbqWhDJcqIJf45caAW/Jqi3+iE3b21zMixodvGzBjROLgS/YEpe51uYEN1u9f2SE29q4EJ+V2uR0ISVZWtaalS/pkqG736R6BFQ0iXAzFxsW+thc2oPg+WpF5l1giJY3GMMQfTVqVM/HZOFCk0TdwLKLlFjztmG6Ws/S8lJtLlQoxOVMVY5uFqijoqZzdPDCDuSiF/ADcnkmtUTAIEnkkt3nszg7QzBxnUhav53zTDJsTp9ZV208/19txY4zovWXQQoP3HuZzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkTSWGiQlQ1sAqxgso27KLI6l6NWgd/4oquaJ9mqwFE=;
 b=ctWx6UN6XYd6aT0sPv7SEc5XpmVuWQAveT5mFIsMOnf/lhqCLRnBcl9yD2+wnjswPbta25wN1YHEhufuX7ejZY7xM8R7bICNZBJWsQ+HuWdt87c3ZwtjfJlFO1pgI1OL8O+WeTtZU34ZsSO6DJfErBklRo0ivaKGld9uI12hhuI=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5020.namprd11.prod.outlook.com (2603:10b6:806:11f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 10:15:30 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213%9]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 10:15:30 +0000
From: <Tudor.Ambarus@microchip.com>
To: <jonathan.lemon@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>, 
 <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <kernel-team@fb.com>
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q128a13
Thread-Topic: [PATCH] mtd: spi-nor: Enable locking for n25q128a13
Thread-Index: AQHXxNI+1BddtKsDZky+yj3KnlBzMQ==
Date: Tue, 19 Oct 2021 10:15:30 +0000
Message-ID: <bef07b81-d1c5-0788-2b57-6f2edaf345e0@microchip.com>
References: <20210628211729.3625017-1-jonathan.lemon@gmail.com>
In-Reply-To: <20210628211729.3625017-1-jonathan.lemon@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2c36f3a-0d0d-446f-4301-08d992e96156
x-ms-traffictypediagnostic: SA2PR11MB5020:
x-microsoft-antispam-prvs: <SA2PR11MB5020B9C3B9CA720FDC322AA8F0BD9@SA2PR11MB5020.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:415;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G1R4hrL8wQamVoYvbvcwGlB21bKzyGE7W3LIocfely1uaVefxGO7ozODuG0UWyFvbM85XOxoJmTgrrEIlN68QWzCPpB+O5aEk9qM2o4EwJyOyJe2gSaZ3z7tJl5hfmtsMozE3apKSiI0fCwkmRYoF/b7cUgciazAuoYzce4idVKpOlA2U00mdUI42TXXzS4EiyTwRYAZWt+PF9m3BkWGbw6bmhWS3Xq0Qy3LFdXqCsq6GNHc4TPs9a8S5X7hRKm3mKfUt+P6P1dBos13yQHED4PkaTQl2KmHWLJoDiISNEjUEDrbS0+qdvrzccsCFOWJC3BRPFu2bevOTecQO7Mie6cMltIGECCHhIpMnPli3Tyc5jAx+7SbkHI6zzBtt1+sKDuZJ6icPB1m2t4vV/dym+ujp8CI4yVhxi8Fn/99N5wJax1k76lBZzHGjYvd0AxnXN+6ympKvgEPDbN6OFbQoh5DYMtmuS5qY6fz6iB9dB+IuWV/C8/Ga+kLWxrLcTxF6fRnEg3kwrh+pU2PiF6hCSSqLg5DHsn43xVOrgqI7ZPR9JCqr9UwlmbOytSwkIGWi/4jTdQzHEqZfp21SjYyivuPW6Fxz3vp4FzKZ0PrW3jFkbnbzMLTi3TvwzSOb2WWDESa6yP+JLhG4NhD7fx+zm4GrePq/Hzw0Al69cqKny/QtBGZ5XtihO+jEeRKOsfvl1u8NMuWrLNUlUCaT/YQv1IFKyfXtQ7SRhVUrfiLpBH6GDmW3CuvYNnEpvrIcz3Wl/6NFx8L0HKOfqgnNrOQqVBUVS1N5PIteYZNTSMy7/vlpctSaL2FjW0Jv60lG57nkas2TiUxsHLAktFO947jNg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(186003)(6486002)(91956017)(508600001)(76116006)(4744005)(26005)(64756008)(66556008)(66476007)(5660300002)(8936002)(6506007)(53546011)(2906002)(110136005)(83380400001)(66446008)(86362001)(66946007)(2616005)(38100700002)(316002)(31696002)(38070700005)(36756003)(6512007)(122000001)(54906003)(4326008)(71200400001)(31686004)(138113003)(98903001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1lRYlMxbUQrTmVKVUFqbzVIcjhlaVJBTjk5S2VyNzBWR01JbGRGUGU0VXg1?=
 =?utf-8?B?YWIyTHNDNWVHZSs2dzQ0WVdwYmxNYjF1eDRjWEEyamRJVzJRWVhOcWZ5SHFm?=
 =?utf-8?B?cGNadkpoRWhMaTlmUlltclNxSDR5UUY4Zm9ndFdzU1lWajRzNnlqU0M5ODFM?=
 =?utf-8?B?dHJwWlZYRVRMWUVMbjR4ZzFwNDVUNytTbXpHRTB2TmZxWEhpcUJsWnBBTWJi?=
 =?utf-8?B?aEFVMlhLVFRQU0xoVWFpZEQ1R01NbVJ2R1JZZ0wxZU0xOWlwbkJsczJzYi9j?=
 =?utf-8?B?d3l2MkFrKzNZeDRYYWZEcUFPYmczSFFaV2JHblZkM1dVZkJ5MklIRldpTFBk?=
 =?utf-8?B?SndCMW5DZkhMZDkrVjNRUkV2ekE2TlFFbldZMUN2OHMxMldlK2FBMk1rTG9v?=
 =?utf-8?B?YVN4QllMRlhKdk1NTkZnZ1F3UkNaTExGQUljQ1kwZStITFRWdE1aQm5jdlJV?=
 =?utf-8?B?MmFoZFp5NlZHd1lJNkd0RGhLNE1zeUpvU3JDVkg2OVlKamVZN25iUTZBbEgr?=
 =?utf-8?B?VlYrZm9CeHdpTXBKYytCQXJRNENiM0tvVS93VG53Zi9lREZybHdyUkdaTENn?=
 =?utf-8?B?di83dVVOeXd4U0FyUTFVbkxIQVhET05KWE1PUXB0M0FKSEZZbUg5NDhxbEF4?=
 =?utf-8?B?VXphVlRlVlBKd3E2dThuZ2FKMFZST3RVMTdDZUVXamNXS2o1Q3AvM29DQWg4?=
 =?utf-8?B?ZlY3ZkNhL2RrMUhZYTd5M3ExcGdBeU5hSm92dlRiUkFxTks4SHBTcVJEd0V0?=
 =?utf-8?B?NjV5R1k0bFhDSzlkMlFSaTFid2M5SHVSbUlSQk9YTTV1ZitGTHdMb2tQRnky?=
 =?utf-8?B?VTc2dWRCY1B1UGwrZjF1WWFLMUtiKzMzUjZpWlI4ekVWQmNrZW9YdURKOTIz?=
 =?utf-8?B?alNnSlVvUjFiTWNWaU5QSVBSUmtoaG5mSzQ2THJ2ZUJNeUJZNUk1MzRyQWli?=
 =?utf-8?B?bC9tcy9qSDZONGdOcGFyWEFpRmZEUXRKcDE1dHBPY2M0SkRFVWlQdWtnMDhi?=
 =?utf-8?B?aEhRcTBLVk9DNldrVmlodmhhVkVpN3BFOU1Ubjd5aGF3dWNESDl2Zy93VWFO?=
 =?utf-8?B?d1NNbkNxdFI3dFNpMENPQTJjd0Qyd3YrN1JtbFhpV3hJdW5teUk4MFgwMlpC?=
 =?utf-8?B?WVplbnlMSTJqR1JraDVMSEErOGJQZk8rTzZBcStvbTlZT0ZWRWZSbkdKeG9p?=
 =?utf-8?B?QWdHMUJKZG54MGd5WlV2OEZyR3JuSzRlWnhEOC9xZ29VK2F3bEtPcWtIWE9K?=
 =?utf-8?B?dmF3Vm9xUzZEODcxZGFGQTNqSGFWb3FDeW9PK2VuV29EZmtUa05uMGN1Snkv?=
 =?utf-8?B?NHNPY21qcXpOdlBxQkJnWFA3ZU40Z0tnSE9lMmlSeFlaUEY3WmtmYWRGeXBF?=
 =?utf-8?B?MENaMkxVbjNOYzMwQlFSbTZSMUV2OEZ0eHhBeXdTQThXNVRvVkQzWW8yQmVu?=
 =?utf-8?B?NG4wRVVqMGVtNldPcVBZd2tGWFhsYllDVm9FUWt2RmhnS3lXNkxUeTNlU0t4?=
 =?utf-8?B?a3dXZFF5NU5ZaUYzYU5CUUVtcm1qeDQxV1c5RVY2dWpoQStTZTF6RnZhVSt0?=
 =?utf-8?B?OUpXbmxmMHhuZEN5SjZnbjdTdzJYMXdKdklvOEtsTWUyWjFzbEdOZVNXZTVE?=
 =?utf-8?B?UFRUbWlmRFdRNFIxK0RyWE9sWklmUGU3NFhLZnJBUkdMQVZjbWIrbmV3eE9l?=
 =?utf-8?B?Z0QrbGhjbUs4VXBGbWJ5cW51SXNBUWZGT2lmNHljOXkwWEpxbUZlYzg3VzdE?=
 =?utf-8?Q?lh3r0e2zAlZmRm4U8M=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <14A9108B1FB8D7488E34754A2226CEA3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c36f3a-0d0d-446f-4301-08d992e96156
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2021 10:15:30.6818 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SR1h8cLS3N0t2wnWk6rojT2SFccSDwSOIKKb7FEf0dxqQI5ZhPJjEMVhFzdF+1Gf2r4SDqV/87VlcqdokHdeP+ZfbfKT2d6rLviHqZJhaFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_031541_821196_B7922F3A 
X-CRM114-Status: GOOD (  12.00  )
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

On 6/29/21 12:17 AM, Jonathan Lemon wrote:
> As 4bit block protection patchset for some micron models are merged,
> n25q128a13 also uses 4 bit Block Protection scheme, so enable locking
> for it. Tested it on n25q128a13, the locking functions work well.
> 
> Signed-off-by: Jonathan Lemon <jonathan.lemon@gmail.com>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
