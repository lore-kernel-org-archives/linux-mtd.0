Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B02EC4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Mar 2022 14:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YVv/1Z8CZJyJr6d5HsVDFtZV8TJVpGK0SfedL4aFGY0=; b=s+mdLKQxgNH5I9
	I54TAZ4PbKCyF7HI39qd2kaiRa9uhBjOLZOP2VnclIBWZDYb/rhrp2FQhZy3DsQEeTUNjsBLWsoaU
	PJg8JdXF91ZX+KG5phxl+D0FWE3uzvklZikAKifAhNyVmpR4tULu1Cnw+ShXjzoxX8J8XAbB0udXu
	zwmShiAf4gu1XIuX7D5SRuUWVMDBy1vF6+8htAXaO+1T2qupjH5gmWXILMpc4Wkh3w4iMsuQqEL3D
	XxyKQg2fFKJR+c4MyTRcQ62QFvB2QVMy2pVNVAqO295MSyrfViA9gblrvSEiWzqvmGH/V3ObCTtXR
	2/8s4FalBhBee+11AEQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRxDG-008x6j-Vv; Wed, 09 Mar 2022 14:22:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRxCy-008x0x-UQ
 for linux-mtd@lists.infradead.org; Wed, 09 Mar 2022 14:22:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646835753; x=1678371753;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=r825u2ZG00Fgko3fkPsZfam/eBrK1IKbU1887kKwzEc=;
 b=J8wwomsotFRdMFlqtM7KPvHAXAgflqHA7MbH6JMrJy6UN4VQgh3jZ8+e
 9Jn0EtJX0LekjS53fq7EK49p/+v1yWrZK3djIAG6axQuQzOFXokl4Hv75
 dXDYFbehJQLnJOpuWCMCAR0MgAfHleGTnhAUVM97PNeOe11wjuuPpDpfN
 vMPUv6A9Q8G/rnNQFf0AT371FSPxKBjby9moeFrBWmIR8AJJ5lfodZz2C
 v0pPo5rQfOMD6p1vT6RlSt5wmdy1HPSmvG+qr4NxziT89xaiQZiq7lMiC
 63oTmYMcesi6fyKyfIyqYKh175mxAmheCDYU3dvXedpCcAF+lkuPlwcIN g==;
X-IronPort-AV: E=Sophos;i="5.90,167,1643698800"; d="scan'208";a="155810523"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Mar 2022 07:22:32 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Mar 2022 07:22:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 9 Mar 2022 07:22:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8G0DL3Cqvaj6TYtNIpXIbl/Fh7reG6phCdMCTJIo70Oo0WPr4aumSQ09k5irLsi5SPDWMFTbLC489/R86m+/NB9+YGpz9ORNK8vYmmtlCPwuyEIh7NMDvpso89K1r2QSyPp1Kvt+kv8SVYrjrt3OjZ9NlGMwGMkSuwdwiu1bYU0Qq9tjm75Kq3PYDGi5DS1Fk2tdjbf7Ng/7b5tsMIbx3QYGHkN8SPmIFM2QX0K/9z2RVVInO8+SiV8oMThBc7MqjqHvZeHDXVQp7NguSQohoh6T2rbErTWWP+BK2TRvawLngF72Kg4EisWyZ7AEulMAx+UKyvzfe/NaZfPbXRA1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r825u2ZG00Fgko3fkPsZfam/eBrK1IKbU1887kKwzEc=;
 b=m/vcqFX5QpEaFJr3QoUiCUCnRyoSpZWBLKcvSHMAQptb5GS3O+1dasmtvwqj7IX0x4eoeX4zG7YHcvxQ2evBTEuzB/fWwmxAG40LypQLChSTymau4b2Bdjie9mWqGl7jSgmfEnASKHCGVl8rDfl5+4T3xQPb7GTt0inPVq2g1wevvf6gFlfDb3h8A8Eo88WJSp4EsZ4psXwOHuadNataAcK9Xhdu7FrI335cKVEC/lLXmfeRuRDYA8NgsaQsrJ06Z6iOw9yBUGuN++foikcpTnuhQTC7qC9tapVJcdb66eX5sbPc7Cg6VO+VDtTu70RGNm4vApQ+7f6d17oaC/nUoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r825u2ZG00Fgko3fkPsZfam/eBrK1IKbU1887kKwzEc=;
 b=EYcag+8bDzFBAtvWe3OVHFEkUs/7Vd8TSpIR8+nGug/3OJcZl2Qy8q3sMrK8ZMWIDt1C/WQK8fmlBgSn9rqPXvagNlrPjmdQjGaNk0tyo2cCyjrp7DPQ+llhc2DQwS8Sej7HEqvXZbwAhc+mUA2tcD6wvGtUiT20YQl7787B72Y=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3326.namprd11.prod.outlook.com (2603:10b6:805:bc::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.21; Wed, 9 Mar
 2022 14:22:21 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%6]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 14:22:21 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] mtd: spi-nor Favor the BFPT-parsed Quad Enable method
Thread-Topic: [PATCH 4/5] mtd: spi-nor Favor the BFPT-parsed Quad Enable method
Thread-Index: AQHYM8EWAn3gxKvr+EemEbZ2d5NDSg==
Date: Wed, 9 Mar 2022 14:22:21 +0000
Message-ID: <7fcecd56-494d-a0d2-2cca-989d13cebae6@microchip.com>
References: <20220309141702.173879-1-tudor.ambarus@microchip.com>
 <20220309141702.173879-5-tudor.ambarus@microchip.com>
In-Reply-To: <20220309141702.173879-5-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aed52629-fc5d-4bab-7a69-08da01d83978
x-ms-traffictypediagnostic: SN6PR11MB3326:EE_
x-microsoft-antispam-prvs: <SN6PR11MB33268F3F73DB49FBDE9FFAE2F00A9@SN6PR11MB3326.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NDWohFp2l7Hc1hRvvPM5RvTCL9Luu3y/VXu/2q4BA/+wjV8SgrE0X9p1WpY7NOervB8DpEW20HCeaNiixO408Uu0skoX2zPxM3SsVkzh0raDscrXy6rEgUgl2ZmCMJ+S5EVtqL242oQ0hKn/KF6KXvnYNKCYXKpkeeqlNFw6LnyKWjtpsEjCp4Ne/hZTeSp2pmP3teVugBxgftixcKE+q1/XgkmGn5lvqdPfrgdxizmeifdXYNNHIc6GX+ooQQLKrMWe5xRM1ZM0S9MGlUyEPwaJVy99SgWGUhRePOld48xxO7kSKzrWFX/53NbR74cseR9C7CjfEaTLbanb7qWi0g2bUcF8dhufWMaBWkjNSTjj08T/eK3kUGG93LeI59B8ctGPiarKY9L3N20YYjyTh2+6xILQXk6hQnGJk/LYRtON+hdUV++9st3BigughkSqun2e7aNrCmZeeWpUWDUnRBuHFJ4eIW0yAWwktpyt9aGPceNqmpIFWajg6rY3+penICtMRdRO7h3QfMvhqLCVhC1Yol+/hUpR/U2nSxYUqmcZTj/yLZLSV3whXkUGuiTTj9LyPykjSuhcUhLok0MD/496gs3/6d3tdPN7zH6ZJyzBmovivfN6gao/2hIdpM08lRoajTznKtLo7duKYf41o6By/Thu57KENlrV3/1XGgxSSeCN545KJXjXp5Sz3uQf0nTgrU2Og6UrJd4N5VoZbcGAfYLWn2Jl/c6IRDl0ZX88xXduzvkSWkNil0kVwftm7XAuC0R2JkRiZDbLPqhLTw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(83380400001)(186003)(26005)(2906002)(53546011)(71200400001)(76116006)(91956017)(66946007)(6512007)(8936002)(5660300002)(31696002)(86362001)(316002)(6506007)(31686004)(6486002)(122000001)(38100700002)(2616005)(54906003)(110136005)(38070700005)(66556008)(8676002)(64756008)(66446008)(66476007)(4326008)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWxvOW04azhSVzZqTldwY3EwTUtOSlU5N0NhaHBzWHJLTk56c0lYMnhFOGIr?=
 =?utf-8?B?ZXMxSWtRNW1IRVpCQ3p6bWtPUE5PdGNDNGQzS1hXZm5PU3ZYVjB0dHZjN1d0?=
 =?utf-8?B?WkppSlpUQVgxQTc3dUtoT1I5QlR1dEYxUEUyNVRJMUJHMHhkVkNVS0cwK2VD?=
 =?utf-8?B?N3hDMUhQamtPVzh3V0ZoN2dhQ3NEdHBUcjdiSnlBak5ES2pCbHY3OWF6R2N3?=
 =?utf-8?B?NDQ0MTBmT2JjM1NucVh0SmNUQ1UvazJLbGtSbnMvMlRGeWxKRGdvbFBUbk1a?=
 =?utf-8?B?UFJaT1d3YUZWTzZJVFh3dGtkYUVJUXYzRThmMEtrWDR1RjRSNmZHbm9VU1Y2?=
 =?utf-8?B?ZjhqM2lESG9pTHMyYzc1OUJIeTVORjRmaVpPbG9EcVY5ajBLSjRCdnVSTi9L?=
 =?utf-8?B?MFExUEp2TVBubHVkTG9UUTB3T1BmdkYwMmxmS2hWcjFnWm5TQUZCNUtoc1VM?=
 =?utf-8?B?cVhrU0ZIbFpub29lamdjNlFzTnQ2cXVwa1ZlWmZIOHlGU2hObnZXZ25rN1hz?=
 =?utf-8?B?aUpoZnAwTDNjRW44TFg1c1pHSjM2eVpnOGwyYXYvU0ZNKzlEajB2bEQvaElQ?=
 =?utf-8?B?Q1N0VEI1OGt6dDRrdnd3TENqRnNET2l1M3Q0V0h2UWlMdU1CbmJMMVhkOVFX?=
 =?utf-8?B?QlI0S3JVazdhckRXbFVUcGlEQXBFY295S050bkRkNkFhMG9mYlcrSDY5QVNW?=
 =?utf-8?B?S09yU1F1T0JPY014UlgwM2xheVVFQnk3OGt5NVY5cXhjRDYrSHpTQ0loS1Fh?=
 =?utf-8?B?blJ2Uk96eEFRdHhCQytLbDQyRXZrOGVjYmlDV2tuSzU0UEZDR0JHb1pqME95?=
 =?utf-8?B?a2JlYVJ0cExDbS9iQTNLdnoybnZHclhMejlyZzhuNmZQNG5aV210OFh6bGMw?=
 =?utf-8?B?OXd6VGZ5WTFqUVJoREg1eUhEalVoTklTUXZGaG9ueU10MWVXK29vcjBNRlFy?=
 =?utf-8?B?dFBEYlNISW1melY2ekJtZWtuQWQ0RnI5a2lJRGpaV0RDV3dnbzRoQ2dldHB4?=
 =?utf-8?B?a2pZM25VeElMVlZsb2FTU2JGZE1ZUXFzNC9jRWRLTTFTSWEvSHlWaXY4U0ZJ?=
 =?utf-8?B?UlhJSktYNUNqVTdWTnc1MTNiNG9lMVRtZktkM1JFc1VxM3RIb21aQW8wWUpT?=
 =?utf-8?B?S1U3L3RTY3FDajJDRDZVbXZkVG1KVzVIRGR1Y3pIdGZ3NTdKSEpBMnFOcTVi?=
 =?utf-8?B?RlFwM1RHdVFKaVk0b1Rlc0pKRy9vZ0kvS1ZMN1hOenR5ZVduR3BrS01pOUpN?=
 =?utf-8?B?MVFvTEtwMVg0NHp0ejhKWC9wdC9nMkJvbTBLNTRpSk92dmxaWjFtaFVTT0cy?=
 =?utf-8?B?SmhRejhCemVYY1VibVF0WnpYT3lTMklmNnBzWkJPQVJOZFdLcFZoTXNCVGdj?=
 =?utf-8?B?U01JMG5XaHM5Y3dvU21MOTJIMFlibWpDajl2M0E1aTNjS0kxWVNnL3o0SE5l?=
 =?utf-8?B?eld4dGgxbUVIcUJMN1VJZGpMMjdpYkxibEdzOVZOaGZXdWtreUtLeTFNekZX?=
 =?utf-8?B?eHlqWEc3ZFRNOGRkbDBJdWlxS21oaG1oR3d3TEVpZGlmSEV0emxvdVFVY0Q2?=
 =?utf-8?B?QmZaWjd0dng2Slplb1c1RHV0ZVlzZEsyc21GTitUczdTaTdPZUNTNTNLekFD?=
 =?utf-8?B?SzV1QnBjTGFER2JWWE1ISXByUDBNdWF0bjRIUXg3cXo1akhzVElkVFdPNjMr?=
 =?utf-8?B?N3dyUVJZZW04N21oQ3NFaE1YSEpLU2orc3hHUW9BRE1PQ2N2aXRHb1VTdEdL?=
 =?utf-8?B?b05NdnFDaHA5VjJzYURXWE93N1ZEN1VQTGwyVWcrSXFRbUI4czBQUFBqUHNL?=
 =?utf-8?B?LzczeHpIQzcvcjRsTThRdFhhdGdSSXZLQit2SEpwOU9pWVZRVEQrWU04elEz?=
 =?utf-8?B?RnFvUlhIRFV1VEVxdzN4MTBZVzZyYVRyVk5GZkhQb3lNUHJadS9LVUcwdXBD?=
 =?utf-8?B?dmNYVmdJNnhnalQ5emtSS1N6aDgzajZ5NE1tNlIreHl2emZBek5MVDNMamIr?=
 =?utf-8?B?QWRnUlJrNjZ3PT0=?=
Content-ID: <4D5B9E34A30C9A46BB5E7FE24085D37D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aed52629-fc5d-4bab-7a69-08da01d83978
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2022 14:22:21.4169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gCHPrCy6AQ12X7Wi+q3Cnh62mWke7qyfgfmFltT/z06EDPH9EgSPvB4T5L/tMlcinwtNDZwr5hw8JAi5HlSpRBHtS22C4ez7saBS5IWQfLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3326
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_062233_109576_1837F5CC 
X-CRM114-Status: GOOD (  19.12  )
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

On 3/9/22 16:17, Tudor Ambarus wrote:
> JESD216 SFDP defines in the BFPT standard methods to enable Quad Mode. The
> flash parameters and settings that are retrieved from SFDP have higher
> precedence than the static initialized ones, because they should be more
> accurate and less error prone than those initialized statically. Favor the
> BFPT-parsed Quad Enable method and use the generic core methods where
> possible.
> This patch may introduce regressions in case BFPT contains wrong data. The
> fix is to introduce a post_bfpt() fixup hook and update the wrong BFPT
> data.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c     |  5 +++--
>  drivers/mtd/spi-nor/issi.c     |  4 ++--
>  drivers/mtd/spi-nor/macronix.c | 14 ++++++--------
>  3 files changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 5de46a786cc5..9a5299a7b212 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2427,9 +2427,11 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
>  	if (nor->info->fixups && nor->info->fixups->late_init)
>  		nor->info->fixups->late_init(nor);
>  
> -	/* Default method kept for backward compatibility. */
> +	/* Default methods kept for backward compatibility. */
>  	if (!params->set_4byte_addr_mode)
>  		params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_brwr;
> +	if (!params->quad_enable)
> +		params->quad_enable = spi_nor_sr2_bit1_quad_enable;
>  

oops, this will break micron-st since they explicitly clear the quad_enable
method. Let me respin this patch.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
