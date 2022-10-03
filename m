Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29A0C433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Oct 2022 05:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gyl2grwUmAnFUcGTHp7l/MfiTI4Vwty25ZdeEJCINk4=; b=Z78GGweXZpZhT1
	qnjdlrTSwr/mXdGlqQncpWUuL3lsRjDhky5bpd4+HXvibB4H+Rzxvly+D0WZesePO4ckXTP/bO2Ii
	QeG6BIvOk4tdNT8zZVV3fCue93XD7J+iLlmFtZgXGqs0ojYlbl1TDsjuhzf8uTn8t9w60nZQgHB8H
	N8hI5eWwH1sGhji1/rZ7UO4EMcX6czHl5XiXutAXzwJPnLfN6BdtQ0l+V3YJa+2qlvCKxCeBpCdOm
	6EDT7zCvqjELLps6UWZXjITOst740MnH44p16k8uEzAlYjDe3yjqpXNwV97mNt/kqu1+bgyqa5qxJ
	cCIZTCHjtAGpvXU+4lJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofDdE-003wLp-GC; Mon, 03 Oct 2022 05:04:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofDd9-003wJ0-CV
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2022 05:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664773480; x=1696309480;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qDG9L/d/UQh5TLLfFHE1o4Lfd5kX/M+2uuE1gk2egew=;
  b=d1DacRxpCUK88H15WpSkqNJ82hhNkWGyuJaiIxApmW/aOW7h0Uy76sE5
   feF0SsSmSyxrCpwKncPXXYn7KihTJezwYtX1rMUZjsnoXJxnyRmRwdqVM
   fQxE/rTYanRss6VWt4p+9ZtqcHmkeFUUMZqWn/kbLMH+2IJo0VuLyByoy
   PCoudV4a+ezP1IcIXxc1nAbvQvvKBWpxKkYL4joRmTBkYtIut8IdKWBBE
   r6q+Xnh9cbefrYV1V7MbtBrEwtOwGgdoalaYMMrEowoi9vO66R3hbJ6i+
   Mgcmtx/RSHR3B8Ox1slk+TgqFbiONRLNUArfkgKq28Ddi7jjqcUX3QpOy
   w==;
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; 
   d="scan'208";a="182927623"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Oct 2022 22:04:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sun, 2 Oct 2022 22:04:28 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Sun, 2 Oct 2022 22:04:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IADw9CZwADyyiTrwZzuy8zNRfMi5cPVi3E7jN9QGtNmmXm4yYF/Re4QMHLFd/cJsyxVRgim+FXVggnJDBU5S3byiw06AccCX5wTnfUAqYb2E5FmyHoeCHGWvhB1qdcZ2D+ijVjthGdjKKcL6DnwqVoLlyBIZtMAPzl9SqICs9fxks0Wg/0dlJsGIfUk4ctwSuB/RkKmKjmVKEMr7LyTEj4HPSO7DEIwW33XikSenuo9BQsWWFmvUcuDJMC75bz2svSH+VBz47L72GC6VB0f3VtLmu+sSdH1A1XR30LH+8Eeov6qG2xP81Xgzg4mEYrRAF3J8VwGrnInuay9ZTTWFQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDG9L/d/UQh5TLLfFHE1o4Lfd5kX/M+2uuE1gk2egew=;
 b=HJ7DfoXwT7bql65AasUUmmysrFQNDwDDog4mqeckpLdcDlOqPNYiatk49sPKs9cBnpXVIuI7aXD+Pp+GL1pwX8GriAZzbwfr0pOxvhQy4QA6n3XiQoDQauyt/outUZR3LsFMOq5LtYY9KFKir0Ng8pdxZ2/nR5+QdHhycVGRUrciqRLISj5YF6n3tmTU/uHvylE76zJuHyJaKOz2hQoWum8riqQDmCs2pKIBFdbhrbJVb7k2keJ4AfuQgAEn9eJWnioEQkl/W0h9pCTPDpJcLAgmlgetRpuYEYolWIhBJHIqY6FswMv/xBjoqiLEAvvj2WL649xBEJdtYgA3LBK3Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDG9L/d/UQh5TLLfFHE1o4Lfd5kX/M+2uuE1gk2egew=;
 b=Df6GMmUL0rTND+KG18vjt+YKhlvwCtlwGeVCm0GzgD5QA+PB/YsBggdSmJ3mJ6knArFKWlIWyvb87Y1InuH7GtaRVZYwiv9M6emcY0Ddw+JbkG0oi8iaKFNOO9llErxmfvHBHXQSU0iVfn+i/39qOGTPP17ojSLqi/PaRuHeFOw=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 DS0PR11MB6542.namprd11.prod.outlook.com (2603:10b6:8:d2::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.20; Mon, 3 Oct 2022 05:04:27 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::416e:c09:92d7:fd37]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::416e:c09:92d7:fd37%7]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 05:04:26 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mika.westerberg@linux.intel.com>, <pratyush@kernel.org>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <Takahiro.Kuwano@infineon.com>, <hongyu.ning@intel.com>,
	<linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2] mtd: spi-nor: core: Ignore -ENOTSUPP in spi_nor_init()
Thread-Topic: [PATCH v2] mtd: spi-nor: core: Ignore -ENOTSUPP in
 spi_nor_init()
Thread-Index: AQHY1uWcePCZ/Lfg1E+SS6lAXFxdag==
Date: Mon, 3 Oct 2022 05:04:26 +0000
Message-ID: <1da83197-fa6c-8cd9-1e81-c317db1bccf3@microchip.com>
References: <20220923093441.3178-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20220923093441.3178-1-mika.westerberg@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6479:EE_|DS0PR11MB6542:EE_
x-ms-office365-filtering-correlation-id: b87c878e-804d-4605-1135-08daa4fcbe82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JflLju4qB//g9p86JhQ13sPS70ILP4mmLXjE66npjNIUI1zuPY4aSs9C3n0SaJgSiKx7Jn1T4rL76XpspiGfHBJVzucCan/qffun6hDmL1eAXii05RXrF6JbxWolLyT0EkJBBT2C5jc2KLe0s0nC2FnUbcOaTkQRiWfuxg+BnUjcq4xvT3HIcmZfYDFEDV5KqEWHZLagYV1ZPNpLiBvCJRfeXlJAi5Kfl660qHUGq4r/oos6KQqz1E9KTAMIUWp+SpyYwJWrda7MENYwdBzCF7j/FOzgC1qIwqaFO5RIYmUgqZhF+aiAXk2tSkTb4Efgcbe9BMC1XuQB9FHoYA8QAGvuYhxbmbOUpfeq6eavgHmXPaXxuOrWr6K5vGPU9vRPRb6pqSsZGLOz+U4gdXwkGRI6kmmCtX2nCuHpL4gAcd4beNdmOzOidlC5GXXfUO1hMgO1IA5pSYSNnTKAPd9CDxfDatU7nb2tODcT0ORqZ93SbIipwA/D4S9KQNUNsVRA4XooCxHc04oIqdTtzecjFgY/Y19sPCKnsh6MpzwnT93KrI/xj0FbP4cnA0vWdvZge+l2+KRM0tM7Aam9ihg7LLRomBVVtST0Jd7Lda3d7+9YOyljWzvLbQdPyQ/J9XnTVKWW7ZrCbCCScO00u1268pfQsrntFz/8RcNjntMVLYrOhRbAUhS+UeWIgmXIyz0VD0276OX+3NSZ7U5B8KdlmakyqZ9/1l9/sXa18/sjdn48kq2q1Cj9ec6J2L2LX4/f+6K0Sy6inKa2P187lVS57zc5hKAkRJ2cli/U7f0WaOi7Q8Tq4hLe5zw8fgV1Ff0DLQoN/7K+9XbJl7uud4lgKOPjpU9a/6TP3EjXubKOLs8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(396003)(366004)(346002)(39860400002)(451199015)(122000001)(110136005)(4326008)(966005)(316002)(31696002)(8936002)(36756003)(2906002)(66446008)(66556008)(41300700001)(64756008)(38070700005)(66476007)(8676002)(76116006)(66946007)(91956017)(54906003)(186003)(5660300002)(6512007)(6506007)(478600001)(2616005)(71200400001)(26005)(53546011)(6486002)(38100700002)(86362001)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WXpkNnpZdjFwZVpmSmd0U1pSM1RkMi9nSTNvemlXdEJwYkEyLzZ0N3FUeUsw?=
 =?utf-8?B?anRjTWVaT0c1R2FGR3BwSG1YZ1RJQ3A2VjFuNy92OWUxUjY5U0paeEZzV1Zx?=
 =?utf-8?B?c0FhYm1QMkp5SS9RQjVSeWJua0ZjQStZWld2TDJqUWhQQXpiQU1OQVFBTHZP?=
 =?utf-8?B?NS9EbXNSUkRjU214OW8yVWY2SXIyRURaVGVWMkVlMGx3aUpUb0RYZnRCNVZZ?=
 =?utf-8?B?NnVkalVWczNtNXhQUFcxd1l5UlFpNS8vUXNxcHIwRFZYYlhuWDJhTnRUMkdH?=
 =?utf-8?B?cTZzVlNiK1BIS3d0MU53a3dUTE5DR01kcVc0ejljQzBPd1o0b3BIVFFVL3Z6?=
 =?utf-8?B?WHdGOGFxcmpkRTJuZy9saU53VTY4Wk8wVEE1ZUpNS3A2aThWZnF0VDk5byt2?=
 =?utf-8?B?T1RlMFk0d21ubGZWRVh6K2xWQXBxNGhJa3FOSnplanF0MlZ0V1pkSURpYzFN?=
 =?utf-8?B?TEJrS1I3TXNpMDJab1ZpSzN6WUhrVmZVc3p2azJXNml3VW1zUTd5eDl6ODhr?=
 =?utf-8?B?V2l3L2xjdE1VZUVDcVg0ZXBnVlJzZ1pJWldYOWdvM2FKWVBaMnc0bTc5cTFn?=
 =?utf-8?B?SDRURTNVUHErNy9HeGZkbGxjYWxSaGtiOU5hVXpCSTRYRk5WdGFPZTY5c3R4?=
 =?utf-8?B?bDRzeFpBaVlxSjJoSnlVUHlmODRTc3AwMTlsajNkSG5kVERrK3JKdEdhQ0ZI?=
 =?utf-8?B?dTlDZTFZQzdJSVJxMEZUaWdjZzhDMzhJaGptelhqcVBxMFVuK3c3MzVRWHR6?=
 =?utf-8?B?U3NkTE5SMzNlZnU3UUg1d3ZTQW0vWHkwTDB4dEdZT01qTitKNVU5b2pXYURG?=
 =?utf-8?B?b0d3WHhVbHNOYjBESW1JMEgyRFZvNDQzNXFuSGdMYUNLdmdscHRVUDhjUDNv?=
 =?utf-8?B?KzdKdUVrUDdObmd3bU9ld0NkbndlVmZ1akcxWUpUc2tjbUJhRDdyaGpyR3hm?=
 =?utf-8?B?eDFack5saENnYXNpR3JaMUc5aG02V3N0Tzd5SGhnMHlyU2c1TGdJcmZ1Yk1a?=
 =?utf-8?B?cFFGNHUvMEkwSENWcGF1YzhIdzAyL2lRN1Z4MnMxK01hb3Z3K3VkVVExWGo5?=
 =?utf-8?B?b1gyeUx2WW1YOWZpYjhDeEp3NUMvWmROTjR3TWJFNTBhMjRGUlJDOC9GYlJV?=
 =?utf-8?B?dGhDRWNkSUt4WkUyY2FRS0MyYURaWlh0K2RLMG5iZWZQZWlUTzJzeEJvZEFl?=
 =?utf-8?B?V1Y5VnBxRUxrQ1o1WHdZTERLMnB1RmZoWVdjVjFhem9QalNtOWdsZ280VUw4?=
 =?utf-8?B?M2J3TjVTbVJxdVFJYkFiTGxneTBMVXUyVWViSnZOQTBMd243aGpGQmNqQzRE?=
 =?utf-8?B?cldjeGtBN2FoM1dKdEdaWXp6dDgvYVJrMHlyeDJCT3RSUzdwQjNYUkowcXB2?=
 =?utf-8?B?WXIyU2c3ZlpsbGRLdnkwT09TTjlpeGxzUFpiOGJGaDV5Q2lBVEdOWWtHV0J1?=
 =?utf-8?B?M3U5eEZjRFVVNGlrVDA4RmtUQ3NlMUVnKzl5RW5zZjlhK2N5VVRGUFJ2WEt1?=
 =?utf-8?B?ZTcvdWs0a2NQRFhLZlFHdlhPZWJhdmJQREFJTGpwOU55OWZOWEtiMWdEejZQ?=
 =?utf-8?B?Z0ptTEllNlQ1TURDcXNWZXRlV1JMWmpUNnN5RlVxSUhtSTNrdytzSGNadWJN?=
 =?utf-8?B?WVAvVi8rNnNyTDJKU2M1TkNweEk4VG1memRDNmVWOERRVGZ1NVhobUsxQmIr?=
 =?utf-8?B?R05wVmRVWHFQSHpqM0h2NnZjcU43MnNlKzh5b2lrSEZ2QkdXcThHRUdTZzlW?=
 =?utf-8?B?SCt6OW5MaWQ1VlpEMzZvazlHUEdRYUpuZndSMDNJWEZISS9IblBMOTlnUmhM?=
 =?utf-8?B?Qnh3K1VpU29hUTdwNXJ3ODZ5d0RXNkpoV2RqeStqUXJzWXVZaDhHbUo0WGsr?=
 =?utf-8?B?Q05TaEoxbFkvZEJOQWVKWGNwd3dKYUwwTjhpR0hYUmYwZVQrYzQ0bFZhU3Ez?=
 =?utf-8?B?MXhVQUwrU1F0MDJoL2FHMFNySWJsbHVvMDd6NmdXd1dMQzd6U0x6VHhDVDUr?=
 =?utf-8?B?ZXJVRkxLY2JscytnQXhVWmdvVG02MEtXcXhzZldNbEdLQmJ0c3ZhQWJEWXp6?=
 =?utf-8?B?NGZnZEpsNlRPemlpV05EOTl2YldtUDc1QVJqUGtaZlhUYzh2UkliV1lLcjRT?=
 =?utf-8?B?VHZvaXN5eGNaK0pSMDllQkV5QndaTjExck43SDJzV1NhOGJsSExscjl3UHRl?=
 =?utf-8?B?Ync9PQ==?=
Content-ID: <97E7E89524580C47827E9A76B8A0E7E7@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b87c878e-804d-4605-1135-08daa4fcbe82
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2022 05:04:26.1099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gqtwNPJi9ZtfyPxWJzV101XEeKk4DZIwCoDuaXxsf3wxAkrJ58ZkDrqWlnW+OnRJd3od07NAIhCyTtJGal8Fhf8DvurxjO8qUGu2TpcXdG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6542
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221002_220439_734455_7E1EB5DB 
X-CRM114-Status: GOOD (  25.17  )
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

On 9/23/22 12:34, Mika Westerberg wrote:

Hi, Mika,

> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The Intel SPI-NOR controller does not support the 4-byte address opcode
> so ->set_4byte_addr_mode() ends up returning -ENOTSUPP and the SPI flash
> chip probe fail like this:
> 
>   [ 12.291082] spi-nor: probe of spi0.0 failed with error -524
> 
> Whereas previously before commit 08412e72afba ("mtd: spi-nor: core:
> Return error code from set_4byte_addr_mode()") it worked just fine.
> 
> Fix this by ignoring -ENOTSUPP in spi_nor_init().
> 
> Fixes: 08412e72afba ("mtd: spi-nor: core: Return error code from set_4byte_addr_mode()")
> Cc: stable@vger.kernel.org
> Reported-by: Hongyu Ning <hongyu.ning@intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
> The previous version of the patch (the revert) can be found here:
> 
>   https://lore.kernel.org/linux-mtd/20220922134824.46758-1-mika.westerberg@linux.intel.com/
> 
> In this version we ignore -ENOTSUPP but the other error codes will be
> passed to the caller.
> 
>  drivers/mtd/spi-nor/core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index f2c64006f8d7..bee8fc4c9f07 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2724,7 +2724,9 @@ static int spi_nor_init(struct spi_nor *nor)
>                  */
>                 WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
>                           "enabling reset hack; may not recover from unexpected reboots\n");
> -               return nor->params->set_4byte_addr_mode(nor, true);
> +               err = nor->params->set_4byte_addr_mode(nor, true);
> +               if (err && err != -ENOTSUPP)
> +                       return err;
>         }

So as of now if you use a flash larger than 16 MBytes, you can't access above 16 MBytes,
right? What happens at the controller side when it receives a nor->addr_nbytes of value 4?

Shouldn't spi_mem_supports_op() trim the 4-byte ops?

The better fix to me would be to extend the SPI NOR core to support the Extended Address
Register which consists of the 4th byte of memory address when the flash is operated
in 3-byte address mode.

-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
