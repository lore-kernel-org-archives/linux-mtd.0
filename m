Return-Path: <SRS0=cj04=IH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C64F9C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Mar 2021 07:30:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E52665199
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Mar 2021 07:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E52665199
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rC/GLUJGCk6J4uPkfb8jlrRxn6QcHTku7mk2PHVpAwY=; b=j24YE6e5lJjA2Y6IeLVveoqfl
	fyq2MruNPjlDOZwGVcFG+ulg0iqPwUw+MbdRlBHlVzU9tOPCTAuRV7wx0L8SmM/jDuFFPNwykWdJa
	SM+QcoY2u9i3njec/QhKD1Y3y/OTnPGHEoM6caCKS53vWNSVDvKV38/t4LbRTsyTBRGIlKN35HhDx
	D7L4w412MdRUTx0gio3TxeKmHDvY5N/X7UPNwp3eqz/Nd3X5ynBAdgn/RxzXrmOE05kubVkd7NP0B
	ejpNxAmiEO98oxgWlQj4j+GhuVcC2fihwgFVAQgZLWwXP3bgoKNBT1tWQG1lV7pbmmoMgdhFPi1G+
	znZj75n4A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJWny-003xHz-JH; Tue, 09 Mar 2021 07:29:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJWnd-003xH1-PX
 for linux-mtd@lists.infradead.org; Tue, 09 Mar 2021 07:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615274942; x=1646810942;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2tbkoUGTro+MmnlxiEO7H0on7FrAska+0HBxrvtwJVk=;
 b=Rsnh3ylaRiwnQhcFaWH3+0C843S+Spq2VRmh3YBZeuF5+AmI3ewkB4ZA
 2W9OERdKnF/dUd+o7CbC+12bg0LjplwLrIoTZ8WJg6Lo2eDLL0lKE6z4v
 L/eEsdWaPaRrLJrWKQQYZZE+9VN6ogDzLDAdwku5UdQmrClEztebAtITL
 oPpWzb749S7aZOtmwbZusy2Ss3+u7vQoymQJ37WyeeXY7WVgatNSsvPN7
 dlwnuPxEHIZnJCZBKhw4wg97pvVTqXOlGMct4Cwz4BuUeoAGZoon6C62B
 vFUHhZpfQ81Z/4KGrfxAOntqix7t/4oOsdbGhd7dsgb4Ys1XrXz/TYSLI w==;
IronPort-SDR: POsoBChKmwM8F4E90Sg8efJZ4JZBOuB0nC9/w2gswDhqHRMY4M837TDeub8Jtjk0umgLmLPygU
 WCdBNlRCCkHeLw8E7IxpxjxCFEwCb8KTB4KzdQWibd1ehRWhtCo3JFRi239y4KxwhEDXYdV9UQ
 J7FEQhdihVLNtR6M0VXIh/8rpWxPGY9t6urebb91fdnezbNggMDcdj40Qdhsly4YqXauqmBW7q
 kZwHCqZcWYsf8ecL019SeRybbFxju36nlzzR2rKcE15QDRuOshDm1wjAdue3Ku4WuTtNoVrkyu
 7RM=
X-IronPort-AV: E=Sophos;i="5.81,234,1610434800"; d="scan'208";a="109247937"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Mar 2021 00:28:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 9 Mar 2021 00:28:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Tue, 9 Mar 2021 00:28:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Et/ixpVcGaoVLpT17okJqNZglnjJoLrxAWrNiOg7BtVWs0OAfIIykYrQFPRjA+x1MmKGu+uMnxWEgSToiZymMrT8iwKbw9E0HRk2/nof4TrQbCA9Dd/ePJiFYMjHz2MTcpjTod/o0yyBLL5uWKhd8two/y2kirPE2yrP2hgERX6MPaW71LfdreM+JPOa8iIxIwCxvyt04marMvDVB5MWWGmlj5EM2y0vxmiy3MSAsQ7UGmKTDf0RomliEXhNIkvvS1sVJPpagR+BPMVPSrG0XAVrC++kbAYw9PmlAJzai64qMD5fHpDTVWz8jOYjVkTQ6gP0byIYdHUw3YMI3x/tFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tbkoUGTro+MmnlxiEO7H0on7FrAska+0HBxrvtwJVk=;
 b=C3iI6EgGdOV9egYhUeXb8/ZUL2rFqR9uPyoLteGwQ+H5h0QhgYykbB969EWchC+PXmOEgUECD2Qeb4E8aYH58KaFsVM2mYMd45rHSnpSfMIfP7z5HLTEtsTtkwUac3ndlEU4LmvDMIaLOm0fLltRX9wrBLcxiEH7FpM2E5KU0/6wcAHm+BnIun1UwJoj72fCh1LyRwxF82RYVjKSMZf390TOArbgtqwRaV10PbNXexS6WK4bjCuvwK8qZjRWni0bNeEiMMkeEmNWxxw9M23EFhTwbVU1tQQ5ioVnPLs3SfCzFVhkHlVozVoDujRrlVndR4nZtAP/VmMYq8jOD56VaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tbkoUGTro+MmnlxiEO7H0on7FrAska+0HBxrvtwJVk=;
 b=k+eZwLszFK/1lQ3NS6xOPl3GpPUV1Fa7adDd5qOt1DSizBxrmcD0RWyi9y9qUsyFB7p4w7BF9hyGXU7k5Fjn/KDCmxe77QuYDcyUE3L4xvrHSzlINoOyfKregjkgyXLFN3JmZ453VyuX3tVxWPTAG4Iu4pn8/rzy1guULR4NeK0=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3103.namprd11.prod.outlook.com (2603:10b6:805:d7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Tue, 9 Mar
 2021 07:28:52 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3912.027; Tue, 9 Mar 2021
 07:28:52 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <p.yadav@ti.com>, <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] mtd: spi-nor: Move Software Write Protection logic
 out of the core
Thread-Topic: [PATCH v2 4/5] mtd: spi-nor: Move Software Write Protection
 logic out of the core
Thread-Index: AQHXFLXahW+TwdBlzkur1VDkcdYBtg==
Date: Tue, 9 Mar 2021 07:28:51 +0000
Message-ID: <9889bae0-8eba-7cbc-d9bb-04e038bd28c8@microchip.com>
References: <20210306095002.22983-1-tudor.ambarus@microchip.com>
 <20210306095002.22983-5-tudor.ambarus@microchip.com>
 <963232a4-9100-ebca-927c-7f5a1e947fbe@ti.com>
In-Reply-To: <963232a4-9100-ebca-927c-7f5a1e947fbe@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8a7b76a-47af-406c-36b1-08d8e2ccfd13
x-ms-traffictypediagnostic: SN6PR11MB3103:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB3103100CCAF3EBDFF6D59969F0929@SN6PR11MB3103.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:962;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1c7Z58N+Ur769EIFxq30uhgBHfOIn69RjRL06siYYhvF3BW7RSDndWa/1A3FWo3HfTIUlp5n2PYbGUba0puTD919om8/Svmt+NNsQYUoCU3eGodBCj4GkfnNrH7Z5ZLa7Z+8K/msKqlU3Xi72py6ARTbn/sdv/XSV46qH8xLo+3ttjV73SBT/ankMc1E2O93zPF9LB05YSQE6N2tfVTWN8FRC+JLNIEHpQSsFAVWT7L+/WifubKtOBrgSqai/e0wO5vbTA9mFKSw/DstNqYHMyc6ltDMgJoZzWOaaOuw1QFupgcspujiQZm+ghqNsG3u0/8mxEWLAG8FjyKEnp71JkeqPmAn2KExdzqU/HcQcF57B/FX+nf+fvdieqvi0BeERTgTUtlOYE/3yZUdmhDEzqiloveKSC08/cz0B+sOww667anOghq4m5KXDZlxojVBf5fsAf2I7LPJB7WKNCEpbVF2sRD64soaw6DDrZEOMOIlVS9whu4TZLf77whwHnG0EP93g1teaIa5yfCgKk7Xd3+xYiiGUraI/uEPveqOPWg08dszOE4yocSLWRljdOLLU48K1PHYKYvi1+KhprlbRvXitmg5e6enr/DZpYf2/WY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(136003)(376002)(346002)(396003)(36756003)(53546011)(71200400001)(2906002)(4326008)(66556008)(31696002)(76116006)(64756008)(86362001)(2616005)(31686004)(5660300002)(8676002)(316002)(83380400001)(6506007)(478600001)(54906003)(91956017)(8936002)(66476007)(66446008)(6486002)(66946007)(186003)(6512007)(110136005)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?WkxPMnJsQm5RZGMxNENZTTNzMjF6L3g4R1dMQlV2UkVNZ2hoZ0lkbUVhVVV1?=
 =?utf-8?B?N0Q4aVpIQXo5blkyUEM3NExWbzJwUXVDK0YwQUY1NGRGR2E2V2pQQ0x6MHgz?=
 =?utf-8?B?Z1gyWXFySy9BRmJLOENzcE84MXdzaUQ1c3M1Z3B6M0NWc2V3V0ZuaTdBYTd3?=
 =?utf-8?B?ZEU1MlBSS25XWjNsQmFHcG9xbHFtZVZ1eDdWYkV5Ry9sbWlVeWd3WTNPdjgx?=
 =?utf-8?B?eVVBbjNJZ2pCNEViSStmZzJPVGFyL3hpa1UrYXRSMll3V25xYU1wdm9QUHJ0?=
 =?utf-8?B?R3diTnJ4QWRjaUhwNEdJb09BS0c3UGN0K0dBU3BDeVhUU2N4VUdNeGFBQWFi?=
 =?utf-8?B?azFSZlRUT0N4VENqNWhEbUdKcFMyOEVMT1RvMmxyb2dNemVqOVZOK0paRFB4?=
 =?utf-8?B?OGNlY3J4L3MzUUFKTVJHMzhka0hlRnRvMHJlM1pIMDdzOVhWOUZOejFlSncx?=
 =?utf-8?B?NFdYYXpLWHZtZU1kM1AvRnY1MW11L1M0bTNaaHd2Nmk3RWtZOHNqRU5SanNI?=
 =?utf-8?B?eHE2UkZGSXlPUi9acWJmeWlnMmFkUjNqNE1EQmpBUW44K01Ia205S1RsWGdx?=
 =?utf-8?B?aGlLb2swRENKNWVjb1g4czV2SjlaQVhpNXpCN1NaKzJiSDJ3bUJHaFVPbExr?=
 =?utf-8?B?TkRIZGJNcXdudDM5anR2Ykg3M2ZQQUpTeUV6d0xvSjNHdGkzY3IrNXhhaUZF?=
 =?utf-8?B?d2dBZ3U2eDIwdUY4Um5kckFHdEs5NE45VEVkR2xKN2l2YzYyb1RYL041UDRk?=
 =?utf-8?B?UGRRMjhtYzhGa3M0bncrazdicmJ4VDFvbmgybUR0THdzcUR3MHdaUzhIeitV?=
 =?utf-8?B?T0ptYXVSNy9ZUUJmQkE2cnJzdXdnR3BrZkM3SE1PN2FDMzk0Nzg5aWxJdS9W?=
 =?utf-8?B?dTFlRFJBUnhkY2pmaUw4R242a0JhMENjaktxamdzUGN4cmdDYzZnWjdGM1Iz?=
 =?utf-8?B?RWpRbmlPcjc5NzNsSnRmTFU0RG95U2ZvTXRPUHBaMHJnN1d1U0VQNHFXcUxy?=
 =?utf-8?B?RXhuMTk5M3RaMXdQRlV3a0ZEc1MwOFZ4eTVTajlhZy9penpiZGVZaVJQeitl?=
 =?utf-8?B?ZkRFenUzbFNSSDBtZE5vdE9ZcWRHanRWZEtOSk1IZ3pRaXVEcTZ1cUw3SDY5?=
 =?utf-8?B?QTNzVmFhZURrUVFrVUc0aFVzVDhxajFOYzQwOE1sZkFXUjVLcE9rSU53RlZ6?=
 =?utf-8?B?Q2ZRQU83MDdNNU5RTW9ISjBzM1E2NitQY2ZPZkpBeHZUdE4yRDlTS2pjRGJZ?=
 =?utf-8?B?My9UNlJLblZkSjVMc3lZUnJwbTJ3K1h4Ykt1RnZ5MlFwbWtuc09rbHZhNkFK?=
 =?utf-8?B?Z0poZ1dXakxkUEtFS3FWYlU2QjNoTEtyZ013a3ZtUkR5SWcrTk9TbTR4YVk0?=
 =?utf-8?B?N0p4MzFsUlRUd1lvYXQ3UXpKWjlzRjNmTGRrZ1dBOGkxVWREZlJNYTQwd3A0?=
 =?utf-8?B?UnB3eklCMzBybWV3NlJmSGR4bnFaTDRxSVBjNDFKZG9zWEZIcVVsaGV5QkxD?=
 =?utf-8?B?S2FlTjEyK0hZTkZLZUV3cFh4V3dsdnNJYXhhQzBmRVRFR0V5Vk5ndCsrVTlI?=
 =?utf-8?B?Qk10Q0daT3N0eGdtYjB0NnVJemJzT3NRSjEyN1VlUlhsWkM2ZmRZNWlkRVN4?=
 =?utf-8?B?Qk8vUFI4WTRsT1ZvdDkya0wrc24xYzloNW4rK1pwb3c2MHdLVjh5elBpenla?=
 =?utf-8?B?elh6SmJtcWRyNXpBLzdDL2RHVytKY2Jpc1BPcE9vdnVTR2srZllxMjZpZnlK?=
 =?utf-8?Q?5LZObjRxRpDK3H2T4g=3D?=
Content-ID: <ABE430FA12837040913059871DF54ECE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a7b76a-47af-406c-36b1-08d8e2ccfd13
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2021 07:28:51.8552 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: beZxTPtuvlYiGjgdbwA6unRo5z/0ws8rx3uKBsJzqd9dWFDKqvQY3/ms7pzna7Wrk4/Hz9W+B7GAJHApdVDvRNJ6HOg1xUN/9OXZvdKIZZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_072904_805874_3B55A269 
X-CRM114-Status: GOOD (  15.66  )
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

On 3/8/21 7:28 PM, Vignesh Raghavendra wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 3/6/21 3:20 PM, Tudor Ambarus wrote:
>> It makes the core file a bit smaller and provides better separation
>> between the Software Write Protection features and the core logic.
>> All the next generic software write protection features (e.g. Individual
>> Block Protection) will reside in swp.c.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/Makefile |   2 +-
>>  drivers/mtd/spi-nor/core.c   | 407 +---------------------------------
>>  drivers/mtd/spi-nor/core.h   |   4 +
>>  drivers/mtd/spi-nor/swp.c    | 419 +++++++++++++++++++++++++++++++++++
> 
> Hmmm, name swp.c does not seem intuitive to me. How about expanding it a
> bit:
> 
> soft-wr-protect.c or software-write-protect.c ?
> 

I thought about the SWP configs that we have.

How about keeping swp.c and rename configs to:
s/MTD_SPI_NOR_SWP_DISABLE/MTD_SPI_NOR_DISABLE_BOOT_SWP
s/MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE/MTD_SPI_DISABLE_BOOT_SWP_ON_VOLATILE
s/MTD_SPI_NOR_SWP_KEEP/MTD_SPI_NOR_KEEP_BOOT_SWP

The renamed configs should better indicate that the software write protection
is disabled just at boot time, while the locking support is still enabled.
Otherwise one may think that with a MTD_SPI_NOR_SWP_DISABLE, all the
software write protection features are stripped/not available.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
