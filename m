Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697AFC43334
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jul 2022 05:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jcfmV6JMVrXZo6bte6oSdo8SRntXAJaAFSO26DZIrj4=; b=M7EQf7j0R0OIF+
	rNRafXAAhLeEV+Y70+vbOBB0IKV6rvF3Nsqrfvo+12tnGsvQOXuc8JaUuU0cLI2HdUPPsJvppFECm
	Bcui2qNtXefE6ceyN9qxwiLjbJvuK1OGtm62szOZCaP3ej31gbqR4ZQJDSLpPnfyOzsn1GqUwLAw7
	alqRtJJzkhL3vq8LjYIBRDX6p3WVUU5s07BLPGpZNDv0+R2QP1r7kXH6criCe9C3EQmQxqPl7Y62d
	QPCapM1boNCyNsrkfqaV0zKp4T43CQMJK+KbASJIx9ClvvS/RNZn+jD39ZE4Zsy4g+3Jc0MwrbKS0
	NPYvSgO+AIR3tvMikSRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEkrn-00019P-7G; Fri, 22 Jul 2022 05:06:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEkrh-00017Q-Eg
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2022 05:06:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658466377; x=1690002377;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4fMo8CjGICQ99B8Tfy+UrPJ6EPier8iUIkSVoanpUXY=;
  b=bOyFBMd02fxzOkoTUzG1WGgeBPBOkk1C49Q5iY+RWOj3RPNVmLC7WKgI
   zeL1rGZTIDxxbx3NYZR35Q054BIPTl5KatS7CgPvWvcHnSfFiPN/PhAiX
   F6+IWwWsGC8Xf7GTbfg5IkcDjkpkiOZEkM6IwXRo4s+t+Lf18uFc0/bZX
   SpIDgjcMd/sgSUcMxxx2hWGivWGvBMe2V4ZOgN22IeldeRkoc2CgV4O7C
   bGDoy5c3/q6rRGd37S+Z2BgydIEvzpDorJLKM9iPLeDoHLtN3QouSMaAb
   oralXWaHMKLcrFWin+8RWCQuzMJiGhA+1g91SsU9v2pD+YyaqRcORZ0Vc
   g==;
X-IronPort-AV: E=Sophos;i="5.93,184,1654585200"; 
   d="scan'208";a="183277733"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jul 2022 22:06:16 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Jul 2022 22:06:12 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 21 Jul 2022 22:06:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1zkIqZPo/hlZMWYQu+6hd/gUUiu+IYroq8tCAkUf1Y3Wp364vu2ZMo0MSEkLV++j4eYttObj+I3z8MMxY+3Eg1qWhXsS34rOD1uSkVuVVQMaZYj6k/iYYHIGIuUJBuGVP2op9reIs9sc6S8W9CPiKOwxChd9FQHRufIhWM8QxCSe3p7CSiJzguy88dcSEYka/08E3PPQV14YFdeJUSBp7Ge6k1T+mIeH1Lu+XlGKK+S10bV2O4ss5yZ+uyUvB7lHxIDm8A87ICXCy71ZN6+Y3mugI7WRhNeSqCN3jWrzYM8Vnk7tCo7B6dOlXUrMwWnbKJrVRiBCkduweB8sylbQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fMo8CjGICQ99B8Tfy+UrPJ6EPier8iUIkSVoanpUXY=;
 b=MhxLguxdZ9bL3VcGVLUjBtAq6M9Yr/f27tZrDV+KLvJOvtERtT6oM/8+9lPseQa+Xp5ymrEGMNOdHysNbfFvrIK8hJi0Kz0cd9Ps50kRlGDntY4jOkGvmU+HDuJ5mEFQYa455NpfOzgkG0FIasG/uAkOzM31lk5JU9FuMSMVrr0fjOAqQuRe3LVeA1iQF5k/X/NJQhgMeE5pEB2wyeVf1vyAAAfD0f6/jLaarMHdYB/PwX6MQsuxO6j8kF981Yum7QQPphjfa34rohku4+oApbYESXIgNzdE4wV4VeuJiBcQLvZGdf2tFm0iB49V5K9Tqmr1hXXT09bq1Q891Wya8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fMo8CjGICQ99B8Tfy+UrPJ6EPier8iUIkSVoanpUXY=;
 b=VP1jtBj9epXEKBYgeF4gJBalvHY9BCXYeyTIZBs0k0bBSxkji6lE9DJ5CyyL6ITt+vGHrquCow+eKuSKyWYScGKnpUukk9est7zCGKFwpJ3Yq68myPklnBen26IJ4K3WddLGA+z58C8NXnvLNmCf99CHc+NVj1FFDC9EZKvMvrc=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 BL3PR11MB5681.namprd11.prod.outlook.com (2603:10b6:208:33c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Fri, 22 Jul
 2022 05:06:06 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4%6]) with mapi id 15.20.5458.019; Fri, 22 Jul 2022
 05:06:06 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <p.yadav@ti.com>,
	<Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Thread-Topic: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Thread-Index: AQHYnRvdTEt+bD16DUaYd/6imLQaPw==
Date: Fri, 22 Jul 2022 05:06:06 +0000
Message-ID: <774d237f-e5cb-f46f-91ee-ae3a55dcc969@microchip.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <dac51af409be97ab316a9de5c0297359df7d2e2d.1652063152.git.Takahiro.Kuwano@infineon.com>
 <99cf396f9210279e28dc1656a652efb4@walle.cc>
 <93de6975-c734-06d4-7865-bbe7f90cba4a@gmail.com>
 <0eea594f72858ec0ee099d45da71bc96@walle.cc>
 <57fd05cd-e0a7-b41a-53f0-c419ddc53a1a@gmail.com>
 <4d8146ceecf1f8a89c6a43fa1ac8d81e@walle.cc>
 <c42d5930-73cd-6dbe-f650-db72f35188a5@microchip.com>
 <a035a1a3-0d82-48ab-5d09-1d5164999890@gmail.com>
 <98fa98f2-055c-2338-6790-de99670e20ff@microchip.com>
 <2912f41b-5966-b08d-0b52-97eba3a809bc@gmail.com>
In-Reply-To: <2912f41b-5966-b08d-0b52-97eba3a809bc@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ebf553a3-af78-463f-cfea-08da6b9fe233
x-ms-traffictypediagnostic: BL3PR11MB5681:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0Wd1jpSvBHbQL0noIwJuAqbJcd/jGWa8kFGX/hGayJYA8en1yK9J97KGcWPGkZwsdpchvhWM03TW48aiAFw3eRE0xy2xwHtayV+tOWvbajeUUwabFeTqsvT5cPaNhlrcYIJ77REbelwaB/3d+XwyGduADJO+gDYwp2AxhFzMS0L/JH6eYy58pgRmI4GtuoB3r9kCtCCdHvECjz5KpTmPOvENS3V+YQ6aEHb2ZYP10PYvNe649XN0LJGSCatD7S/vLsorBfNOOuJdR6sN7NOrO2zduaJzmrOFDChbeZRbFVF1f273ZN3q58yl/FObrk5SOBYpl/uvsiTAUHFojK9EkUcEgTyn4LKstDLK53fO9C/ooxeDHZoxY3PBYbfIjRJQ/mHRy4mOsxE4SGhqCfu+jlU4GUWS970Aob3nhqZjNY8wdRPBwV71PLdEnswz2jANl1rfAEWGyrFcSojCMvuiqmQW4BYSXPCOrjtLJtxjz22l1BiZQQqG+XNkPMZkW2rEg0vH11FZPJmm+Di9nie8KcupWQl5VMKK7uFTs1kk5f7Rs6CwQY+YEdcIzE/xh7oiZK3BdxrVkLDWi/bkjocTycIbJMdvNgyE52l337hWaQNzD87m0UCivJ9tGBmiVM3yi+n7drgC5PWp4YimsMt9SJyAPWqA33mtQfw1k60jh8h0PTNRbMdnCcq8mwi0m2i5UKzWk1XrnJ/5tz90sOU9Bbv7TEgVn4ctgC17pG9jYfskt71YOS2mduGRnKb6daP5yOhWF/LW8lRHtdGONz0RyI9Tm7ZHo3W0qSljMUdkQwXqxYv/UWrB2pfp/lknPL/Acp7yGDo9TUaFIfM9yZpvf1yWS8XoIJExc2W2Z2LQ3OlsrFgYvnG7cxEkKNL6n/eT
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(346002)(39860400002)(376002)(366004)(186003)(54906003)(38100700002)(2616005)(31686004)(110136005)(38070700005)(53546011)(6512007)(6506007)(86362001)(31696002)(2906002)(66556008)(4326008)(66476007)(8936002)(66946007)(76116006)(91956017)(8676002)(41300700001)(5660300002)(71200400001)(316002)(478600001)(36756003)(64756008)(26005)(122000001)(6486002)(66446008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ti8xWm9xQVVYeTZhTDZvRUh6SG1yZ2RZeTZHTHRvN0ZlTDlGU0pzcFIxZjIr?=
 =?utf-8?B?a3BUVDU3TUk4OFpvNFZjRlFkckYrZnhtUXNDUnUrNE02d1hsWkt6R2E1YUJv?=
 =?utf-8?B?eDR3SmhHK0FxR2RSWU5rQ3F1dXE5b3piTGVoc2FvakRMVEhjMjd6cU13ZS80?=
 =?utf-8?B?TXpZb0hjU09OVm9ZaVB0eHJrMG41LzNJb3VieEZaYW9EYUZ4YzJYbjZTQzFN?=
 =?utf-8?B?amowOXpmajlxZmdnUDE5Wm5ZaWY4UzA1MndWSjBpcXR4MWppVVIzYmdiS0wz?=
 =?utf-8?B?OFE1cWNEWWMxKzVPWGZDbnMxY2YraDlMbDZoOW5halMxcURYcUs2bkZlVFZt?=
 =?utf-8?B?T1NKdUlNZmVhL0lsV3NSaUtORkNMMnhjVmI4K21Qc1kra1V0MFVnTHJ1eGdJ?=
 =?utf-8?B?QlZBNjJWRzd5SHNiKzhIWHRQTWF2NEhFWXNNajh5WHVFWnhRZlR0QWhsWXNU?=
 =?utf-8?B?YjdydjNzV3NleTJ4U0FIYm9jM3h1a3lEOXhrYWtoRGgycmdGaWtTemk5K3Rx?=
 =?utf-8?B?cGdNR1BML1dwQXUwOHF5eUtqYkRyTnlTOFl6ZEhjZWF4QWVMUlJ4UWUvdWY1?=
 =?utf-8?B?R3pxbGhSTzhvQm1JWGFWREVTMlBodUhrdXNobUZvQnRwTkZ5aFNGeXFyMXBS?=
 =?utf-8?B?MTFtdDdJaEg2VWRtc1ZJR0h5Q1B1U3lJSlBjU3ZUc3IrSEk1T0k5SnJXZUFs?=
 =?utf-8?B?c0JpamhROXc0SUZick9Rc3IwVXcrTGEyS3RoRkRKME5MTGVsbDNGN0JOKy8z?=
 =?utf-8?B?V1BvSnZRbGhxZUtBR0xIMGZna2hrRkNQdi96WFpJTUJ4bFgxVmN2OXFMZWRZ?=
 =?utf-8?B?bGxJN3NEMnRlbkplcm5MbjRlTXhUTnU5bHczK2RGWGZxQkpFbXFKUFRUSWxI?=
 =?utf-8?B?YVJ0bWxSbDI3RGhkWVdKVXNDV0hkVXhuRnZhOW1nVmNFelAxWHZGVTFhMUlV?=
 =?utf-8?B?VkRDMUczT3F5Qm96SkgybGEvRHlHVC8yZjhMbVlwVU1KN1Q0S1ZkbVR3UTQv?=
 =?utf-8?B?emZsUm5EeXAvRDhaOEtSMStaRkd0Rkt5OGprUjlSYm5uOHpiajhaZjgrVksv?=
 =?utf-8?B?R215L2pNREtrVnVsK2Q0TUVPazNSM3FmZm4rd29ZOCt3Y1kxK1FRcWx3N05q?=
 =?utf-8?B?Y3FUVkM0S3JzR1ZEQVZiR0dZam9vT0ZNSVVDNC8rZGx6czNKaHpXS01zR1ky?=
 =?utf-8?B?OG1IaVJUYzV6SGlROTQ4N3BTdzQwRk9XT3RTcXovaDJFUkhVM1FlaklSYlF0?=
 =?utf-8?B?dE9ZTDUwcHlpNm1WQ2JtM1lsWFArVlAxZFZObDJoV2ljLzRmclQ4SGNDdGZ1?=
 =?utf-8?B?bkRMcU1yTkxXVEgvSTdWU1RkY1RwVmFKZmNoRC9aSUlvRU9Ld1ltVkFKTTRS?=
 =?utf-8?B?UDYxM1ZPcXhudzN1QloxR2dMWTlESm9yZFZ5b242TWkrR3BVbU1DWUdNVVNS?=
 =?utf-8?B?a1RYbFQrWGJIS3BMWTdFT2lSZ3d2aDhNSzBxMXpkUXpuQXpVKzJadS9MaUsv?=
 =?utf-8?B?TmorbzhLSllQSDBiNEpnd3RkbkgyMkpEMmtOZUczMklzVjdLeUsrakxiUWJY?=
 =?utf-8?B?ZE0ycEZQbGJwTE9ZbUFSdGh1eTg0eGx5NktiMGRZTEtlQmUwSEthMXZtcXF0?=
 =?utf-8?B?Yzlkc2ZtZXVFNHdwTFFocDRiMzJCWFA1TzhjQzZJcFNvbHluQzRYcHlGZkhE?=
 =?utf-8?B?ZUoxYzF0STBVRUhtNUpySldIMXVIcE81WDYycHlLN2d5eERnRzJnNXpJU1pC?=
 =?utf-8?B?bUI0U0RnQ3ZvZmt2cFZwV2xqbk1KYnZ1MzRZdzFrTnkwRjYvRUJDK3pBZk5l?=
 =?utf-8?B?QjJUN2UxZVNZQy8vRFFTMFFIbnNTckQwaHY4elJnVjB1RktNZzJDSHF0NjFT?=
 =?utf-8?B?dG9ZbEpTQjZsRnRaNGRFNGsyQzBDNmkzTUxXdm13VVlvcW15VDM4aDdnenZw?=
 =?utf-8?B?NlZUUUpSTS96bzREQVFtNmUrdUZzcWlGUG1mL2U0YS9CVVVUQWdsZ1RTT0xp?=
 =?utf-8?B?TWVzRU1peUF2YVE3MzZzeXVPS202d2JYQjVyWi8zelVkeWpSYVBNL1gyR3JN?=
 =?utf-8?B?SEFCY1BpTlFpSSswSEtpcmNjT0pGS1N4WGhNNG5aU3lDQmZNUE1pd29BM2Yv?=
 =?utf-8?B?bXJSUXJpa0I4OWh3NzM4d0JWMTNsNzJ4a04xaXRYOVZFMHlFQitJb2Z2ZzdC?=
 =?utf-8?B?RXc9PQ==?=
Content-ID: <6039D556C4C1A54D9465AFCBCF786012@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf553a3-af78-463f-cfea-08da6b9fe233
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2022 05:06:06.4740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RZ/nszQdfCqRr4DghrbkCKcvMJoNW0Dw1CX3Z15fv2O504MsVHFyJL4M3+XY5ffBRJS/WGtFjy2ZdJVt8ftOTf+KYOXOCLb+6m7cwIkM9pQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB5681
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_220617_523540_4A74CEAB 
X-CRM114-Status: GOOD (  19.34  )
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

On 7/22/22 07:46, Takahiro Kuwano wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 7/22/2022 1:20 PM, Tudor.Ambarus@microchip.com wrote:
>> On 7/22/22 07:00, Takahiro Kuwano wrote:
>>
>> Good morning, Takahiro!
>>
> Good morning, Tudor!
> 
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 7/22/2022 1:06 AM, Tudor.Ambarus@microchip.com wrote:
>>>> On 5/23/22 10:49, Michael Walle wrote:
>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>
>>>>> Am 2022-05-14 05:51, schrieb Takahiro Kuwano:
>>>>>> On 5/13/2022 6:40 PM, Michael Walle wrote:
>>>>>>> [btw the subject still has the old name of the addr_width]
>>>>>>>
>>>>>> Yes, it must be fixed in next rev.
>>>>>>
>>>>>>> Am 2022-05-13 03:26, schrieb Takahiro Kuwano:
>>>>>>>> On 5/13/2022 7:14 AM, Michael Walle wrote:
>>>>>>>>> Am 2022-05-10 00:10, schrieb tkuw584924@gmail.com:
>>>>>>>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>>>>>>
>>>>>>>>>> In 4BAIT parse, keep nor->params->addr_width because it may be used
>>>>>>>>>> as
>>>>>>>>>> current address mode in SMPT parse later on.
>>>>>>>>>
>>>>>>>>> Mh I'm not sure this is needed at all.
>>>>>>>>>
>>>>>>>>> SFDP spec says
>>>>>>>>>   Variable address length (the current setting of the address
>>>>>>>>>   length mode defines the address length)
>>>>>>>>>
>>>>>>>>> and
>>>>>>>>>   When the length is defined as variable, the software or hardware
>>>>>>>>>   controlling the memory is aware of the address length mode last
>>>>>>>>>   set in the memory device and this same length of address.
>>>>>>>>>
>>>>>>>>> We don't set any address mode until all the SFDP parsing is
>>>>>>>>> over. Therefore we should always be in 3 byte mode, no?
>>>>>>>>>
>>>>>>>> Actually there are some devices that have variable address length but
>>>>>>>> 4 byte mode by default (I will work on those devices after this
>>>>>>>> series
>>>>>>>> is settled). To support such case, I prefer to use
>>>>>>>> params->addr_nbytes
>>>>>>>> as current address mode so that I can fix it in post_bfpt_fixup()
>>>>>>>> hook.
>>>>>>>
>>>>>>> Are there public datasheets available? So these devices have a 3 byte
>>>>>> I will send datasheets to you in another email. At this point, only
>>>>>> summary datasheet is available in website.
>>>>>>
>>>>>>> and a 4 byte mode, but after reset, they are in the 4 byte mode? Looks
>>>>>> Yes.
>>>>>>
>>>>>>> like it should be fixed in a different way. I'm not sure the "current
>>>>>>> mode" handling is correct.
>>>>>>>
>>>>>> Yes, we may want to introduce a new flag like SPI_NOR_4BAM_DEFAULT and
>>>>>> check
>>>>>> the flag in BFPT parse. Once I send another series, please review.
>>>>>>
>>>>>>> We need to differentiate between the mode the flash currently is using
>>>>>>> (nor->addr_nbytes) and the mode parsed by SFDP (params->addr_nbytes).
>>>>>>>
>>>>>> The flash's address mode affects the address length of Non-4B opcodes,
>>>>>> including read/write any register ops used in SMPT parse and Infineon
>>>>>> (spansion) specific hooks.
>>>>>>
>>>>>> The 4B opcodes always take address length of 4 regardless of flash's
>>>>>> address mode. In these Infineon chips, 4B opcodes for read/program/
>>>>>> erase are available and 4BAIT advertises them. We don't have to enter
>>>>>> 4 byte address mode for read/program/erase.
>>>>>
>>>>> btw. this is a pity. you are using the stateless 4b opcodes but
>>>>> then you don't provide stateless opcodes for the read any register
>>>>> op :/
>>>>>
>>>>>> So, I think we need to differentiate between address length for
>>>>>> read/program/erase and flash's default address mode.
>>>>>
>>>>> Or we keep them in sync. E.g. switch to 4bytes mode if we are
>>>>> using the 4 byte. Granted, that sounds like a hack :)
>>>>>
>>>>>> Obviously we are using nor->addr_nbytes as address length for read/
>>>>>> program/erase and should keep this usage.
>>>>>
>>>>> Yes, I wasn't aware that we actually two different runtime
>>>>> parameters:
>>>>>  - the read/program/erase address width, also used with the
>>>>>    4b opcodes
>>>>>  - internal mode 3b/4b. Up until now, this wasn't an issue
>>>>>    because either the mode was switched or the 4b opcodes
>>>>>    were used. So this was mutually exclusive. Now we have
>>>>>    flashes which uses 4b opcodes _and_ we need the state
>>>>>    of the internal mode.
>>>>>
>>>>> I can't think of a good solution for now. Need to think
>>>>> more about this, but I'm pretty busy at the moment.
>>>>> What I think is clear is that we need two different modes
>>>>> here in the spi_nor struct. nor->addr_nbytes for the
>>>>> read/program/erase opcodes and nor->address_mode or similar
>>>>> which tracks the SPI flash's internal address mode.
>>>>
>>>> Hi, Takahiro,
>>>>
>>>> Can we determine the flash's internal address mode by querying
>>>> the flash at run-time? Is this possible on Semper flashes?
>>>>
>>> CFR2V[7] has current address mode, but to read that, we need to
>>> issue Read Any Register which address length relies on current
>>> address mode. Chicken-and-egg...
>>>
>>
>> I see. What happens if we issue the Read Any Register command with
>> the wrong address internal mode? Will I read just 0xff?
>> For example try reading CFR2V[7] using addr_nbytes of value 3, and
>> if it fails, to read it again but this time using addr_nbytes of
>> value 4.
>>
> It's undetermined. In case we issue Read Any Register with 3B address,
> the host controller outputs 4 bytes (opcode + address) then inputs
> 1 byte. If the device is in 4B address mode at this time, the host
> controller inputs the 1 byte while device is still waits for LSB of
> address so IO is not driven by device.
> 

So if the IO lines are floating, we'll "read" whatever is indicated
by the IOs at that specific moment of time, right?

If so, we're forced to statically specify the default internal address
mode.

-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
