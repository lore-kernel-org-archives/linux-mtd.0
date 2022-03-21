Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD7EC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Mar 2022 12:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jjkmr8y2/sdvnrpx7tptDXOKY7dIJ8pfmMiyr7dwG7k=; b=I5KkBPX/U+UPQ+
	uvGwSU6jAtBdz4+0wg9xRMfra9cXiJjKx+pia9a9WN7+9+5f+btDHe0hDcPRlm72FfJ9zRjpCy4Ol
	AgusQDp7mEADAgopmT/We6BOL2HvV7D1SPVmtX0KgjmUWJexoriRN4UlGEa+siDTZ7t58VD0COtyx
	ehfS+nZraR44uKI/aYrFolNU/brqA9A+LUM+4brq94THvWecbTdeT6oMskl9qsMo5A39yfDOBZ2AA
	a9zmxhQCKd/ErOtEZHGZcIMqxzBB17644B/sAI6hYT+EcyoZVtBiPnAY3JcZLeSRJSEc2BtWN2Mh6
	LL31FynHS6m5llnhXnbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWHUh-007lVv-Py; Mon, 21 Mar 2022 12:50:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWHUe-007lU0-Ek
 for linux-mtd@lists.infradead.org; Mon, 21 Mar 2022 12:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1647867040; x=1679403040;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=B6PF2u2HqHOdzVh1twFf79rmrgUTHwApCvCzwabgZ+o=;
 b=fr15LQdSmcB62dYohtQRo/kaFkH3uariB8leZS1qpKHKIuyYTny1UDlM
 30MWu+pxozx45BR+3V4/JVjcSw+NrJi50MwJvpR8aoortRXHMjMJDm/8+
 VJLUf8h+MjpWyqp3wAUGwgXRQk7nn81abu9vO73ulprCO/TAIDrl7T6QX
 H4hEP/JtgU/i8Epk6BT/XGHlYlfPqm+h1Y6hbRdAqmYdcb2gYYUi4Nk5v
 lIrea2Ucy4+yqFrwPz5MROgCUp4k4Rk025btjLU4QkjV/KMcLqVBd1p2C
 PGF/f0lD9BlNcdWCHd713xPj20d7485JuPgbZgDJWBigPPgxo589p3T3U Q==;
X-IronPort-AV: E=Sophos;i="5.90,198,1643698800"; d="scan'208";a="89593520"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Mar 2022 05:50:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 21 Mar 2022 05:50:37 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 21 Mar 2022 05:50:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTjy/lYS9XWCxPDnTvNp+BTpBe1YQ8dA2ejTx/pXO2mgXf6rly8kiiL9bH8eXLQLy8aiRuc8YDRf3r2c8nSHYK6bnKGttctqWt0hgd7WqDJGE0Ikp1n5JOBuSqngj5Y9rNHgdLhMlEPUJUaVPJJKh/QUYn895g920XKQ5hrJLwhgNE5sLxLitxSlZGdKKNj4wqhpQemBIVoCtv1jQCTeFwt+Ap1fItCvjLBz2st60e3ZVMsQXsDcAeQkU1/RKFj1BiQuxO6lxJyTHMavKOGo/hfwe2+R4+yJYzF41FH69QcIBm3085XoMKjS6xUIdKfp/yZU2xrqHk9Fpth6p26OEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6PF2u2HqHOdzVh1twFf79rmrgUTHwApCvCzwabgZ+o=;
 b=JXQZrgrb2V29uNlOgF6vc5NuZiVB+8zf9N0O0JB6O8FgMRwmin6V+Sp7ucqmaLSth6h5yVd2pVnVnWq+S8j5Ce6Zb0scq4MSxouGb4vPn/ZyuRwatOeXmqpzoqKTAEKnFb72MyjscuVC3gLLro9VzUGEq9nGXAgUgSyCfXKDrgnDjj3UHaZhHdudqoOyImyVoAGjah8mWgeVBJ51i7663yJskDEIPqQbr+ZjxRZaG8tk8hD2rGIPKjaI9GbKxUeK4l/WvNOERMGNGEzhjOtB8CMm26IzlgFFLzvuD5RFA0kAzdm4mxHtcT0M0ntHF8mzD/ODNxxCpCcHbqY+IISUZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6PF2u2HqHOdzVh1twFf79rmrgUTHwApCvCzwabgZ+o=;
 b=RybwWzJq5y8Fzid0luimJUiAZGH7epcxfg5F5bZXYh1NUjf+A/lQpe2yr/s+GquNw8ciLWrD/+qwhX9ZYr531RhI/3zJW2+q1R8F/Pkz2fxGTYOu+o8N1CS5B1ZbeIpmloJObw7Tamv35YDaTogOIzRjYzt/9lFeXIMiK3kvYDA=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BN6PR11MB1825.namprd11.prod.outlook.com (2603:10b6:404:104::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Mon, 21 Mar
 2022 12:50:35 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::b828:b4ef:5cb:e551]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::b828:b4ef:5cb:e551%4]) with mapi id 15.20.5081.023; Mon, 21 Mar 2022
 12:50:35 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH v2 3/8] mtd: spi-nor: core: Use auto-detection only once
Thread-Topic: [PATCH v2 3/8] mtd: spi-nor: core: Use auto-detection only once
Thread-Index: AQHYPSJCjdRe3O4j50eK+DtOO+umKw==
Date: Mon, 21 Mar 2022 12:50:35 +0000
Message-ID: <b4e8c044-f16a-a72d-6047-c42cdcc253f1@microchip.com>
References: <20220228111712.111737-1-tudor.ambarus@microchip.com>
 <20220228111712.111737-4-tudor.ambarus@microchip.com>
 <20220321121455.bpql7x4ebhq7s36l@ti.com>
In-Reply-To: <20220321121455.bpql7x4ebhq7s36l@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bcbd0179-d5e5-45b5-6c1e-08da0b3964b1
x-ms-traffictypediagnostic: BN6PR11MB1825:EE_
x-microsoft-antispam-prvs: <BN6PR11MB182550A1E5CFDDF57CD50899F0169@BN6PR11MB1825.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EU8/I2k3CDhgp8oJxqvgD7dzOIQ5Id91H0wLjsRr40F0I52m3n3xrihjr0T9O42n1epvO5KFDJ5vOQrY1aP7WlSQAxYAMf9AlwfLmBkN9UGY8h7+jBnSz8/cNf+YkdS2LwK2+JkW+mxKONHZlRxzx9RQPOQrCX30z+A+pd6XRS5ATjRifU4cSdWA2vtwHDtN+jJbbv4CYRunp5j2njQtLCaOFJO3AnBeUaSmwr84tTTwXwJaDNykz0GAVgASnDM8E501wJvFVaaXPsTPl0+aZzT02IxkZpavnbp0hBOKQgJUyM5XWHDcJU1/BtECjCFYgDfPnw+e0Amnb/P6iYvaAYxUZfW9oXIhJSRePGS4qdpEnc8zpsuUJEoJ76FaJJgB8rrnhUWTi8AMvTk0nnWoZn1vbyx473qJ2xzuSP4/uIOtM6OjddQsM3W/jz230e9DLPo61vDNaMZZEKf7rqGfs3/j9oj3SjZRJXVfRUM6krLOEoREs6A8cgLOUdCfo4m0u4xck3QyheuADQRiuIGQEJWhpbnWwmUrdGWddHOWWwn5QPpWJWYCG1knTn4zxCCKxgt3vzNTqOqemt4kSUlvcFsAWycFXTHySBI0Tp6xgZLgi24C1Hib+aecHNUTvGrNu+ZpEDBZvZuwTIzbKw3YIi+RgNoYjvS1T6Ay92rmVc8qiTfCWMYsYU/DHVb0hoG+AFtaEfkmyMBi7Xh4pepJrz1rFqm55PT2n95nci36LCMpzJEzswpcL792uD20/W0OisHouYx1Eeh9W+luzNhAPQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(54906003)(31696002)(91956017)(76116006)(8936002)(6486002)(53546011)(86362001)(66446008)(5660300002)(66556008)(66946007)(4326008)(8676002)(66476007)(64756008)(107886003)(38100700002)(2616005)(508600001)(6512007)(6916009)(38070700005)(2906002)(6506007)(122000001)(36756003)(83380400001)(31686004)(186003)(26005)(316002)(71200400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0VBUk5MdDBVeWNjQ0tLL3hxK1R5Q2lSM0RXWFM5ejdEWisrKzJEQzRzVVFU?=
 =?utf-8?B?RlZUNUxOUWxlZHBFMHk4V3QzYkNveklhcnZnQUdhUlBycUpuOUJ1Nmk2b2Jt?=
 =?utf-8?B?WDZCRW55bnExV3llazlac054bmhnSnZDa3NoT1g2OGpuOFlvUEM2SUJSUzhR?=
 =?utf-8?B?dE1ua2ZMbW4yeE9oTTlJeFYvcml0ZGxQWUhVTjNoRnBuSDY0Z0wzWkVnRHQz?=
 =?utf-8?B?QjNjS3BwWHJnTTNsZld3VDNOWHNuT1RZMTU0U1duOTA2QWwzT2J4QWduYkRt?=
 =?utf-8?B?RUtObFZFMU9Jb2UxajRSMzBTY2NrR055dkRWV2JjYTNGa1lndkZFTkR0U3VW?=
 =?utf-8?B?RTZ0ZzJ1cjFxdXByWDlzY285WFJQZDByOHJ1U1FkWkc2MjZ0TnpHNUFxMllP?=
 =?utf-8?B?a1N4WTlvWkxrdGE4SnhqOHRGQlppOTdsdHhCWFpoQThRdFBJV0U3NzU5WWY5?=
 =?utf-8?B?TmFsd2xzUWpZVWlKaUFyL29rUVhyaFdXWnBiRE9CVWtYcGVZdkdNTCtHeVJ6?=
 =?utf-8?B?eWptNUNUTnVhK0lrRmNycnpBL29PZDIrOHMxa2xuaVpGLzJrRFlZd3kwTDU2?=
 =?utf-8?B?cDJFMHVuWTFJTVI5eDJqQ0t1TzlQTE9UK2VsaEszUUVnS2syQ1BvWFdmTDB6?=
 =?utf-8?B?dDZ0enF1alh1WWRFRWMvZFRhYTRjcmFxZEdtQXBwVWZDNVJ6NkZvdlhjTHd1?=
 =?utf-8?B?b2NyMWZXS20zNURwS0JYeitXN3FJQ1FJS0k0N25xYnBiVXd3WDZLTEZnVmZV?=
 =?utf-8?B?cXRLWVFDMEpzSG5hMWwzRDFXemFRSzBQU2JDcW0vMlMzb1o2T1dmVXlDNjVJ?=
 =?utf-8?B?dkppOVVWNUVsRkxlaVBWZFJicTIxK3BkNlFGd1djRG9HbmxHQ2lldFkyYTIy?=
 =?utf-8?B?eTF1d3g3aXZmRDBrcENFWDVnNmZiRysrVEtwSFpEaEFpNEY4M2tsb1c1YSto?=
 =?utf-8?B?M2VKYnhISENUTDlQZFZNbE43bVUzNG4ybmRoTXJMRXRDUWhNUXJCY2d2K09N?=
 =?utf-8?B?aXNzaU5EamYvVm13NVR2YnJpb0FHOVcvcldDMW1lMVBCN2lQZzNnejdQcVMy?=
 =?utf-8?B?Q05CTk96bFNIVkJmWHRmcjNZcGdWWS9BV2NlcFo1WXZmYnBsL0VPMkQzeHg1?=
 =?utf-8?B?VlJ3R3g1b1JrOWR3MzMzL3RmZmE0RVFlMDJFL3NuWUUxQnBJMG1zZUU1UzRU?=
 =?utf-8?B?VUNxTHU1Ym8vdFk2ZkY0d3BxaDQrV042NUQ5MkswSHZnTndsVG1ncjhLV3VV?=
 =?utf-8?B?VW1CV3RWRm51NFVEMk5ZK2lpWkllT0ExeXhPR2RZaW4ycUJtcW5oZm9PSmNH?=
 =?utf-8?B?Z2xXK3o2eVJ1RHBrc25sTUJrRkdESVE5dlpYQktabExVbTIzYzVLeWJNL0JM?=
 =?utf-8?B?bC9KZmVGd1VxTXhMU2FFN1VOVmowZE8vWkhDNDVwSm1yaGF2QThCSlZaMitk?=
 =?utf-8?B?b3dYNnpCSVR0Rm9EeDVDS0pma2pHV21xOFRWTnRSOUJkdGJMeGNzWXRYSUYv?=
 =?utf-8?B?Tmd3ZUxBVmtJNExGbTlHSXpKMEp5UWpmcDA1Ymk1NDlDMUJwQXJGUTFHeUh1?=
 =?utf-8?B?SHJ1djJYVFNQeEdTak5vaXkyM1c5MjI3Y21TKzFaL3BVbkthT0s1dEVOeGxV?=
 =?utf-8?B?RUZaWWdsRHl1VTFEaHFudW16SGN0Q08xUm0wV3VSa2xUb09uSkF6VXVscTl1?=
 =?utf-8?B?ZzJJTHMzUlQwVSswbFZaMFZNckMrS0lHaExKdVZWVnpMRWcvV09qN2RzaWZa?=
 =?utf-8?B?WVVpTTdVUkwvWk1tYWRFRmhkNHFGYUpVOFNMWXoxZGt5blp4NmVsSjNIeXRC?=
 =?utf-8?B?YktCeWRKZzdUQ2JLZG14Qmt4VHVOelRLQXRlL1N6SUZGL3JicVc2T241bTRV?=
 =?utf-8?B?c3BUdkV4aWdlU1lTYTd1dVNFc0padGZpZzZXK2xxdmJOVUVrajVrcTJiZ0tM?=
 =?utf-8?B?UTZyNlV3a0dQck1DT2t2N0tMOS9EVkhiSmZvMXJuZ0NieTdyN200WTNzWGgz?=
 =?utf-8?B?VUIyaVI4Z2xRPT0=?=
Content-ID: <E47C30E17B41C440BA47C58815FE3170@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbd0179-d5e5-45b5-6c1e-08da0b3964b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 12:50:35.5799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1gj8PDuxX2rtmai0dM1T/FQjtFTyMldLcJxL+8PdEPF6utEfKDbNQYtr9Gri0RDkaAEsMzT4SijcVbvk/xSHpulAitEx9dkjFTHlu+efonY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1825
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_055040_694339_74CD8012 
X-CRM114-Status: GOOD (  20.56  )
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

On 3/21/22 14:14, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 28/02/22 01:17PM, Tudor Ambarus wrote:
>> In case spi_nor_match_name() returned NULL, the auto detection was
>> issued twice. There's no reason to try to detect the same chip twice,
>> do the auto detection only once.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/core.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index f87cb7d3daab..b1d6fa65417d 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -2894,13 +2894,15 @@ static const struct flash_info *spi_nor_match_name(struct spi_nor *nor,
>>  static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
>>                                                      const char *name)
>>  {
>> -     const struct flash_info *info = NULL;
>> +     const struct flash_info *info = NULL, *detected_info = NULL;
>>
>>       if (name)
>>               info = spi_nor_match_name(nor, name);
>>       /* Try to auto-detect if chip name wasn't specified or not found */
>> -     if (!info)
>> -             info = spi_nor_read_id(nor);
>> +     if (!info) {
>> +             detected_info = spi_nor_read_id(nor);
>> +             info = detected_info;
>> +     }
>>       if (IS_ERR_OR_NULL(info))
>>               return ERR_PTR(-ENOENT);
>>
>> @@ -2908,7 +2910,7 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
>>        * If caller has specified name of flash model that can normally be
>>        * detected using JEDEC, let's verify it.
>>        */
>> -     if (name && info->id_len) {
>> +     if (name && !detected_info && info->id_len) {
>>               const struct flash_info *jinfo;
>>
>>               jinfo = spi_nor_read_id(nor);
> 
> I think the flow can be a little bit better. How about:
> 
>         if (name)
>                 info = spi_nor_match_name();
> 
>         if (!info) {
>                 info = spi_nor_read_id();
>                 if (IS_ERR_OR_NULL(info))
>                         return ERR_PTR(-ENOENT);
> 
>                 return info;
>         }

Here we miss the IS_ERR check in case info is retrieved with spi_nor_match_name().
Do you expect spi_nor_match_name() to ever return an error? As it is now it doesn't.
I'm fine either way. In case you want me to follow your suggestion, give me a sign
and I'll make a dedicated patch to move the IS_ERR_OR_NULL check. Will add your
Suggested-by tag.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
