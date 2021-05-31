Return-Path: <SRS0=sw+G=K2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E70EDC47082
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 08:02:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2F1460FE3
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 08:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2F1460FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M2HnInYPgkAIoAyDWe2WKZujuR44xd3V5ZDOPuor9L8=; b=pu/c61vP7TjVNa
	3BrxGPo1mXhxVWrfT8/5/1axONBn77sh+C2ZIuwPlSF9t4fB7VuQ/PRsSEGIbJw+lehqllf0YHz0p
	MPrc/GHkSNtuYPFV0fzYJAjzB+BRYpoiSU5JvwWmPvO3DutDaDrpNSlTnuYQ9QQiZ4UCt/0ZczgZ6
	LZJYjaq6TAUNleoKqvJUA/BbCSgPmRCITP9blIvgQmjlXrZgp+Vdlv869m9XNSCyTrn8+FxT64m4e
	DJ8xNst4YUly5B+Gi9ewwiO58jyrHKhOmYvMSa218T1a2+Z0WiP3qMxnycjm77e0tRnRf2eFcncd9
	nZKJDrpPhoD8i+lHRdsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lncrG-00BJ8n-2h; Mon, 31 May 2021 08:01:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lncrB-00BJ6t-1m
 for linux-mtd@lists.infradead.org; Mon, 31 May 2021 08:01:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1622448064; x=1653984064;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=itPxXjx+cF3QygUszFoOlfDAR4CQKf/mOPTGJ9FxvZQ=;
 b=AUrrcvSCSpF6/x/65Pw0JaZACDSgG+254R2LxRBwOKQkafALLmGdGTtR
 tI5RB/rHxzUHpPD0caM9qJidJNWV7ieyqAVmEqkpn0ExUmHV0kX3zQDbz
 f1Y3SKxTD6ZuLrn2Cqp4aTBIeuGH19OuyQWoiGJ9eH7goOgKwYiPuBoH7
 1YxINXMg87bDSVDsc6bsc1IHLmgIb9HmBPd7+5QTzx11xbKxG/Bjgv9cs
 fDlbjGRtCAZlDNyf7EpyYUDL6eRAFjQDyndhy/33hwVyF2SZQteXAeXNW
 Fz/mhjYfabDVlANoKV5iSzqfNt/8yEZrbsqUju4+cJDV6HK3FBnpmb7iu Q==;
IronPort-SDR: LnHG4AN3Y8jNC2gIYdbd+ZHvq2UXswVdkoRczpiMdpyg6/v+BXevNbDwfZXgRH7scX9EpBXYCW
 exe/Fy7z6E7mvM+mHRvkPjXt/cD/tkVEvqocgoLxyz76P/rv8v7NqUGVDPm5o+gkgq49FwXvYL
 bWSLLpLM5c028q0oAeTN9X85+N4n2fYo59myuqWv/vFT3GV1VOz95BIYBirYOsb1DEixubKV8T
 j7L4XetaqOkvEDHxcnUh/tblj7TjKVGpmxp3NG8Gv7R3EigmMq24K/HDnrlyj6xF7lJZqiBKFS
 J/w=
X-IronPort-AV: E=Sophos;i="5.83,236,1616482800"; d="scan'208";a="130073848"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 May 2021 01:01:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 01:01:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 31 May 2021 01:01:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+LyjIQSWQdvsytEn/JYfLLwNvw8mWo98pkdMt9sQlV+opYu54duAYBBKel1dPHHnvTFnBp7GUCVvNiSenCJWFV9ZACpvyuKOf/84yVFvJOCflN5mnnGs3Bv+Wx7bEcZKX5eqV7PxI1fUmOIQgeKBRmijaPlx3VEE2cIfDICF3DCGemlZQ9oHuDnZOX3WjW5mMDuorbXdZUdPBBGTakU+41rc9aNq/22+T2J8pi0k0QcbBKyHOEm152gZm82dPpRmWFMFqx7fUT7OeNTjPizP92N5CdbmiZG8bwsACqoiJ6k6M9gtrVZGMFw3JxgkezmCDeZ/uTu5Y+xMkkGg0zbdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itPxXjx+cF3QygUszFoOlfDAR4CQKf/mOPTGJ9FxvZQ=;
 b=LVig17CVopAAKq/LWz01IPqfe2UxNeIVzNFFBR+sE7rHRTDsaCQCdTW42EUKQFrJW2AZlHvFD0cKJEms2cM9mYuQ1777Ewfg3jAjz9RF1os9dfNLoy0wCdMeXbzo7zgtjFBX7/Ek0/SHi0enGDUmWzKsS8R1XTwwsFAtp8p99hZj9LMmYDXEZWoaG4WdpdwQxCL8jC1hE6bY7DYUYvb+BLKDpvFtyi04tywxh+4GXfm08T1LkbEvzcG0XN1u6SplxQIAgyKSZ7+5To76WDvveJPwOSpl5ZVkjxnvwyhOPQhpYFj+GHFWro/pciqBpC73mSPU1xceeWCerJqGluMJ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itPxXjx+cF3QygUszFoOlfDAR4CQKf/mOPTGJ9FxvZQ=;
 b=RKxg8YuWOje1d6JKlznZzXubm/3YGme6R9FVqZHh7VIH7/21cyCg3o/n6Ayx1N5HK0/FhePTNhzJGTgJ66Dw2ANAxl8u1YjoWQjYuPqMp3Nux5O1brMuFDNJno1qHywNZltIGLidkt2cv6rRcvkS1/QoN8t/xO6BQL8+fo56/BU=
Received: from CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9)
 by MWHPR1101MB2365.namprd11.prod.outlook.com (2603:10b6:300:74::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Mon, 31 May
 2021 08:00:58 +0000
Received: from CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::1c4:1014:a541:e370]) by CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::1c4:1014:a541:e370%4]) with mapi id 15.20.4173.029; Mon, 31 May 2021
 08:00:58 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v3 1/3] mtd: spi-nor: otp: fix access to security
 registers in 4 byte mode
Thread-Topic: [PATCH v3 1/3] mtd: spi-nor: otp: fix access to security
 registers in 4 byte mode
Thread-Index: AQHXVfMWCjsPzVIZekeG1VBfbNM9Zg==
Date: Mon, 31 May 2021 08:00:58 +0000
Message-ID: <0cd72191-e195-eae3-f741-a3c3e38298cc@microchip.com>
References: <20210520155854.16547-1-michael@walle.cc>
 <20210520155854.16547-2-michael@walle.cc>
In-Reply-To: <20210520155854.16547-2-michael@walle.cc>
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
x-ms-office365-filtering-correlation-id: 9223ee06-e439-4b74-b194-08d9240a39db
x-ms-traffictypediagnostic: MWHPR1101MB2365:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB2365B99AED4BC9B2371E68A5F03F9@MWHPR1101MB2365.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ugzzi6QGZMCGQuxiefUIAzMBD7AqBFZpXRT7siiHoH8kaCUuXOThzOuPXpVPwqG/dJPdLd4Z9OI2BMydmrIxAn7+JcMcoKzPTthfwflHar0cda6B7f1JOYmIbNG/8cnEaUzsYBdVyjMo8tIGO9QYvmK9rlClKnKeCQcL/KvAUPsfxEOF8LPcrtyrumxOjiVm4wSZ6ChWGXeQbASzdcNHmOa3S7S66rvs7+aIL6Qc49dkJPvf7mT7aM/IqFieypFhJPC5ycjBytu8fQnbOHzzf5NIJOsSy5MlvxG+gsuuBZJRtjL8lO4MhUyTvk/V5itY7aKlLtiVetcy5jjetClQvZYYWPg1ZuGfvW0+RAzwpZ8LYfsZT0voVoFUb6yCdCuINxFA4p2EkSuVnorRkxCYYsRwPP6jzcEA8Th41JHOzDB+MTtpwq7rSqCIfpvaZC1cTnDEK2sqngeBt8LPdAnWhDcpEi1F+IsW4wa/e8urJrRWPgELpOmdIbF+XtaZj28ZsmZKvaz41BVIIre36RF04yvutHFJ16Fy86GRJQ/tSvZ3qdrU3hFEJ+AE/+RhyuBw/ZLCAbq7r/EmIANRBbmiTrXxSd0pmtcOMedJKyfcYgAIklwzdes48b9KUneuCDRAnznbexw2QFf98ZKYHppgO7EB43EtzxfsAEaih1QkMkCw0DitfBQ8F8c5X3bzJRXdwt0wTCSkadR7rOKYwWG4ZKYLp1d0bJxB0IN/bMEW3AZX7PLCl+/1826xHi3qgfaAjvmfNX8oEXYyLGGHjmLEvH4Y/+ILDWdHMPWTXwLr6TJVarrM5AVtYnAhUUOEUj2O
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(39860400002)(346002)(366004)(396003)(2906002)(6506007)(6486002)(966005)(316002)(478600001)(38100700002)(83380400001)(71200400001)(110136005)(54906003)(122000001)(15650500001)(26005)(86362001)(53546011)(36756003)(186003)(8676002)(5660300002)(66446008)(66556008)(64756008)(66946007)(66476007)(8936002)(31686004)(4326008)(91956017)(2616005)(6512007)(76116006)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?YlJZS3NvSVlpa055b3FOaERSYUpJRkRiTk9WeCtaQ0lFTUNCUndrYjZKWnJt?=
 =?utf-8?B?OGNrbDRROWlyazBKRFZSbGEyLzl0c25sN3p5azFvODdsSi92VnFwY2gwRXhC?=
 =?utf-8?B?S3V4enZwOWlidEgvZmZoUzdmUVFtaEhxcm5zT0pnWjAreVpUSXEvYWlhNXlh?=
 =?utf-8?B?VnVuZUNPRDFYN0E2WndQczdtMGtFUE1WTktJa0JGb3pOeFJwdUdSU3pSNHBM?=
 =?utf-8?B?ck00ODEvaE9ETHFWaWxwZmYwVFMzUTlUS2ZwbVZpTFc3Yi9Wb25WNHdacmRz?=
 =?utf-8?B?ZEUwdjNVNi9PSWRVTVBxdVVZZXdTOWRaWVBpSGtNR24ySld5dkNBVlJLYitI?=
 =?utf-8?B?TzRDdUNFWE5uRTA0NU40bW9xWWR1bEhhY1RwL3ZMc3FjR0dWTno1RDJyS2tF?=
 =?utf-8?B?bFVwMG4wNkR3NTFXU2IrempYQ1c3YjRWck93b0wwUG9acGVZT1ROWnRhSlNy?=
 =?utf-8?B?Qi9qaWpjZFV1T2NHZWRjdlVud1Y5dFRLNWNHQzVxV2dqR0dPN2hNeW00K3Y5?=
 =?utf-8?B?Wkh2Y25DajhBYVF4R1pQZmlydnlKWDFndHluTUJOcE5IektSd2lCOStsd21u?=
 =?utf-8?B?MHc2VTBlN2U2eGxuaWQyak9zTGlZS2wwSk9wZ0MwRjlPeTNGWHd5eWY4WnVE?=
 =?utf-8?B?MFh0TmlxRmpzVzB1bHdweVBQcFVEVjVPU09hY0xKTlA0eXBFU1ZMVXRQVmZj?=
 =?utf-8?B?bVd1d3pTTFBiN1BuaWpNT01nU082c3dHbno3RHpTdVhka3hiODQrOUtWN2dP?=
 =?utf-8?B?YXNiT2dVK1hQUWdXTDNkc0VVcW5PZzlsOXJPZEFHcVNFWGJhNkZpNDVIRGVp?=
 =?utf-8?B?QU9Pd3NPNk5mYmtGcWZZaTZ5TjJZeW1YNC9jdStKT2dWVU9RN0RPZVNsWEl3?=
 =?utf-8?B?V1J2MEUrdVJJdEFZSXJsTWROSkdXdGFwaE5CcGJlb2VUbnlwQ3dwcDc0aGtZ?=
 =?utf-8?B?NU1kbU1oZFhtSHJzeEo5a1htSXdDd1d5MGZpTWhiRk5QWHZrQ2s4Q2VyNlhu?=
 =?utf-8?B?dGE4UFdRVjlXTlV4N3FmMnNzKzZzOFJxSk9GK0RFbnVaQTFCWUNiRlkrYnJi?=
 =?utf-8?B?ekExOGkwY1Z3eTYvU1U3WWxHVndJRjByVjIydnB4SlROQ1hZS1UwMlZCa2gv?=
 =?utf-8?B?ZWxqb1lxRWNPZWVHWGdRait6ZU5iUkpRalUrUW9UMUVYZC84OGRDeVlZUnU0?=
 =?utf-8?B?eEhpL0lQRWpQT1VwQlRKclhpM3dPb2RVcDhMb01QTHRrbDdwOTgrOXdMYUxa?=
 =?utf-8?B?Y3pzSTl6TEsyei9qS3ZpV0hTMlIzQk1LQnBwY3lrNnJyQVRuSEJxS1oxTGh5?=
 =?utf-8?B?cjF6TUNvaXhyTEF3SnpFcytGQklRQW5lMTNvSXZvdFhlSjhVc09DSjlFc1Qz?=
 =?utf-8?B?WW1VMnY0dXlXUmRyV3djclRSYWl3MER0blNLT2FZeWNSTG5DNzRkSmZWdklp?=
 =?utf-8?B?ZXdqWHVsa09NeTZnM0t1WUduNEM1MlZJbzQ0Zlk1NFVjMnZwZkZRMzM0Tk84?=
 =?utf-8?B?SGlhNVZaWUFqa3JNa1BsZmN4RnRzZlo4cC92SkZPVlV3eXlEMGZYVnpZc3NH?=
 =?utf-8?B?a2lyUFlBTklMSmYwSzlNN0dxMFg4TmVmeGhyVElLUnFGbWNrSzFSQnpqaDR5?=
 =?utf-8?B?TzR6bldaaDNIMVhEaSt6T2lTbzdMaUdHTWtkYnVJU1MxMGNudWUwQU1oZ0hH?=
 =?utf-8?B?SlJJR2dEM05NdnhhWGpUM2laNEc2bWtuMzFwTkRXTXZzRFNPejVNR0VuMkF1?=
 =?utf-8?Q?MLsLaFDI8tfGHqArng=3D?=
Content-ID: <791C03D5ED837B4DAF969D2A01B25526@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9223ee06-e439-4b74-b194-08d9240a39db
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2021 08:00:58.8209 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8sQSEUktIrVIj9BcchtOpH/kHrX0NLp8S76Vl6o8nk2lh1GIRn394C25MzAJ5xixCrr0Yhh7i9kmGGkPzA4wtNdaLcuhqyIOj+WELRUOYQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2365
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_010105_221256_FC654BC0 
X-CRM114-Status: GOOD (  16.33  )
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

On 5/20/21 6:58 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The security registers either take a 3 byte or a 4 byte address offset,
> depending on the address mode of the flash. Thus just leave the
> nor->addr_width as is.
> 
> Fixes: cad3193fe9d1 ("mtd: spi-nor: implement OTP support for Winbond and similar flashes")
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/otp.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
> index 61036c716abb..91a4c510ed51 100644
> --- a/drivers/mtd/spi-nor/otp.c
> +++ b/drivers/mtd/spi-nor/otp.c
> @@ -40,7 +40,6 @@ int spi_nor_otp_read_secr(struct spi_nor *nor, loff_t addr, size_t len, u8 *buf)
>         rdesc = nor->dirmap.rdesc;
> 
>         nor->read_opcode = SPINOR_OP_RSECR;
> -       nor->addr_width = 3;
>         nor->read_dummy = 8;
>         nor->read_proto = SNOR_PROTO_1_1_1;
>         nor->dirmap.rdesc = NULL;
> @@ -84,7 +83,6 @@ int spi_nor_otp_write_secr(struct spi_nor *nor, loff_t addr, size_t len,
>         wdesc = nor->dirmap.wdesc;
> 
>         nor->program_opcode = SPINOR_OP_PSECR;
> -       nor->addr_width = 3;
>         nor->write_proto = SNOR_PROTO_1_1_1;
>         nor->dirmap.wdesc = NULL;
> 

I'm not convinced that this is good. I see that winbond uses 3 bytes addr with for the
SPINOR_OP_RSECR and SPINOR_OP_PSECR, even for bigger flashes:
https://www.winbond.com/hq/product/code-storage-flash-memory/serial-nor-flash/?__locale=en&partNo=W25Q256JW

Micheal, can you double check?

ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
