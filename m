Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0E6C19F28
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jul 2022 03:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Rq/T/IXsXIOeZC6x74Ls0uRgZ/tIUwRHNLUT55IIc4=; b=nrEZ4RtA142xOA
	dteZEzyz3ZKrJanXaqscyHrhAcyn3tB0M5Mf5thklbGZUTtgVYgb/+58zET3iESNj6YXESi4dk7zo
	jlv8EpJ0RSVLXtpu2y5gXTxH4pgR2CEaAjRfUwypnWwHGVxnQvBKSDXrXBWny6rVu2QY01h1XWUnf
	6tvct0Vcr5p/97KQB2WWLiW9GKDOUv7oNdem8IcFzU1fgg8P0ksRvASDEjlWrnlSOR0a6CWdF1X5x
	J34MaVJU7zojbmv7QrBWlT3zn1NkE/x4eYSjG8L4OPOHjs+iUt8Vv3yYfQuy4Np+zbp/7yWfEvrwU
	gj4url1FBYyzkmBwMt1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGu8o-003VPz-LV; Thu, 28 Jul 2022 03:24:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGu8l-003VNI-J5
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2022 03:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658978687; x=1690514687;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=dJfddUInH/6CnXag8t+WDA2YaQjsEHLZJJUCm+oVRHE=;
  b=QqYvaQRBBqtxkxFdx/lpYdGAcuC5H97wkBqeqyMsh66toIfEJo7Y2qhq
   +k8DvTD4keYyPKAwa8kHUZvX8liHxTUKNUpQsQZHgaklOvsBPvxB3usAk
   ASs/yqbgHseX33ynBduYYzIXbOjCzskB2Tck7NEvRi45tazfaJl8N7PZz
   l5V7Uy6J+4y6bC8Dsx1Kt1cfzGrfsrf6IeaWpFekYoAN0oUZMM1+aB6VI
   BckJ+RgZiY4XOY2nUJr1pQhVNOBpVY9epmr9zVaS75gyJziNIbxreE0D7
   kKlHFKkVIE3j8nqgN1utZFy6pTWPvN/wIG5Z/PagCPTBj+RJtRa6rQbu5
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="173924716"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2022 20:24:45 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 20:24:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 27 Jul 2022 20:24:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVtQjyJiOKzOY4qTbf2S9FzEUljx7PxRWoxeY59AznXg1XQbVQoN6i0PFo4BamlFd9qViTAIhf2ZknFXfEYRNDgztRBPIi63RE5Mp7qnKcPfogcgkqBfZlnWec2VY8YJFaOk7MOpdDBHXC1cCQS7gx/Dy5VylAEiZlH7+Zfe8knvGz6m12O6Yh4iZ5oPjdUx8zOYxLNHRwpgLvU1A73Zu3vfO3a8+8txlwlrYfO3JOn+rfno7gRqnGDBsvTkd14Y/LCURScDaRLqI9/hwzDsZfyTdNjdX4DqbL8A9ym7y/yOmIm6Co5Ub8aRIuTiBqz1qEwIzjPtU0Vh27dEODyHMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJfddUInH/6CnXag8t+WDA2YaQjsEHLZJJUCm+oVRHE=;
 b=Mto2eBF0mjtrXkhLPXZwyWMhHvzyRzK9DQglzzgFgcLhpv4hZuzVFNhynIqy/lB78a/RLTfpMEGxrXfWVKrSsVqnECuesU4KQ9pFRlwfHstg+yP3+L1MBcow03aZ5Gc16PVM5hsvwEZszLjln4EFr5tg3lDTvfGqpU20u3IbU7yO4RSk9FPFfGhxCGtGLx+ZiTKD1WD4ECYs70jsYG5CHpGqKwi/oL5pzQsWADbV0bx6pUt2O0wztl0UgMP13W8Y3YiaBSkQE31GNPMwD9C0BsEj2sgYmMlqfAhYLVyDAiYkyhTQrp8tOr2N/o7rqA6WYAGpapc6fb9iBGcMv3Lr8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJfddUInH/6CnXag8t+WDA2YaQjsEHLZJJUCm+oVRHE=;
 b=DS/Lw3oiiaDP/qWZdMywM1H0CresPHcAwnwMkUpIs8/U2/U2z+BnsX7t0BzfXofICcY4mwBGrx4HZAfqxgVznYRRxOn6RUiYtxs9YDdBU60XtiwKhIMBhnNiHpN4uFUgOI5CMpqUQrHwO02lqF4wx6by3UsKHTspxPfDjhVaSl8=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 PH0PR11MB5176.namprd11.prod.outlook.com (2603:10b6:510:3f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.19; Thu, 28 Jul 2022 03:24:36 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::7549:c58c:5e93:7c35]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::7549:c58c:5e93:7c35%5]) with mapi id 15.20.5458.023; Thu, 28 Jul 2022
 03:24:36 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <quic_c_sbhanu@quicinc.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: introduce SNOR_ID3()
Thread-Topic: [PATCH 1/2] mtd: spi-nor: introduce SNOR_ID3()
Thread-Index: AQHYmzRwuAFPdIe45ECo1RhI0CKwA62TLLWA
Date: Thu, 28 Jul 2022 03:24:36 +0000
Message-ID: <41e6b74d-6973-60da-1556-82a1e879ffd4@microchip.com>
References: <20220510140232.3519184-1-michael@walle.cc>
 <20220510140232.3519184-2-michael@walle.cc>
 <160ddac1-6d0a-c922-1380-09e7823a285e@microchip.com>
In-Reply-To: <160ddac1-6d0a-c922-1380-09e7823a285e@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc4a9a2c-6617-4bcf-7492-08da7048b2cf
x-ms-traffictypediagnostic: PH0PR11MB5176:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: woBgKgHhBo6lnJFuj8jJ9SuSDfI2T8bLRxqEKiXQGqyZjlN6gBT5UPUGMs3lxj8r1KGQfBOgmIBj1chX6iF7pVTpxD6XVAg0Yc3o753A6twjftRxWt2fKWQOfXho3qswA/ro5X6Oj3eIYPqIIpLff3wM8r86S9klbIuQeXZEEAmF60+LCE7rXQD9bt/Q9zisHt2d/8geoRTpbvp8V76X43eWnAJTCII6n8J3hOiSwPFzK2iExNjW1yQxqyQHaWuEnsKy9vWx80n59VOanV0aTbvzA9lxK6SmU50ynAr2FNtBVOha5PXMxLX/7MBqcATplruGaJpaSqGNqDrH8nhuuWgwM+CX0dT4bnraw08OMEXYgUz9O0N4SJiJVihZPDVuXc6DHci/cU0Z/KvpUtkTUBmAZ7K34GGqu2jlE4tWo4b9/CCVi0bbtWiKtue0y+XnNTtYprRhCrT78uvL6eF0U0PXcs8I+lATU4l/Iw/RncijnNTbn05Dcm07wY4dsp3RqpWowdd6eIOfQApDVIMkmPTe74BtG5ZwQNJoSaZiY0j/fE+LbOE/6e8X+4FboyT8XwjKGJmcIg3QqA6YHK+aW1jrsHU51z1i2K7ttHAgensblsaLIkppg1tHOhkFervHgQAbl+3LqL6ckd6m6IHrh60W0lNV4RkXltuCJf5gpmWo4PIduRpcWds5JavzQ+Wq/2fhLgBLKqYol7R+JQw9Nm/D2i66TsNeqEPBjW5TU69BXRd0MMu7swKynG0e3qgj5kjrjRUQryeLTdzlsYqLTagnNUHxTh8fH4mVVJUaiXqVuaPMx0Rso+wKyshMo22N5jzJPlzrf1Zqh7Ct3QrOQEmS2mAD0PoCzn9bvQMDd8kOuAVLUTZ+CNPcEqMrmTQFSfRfAbw+IjgzDpVHyHHa3Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(39860400002)(346002)(396003)(136003)(86362001)(6506007)(478600001)(6512007)(41300700001)(71200400001)(53546011)(26005)(31696002)(54906003)(316002)(83380400001)(110136005)(31686004)(186003)(66446008)(91956017)(38070700005)(66556008)(2616005)(966005)(66476007)(8676002)(4326008)(76116006)(6486002)(64756008)(66946007)(38100700002)(8936002)(5660300002)(2906002)(36756003)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0pkNWExaUhlNDZKU0R6QTdyNEZjd3NwVWxyc3F4c3JXbmw3VVlsdGEreTEv?=
 =?utf-8?B?cXVCc0cvKzVvRk5FOHM2RjZpaTA2bUVWdjM1dmp6RFJKN1RUUGVjWHRuQ0dF?=
 =?utf-8?B?VlVzZEtYdVB5a1NqcllScGxMRGNKcHBjQkFFSTBpejZpTTRNSG0rbjlZaFZC?=
 =?utf-8?B?TThDbHVNWG1zbVM1SlVjUEI5SklkeWVKQm1KYm96SUdQYVl5RkJiT3BQdXov?=
 =?utf-8?B?Qnc1d05OelE4ZmRBcE1oNFpQYlhSTGFzaTFzWHE2K1hPUEhwSFp2S2l4bDR0?=
 =?utf-8?B?Vlc1dTdST2xybEsxUENFRW5ZUmZobVIweTQrSzVyOUk5eWt6R3B5dG1FVmdm?=
 =?utf-8?B?ZFZOUWZTeS92ZnU3a2oremZaWEQzYmJyS1lKaGMzeGdINllmZVl5RUxkZTFR?=
 =?utf-8?B?dS9MOWFOcHFka2NHalJOMjFNVWdqbUVFbnVwenVxSUI3a0pwVlZISlFiTVg1?=
 =?utf-8?B?N0FHT094RmVubU54T0ZXRkJNTVpOMUZmbmNtcWVvS29ybllYTmNxMmN6cVhW?=
 =?utf-8?B?RmxYRk94OS8raG9NVDZLSEY5dFRpOURjdThuN2RFN2hYWlA4UE1QYVhjells?=
 =?utf-8?B?Z3d0L2tPSWM5Mit0TFVPdHRjNS9IYXVUb2xiZTZqSk9LTGlIMWhLN3RNR1Js?=
 =?utf-8?B?azdpZVBFMm8vL0FJRUwyRmhVU2NFeUhzT3dCVmdDMktyQ1ZjT290UEtIRWh3?=
 =?utf-8?B?TzZIeGs5VHB6TU84WGZpazhmRHZERlNIaE1teUJNZjRML1FaSEwzWkR6NGd1?=
 =?utf-8?B?NXdNNlNmLy9lSVVCSmpnOGZMbkYvVGllaVVDajl2TDF1VUJ2L1dRckpIQm8x?=
 =?utf-8?B?bVNSbFNocHBrakxON2hvS0dwcFM2UkNDb3JPRDl3NXgveHkrQjBwQWlYVmg4?=
 =?utf-8?B?d0dCY2hNcktJYzJvUXE1MXVWQ2ZEaWV3YzJuMmF3OGFYUElLVjIxV3piMzJh?=
 =?utf-8?B?N2s0d1UrUDlaRUJJY1ZENVJlVjJHeE9VQlYvdzlqeDZsTFdRUGRwYlJKZXhR?=
 =?utf-8?B?NGp4WkJENkJDN21qbi81STdxaVZRMUxFUlZlMVR2SEI2QkhYTVJlZkhZaDI5?=
 =?utf-8?B?S1dBbWdWaFZTR3ErVDl1THA1dkZmUzBsWmhEbmRhZHlWVUVwRFhWY01CTkk3?=
 =?utf-8?B?L1BuZWY5b01lZjhlUSt1dTVGa3kwYWxML096c3FkaXd0WE5SaUpKaFFlWEVs?=
 =?utf-8?B?YlAvTEZ1cTdWNVp6ZTh3emVDY2UwYk91WFhLNXlGaVAyWWMwck9ZOTZ6YmRn?=
 =?utf-8?B?UGQ1V1NGM2lVTWVhVjVFb0lwQkVRNzBpYkV1UjRybE9jUDBxbE5WMzBVcDE5?=
 =?utf-8?B?YUVoKzVUbDF0VURRQk9oM1VIVDg5U0hGaXZyMnJPby9sSG12RkpTYzgrQmNz?=
 =?utf-8?B?dWFpb2dsR2haRVYvaEsvamJrUUtrM21ldVRCc0NVaWJTWnEzblRQZkRlbU55?=
 =?utf-8?B?TGtSbEp6eVVscDVDMXhOTUFWYUVFbzFLR0wwMFRIM0R4bmdVTkNZRUhJdGxm?=
 =?utf-8?B?RExrWitkYXd0N05DUFJjRDRkYTM4WW5QZjhiTUMxdmtFdHpBNW8xdERKSDJ2?=
 =?utf-8?B?MXBzMFVjNkQ1WWYrNDc0YnI2dFZWaGNtY0dUSHh3WFVPVGZmNUNnUEFmaVBF?=
 =?utf-8?B?UmF3Q2VjZTN1THE3OVg1RXZzRWx2SXovMHpDZGlwdk9iclBMRlE1SHZ2S3J2?=
 =?utf-8?B?T0tvbXE5NUF5ZXY2RWRHaW9DN2I0eXl1NEd4K1NRUXZsWkxNeWNKREREZE1W?=
 =?utf-8?B?TUMvR2o2enVyZmJ3N3JyTkhZbjhkaDdMQkp5YzBYMzJUWjk1Um9sVHBBVmxa?=
 =?utf-8?B?Skd5QnhCb0krREMzS0RQWlpOQk9Xc2lkWE1TVnBUckpDb3hmUjF3aDlWZERM?=
 =?utf-8?B?ek9tK3dua3dzQ2E2emxielRBa3Y2N2JYUW12eEpIemhBb2drZEcvMWRqdzVo?=
 =?utf-8?B?YmhyZDN5VFlPVW1lR2habS83U0Fia2lEWVg0MCtXWFpZM2VmazM0akcrZkw0?=
 =?utf-8?B?TTVBUkVHejBFTWpnVXY1ZEFPMWk4VytVaVA1TVBuUksrenRtSXg5YlF1dkk0?=
 =?utf-8?B?ZGM5aWJzcE81S01WR0ZWVDVpQ04vMCtSWUxTMHlYZm1yRThRYmdpSXFYY2dt?=
 =?utf-8?Q?Tgppycep782UXvr2Nf7ES20PR?=
Content-ID: <EFEBF9EB9C66AD4C8F6604D4B1D16E9F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc4a9a2c-6617-4bcf-7492-08da7048b2cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2022 03:24:36.5774
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dE/mq2zt9oYyy28JPtRTi/IOJkUsOqKyddUgLv42dnxwIJ4SRVgKyn5IP3tndRtX187yR7nipcOnF2Dv3Pv9Tn36XIiX6aG8cD6WqQSqmrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_202447_703063_191872D3 
X-CRM114-Status: GOOD (  28.70  )
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

On 7/19/22 08:57, Tudor.Ambarus@microchip.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 5/10/22 17:02, Michael Walle wrote:
> 
> Hi!
> 
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Up until now, flashes were defined by specifying the JEDEC ID, the
>> sector size and the number of sectors. This can be read by parsing the
>> SFDP, we don't have to specify it. Thus provide a new macro SNOR_ID3()
>> which just takes the JEDEC ID and implicitly set .parse_sfdp = true. All
>> new flashes which have SFDP should use this macro.
> 
> I like the idea, but you need to refine it a bit.
> Your assumptions are true only for flashes that are compliant with SFDP revB or
> later because params->page_size is initialized by querying BFPT DWORD 11. I think
> it would be good to specify this in the comment section. Also, I think you introduce
> a bug in spi_nor_select_erase() when CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not
> selected. wanted_size will be zero, will you select an invalid erase type?
> Would you please resubmit?
> 
> Thanks,
> ta
> 
>>
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
>>  drivers/mtd/spi-nor/core.c | 7 +++++--
>>  drivers/mtd/spi-nor/core.h | 9 +++++++++
>>  2 files changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 402b37cdbcea..29329ed0a934 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -2104,8 +2104,11 @@ static int spi_nor_select_pp(struct spi_nor *nor,
>>   * spi_nor_select_uniform_erase() - select optimum uniform erase type
>>   * @map:               the erase map of the SPI NOR
>>   * @wanted_size:       the erase type size to search for. Contains the value of
>> - *                     info->sector_size or of the "small sector" size in case
>> - *                     CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is defined.
>> + *                     info->sector_size, the "small sector" size in case
>> + *                     CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is defined or 0 if
>> + *                     there is no information about the sector size. The
>> + *                     latter is the case if the flash parameters are parsed
>> + *                     solely by SFDP.
>>   *
>>   * Once the optimum uniform sector erase command is found, disable all the
>>   * other.
>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>> index 61886868cd02..fab3038c4f4a 100644
>> --- a/drivers/mtd/spi-nor/core.h
>> +++ b/drivers/mtd/spi-nor/core.h
>> @@ -563,6 +563,15 @@ struct flash_info {
>>                         .n_regions = (_n_regions),                      \
>>                 },
>>
>> +#define SNOR_ID3(_jedec_id)

How about SFDP_ID3 and SFDP_ID6 instead?

                                            \
>> +               .id = {                                                 \
>> +                       ((_jedec_id) >> 16) & 0xff,                     \
>> +                       ((_jedec_id) >> 8) & 0xff,                      \
>> +                       (_jedec_id) & 0xff,                             \
>> +                       },                                              \
>> +               .id_len = 3,                                            \
>> +               .parse_sfdp = true,                                     \
>> +
>>  #define PARSE_SFDP                                                     \
>>         .parse_sfdp = true,                                             \
>>
>> --
>> 2.30.2
>>
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
