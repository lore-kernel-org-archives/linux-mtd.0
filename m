Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6420FC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Dec 2021 04:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eobNl42zF5i/DY8xCTh4bSskFJ/OVUX7fFu6J8ee4PA=; b=yBviv5xvv7zjQ2
	EEIhljOK99OFvU7B2hZ9u1tbBQDWe2ChDD/Vas2ucZzFnelo1N7RRbKnaAM+iHfWgsKE+6E/WC0Wu
	2Fgl5PGEoy6t95dR+kl7y7XcFAlakHKid3pybs6FxRTG8K7gjeouf+0l7j+0yxQFGHBbKCpHSgz0I
	3sppFZTLvHtJXkxC7Bb69XmBuX2IrhzuJwwuPdI+r8tx82jJkS7k9Zf8HLYwEfDo9eiYeb2w95RAt
	3u+NVIazQZxEjqCNGG1hBKU7OtMyj0wQbbvVnimVdSZvvaKOf117qpMVGLOzhsQiA8+Bcleq+8hks
	EBN2i0XmJh4riNM4Dplg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msHVA-007TKT-PY; Wed, 01 Dec 2021 04:45:52 +0000
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msHV7-007TJi-5R
 for linux-mtd@lists.infradead.org; Wed, 01 Dec 2021 04:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1638333948; x=1638938748;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y0MFiU5QmfYUZZoOvnlPBvObjFL2Yt6Ch1WCJDAA/uo=;
 b=aiQu7qc9zZqbJ+7tA0nbdIsdmAvBN8LqS2K+fIkIoWShz30CYWCpGF+w
 RS9FwbniCQmWsaIxxfyqRMSQEd/w5Tlm0IPWky1KG+gxNENtfzmCW5Gc0
 bYd4VNXUQt4mcQLwV0RZPNy3Rsr4Pn5RFMtsEvkxnt6co6y7fkeINnskL 8=;
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2021 04:45:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4i1goEgNkaCX4X/rWzS+2uhb96ZxqZtwVmadC+Fbkdy+zohelo8BMVfWmZ9nXnAVgwbyCmq6LcG0ps7cjkH814850y4pNKIFwW7xu5zy0lntCBLESz+JkTpz5axDGgru/5uhYsxKcxY85U/OdGqeK4ON+ahBuG8u8qxkYRTG4xm+jAsBJUTr8NVs19DWkAmveR1XwZigQ18d0J0Y/WFqhIq+UOF5Lyw5+II7O056jF8H1Am/JnZWUzomFqnztJ//G45StCjGYIYdlMHBQ2zx7IItJRZpk283T5BsplRu1WferazOVHd3TEACZDOa1fltjmDMaY4AcDbseIFaXDbLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0MFiU5QmfYUZZoOvnlPBvObjFL2Yt6Ch1WCJDAA/uo=;
 b=Q2i/svN8MLCo3rUm7uwSQ+DmDrHtF/Gtp30MnYdzQM/Dy/WiMatvg96uYPQPhVB0hJvi+kIZB0sbef7C7INTIfyf6hQDu/CJLKjgfeDnfpxy4iDYo9dhDfV9Ga3bySlLqi+C8wMA/2HDIqMZbCCXvrXbpEr7ScVwtg140n4t+6/f5lvW/j+QVzwP6toZRcdBaHd2hZGRGimOy4X6to4yvYLuVHfznfCwI4E3+VyBcUmdcVCEuufFiny74QQl/uKUx2/9l9P3ClnBPrMsO39ZXsa9sO4DONNQGB7aix0rZWg7iMEcy6AFUOeE3SdaxKZniWlz99tw1YPLEY5oodMs4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SJ0PR02MB8449.namprd02.prod.outlook.com (2603:10b6:a03:3f5::8)
 by BY5PR02MB6179.namprd02.prod.outlook.com (2603:10b6:a03:1fa::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 1 Dec
 2021 04:45:42 +0000
Received: from SJ0PR02MB8449.namprd02.prod.outlook.com
 ([fe80::a9b8:2e0d:5cab:a641]) by SJ0PR02MB8449.namprd02.prod.outlook.com
 ([fe80::a9b8:2e0d:5cab:a641%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 04:45:42 +0000
From: "Sajida Bhanu (Temp) (QUIC)" <quic_c_sbhanu@quicinc.com>
To: Doug Anderson <dianders@chromium.org>, "Sajida Bhanu (Temp) (QUIC)"
 <quic_c_sbhanu@quicinc.com>
CC: "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "michael@walle.cc" <michael@walle.cc>, "p.yadav@ti.com" <p.yadav@ti.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stummala@codeaurora.org" <stummala@codeaurora.org>,
 "vbadigan@codeaurora.org" <vbadigan@codeaurora.org>, "Ram Prakash Gupta
 (QUIC)" <quic_rampraka@quicinc.com>, "Pradeep Pragallapati (QUIC)"
 <quic_pragalla@quicinc.com>, "sartgarg@codeaurora.org"
 <sartgarg@codeaurora.org>
Subject: RE: [PATCH V1] mtd: spi-nor: winbond: Add support for winbond chip
Thread-Topic: [PATCH V1] mtd: spi-nor: winbond: Add support for winbond chip
Thread-Index: AQHX4pJ0SO59eyl2uUeHw/zAqiJn2qwcniCAgAB5RAA=
Date: Wed, 1 Dec 2021 04:45:42 +0000
Message-ID: <SJ0PR02MB844969BFD8F81678B3D02D7ACD689@SJ0PR02MB8449.namprd02.prod.outlook.com>
References: <1637909640-32232-1-git-send-email-quic_c_sbhanu@quicinc.com>
 <CAD=FV=W_LAJDKgLf5mZKe9Ku=GSvV=m4Tg=5VLYZWvT8=Ds10Q@mail.gmail.com>
In-Reply-To: <CAD=FV=W_LAJDKgLf5mZKe9Ku=GSvV=m4Tg=5VLYZWvT8=Ds10Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc5a4db9-9687-464e-d323-08d9b4856e45
x-ms-traffictypediagnostic: BY5PR02MB6179:
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <BY5PR02MB617981A075D8C49F5185CA59B1689@BY5PR02MB6179.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M1QJKMOzXiMNatiys0EIUwDQHx2Xocwlo2w3k7MtD4sIVQC7ZSP1XISI9LpUipnwkg2KBbZsnOQZQadJE6/zbz9+ZWZSqyHB+kwPTQBFw72VPW3YHEmkscpKtVpfx8BRwGYz/vi3wp8QwQlZTmpXFUcmi6xEpN0w4EEVDi3+pwGIL0kg+CyCvGEt0lOzehPokAzyLMjQ26f40uEp2Hjg0oVLJWY4yIcAO1vyjUI/PxuoRK84MzWUrFK0hmrouS6S3LgN1+4A+1QFuO1waAByriiP73xBAcKQNKmbd0h6Lt323NS1U5yJDGHLtEW8g0GpC6ge885NqNeyCY+7IvVKp9Vxy/TWuEYkZpv2wbdF6x3qoTF2ZC+D8C7PZ+iY4uRnLNcNqsFQ4nKKOHbE9S2CE41DGn39iMui0CJ34L5dK1lz+iNvWTbDDxGHWc2Aeph/fdjYsqGF8yDv+gy+YtZjCXwonuqgN887X1xrp5c7H7mFiv6ZkzCnbYtzgTNFMoIgD/UZ1ag5+5a8Sn9u+fEil16iIb5/uZ3ZIL1uKpTP92D7WGyQFFnynh2cyGr48baU0BNXnV+Kqkc+vM6j1CEPQK5YjHxYuq/RGsLpz3VsrEhn/1WpwRQKJkcu4S866vYZYQ1726CXJ/ATRQfmLU7olH9cq6AM4gXtwvhhSr0ooUPKo0ZxZB0Xmu0xnokeYmA3gwTbeVvrBeRy0DOUtDiQFQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB8449.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(33656002)(316002)(66556008)(7416002)(4326008)(2906002)(83380400001)(8676002)(9686003)(38070700005)(38100700002)(110136005)(66446008)(53546011)(7696005)(54906003)(66946007)(508600001)(186003)(122000001)(64756008)(76116006)(5660300002)(26005)(86362001)(71200400001)(55016003)(52536014)(6506007)(8936002)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ry93QWZZUG5mYnY1WWt1TDZEb3FUOVhibHA2S0ppVTN0RUh0NTBDcWwvV0xL?=
 =?utf-8?B?dHFLYXFiUENjUkhSb3ZWaXhXNmJjMzdOZ3h4UkpiTTZzajFydXAzcUxhZUxu?=
 =?utf-8?B?M2JIdG9aQkRvMFRabjhISytia3dTSDZreDRiTWNSYnZLdFhCaEsxQ2N2dG10?=
 =?utf-8?B?UzZXNy9FUnpWUXd0ZVRteCtuSFdKNGxodDAzMWJZVTZ2a01OREFMbFI2VHVI?=
 =?utf-8?B?MWxMdnRXNm5RWGhSUFR5UU9rNTlLeExkczVmVEl3bmNvUzFlSXowalZwSzdG?=
 =?utf-8?B?eXVkT3UxS21sZkJzUVlTSkV3enpKa1NQQU45dzMwV3FNMkZ2YytFM3BUcFdS?=
 =?utf-8?B?Z3pzSFNCaEx4Y01uQTRmd0lkeHFYdFU2TUJIbzk3TjZzb01UeXA2NVlxV2hU?=
 =?utf-8?B?d2doTHpHR3NFLzlPM0FCbkdIOTdLcU9UeXovbmQ0M05TMlJJTlVRalcyZStZ?=
 =?utf-8?B?eWs0NzhtaFlURWp1alhmTmFtSlBVZlZYelZwQVBzWUloVzR2QldnQU5JZUpP?=
 =?utf-8?B?NCtMY0l5OU1kV0hrUnJGcmlHRU9SM3VnU2RsUzUwWWx0a0JSZGhYOFI0ZUht?=
 =?utf-8?B?ZlJKVGNTOEZVcXVQUElZWmFYcFNzVmVNUEpzQlpNa1RnN0RMVmpXQmQzSitK?=
 =?utf-8?B?QXc3Mm9aZTA4M012b3ZyV211RERSV3BlZG8rS3pXcHVlc2NtUE5HdytIU0RS?=
 =?utf-8?B?NUJ5MFVEQlZXMURaSE5JNkdaTmFPWHJLL2JsWW5EQURaN1lPWm9oL2l6dXJJ?=
 =?utf-8?B?RnZUTDhRNUMvWkZHT1k4ZGVRUy83eWdhUmNmZHE1Y0tYd0d0UlZpMGJITXJI?=
 =?utf-8?B?YW5xb0RqcVZibG5wQno0WXZFTURZcGIwTXVKbzhwUW9aNExyTzFVSkgvY3ZQ?=
 =?utf-8?B?b01FbE5EMGRpbXdGaTFnZ1NROGt5QUFlL3pBUkJxQ1lFVXBpY25vRG9YU21j?=
 =?utf-8?B?UnBzMnpaVHpmQitod2VwM2RhTFA1d0NmdTNsVVZoeVZxcVZnQ0RtVGMrWjU1?=
 =?utf-8?B?czA5ZWhtdSttOTNOaklDUHR6ektPeGpBSjlTTk9Sd2pJWjMzN0c4UDBRMDVZ?=
 =?utf-8?B?TmNPT0J1bUVqYXVwb0htNWUvc3ZRQXQwR1JCYlJsNVdUalJlTTh6VktuSVBI?=
 =?utf-8?B?a1FjNlMyMlNKdmhRRTJ4elp6YlhZaWVaTm05SmdwMjh6OENkbXhHblE1NExl?=
 =?utf-8?B?Q1NkUURUdmh4LzRmd1dtNnJ1UWJsOXNzUXdBSi80cENNSXhQYjZYTkVNellP?=
 =?utf-8?B?MEJFenJhb291N3JQV3plL3I5RGp3MSt3b2I5MHdCTG9obTV2SXBSenhpS3NP?=
 =?utf-8?B?UkhkN3ErQ3BwaCtlckZ1Y3BQZHp0NUJmZ0RwS25venRkY0t4ODJNT3JneDZF?=
 =?utf-8?B?bE9jUVNYYzR0bFdWSkRXM2M0d25FR1hCczBxMmxGYzYvMlVsdE9HaHFoZkht?=
 =?utf-8?B?Z3NGS3gxYU1iMWVNaVJQWGJmbXM4RVhDckNITW5IL0tvdDJGYU05Y2xLNGRH?=
 =?utf-8?B?V2c3eDd3Q3JmYnRMYzVJeTM4cUJtWnduczBpRThiMkxBZjFpelVBZlQ3THIr?=
 =?utf-8?B?QkFIeDVmUHo5TFR0d1VXSitBYU96amZ6OTVEdERENll2SkNqSDhIaFpUOHl4?=
 =?utf-8?B?VWZCWlBqdnFHQnl0MjJUZHdEa0FFTFJ4NWh4Q0xxR1pOOFpkMDhZdkxTTHhJ?=
 =?utf-8?B?eG1oSTBzMnI1UVE4a3ZPYXpJbllUZEw0NHVTejFoZnE5NTRsWExvb2Z5RHV1?=
 =?utf-8?B?TVgzdmFLT0sreVFsajV1NnNWeWFBc1VRaExsaERNblVQTE1HVEx4VW1NUzFo?=
 =?utf-8?B?TmN2eDFTc3NONEhKTXVUVjNlUWl1T3pvSThwdS84N0huUExTZlFmRnNYMkw5?=
 =?utf-8?B?M3E2Qk8vbW9RV0VKanV6Y3BVaTR6VmJ5RlFnaFpuRXY5d3dkZEhtWFJjSjY2?=
 =?utf-8?B?SEpZUm5aRVBJNnovMjlsNGVMZjNVZCtRcURuL0lKcDlSU3grTjNGbzZRK05z?=
 =?utf-8?B?bnlycTliY1cxQVVkMHA1OFk2bEpaY3VQb3ZnY0pPc0xMZ1ZtR2c2NVptTVVH?=
 =?utf-8?B?aGFpbmJ4b0pTeXNZVkxiTEpSS3JyMGlnSk51U1pmOXhPNjBtUFc1SWJDYVVm?=
 =?utf-8?B?ZHVsbTNSRGs4WTRvdEozaFpmbzJoVVFHNTNzZ05yYjJKTHJjT0dtWkdUdDFW?=
 =?utf-8?B?RHFTa2t2Rm1jSW1UN0lIWVQ5andMNXd5MWIwVkJYZzBrTkVsTDBhQlpaTk00?=
 =?utf-8?B?QTYyeTNXOW43R0RTODBxUnBYVnBnPT0=?=
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB8449.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5a4db9-9687-464e-d323-08d9b4856e45
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2021 04:45:42.1145 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WRAXbVvPLDQqBNupP95+805sjV932OZE5D/e6uHLswDwamfQ9UtGzdqt3rRlqbE1tZLljf5V1jjF+dYqU9XEaktfq1KlpglhpqGZeZHTLOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_204549_274926_5561A8F1 
X-CRM114-Status: GOOD (  17.77  )
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

Hi Doug,

Sure thanks for the review.

Will address comment and share the patch .

Thanks,
Sajida
-----Original Message-----
From: Doug Anderson <dianders@chromium.org> 
Sent: Wednesday, December 1, 2021 3:01 AM
To: Sajida Bhanu (Temp) (QUIC) <quic_c_sbhanu@quicinc.com>
Cc: tudor.ambarus@microchip.com; michael@walle.cc; p.yadav@ti.com; miquel.raynal@bootlin.com; richard@nod.at; vigneshr@ti.com; linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org; stummala@codeaurora.org; vbadigan@codeaurora.org; Ram Prakash Gupta (QUIC) <quic_rampraka@quicinc.com>; Pradeep Pragallapati (QUIC) <quic_pragalla@quicinc.com>; sartgarg@codeaurora.org
Subject: Re: [PATCH V1] mtd: spi-nor: winbond: Add support for winbond chip

Hi,

On Thu, Nov 25, 2021 at 10:56 PM Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com> wrote:
>
> Add support for winbond W25Q512NW-IM chip.
>
> Signed-off-by: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
> ---
>  drivers/mtd/spi-nor/winbond.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/winbond.c 
> b/drivers/mtd/spi-nor/winbond.c index 96573f6..cdfa2ee 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -100,6 +100,9 @@ static const struct flash_info winbond_parts[] = {
>                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>         { "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
>                             SECT_4K | SPI_NOR_QUAD_READ | 
> SPI_NOR_DUAL_READ) },
> +       {"w25q512nw", INFO(0xef8020, 0, 64 * 1024, 1024,
> +                          SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +                          SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>         { "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024,
>                              SECT_4K | SPI_NOR_DUAL_READ | 
> SPI_NOR_QUAD_READ) },

I have no comments on the contents of this patch, but your spacing is off. The entry above and below you have a space between the "{" and the string with the name of the flash part. You should match.

-Doug
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
