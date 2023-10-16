Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD304CDB465
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Oct 2023 09:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ux8dL43ZEzjRBQJlud8Rf45+D9FNhcDerr6pnWhtP/A=; b=xaCj4fAhVRLBvV
	rGWSaKVVGxlLcFd3dxVCn6jb1wZ4X9U/0DLvKFToI402eRORJmMtTZ+KjHMray3vNMamOOowPcdkc
	kzWeZGpGqjJ8x6RbTFQ2VU3DDk9kuzJlNh87LIHkc/db4KmbFNhfnQwst5yL0T9+yqusl+PHpS0Vy
	qOvfltgnPvA3Qm5QoGx5GECSe4/hNWUqslb1PqCBuaN7jrqgFxpXeMFGKGbSfPiKax+ABaZ+rgInK
	WJMPN8cHJ2LlXHsn1fcQ7jA/a+Afs+y1C8oTIs2u8k7/8TgaBqaJIlNULom+TGGyPrqtWgnF9+Kjz
	igXjKbPoQ/qO8HBg/wGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsKIx-0094ry-1B;
	Mon, 16 Oct 2023 09:54:31 +0000
Received: from mail-am0eur02on20705.outbound.protection.outlook.com ([2a01:111:f400:fe13::705] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsKIt-0094qg-2u
	for linux-mtd@lists.infradead.org;
	Mon, 16 Oct 2023 09:54:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJd/cuCxB/1KockDfPc7CLaK77HH1V6n3SKlEdedGxfHLxu3TAcasC6rcN7EZQ1kBONw5LsKaV2Zf97iwYHE2+OUwAP0UxK7ssF6bDYaZRwZKz9wWnBK9Ie6tIgzRBE+jvUX8fjB93G5rwbOyiz6Y7qK8cxhxE0paCgKqztJwvkyvQnzYqnEENpADJB0BMqnP/7pKGHdT1qswle8HQyxkP+GBkkdPxq54bSmly8i+ZWQ7yV+7t2Q5oso1t+OdKbFuZHGu19cJFQ+5s0LpP+dheT8KhK5u65ztpY2VsDepXeoFbbZ0htkUp9wPxT44TXlqNLo7KTNzZWaqTL8kSolGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1NhTVgpeNGil0nDYUXSnJ74iW4SU67XoLkoH+wYb+g=;
 b=W65lww3MBP6BTcwLGR+wxc5TU1wP5bf1JMihUKaqFHB5dd5zrdpFJlpC55kURbhsHALjT857kqkcOIJ/uc/BDJRGaPYW19TxSMvzyF1mGOib7tsff2wWEBbNnvtTBt7iJ+W3RhKu8E1mZx9iz9hGrqfEe7sZ6RP25q7zw2snQwVaJEIOA729kz78Sdeio8HryJEdnO4EU/bRGlCpK0oDYD7GcMLAC/Gf37KFEiSTuXWg5WsdgYXJ/qLX1UvP0qaK9OSXWKglbQzw6M1SQyfWhL7mzU3wuV5uS4yWZ3SzbC0EVljQ2pK/YhHuRTLJN25K3jkZGAC81FSUBLsPU9tyrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1NhTVgpeNGil0nDYUXSnJ74iW4SU67XoLkoH+wYb+g=;
 b=Z0KtnIOKInJwLHJRGK917SexL0cXmYvk5JUY+kA+3sZqcK4ikZl1YvBkWmWfwQga3a5q/vbwhcupU2Gu38T38QDrbeE/fTIz6v6kU/v3T1D4fgkmT2+Kiqv+XVBpK41p21PIJirnfbN7DhFE9AVH99icIIHj1nYrs21vko5v6Fc=
Received: from AM8PR06MB7137.eurprd06.prod.outlook.com (2603:10a6:20b:1da::16)
 by DBAPR06MB7077.eurprd06.prod.outlook.com (2603:10a6:10:1a1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Mon, 16 Oct
 2023 09:39:21 +0000
Received: from AM8PR06MB7137.eurprd06.prod.outlook.com
 ([fe80::c2f3:e304:fe49:3514]) by AM8PR06MB7137.eurprd06.prod.outlook.com
 ([fe80::c2f3:e304:fe49:3514%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 09:39:21 +0000
From: SHUKLA Mamta Ramendra <mamta.shukla@leica-geosystems.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, "pratyush@kernel.org"
	<pratyush@kernel.org>, "michael@walle.cc" <michael@walle.cc>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
	<richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
Subject: Re: [PATCH v2] mtd: micron-st: enable lock/unlock for mt25qu512a
Thread-Topic: [PATCH v2] mtd: micron-st: enable lock/unlock for mt25qu512a
Thread-Index: AQHZr1hWPkDpy3UlU0qGBS67M1mV0q+3GdCAgAHeK4CAPY5YgIAvS6uAgBWqFYCAAEtqAIAACFeAgAAKcICAAUdUAIAAMwOAgAAD0ICAACfxgIAEEGaAgAs50wA=
Date: Mon, 16 Oct 2023 09:39:21 +0000
Message-ID: <fd6b5e43-7e90-b98d-79be-0c65840ec433@leica-geosystems.com>
References: <20230705154942.3936658-1-mamta.shukla@leica-geosystems.com>
 <19800e51-a871-be9f-9eb5-5829237e2613@linaro.org>
 <a8271289-0611-4e37-cf37-0be19a85656b@leica-geosystems.com>
 <084ed945-7674-280f-5866-9238473a294d@leica-geosystems.com>
 <17989610-d069-40e2-9b4d-7ca6bdf2497e@linaro.org>
 <a24d7b3b-4077-9dbe-49ae-96f595b42223@leica-geosystems.com>
 <2d7271b3-dd60-44bb-9700-f6a5295ea873@linaro.org>
 <372046cb-9135-9a6c-fdb7-307a42f55b30@leica-geosystems.com>
 <a86b93c4-a507-47c7-bdce-4aed8dfcf929@linaro.org>
 <eb2a9138-a76e-4b1e-e001-315149c4dabd@leica-geosystems.com>
 <f0a7acb3-00b5-433d-af5c-724a509fb816@linaro.org>
 <bc76767e-00c1-47ca-9a27-2aa7d2a262f6@linaro.org>
 <b9b7bb93-fe23-34dd-6a30-b1b0d792861f@leica-geosystems.com>
 <2e3ce75d-7e2d-4e62-8660-48a41074c20c@linaro.org>
In-Reply-To: <2e3ce75d-7e2d-4e62-8660-48a41074c20c@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7137:EE_|DBAPR06MB7077:EE_
x-ms-office365-filtering-correlation-id: 5c487a05-11c2-4249-9db1-08dbce2bc692
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GLi63y41q2cxTO+ZFB34KU7pHgNEQXf31wWgg8Ks1Mmq362/3UeZEyQfNJXQ0h549+kFF96A1xGa4eZQgbnSK8JHZQkSm80tXFcu36SJyUq+OPZ5KzGa3ekYeM+VLD0TgJjRj3aJmW1mK9+RA5C3XSxWoPQUi9w+W5AcMLUZ+RVPAnMtqJOGHLpk/aefccX0JjwGqCKQc2FspH6YNbv5hdw0Py+LP1I1bOcGwFPzvMaZSSlfnKeGLpaF6qTQzwx5ixhSzSMPDAbZ2VM1WY2ZdRWCwV4KVG/l0TlWxV71AGwFVI4j7zD7Ei8wn4iVgbT+IbRCWjozGDT9wnXa/H3bBKBTiot+EVMIpC7oD4rOwqs7h63hR2D985s9U9zizwS5WZabNrxhdBeeDjEZDwXnPUomqwN9XT2hM3LTAbR2clFjRz9HfshKknJ53PDsTogqDxCvL0yGdBn4rNZJ8mVgFeCRFH+LYk26CfB844p4HD7Vr7XrqX2pbJbLU0paFAc+rpRnTj6GbJPffi5PJjxXsQGCr3PAdsGJ4FKDidCOPDpq2gjpCr+YQKma4vQmPjKKLrPcZ0VECwFawBhk1NfReBPnI+ZBbjf96pYOF2sBoAhAGGvm0BMlNjYuVuJpqq3XD2RgXs02ZXkjlWL/NKmxSKIYj9udxOLElUCzM8337qA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7137.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(376002)(396003)(39860400002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(110136005)(2906002)(41300700001)(6486002)(86362001)(966005)(478600001)(31696002)(64756008)(66446008)(66476007)(66556008)(36756003)(91956017)(66946007)(53546011)(76116006)(6512007)(6506007)(316002)(38070700005)(8676002)(8936002)(26005)(2616005)(107886003)(31686004)(83380400001)(122000001)(4326008)(71200400001)(38100700002)(5660300002)(138113003)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zm9mN2wzQmhLVk16Q3dPQU9hR2xBSUNrR0VkeS9qLzZqVjlNN21sSEJBVjZO?=
 =?utf-8?B?YVVpRDFEamYvSnZISjlRZG9EdlJJeElBMTloL01JYjhPOHJlbUZVUXRhem5X?=
 =?utf-8?B?L0l0czBJVXJxN01rVVMyVmk5Nm9mWmVRTU5FNEdvM0Vsc2MyMkpVQ1owZlB1?=
 =?utf-8?B?Zmc4ajVwQ0Q4UVJFdVU1QTNUZk95dHpNaUJ2Ky9HZCtJczRKVVBSRVhyVWNJ?=
 =?utf-8?B?YW5QZHF6V0o2ZlpoQ294dzltS1RhSmQvM2orRGkveWp1MEJPM1VIWUxjeHcw?=
 =?utf-8?B?c2Y3U2kzUytRYnR4R2Z1WE93NmxiWm9FdHl1YzN0MTRCR3UwM2krRjhUMFB1?=
 =?utf-8?B?dmtIVExMcUFhNlIxbC8zcktmaUdHQ3NrS0lSbW9DSURYQVFPbmlsOE9jOEtz?=
 =?utf-8?B?Z2VPNVNFUkc4WEZ4WnpUNGRhUDZsZS9lK2I2bGdQMG9QZU82NkZJYk12d0NJ?=
 =?utf-8?B?VDFvNUZ4UG8xL0lkME5EK0pFbDZMcVZhckg0OUJRbzVJeTNVNUxuenY2dUYw?=
 =?utf-8?B?MjFCQ1pRMDY4dnMzQm5YUTlyWEplcndJeFB5RFZyOWZ4R3pmWWtBb3RFRXZZ?=
 =?utf-8?B?ekNoeVd3SmZBSU5yQzdvOUFLK3ozd3Iwb0prYkI2bUd6Z1FVeEVoZitTcjJY?=
 =?utf-8?B?NS93c1kvaFpEUmFsRlpwT0NReGdSRTVVSWpSNnNtMGFCVWMyT1pZVHZXa01Q?=
 =?utf-8?B?SnYyNXNNRXRTaGxNN2RHby90R3ZqRVlTUnRvNEoxR0VWbzA0Ym92cEUrZkpw?=
 =?utf-8?B?eWNuUVBnN2Y5ek4zVkhCaElneEZ4Vld5RnREc0U2bkswMGlKdUMzRUIwVzlq?=
 =?utf-8?B?T0FCeUE3dlN6UnRvZHY0VEJEQWVkQVI3ZmtBaU00c0VsbzhvL0FDRkdEdlFH?=
 =?utf-8?B?VTM5dUJoV1UrSU5zcUhlaWVYNEFFL2RVWUJSeFZ1ajZma3BGc0UxMXAxK0Jl?=
 =?utf-8?B?RWNnYThwUHdwbUpOMmJHZzBOb1JiNzVVNmg2NGlZWlFrZ0l5amVmZUpTVlk4?=
 =?utf-8?B?Y0JzOUpCOUJNUjZnWng1MlQrZXEvd0t2NWVrWUdyQnh5SXFwUVBjTnYzb2dE?=
 =?utf-8?B?TmExeWJJOS80cEJ3SXF5cFhKYnpxb0tVcU11aG9EUXl4aHBublRUYU9vTXRk?=
 =?utf-8?B?Smpoa2x0eWEvMWU1RW9Ua2g3dGphc1pGenhZWnI0dzloS0pKMVZXc1ZQWVJ6?=
 =?utf-8?B?ZWpiRW01aU8wVXBiZlNFd2FXUG1tZ0lGam4xSnZpV1BSZVg2WFNHSFlYbk5n?=
 =?utf-8?B?RDZFVkZ5cGdVZW9mNmczNlpsOEI0aTBoZGZ0eGlMVXNGS1ZIckNxbWl1WERW?=
 =?utf-8?B?blhBS2xGYVJoNFFPZ0RSOC9rdGFxZlp1bk9jM0w0YTZUR3plMGw3QyszVDFu?=
 =?utf-8?B?aURoaW5QQVhMdTZQUGN1a0VYdE03STBHZVc2YlkwUTZIR1RoWldTQnIvb0NC?=
 =?utf-8?B?eWwrYUZkdUlxdEprbk41Ykl1MDhVYk02c3ArZ1hXb2pyL3N6ODRBM0xPVVVr?=
 =?utf-8?B?N2Q1TkpqQU5FNUtkMXF4YzFjdWFlREx0WjZGZ0x2alF2WEdud2wxZExlelpX?=
 =?utf-8?B?VVZqMllrUVR5RzJhblYzUUJBSWUyelBMV1Y4eGNjK0pOQjA3TldmeE9JemJv?=
 =?utf-8?B?R1ZDZVVUQmx2U2FFNFV2cDlzOXVBUzBtZ3IwNjBkUGozZ3dPbCtQZXpSYWlG?=
 =?utf-8?B?WTd6SmxMTzBoUlcxeEFMVmlPTE1YN0s3WnBjVlFXMG5qN2tjb2UxZ3ZJZEhP?=
 =?utf-8?B?bmRYQmF4Tm11Mm1rdlA0Q0Y3QmxnVnR4Y1BnQURNWnBaUk9KYVhpSUx2Q2VT?=
 =?utf-8?B?ZkszUXVCeVNMc0p1ZHZkUXl5cDhuQUJ5RGFFVWFoR2pqQzZQOGxtNGtFenho?=
 =?utf-8?B?YlVtUHpMN0puemRidkkwWFVrQmUwRWZOODZGVnFUTy83MmRRNzAvbUczR216?=
 =?utf-8?B?aVpGK1FVODdUdTljY05xSjgwS0l0Z3c2a2JKSW1xS0s0b1BPVGUveitZdmU4?=
 =?utf-8?B?bU5rRWRzNGVyU1hjOVhzK0JOMHB5WWNDRVRURkNYb1F6UFJES1B1Si9Oais0?=
 =?utf-8?B?bVBxM2xVeWZWRDVtYzBJTnBnQjFMc3hnOHZFY0Y0Z2F4clVQa0l4V2hFTkhE?=
 =?utf-8?B?NVZpSjNuWmNuOWhFa2IxM1RSZitZbngyQi9zL0NXcjYraHpTM3o5UHNVOGpX?=
 =?utf-8?B?Znc9PQ==?=
Content-ID: <C81596741C450648A5482D8D3BC4F527@eurprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7137.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c487a05-11c2-4249-9db1-08dbce2bc692
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 09:39:21.2989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sx7+6/Kkp7kFIRZvb/QhV9mwS8HBCsxWO60kjMCelZV3bjg2ysXbOpromUjU0wTz+ndr5pwF6tGwpQ831fSSD8K4MSXXcAG0P7oFOzOgqeAh0BKT760ywFY1KvKOS5wi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB7077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_025427_942689_AAF93D60 
X-CRM114-Status: GOOD (  17.44  )
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

Hello,

> On 10/6/23 17:09, SHUKLA Mamta Ramendra wrote:
>>
>>
>> Hello Tudor,
>>
> Hi!
> 
>>
>>> On 10/6/23 14:33, Tudor Ambarus wrote:
>>>>
>>>> Hi,
>>>>
>>>> Thanks for the debugging info.
>>>>
>>>> On 10/6/23 11:30, SHUKLA Mamta Ramendra wrote:
>>>>
>>>> cut
>>>>
>>>>> --------------------------------------------------------
>>>>>
>>>>> IMO, HAS_16BIT_SR flag is causing lock/unlock failure,
>>>>> since BP bits are calculated wrong then.
>>>>>
>>>>> I tested also for a case where I don't parse SFDP and
>>>>> reverted the condition in  micron_st_nor_default_init()
>>>>> for 16BIT Status Register Flag. And lock/unlock fails with
>>>>> same log as Non-working case.
>>>>>
>>>>> And this mt25qu512 has 8-BIT SR as typical micron-st flash.
>>>>>
>>>>
>>>> Indeed, the problem is that HAS_16BIT_SR gets set when it shouldn't have
>>>> to. This means that the BFPT table of the flash is wrong and we should
>>>> fix the parsed settings via a post_bfpt hook.
>>>>
>>>> Does the following fix your problem?
>>>>
>>>
>>> here it is again, this time compile tested:
>>>
>>> diff --git a/drivers/mtd/spi-nor/micron-st.c
>>> b/drivers/mtd/spi-nor/micron-st.c
>>> index 4afcfc57c896..20f76e278095 100644
>>> --- a/drivers/mtd/spi-nor/micron-st.c
>>> +++ b/drivers/mtd/spi-nor/micron-st.c
>>> @@ -180,6 +180,18 @@ static const struct flash_info micron_nor_parts[] = {
>>>           },
>>>    };
>>>
>>> +static int mt25qu512a_post_bfpt_fixup(struct spi_nor *nor,
>>> +                               const struct sfdp_parameter_header
>>> *bfpt_header,
>>> +                               const struct sfdp_bfpt *bfpt)
>>> +{
>>> +       nor->flags &= ~SNOR_F_HAS_16BIT_SR;
>>> +       return 0;
>>> +}
>>> +
>>> +static struct spi_nor_fixups mt25qu512a_fixups = {
>>> +       .post_bfpt = mt25qu512a_post_bfpt_fixup,
>>> +};
>>> +
>>>    static const struct flash_info st_nor_parts[] = {
>>>           {
>>>                   .name = "m25p05-nonjedec",
>>> @@ -405,10 +417,10 @@ static const struct flash_info st_nor_parts[] = {
>>>           }, {
>>>                   .id = SNOR_ID(0x20, 0xbb, 0x20, 0x10, 0x44, 0x00),
>>>                   .name = "mt25qu512a",
>>> -               .size = SZ_64M,
>>> -               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ |
>>> SPI_NOR_QUAD_READ,
>>> -               .fixup_flags = SPI_NOR_4B_OPCODES,
>>> +               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
>>> SPI_NOR_4BIT_BP |
>>> +                        SPI_NOR_BP3_SR_BIT6,
>>>                   .mfr_flags = USE_FSR,
>>> +               .fixups = &mt25qu512a_fixups,
>>>           }, {
>>>                   .id = SNOR_ID(0x20, 0xbb, 0x20),
>>>                   .name = "n25q512a",
>>>
>>> cut
>>
>>
>> Thanks. Yes, this post  BFPT fixup resolves lock/unlock issue and
>> I don't see HAS_16BIT_SR flag in params.
> 
> Good. Please send some patches addressing all that we discussed until now.

v3: 
https://patchwork.ozlabs.org/project/linux-mtd/patch/6b89ae4e4d7a381050746458cb000cd3c60f7a42.1696849423.git.mamta.shukla@leica-geosystems.com/ 


>>
>> Datasheet is public:
>> https://media-www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_512_abb_0.pdf?rev=b259aadc3bea49ea8210a41c9ad58211 
>>
> I'll take a look later today.
> 
> Cheers,
> ta
>>
>>>> If yes, please add some prints in sfdp.c to determine where it's set,
>>>> either in BFPT_DWORD15_QER_SR2_BIT1 or BFPT_DWORD15_QER_SR2_BIT1_NO_RD
>>>> Is the datasheet for this flash public? Would you send me a link to it
>>>> please?
>>>>
>>>> Cheers,
>>>> ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
