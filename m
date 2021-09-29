Return-Path: <SRS0=NzJj=OT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED85C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Sep 2021 05:17:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39DF4613A9
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Sep 2021 05:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39DF4613A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ojmc88o/Zzg8clH+3nVi99XPg8XZH2uClweUfNIr4Zw=; b=szo4UjgNFWmzEU
	PJx06mvy7DLHIvowdqMIntsCEI2fytDM30GCrpId+o8ap9GSJzyPQs6yvCcZJbXtm213+NfFNoO+X
	YPrpLj4AKT4iJSJKodxuc2P91LpYc+63g6F/vVNJwRyHulcUizU6oTv9TG8TfzeMszxJUqcTMKTjX
	VBRrdcY4GYprQjN87R0mx8n6ZevZXzQ/vuQmz1f2r8EAoZpcmQpvbRRN7Q7FYR0+kmmB/TpXM9hgo
	uI8IJzz6Enm9eHV94ClUAT5Nf7vRb1FxAszT2d82sdplENafshWFQivdX6h5luVqIkpXTHKZs7RFA
	ttpBweyhHGzdcU43y+RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVRxl-00A5D0-2b; Wed, 29 Sep 2021 05:17:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVRxh-00A5CK-QC
 for linux-mtd@lists.infradead.org; Wed, 29 Sep 2021 05:16:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1632892618; x=1664428618;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=EciSwQ43KV0lJbgFx2YhMZVYQv8il55zzYzbdVilw3U=;
 b=LmJUJvN3TE31QyogwxsaZycMeQ1Wy9jupNfWzZhjCzArZ8lHkTsaZwjv
 eN7T/4sFbltL/rr0Ennthic4vG4T02HVH7NJ5LnSe/IGxwYFfgcy/xbjI
 RoRi89YUhfZ1YHzIyENPx0Eylp3fSuJnj3JkkQwahUiP4vDwolY9I/Jdx
 IBzuJyKVxCP2daHcEjy1fOrTj9aVHteBin9FT2WWYBrnOJsyoiA9vt1xR
 ffm16lgwQjN5Sv6RlDszdHuofz77fcw7BEL1keXsndv4MqHg6x6lKuvRC
 XTvvWVEQcOUV8Re8ApaXQcWMnv3GWbGpNEz3skfsss9qfmRZ+tGPA8x7q g==;
IronPort-SDR: zQ+of54i3TtczunI7ZiDshwiJTN/W0YayyAL6MqFfNJKnp90zb/BoyG3U5KEpA0I0bfVGoYPag
 RoZu3XVMfxocgdMHf+eGp23Qh5mHqjk2t9V2yr1RObadXGlyU9qlehwHu5tZnaCQBLqWuqf3/4
 +m7niOa+Jx2r5lnHuR92sECaEhPQEm9QnsB8fTBdEDZsiWaEtVt5bsUnQgQnSwEZ1X1H4XvuyT
 p5SqayUUzuxRistFKgPeg4Vcrub0yiKQ+7SrqG3xNFzqLisNHCc81MlyLAROzZiHJAINu/f1Cg
 gsadNjSXxyDwHHLrQdLnCyjN
X-IronPort-AV: E=Sophos;i="5.85,331,1624345200"; d="scan'208";a="137770422"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Sep 2021 22:16:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 28 Sep 2021 22:16:53 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Tue, 28 Sep 2021 22:16:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7yzZakrspvxlYspVK5kqiy1VNGXtAFBJwilYlARflUcuZVJycpkzXxYkMH2G1+RB+5338qDrkvS0nK5MqHiTXkvgGlAhzU4WBfypFe+aycXrGA23fo+SxN5lgoYLkhhl3GMOWFWw0yUtRSifSc8TIY9aTwkL0xcaimzqkiW36smnHojzz5SbaERlONN8GKF9PiEShgF07hDmEhGW/s7qubvSLwGjqkN4vk2edwQkw/kPDEMhN5i0iZAZ9dBdlNYCjhijn8GZPd2zsiiozZecS6CC6Jf6Xbt7XI0SmmXOxdzAcCMLRyJUs6uMMtWZkZ+Y2YdLWWpxDdQmZ4fHbxTfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=EciSwQ43KV0lJbgFx2YhMZVYQv8il55zzYzbdVilw3U=;
 b=fPgLBA78ezA5t0yzU7lTcEm8EbRzixwv8J46FIAu7aIc4mIb4cqhHDT6h3YdTJ7HNg5AuGLqdNRUbfqECwqdazfyy4QB2iDdlou5j1NMN9M8dqyPm6VrUd7yMMO3k9njs+SjNS0QNmXPJ8AXYdYapExdO32uHzcnUPB52vJxmTRewUH4rMwB0Y/g3EWfT406hM3Rgxne5B619yTN0JbmaAe9h4RdT0DdBMR7UiDZthcZxVnxlOHWDmL8rNXEwLARsvYdFhT2etgWd/NmcyT3r1ep6fA8ykrD7EAUq9jpYIkN7Tjj2X+tjo5Ob0WChkuTkCCySAmW9cpr45cENvpJyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EciSwQ43KV0lJbgFx2YhMZVYQv8il55zzYzbdVilw3U=;
 b=oGFsZRUEaFYqDWRVR2OP+4ebwywqJjyl9LXcT4i0QEcs/njRKsuK1PzV3I4ZR2e9Lr8zIGh50XgWCE56V7fcQRAfmBrOx+wd8mPc+231CpVbOEo10+g7lC3VN14rPsAzpAL6BwQV5dkxGDlQF0jaClZujaUQEs5DZknOPl1jFEs=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3246.namprd11.prod.outlook.com (2603:10b6:805:c6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 29 Sep
 2021 05:16:52 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213%9]) with mapi id 15.20.4544.022; Wed, 29 Sep 2021
 05:16:52 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <daniel@0x0f.com>
CC: <linux-mtd@lists.infradead.org>, <michael@walle.cc>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Add support for ZB25VQ128
Thread-Topic: [PATCH] mtd: spi-nor: Add support for ZB25VQ128
Thread-Index: AQHXtPE2DU8dZXiESk6XFpKGRejTfg==
Date: Wed, 29 Sep 2021 05:16:52 +0000
Message-ID: <4a57745e-dd0e-7890-0767-e6eaabeecd63@microchip.com>
References: <20210918072256.3505379-1-daniel@0x0f.com>
 <20210920112625.fnqayim5mg5iggag@ti.com>
 <CAFr9PX=xKoa9fCbYf6Mpn=oudnY7A=6meKBSmzNHYLFad364tw@mail.gmail.com>
 <20210928163403.iufy6rgn7imiebpz@ti.com>
In-Reply-To: <20210928163403.iufy6rgn7imiebpz@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f703c1aa-987e-4845-a89c-08d9830858b2
x-ms-traffictypediagnostic: SN6PR11MB3246:
x-microsoft-antispam-prvs: <SN6PR11MB324699F6C88DA1AEA085F30DF0A99@SN6PR11MB3246.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nDBA+t6beBXBfeTEfkcnH/mgSHonoSK5d1m7AFX5ov1LcZFCSDEyLMD4Gj0c6a14Ut9AtrYXTcSHCBBmJeJ1l0IxHA3onF4bRpZNAMJW6Wfq9jcFwIOp+gNuaK4R75LwJ8LFZHw2QYIFklt9h8avj5IhANjkJPe6sIcCv2zSJiK2CBzDuVDCDr+vRrsSxFkCxHXuY6Ek4kDQFW9rn6qFs0aoD4pu6IE5NjRGQhSPjmzrpmeJKJpADg94bdNYv3XmoS6e8f1QyC0x/dYCjAMg2MXmos2D+g7woY0CxmlkG+AxLExaTZfo2/CYDXRDyYYLwefmCk+uAsZtqvkOmPcx3JppI5eTmX/SiciiCBzE5+wCvq6CsAXm7AY2kdTSdybignqV2v44DIgMa2j7AKfZqMSu3F+w9OIbhcZHbkNM37q+vh6QQq/KSMGbDaCv0q1uGFUoxC6HFlwkpob46C42Njieo8uZQqGHIs2iMgub+J8/XSdNnqjBvfpq5f3SGH3AoMtVky/cXKeTVnhDvLWlz1y6KjKgLeyV3xA6TRgXGhd3pv/z9EWf20TJj17NzGsKlvGqXmtcqdoXh5E5rIGOOLH7TWwcZH4AktOMZ+UgkZR1dtq1PJ0l7DxEXXr7S/XeT10PVcYiTU8SGnSp+DZGeiu7OZSw4U/Y/f5hhywPncKV3MHqrreKFt436ReezclsEjuydRIGY0hGx1Fr5WXp/gn+AOjtdbRhrUYIIaVBRr9WzzKOCwOLKRpskOK327xmuymJlJoWYQkfVo51tqcArKCZQsVWpcEkDtI/u0LoNpV66M4fCuCh8+jx0vGhis8Uak7y3qxfbRMvG8A8f7UcQdMn+phZxGOjfre0EJm7FP4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(2906002)(8936002)(38070700005)(83380400001)(966005)(36756003)(38100700002)(8676002)(2616005)(110136005)(31696002)(71200400001)(53546011)(316002)(91956017)(66476007)(66556008)(6506007)(26005)(6486002)(5660300002)(4326008)(6512007)(64756008)(122000001)(76116006)(186003)(31686004)(86362001)(66946007)(54906003)(66446008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0NtTDJQVy83eUZkM2hIYkZvaWR6ZzFjQ29HYXR0QUVFOG8ySEkza2g3aGkr?=
 =?utf-8?B?YS9YR25qY2ZZWUIwcmczRm1KVEJHQ3N1U0hpU3N6Uy82Qzg0MWVvekc1a0d1?=
 =?utf-8?B?OVlIQlZqWVlxd0UrMmVIYzZrL1pKNm5aZGp1OFN2NmJuTUI0RUx4TnJnNjdI?=
 =?utf-8?B?TFZoMDc4Z1B2WUxiU1UxSEdCaVNUbVFFQlVUSnRDYkJTamNXa2REL2ZCcTJi?=
 =?utf-8?B?OGNqSC9hUm1pSThPSTJTaFV0SHc0ZnJvQ0VoUWdrMVh1Mkdrb0tLRnJhT3lC?=
 =?utf-8?B?Z2tHaVhUc2dzSGJqVTIzUU13SzcxTGh1WVdybGUvOE9LMU82TnhrYTdsbitZ?=
 =?utf-8?B?MnYwdVQ5ZDdqQWJGS1haZHdMcjBjQmpEa3htbDU5RFVqRDU1dVU0RkFISnpp?=
 =?utf-8?B?cFprWVdZWTcwSmR1Y3JtRUVNSXlocGhEa3BEL0dKOW02OWpmSXVFbGZpUWdB?=
 =?utf-8?B?TDhBcGU4Rkp6b0d5ZkczeFB3em1GZFM0Q3V6dlJNdzcvSzM2aHJMSXBmaWRX?=
 =?utf-8?B?WlRKUDJIUFNkVzdCRW95MUNEUzRGRUllZko0cDFQMW5yeC8xRS9XZlJCVG9u?=
 =?utf-8?B?WEx5ekJtalhCVWd0dWFkcGtXRXlacW5VK1Fvd0lldWtOMGxtMkFOMzdncHAx?=
 =?utf-8?B?b3Q5Y004UlFCU0V2d0Q4VnRoMGtZVzRUTHV1Ny8xN1FOd0d6eU1odW5RU0JU?=
 =?utf-8?B?MUV3cWhIYzVzWVRyNjcyNlByaGR2cFphNGFaQ1oxZURIWnB3ai9vb2xmK2V4?=
 =?utf-8?B?eXl2TzBrR3ZCTlk3OGVkUnp4REowMUVrWGNrYU9mZHh5am9CQjk5Nm1zSFFB?=
 =?utf-8?B?RFZwaXBnSS9QTU5NT0RhYnkxbjNVOTZHRXF4eEdOTEF5QnprK2tRUUMrTDU4?=
 =?utf-8?B?YTlzeStDaElHVXAyLzZsME53NjlENU9kT2Ntblo2c3FzZmMrcHlDdG9RR0Fy?=
 =?utf-8?B?OWRuaHdHOE9ZZ2hkd1B1VERucHNWc21KaUZtbk53WHZnM3VVcmtER1lac01v?=
 =?utf-8?B?dFFZUnNqVWp5eEladkNuaHNxalNURldJUkgwR1RqbjZ4ZDZtMXJQd3kvQXNB?=
 =?utf-8?B?bXNLWHQ3MUVEMlJvTDl2T1JnWnY1cXdBQVpLelU4TjhPc3pJU2xyRHVRdDdr?=
 =?utf-8?B?SURsTzBHN1NqUjFZZnhQaXlzekM2Mi9BaFJSRXN2Nmo2a2xiQi81VE13TU1l?=
 =?utf-8?B?VVFmYlpTWmQwbkpkWERLbVhTeDNFSlhZR21qc0N4dEJ6SXVZZ3c0K3RUbkd0?=
 =?utf-8?B?NkQwZ2FJV3RXN09PQldDYlR1K0pQOVVPellKRHJOYTQ5T0c5cnErMFhtTk9T?=
 =?utf-8?B?Z0VnaFhJODV5UHo2YTExQlp5c3ByS0tJUnpmME1qZ2E1b09GVVNJV0dRYWlW?=
 =?utf-8?B?bkhOWTN1TXYyZDl3RENPb2hockhPNm1nclFpVEh5cmswZ1k4N3JpWklkTngv?=
 =?utf-8?B?alBuMW1PV1dqYUhDV0RWSDVhZ3FxMDhjdytTM0dXMUhhbndhOElXTngvVnZG?=
 =?utf-8?B?QnJwYTVkYnE0dEs5c2Y1VTlFazQwRkFXUTg2VDJDaGxQOTQxQjN0ZW5tWG41?=
 =?utf-8?B?NTVaR0hDVEp4WDZCVzFMd2RMVHBGbm9zRXhOajg4UTRnRndPci9iWmtRcjBv?=
 =?utf-8?B?dmUxb1JQYmtkZURWN0FKblNaOVcveEJsdm5HQ3ZnK0ppYmdUNWZFdDhIU0Vj?=
 =?utf-8?B?cWJyRDFxSzRnWnB6dkV4bjcxZDZNYVQycFU0cFA1VVNDSDRIR1BkQklHWSt6?=
 =?utf-8?Q?SnM8Oe1oF34xQBYq0A=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <D872E1DF88ABAA4184984344A13B581B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f703c1aa-987e-4845-a89c-08d9830858b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2021 05:16:52.0178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HRpdtJud1v0OAERYYJEuBBYyhQ/2pPA3+eqCrbFSxPjx74Az0tJf1BIulIGBeAi/31z9cUuBS4gA4Ytw5RSmyXj3lfXPgTY4PF3/G3l2mak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3246
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_221657_951527_BCF0E1DF 
X-CRM114-Status: GOOD (  21.11  )
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

On 9/28/21 7:34 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 28/09/21 10:15PM, Daniel Palmer wrote:
>> Hi Pratyush,
>>
>> On Mon, 20 Sept 2021 at 20:26, Pratyush Yadav <p.yadav@ti.com> wrote:
>>>
>>> Zbit should be in bank 10, so it should be preceeded by 9 0x7f bytes,
>>> correct? I don't see any logic to handle that in SPI NOR currently so I
>>> assume this manufacturer does not implement the continuation codes.
>>>
>>> In that case, it should go to the manufacturer collisions driver
>>> proposed here [0].
>>>
>>> [0] https://patchwork.ozlabs.org/project/linux-mtd/patch/20210727045222.905056-6-tudor.ambarus@microchip.com/
>>
>> Sorry, I'm not sure what I should do with this information. I didn't
>> even know about the continuation codes thing until now.
>> Is there something I need to do here or do I just need to wait for the
>> collision handling code to get merged?
> 
> I think that should be what you need to do. Tudor, any plans on
> re-rolling that patch series in the near future?
> 
Hi, all,

Yes, I was out of office for a month, today I got back. I'll handle it.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
