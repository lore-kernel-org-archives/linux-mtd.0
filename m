Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BE3C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 10:23:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B808C610CB
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 10:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B808C610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O2jebqLAUqwta90/WoBrfXkqzhgno0LtPNgEFH8nxTI=; b=TntmbPe0YOQy7z
	U3gP9kaA1BHEEukgXo7Z1eMwJVLYn/oBAk2Jhrn/xCRw/VoQKLsDXXj9FsiGx/6x97kE1OvWZaZfl
	cDF7I8MmdGcNOfPMeh4F9tDZUMjH2QsspL8TPdcx+ADOziaZX58jSBvdYtcMh69vbZbx2NGb0pk6y
	SoXnEqrxfl9/3ZmWOI+EUwKe+jg8OZIAJAgPP7dSIjGIDN/BQytFJwi26Vs51fGFgEIKakxLRdzbp
	nMzStahw7rCwHb8LtDZmY7Sswga22c/cSLB6VVFH3lJzywc0rtkEAdqbsI5+4g1SfrxKbXEUtkqVI
	8B+tDwSkjSdnCx7IBl1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkOGp-001VKN-9j; Tue, 09 Nov 2021 10:22:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkOGl-001VHm-Gu; Tue, 09 Nov 2021 10:22:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636453343; x=1667989343;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=b/u/pt4SifpwMx2mX1DgH7JdRTA9d2y7xPPlVzSax3k=;
 b=xaYpZlYWJijrdKdd4QqE0ClgJXtFvnndUaZSVWdOv2tr3HhkZpyXXAHJ
 LKtmeW0DteXljselbJ76c77YW8ZP+ADp1fPd3iWp64q0N/NVfpXeLP5ow
 5uO7AgKRyw/taus0U6qo3yhx7qc5lT5cGTrRpS2l3sInf91BeyiTwkibb
 amhGl8d/W+kbon1311r1wtoami88zFabg0hmKaA8na79Plj6/f99XMAGV
 DOZiR+oQaXdAQkNxQBuCG6AAOe1deC/eMr0pEmpdMo1m+0TH/kvzBZICt
 LfB8Tlxv3taImIlHZNoshH74EmmYkOdyWF8KAWtsPn9EECXccGuUuFvsV Q==;
IronPort-SDR: PXKkugZ2clxNacNFiH6C989fdblPhy3n5T7zoAbR9iSsw1y2rjCp1+NNpeAMMntXuS/8O8s8sb
 OWoq8ZC7xa4TuxCkzylZd58MvHrojLZ0SPXJHqz3wCEiG6qRHkwLQPfJYnQ+YVQE1iY81RDfhU
 JmQdpd2qLnNcME4hxxS4qlBaNRKoJ7P9TMr2cZE/uzivLM4tk0+2OAsE7SLc/Eql9QxNyK7NyL
 s5iXcHdULmMQ9L5vDaLunIEiwXqcyYD5CibKgu74zBnujqaBotzi9E9JxN9dZehm47PG9vHoHb
 STrEfR5vNAay7CvMaRb4mjd8
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; d="scan'208";a="75837437"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Nov 2021 03:22:20 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 9 Nov 2021 03:22:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Tue, 9 Nov 2021 03:22:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2xEhg6DcT3Yl1z6bAtlwYsWFIX9aiIjpR6XV8rQmIzuWViFV9tejqTy2Co8mu8ZRJ9ILJSTAiXl7QpJvGH0xV6fk6xCLsAd8FPuhwpe94NnxW0VeqtxOX85uniMII/lSdHngijDvG5sAIK2ExLHDZD0w6jzl7YZzVIUqiO339HUMJkuTVjFnkMHT81i6YBJmk+7gQK8J6D/Khm2vgChEbqKjOt/BchzQKN9F9jY06B6GYwEuAcLrD0OMksQD13ugzWbb1h8+Jw5S2gmL94bSHZFkUYakyHznw7AuaE+lXJ/xhIosADeh8PkA+CwUKc/M/Q8L9PFxNGHDbB/pGyjew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/u/pt4SifpwMx2mX1DgH7JdRTA9d2y7xPPlVzSax3k=;
 b=mY0RlyVU7vbDO4do5PL2tVk1SaubBa/m5i4yUU0RLfQBhOBEdRJLE8B3cJpqzHcWWV2XdaLXLMjGYG4UJdn9c/RzUX/YFz3xmvQHzraAj6jps4qRwaZlvaE2E+TyJoKyCWOqpgUBXITWlL9S74dZn7bkL/E4c7Cg5+Q98K+kJh8jCxQJ/0EOAjrsepQJA0paVV1nr9E7VrqP+lvdM/p15eibf9gQVC7yXv6xYo/tf62Tw8TylPGXR2Qm4cD3sUoN/wGpVm036Rj9FXRRjkyS75QLjNFSCrzWKiILoZF5dCMIBzlPAty+BeYija4TNbUUoDOugB8uknTQ2+5uyTEeHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/u/pt4SifpwMx2mX1DgH7JdRTA9d2y7xPPlVzSax3k=;
 b=kHpg1QMLSMsJkVnzc5SAHY6CkmjpCNN8aaDzPKs9z/SbwRh1FaCGDpO5era0mIsCQTTUCbXP5HigR1PeaHKWhp0tX4zE5l5Y7NDq6GnczulkHvYA8yJwzq3ogtt2Akzd4rPt1FGuK2wgMCKwoZKdEdfbU+KkipktlP+DA4+dz40=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3053.namprd11.prod.outlook.com (2603:10b6:805:d9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 10:22:13 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%7]) with mapi id 15.20.4690.015; Tue, 9 Nov 2021
 10:22:13 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v3 10/25] mtd: spi-nor: sst: Use manufacturer late_init()
 to set _write()
Thread-Topic: [PATCH v3 10/25] mtd: spi-nor: sst: Use manufacturer late_init()
 to set _write()
Thread-Index: AQHX1VOpShvUzigTrkqypVDVLupn2w==
Date: Tue, 9 Nov 2021 10:22:13 +0000
Message-ID: <a82dddac-e258-c87b-be9d-73f1dd336051@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-11-tudor.ambarus@microchip.com>
 <6bd3505f4c87d6b1ceeaaf51e3dfcac8@walle.cc>
In-Reply-To: <6bd3505f4c87d6b1ceeaaf51e3dfcac8@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dacd5f1c-7ea7-4b19-4348-08d9a36acc42
x-ms-traffictypediagnostic: SN6PR11MB3053:
x-microsoft-antispam-prvs: <SN6PR11MB305319743387B4B4ADEEAC1DF0929@SN6PR11MB3053.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iHgjm/Wss3lkqEYYjjl355fpwZ0zTh8KXvkh/rIrN0fwg4Z7jKnco4VWiX54+KLBB4o5dH+F6GK5/NG0k53XU6CPgTf6QQ9knUbWthXJ9fedfE6xD9egnfRJDDocdTxnPLTnQqFXlcFA2VVQDDSC9USBk+veYqZjXidcvQM9mVavdSEJZB5L0u1Cm9hGAmiq1eWM7Aoi1lbA7+zNdixTQG/KF0ZqFjpxelnWhkZ91lujOhkysWmUOsbVJPFZWhB+MgvusyMzauaeydsomy5x/EuaAC7a2M16qlLobKy54Ev+8q6Emeyg2KqVEKnfrBpTsRs2Ee5nhaznl9fAuBuCGFnOjOtetf8zrVmsixkvM+2/e19+Iiaamv3AQh8Kr7JezMsnUfS3gbbLNxlxvfV1GOSZJI28rH/UdzzIXRxd6vHco5zYvDZq6J5EPd7DxGDtZSgBuqrbQl3mA9OqNTdKT9DtocpCSAl+1NFH9gpv7gthSklirxrnCwb3lX03kDlLgzH873IW+/F6bL8DSogla1WdKX4dORPYlyux0kiJiKrcj36PiLvvFmV32Syn3J2nsieD+K90ArF8wd5dqZRq07pbV5odirBOsLLG0dByC9MZwERnUGR5zaE0QbdoSdUK/4edU3r4LV1oFQwl5ZATArolqmqgE4rI2wDuFoqvbOyWaqp411VqiJKsvuF8iiYqjb5CKwe2tYWyhhGDpsj204ekVuLzEG4lFwFUwRDpIA7DyXbTb6k7sxRiG2eVTBQu3jXXTycTzs19CXrC0niF3g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(5660300002)(2616005)(8676002)(508600001)(38070700005)(122000001)(6512007)(6506007)(53546011)(7416002)(83380400001)(107886003)(71200400001)(316002)(38100700002)(8936002)(86362001)(6486002)(76116006)(54906003)(66556008)(66476007)(66446008)(31686004)(64756008)(4326008)(6916009)(2906002)(66946007)(91956017)(4001150100001)(36756003)(186003)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFdqbyt6WjZaeDNQSXN4UHRmRDI4MVVhMk96VWVEamdsR2dmTXg2M1ZvOE5o?=
 =?utf-8?B?eklvblltYkpFblB6Z0pGTTRkL203cXZOaHFwZTl0aVdkMGsreVM2eHd2ams3?=
 =?utf-8?B?WEoweVVSbnFCK2tmR21WU2pxa0tlWGxkTERnejYxdlJNV1R4amg2UFdscjkw?=
 =?utf-8?B?Ym1FODM1V1J0ZzRjb0FsZzBFK2F4TlF0RCtRSHNORTBhdlVxdjJhaUU4MGFx?=
 =?utf-8?B?T2RQTlMrdCtlMEhFODhTSklKTk1mb2UxWFRYR3A0SlBMczdmV1lXVjVVVWNP?=
 =?utf-8?B?b214TlJuanpMSGNiMldIZDNHLzRNWmlIOHdCLzd5d21LdGxmZWdVQWFGc2Zi?=
 =?utf-8?B?eVQ3a2lnNmJxVUJYRmgzQkcwWmp4NUxCMGRuZW5QS3J1WGJrM3B0OHVHbUFz?=
 =?utf-8?B?ZmhkTy9wSWFsNnFrWWpaVFROSFUybmFOVXFJalNZZnNUZlRUQlI4UnpVNUcx?=
 =?utf-8?B?d3VJb1pHeEFVUHppSk1XWnJEWVVvME02WFhTQmFrMkQ4aXJhUnFFdWx5ZXlW?=
 =?utf-8?B?Sml1eWNkWUZmM0lYTGovZHVUYWFQR0RQc1hrZTRCclYwak5TK0Rac1dxajFq?=
 =?utf-8?B?Q2lybU9BTS9qMlVqOE0yQUNRZ3Z1MnZicGFZL20rZXRQTUNHbnQwTFBNMVBQ?=
 =?utf-8?B?MmxpOFhJUEt4cGtTclZpN1lsUWRod0twazJ5dXFRNml0YTZyMGdSVStqVDdU?=
 =?utf-8?B?YWpuUDdIYUxudUtoNHpQK1NoK3pQV1p4NnlLWUlYV1ZvcENZRyttSWRucHVj?=
 =?utf-8?B?VHJUdXEvUFQ5a3JFTEFpMDIrVTZMT2huTmtyN1A1VG50bWwxVS84MlM2U25v?=
 =?utf-8?B?UEtCd0k2TWpKczk0M3VUemFlUVZxK0xDR3JybVMzZDJuZDNuUnNjUU5RTVFh?=
 =?utf-8?B?WXJIRTd6ZVQ4U3JEajRVMVNtTlJjVk9Ec3c4Z2hqQ05HUThsOTgvVXJraXRu?=
 =?utf-8?B?ZHZsS3ZXWVIvRXlmckRNRDc4U0dhR0dRamZOOVE5MjUvRkVqOS8wWDhsN1BB?=
 =?utf-8?B?QSt3MTJkTHNGdWFRNU00MXhPSndMY1pvMDJyK1BjTEdSbTdEV3VzaXNlc3dp?=
 =?utf-8?B?ZGJsQTNMKzlxcTJhYkFNd2U0U1RHZkJaV1ZmV2VtVU9ORC9TUkRUVEVzVWVL?=
 =?utf-8?B?UGtHd1ZxSVRlOHRNMkdDaWZMblFod0k2bS9DbEwyelo1ZDB6eEtYdWZTcllj?=
 =?utf-8?B?WEtUNXBKZDYrZmh4ODd1dUxzcVRXNU1KUzNjNmVOMkFYY2o2SXB3WE55KzUr?=
 =?utf-8?B?aHoyeXVBcDhKUHNZRXlkMFBEVWZLVi9XUTdyRjBnUjBCSGZkRFBFUFhQYTMz?=
 =?utf-8?B?YlhiVTJuNkRaWCtlaG15QnZSVkhYMnZzZWxxZ2JNemRoc2UrQ1JuOXVLTGJV?=
 =?utf-8?B?TnZ4WkMxUU5sOTJxV3BiRm9JWTl2azV2TEpYb3hUNDFqN3dBSHVyWW1sS29S?=
 =?utf-8?B?VDlkNG5ua2pIUmlkWTJHU1dCZnYzWmRpekg1Sk9URkxRekNjS0xZODUzb2lW?=
 =?utf-8?B?WG1FaCtxQzJIMVBuRDZWWm5uN1FWalRnRmd5VTdvVFZQbjZjYytWWlBLb2JD?=
 =?utf-8?B?MnlkbGRBN0hKVXlZMGpwTGpYUnBJQlEyUVNBNFlCMkRvdnordGgrM05CL0Uz?=
 =?utf-8?B?TDhLQ0N6T3hFdkw3eTRacVA4VndINHYvOEhMOXJZSzhnNGxpTmN1ajlhNEl3?=
 =?utf-8?B?VnlqUjMyK2pWNHdZbEMxTFJ2TUpRNWZnOTBVbyt2eFhtMURJQUxDZnFxNmVJ?=
 =?utf-8?B?RkZyeWkxd2JCUzFGeDV4Y3pZbjdWWk85QUFhMXg4VjQvdGRMRmlRTlk1dU5F?=
 =?utf-8?B?Ylc4ZXErT2hQREx6OUhZVmFPM1hsY2hiSStQeklMcVVMSW5VQlpWZ3FBNVBl?=
 =?utf-8?B?a252bDg3ZVg2Z3lGVjZFZm5NbHFRVnI0aWcrbkNzRzZZYUpJOVR2dTA2STFP?=
 =?utf-8?B?TVFKb1NiVlpqZDdUZjJjZ1N2OEdKbmdwQnFRSEFtczByMWRMdGc5Vkp3WUFV?=
 =?utf-8?B?TEFoaWJqc21TeGJ4NndmZlgvaGQzVVpma2llb0pwN0czR0t0dWdjdDhxSG9a?=
 =?utf-8?B?S056WEgxYWlBdWlGSXl6U3RVaUowaTgzWEQ3N0M2TWxXZFAxenRQekwvWS8r?=
 =?utf-8?B?TnBWWnVLTmp3R0gybWFtQzkxV29GQ3poN1ZyWEFlQy8xUkwxSldoL3cwcEE0?=
 =?utf-8?B?UkwwM0NPS2FhdzlWdlFDdHZYejRNOFd4R2Z0Z0U2Rjl4eU9sL2t1WWtYMW9Y?=
 =?utf-8?B?aWlmWWhNQU50bDFHT0FwRmU0ZmNnPT0=?=
Content-ID: <64978A6D3908C24E9C310E61263F0001@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dacd5f1c-7ea7-4b19-4348-08d9a36acc42
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 10:22:13.7266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DX6xGcqfAnkhpJthbR4rY10yxBRioUA2tlRMoe62pdgrJfxJluTWQCzYyytcFNDV9pkSJQQ9TLXhG8Xl0Fwfu1DrJdnZ1g/s0PpwjHW1AjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_022223_790803_4E10C985 
X-CRM114-Status: GOOD (  22.32  )
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
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTEvOS8yMSAxMTo0NyBBTSwgTWljaGFlbCBXYWxsZSB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBBbSAyMDIxLTEwLTI5IDE5OjI2LCBzY2hyaWVi
IFR1ZG9yIEFtYmFydXM6DQo+PiBTZXR0aW5nIHRoZSBjb3JyZWN0IG5vci0+bXRkLl93cml0ZSBp
biBhIGZpeHVwIGhvb2sgd2FzIG1pc2xlYWRpbmcsDQo+PiBzaW5jZSB0aGlzIGlzIG5vdCBhIGZp
eHVwLCBqdXN0IGEgc3BlY2lmaWMgc2V0dGluZyBmb3IgU1NULCB0aGF0DQo+PiBkaWZmZXJzDQo+
PiBmcm9tIHRoZSBTUEkgTk9SIGNvcmUgZGVmYXVsdCBpbml0Lg0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNvbT4NCj4gDQo+IFJl
dmlld2VkLWJ5OiBNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPg0KPiANCj4gSnVzdCBh
IGNvbW1lbnQgYmVsb3cuDQo+IA0KPj4gLS0tDQo+PiDCoGRyaXZlcnMvbXRkL3NwaS1ub3Ivc3N0
LmMgfCA0ICsrLS0NCj4+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9zc3QuYyBi
L2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3N0LmMNCj4+IGluZGV4IDY2MGFhYmRlNDc3YS4uMzU5M2Fh
ZTA5MjBmIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9zc3QuYw0KPj4gKysr
IGIvZHJpdmVycy9tdGQvc3BpLW5vci9zc3QuYw0KPj4gQEAgLTE3NywxNCArMTc3LDE0IEBAIHN0
YXRpYyBpbnQgc3N0X3dyaXRlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLA0KPj4gbG9mZl90IHRvLCBz
aXplX3QgbGVuLA0KPj4gwqDCoMKgwqDCoCByZXR1cm4gcmV0Ow0KPj4gwqB9DQo+Pg0KPj4gLXN0
YXRpYyB2b2lkIHNzdF9wb3N0X3NmZHBfZml4dXBzKHN0cnVjdCBzcGlfbm9yICpub3IpDQo+PiAr
c3RhdGljIHZvaWQgc3N0X2xhdGVfaW5pdChzdHJ1Y3Qgc3BpX25vciAqbm9yKQ0KPj4gwqB7DQo+
PiDCoMKgwqDCoMKgIGlmIChub3ItPmluZm8tPmZsYWdzICYgU1NUX1dSSVRFKQ0KPiANCj4gU1NU
X1dSSVRFIGlzIG9ubHkgdXNlZCBkdXJpbmcgdG8gc2V0IHRoaXMuIFNob3VsZG4ndCB0aGlzIGJl
DQo+IGEgZml4dXAgcGVyIGZsYXNoIHNvIHdlIGRvbid0IG5lZWQgdGhhdCBmbGFnLg0KDQpXZSBz
aG91bGQgZ2V0IHJpZCBvZiB0aGUgU1NUX1dSSVRFIGluZGVlZC4gRG8geW91IHdhbnQgbWUgdG8g
aGFuZGxlIHRoaXMNCm9yIGRvIHlvdSB3YW50IHRvIHRha2UgY2FyZSBvZiBpdCB5b3Vyc2VsZj8N
Cg0KQXMgYSBzaWRlIG5vdGUsIEkgZmluZCB0aGUgbWFudWZhY3R1cmVyIGZpeHVwIGhvb2tzIGFu
ZCBnZW5lcmljIHNldHRpbmdzDQpub3Qgc2NhbGFibGUuIFdlIG1heSBjb25zaWRlciB0byByZW1v
dmUgdGhlIHBlciBtYW51ZmFjdHVyZXIgc2V0dGluZ3MNCmluIHRoZSBmdXR1cmUuDQoNCkNoZWVy
cywNCnRhDQoNCj4gDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBub3ItPm10ZC5fd3Jp
dGUgPSBzc3Rfd3JpdGU7DQo+PiDCoH0NCj4+DQo+PiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3Bp
X25vcl9maXh1cHMgc3N0X2ZpeHVwcyA9IHsNCj4+IC3CoMKgwqDCoCAucG9zdF9zZmRwID0gc3N0
X3Bvc3Rfc2ZkcF9maXh1cHMsDQo+PiArwqDCoMKgwqAgLmxhdGVfaW5pdCA9IHNzdF9sYXRlX2lu
aXQsDQo+PiDCoH07DQo+Pg0KPj4gwqBjb25zdCBzdHJ1Y3Qgc3BpX25vcl9tYW51ZmFjdHVyZXIg
c3BpX25vcl9zc3QgPSB7DQo+IA0KPiAtbWljaGFlbA0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
