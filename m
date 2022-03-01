Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E691EC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 12:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9ir1FX4zX6jJG9H+xL04tWvDwWHEfwQtNg+t/oylQE=; b=mp3raYM/ZqX6JO
	beUo2JdSuvl8MCgZRMMdnDdfMz5l5tvyU5JlbPdaklfmSIoht7OOsX9qzWTkrsMo9udgqWkBzBc4I
	5aGGLVDHc5AOS/NCnpbfL4hyUBDMBkAcNtl2tVNcRIz4/lYdUfLziul2SxLlrz9GbEoeGmYXtvHmq
	Ix3MclnHMMiQKzBtNPvKi1NhqUK5NFa9E+9D+IV2n7gUQ8gzu4QtmvWVhpTC4X8pgGl2eJobllQXv
	pc0OTuGZJ+2UI9f0x8taQPO/cP4c2adZmQRXLm/D/yC8RCcKzQcb8IJJpRJeudeaeZlylWiD11dhL
	nbG96+i4eZFkzBUYeKPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP1u7-00Gd2H-Tp; Tue, 01 Mar 2022 12:47:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP1u4-00Gd0Z-Jz; Tue, 01 Mar 2022 12:46:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646138816; x=1677674816;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=W66PLpGOeDS3t9+eKUwauyT8m0goj1eSelkgP1PK5jo=;
 b=aHOb6vCrBaoGKVqbTrbbIYgROJr4TkBIZa9/mworaBMyugSAcTyn9ErG
 z5UOHwWPNo81jBKmW9lhpskFg5oqxzYcuB7Km6jFaatzmkjiU6rI/rkWo
 B7uRTgIGVi9M4HaTUPpXblgVCsnKShZKWqZghPZksIEZygmKecTFwHskx
 /Tj1G4c3cX0GHvNnZAPw8+Qgo6rgcTt+8CDa73xZ9NLJUSNK5zKwVr+eG
 gAgkOuRElgkQ4pjAztnha313mfU6BadvIeUdbVXVh13dVK7Jgv3IulHkn
 qJbpA9yb7Sok5b188RAy5R/GPT5XlsWjiIlRxD0HtnDOOvvDcjReq8o36 Q==;
X-IronPort-AV: E=Sophos;i="5.90,146,1643698800"; d="scan'208";a="150386048"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2022 05:46:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 1 Mar 2022 05:46:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 1 Mar 2022 05:46:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c++e2BG7spx8Ao4wtPrDJFZ0rTr65fOil28VznKXhiKYpHrnVkjIFx9AMKiaszAtunjPwYsH+jyDjP1NTNpU4H82XLGHZeb0NJSFs5mOn6xwNTxd7p4fp5jCk318lrUr3aZ4bcIr4LBKsQiKoORVCB7PybEKRQ70YfQWLm+IlOE6X0+cfxgO5DgFHgDYvPRP+Dkv5n7v936H/7ytVxVdLqAc0ax9dmVKdd1cm079lPN+WQJKhryStPnYiQu363vPWvzlFpZeX/KImjEmy4fnLk2RrPEB8P6iqxv3uhT8Wngfu/Aio0Bn9QErHQa5HDf4UhI8/YO+0UW+nbVHgOzzxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W66PLpGOeDS3t9+eKUwauyT8m0goj1eSelkgP1PK5jo=;
 b=iM8fLjxVPDy0E9N1A475mZD62+b01PUAiADDc26R0Bq9ELggxvp0lh4CZMgGxBrjXdrbg9/MRdatR+8veBtuYwtcKuXUeiL7E+7Mv1DKufoDpfMG9x9Z/uimq1f5E0JKIgGBa6eAEYJ0chzA874PAZHDgUkJtWrYbpV+VmLcqjIl0JzBYAUi9vTE+rwaJ1ugV9vp76qkVOBwQsqtdeOh9DbpUlm0MjDYhhjLeNgZ/CjdcsuUMeE/JqCwNUDsjWkUGnCX1IqSFRLL0WYuoTsEQht18P4CbFoizwVXevnT4XzWlyD2fkjALTIKWwCDNej9uQGzZBD3PJkV72I2qxoDvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W66PLpGOeDS3t9+eKUwauyT8m0goj1eSelkgP1PK5jo=;
 b=XryD77cmBZu8cgdcmmYpnWLiuKoeV7a9qhwnzzPKhqdZpJyK3IP+fQ1SNtaE19CRIT4vCo+vWqLsMfyT13VMZLirkiv+U680A9j7xtztDvlMcna43h45r65Ivi6bNangG0K9/xNVSEsNHxwZk4UkPvr9GqwIp55wCJGSlXFpp8M=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by CY4PR11MB1335.namprd11.prod.outlook.com (2603:10b6:903:26::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 12:46:50 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%5]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 12:46:50 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
CC: <heiko.thiery@gmail.com>, <p.yadav@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH 0/2] mtd: spi-nor: Fix Quad Enable method for MX25L12835F
Thread-Topic: [PATCH 0/2] mtd: spi-nor: Fix Quad Enable method for MX25L12835F
Thread-Index: AQHYLVplQRnxn1BbbkGpQ8xUF2TdFQ==
Date: Tue, 1 Mar 2022 12:46:50 +0000
Message-ID: <6af32b60-b508-1c17-7e5c-c453feeabf37@microchip.com>
References: <20220301095640.313852-1-tudor.ambarus@microchip.com>
 <CAEyMn7aWroFEzo9yPfbwQy3g5iwasuWOQvcHhkRA6Nrga-WRTg@mail.gmail.com>
 <ba3a7bd546934ee0174480a01c505663@walle.cc>
 <0210b628-a331-d935-6319-bc9fe737fe15@microchip.com>
 <f04908c3d761220d8efad70ac244bb84@walle.cc>
In-Reply-To: <f04908c3d761220d8efad70ac244bb84@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6021ec1b-28f0-4f22-1492-08d9fb818e40
x-ms-traffictypediagnostic: CY4PR11MB1335:EE_
x-microsoft-antispam-prvs: <CY4PR11MB13350C72F07A16ED712FF5FDF0029@CY4PR11MB1335.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6kwEmdr1tEOYb/PI0EMxi0XqdMSzQq7SfCP1BSVGkK8oaO9qOMjH9kLhDZ3TcLd8J9BmE4BJDdYdOHTRY9QCHcJPsgKmx/zvsukNieW760Ammo9PTd/bP5huQcaRRJUdzKJxtZrMeBMZrcxIsRhbgfJDJKmgCAufRrgBQf/s2iEo7nBv0MK+wCzYg2nQeaZqWwefFZuHSp9ZDMFy7JvkbVLgGBqVnx2FVP5xBsBuKtTZ5re2HIAPv9PcfPM9Ib9IJqarrG/Ph7dKOzLadp/TDMbv5xBqxz8QxagWCxW27Ew6T68MIwSR7gr58Wvmyx0tZyndGwbhXW2YHoTZ3UaXT2lZh9pIIcNa+zbNslOM92H7ecDtSEiluuQBWNauSZeb1Cxma2ynF/2iw+P1ZW19znKy6JIe1NH8qb6/k++GikHzzW0CKytOIa3cUl9v8q66jo51Ky8nSdZWeQniTotWiCEjlhXmCjg/2Vz6dHnFKuuhKLaORd1AS37+XeApkpMWoD6czkx0aOsqGUc9hb9ua47FJKQzArS1F67BAOiANzwXonQZtMrcWRX4BRQydXaodZtQq0kw5OOB/JT7yP8oQr0HACDS/M5kKMw5k0f3Ys4k3jPewnyM09RC6DqrIQNLJcqN4qGCQ5w5n40jqwlfy0o5smekESFsJVVG1Q2FguTTlOmznZuvXbRChpUveJI+hE0DhyqC8qQdNTucM40u2BY6jgx0tKggesTkp5SB6PIDkQ2dWEfWxrs+Uu8KHrVlLia/Bd2hMnNxzriHaTHwvCaeYoZkqDuIvEfd+HOoOHO6WZFev3k3ZAvc1sgZfqtqSi2vZ4+AVvEaww4UrCsxsEpXXh4v9xyGTRkjT/coNDY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(508600001)(966005)(6486002)(8676002)(71200400001)(53546011)(6506007)(122000001)(6916009)(54906003)(316002)(91956017)(8936002)(64756008)(66446008)(66476007)(83380400001)(4326008)(66556008)(66946007)(38100700002)(76116006)(6512007)(107886003)(31686004)(186003)(38070700005)(86362001)(31696002)(2906002)(2616005)(26005)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkcvK2FlUm13amw5YUQvSXl4NFJrTFA5SDNGUC80emFQeE5YaTQrdkh2MG1w?=
 =?utf-8?B?VDNjdjNSL0dXckxVV01uSjkwajNWOXUwc1VMTnJpRnZ3dVk5UnFnallFbFJ3?=
 =?utf-8?B?bUZNek4vMkVGTUNITS8xUEtvMEZ0TUlOd0lPbC9laStVUzdDNTNmRmFwYWxG?=
 =?utf-8?B?Qzc2SllzQllwY3UvbnN1OE95TkNub3BGdFh6engxRHNVK0Z2T3hnRnhXSjhQ?=
 =?utf-8?B?WURBU04rTSswTFIvb1VMSWNDVHUrZlF4RXdZTnFSZzlTajBaRFFnaHM2MlQy?=
 =?utf-8?B?NWtXUzBSRGl5eStHU3JOVm5WWW9PYUI5SFdNRGVGd2FON291eDkrYWVVQkNJ?=
 =?utf-8?B?REV1OU5pdUFoVHpMRmhxeCtCbTFnS1JZRjVhMFllZVNGL1VOcDJ3UzhNS1ZT?=
 =?utf-8?B?aVh2ZDRUVVkxTzUrNUJ0elFEYVpReFlUZ0ZaeFhjZE5yejhIaHpvSG9rdllu?=
 =?utf-8?B?UC93bGtTM3F5bys0U203VTlCQ3ZMZHZmczRnajRWOElFNTZRZ2I4ZlRSZlpq?=
 =?utf-8?B?SWd3K0dSYXJ2YUt4SWN1STZwem12c3N4YWkydTFYM2ZHUEJBRWk5YUFtVktL?=
 =?utf-8?B?SGpuRDUwSnUxUjFCQ21JOXRZTTczRHJBZnNNZ240MVR3aEI3eFhISUVaNURt?=
 =?utf-8?B?Y0hwd3pzT2ZjeU52dUFaRUdVTk9INGJlVEZtOEpKMk1QMU5aODhoYlFPdjdD?=
 =?utf-8?B?Q3h6bzR5MnlTTCtiVnU4NTg0MWFkS2dRelFUNWloUUlvKzBNUmVNbkZKOVA3?=
 =?utf-8?B?MG8rVGlpN0tsS01CMDlQYnV6SW0wZ0pxNE0yaWo2bDB5L0x6Wk5xUzA2bjNw?=
 =?utf-8?B?R2dkUFM4djVXdjZKaDQ0VVJ5ZWVId29BaWNYUkFkRmIvUGo2TkFpMWVxYmN2?=
 =?utf-8?B?L1lUMmdETlRjV2N0SE8vYTA2VlR6QzhIaEppWWs2UnM4dVBwTEw5THY5UG1w?=
 =?utf-8?B?eG9RSFhlakRzVUVFQUg4VmYwMU9MVG56ZWJKNWJrR1FzQ3UrTWRJenFvREV0?=
 =?utf-8?B?SC9ZeExIUHBMRCt4OFo1QnVMalc0VUpSeUJLQ3MrNlFLeCszbmtGT1MyalU5?=
 =?utf-8?B?cVdCL3Y5OWsvbVpScGNVVWxwWWRFOWJOcy9SL0c2RUFzOW01VU1kV3lURm5B?=
 =?utf-8?B?Zkx6Y01zNXBudi8xSkhmNDlLVkZFckFtYnhjd1EyZEpuN25EMm5qWU5yZkV3?=
 =?utf-8?B?dUM3MUV5K29xMWJqbjRtOTVxU1I5L3RlRHRoOGdSeVFBbGtNRWdack5XUkdO?=
 =?utf-8?B?dkJoMjNPRzU5dHp2ODAzQ1dWZDRndjR0c2I0c2hORGwzM0wxbVZEMTE0ZXpD?=
 =?utf-8?B?UFM1bXNtY2ZZc0p4N1R0Z0Jhc3c1cVJMSnZubVVEMFVTRlRjd0F5eVBRUFJR?=
 =?utf-8?B?bHdrTkt1WCtRRDJucnF0ZnBydEZ4Q3UwRjNHYjRYcFVJMDBBWTNwcUdLMURT?=
 =?utf-8?B?cXZuYllmWElaV01uNVlTZzg4L1pJNjhsMGtpY0pVMWNaMVpsajkvcW9qNUZy?=
 =?utf-8?B?YnM1TU5OQVdaUW1ScmJHclJ6dHFhZlVJcHBPYmNtaHQ3dWpURURNL3VSUith?=
 =?utf-8?B?ZER4Uld0SE9XcEkrb25oWS9vdnpWeU9reTZTM3JJN2dHNWtnOWo1ZzlzRkth?=
 =?utf-8?B?ZmZWdmh4OU5xaUNVeVJ4ZXJtaFplRnBUSWRyWmZEVWoxdFdXSzVkbFNKYVlD?=
 =?utf-8?B?bkpveG51QTVEWVdnUVdFUUNNUk1EY2xDc3NYbU1KMjhoakI2UnVkNnlvY2pt?=
 =?utf-8?B?QVN3akhoN1BHZVYxSUU2eGkwakRTZ3UxcWdHWUxCQzFuRUtOa2hlM3VDWGdI?=
 =?utf-8?B?S1dPNUZ0S2NweWlSU2lGWkNLc0NSMENlRWhJMVhPWnY3QjVmMXJuQTFhblBV?=
 =?utf-8?B?QVlnK2h2YVh2MU53eHRJSmNIZkZUc1FISWhReFRqeW9Famp5VkorTlVKeDl6?=
 =?utf-8?B?OUN3MTJyekE2SFdvcCt4RWRjdWpJRWRzUkpIWS9mSzUyQmUxVGtPeW8xSlh6?=
 =?utf-8?B?cHZFTVRPK2NZdnJINlZnNGxnN0pjckViZUVzc0NDMEt4dkRxcWxnK3A0MU5T?=
 =?utf-8?B?cjFJVGlHZzEwczVMQlZDMFB6WmVEVWxUdXI1NGJ2cWo5VlZoOEt5VkVzcWIy?=
 =?utf-8?B?SjdZM09TTEVyMTJUcmwvYkE4dmIybG94WGdFK2hNd01oNGtYZXJxMEoxTzVa?=
 =?utf-8?B?TWdUY3dUNlV1UDNGVHZKVTBpU1FsMGF3dkVEbzhoSHYxVHhrNnVDZnIxdWZJ?=
 =?utf-8?B?UzFjOWZPQXJwSEZxeldvbUlDb25BPT0=?=
Content-ID: <D1A67C37C7702E44A5FE8B132505E2EF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6021ec1b-28f0-4f22-1492-08d9fb818e40
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 12:46:50.4459 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c6C2pag4rc48L4n3OmfXQIINbCghAcDYj5OAW5aK8SqNUThWf7cWGNfYJZxkhcCORQzbTC/JiNns++Mdog6K6TZhiWO20oNE70UBgO0OtuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1335
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_044656_850233_B3CD5844 
X-CRM114-Status: GOOD (  15.62  )
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

T24gMy8xLzIyIDE0OjM2LCBNaWNoYWVsIFdhbGxlIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDog
RG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRo
ZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEFtIDIwMjItMDMtMDEgMTE6NTIsIHNjaHJpZWIgVHVk
b3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tOg0KPj4gT24gMy8xLzIyIDEyOjM4LCBNaWNoYWVsIFdh
bGxlIHdyb3RlOg0KPj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cNCj4+PiB0aGUgY29udGVudCBpcyBzYWZlDQo+
Pj4NCj4+PiBBbSAyMDIyLTAzLTAxIDExOjI5LCBzY2hyaWViIEhlaWtvIFRoaWVyeToNCj4+Pj4g
SGkgVHVkb3IsDQo+Pj4+DQo+Pj4+IEFtIERpLiwgMS4gTcOkcnogMjAyMiB1bSAxMDo1NiBVaHIg
c2NocmllYiBUdWRvciBBbWJhcnVzDQo+Pj4+IDx0dWRvci5hbWJhcnVzQG1pY3JvY2hpcC5jb20+
Og0KPj4+Pj4NCj4+Pj4+IEhpLCBIZWlrbywNCj4+Pj4+DQo+Pj4+PiBXb3VsZCB5b3UgcGxlYXNl
IGFwcGx5IHRoaXMgcGF0Y2ggc2V0IG9uIHRvcCBvZjoNCj4+Pj4+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LW10ZC8yMDIyMDIyODEzNDUwNS4yMDMyNzAtMS10dWRvci5hbWJhcnVzQG1p
Y3JvY2hpcC5jb20vDQo+Pj4+DQo+Pj4+IFdoZW4gYXBwbHlpbmcgdGhhdCBzZXJpZXMgdGhlIGZs
YXNoIHdpbGwgYmUgcHJvcGVybHkgZGV0ZWN0ZWQuDQo+Pj4+DQo+Pj4+IFvCoMKgwqAgMS4zMjI2
NTVdIHNwaS1ub3Igc3BpMC4wOiBteDI1bDEyODM1ZiAoMTYzODQgS2J5dGVzKQ0KPj4+Pg0KPj4+
PiBUaGFua3MNCj4+Pg0KPj4+IEJ1dCBkb2Vzbid0IHRoYXQgbWVhbiB0aGF0IHRoZSBwcmV2aW91
cyBzZXJpZXMgaW50cm9kdWNlcw0KPj4+IHBvc3NpYmxlIHJlZ3Jlc3Npb25zIGZvciBvdGhlciBm
bGFzaGVzLCB0b28/DQo+Pj4NCj4+IG5vLCBiZWNhdXNlIHRoZSBvdGhlciBmbGFzaGVzIGFyZSB1
c2luZyB0aGUgZGVwcmVjYXRlZCB3YXkgb2YNCj4+IGluaXRpYWxpemluZw0KPj4gcGFyYW1ldGVy
cyB3aGljaCBjYWxscyBkZWZhdWx0X2luaXQoKSBob29rcy4NCj4gDQo+IGFoaCByaWdodCENCj4g
DQo+IEJ1dCB3ZSBzaG91bGQgY2xlYXIgdGhlIHF1YWRfZW5hYmxlIGluIHRoZSBjYXNlIHRoZSBT
RkRQIGRvZXNuJ3QNCj4gc3BlY2lmeSBpdC4gUmlnaHQgbm93LCB3ZSBhcmUgZmFsbGluZyBiYWNr
IHRvIGEgZnVuY3Rpb24NCj4gd2hpY2ggZG9lc24ndCBtYWtlIHNlbnNlLCBhbmQgbWlnaHQgZXZl
biBiZSBoYXJtZnVsLg0KPiANCg0KZG8geW91IG1lYW4gdGhlIG9uZSBzZXQgaW4gdGhlIGRlZmF1
bHRfaW5pdCgpIGhvb2sgZm9yIG1hY3Jvbml4PyB3ZSBzaG91bGQNCmdldCByaWQgb2YgdGhlIGRl
ZmF1bHRfaW5pdCgpLCB5ZXMuIFdlIHNob3VsZCB1c2UgU0ZEUCB3aGVyZSBwb3NzaWJsZSwgd2hl
cmUNCm5vdCBwb3NzaWJsZSB3ZSBzaG91bGQgdXNlIHRoZSBsYXRlX2luaXQoKSBob29rIHRvIHNl
dCB0aGUgUXVhZCBFbmFibGUgbWV0aG9kLg0KDQpJJ20gY2xlYW5pbmcgYWxsIHRoZXNlIHJpZ2h0
IG5vdy4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
