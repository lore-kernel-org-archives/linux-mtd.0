Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F26C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 11:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wSzjS4o0z6l2Jwf+4KVARbglh9xi096H+igxFLumBTI=; b=sy1JLx3ZXc+T6b
	MjF9AixqnPH3rvayq5eSnn991E8CeIvsdFG7P8ZVGt/Bt93XxUO1qLllyQB/1l6K0cbTe74C5PXDh
	2rV7pq1lE09B2kAZi7BUPAxSfpv6NS4bqLgrWcv+EclzASykXa1KWLGOQJCDu+EMFfHFsp6dvnNiq
	t15HVMGMLsle4tfH+cuYONmyrhT5nS1YUH7zSBJhtfFy6BR7DPy+yff1KHSf/ZcVjMSewNdgwbyeH
	TCeN3eB4+anLsvJ/ehi9ANuwrjcTWshZ5FqXIHkzVakiXlEhyOxC8KSi01toxfky+btw7Zf0Kqzhx
	52gJ4uEMQZW+sDJH2A4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP0Ks-00GKKZ-Pw; Tue, 01 Mar 2022 11:06:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP0B9-00GF42-Vq; Tue, 01 Mar 2022 10:56:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646132187; x=1677668187;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FzCpj2rylWcz6H40s2ZlZHTnW5bnvevYEhGOAmNRO48=;
 b=b05gwHbK6dROHRj+HYgfZl3ZWbFZmm5ZXbPTXdjzByiQAoCX4BzV6+Kn
 ycUkVReDzs5/2UdxJIt0fsEMKxxmiWikRmENbGvp4ylgTtilISpEVt8Zf
 aMPjtSegxjNF0ySjJrRpJBgcgeFHUaVDjMh+oRnhgpvwQC3y3k+iSMYGv
 w/bqcn+2a/KBDF0HY/gtfmDigjEHVbpSml5ih+kbp19T18MLtGfkzXeD6
 SudKtqjB0aUIhwQRLVux1hw7jDxW6JDHV2Gbacbf4rYRwdatf2DNf0gqK
 nsTw6o4HJtTcYs+NKQ2D/gF21+emu9ZOa4zluEPx38b8iK/Q7UNZM66k/ w==;
X-IronPort-AV: E=Sophos;i="5.90,145,1643698800"; d="scan'208";a="155245791"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2022 03:56:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 1 Mar 2022 03:56:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 1 Mar 2022 03:56:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWdjamFjycqiK5BI768n3H9d3BwCiwyd/mbn6Gjibtdr56Q/2nUSf39kkSHZGKWc99Z/9k9I3E58RjU+KMhGYCQkfo9jqzaZYaqrNkyfoHtE/a5orxfVotrc6Q/jsT8AozQ2TpP65c97vJLLU/0hbaV3aiCfoZl3RGS1TRzvN6UJLE6YOGh+kSmOtmTpTNLn9I/W49D1A311/deT9nOGnioV2lszoFpBd41fAz0BaZ4b0WdftKPaOIZo4c7JbMIYU7rVxetzfcUBY5kQ1M0d9vyWIQLcndFLd2I427X3doRv+VEZH017GrQG35Th1iZbybxl+L4goww2yobJz871cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzCpj2rylWcz6H40s2ZlZHTnW5bnvevYEhGOAmNRO48=;
 b=aPwZTQ40EuaFp1LCHtGjEzDWPGlKA3l3DVC2zm3EDALHpYhJP5y0Jr72cMGSnqDLIj9wUkxNYn/7ReP/FdS7XUhBmBFdlfbFZz9Qe8KL39Kc91Jr3oN9YGF3jx+ZeQyUp72r/iPm6qe10ZUc1J8K+SMIC5sheYvoFAOohNCJ6J4ivXh9yf67w8S3okwusVyzr52EgrQDuLEDyz8eaWeVhSRYWG2p9SNSGzkdm/5wZgj7AXTgOjpRvPWjqS2CpZwU7h2fy5iZuxL+htN93AjjVq4xDEwaL1x6xyfrCTksDxE58Dhi9eptRgUItKxB1iU+n28BmrZumzzfOvm4KJHXlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzCpj2rylWcz6H40s2ZlZHTnW5bnvevYEhGOAmNRO48=;
 b=oCyJoAm9ZVVTJdimcSfOCiIcSfQOjdRDGOZq4U1bVVO4gpX2zILDEV0ZdjDny9zC4va2TX0fuvNDGMhi7xCoD8sAOsIYwH7W/Y6sWnT9o+oZN7TU3k3JMQDOzWr3sgAsZmVGRbnSjyiqOfR33PPrwDXM9LDOb9pg8jY1b6+X2LA=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 1 Mar
 2022 10:56:22 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%5]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 10:56:21 +0000
From: <Tudor.Ambarus@microchip.com>
To: <heiko.thiery@gmail.com>
CC: <p.yadav@ti.com>, <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH 0/2] mtd: spi-nor: Fix Quad Enable method for MX25L12835F
Thread-Topic: [PATCH 0/2] mtd: spi-nor: Fix Quad Enable method for MX25L12835F
Thread-Index: AQHYLVq5QRnxn1BbbkGpQ8xUF2TdFayqW0OA
Date: Tue, 1 Mar 2022 10:56:21 +0000
Message-ID: <6dec5259-ccef-6803-bd28-80f7b07a131a@microchip.com>
References: <20220301095640.313852-1-tudor.ambarus@microchip.com>
 <CAEyMn7aWroFEzo9yPfbwQy3g5iwasuWOQvcHhkRA6Nrga-WRTg@mail.gmail.com>
 <afb8df98-e9c9-1cf8-9e82-9c06e131eee8@microchip.com>
In-Reply-To: <afb8df98-e9c9-1cf8-9e82-9c06e131eee8@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c15bfe7-26d4-477c-a072-08d9fb721f51
x-ms-traffictypediagnostic: MWHPR11MB1886:EE_
x-microsoft-antispam-prvs: <MWHPR11MB18866F0F2283C7A6DB19664EF0029@MWHPR11MB1886.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EOagddgxW0mPkYlpTTyTrKbFooiOEpergP34yJvnUmtYg87mHb2KA7lzRc+s3E+0VA+LF/OHBS8Kp1Xjtg4EVIMHsvKZwEdxQdZklRvSwBghPAYHzqDc2cgpPTj9jl/tLAvjiQzO0GlsM9emN5obURyHigzMny/F2YbG4DtUK5Sko24msMbL9uvNZ3uVhAX21enCHQacc8F6+GeJf9kBVBGvuHxILhVwx1OOolrUYHQ91U7zFZc5y5OEyymkSDUkZxm283Lv90l2X6ywFviAAjMcJYauBhg3f77upAcy12FDpO3Eai/JJZBG0E1MZJujWPZ64QeFkACp+u6OyAIOjK0jSlNpCjHJt/I+WRv6Timarw1GWXBDHLwDY7e1ia9JBO3lfKm6OkHhXfmsAeWmsHWleWBaBDA37f7tpzxkQ6IA5wwRp79Ku6zzYoJozy8PTTHgHmjagaK43uw/h2PE4JLSVnYORUzduXRXc7rxo07LhUU6B+RGiAblf3CM59lmWvazSPRHxHsPRoh4mNLaxIo9IAw0sXgdfPWMNHV9ntAFItndtHzYU+1Ck/2F8/XZlZdilRUyJ/rPGzCnTnpO5EV5w05qlms3W0dp7euu845Iybf9x4ZY5yLKjr0PMD+9hjW6APxMx96hxQrAYa2mmkpzEFgT1nSAznfRxqNfswaaoCiI8yeMw8iwIpEtwQtFA977dWUQmRjURmOct0GuwVBWAuJVcxsWjebxaoz9m+QJqJDOI3rcKLaNmbeGGN8ixrqt9sDphBUZDbbbEygAa1dvNt7vSDOSSsL50V6IQHo2bHN3KMUIfHcKYSOhZ1xlTPL40d9Sgn5PaJmQqbvd/n+eqabpF2Ae/vQOJPIe7CnhhJmjorlgF/5DkZnZDqFXsosI1tuvg7wVTe8SOzNNartE/rtT/06H3/X9ukbe24I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(54906003)(6916009)(316002)(8936002)(8676002)(31686004)(966005)(6486002)(64756008)(66446008)(66476007)(4326008)(83380400001)(107886003)(26005)(71200400001)(36756003)(86362001)(38070700005)(5660300002)(91956017)(508600001)(66946007)(66556008)(76116006)(31696002)(2906002)(6512007)(53546011)(6506007)(122000001)(38100700002)(2616005)(186003)(66574015)(45980500001)(43740500002)(473944003)(414714003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1Vub3BIb1dub09hd2dKUmkrM21hUTh0OWExbGZ5Y3BoUUhua3VDR1ZucWJR?=
 =?utf-8?B?d05lYTNYUG5vblFONE5NNDdFSW9kR3NIaERMVFNWZXAxamRNQkhhMkZZNmpR?=
 =?utf-8?B?K3Btb0thZ01xZi9nR2JyQ0l0anMrTWVrQjJ1VVdaQXRsblJxUHBybFpSSWtE?=
 =?utf-8?B?NXlxQ2htSDFYcHlsZ0tIZHl1WGN0dFZkRW1VS3ZGTEVWRjROdzhpYmFUUEc1?=
 =?utf-8?B?Mm5iNGtiYmtSSGhpdFlsb3hkSWpaaWQ5azVKWWprbU9NZTJRZFZpbjNiOVph?=
 =?utf-8?B?ZkVGTE9sclZkVXpvV1daYkJLemthNFo1ZS9WRmo1Vm1OTHhaclBFQmt2N3dJ?=
 =?utf-8?B?d1BESkZqWFVKTTNNR3BwUk8xbU5WL00wREh1Y2JkTG9wMnFMbWM3TUNCRVd2?=
 =?utf-8?B?M0ZNSzlZeDZaRFd0bGZWdk5rcDNIZjV6RVBoeE11Z1RRc3J4dUhPdlpJalZC?=
 =?utf-8?B?bkhsVitPQTdWT29JclV0WWZjdWxycWRidlAxYnBlaVlQZExBcnZPZEpPbUVP?=
 =?utf-8?B?U0JiZEJMNE1lbnV6TkhDM1BBVllVbGxvTEtxN0tPV2J3eUcvYWptTmMrczVV?=
 =?utf-8?B?SGFFYS9NYW85UDNyMXBtY2JIQjBXSXhlTktNYXB5ZmZ1U0RkRUExN2FCaWJl?=
 =?utf-8?B?ZTl4aDZsYlo1Y1cyRHJCVVVzL2xYclZXK0NCYU1zaHBxOWNodDZQNzgzQnpp?=
 =?utf-8?B?WWZ6cVlTSmM2RVNnam4xL0JLV0xOMWpJK0VLam1aN2FGdTliVDh4TWt4NGdo?=
 =?utf-8?B?TUtKTEZ2MTVhek5Fc2JnWXlmOXNZQnJwY3llZnNPUGF3dFl3c0VYZ1NNVDVx?=
 =?utf-8?B?bm0wZTF5TVpvQUgrdlpjZng2aWtDaG1GcERud3RGNEtRcVcwRzdNRVJsZCsw?=
 =?utf-8?B?UHVXeVAxWm0wL1NqZVJJTkZOTUN5ZW1rYTByRFFUVURrNkJTYmR4V0wrT0g2?=
 =?utf-8?B?MlJPUEwveTdFN0xGdEJoNjdOQTJ5ekY1WXZMMXZCTFZ6TEJtRFNaOUZlWENj?=
 =?utf-8?B?SVFEWDFEVGVWQXFoLzRpamVFQzA4Ny9XU3U1Zjljb0k1ZnNUVW9jakJIaXNr?=
 =?utf-8?B?OFhlUzg2V3Y5dFJFbzlNeDdQTzhPa2JBYnRVMldOTjFEMU90LzZmK0w5d3hM?=
 =?utf-8?B?dGZQTzViV090S0ttdUkzcEhSd0g3NkhCSUtRMElraVBpUTZvY1l0akdRcWJS?=
 =?utf-8?B?NkY3cy9rQ3dTTFkwQ25EZTFhQ3ZXQUFrTm5CNWFHeVI0TlRjT1Y1eXdqdlIw?=
 =?utf-8?B?TEMveWRaQ1Z5V0xEVTBFUmRHUkJMYUNZd2JVd0dXQ0lRT2M5RnFWUER3SDBS?=
 =?utf-8?B?cnVZRTYwM0ljWCtrSzhVcFZ5SzY2WXJUbnlVcWJLbkRsL1puYzJ0MExZLzJF?=
 =?utf-8?B?Q05uajBNNTlISDlYVjdJYWs1d1lpVkR5UlVXajJxdlE0ZCtESzIwR0VGNENM?=
 =?utf-8?B?TUlGRlpkUURCNUtxRUFKVGVlcmhyMW9VelE5N081ZmVhNmdCSjc3UVZXWTQz?=
 =?utf-8?B?WGtMang3My9vakZicTBseGVIb0UzdDhZWVJEVitKT2lCdVl0cWJjcTdGeVoz?=
 =?utf-8?B?a1N1ODVCdVA5QVNjelRGcnltUFNXdTdSMGZmQTFIT0M5NHpUQjdUN3V4ZVJi?=
 =?utf-8?B?cG1OcXo4d09NSGlVOGY3aVRVbXBCL2RhTDZnbDVIb2NucXU4Qm5qWG9YSERG?=
 =?utf-8?B?ZnREQ2x2cVdyTW9RdW9maUg2K0dzaDdKVG83ZlJlbUlRdllwQjNJdDBmTWRE?=
 =?utf-8?B?NkJtdXBLK0hXbFNoVXFxVEpDbEtmcEtKNmJlQkE5alZ3c0U0VS9NUDZBZWZ2?=
 =?utf-8?B?bWNqN3AwOEJXeHdQMnltam9XeGUyanIxMGdYZ1gwYzBjRXhpKzVrTnlET2hp?=
 =?utf-8?B?ZUMwTXNId2NPcy9DbTBJTTFzQ2ZWSXYwZWRBdVN2a1dpYUdIcDlEYUdPZFpJ?=
 =?utf-8?B?QjlJMDVKdkZ6WXliQm5VVHNMdUJTMFZ6V0p5OERYNmZVMFJCcFl4c1VkRFE3?=
 =?utf-8?B?UlU3SWZTZzRTTG5PUW8zaS9yckRJSk1RZzY0NC8yL0VhUDZqLzhNeVRpaEts?=
 =?utf-8?B?VmU5RDFsVVRET1RPdWZ2VndaYnU4bmIyc0JTTThpS0xmMEE5cEFvbzgwaUI5?=
 =?utf-8?B?dkdxdzYyVjRrTVQ4M0pGNEJ6L25kTURsVUFnTHNOVzA2NWZmWk1rMWNoWWVZ?=
 =?utf-8?B?elc3TVozWTE1cERyakFjdzJpZmdaYVIyTU5RVit2RkhINDB4cHpzdm9ielU0?=
 =?utf-8?B?YTFwUnlqN3AvUTV1bVI4eXZRSmJBPT0=?=
Content-ID: <4FAA322DE5981A43BF2E541DEC894938@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c15bfe7-26d4-477c-a072-08d9fb721f51
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 10:56:21.9140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jL41VRogYQ2kObzrLAwgPaXQCMFhZ/1oPtj2ecovrINE8tM7oDqQQ1Cd3UtMsEiic0V3EObvlKAggkJ7eqQqJIr3O4WDmWaqF6bZ7tIzzTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1886
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_025628_077533_D34FAF87 
X-CRM114-Status: GOOD (  14.28  )
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

T24gMy8xLzIyIDEyOjU0LCBUdWRvciBBbWJhcnVzIHdyb3RlOg0KPiBPbiAzLzEvMjIgMTI6Mjks
IEhlaWtvIFRoaWVyeSB3cm90ZToNCj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlu
a3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2Fm
ZQ0KPj4NCj4+IEhpIFR1ZG9yLA0KPj4NCj4+IEFtIERpLiwgMS4gTcOkcnogMjAyMiB1bSAxMDo1
NiBVaHIgc2NocmllYiBUdWRvciBBbWJhcnVzDQo+PiA8dHVkb3IuYW1iYXJ1c0BtaWNyb2NoaXAu
Y29tPjoNCj4+Pg0KPj4+IEhpLCBIZWlrbywNCj4+Pg0KPj4+IFdvdWxkIHlvdSBwbGVhc2UgYXBw
bHkgdGhpcyBwYXRjaCBzZXQgb24gdG9wIG9mOg0KPj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LW10ZC8yMDIyMDIyODEzNDUwNS4yMDMyNzAtMS10dWRvci5hbWJhcnVzQG1pY3JvY2hp
cC5jb20vDQo+Pg0KPj4gV2hlbiBhcHBseWluZyB0aGF0IHNlcmllcyB0aGUgZmxhc2ggd2lsbCBi
ZSBwcm9wZXJseSBkZXRlY3RlZC4NCj4+DQo+PiBbICAgIDEuMzIyNjU1XSBzcGktbm9yIHNwaTAu
MDogbXgyNWwxMjgzNWYgKDE2Mzg0IEtieXRlcykNCj4+DQo+IA0KPiBDb29sLiBJJ2xsIHJlc3Vi
bWl0IGEgbmV3IHNlcmllcyB3aGVyZSBJJ2xsIGFkZCB5b3VyIHRlc3RlZCBieSB0YWcuIEknbGwg
YWxzbw0KPiByZXdvcmQgdGhlIGNvbW1pdCBtZXNzYWdlcy4NCj4gDQo+IEFsc28sIGNhbiB5b3Ug
cnVuIHN1Y2ggYSBzY3JpcHQgdG8gdmVyaWZ5IGVyYXNlLXdyaXRlLXJlYWQ/DQo+ICMhL2Jpbi9z
aCANCj4gDQo+IGRkIGlmPS9kZXYvdXJhbmRvbSBvZj0uL3FzcGlfdGVzdCBicz0xTSBjb3VudD02
IA0KPiBtdGRfZGVidWcgZXJhc2UgL2Rldi9tdGQ1IDAgNjI5MTQ1NiANCj4gbXRkX2RlYnVnIHdy
aXRlIC9kZXYvbXRkNSAwIDYyOTE0NTYgcXNwaV90ZXN0IA0KPiBtdGRfZGVidWcgcmVhZCAvZGV2
L210ZDUgMCA2MjkxNDU2IHFzcGlfcmVhZCANCj4gc2hhMXN1bSBxc3BpX3Rlc3QgcXNwaV9yZWFk
DQo+IA0KDQpBbHNvLCB3b3VsZCBiZSBnb29kIHRvIGR1bXAgYWxsIHRoZSBzeXNmcyBlbnRyaWVz
LCBJIGhhdmUganVzdCB0aGUgU0ZEUCBvbmUuDQpJIHByb21pc2UgdGhpcyBpcyB0aGUgbGFzdCBy
ZXF1ZXN0IDopLiBIZXJlJ3MgYW4gZXhhbXBsZToNCg0KIyAgY2F0IC9zeXMvZGV2aWNlcy9wbGF0
Zm9ybS9haGIvYWhiOmFwYi9mMDAyMDAwMC5zcGkvc3BpX21hc3Rlci9zcGkxL3NwaTEuMC9zcGkt
bm9yL2plZGVjX2lkDQpjMjIwMTYNCiMgY2F0IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9haGIvYWhi
OmFwYi9mMDAyMDAwMC5zcGkvc3BpX21hc3Rlci9zcGkxL3NwaTEuMC9zcGktbm9yL21hbnVmYWN0
dXJlcg0KbWFjcm9uaXgNCiMgY2F0IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9haGIvYWhiOmFwYi9m
MDAyMDAwMC5zcGkvc3BpX21hc3Rlci9zcGkxL3NwaTEuMC9zcGktbm9yL3BhcnRuYW1lDQpteDI1
bDMyMzNmDQojIGNhdCAvc3lzL2RldmljZXMvcGxhdGZvcm0vYWhiL2FoYjphcGIvZjAwMjAwMDAu
c3BpL3NwaV9tYXN0ZXIvc3BpMS9zcGkxLjAvc3BpLW5vci9zZmRwID4gbXgyNWwzMjMzZi1zZmRw
DQoNCg0KIyB4eGQgLXAgbXgyNWwzMjMzZi1zZmRwDQo1MzQ2NDQ1MDAwMDEwMWZmMDAwMDAxMDkz
MDAwMDBmZmMyMDAwMTA0NjAwMDAwZmZmZmZmZmZmZmZmZmYNCmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmU1MjBmMWZmZmZmZmZmMDE0NGViMDg2Yg0KMDgzYjA0YmJlZWZmZmZm
ZmZmZmYwMGZmZmZmZjAwZmYwYzIwMGY1MjEwZDgwMGZmZmZmZmZmZmZmZmZmDQpmZmZmZmZmZmZm
ZmYwMDM2NTAyNjljZjk3NzY0ZmVjZmZmZmZmZmZmZmZmZg0KDQojIHNoYTFzdW0gbXgyNWwzMjMz
Zi1zZmRwIA0KMWI2ZTBmNzViNGE2ZDA4ZDU3MDA4Mjk5MjQ1NWFmZmE3MmIyZGM4MSAgbXgyNWwz
MjMzZi1zZmRwDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
