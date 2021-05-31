Return-Path: <SRS0=sw+G=K2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB41C47082
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 08:53:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFCF961186
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 08:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFCF961186
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TsVSzwJrcMprCdC7jn9Zi7Rjb9RmnYH8eukmpwpg3DM=; b=yCZGfD2cWIkZzn
	YgIhv+tapk/ag7A++V0Hv4F7G2e1x8aSeC3EOXKmQadQtA+V16jtB489tMprtXIMDirS8jaK2M2KR
	Z5PZ7fuJlJg2MhzInxDOQUt7ji+3+j+Jbjc/CV2+RBZI8VMs/rfMTEnxr3scaZ04b0Lczi6kv3gDH
	OZS6doTb4Fh/XWC5EPr+Jc4RAmKZ+UV4BotXm5DOoRquXfvOh2j8CX7PFTyf3gErHFpIl45ccMVDW
	QdIoquJEnT5mQFj0QrgsID4PNVAKQf+ftP/qM2ZgYfphd+aGLZRXpS6USHRqgwAvtTRPMt2Y3QZCP
	oev4BnL+LOY7+HBDgM0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lndf9-00BYNi-Ip; Mon, 31 May 2021 08:52:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lndf4-00BYMX-8u
 for linux-mtd@lists.infradead.org; Mon, 31 May 2021 08:52:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1622451157; x=1653987157;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Cys1yC6+uRjxY4klIlSfY+ZTBgFQKeH/vE29yC+pHao=;
 b=aWoIFlI+qd9FOdT8uyiY29/0FZSwH5fZoX8BmpvzQ7zxKdXIwLzeNK5l
 8PfSN4RNaLuxBEdf9p79+IEJUvHcnnNdrtMZOHPvnrx80XEQOX9wnKQUw
 eToFob5T32B+PiFKgRGwz3OGIw/BPJS/jZ8ZzZoDsuvsuQhaDoJIZSGNs
 nbeXw5cvtTjkdKdMpWprdb1m8UI/HjR5qq2sBvJT0jhWEGjlYVv7vJ4tx
 DnsxB31F87FXJXX5nL96YYbdyP7N8Q9k9NwD4vZhnHb5g0bPXW9hv+BsI
 M4j8NINohLYQunmcC9VnhAVfj+/MnAeXqUsavasW5VUjhLcFFiQouJyrw g==;
IronPort-SDR: JjEeltAKo0mSCaqksnuf9zCpWQrD16BGBEqD8UIA1ka0FxCi2Y1Re4CUxMb7DbZ8BYG1jZ2Qk9
 gsm+w74Hns3qSFqVhPjGe74egXqHLcmAp1K4t9a8RCHcbtmuKJRXriw3OmCUuLSrYoKgvV2t5n
 9/Li0I3ZHN9ICqqKPeSt9zVTa1TXv5n0OvUgXpOUKRA/7r/6nP8FBkDmxYZm/kwVCRWaZOMvOB
 h7iztmyScfhy1qw/Hx8BsHVgHAdkQ7JSKdXanlwtld67mcHnjxMc9scBG+G/iAbfMh1sd2DSfV
 V8Y=
X-IronPort-AV: E=Sophos;i="5.83,236,1616482800"; d="scan'208";a="123506544"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 May 2021 01:52:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 01:52:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 31 May 2021 01:52:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aabPFomX8cPvo1eODTnp/5S7JlBD7+nS6IaK2nw6j6zpDg4c0X/GAYGPuUxbePNTNj3IHqW4oPkByuKuMWL1RvgcXkcQHqf3YYIz5UtGWvOY8b+oglGdgiW8qmOQhQMwZZTldeSElbpNQY+YVN5FlquGrrrvncx1KnqlNQILW+gcOJusQnvXNDY0pTQnQDUM0WVvEq98LLcIVi3xu1q9oDnpx89eeuyykRbmkDKTdV9MiEjQmaxUunb4Zq1gEMp/xzvamsaAzGrZaUTjAdM09vuztdjIEaENIniVF2PmZpEq4PDmqPOTPrDM/hrJMlZJZDgF3P5MI0S2tPEIW5ia9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cys1yC6+uRjxY4klIlSfY+ZTBgFQKeH/vE29yC+pHao=;
 b=DlwMWVsmFo5gDAwhwlCTeo+m7ytzI5sb/5+80GIdg6dbN/m7h/jyglJQVpayiD3fqBCkDGFKYHiZQPemu+PGQ/akSgLyiYeI1qFdwSlHGpX1aISNh1VioHF8guWdxSOvlcW80H18yIAN2MX0BOrcAt4mimA/KCRmVBs6ILeldOffYi6iMCywzMaC92NYwXaL8fBSv4L9zYT3nU2xffO8LI3Np+GTVN9idM8i1udRr5T3JsItuUb4CN+hXtin1/YuHmPVY3GzDkr+r1X+tOGE+5LKtQ8ZvKz+zhl62btwxfZA0bBgaZ3QnATbgQ1WsjHLfgF9c4CxU3STl1ww0LzwQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cys1yC6+uRjxY4klIlSfY+ZTBgFQKeH/vE29yC+pHao=;
 b=dnySKY4pfxV41iIgeyGtXM+kLK4gW6vyZG0C/opJrvfGEU3JHSKzTSV77LUrEcyllDRxeKyvMOQFwRtaR0DKlnuONKFvlzTPNnpIk7taUaIa7E6bTYU8oU2LeQRmRbzd+5J9LRyfWEA3h+6NESzMDEDL8ikYgJj6f9ZPCJ+ILTE=
Received: from CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9)
 by MW3PR11MB4588.namprd11.prod.outlook.com (2603:10b6:303:54::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Mon, 31 May
 2021 08:52:34 +0000
Received: from CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::1c4:1014:a541:e370]) by CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::1c4:1014:a541:e370%4]) with mapi id 15.20.4173.029; Mon, 31 May 2021
 08:52:34 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v4 3/4] mtd: spi-nor: otp: return -EROFS if region is
 read-only
Thread-Topic: [PATCH v4 3/4] mtd: spi-nor: otp: return -EROFS if region is
 read-only
Thread-Index: AQHXVfpM0f/OzqNCxE+GIZpPHw2egA==
Date: Mon, 31 May 2021 08:52:34 +0000
Message-ID: <bf3a9cf9-fc72-8ea4-de0a-1f0e123cb644@microchip.com>
References: <20210521194034.15249-1-michael@walle.cc>
 <20210521194034.15249-4-michael@walle.cc>
In-Reply-To: <20210521194034.15249-4-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1b49ebd-81bd-4ef8-8321-08d924116f3e
x-ms-traffictypediagnostic: MW3PR11MB4588:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR11MB45888015CBE87C8F17BAF5D3F03F9@MW3PR11MB4588.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lXRuk1UAKSYgs+xFxh6MbxbaXySOlJ4n0OHkU3hVBwk8xC4FZRROvcDwDdu+fWzAs8J3F456wrq+bwI0C6bOvGrohY/CImoXxxpDWrcMCu7RhsN8EmATNBKtqcsRD8lb/BrUR9IYeTkB73bMqN9VnInixhdGFx7btUfEWFmLYCVHmdLvu5oy8/Vy0z6hC/By0wifOd+3gxFujN1GyaaiqrPCHBE64orVbNBCFvqazRqj2az7tKU2CKTnv3QFH11z3L69Oeyym2IropgtrbNzsLVMVRZ7QTysrez1slTUYzmagWbdKkEdk4qN8GV7WgiAYp5FhRGR+YmZZlA2Jy67Qt0khMRVIdz8OuJ1U/WRv7E0Xq0RXHwzlxxsaDb3Jbt08RlA6iuOnhtH3vW/Gw48d8qwWGeg4sErnIHuApgYZUVjIB/vkA0g2ZAlcgbHT6goDF3AEx6EtSkqrMc7grWpScg35v6SDCqRkfSAViFz2isRr2I9ai9QqaFEqRtWew73kR5z0yGHKgVf5Cbtv3jqhtDbeBhWdfDJmw3RFIWetam7UX7g9nPRmM+njGK6BNxii38OWLX9b/TbBoFwnyW3v3l4n773/isnWGnsW756egC5NY+r+EgNOLGluHNhBK+Q/DOrGY3kJ5GLzQeghCWOsJCxZQnGl5JX/9gQ4fcZ4nPLjV0j8TgQkQ12Wl/jUd8b
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(136003)(346002)(376002)(396003)(31696002)(76116006)(91956017)(5660300002)(6486002)(122000001)(66946007)(36756003)(2906002)(2616005)(38100700002)(478600001)(53546011)(186003)(66476007)(86362001)(64756008)(26005)(66446008)(66556008)(316002)(110136005)(54906003)(83380400001)(6512007)(4326008)(31686004)(8676002)(6506007)(71200400001)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?dzhBU0MxWG9udlZobjQ5ME4rdllZdXpKekRkVTFTZTFOYmZCVkJ4UmtLNUZN?=
 =?utf-8?B?d0IrN2hjZkxWUjR0NkhxbVZYTkh5d3J2WEFDZno0dTFtdVI0a2x6Y0hlVUN5?=
 =?utf-8?B?ZUh2T0xBVUZBalhsWWVxbE8zdUdNTWNGcVVHbFEzUUVXOXJHVmdHT2kybnJZ?=
 =?utf-8?B?MmJMQmx3ZHNoS2lOVit4MzlxRjlVYWQ4aFhJcFpYaEIrakQvMG1nV0tONjVR?=
 =?utf-8?B?TlFjUXo5OXo1Vk5LZjBtWFJXbEtpNkxBMFcwYWMxN0htTUFJc1RJL1dBSEVt?=
 =?utf-8?B?Yk5va3IyNGVPaURSTGdEVXg2cUdQaSsyVy9JMTExcldFYUt4RFNvT2lvMGEr?=
 =?utf-8?B?S0lrTXlrZWs3b1lvU3VoVS9JQitZdFlOY2JHS2ZMaDloVjZpaG5SU2hpQlJM?=
 =?utf-8?B?Rkx4YzlpeVNxRFUrYnJ3NnJ1SmlocmdJQ0NveW5rcE96NmEzWjkwMDhRMW5j?=
 =?utf-8?B?bEQ0eVJXZExQeS9Ka0ZFU1JiS2tqS0U5dHdYbDFENlN1bk9rNnNwd3FHZjFJ?=
 =?utf-8?B?c2h4a1lqVGtWRksxT0kxR3FBVDV6TU43TDVDYVVTOVNrNllNenhzdExPKytn?=
 =?utf-8?B?RlgzYk5rK3N6aC9TWDVQY3M0WjdwZFErMmRaQWUvZ0ZsZGVYVzNKYnppVVY5?=
 =?utf-8?B?TCtFTUNIS3pkd1VjYm5veERIb2lCdTUrZWEwOHh1VEhOSGZVVXlOcVZ2MnA5?=
 =?utf-8?B?TmRneFVJS1lDUmZqemxXRjJ5a1JsUjE1a09QVFY3QTNXNlphT1RiQWRkT0s3?=
 =?utf-8?B?eHhUWlByckNadHVVemxhalRuR2lZdVh6UlNQYUpGTld2MFdnd0RJSUp5YmNt?=
 =?utf-8?B?aFpkZ3ZYUC94WmIxRUFUVmNTZzRWb0p2RXR0UHFjVUNFUUY4cktpcVVwanJj?=
 =?utf-8?B?TjFZaWZ5bU5zbFd4dGlPcVZFNUphaWtrOER1UGUza3NmV3JSL29IUy9kZ2RZ?=
 =?utf-8?B?R0p6MEpGRTlxbGJOdTEvUldXbDQyVWs3ZFphLzRhcnY2RHdhQnRNQmF2emJW?=
 =?utf-8?B?N0U0VzBWMmxuMzRRYnZNTHk3YUZqN1hyRlhTekRsZ0QycmZxM2ZFaTJWc0Fa?=
 =?utf-8?B?M3owaUFKVzJ3QU5GQ1dYeHpkbEEzemtXUXppR2pDTTdtMVJOY3lCZlN3bUx0?=
 =?utf-8?B?c2cxdzVEeWg1cFpmZm03T0lXR0N2bXJqNXVHdU1vUnhZSDI1Y2VDMEg4UnJX?=
 =?utf-8?B?RXlUV0hXNW1qQlVnb04xNTlSQkdPOHhFZFYvNUdYdUxyZk5xTUc2bk95eFRn?=
 =?utf-8?B?RmprMnNZZkRtZ3A5NFExbUJjWGsrd01ER1JaY2NaS0NBN2YwQkJmWVlmN0sw?=
 =?utf-8?B?TjNtaVoycUpsTUw1eHZsZEFpU1B4SEYzVEgrdTlPb01DUURYOFYwVE9YZ01J?=
 =?utf-8?B?eXB5STRTTjNGRGJGMTcydjB5eWwvY1dCOHZVZTVkNTN5SW5tZlFLRDB3R3pi?=
 =?utf-8?B?akRPMEpEYWE4UFZmRlVSem9PQnp0RkJKNW9qNDBUV1FTWk1tUWV4Unl2RGkx?=
 =?utf-8?B?QXQzY1JVNkhobHgwTnNEUzR1bUh6b2hZRXJFeEtPek5pcDRsazNkNjJXV3la?=
 =?utf-8?B?NFUxK0Jhb1BacDk1S2V0N3lWTmJNRFI0dUZ4L2Fid2FtcmRHejE5NzNYcWwz?=
 =?utf-8?B?akxyTXRZYTNjVG0yL2ZVZWFRVW03ZFVGTjZobGRKQTVOK3ZxYVozcmlsZ3Fp?=
 =?utf-8?B?WjdmMWcwYVgyOGk2N21uMXlkN3owaHVSSjFzOE4wZXRxaWlNS1B5RmJ2d21J?=
 =?utf-8?Q?AhAMV7sz5W8DKjdOnQ=3D?=
Content-ID: <67818B2E3F379846939272123631F9EE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b49ebd-81bd-4ef8-8321-08d924116f3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2021 08:52:34.7872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7UMfjLDmELRr8OvLl88MN8ld4ZEOozIh2wwZz8Mih12pV+0+/XmMZBC04AKvBn4iIOc1jfveFxZbkEZWgUSyHR9H1/LRs6voKGOPjFOukIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4588
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_015238_358173_5C8DC37D 
X-CRM114-Status: GOOD (  30.72  )
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

On 5/21/21 10:40 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> SPI NOR flashes will just ignore program commands if the OTP region is
> locked. Thus, a user might not notice that the intended write didn't end
> up in the flash. Return -EROFS to the user in this case. From what I can
> tell, chips/cfi_cmdset_0001.c also return this error code.
> 
> One could optimize spi_nor_mtd_otp_range_is_locked() to read the status
> register only once and not for every OTP region, but for that we would
> need some more invasive changes. Given that this is
> one-time-programmable memory and the normal access mode is reading, we
> just live with the small overhead.

:)

Shouldn't we change
struct spi_nor_otp_ops {                                                        
	...                                       
        int (*lock)(struct spi_nor *nor, unsigned int region);                  
        int (*is_locked)(struct spi_nor *nor, unsigned int region);             
}; 

to:
struct spi_nor_otp_ops {                                                        
	...                                       
        int (*lock)(struct spi_nor *nor, loff_t addr, size_t len);                  
        int (*is_locked)(struct spi_nor *nor, loff_t addr, size_t len);
}; 

instead?

> 
> Fixes: 069089acf88b ("mtd: spi-nor: add OTP support")
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/otp.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
> index 3898ed67ba1c..b87f96593c13 100644
> --- a/drivers/mtd/spi-nor/otp.c
> +++ b/drivers/mtd/spi-nor/otp.c
> @@ -249,6 +249,31 @@ static int spi_nor_mtd_otp_info(struct mtd_info *mtd, size_t len,
>         return ret;
>  }
> 
> +static int spi_nor_mtd_otp_range_is_locked(struct spi_nor *nor, loff_t ofs,
> +                                          size_t len)
> +{
> +       const struct spi_nor_otp_ops *ops = nor->params->otp.ops;
> +       unsigned int region;
> +       int locked;
> +
> +       if (!len)
> +               return 0;
> +
> +       /*
> +        * If any of the affected OTP regions are locked the entire range is
> +        * considered locked.
> +        */
> +       for (region = spi_nor_otp_offset_to_region(nor, ofs);
> +            region <= spi_nor_otp_offset_to_region(nor, ofs + len - 1);
> +            region++) {
> +               locked = ops->is_locked(nor, region);
> +               if (locked)
> +                       return locked;
> +       }
> +
> +       return 0;
> +}
> +
>  static int spi_nor_mtd_otp_read_write(struct mtd_info *mtd, loff_t ofs,
>                                       size_t total_len, size_t *retlen,
>                                       const u8 *buf, bool is_write)
> @@ -271,6 +296,16 @@ static int spi_nor_mtd_otp_read_write(struct mtd_info *mtd, loff_t ofs,
>         /* don't access beyond the end */
>         total_len = min_t(size_t, total_len, spi_nor_otp_size(nor) - ofs);
> 
> +       if (is_write) {
> +               ret = spi_nor_mtd_otp_range_is_locked(nor, ofs, total_len);
> +               if (ret < 0) {
> +                       goto out;
> +               } else if (ret) {
> +                       ret = -EROFS;
> +                       goto out;
> +               }
> +       }
> +
>         *retlen = 0;
>         while (total_len) {
>                 /*
> --
> 2.20.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
