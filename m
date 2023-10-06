Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94955E92FFE
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Oct 2023 10:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vmlH8IG/oN/5VcP34W0u9tp3tOMbOHH/60F8XRLsReQ=; b=vUCn58aY79iHgC
	FKF1yUxZ+cllHC7mZs3ZHjRXizG8MuO1KCgrqSGLKw0UvYEC1H/YuERJAw8mb/uzw7nkFEUxMM5AZ
	uB7lIPGrbI1p2gXr7jpE8NGkGa0xRFPyHMXHtNpL8qeZ1lEfhhROPbnkeJBVrSh1S8e6SAxw9dGhH
	qeNl9Lm6dZ8grbt6aP88/rqDI5QU6uFhXDwwm5eIHn2Wc72YrWbvQipHi4PgVvdLdz2KcwZigHXsT
	Sdd7DxKZzcQCjAWuEwskTGP+bHx29aU3gmk6rQ0Vy7MXVfjezIihXS0KPXehWfwNyzSBmylwd6nVf
	EWsXeRkjEwKQ/WIuGNqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoi6f-005cSC-3A;
	Fri, 06 Oct 2023 10:30:54 +0000
Received: from mail-he1eur04on0726.outbound.protection.outlook.com ([2a01:111:f400:fe0d::726] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoi6c-005cRD-0r
	for linux-mtd@lists.infradead.org;
	Fri, 06 Oct 2023 10:30:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjRIEKFV9kkTJdsR1Xv5KB7eKO0cKFiHSDaCoRV3sNAoQvwH9/md10ux68EvJ7EqU6RL65IJNbaCwoL4nC13P52rD6Z15KFwdAUFMtqnQ8vcUvltPAXaUKAxOImB7VsWYQYsrWbOh5jKEWgtxEskq47XAZnoRo4QprmGp7sd9QeGVV52f18dGEVQfA6ANe0zpfuYL3/lJGTjV1tgw8mVlqX8qM35uCbjB743kxjwNYqDTyyVFf0vuLenGXkCob3/IvrskNq3gEty+WFasbCMB/Qw3CrGPS8isQiZNAUKkLp72K9lkGySopQ418VAiWgUm5NVv8eKl06awTrCFFZowQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgEH/0uEghDPFaLPVKoJA3sWUexwYGW6BUlTW1vYook=;
 b=VsGrYY00DecUv3ZxCnEOE5Y6dHMu3TqncM0beVY7Xz6ycCvvhI4hNXyyCPBw2GYbc0RVQp9U629sJ9hjbpWxKbfpRJ9VnATRsS9N/a8/Vyen1fUQ8WmWKGs8h06eQBHgH50Z9/vo4q+MlnDZdTXkcWHppfIp5K+/XKg2m2NZUSvt37d1Tq+F3e8ytPWtIt8hM4pee6BCQ9cq6JcRTBPth094G4l+JCld+vjwRCw6NR0WYVa722jqw98rb1QfhoDNyq15RlgvMaAWhcoF9LlNJutjBPHPLyiFOJuS665O9rl/orRt3qEKgHkcu8vPxq1cIrmzkIoeDo4Qxh0H+xuAew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgEH/0uEghDPFaLPVKoJA3sWUexwYGW6BUlTW1vYook=;
 b=mXVtHtqPKH8XQRv7eLOcoTOEIyVQmx2+BjoKi3JB1+ihooZAIg21Tn9WIwqkuGytiI5wft1gq0rdGCDxE8tXLrl+LQgEMo54CvMKpXTnVG8WHWrEk84NZWv8zlXDCiNxyRskI0OzFofuaCF+VVl8YViOftgwDX/BfrG7Ope2Sw4=
Received: from AM8PR06MB7137.eurprd06.prod.outlook.com (2603:10a6:20b:1da::16)
 by DUZPR06MB8818.eurprd06.prod.outlook.com (2603:10a6:10:4af::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Fri, 6 Oct
 2023 10:30:36 +0000
Received: from AM8PR06MB7137.eurprd06.prod.outlook.com
 ([fe80::b828:856c:4735:e870]) by AM8PR06MB7137.eurprd06.prod.outlook.com
 ([fe80::b828:856c:4735:e870%7]) with mapi id 15.20.6838.024; Fri, 6 Oct 2023
 10:30:36 +0000
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
Thread-Index: AQHZr1hWPkDpy3UlU0qGBS67M1mV0q+3GdCAgAHeK4CAPY5YgIAvS6uAgBWqFYCAAEtqAIAACFeAgAAKcICAAUdUAA==
Date: Fri, 6 Oct 2023 10:30:36 +0000
Message-ID: <eb2a9138-a76e-4b1e-e001-315149c4dabd@leica-geosystems.com>
References: <20230705154942.3936658-1-mamta.shukla@leica-geosystems.com>
 <19800e51-a871-be9f-9eb5-5829237e2613@linaro.org>
 <a8271289-0611-4e37-cf37-0be19a85656b@leica-geosystems.com>
 <084ed945-7674-280f-5866-9238473a294d@leica-geosystems.com>
 <17989610-d069-40e2-9b4d-7ca6bdf2497e@linaro.org>
 <a24d7b3b-4077-9dbe-49ae-96f595b42223@leica-geosystems.com>
 <2d7271b3-dd60-44bb-9700-f6a5295ea873@linaro.org>
 <372046cb-9135-9a6c-fdb7-307a42f55b30@leica-geosystems.com>
 <a86b93c4-a507-47c7-bdce-4aed8dfcf929@linaro.org>
In-Reply-To: <a86b93c4-a507-47c7-bdce-4aed8dfcf929@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7137:EE_|DUZPR06MB8818:EE_
x-ms-office365-filtering-correlation-id: 3131772b-5fc4-4c35-b2c0-08dbc657474f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eLQv8jI6EtTNBWulY2VsjpTmnCO6XdLuGEJhgYgJzHTJAVn/wcWhKNFa41eT3gysf+twFztypdteEN06krk+JDmOcKfBBzSXzAIZg5uiWUzyUcxQjPecGntCzml/rygIyMKsOEeucfFu1jTxjjJgimS2l90E1pPZbjxeNDgiOFKMM1+W9B1n/SKOQ1TqI2kF9Lw+hEoYqZBkntuOON2VNtuaSK7VJWMLvhkkphcRX6IJXdiPgeRaFR4vljWYKM5CyDnML8DlAwQaHj+tq6o6DxGYryU5iL57AXpdyDaZs5PWvD73yib9A6MOtIyTlYMHDYSMovajWCpwhcWSB9D7syGf+sl7dQ4KvH+gyGi6kbaO56DbIt440yKifbGtyJRUJS/9SLt0ut4C8FzMmzt22ue9FboSX9CRYKS/5bsosC20MQZDRUHmwAncCAy2iaiYLrBqtjJx3OZS9iHKN7BgBIWHGWO8ipSy/vFDWWHRAmmcfc7nTT8ydBJJi1SDETesk+8PpY7zUmhgCLLkJz5OxlycqWxxYcgE06BRQNn/mxk6CPZH2A+hq52JJgTBsnZuQ8qD7/oZCkUn1aYWVucNZBF+kFW+uBKXaiw1/JLNzJye0fzMf+2P+eV99fSVP6qwh1PcDrKp5Epg3lixqiH/sSyAqqsaSvHtOdJggE1d+qQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7137.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(36756003)(31686004)(41300700001)(6512007)(6506007)(122000001)(38100700002)(38070700005)(31696002)(86362001)(2906002)(83380400001)(5660300002)(4326008)(8676002)(6486002)(966005)(53546011)(107886003)(26005)(110136005)(478600001)(2616005)(8936002)(76116006)(66446008)(66556008)(64756008)(66946007)(316002)(91956017)(71200400001)(66476007)(138113003)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2VINmtrSmE5bDJxeklJL2dqZ3hYS09DQ3YrazZjQUZsMTYwZGZzNmg2L2NP?=
 =?utf-8?B?VDNaV1JwMmxtYko2Mnk4ckIxblpWM3VSaDhYZnV2L2kyK1dBWlR6SWNLV0hy?=
 =?utf-8?B?N0ZwWHg3b0FqcUMwR0R2Uk5Rci9YdkVSaktqWUNoRXVhd0psNHAwVWJwZll4?=
 =?utf-8?B?bmRmS0J0OXdkcjFiYjJpR1AyazBtbVhIMkZMVFpTSkdQcHh5QkFDM3dmWVY2?=
 =?utf-8?B?UEEvRmJJd3ZXSWk1YjRybEdrbGQrK0pESWU2ZXM5NDVtN0hyQTRXeFNFUE9s?=
 =?utf-8?B?SnA3UStraTNnQ1RSUEsxL1cwZzlOcW9ZZTN1OFA1bVVrYm40K1pURExiczhR?=
 =?utf-8?B?V2x1NnBFb1doVVk0a0kzOEpsclNsWVBRdW1wVlRYNitxTGtYWEN2T3dmb0ZD?=
 =?utf-8?B?bnFYWlcrVnZySUNqZnlwb1F5SjBJQWliQU9rckRKR3NxS1d6YjJHd3F6UDJQ?=
 =?utf-8?B?VXhkemFQa3cwY1FRV0FSZTFWTTVITDBmSUtkRVhmN0lBWk9acU1RUWkrU3VY?=
 =?utf-8?B?Q1loajBLbURtSExJTkdhN1NJNzBLQlE1elVkRVRVVUVlTk9uQmxFUCtCcTRi?=
 =?utf-8?B?SjhaRVZSbFhVMTYrSDJGTGZ3dndsTzVMNGc2SVlwYmxIUXpCSi91dGNrcDFx?=
 =?utf-8?B?cWdpVjBsN0dDTlp6MW43K2k2amh5VzZUNEJlbDBLVWZTMzVlbnV5UmY4UXVp?=
 =?utf-8?B?NVE3UjdZUE9lQVFzT3cwQVJRY1pTcVArNFg5UWc2MzA1SXpHUXo0a1BVL3FO?=
 =?utf-8?B?M3VkWlRqSSs0Ui9qK1BRSHV3UE5Zb2VJMjhSckRIM3V4U0l5WWIvUTd4MEFC?=
 =?utf-8?B?b2o5VDNxWVBJRXM0N3BMdG44TWlQVGE2VWNXV0Vzak9YRHQ2V2w4Rm9LWm9O?=
 =?utf-8?B?WmtRV3pLQXEwaWhBS0l3QjU0SEQ3YUo4YVJUU1JVdW96dkJHTld0REZSaW84?=
 =?utf-8?B?Y2R5bUNRN3hhc3hHcmR3QVNkRUNLZEMvd1pvYkV0SDlpYVpFY0pCRGRtOWVB?=
 =?utf-8?B?bEM0SVdrY0VTWlcyNGoxRXR1YVgrYjd3cnRFclVjRUwyQXUySWpEMEZxbnd0?=
 =?utf-8?B?QjBzTGZKTktaaWpvdWhMNDBobFp1Sk1DdzQxbGw4RzYvbFY4cVo4UFJiRm5Q?=
 =?utf-8?B?Q3MzdWFiaVo4VTEyaVNyK3M2cG5vSFNaRmVIT1BRYXI1N2VUT2JzL1dwdXg0?=
 =?utf-8?B?TmZLUVJxeEttL1RLSlFmVVR1VU9OYmRVT0c2T3ZkWTVON3NzTkdHelhwQXJV?=
 =?utf-8?B?Z2dJSWNqY1JiaVF3V2VTU0F1dnlSU011TG95em5NY0FjckxKd0krNXZ1czhQ?=
 =?utf-8?B?V1MxMnliYkRweHd0QUpnNWg3U1VYaHVRTWhpcTArUS96WEs3TkJDUWxKUXY2?=
 =?utf-8?B?a3loZzRKS0R2V3o3ckVxN2U0alhVemN3WnUwdXBqazRTSk9ZVlBZSmpQUU5N?=
 =?utf-8?B?MGt3ek9jdGNraitXZGJyUVdaNDRObW14eU1uQ1Jqb2J1ZjVKcEVLVlh0VVFV?=
 =?utf-8?B?UjkxKzM4WFc0MkQvUHMwZW1IRTRwTWt0QkFiQjFYT25Ic1lxUFVUTVJBZmtM?=
 =?utf-8?B?bGlmZEVaMDBrV1FTRDQ3QjNhV1ZtVDRmV2N3c1JJeitseWIzeERPU1I4K203?=
 =?utf-8?B?SU5nUnljWnRpTUJBeUpNTDlzMkRBVTU5MCt6M0JjaG9Rb3QwQ0ZVL3R5bXRh?=
 =?utf-8?B?U21qOStpUytscEFwMGZHb1dQNWxpSmd5Q1Z0T1k3RkhsVS93M3dOdlBHeERN?=
 =?utf-8?B?cTBvWUhBVU93RU9SRzY2am1LMmtiRjJKbmdFZ0k2QUg4czBuUFVXUWhGRlVQ?=
 =?utf-8?B?dGR3SXYrQU5YTnc1UU1XQzhPaFNIdkFwLzNmM2xkR0lZSHI2d0hRcHhQWUIv?=
 =?utf-8?B?eFM1aGJ5K1B3UjhkdHdMWExOU2ppa1ppUzhYUExIYjdxS3BvcTRJZ1VCL1dP?=
 =?utf-8?B?ZU04a0I4ekdrdjNwVGVXN1BabTNuSkJGendoNy9TMWxSR3hCeDA2TC80Z21h?=
 =?utf-8?B?KzVNSHFiSXMvYmZaVXNNOHlMeEc1U04wR0NjRjhEeWREeTk0TkZDVTh3N0Uw?=
 =?utf-8?B?M09nOTVpVURYLytnQ0Zmb2JCZ3JoeHB1TjhLaTAyR0RhN0lzT3lER0U2UDk3?=
 =?utf-8?B?Z3hwaFdkS25LRkdDdFBiUy9TRjBIQ0ZjYTN5RjVXT2N0RUp1WFJlSzhZL1U3?=
 =?utf-8?B?WUE9PQ==?=
Content-ID: <12B99209C1FFB24B9DE5D447E7AADF33@eurprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7137.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3131772b-5fc4-4c35-b2c0-08dbc657474f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 10:30:36.3842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gzNNQ407zF2dD18JJCrGylQzvbPw6W6R9AsutMZbYBn2nEeiUvDs2pKn2kZQPAru3F0a9HImqVvQPwCe5zX5xLvYWZjzbHqNSITO16A1Y19C+rZIAiTXjcUTkZBqAXAf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR06MB8818
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_033050_573559_B527F929 
X-CRM114-Status: GOOD (  18.05  )
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


>>> On 10/5/23 10:21, SHUKLA Mamta Ramendra wrote:
>>>
>>> cut
>>>
>>>>>
>>>>> and the second one will add just the BP support, something like:
>>>>> diff --git a/drivers/mtd/spi-nor/micron-st.c
>>>>> b/drivers/mtd/spi-nor/micron-st.c
>>>>> index a8da1f18e335..fdafbfa0f936 100644
>>>>> --- a/drivers/mtd/spi-nor/micron-st.c
>>>>> +++ b/drivers/mtd/spi-nor/micron-st.c
>>>>> @@ -405,6 +405,8 @@ static const struct flash_info st_nor_parts[] = {
>>>>>            }, {
>>>>>                    .id = SNOR_ID(0x20, 0xbb, 0x20, 0x10, 0x44, 0x00),
>>>>>                    .name = "mt25qu512a",
>>>>> +               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
>>>>> SPI_NOR_4BIT_BP |
>>>>> +                        SPI_NOR_BP3_SR_BIT6,
>>>>>                    .mfr_flags = USE_FSR,
>>>>>            }, {
>>>>>                    .id = SNOR_ID(0x20, 0xbb, 0x20),
>>>>>
>>>>> Of course, I expect you to run again the mtd_debug tests and also verify
>>>>> the locking. Thanks!
>>>>
>>>> I applied both changes as mentioned above i.e
>>>> 1] Switch to SFDP and 2] Using BP Flags.
>>>>
>>>> Case 1: Use BP Flags and Switch to SFDP
>>>> With both these changes, the lock/unlock doesn't work.
>>>>
>>>> ## x86-64-smarc-evk-uwd0j0007 # uname -r
>>>> 6.6.0-rc2
>>>>
>>>> # flash_lock -i /dev/mtd0
>>>> Device: /dev/mtd0
>>>> Start: 0
>>>> Len: 0x4000000
>>>> Lock status: unlocked
>>>> Return code: 0
>>>> # flash_lock -l /dev/mtd0
>>>> flash_lock: error!: could not lock device: /dev/mtd0
>>>>
>>>>                error 5 (Input/output error)
>>>>
>>>>
>>>> I suspected this is because of miscalculation of BP bits, like the
>>>> possibility mentioned here:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/commit/?h=spi-nor/next&id=3ea3f0ac242c86c0275d347ab8c92bf1eb854b49 
>>>>
>>>>
>>>> But further checked size, it is correct:
>>>>
>>>>     # mtd_debug info /dev/mtd0
>>>> mtd.type = MTD_NORFLASH
>>>> mtd.flags = MTD_CAP_NORFLASH
>>>> mtd.size = 67108864 (64M)
>>>> mtd.erasesize = 4096 (4K)
>>>> mtd.writesize = 1
>>>> mtd.oobsize = 0
>>>> regions = 0
>>>>
>>>> And rest of read/write functions work as expected.
>>>>
>>>> Any suggestions about this?
>>>>
>>>> Case 2: Just added BP flags, rest of the size, mfr_flags, fixup flags
>>>> kept as it is.
>>>
>>> would you please detail what exact definitions you used in case 2? Send
>>> us the diff please.
>> Case 2: Adding Flags for BP
>>
>> diff --git a/drivers/mtd/spi-nor/micron-st.c
>> b/drivers/mtd/spi-nor/micron-st.c
>> index 4afcfc57c896..6c8cabbead2e 100644
>> --- a/drivers/mtd/spi-nor/micron-st.c
>> +++ b/drivers/mtd/spi-nor/micron-st.c
>> @@ -405,6 +405,8 @@ static const struct flash_info st_nor_parts[] = {
>>           }, {
>>                   .id = SNOR_ID(0x20, 0xbb, 0x20, 0x10, 0x44, 0x00),
>>                   .name = "mt25qu512a",
>> +               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
>> SPI_NOR_4BIT_BP |
>> +                       SPI_NOR_BP3_SR_BIT6,
>>                   .size = SZ_64M,
>>                   .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ |
>> SPI_NOR_QUAD_READ,
>>                   .fixup_flags = SPI_NOR_4B_OPCODES,
>>
>>
> 
> Thanks. Nothing obvious on a first look. I looked at the sfdp dump, it
> looks like 4BAIT table is missing, so you'll probably need:
>          .fixup_flags = SPI_NOR_4B_OPCODES,

> I don't see how this could affect BP, but it is worth to test
> incremental changes and find out what misses.
> 
> After you test the above, I'd like you to extend the patch with:
>          .size = SZ_64M,
> Check if it works and send us the output of mtd_debug info /dev/mtd0 here.

I started first with params and debug log for working and non-working cases:

1] Non-working case: BP Flags + Parsing SFDP(i.e remove size, fixup flag 
and no_sfdp flag)



## x86-64-smarc-evk-uwd0j0007 # flash_lock -l /dev/mtd0

[  480.230232] spi-nor spi-PRP0001:00: SR: Read back test failed
flash_lock: error!: could not lock device: /dev/mtd0

             error 5 (Input/output error)

and params from debugfs look like:

## x86-64-smarc-evk-uwd0j0007 # cat 
/sys/kernel/debug/spi-nor/spi-PRP0001:00/params
name            mt25qu512a
id              20 bb 20 10 44 00
size            64.0 MiB
write size      1
page size       256
address nbytes  4
flags           HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | 
HAS_16BIT_SR | HAS_4BIT_BP | HAS_SR_BP3_BIT6 | SOFT_RESET


Strange thing here is HAS_16BIT_SR. And it makes sense from debug log:
[  480.230232] spi-nor spi-PRP0001:00: SR: Read back test failed

which comes from spi_nor_write_16bit_sr_and_check () .

It is strange because in micron-st.c, in default init we have:
static void micron_st_nor_default_init(struct spi_nor *nor)
{
	nor->flags |= SNOR_F_HAS_LOCK;
	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
	nor->params->quad_enable = NULL;
}



2] Working case: Just BP flags and no parsing SFDP:

Params for flags look like

flags           HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | 
HAS_4BIT_BP | HAS_SR_BP3_BIT6 | SOFT_RESET


3] Just adding .fixup_flags:
@@ -407,6 +418,7 @@ static const struct flash_info st_nor_parts[] = {
                 .name = "mt25qu512a",
                 .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | 
SPI_NOR_4BIT_BP |
                         SPI_NOR_BP3_SR_BIT6,
+               .fixup_flags = SPI_NOR_4B_OPCODES,
                 .mfr_flags = USE_FSR,



lock/unlock still doesn't work.

I also compared this with case when we just parse SFDP flag, we get 
4Byte-AIT, so this flag is not required when  parsing SFDP.

This is only required when we don't parse SFDP and use .size=SZ_64M


4] Adding .size flag i.e no SFDP parsing:

lock/unlock works as expected and params:

## x86-64-smarc-evk-uwd0j0007 # cat 
/sys/kernel/debug/spi-nor/spi-PRP0001:00/params
name            mt25qu512a
id              20 bb 20 10 44 00
size            64.0 MiB
write size      1
page size       256
address nbytes  4
flags           HAS_SR_TB | 4B_OPCODES | HAS_LOCK | HAS_4BIT_BP | 
HAS_SR_BP3_BIT6

--------------------------------------------------------

IMO, HAS_16BIT_SR flag is causing lock/unlock failure,
since BP bits are calculated wrong then.

I tested also for a case where I don't parse SFDP and
reverted the condition in  micron_st_nor_default_init()
for 16BIT Status Register Flag. And lock/unlock fails with
same log as Non-working case.

And this mt25qu512 has 8-BIT SR as typical micron-st flash.



> Also you could enable dev_dbg to see where you get -EIO. Probably when
> reading the SR back. Also you can use debugfs to check what is set in
> the working scenario and what params are different in the non-working
> case. See drivers/mtd/spi-nor/debugfs.c
> 
> Cheers,
> ta
> 
> 
>> -----------------------------------------------------------------
>> Case 1: BP Flags and removed size, and no_sfdp so by default expecting
>> to read SFDP
>>
>> diff --git a/drivers/mtd/spi-nor/micron-st.c
>> b/drivers/mtd/spi-nor/micron-st.c
>> index 6c8cabbead2e..4feb03ee2d13 100644
>> --- a/drivers/mtd/spi-nor/micron-st.c
>> +++ b/drivers/mtd/spi-nor/micron-st.c
>> @@ -407,9 +407,6 @@ static const struct flash_info st_nor_parts[] = {
>>                   .name = "mt25qu512a",
>>                   .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
>> SPI_NOR_4BIT_BP |
>>                           SPI_NOR_BP3_SR_BIT6,
>> -               .size = SZ_64M,
>> -               .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ |
>> SPI_NOR_QUAD_READ,
>> -               .fixup_flags = SPI_NOR_4B_OPCODES,
>>                   .mfr_flags = USE_FSR,
>>           }, {
>>
>>
>>
>>>
>>> Cheers,
>>> ta
>>>
>>>> Lock/unlock works.
>>>>
>>>> ## x86-64-smarc-evk-uwd0j0007 # uname -r
>>>> 6.6.0-rc2
>>>>
>>>> # flash_lock -i /dev/mtd0
>>>> Start: 0
>>>> Len: 0x4000000
>>>> Lock status: unlocked
>>>> Return code: 0
>>>>
>>>> # flash_lock -l /dev/mtd0
>>>> # flash_lock -i /dev/mtd0
>>>> Device: /dev/mtd0
>>>> Start: 0
>>>> Len: 0x4000000
>>>> Lock status: locked
>>>> Return code: 1
>>>>
>>>> ## x86-64-smarc-evk-uwd0j0007 # mtd_debug erase /dev/mtd0 0 1048576
>>>> [  413.472411] spi-nor spi-PRP0001:00: Erase operation failed.
>>>> [  413.478084] spi-nor spi-PRP0001:00: Attempted to modify a protected
>>>> sector.
>>>> MEMERASE: Input/output error
>>>>
>>>> # flash_lock -u /dev/mtd0
>>>> # flash_lock -i /dev/mtd0
>>>> Device: /dev/mtd0
>>>> Start: 0
>>>> Len: 0x4000000
>>>> Lock status: unlocked
>>>> Return code: 0
>>>>
>>>> ## x86-64-smarc-evk-uwd0j0007 #  mtd_debug erase /dev/mtd0 0 1048576
>>>> Erased 1048576 bytes from address 0x00000000 in flash
>>>>
>>>>
>>>> Further I tested on stable 6.5.5 Kernel with old way of Flash Info
>>>> Format and which has forced PARSE_SFDP Flag, no issues with lock/unlock.
>>>>
>>>>
>>

Thanks,
Mamta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
