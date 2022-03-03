Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F87C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Mar 2022 14:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v1R0R1pCKe0kIpT17f+KZomFMJMJ9SO0vK6O5YT49VI=; b=V1VbYgxHKB/1Xk
	DRREnIHMCWgQ1fNRPGJjdFtVx0aWR/df+z/23+7INtxN58OtMMmie1zQ5pi7VbGA7a0MGzscFmanh
	UuRVF1pchDAJfxHT3xOAUvx4Cc84Mqq4T6RCgKC12rXIhr1lcp7HPqEUjLFBByj9VWynNQ97dUNbG
	QElTPEv4TSaZp0hxGmF3NZ2IAV/jKef/a2c/vyKuJYk4c0p1IQXjF7MP/5x/ywdSLuSB95f5dtEKR
	mXGQs7gP8YA2pPdIR3v3H7TwWjkYW+wMzFQZ3olRA+p3tBEa76CXv99tSWePktBQ+URX0PghEEzEE
	LL7xJLq1ytflkEUnF6yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPmeD-006fS0-Bo; Thu, 03 Mar 2022 14:41:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPme7-006fQq-3P; Thu, 03 Mar 2022 14:41:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646318494; x=1677854494;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Up+qIMeA1sG++1W3zggHMJhiBZFpYZltV7Ba4c71w60=;
 b=s6raBAMCwBlmAb6hm0xBeuJLAJ6FwFpC6YJDXiwIvSyDpJLVhvauRpBl
 fEc5M4DSKkWWAymr4OwfHXFL+9FieXVU5afSks5tLvo1gxL2+W6soPTJ9
 AbAGwb/JlJG9jHCZKvM2mM9Bmt3otbzaOBU4d18waZygh+RsS6bEx/QdK
 qQJ52UNah+igO05xHhH1EIdbTA8AYwXPVRC8OwISQ31I2vA13AjkZG3uD
 HcPh/goAZAUPcRX4DC5r8aRDnJGJPYWoIjXfZjtTEAX+N3UsnCv7OqRcw
 Dkt4B2gCZCbX8Km4C5UwOk8sdkew0JFCJSVhaD1eJ1G53fki93AnXd3rT w==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643698800"; d="scan'208";a="150732278"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Mar 2022 07:41:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 3 Mar 2022 07:41:33 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 3 Mar 2022 07:41:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DW0KEK4q/T4q82AoltFikp7C2ez3rpQuk6VAc4vNKVW2QvhKIodVN1tUSohKBJCJw2tzYQ91wPTDjvt04VRNtsrvKwIvikgxyMYvyHnPhaXGS6cs5pvcd+RjuV5YdfTK/Q7fr64W9egAkLzECiP+DnaaVhi2jMM62Zr2GEnFtPDrY2fKqU+VRDdTCGjWfyuYkk1P57jBgq+PojTG6mjZzN5BZ2zT/bcQ1LOhid0GZT1jsJchOafiU30jinwfHUGW4ru0XDUhUf8Zo01nQGF8ArPKHcgWpsCSNvWbUNZSlpYa4EhWSiuYRN/SynqGErIXWImDvV8C1T5My6cIXWM+bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Up+qIMeA1sG++1W3zggHMJhiBZFpYZltV7Ba4c71w60=;
 b=PJNwzSij4U94kdso+lFwBipbPiEKIVYuue/Sao2+dOFwAyE1G379/AoCxg4k8gIq116ZMoxWfxxRKK6HxVS3Xuc2jG8xLJ+z4D1dUjUy4n5NqdRJf0kIhjddHlIbN3KptTlqe0gMbYINjgs9sGjVtwXTLZfJzHI/ynDw6KemcGuQLVdnlngbvYViLCeYB6eYZvwFeWybIVvIpRhSmpVEpYBu1FYdX+UiUTL7ojYWtWIj5kCcKBS4T0Woi5jnJDOOa4jyyteisaHMMk08cRbKLjYN7f4v6LXAyouoCCgxzeOG/hZAQxWzkcpHYduR/hoTb4PbiezXAvsqrQHoIXJSYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Up+qIMeA1sG++1W3zggHMJhiBZFpYZltV7Ba4c71w60=;
 b=bMe6K1xqkZvcBGYdISNfSoNTIsGTSZATkoaSYZ3PNWKmLL5CWaGor93VLwZUMLeWX0KXbmZIedC69P6gLoLDSaQs2LgsPFl4H3RuAIkkSTTX7kwSMHrbGTzYVqscEEcLIi9AuSmj8Tci0UfTcuKD8WexNYU3U2ILMtko4ecUqwU=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by DM8PR11MB5750.namprd11.prod.outlook.com (2603:10b6:8:11::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 14:41:28 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%6]) with mapi id 15.20.5038.015; Thu, 3 Mar 2022
 14:41:28 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v4 2/6] mtd: spi-nor: core: Handle ID collisions between
 SFDP & non-SFDP flashes
Thread-Topic: [PATCH v4 2/6] mtd: spi-nor: core: Handle ID collisions between
 SFDP & non-SFDP flashes
Thread-Index: AQHYLwzDoxYnBZmIwk+F+eeBkmeouA==
Date: Thu, 3 Mar 2022 14:41:28 +0000
Message-ID: <72679fc7-42e4-d7b8-1fb9-463f225217fc@microchip.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-3-tudor.ambarus@microchip.com>
 <328762851786f1158505f9159ba3e5bc@walle.cc>
In-Reply-To: <328762851786f1158505f9159ba3e5bc@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3a8eecb-2345-4906-30c5-08d9fd23e6cf
x-ms-traffictypediagnostic: DM8PR11MB5750:EE_
x-microsoft-antispam-prvs: <DM8PR11MB5750D7B6A1A14215C1CF6006F0049@DM8PR11MB5750.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WJozh52Hw3+68CMbY6cNdWJqWNmdRqrp5Kzz4RYdERZJW7aJ+/LsX6UAu4vvt+zCbi0MGmvERnGR5rSVh2twUAdU3r/pFbvGdOwNAvXsKkH6Wsv88DuufnTl0E6u7waUZz5AM8PcLzoSSGyzBwaU+CTj5DS+tHrmH2dFrvoFcJ6Iqs08QFQyFgD7Xoq0EzhUtWPXtlQ44r+d8LMEpdyAlLHhhtmnjF1cSsmX5uXi2jEBeT7sgJHmJz7Wt7v+H/K401AvoFmUs+9kwDlEHDOUlqgOEEgJN8vLPixKQJjJTvwlkeSKi6MI71W2n4R7QUhSosSBl39yUTgdRuMhrQxNzlaiCE651McJHeWPY1tP4mjGkii8AJvK4tVz3wLXwW8sWP0KhRjDBxwP+WxaHXoCqFj4B4n1Utq5sJh56eRAO1HGl7HzCB7puxnBfnU2TQ3NMCupgzdZIFm2d2ONFZLQopLRdTYSHQeLHhvHw+ptO84aQ3A2N69/+uYBtePwzm3ID/h90O9ls3j2CxIXsaiciVnp/cX0SnEt/z5wTajqRonrw4An4DgggdyJHxfdA22xkaj0r99Kd5RJDdeHD+hhj8NuLh9qQOC+VNxYmjK/LHtpedELEtG38KSDHfMydwE0ZDB52A9NEFWkVJRVACrHScF3ToVyRDdeFlI07pAdNt1Ooa/UueCFU26FVzi2+dZL/eahtrtF/0cCU3KRR0ck2QDIeBdk737BEr9bx98Xu3gr1uHXgVHl0ol17cCcRBdGLL5cKA1tSBua+jOliaaQtw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(122000001)(316002)(31686004)(5660300002)(66446008)(86362001)(38070700005)(6916009)(54906003)(76116006)(6486002)(38100700002)(71200400001)(7416002)(91956017)(107886003)(508600001)(66946007)(4326008)(36756003)(64756008)(66476007)(66556008)(8676002)(53546011)(8936002)(6506007)(31696002)(83380400001)(6512007)(186003)(2906002)(26005)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXpuZ3hpVUgvNEQvd0NhMS9qd0M1b05ablJUS3V0a21GcSsyMzgyNjBjZHdq?=
 =?utf-8?B?QTdQNitqa3RSZU9VZFZWLzFTYk40WUJNL0tiSUVqZXZMMk4yRTE5bnhhT1I1?=
 =?utf-8?B?dlNwVjR1dXdtNzZ1WS9SM0RUWkVNMWNybnlsaEF2Ny9TN0U5Z0FVQWZiWnF2?=
 =?utf-8?B?Z0lvQjdEbnkvblgzUk9tTUlDdDdkWkQ4azZjLzh1SlJoNWFzaEhpUFRONktM?=
 =?utf-8?B?RDhGdVZwaXp0dFM3WFdOVVFNYXdHSW0zdThWcEppZ2FpSGtYd01ZTTBsbVNJ?=
 =?utf-8?B?NHdSdFcwQnFXV1Y1RWxNRUhQK0dLSkdzYVc5bU0vNG9yQVFhemNxWWRrSUpm?=
 =?utf-8?B?RkVzc2R6TnZ1cUtaL1JTSE50TFFCdFNHOE5uVlNiWkFsajlGS0J1R1RkNWph?=
 =?utf-8?B?dnlWZU1aUEtDcGJnOTd2bVdIV2g1SlcvOUw4QTk3QXRTTlFXeER1eFpmWWIy?=
 =?utf-8?B?UkcyV0UxT2JxZzNZSWptRy9SeFdHTFhyTEtYSHFmZkRLY0FReTVaQWJBMk9S?=
 =?utf-8?B?R01DRTZtVU1mRUhUNkUyRVk3SG9tS013bldEK0o1VDNJQ0pEM29pTzVVblVE?=
 =?utf-8?B?OUk0bjBwb0dhTC9NWnRqcWtxVGhuU0gvblhDV3ltVEc4R0pzV0M4Qy9EVXQr?=
 =?utf-8?B?LzMzQUJFUFZ1aDNUQWNmbFJ1bmpQZkF3QTZOVC9GTGFkVXpxNzhPMm9tUjM2?=
 =?utf-8?B?dzFPbk1CaGVycG05MWNvYVVrR1ZVdEVrRkhVZXJXWU9pSXlSL01aZ25KR2NQ?=
 =?utf-8?B?ZjV1OHFyNi9DcW5XeStIdVpzQ3ZWeGRmb0oraE9iY0NETnVlN09QbjNsM3Jr?=
 =?utf-8?B?Q1o4eWttRldsdnR5cFJ4TnhCZ0ZKb0J1OFdZdWlXK1hkdTg1ZUsyWjNZYmwx?=
 =?utf-8?B?Z3pLcEl0Y0xCOENZcVpLUmNyVDlSd1hqOHRCNy9CZ3ROYVNxSEZ0dlF1cm0z?=
 =?utf-8?B?TWZHajM5N1lHRENrVGJTU3ZLZ0dIcDRmdjFLL0EwZU1JU2tzZ2xIeWZJQm9t?=
 =?utf-8?B?YnpKKzNzcmpDU1F3d0NyemhZK21icHQ1UFArbUsvNWlMSVBhS3lJMDRpRllr?=
 =?utf-8?B?OXdEQ3B0b2d5NE96d3hCWkx3alVCMTBvelNLcmI0OE1WdE5SOVlkVHhsUFdZ?=
 =?utf-8?B?VnFVU2FmK0paUFl6NTRwVnlJcWtaV3lBV2s3cG9xMTNFdG1EVFgzbDl4QXBl?=
 =?utf-8?B?REdzYmgxRFBmR3lQeVc4eHVBeVNFWUt4VzB0RVE0VWF6TisvTkRwa1phUk9q?=
 =?utf-8?B?QWRhQW5TZmRRQk1MQXdZSFhoTWFDR3BZK01oTHZWdU9UajdiLzRXT254OXky?=
 =?utf-8?B?TU5lamJocFpuNDhyR0E1WDJ2S0NyeUFma1cvRWNuZzVESGxUZGNlT2ZEd3lp?=
 =?utf-8?B?YWxkb1hEOEtaS2JTdmZtaVY1OFlyaExwRFlsNGxjUHdjc2cxMHpjd2ovTlFj?=
 =?utf-8?B?cU1wT2NOYzlVczVLM2N0Q0JIU1BoOHc2Rit1WGk3dUFicXFyS2xneVhjS0ZC?=
 =?utf-8?B?TUJ5cXJDYmhzZ3MvaG95VERvbThqK2dhanhrR0xyenpiTFRjREx1RnNjaGE0?=
 =?utf-8?B?Rm8vSzI1dzhpQlJ6WEM0cGxiSVVuVTZSSzEvTjRtRmVhcUxuM0JaMENXM1Az?=
 =?utf-8?B?NVhady9RbEhLc3VWUGxHcGRUckIwK2xpU2VIbUhUNVV4N0hyaDlRUDhYai9v?=
 =?utf-8?B?QW5mdWtDaFphenFTZ3NLMHh6UGQwNjVHK1lDSS9ZK05tUzA5WHJubzltVW5L?=
 =?utf-8?B?SzlwZlpLV2dIWHc3bEFKQlJsK29jOTRyNDFOM3FsQzB2RkVMZTBabFpjZGZu?=
 =?utf-8?B?ZHNvK0NndUxRaGxjVXR4Y0xMT2tUeXErS1cwQjNVR3JnaTlEakE4c0hKK3Bt?=
 =?utf-8?B?Nkg1YjdRd2hES042SUwzVVdESW5PSDdVMXNHZ05BZDk2WEUzZ00xQkR6ZEVQ?=
 =?utf-8?B?UzBTNUJWUElsdHlkWStxQXhjcnQ0cTFVdlRxZWxGQnZ5d0pKOFltaFZHbEcr?=
 =?utf-8?B?VkpndjNVaTgvWGVmVXFXYllaaGJNZDE0SzlSdGNiVVZuVHR0cDFzNUs0REs3?=
 =?utf-8?B?Wmd5RmR4OXJMeGw4Y3VPSkt3b0hjclJkbkgrQjBHOGxmYUhPclFhOUVvc1NJ?=
 =?utf-8?B?QUlsSXlrQjhpOGtxc0VMTDBjVmk4ZDBESzA1QnlFYWF2akFNWFdmUWlNeTVP?=
 =?utf-8?B?czhwS0V0blM0dXo2ZGQzVzZDQk0zanArTGZkRjhWc0tzVStEUzJrVVdFbWQy?=
 =?utf-8?B?UVp4cEx0VzVqeWowSjBWOSswSzJRPT0=?=
Content-ID: <1F2512854899B34484738AE8111C60BF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a8eecb-2345-4906-30c5-08d9fd23e6cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 14:41:28.6719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zf86v3ze/M4LjZnejGuLPwre5MkUBvnH0ivUGX7lW2DrGrjhzcNMPZiltOp+KSyKABjnwSsW61vLSEucclYJ8WOqU3zt3+AEovdi1saMJxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5750
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_064135_310885_6770C2C9 
X-CRM114-Status: GOOD (  23.66  )
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
Cc: sr@denx.de, vigneshr@ti.com, jaimeliao@mxic.com.tw, richard@nod.at,
 esben@geanix.com, linux@rasmusvillemoes.dk, knaerzche@gmail.com,
 Nicolas.Ferre@microchip.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, macromorgan@hotmail.com,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, zhengxunli@mxic.com.tw,
 p.yadav@ti.com, mail@david-bauer.net, code@reto-schneider.ch
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMy8xLzIyIDIzOjUyLCBNaWNoYWVsIFdhbGxlIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDog
RG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRo
ZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEFtIDIwMjItMDItMjggMTQ6NDUsIHNjaHJpZWIgVHVk
b3IgQW1iYXJ1czoNCj4+IEEgdHlwaWNhbCBkaWZmZXJlbnRpYXRvciBiZXR3ZWVuIGZsYXNoZXMg
d2hvc2UgSUQgY29sbGlkZSBpcyB3aGV0aGVyDQo+PiB0aGV5DQo+PiBzdXBwb3J0IFNGRFAgb3Ig
bm90LiBGb3Igc3VjaCBhIGNvbGxpc2lvbiB0aGVyZSB3aWxsIGJlIGEgc2luZ2xlDQo+PiBmbGFz
aF9pbmZvIGVudHJ5IHdoZXJlIHRoZSBkZXZlbG9wZXIgc2hvdWxkIHNwZWNpZnk6DQo+PiAxLyBQ
QVJTRV9TRkRQIC0gc28gdGhhdCB0aGUgZmxhc2ggdGhhdCBzdXBwb3J0cyBTRkRQIHRvIGluaXRp
YWxpemUgaXRzDQo+PiDCoMKgIHBhcmFtZXRlcnMgYnkgcGFyc2luZyB0aGUgU0ZEUCB0YWJsZXMN
Cj4+IDIvIGFueSBvZiB0aGUgbm9fc2ZkcF9mbGFncyBsZXNzIFNQSV9OT1JfU0tJUF9TRkRQLCB0
byBpbml0aWFsaXplIHRoZQ0KPj4gwqDCoCBmbGFzaCBwYXJhbWV0ZXJzIHZpYSB0aGUgc3RhdGlj
IG5vX3NmZHBfZmxhZ3MgZm9yIHRoZSBmbGFzaCB0aGF0DQo+PiDCoMKgIGRvZXNuJ3Qgc3VwcG9y
dCBTRkRQLg0KPj4gVXNlIHRoZSBsb2dpYyB0aGUgYWJvdmUgdG8gaGFuZGxlIElEIGNvbGxpc2lv
bnMgYmV0d2VlbiBTRkRQICYgbm9uLVNGRFANCj4+IGZsYXNoZXMuDQo+Pg0KPj4gU2lnbmVkLW9m
Zi1ieTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BtaWNyb2NoaXAuY29tPg0KPj4gLS0t
DQo+PiDCoGRyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jIHwgMTMgKysrKysrKysrKystLQ0KPj4g
wqAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+DQo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJzL210ZC9z
cGktbm9yL2NvcmUuYw0KPj4gaW5kZXggZmJmMzI3OGJhMjlhLi5hZWYwMDE1MWMxMTYgMTAwNjQ0
DQo+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYw0KPj4gKysrIGIvZHJpdmVycy9t
dGQvc3BpLW5vci9jb3JlLmMNCj4+IEBAIC0yNjM5LDggKzI2MzksMTcgQEAgc3RhdGljIGludCBz
cGlfbm9yX2luaXRfcGFyYW1zKHN0cnVjdCBzcGlfbm9yDQo+PiAqbm9yKQ0KPj4gwqDCoMKgwqDC
oCBpZiAobm9yLT5pbmZvLT5wYXJzZV9zZmRwKSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXQgPSBzcGlfbm9yX3BhcnNlX3NmZHAobm9yKTsNCj4gDQo+IENhbiB3ZSByZXR1cm4g
LUVOT0VOVCBoZXJlIGlmIHNmZHAgaXNuJ3Qgc3VwcG9ydGVkLCBzbyB3ZQ0KPiBjYW4gZGlmZmVy
ZW50aWF0ZSBiZXR3ZWVuICJubyBzZmRwIHByZXNlbnQiIGFuZCBvdGhlciBlcnJvcnM/DQoNCkkn
bGwgdGFrZSBhIGxvb2suDQoNCj4gDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
cmV0KSB7DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZf
ZXJyKG5vci0+ZGV2LCAiQkZQVCBwYXJzaW5nIGZhaWxlZC4gUGxlYXNlIGNvbnNpZGVyIHVzaW5n
DQo+PiBTUElfTk9SX1NLSVBfU0ZEUCB3aGVuIGRlY2xhcmluZyB0aGUgZmxhc2hcbiIpOw0KPj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsNCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qDQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogSGFuZGxlIElEIGNvbGxpc2lv
bnMgYmV0d2VlbiBmbGFzaGVzIHRoYXQgc3VwcG9ydA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIFNGRFAgYW5kIGZsYXNoZXMgdGhhdCBkb24ndC4gSW5p
dGlhbGl6ZSBwYXJhbWV0ZXJzDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICogZm9yIHRoZSBmbGFzaCB0aGF0IGRvZXNuJ3Qgc3VwcG9ydCBTRkRQLg0KPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLw0KPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKG5vci0+aW5mby0+bm9fc2Zk
cF9mbGFncyAmIH5TUElfTk9SX1NLSVBfU0ZEUCkgew0KPiANCj4gU2hvdWxkbid0IHRoaXMgYmUN
Cj4gaWYgKCEobm9yLT5pbmZvLT5ub19zZmRwX2ZsYWdzICYgU1BJX05PUl9TS0lQX1NGRFApKQ0K
DQpObywgYmVjYXVzZSB0aGlzIHdpbGwgYmUgdHJ1ZSB3aGVuIG5vX3NmZHBfZmxhZ3MgaXMgemVy
bywgYW5kIHRoZSBtZXRob2QNCmZyb20gYmVsb3cgd2lsbCBiZSBjYWxsZWQuIEkgd291bGQgbGlr
ZSB0byBjYWxsIGl0IHdoZW4gYW55IG9mIHRoZQ0Kbm9fc2ZkcF9mbGFncyBhcmUgZGVmaW5lZCwg
bGVzcyB0aGUgU1BJX05PUl9TS0lQX1NGRFAgZmxhZy4gU28gd2hlbiBvbmUNCmRlY2xhcmVzIGEg
Zmxhc2ggbGlrZToNCisgICAgICB7ICJteDI1bDMyMDVkIiwgIElORk8oMHhjMjIwMTYsIDAsIDY0
ICogMTAyNCwgIDY0KQ0KKyAgICAgICAgICAgICAvKiBJRCBjb2xsaXNpb24gd2l0aCBteDI1bDMy
MzNmLiAqLw0KKyAgICAgICAgICAgICBQQVJTRV9TRkRQDQorICAgICAgICAgICAgIE5PX1NGRFBf
RkxBR1MoU0VDVF80SykgDQoNCkZpcnN0IHdlIHdpbGwgdHJ5IHRvIHJldHJpZXZlIHRoZSBmbGFz
aCBwYXJhbXMgZnJvbSBTRkRQLiBJZiBTRkRQIGZhaWxzLA0KdGhlbiB3ZSdsbCBpbml0IHRoZSBm
bGFzaCBiYXNlZCBvbiB0aGUgbm9fc2ZkcF9mbGFncy4gSWYgU0ZEUCBzdWNjZWVkcw0KdGhlIG5v
X3NmZHBfZmxhZ3MgaXMgaWdub3JlZC4NCg0KQ2hlZXJzLA0KdGENCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
