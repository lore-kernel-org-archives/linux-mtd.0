Return-Path: <SRS0=9E2w=HK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E6FC433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Feb 2021 12:15:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3800B64E29
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Feb 2021 12:15:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3800B64E29
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CbDup9AziZzP6h9X8R0/PrVQIjX6UanNX75JnoW3dJY=; b=tjsOdwsHvrXrk8fXjsimw1f98
	d13vJgF8qmxyFc7wbLpXMVrjYpCSBIxuvTmKJ5j+ugjg4BQEvu4II0b8vr3mNNzLv2oH/1oCb3p6I
	gtllcXgPUYds6aV+I6KO3APW/6Wd9QyteGAS+kUARtyVGwA6QvwRzqOO4Xj9oy6w0mc0TaaAkdaE3
	petkN/gtGZCyiNIt5+eNNARJLoOeOd/RLrBdZulH/mOSbvAz4hzfXmY6IXkryYkLD5f778ZuAUllS
	VWw+ksp5YhwES40G9Avrl58qM1L6RyTEOEBjcMkzQfiPKzz5eDbT/bQOC2ouWi5saC4n+McnEMMH0
	4y2c/kozg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l95Qw-0006Pa-MF; Mon, 08 Feb 2021 12:14:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l95Qt-0006Of-Gi
 for linux-mtd@lists.infradead.org; Mon, 08 Feb 2021 12:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1612786464; x=1644322464;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=VLBBAh/qc+0nGeIPu7bP3VFJ+MVGiz1NM3j9Ft7CuLI=;
 b=Uljp9FwnqU6E14QZWPxOQbZbxa+WD43gT9gvKd2hvHnlW5GGBF+jvx06
 j3AoVhjzy348FrUbFyKuhrIH7rfVN0r+Tt02/KgN81zE3gPUgbn75LKp5
 4JaaFAPbO+nvoI0Np9YHuy7ty4WylNMq80qP1MQws4fPDkDJubUaStlhb
 DX7X9PNE3he+unXxo5ZxAKvuTikKvOdDHS8ba6F+QijPLmHzJDfhVMmJ+
 ZKHsegnJ8hPrWV/GWjwEnllknvoylAaU09NnPJ2hC4ckiuAObZSB1NT0c
 XjhP0VjnIl4zZVaiCFB8Dx4uySbw9RuLBImrEYCFMpxH3rAG53AwC9aCL g==;
IronPort-SDR: 85TaLemuS825Mtq2/hxjqdcY0S0FQ6STVs2T9bJMBiPIU0mSCaj5gCqhaNgc2DGtUegndPRrKb
 3jfOCiSRjG1XoOvzAeeAc66uQ+b2jYhD0z7y8PGRY+024glegWU+wg4Fk3KhHACkeGV9IhC/6O
 GnxjMJaYqDiZctZjBjoqa/WlbUgzTgNxHQciB9OHFYmtKWW9Tep5lH7Qr6srjXbwtYn6vB7dli
 iUzStMkVs8IqGCt+OzXz6Xz1QCLJaGIHfYV6X1ch0Ui3CdK0Ggjt1X/UjdnewWVH4jjsOhGRaF
 4wM=
X-IronPort-AV: E=Sophos;i="5.81,161,1610434800"; d="scan'208";a="108390799"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Feb 2021 05:14:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 8 Feb 2021 05:14:21 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Mon, 8 Feb 2021 05:14:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gAGYV2xMJBD6b2gw2yDdGlSiY6llb4mPgDYchtQ8sqj02MSsxnVAcM0+uNBW8Hi+tr+EHW590XdbMibG3YfHe1Nu3b5IS+fIu6qD+XIx8D11w1ojTuZUjsw8yN39AZlCoVg9uoSTFSi2qndVo2oCtsxRgDHT6u6Xd4sH8KS2+5eAbvrCgmZjUR//mTpPZQGJOhAvb5rCHbwOggPO4B1IsYYHbXyd2WTmYN+P1kesSoc8nv2texHxe5+Mh77aTuiEMJULCqOGRjEkjIEKcEMbyrCwBUIjk02ABUc4XBWjhJTjDNM1VmAcrxowKpNyukhA9t74KMLDwF1x9EBwBVb72g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLBBAh/qc+0nGeIPu7bP3VFJ+MVGiz1NM3j9Ft7CuLI=;
 b=oRokRbZtjhdiyuqPBGtBdsA/QGTa8ZYxNV+0KT2kHpLXmaclgA3LsbzTbRWoAo13obt+VF6oLvmK82mxtUvlF0DViZ+1xT/kkS3IuNZSBVWywo11iHaoZLsQ0YtLuBOCGWQvksziJl81jh2OD3+TMzDWPUljxiL3NsaUTbafj0bm9+Afg2aJQwMHyBxpqdmdXHYDXAlIf00T5nHyz+/xVw6q5MipirlRkbYRecibF+TbuPLp+3srJPfm/9llTBSoNmNuHUG4Em0P5lX+3I8dAwa9bww+12T6dFW9PP0UrFfCJK/Z4H13rQ9NfMzRiPZw6c40DPLhCcarbi3xRt1eXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLBBAh/qc+0nGeIPu7bP3VFJ+MVGiz1NM3j9Ft7CuLI=;
 b=bDa7dtMRcCHypEJEMuXXvphZzqBHhr9lpHOda85LOWeiBGl8Gvt3l4JlGaI4fhe6ESw8caW0Ef+V52vd/wlZThDN3bIXn/9pSgwbxYobJboFqYPLisY1co8u1FICUzMyTC7Bq7wCKgugYe3f2JFJ4YpyDX8SEzGEIRCZSbjdyHA=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3421.namprd11.prod.outlook.com (2603:10b6:805:cd::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Mon, 8 Feb
 2021 12:14:20 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab%4]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 12:14:20 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: core: Advance erase after the erase cmd
 has been completed
Thread-Topic: [PATCH 1/2] mtd: spi-nor: core: Advance erase after the erase
 cmd has been completed
Thread-Index: AQHW/hPt5y0smKaiX0+p3JKMB2MWyg==
Date: Mon, 8 Feb 2021 12:14:19 +0000
Message-ID: <4d4a96d0-1582-400b-b554-14f87df44509@microchip.com>
References: <20210205135253.675793-1-tudor.ambarus@microchip.com>
 <20210208114101.txh7ao7bi66jezrb@ti.com>
In-Reply-To: <20210208114101.txh7ao7bi66jezrb@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01a393e5-6ee8-4cae-9d89-08d8cc2b102e
x-ms-traffictypediagnostic: SN6PR11MB3421:
x-microsoft-antispam-prvs: <SN6PR11MB34213A9DD4CC52F55FF10BE1F08F9@SN6PR11MB3421.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GcUUS0mb2gTi3ivVQaT8EFFGtI+DXex/oxG7mu1XzDGoMhUAa+SkcDgyY0d5WcWlYe72uy4ckrdWLcZJf0c1DXQqkAIYR2FiDukuas1B+Qkrn8tvf8N1qaTN5DbjTvrCfqRKZUrVBsu7ySleTWpzwEvATgx0qHgG3Vt4qPfTXQ2dOA97gBYRZYiya8UxxbaNbnzO76Ked8eiiQUFzpi+Ses+A/skAq1gYyQaPSNW4cEszA0QGHjbl2A79OSw2I5UNlGoXX3Hh6vmWl/7E6CuiqrTOZukliy0AoEnW2V+u1tx+kE2q03MpBhLjZQu4OriCSB4vuHYOG9j4wKqZuhK9QWhRNOQnhBO/u/sBWAZA00C9Rxgw1xnweic1a6dNDm4tYkhrCfNyQONBj5PCzXNE9cD8G8Rp6EXgA3bayjKjQJKtkGA5JX4mcJv/NBYMyLJoYHVKCVQuj15l4CGMT7O1mvyEm79c7ML9R4ZXI0ZayW6elck4gxnLOCUY11zuTDSnqjgLheWVXDw0Qc40Z4NYnxVTl49fHWyH81mPX8/8n+vdjGhRZzqKKeBBmKNvky4hHMmH+3SmDKNBrF0CxtqCIytcXPd2Q/AKmHlaV/dkCA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(39860400002)(136003)(376002)(346002)(71200400001)(2616005)(31686004)(31696002)(478600001)(186003)(53546011)(8936002)(86362001)(6486002)(6512007)(4326008)(316002)(6506007)(54906003)(8676002)(76116006)(66946007)(66476007)(5660300002)(66556008)(2906002)(64756008)(91956017)(83380400001)(6916009)(66446008)(26005)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Z2xaV3dwNk5EcHVTZ1BJVVlYc2RaMVVwNk9tR0pJTHhac1h2b2N5U3pJTStT?=
 =?utf-8?B?c1hlakZyVkU0anc3bjcwQkR3d3p6UEtIaG4ydk51cDdzTHNjd2ZKVk9oeUJZ?=
 =?utf-8?B?ZHc4REVNV0lIMHBEVXJpaW5xZkZrdVl6MThsczRqYnBGVWZFalpra3lqRzZ2?=
 =?utf-8?B?ZDZoY3hlVXNWRm5QQ3B0bjByOFFrWE82amFHMXNuSy94ZXh1TFVNWDNtc0Y5?=
 =?utf-8?B?ZGJuT1BrVTA0a3RMQW9TVDdvb0F0QnQvMXNQT005UHFYNi9Ia3NuM042Uk5o?=
 =?utf-8?B?WjZsdWw3dE4rNXN2VGoyNEZqQTNwc2tEbHZQL2IvcndNTWVtQmIxQjNtbXFN?=
 =?utf-8?B?M3d0dUFnM1pvTlVNSXBORGZ5NnZ3S0w3UHRXSzdwcG9XeFVUajY4NGwwYWtw?=
 =?utf-8?B?STU4QStEWEtHZ0dTTXNNVnE4UUNWdFdEdFB5Z2o1OTJ5eCt4MHdYQWo5ZWdn?=
 =?utf-8?B?RmtFdTJSVng1cE41cWFISU9ibVhPeXBnRzBaZjRNc2ZmZGZMYU9LRHA0VTVL?=
 =?utf-8?B?RS9IYmVJM3d5YVhTSDJ0aWw4T1J5T0RxRlR6VTd2NFd4RWE3NXVjY3l5dndn?=
 =?utf-8?B?Q1RtUDJ1MTJ6NXJHMGh3b2pPeUYwZUNUSXMySHdVTGxKakVLVkluM2FnSGg3?=
 =?utf-8?B?RmhBUFhjdEJlbU1aOCtTUU9LcVdtNlg0bUdORnNGRXZoQkZBYjdQTStpcklD?=
 =?utf-8?B?WDhpYnlaMFEvTXowRjF4bERKQi96NTVSL2Mwdy9ROFRZMjhSRVFGTnFVb0xw?=
 =?utf-8?B?eXFhRnptUWVoMVpkVDRNWHlJSWEyeDNtaXdMcWQxeXRwbDBoSVJYVW50STMy?=
 =?utf-8?B?Mmw5dUg5YWR6VjFzNGZVSjJmUTFJY3k4UDVvbXppODJZOTFHZ0gwN25hYVNJ?=
 =?utf-8?B?ODZDbnZLQno2OFp3TG55dnVJOC9YcWtkR3hxR080cnlud1FJUWRNdHRwbnJt?=
 =?utf-8?B?KzFYcndXblJ1YXV4Y2MwL2w4UFpnY01FM2RJN2l3TkxtWXUrS3lESWU3RzF4?=
 =?utf-8?B?K1NNMWxNemN5VzlsUjM5ZTlVRWpPazN1c1h6K2pCdlNUWGM1UzB2clhMQURC?=
 =?utf-8?B?K2pvRkt0c2JNRUJubXRwdkJzeUFLYktQdlUrcVVCQXo2b2J4eDJjamZPZzdq?=
 =?utf-8?B?NmFtTUpnNVFsbFI2SFNrUlJ4eFFVSzVBRTlUbndMaGh0RW9JZ3lpblMya25r?=
 =?utf-8?B?SWJObC8zRmJ0d0lHUHhId0dNQ256ZHVwVWZzaFZGbndZWmRlcGsydTBnVFVk?=
 =?utf-8?B?Q2o1RTRpODlLTytST0Y2K1p4cFM0WXV3YXNXbnFlcmN1cWV4d0lzVTkvTm1H?=
 =?utf-8?B?RjdvWEFZZzMvd0VJekxXMU9tWjg5TkVlYmtKUXlFZXhHWGhSYmVvYWxLaEhm?=
 =?utf-8?B?TnlZdVJwR1F4L1pqNmlLUlBmT1dLZ2ZpMTBuS0t0Mk9pR1Uzc21BOUt2YzU5?=
 =?utf-8?B?Rk1QOFltWnhyQUhxV3g2M2xLZVhvVEw0cHprbjhJdjRLbVhBbGFZZzR2SWVR?=
 =?utf-8?B?TlM5WndZaDVFZzlVQzJXdWQvekdTSHF1aVVYODdVWSt3K3lrZit6L1VRT0Va?=
 =?utf-8?B?Q3RtcE9aZXkvZm0rL3F3VjR4WjkvYXk0TENwNkNPUEZCVy9ROC9TQmVjRkpV?=
 =?utf-8?B?YXlWOUtOYTlrZWtoQXdCcmI4ZHNFeCtKandLY3JaN0ZlRW9hcXpGWmNncWJx?=
 =?utf-8?B?N1NNL3hLSHJCNEYxMUg5VUVWN0lqUFNoWTRsbVFlU2F6Mm1NWGhBU0hqVXY0?=
 =?utf-8?Q?ySXJcZynzlgkfUP4BQ=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <8600F2D1FDAE054CA78D3FCC28B924C1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a393e5-6ee8-4cae-9d89-08d8cc2b102e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 12:14:19.9438 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bPoteki4b57zKE/nIAHpqFCVY2mF1zBcJPspXjzocgUE29bsB21Oa4LPGES8TpFUuepJ3Cl6Vrlk3UnZti0ln6LU0CnjutBijxtnJiOafYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3421
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_071423_699623_ED07C433 
X-CRM114-Status: GOOD (  18.74  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 Takahiro.Kuwano@infineon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2/8/21 1:41 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 05/02/21 03:52PM, Tudor Ambarus wrote:
>> Wait for the erase cmd to complete and then advance the erase.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/core.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 0522304f52fa..bcaa161bc7db 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -1618,12 +1618,12 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
>>                       if (ret)
>>                               goto destroy_erase_cmd_list;
>>
>> -                     addr += cmd->size;
>> -                     cmd->count--;
>> -
>>                       ret = spi_nor_wait_till_ready(nor);
>>                       if (ret)
>>                               goto destroy_erase_cmd_list;
>> +
>> +                     addr += cmd->size;
>> +                     cmd->count--;
>>               }
>>               list_del(&cmd->list);
>>               kfree(cmd);
>> @@ -1704,12 +1704,12 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>>                       if (ret)
>>                               goto erase_err;
>>
>> -                     addr += mtd->erasesize;
>> -                     len -= mtd->erasesize;
>> -
>>                       ret = spi_nor_wait_till_ready(nor);
>>                       if (ret)
>>                               goto erase_err;
>> +
>> +                     addr += mtd->erasesize;
>> +                     len -= mtd->erasesize;
> 
> Do these changes have any practical benefit? IMO they are worth doing
> even if there is none but I'm curious what prompted this patch.

I saw these when reviewing Takahiro's patches. Addr and len were gratuitously 
updated even when the wait failed. We'll avoid 2 extra ops on the error path.
Plus, having them updated before the wait can be misleading for someone that
tracks them down with some debug messages. I find the code better structured,
and the code will make more sense when it is read, if using this patch.

> 
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

Thanks,
ta
> 
>>               }
>>
>>       /* erase multiple sectors */
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
