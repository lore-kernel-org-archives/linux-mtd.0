Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B8AC54E49
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Feb 2024 10:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yn+phrxha/fSUsNGeUogp3W7hxK7xMf3YataxrPqXC8=; b=XZIZq1kYY8NZNR
	phNFNcd15CJFErhtFK0PJk5pDx8vCvli6tZGQmWo/IxXgnxTTtQRdEhCyOOSQRBOTstb7FYVcXU2i
	mOSE6SrmXesx5xv5Uh1cHzdpmSOKUPQDf94cgw0FJbWd17hdgboNOUYkizgBrxNJFoFu+vlVPDGWt
	xyKu6kjva1DVOw+NlCI3JxFcMvW5XS/DAxG2RyggpMT+iLanjF/3P8qD5DZQ5C6IGG6HJSqyN/tV3
	IB5ZimBF9EjlQE/LSe59D17zvAUZnMLRc1WDBv2uXs9hOPXnMguGsKoNtzyRFgl8IUjYErD2eqPBJ
	y0kGld0gs6jHHXAKijew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSsD-00000008wgd-3sgb;
	Fri, 23 Feb 2024 10:33:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSpa-00000008vtY-2feq
	for linux-mtd@bombadil.infradead.org;
	Fri, 23 Feb 2024 10:31:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=tizoKZqfnB9U2PNwWV9RiRnCodHjgaylBM24A1bRMic=; b=a9B6YNnylBpo9DyB+cTIpASUN6
	6n489WTeAurorMWtJEHKLiDwH1TOMST8NXxh9uVflTarUe0fo4JbV0PnNatYXFM3SoOOx6tBOMtSH
	nFbo4enrAjlurEmYzok10MXt5R1MbvxP04VKag/gW8dZ95yO3Coe58Hxf06gJkM9B6kI8IMSaQ10S
	cal2MURmB6igWkmTUzyM0XDd8Ufdp2kc9Bf6fxnrE61gH3TrUN5LhoOem8rWAuZ3OH/RDqwDbjjCe
	UDBUIo1kFWVWEKr1q+FArbg2BMlmFSDPEpJNJEvFXcg1GRD0vx2ABa4ep9iiicYyp/rOyCiFnZLBn
	nUmKbspA==;
Received: from mail-sy4aus01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2819::800] helo=AUS01-SY4-obe.outbound.protection.outlook.com)
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSpT-00000006gdF-3hVI
	for linux-mtd@lists.infradead.org;
	Fri, 23 Feb 2024 10:31:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4khNN8ezPOADW9SuxIWN+IscuBUNiXOPplV2m9kv9slRYgVGi5ghsXls8dMtTMrtOTza9dxgOWLi1TXtPW2jIsHCYHHbIbDi6/jVDiF9zYZ5dZQPR6ZuxgPxtVRNgn4xYCfi9QmuNLqpRikG3Va86J+D2yCFxYV9w7RJzX12QgMSCOCvncphO+y1Qjrbq3L8imtLDQE+crtjCShYXFLBVLwBrG1cvXLeFGSKkdRwzi7EN5yXdwjyehnsPSFIAO6WEcf/8Wpj4aDd6vw4o/nHyQvql4MkANASLnKeVZ4yW/efPrgb9HGNh+FpaAb2EhzW6/ql3MFMV98NdCnfwnMSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tizoKZqfnB9U2PNwWV9RiRnCodHjgaylBM24A1bRMic=;
 b=Vwlwj8UNqalQnczjTOyhlXS7uMmJuDxitDzwXLDs862kPz0Kv9E3+ihjyYY5W1myQOzBS02KFwlS+SDInPgF0aQNN4evlBHydI0YutOKi5sUu9TEJFgLLmcW+bgQesNEyfdOSSeQHO7ZhqECimVSn0k3rzO/ZL00tme7i4B6LTHkvbW0e36AiolYMtIQnavPFIAPIwqfzLm26PKoYtGnsPAI5DJSYcRyZLlNjMcS23PDi6jcNS503q1JA25nHYOzYDr29pQ/+m2Fl7pa020Wkus9PSSGRhFUYCMCrKDskwhVQUizxuyoRf3xbdPHqE1jY27XA3dluFFi0CUD1Y9cIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tizoKZqfnB9U2PNwWV9RiRnCodHjgaylBM24A1bRMic=;
 b=XvlbvF2cdt8u7eoIV6e9Ny5SOS/FYzNy1JFaxtgDl8I+w7sQ8vN6plQrFIGU4ncGw83oKObaoMfMX/S8mc2opgo5QWA8uZyq1I49MDhsErNAPUuY11cabhtA4XRiQubo7UF/v0xM7RLuW5WRKTH/qZ4wk1p/7CCnbFNP79jlobFvlviF0jQxTpUh6bah6eAscWSPV33G8K7hYJBS/GJnVlFkdPSScPKEVdS3arzuhtEyrOw5mq4iX36I5sZhp8xmQUMw3jMHjUWLPGzYSabJh+7Dg6tK615H7JLVgyl+TceM3n+7bsaT9wJYyfM/1r6gEd8pMUM0q92yXMhArxAW8Q==
Received: from MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:159::11)
 by ME4P282MB1016.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:93::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Fri, 23 Feb
 2024 10:14:22 +0000
Received: from MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
 ([fe80::2df1:7ef3:3508:96f]) by MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
 ([fe80::2df1:7ef3:3508:96f%6]) with mapi id 15.20.7316.023; Fri, 23 Feb 2024
 10:14:22 +0000
From: Ryder Wang <rydercoding@hotmail.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "richard@nod.at" <richard@nod.at>
Subject: Re: ubi: why ubi wear leveling always pick highly worn-out free
 physical eraseblock 
Thread-Topic: ubi: why ubi wear leveling always pick highly worn-out free
 physical eraseblock 
Thread-Index: AQHaZkERf0UY5b7vQEqkpHEYOieW6g==
Date: Fri, 23 Feb 2024 10:14:21 +0000
Message-ID: <MEYP282MB31641A84730F7FB15578662DBF552@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
References: <MEYP282MB3164FE84067710E5AC8D34A9BF7A2@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
 <MEYP282MB3164D303B64CFF576D2FD741BF552@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
 <c14e432f-a03d-782b-48f5-f77577e29e83@huawei.com>
In-Reply-To: <c14e432f-a03d-782b-48f5-f77577e29e83@huawei.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [29ZPHLvOQ02xK8rUrGxActEW3d6jAtkP]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MEYP282MB3164:EE_|ME4P282MB1016:EE_
x-ms-office365-filtering-correlation-id: fcbe6f3b-56f2-41ad-ec4e-08dc34583456
x-ms-exchange-slblob-mailprops: WaIXnCbdHrP7zQAFPoQExaanRDw7qyhNhYMTKlsq5BzhHLIX/oruZfAuTsGRYS9amOlc2K+FliGkydEn72TOnrL3L3j/qUlYOKYQqUOOxZ/O8xmveEgWDxBZTHPU4Bf96a525xb7fkWKl1yrh6v96IbrAkilBTcB6FWPCaTezJZYuLYXISpy9WWzKBLjybmUBLcnSwzB+8zAclR9AsBpb/YK+fMHBnnpq4B1xJfwutDYFhHRWugsilgHLbggWfycoNOxAGwAdPL9AFLd/l8Kjmr2XxcewWz4gEx9P6wZ9QELAph64JDmAv9TNRmy+h0dfBL3+HcUfIGGKOtuHzKh37au5DzbIR++OxQKLz+G9/6U04mMmJbb1KS3R0Q8QM8vhHms2pMgmuWJAi9UXlwV1jxw6/cPII4DuOeqJNzPn7Bpqrj4E1JFBCMdvQqk/V1uZnVdLG1BOYl4Vl6Xw6/srEUag1R9Scptt/sG65+IDUfCW4dzkI3K+qerTuS37wNyXKYWu9Jyja6PB1paMiAzG92ohFRGqaCGjaG0KlHpKEkel0+lCA6sLutp3GUYKVMrMnd7nwFGsd6EOBPPK1Qdtjq2ujMHW2IXAS7bahLpQ7RTpgynyb7B9zZltDoq0gFEOkKn3JlviNqtFQQivJYAEPUl7AJFaz1NYFXacY6FpTocm2AjAmVkXw8KG2aS4czEo/Pfr+/douuWxVXwVBJvjR2O8KgbpynHbwHYXWkNyX8FaXxHjwMHp4sOhNb65eXfwlMR4guWs7E=
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SoLNgptlVmxfOaOerR/cntlxHDIZLeD1dNfVm0RzXS0flxbnrF+i/Rn2vknxAMArl2EHOmIHGlJDn1YuJxbQahFAhimLl4QA25b6TP9imQXgalbrYmm5GT+ox6iufCxJik55snAwyrlaUiJXgTSY5GvaDjQWvUnnQ38xpkAc+QeZShgVKLVWqSf1Ug8GZka6ab45XYeoJjQhXLEao0GiPHDnl1vLkWiynYpubObrXVJ89ID729NrJerO1pOQLLKN4uPk+Vb3j2gr3rHSV8xPRsjG6nuMPzCVL9aiVdSbG2c3eYHxX6UPyXbkzVWXHipE2zkOUlyLiL7PkdGMOSt512pKdwP47bl0gELIiTNiaxzZJIqO0YniT82Q8xF1ZeGOg4ynVGyWqSB7YclrwpnEU2CjXx30suzdlZQqzbNi3VYjqRzfF3EpWbI9GhC4olWLGEblIGGYAqeon1Z4FkqpliO6heYAgjx5CDSLujmIsGfsGnDExjLhM20J2XgB1EgvsavUxeYrDngiCM82UysblytQdrazxI9WaxNhGZWOuOHh8t7Hxfk+T/EgFOjUM5sW
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?N2k2dVpjQlAySTNFVDF3bThON3NNcE9hdUtaN2ttRzM1NXJuSEtwbmRz?=
 =?iso-2022-jp?B?MWhTUlJLUEs4a0ZFTkR1bktSRkJJR3pZQVl6RldHSEU0QlJaYzBwMkRV?=
 =?iso-2022-jp?B?bmZ0aUJrL3ZSdktKTmxrNm4vZzBxKzhtTlRNSGlRaEVTYVBGQWlKWncy?=
 =?iso-2022-jp?B?eUVEYmMrbWVOWmp6MWU4bFQxWVBUTTNxa2RmNm8xMWtDbUZsc2NJZ1NR?=
 =?iso-2022-jp?B?MnEzaFlFYzN2eVJpZE1SZzVWeW5IdDVwMWxPRFRxL1dxK3pXNW5aVkZu?=
 =?iso-2022-jp?B?bUZPREZmQ2wvRDU5MkdEbWpyTndsLzJDcXNHM0sxVTdJN1k3d0YrRTl0?=
 =?iso-2022-jp?B?dGNqK1JSREowNEdBRjB1OWo0NVNHb09Mb2MwdjB0Smg0STd2SzZQZFJr?=
 =?iso-2022-jp?B?aENYbURBdFZPeHM0V1ZlbWw3dEhOdU1UU2t0V2VCVFdSdktCL29sMHFl?=
 =?iso-2022-jp?B?YUcydjhYblZUb1JXcnUrOSt5R3NIVWF1RkVqTE1SakE3N29xSmwxV3gy?=
 =?iso-2022-jp?B?K1hMcEZHOXVqUG1yRkljaCtpUzdhQU5UZlNQMGFFK2pXVkI0cnZmRFRq?=
 =?iso-2022-jp?B?bVBYaXh4R1BJYzh0TjFidVMzY3d2SHRIYUJzaG96Z1lPbFM4cktWMnY5?=
 =?iso-2022-jp?B?Sm41cmhIM2IzU0FTc2g4ZVEzZEJkcEhIQWpvMk9aVzRkNWt0OFUya0pQ?=
 =?iso-2022-jp?B?UEdDN0RmOWdZVmJIS1JES2tId296NDZTR2RKb1J5anFldjQ1UStjWFYy?=
 =?iso-2022-jp?B?WGNZdzVwUmZCaUI5eWtraTJDU1R6T3FUeVV0Mmh4OEd5dEtlbWVlQzN6?=
 =?iso-2022-jp?B?a1JJRlhhZ1Qwa2J5dDg1cXhnVW5JS3F1L2lNY0tQRmd6WEQyNTlIM0FL?=
 =?iso-2022-jp?B?aTRuZXh0VjZmT2VmbGhISklzSUdDK1h5VkxZVkpPRFdLOWV4Z1d0WUJQ?=
 =?iso-2022-jp?B?TVZ1bU93cjBwNDEwU1kvMnR0U2VaWmRtWFZZd3FHOW04K2ZrWnBueThm?=
 =?iso-2022-jp?B?SHFRYWM0N2tLalRFMVhoT0xqTnRHMEx4Uk1BWnFzL1F0ajdleGY5T29W?=
 =?iso-2022-jp?B?M29DNC9CZDY3dmNrVllLN0ZINjFPME9yT0tIY0pTUmpTeTBqY28rV2lX?=
 =?iso-2022-jp?B?T1ErcUZ5WlFFcFQ4QllHSE83b1dyV0xhY01ZVXBURUxodWppOWhYaWlY?=
 =?iso-2022-jp?B?cVhqMFUyc0JybUVUSnNZMWUzQkpuN2FHWmlJdCtpd2RZWkIvSURFNGZN?=
 =?iso-2022-jp?B?UlFNdDVjeGRNaFlPcXpwOG9hQzlrNXpnbkh0QXJnVi9POHlQODRYVFJR?=
 =?iso-2022-jp?B?TjE0aWhJUzNHMmxGdTNYaU1KVXV6d2N4dkMxcjZ1N2xDWTJHS1lsYkFh?=
 =?iso-2022-jp?B?bXVGUXRua2hpenZzSkZ6aDhOV1JtNjdpWFJkRUFTTG1NWHRrelIyK29L?=
 =?iso-2022-jp?B?RTRXWldob0dMV2N0dEtyL3VURVlsK2JTUmN1YkpXYkxwcVdTR3hOZ1k3?=
 =?iso-2022-jp?B?MTN6UDZ1SjFrRXdxcWttcU1NOFZHSS9DSkVheUJiSW9vOTBGVGlTUFhz?=
 =?iso-2022-jp?B?eDJIOGdjNlhOUWJ1Rk5UZG1vTlY5d29pQkFrZDVySUVEakY5ZUF1RDdJ?=
 =?iso-2022-jp?B?NEVhSUFqODhnZVQ1N1d6QUNzeStBbi9NVktZYXU5WFVDam00bTNodmlt?=
 =?iso-2022-jp?B?OWQxUU03WUM0WHZKT1JzUWlLTDh0cEMydmxLWVV1RDc5RVdqRDZkb2hh?=
 =?iso-2022-jp?B?azJyRHgvVHBrUXpEOGJNVDFLRFdpdm9yZkpWR0NTNnlVbDQxNWs2clE9?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: fcbe6f3b-56f2-41ad-ec4e-08dc34583456
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 10:14:21.9073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME4P282MB1016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_103055_966760_357453D7 
X-CRM114-Status: GOOD (  10.02  )
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
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Zhihao,

Thanks for your reply.

You explained why e1 and e2 use picked to compare with CONFIG_MTD_UBI_WL_THRESHOLD to decide whether WL is needed. That's right as I also mentioned. However, the point is that why such high worn-out free physical eraseblock (in ubi->free tree) should be used to store the data of e1? High worn-out PEB should always be avoided to use (low worn-out PEB of ubi->free tree should be preferred), right?

________________________________________
From: Zhihao Cheng <chengzhihao1@huawei.com>
Sent: Friday, February 23, 2024 15:11
To: Ryder Wang; linux-mtd@lists.infradead.org; richard@nod.at
Subject: Re: ubi: why ubi wear leveling always pick highly worn-out free physical eraseblock as the mov_to target

在 2024/2/23 11:27, Ryder Wang 写道:
> Refer to the ubi source code:
> wear_leveling_worker
>    e2 = get_peb_for_wl(ubi)
>      e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
>
> The function find_wl_entry() always find the  highly worn-out free physical eraseblock (e2):
> 1. It's good to check such PEB (e2) to decide whether the following wear leveling procedure should be continued according to UBI_WL_THRESHOLD.
> 2. But personally I can't understand why such high worn-out free physical eraseblock should also be used as target PEB(move_to) to store the move_from data for wear leveling purpose. Will it be much more reasonable to use low worn-out free physical eraseblock (from ubi->free tree) in this case for more perfect wear leveling?.
>

Normally, e1 is the smaller ec counter picked from ubi->used, e2 is
bigger ec counter picked from ubi->free, the wear-leveling worker
follows that rule which is based on the realization of free PEBs fetching.
First, let's talk about the simplest case without fastmap, assumpt that
CONFIG_MTD_UBI_WL_THRESHOLD=2, there are total 3 PEBs.
Only 1 EB(erase block) is used, then free it, and repeat the process
forvever. According to the implementation in
ubi_wl_get_peb->wl_get_wle->find_mean_wl_entry, the ubi->free tree will
change like:
(1,1,1) -> (1,1,2) -> (1,2,2) -> (1,2,3) -> (1,3,3) -> ... -> (1,4,5) ->
(2,4,5), which means that wear-leveling worker is not needed, because
find_mean_wl_entry has made sure that 'max_ec - min_ec <= 2 *
CONFIG_MTD_UBI_WL_THRESHOLD'. Similar, when there are more EBs are used
and freed, there is no need to trigger wear-leveling work.
However, if one free PEB is taken and not be freed, other free PEBs are
taken and freed, like:
ubi->used: 1
ubi->free: (1, 1) -> (1, 2) -> ... (x, y)
After a while, min(x,y) - 1 will be greater than
2*CONFIG_MTD_UBI_WL_THRESHOLD. Then, wear-leveling should start working,
cold data always takes certain PEB for a long time, which causes PEBs
with smaller ec counter gather in ubi->used and PEBs with bigger ec
counter gather in ubi->freed.
I think that's the explainations of the rule how to pick e1/e2.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
