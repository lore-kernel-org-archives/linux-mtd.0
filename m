Return-Path: <SRS0=UGcd=OV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1360C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 11:55:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96F0D61A63
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 11:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 96F0D61A63
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uhWQ90i/GCOcBO600tXamqNSeYJf+dtkZ73tlLLXM/0=; b=XJ+pdzn+Q42ife
	gpvSoBytWmI0csk4lorkjc887M2miNrC0wmab1aIKqVS+9BLa7beoOAMJKW2iyB8H+bcCL247hplR
	uod7niwcna9PHAj2dxZr4/kMuCnx2W+EaEovFP4CjkcE9mYpp/4Q/gTitDpibrCUJsCbUk6uFQRMb
	XYyxwIVL+V3H8znu5rTqDMbR9tNf+MjHA3TMPStfJtt1BLF8wIxvP4tT1Bk9toEnsxOmyTCqgN14o
	W8qtWkcDmvtKPiYxi7VJROgDwnHBDyMv/qgrOY6Kf0GpdBkow3UOL6jVJqhsM0Wo4NmDp8gvXgfXG
	6q/zhCricDupNldMMPyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWH82-0002vL-5u; Fri, 01 Oct 2021 11:55:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWH7z-0002u3-FH; Fri, 01 Oct 2021 11:55:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1633089299; x=1664625299;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=M0LB3qQtcI5IrGtlwqMSaiqP/N1uyb017kBGc7yG5GY=;
 b=yYHDCKW/MbdZv25jFXppzQPl9CIGmb32APDya/Q+Cx3xVM58Oaj4o+88
 rnegS4YLvDc+KN8+rjSHW/2OtOE2k6TEIXqqns1JJ8NUGk6sncnTFPWmA
 zBt5m6LHs2y1n/4hhq/py9vh88SUa4CI4jKLEYvVdi47PNH3uQe2WgEjn
 fg7fKulk+GBwddX1dmUmygN7MW8Esy5EWkIfnEbfSYtngCSfH8gsefCzo
 CTVSALg2e1+FcBzMKpiWVX229XjjF3lGPaLpHpGbGSajQ1MfinFaDjjec
 H8yIB0AX6hJSgpWtbJll2QpkUKumTMSHtbkNiOdRVjKTsHKHoknSjpRhG Q==;
IronPort-SDR: L5vbScPcv5w97XPQvIlFCy+wJhEBdtKmat6eNDn9+5HHiK+l7cuP1cRLnLLpls+/kpDQ5TFAia
 6xbJq9gswiWn4Bf3XTTdn769OiTbL3p0Cz4UcZ8SlX6EZhcUJmOVKN/K+423hiUjXcfug8tjIA
 JDfGfwd0ZVBnQHmp1JmEug7WRFfZO0BFcwx31iG2Kt6nET5YsZEOffAIAixo4ysmeJJYAbdd/1
 N/toXlz7bP/mPVEjHnQJy82JsAqTQWzHjLK7D5CiwsdZ/oKzQLVkUZlFk4jZFO5fXRjn5CpjCi
 6KvBuCSnU5LaBwOhQvM710Tb
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="138121997"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2021 04:54:57 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 1 Oct 2021 04:54:57 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Fri, 1 Oct 2021 04:54:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUt+XaCq7lw1jmFUhOBzZ9pprjvolsONtidWEutdFr+KFq392r+8iI3XtdKEo1ewU8JC7ZU2ghZtmw4h1FnlPJwbbT7NR03oSx0rBmj+4nO5QQdqrXRre1JCA48thOIX1YeKTBZIcGfpph7omAttFQQY9xHYWe0FOnTGBM2nJ8TW1TiuqD/HdD/sBGNdNrLtpQ9Z8KGMGTZ13qcZUWtf7GD43Q3ePnyR6e2XMID8CJKxOeniPN52Y6SblbkPnyNFlTjnklHR/fpBeCQ82DKLv06j1qR/w1SC2cx25hG7Q+CJBAw7KHE7rTKq9ZYzmTS1r3c2TfASKTtDJ7nD+7RqvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0LB3qQtcI5IrGtlwqMSaiqP/N1uyb017kBGc7yG5GY=;
 b=EoU4CvGwKxqcjCogNkJijMBPACBWBBpYFq7o0sIKdiKuOoUO+WGjcDyrHjXj65UQL0SY3svR2FY9C8NUkWRPL41HdPnvZVsMaJ3GnbiZTJqWRtS9cRc8TKzcYRnWUXBE5MPY7YnYI/rvdyFo5YF01HgBVSBM15yOiuvJ/jJgUfXcRr2BeWyyjsk4Yw5jf3/qbdyfxXRbbZyw21csoEMRfBSrowch38wKBVj5H3LlGRS20f+AsuRSXGwgaHaGgZReIQ+BKMm+PiO6DK33WvD2xEWPvuBz7ADazlqZwhWEUAdRz8S91r75+PraNsvZ5Fg0qL8wb6d4CpEd1QIvglkU4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0LB3qQtcI5IrGtlwqMSaiqP/N1uyb017kBGc7yG5GY=;
 b=MTL550fCRV49JRRTk+bHVgOvkaO5fu+xLS6eSrKLRvwuxH0rVnVFlJ7FAlOL/AZrs8OloBdI/77IYwAJHUe9Eoyks3S3d5fEigNmTvxggNqEuG7moLelHIZ5XF/8bOlpM0Di93YNO7jGIVO3ByA8tN99NPruLQv6oFqeHYX4abU=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4751.namprd11.prod.outlook.com (2603:10b6:806:73::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Fri, 1 Oct
 2021 11:54:50 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213%9]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 11:54:50 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v2 11/35] mtd: spi-nor: winbond: Use manufacturer
 late_init() for OTP ops
Thread-Topic: [PATCH v2 11/35] mtd: spi-nor: winbond: Use manufacturer
 late_init() for OTP ops
Thread-Index: AQHXtrsiusMIpDqfEUSyG8aVPL5uAA==
Date: Fri, 1 Oct 2021 11:54:50 +0000
Message-ID: <aaab30e5-9ea0-c103-0791-e565470ebbc0@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-12-tudor.ambarus@microchip.com>
 <20210816191744.k6ufbgrrwh6whhnc@ti.com>
In-Reply-To: <20210816191744.k6ufbgrrwh6whhnc@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b86501d-7e8f-4fea-ef79-08d984d24607
x-ms-traffictypediagnostic: SA0PR11MB4751:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB4751F68A3AB13ECAB13A99CAF0AB9@SA0PR11MB4751.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: koKfv8YdLEx4tqR8ruiKjx0/5bSUAYaNdTzg2/akaoLeDkms92tsrLtAvUw7s7DmDferaIwVOBwSwp06SLN3khtOroH9P7ytL+um7TRIODSYDGVQ95mi8d+HhaL9obnKZZ8A1Db8mtKoXmVgsPXDWNFtz3mF5+idmt6verOn3ZU0qQZ+UPkJjMzVcOtj+uKxg3DShwI8LjTpYuFeqL/1EmdaAM/eDSBUEtgI0+sypfhsuBvQSGN1Vsr9u7tC/s9OhPjYXQ02C/kjas5wCBftECNi527sGVv93EfN0B1lw9ApxxfZHnbGvtZuEPHrJxf6uHE3yHuNfMMHu/9s2A8FHYiRwC3BDeXLUuvdAX8nakaE/DqxHuV6IFMNsFhN45fqXVCD0+8tAGiUuiSF1OuJo41Oc0QBthXa3DA7Fzjeq68RNJQwXmZylTNkMckIyoC1BD0Zkf5XjjlbYc4lgIb/G0hC9B5dHvu8WyBd0d1kZ0hyt0Edx54u2IYFd9zrgdUPKljaLr3DQpkQfAjcHydSmt1Y45iI45jFP0Ik9ciC8MU8WEgK4fE2DwQkBdq0MUZZrgEOnkCFiQGoH0AikGxtSHiusWis5UGwF9s+viriq9N5YZeLbGsfwPsPAysTHF/xuJDHZxXM9GOW+nbY0Up9k2D5Orfwxod8rqT4KHyzqTJKpTDXQy6XJkUz8OYjdwKdXhzY3yGg0jZJxJN3noxU5Jnkm27ZsabOnUeaSNXS12EPkn9uw98xALUlAj6NGsFf7+lT3PabtDHl0mrPYH8k/w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2616005)(83380400001)(6486002)(4326008)(186003)(53546011)(6506007)(36756003)(508600001)(26005)(6916009)(38100700002)(2906002)(54906003)(122000001)(31686004)(316002)(8676002)(5660300002)(8936002)(38070700005)(107886003)(66446008)(91956017)(76116006)(66946007)(66476007)(66556008)(64756008)(7416002)(86362001)(71200400001)(31696002)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWQrL2tiVWZmOEErNWVDSldPNlVJVHYzeXhPREhoZ0RJZUZsOHNBSVh4Q3Bi?=
 =?utf-8?B?U0VuTUxPTVU3L3dWdjRHQXRtTEl1NWRHTU1WeWROYjVjMW1aSkx1ZE9ZazMv?=
 =?utf-8?B?VkNFdFhpdEovbXMzOFJyRjJOMkNTZ1RVRThLTnVGelhtTnFJM3RhQ0pGWEUw?=
 =?utf-8?B?R1RCemxMWDdPT3FNWFZrQzQzQWMwenlVUFQ4UlRPc1VVeTNBTTc0SDBKZi9K?=
 =?utf-8?B?OHNlL0RFYis2MXBNOWxYcmtPc2NYRmREckZ2bW1LYk5HVTZ5Q2JGekpVZGdw?=
 =?utf-8?B?NnBIYlVhaWtyelUzdUF3RXNPNjhVQ2NWOWJpQWFBczN5TlZvSFpoYVVBL1Mr?=
 =?utf-8?B?VTczTzB3THdZMFlCVGJCNE1uMjVWdHJpSnhrVFBBY3o0bmJKYSswU0I4Rm1Y?=
 =?utf-8?B?UlE0VS9OeUg3d3pKbDhXSUwzN3VnWVF6NjVVWDV2TWtvSGgrVXBlWTFwMGdp?=
 =?utf-8?B?MGJOVjh6OTgyYVRtM1ZxcGlhTzA1aWt5K2JqVWtQeSsxVWkzMit3YWU5d1hp?=
 =?utf-8?B?Z3BUZlR3N3J4SWtVcjJlNlgyZ1RmcExZM3A5bjdTVGg3Z0FtejJnWEcxa2Vh?=
 =?utf-8?B?RjhUYzc4NlhpTitrbzcvNklDT2xZVk1hQnY3dVBCcmgxYjdDTk1aMEZNVkdi?=
 =?utf-8?B?ZHNLQnNtSnNVYXkrSUJmcEtuUlc3RDRUZHJFWWVDRENtWUx2eW1tSkdPZjFR?=
 =?utf-8?B?TmpudzVmV2ZQdVJIcXFOUVZFYnNtSW1hdFZpMi9iVjltV3VvS2h4bndSZENI?=
 =?utf-8?B?MnJKbFVZejlUbEFqVElPVm0vZDRyQkZUNVhDNnpCMjJXQ3o1QUtwUzY1eWRM?=
 =?utf-8?B?RTR3L3pMdmNDNnFKdHlzcG0vQzFBbFFsMjQ3T3g1MTBZaFp3VVBhclJjalFX?=
 =?utf-8?B?Q1ZUbEw5TC9BOFlmcmZoN3pyTU1QV2VPY2czbnpzcFRyaitwaUVORFNpaE9r?=
 =?utf-8?B?dStkcHdIZjlqbENteUYrN25wOGZhcWVFMk9FdUEvRzZXQVlOR0I3UHhXMjRN?=
 =?utf-8?B?TVF0UW5QUkdsQkJib3JTMVhNQXgveHJDS1F0bkZMV2VDMlFCa0lMZUJxa2JW?=
 =?utf-8?B?NTN0VVNtQ21Qa3A0b2NsTlUzZFVqRUJxbnhoQjVhTHVkYmZjeVZhZVFmSlZ2?=
 =?utf-8?B?a2ZydzB3NXJqVkxZVTUwdytLd0VSU2orM2ozdHNVMi9Id0VPQ2txbWNPLzR2?=
 =?utf-8?B?YzNPYlJJdDRmek1MS2Q0cEl2cE5zWW1lWC9aSzlDbEhtSVBFcnBMOXJ1cVU4?=
 =?utf-8?B?ZHhKclViZ2gvclo0N2UvZit5bFRQN0lPbk5aM2Jsd1lxVWdIVzJ2UEpnaVpa?=
 =?utf-8?B?YlJtRFh6dXJHUnNHZTQvZDZGWXQvSVltR0NtNU1OK3EvbmYxTGpRbUFGTW5O?=
 =?utf-8?B?L2tkNkNqR3dhT2RmTFo4ZStKdmwySmR0NHVxaHZFTXRDTU0vT1B0QVV3RVYr?=
 =?utf-8?B?aWRtQXBFNmlhSFFVUkxjNkVreVdPMmtTYnVLZEhzLzJkNm5CR3R2d09Rbzhn?=
 =?utf-8?B?ZXhQakROYlo1K0lJNlFjczU5ei9mVDJQaDhQT2hWWkRzbmRnUnEwcDFjUVhU?=
 =?utf-8?B?SGRaQThhVFpDOG55UWhyTmxqQm0xNzJUQXlBU3hXLzZCbERpaVpNY2Y4blEr?=
 =?utf-8?B?M1FSY1dWK1N4eE9wTyt2V1EyS3ViTTJPSFNMRzFNSFRSbWlEYTlXSjlKWjAr?=
 =?utf-8?B?VlFaU1YrWDduTDNrWVdrbE0yeDFNRG5zdldrOXVMMjdaVlRkYVRiMCtrN1pI?=
 =?utf-8?Q?BmpCfGFNbDwiM5ivio=3D?=
Content-ID: <BF95886751AB154282C01707961C5BDF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b86501d-7e8f-4fea-ef79-08d984d24607
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 11:54:50.1862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: itQbRmUzzpqESc9KZC9kMTLzwjXXk/Hyw31DXa3abJ7D4ccIxFqpA+5JupPpRtaqdEjR8jZps/FLSBGfT2VXEARjnqKmOCi6mgk7AmUF+3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4751
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_045459_550601_C4F80811 
X-CRM114-Status: GOOD (  26.90  )
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
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 8/16/21 10:17 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 27/07/21 07:51AM, Tudor Ambarus wrote:
>> OTP info is not yet discoverable via SFDP, use late_init() to init
>> the OTP ops.
> 
> What do you mean by the "yet"? Does it mean that OTP info is planned to
> be added to the next SFDP version? Or does it mean that it is possible
> to discover it via SFDP but we just don't support it yet?
> 
> If it is neither and it just means "SFDP does not mention OTP at all",
> like it is for locking, then you should just drop the "yet". I know this
> is very nitpicky but it just caught my eye.

I will update according to your suggestion.

> 
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/winbond.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
>> index 96573f61caf5..6be45d2291c6 100644
>> --- a/drivers/mtd/spi-nor/winbond.c
>> +++ b/drivers/mtd/spi-nor/winbond.c
>> @@ -147,17 +147,22 @@ static const struct spi_nor_otp_ops winbond_otp_ops = {
>>  static void winbond_default_init(struct spi_nor *nor)
>>  {
>>       nor->params->set_4byte_addr_mode = winbond_set_4byte_addr_mode;
> 
> Why not move this to late_init() as well?

4byte mode is SFDP discoverable. Ideally we would get rid of the default_init()
hook. Flashes that define SFDP will get the 4byte mode from SFDP, the others
by explicitly setting the late_init() hook. All these should be done at flash
level, not manufacturer level, otherwise it will be hard to guess who sets what,
and we can end up with fixups for fixups.

I'll parse the 4byte mode from SFDP soon, I think I have some patches somewhere.
But the series is getting big, so maybe I'll keep it after this patch set.

> 
>> -     if (nor->params->otp.org->n_regions)
>> -             nor->params->otp.ops = &winbond_otp_ops;
>>  }
>>
>>  static const struct spi_nor_fixups winbond_fixups = {
>>       .default_init = winbond_default_init,
>>  };
>>
>> +static void winbond_late_init(struct spi_nor *nor)
>> +{
>> +     if (nor->params->otp.org->n_regions)
>> +             nor->params->otp.ops = &winbond_otp_ops;
>> +}
>> +
>>  const struct spi_nor_manufacturer spi_nor_winbond = {
>>       .name = "winbond",
>>       .parts = winbond_parts,
>>       .nparts = ARRAY_SIZE(winbond_parts),
>>       .fixups = &winbond_fixups,
>> +     .late_init = winbond_late_init,
>>  };
>> --
>> 2.25.1
>>
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
