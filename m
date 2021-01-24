Return-Path: <SRS0=HfhP=G3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104A8C433DB
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jan 2021 10:35:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8305522C9D
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jan 2021 10:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8305522C9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l82nU2zWYWWyfF3ws9dVe5Z84BHlQqxkg7cs6dn9vHc=; b=nSZ8MFCRakHQ/u2TZdAOkTM6n
	T1fNclC8xSVzQErdsJcCqejjsu/h2zJ36O9T1dvKMdiBEm9L2Kdh0PqZ/Nu+x+CJPe3pcbdzogiUT
	gttvdVN/xAU5FxBsQHKf3zuEtm98dWoyd4BF8hLME/xJHfGy1ZHN9C4oHSjXOfEBxuDZHdIc9gfoh
	CSH3n8/xhVMCxsfwBNTisGWwKQp77teIvFZIexD0Mj3LVH2U+fOp6NsoLy9uC70JQuJXgHf8QpS3A
	lbDR5SxFN7BXeNkH/uwtpo//a5YsClr//kXM7x+oIXMM2bT5a9+cdTG4xpDcL+pXvrL4IyQtLY3Sp
	tecX/wVdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3cj2-000077-76; Sun, 24 Jan 2021 10:34:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3ciy-00006g-Vy
 for linux-mtd@lists.infradead.org; Sun, 24 Jan 2021 10:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1611484469; x=1643020469;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=dqYN9pPGlZccUEOtOlzXNydU7GLb0FucdTFJbZkBDX4=;
 b=k/gTHMZwlXGWdP39FE5uU2gm+RnLzVzcrTkR1JBfcV0jB+aj0b2MPrxs
 GOZXoJQ92NipCA8LmViatKa9PssLshxPm5uTtC59nrQODucrnG8tKpekD
 H9p7PPxaTl2CEULoHzHInqW+7oj2dyaUtQ/ljWYcgjMk4C2PJ3WDwAhIz
 wWfOyAk0q4Wswi0HtD9jCifEzwaxv7wrjCQUA5ZWZqyR/hhQBEuR9TLT8
 IIx9CHO+osadFktaJF8gkfh4CS99RxC/xsxt1pvjcn+sAXYtrXEir2wHC
 JhEpYFx4UXagHpZxCNuYe1i/jWJ/NbatWTH7kIV5K55/SW7Mw01E5iiBO Q==;
IronPort-SDR: rUeZ8TZfoI1HFC+DPXw8QTxg7AWabBdLnguu4HR2ftnZlmcAxjsfk+pMlLeD9QoUgSPtb3tOcz
 62l+q+t/1jBzIbjwSJcn7XaUxBpzGyjHrP6lGIbTzHNABhbeEDKdqMTz/hSfLcW3wuHKihz+O8
 Dfr9jJHqU+bzWjiNuFRXj+j3THCdjvhrOLlt1FQi/sVP8yqyE5stDfgTfRTMsvZFXp2/wfFvJf
 eq5OxNCoJ4Rp+J4WXwbEakDhrmgDJIzsUwVLz+iT++MIOSCfVAJNUEG73jGGXMfeddZ61UY5Ir
 IeI=
X-IronPort-AV: E=Sophos;i="5.79,371,1602572400"; d="scan'208";a="101205118"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Jan 2021 03:34:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sun, 24 Jan 2021 03:34:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Sun, 24 Jan 2021 03:34:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFjQaXUnoib+EzI2THDu4lY7c9097l82S2hnOHvrqlmJIMdSBWd6B42kvAiLWelLdU8Ba9KlPfJfjC9kAh2BGnsMcVrNc/F9iQwkaWhfM8s6X4npEshC5b5BucLw/SJgmyX+ES1/TCs2r/+cXUW0Bt6/bPvlP/HWu58/SPQFNXCAZfqaUACiT8ELGJP4ZCgjrfEoqWyBjbBm839LcS+N1omNVhyi7XtG03U4XBU1uKS1lSqzndWljMcOteRIUAw8oQwU1c6Gh3fu7u1wsyHCREZM8NtgX4EdP675Dn85fyBkmR7q/lXSxM8qDMydqMwCfqQ9VNWInUf5OeCoVNRqtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqYN9pPGlZccUEOtOlzXNydU7GLb0FucdTFJbZkBDX4=;
 b=aWqzU4lbsgF1bPoI9oz3LSzP3bgre7cWklqjDXjJvF0WwjP3QpTHGNxNO3g28C3gZC9Yf5Quwz4mkYIBvOUZMRksSLfRXxbZWkUoi+NVODmOG6Po080kWMolSlpAgSzM6WCLyoe3wqMbzKePxchkOkSkain0l8y4gat/QZRlJdBTyPqWN0z2pwgH3M7DHMkiaj47iTb0ebpIhxNqLws9iRA9/hx+xgaH5LKtmjQr7Rd3G36xwX2/cf3+rjAf1gGlAXdF+gYDYXMWO98hf6kdKcuBM96bvowSoeZfZxpCrhe9jkVgxT3uAtVkzOi/s27v34Xng7Qc7OOGgTYHhTxN5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqYN9pPGlZccUEOtOlzXNydU7GLb0FucdTFJbZkBDX4=;
 b=biryCk3fA0HrUR+nO5m8zpiTtSfo+5WCLOkUipl0OMf9F8ikf/eSP78BedpvMcIGA9a03650B6ruHa8ztcxqlUotbDcwngBHvTDA+3Y5nTgvYIgjCnD82bNyjOScxDIyF8nSBzVkwZAocQIipCIVPk39rJ7gnF9oZzcsPdNyZ4o=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4701.namprd11.prod.outlook.com (2603:10b6:806:9a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Sun, 24 Jan
 2021 10:34:22 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab%3]) with mapi id 15.20.3784.017; Sun, 24 Jan 2021
 10:34:22 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>,
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH 0/4] mtd: spi-nor: Fix non-uniform erase map issues
Thread-Topic: [PATCH 0/4] mtd: spi-nor: Fix non-uniform erase map issues
Thread-Index: AQHW8jx6YDpRJvjufEuwWek4HUFv4w==
Date: Sun, 24 Jan 2021 10:34:22 +0000
Message-ID: <bab4deed-36e9-7cea-4c09-dcc1ee22a3aa@microchip.com>
References: <cover.1601612872.git.Takahiro.Kuwano@infineon.com>
In-Reply-To: <cover.1601612872.git.Takahiro.Kuwano@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.1.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fba338a2-8475-4525-b3cd-08d8c0539d4c
x-ms-traffictypediagnostic: SA0PR11MB4701:
x-microsoft-antispam-prvs: <SA0PR11MB4701DB67AAF909AC655C3B11F0BE9@SA0PR11MB4701.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:747;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: al61VL8YPEEo0Nm1rIcRXEiHJ6rzKNCpKLF/VoqAdqvYmxvQJ8slT9zlmyi0bNts6KZ8vAK2N0y3nmUsgkcIpn5Q0o4oEyW1q7E4JHTZL1RLFoGmeBgEqQn3iUMmweEl60lGKHL1FgOOYtPjfpmmD8qzlrDJh7pC1tAUauoxlTMk8MkYONhOl8B5Tzg4CSyNy+w26BeFvvPbFkji13ltwzSUTAItRstVTz/Pp4GnhIbWAQUY9pfmEawAsRG8LG7OwQCc48FfAOCwa2b2KsgxMrc08Z2qSEIzanEzjpmCPsUYPAWrWpzSBpbS4YS8fn6HZjlR98FNbleih/etaFupePkP2Xgob+X8YGkdmg0tGkbti3GugZEWI99KICMBsmoHZqX/pex/TyU3YHMLwy7H+l6/jy4l5U/7H1BJ3c0wR/eprWtGMDVA1MYAS1IB3G1e5U0rJPXcwlZQ6Mountr63ou0PJlBnoN25HlvR/slX9wUb/JiyXeGGApS14q2v+s4EzrzezMfy7akFCDgWhFQe0hqkoVf1KMO9r7zbJc4Lr3mrRCdJjctBsuxh/3tIR8tKhlNsVkzjiwZgt2FvXaFVRH1HY1Aay4GJNynxvYe8hU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(136003)(366004)(376002)(39850400004)(4326008)(26005)(6506007)(36756003)(186003)(53546011)(91956017)(316002)(66556008)(76116006)(71200400001)(66476007)(66946007)(31696002)(86362001)(478600001)(66446008)(8676002)(64756008)(8936002)(6486002)(83380400001)(110136005)(54906003)(5660300002)(31686004)(2906002)(4744005)(6512007)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?KzczSXhRTE5wQ3RpSmgyRC8rTHZEOGYrQTlHMUdwT0MrUHBCZk85MGtIQnJT?=
 =?utf-8?B?b0tRd2ZNM2Q0ZlZFcG5KbWl1bHlpV3F4WUNzaHVrWEFaZjBGZjNnVEoxaU1Z?=
 =?utf-8?B?ZDhzZTkyTGJOSllLaHFTbEhhNVlRdmorcytQa3M1M0hnZWkzZzIyaUJOTDUv?=
 =?utf-8?B?ajdZOEN2ejVDeHJmdGhqb2NhamVrLzByNEZhbTJ4aEU1dTBqMGV3SWtmM3lY?=
 =?utf-8?B?RkQ0aHZ0Y1JkT0lMQnVHMnNsMHZPV1AvellCVFFFczhjblM5V2dCL1VVSW1G?=
 =?utf-8?B?Z2w5WWlvbkE0OVNud0Z2TDhPRFBNcXpwODVyMnZlWlBWSHRtN1JzbklBemIy?=
 =?utf-8?B?dmM3M2JRclgvM1Vld1g4ZDJBWlVDcGFEQk56MERsTUJSK1NpelRFQ3Z1N1dh?=
 =?utf-8?B?cXg3QWRQZlJ0cDhpeEQyUWxBSkJ1VW8rR05nNFN6aXFZNEN3TUtKbkh2bG1k?=
 =?utf-8?B?MXhmbTNJbFZ3Zys1cU5MQ1dhVERNWDAyKy9yaWFicVh2RjVPcHY4YnZuMXlY?=
 =?utf-8?B?RTkwNEhDN2dNeEpNR3BtTEtJM0lCM0ZBMG5RdEU2ZTZzOHhDMWRhcFJvcjVN?=
 =?utf-8?B?TTdCQnBwcVM3cnh3NXc5UGphWUJleEZCNXZkZi9QdmczTUY3Ly9ySTZPYnRW?=
 =?utf-8?B?OVJ4UU1GdVh4WjMrQUd3MzRSQVozV3hYeU82bkszNDdGMUsyNjEzcEZXVm0x?=
 =?utf-8?B?SEVZWjBmcTlGZUxBcGhFUUNsR1FxWWZiU1Z3OFJLRUdURndtYlRpTVY5clhv?=
 =?utf-8?B?UEh0aHl1NjR2Mng4NWIwaTMzb05IZE9wM1IyeXA3OG5YaU1ObjF6TVFwYkhi?=
 =?utf-8?B?a3Ayb2p4VjVzU0d6SWxBNWJCazlLWExUT2VrOEhmeCtLekQ1eTdPTHlDY1Er?=
 =?utf-8?B?QUhsT2FLakdIU3pKcCtGNUNhY3c5U0dRVGtVT2t5akhWU0FCUElnTk1WK0Ir?=
 =?utf-8?B?UkFmS3p6c3JBcDNQVHo4aWlyREZTT2F0cURTTzFxQWp4NkdiWjkyOFhJamQx?=
 =?utf-8?B?dTErYzdWNkw1eDB4NGVVZVBrM0NsNWVlalBqaWJ1aUppVWVrUTNFSmk2OERs?=
 =?utf-8?B?aHlVWG10ZWlCVnlldmEwYzJCRlJaOFd0YmkzMXMrdzFKa2pQVTV6eXB1dW1T?=
 =?utf-8?B?Nml1c051djhXcitHRHd3S2tXZUF1QXMwYlNUTHZHTWVCU2tkK0hoOFcvTjlF?=
 =?utf-8?B?ODFoTjhRbFRkQnNWZ1AvL2pCMWd2MFZGNXY5Nk83bUVkYi9nb1QyLzBsb1VR?=
 =?utf-8?B?K2J5YTFTQlZraWRKamFTKzUzandtaUZRNWp1bkJXWW14N1pOREx1YlhDR3Av?=
 =?utf-8?B?VnFKVVR3TmhSaHZxREhRbGZKdnZTcnAzNUNGd1ZQdnBNOHA5b29IdEJSSmhD?=
 =?utf-8?Q?o5EVFM8kbCSuADOCQoo5frNc5KEB0dOg=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <E0EF4459EE873640A8451EFDB1A666A3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fba338a2-8475-4525-b3cd-08d8c0539d4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2021 10:34:22.5797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +JcgzcoBqGMuqu0oTP+h3ZbXDoov7jkfijnpKhJREz7VyjsSo6qsOI+aK8gZ7eC7GEDlgjpiu5tFIUse33VUBQGF63BiO+hzfDm/pqksAFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4701
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210124_053429_365894_ED0199AD 
X-CRM114-Status: GOOD (  12.84  )
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
Cc: richard@nod.at, Bacem.Daassi@infineon.com, vigneshr@ti.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Takahiro,

Are these theoretical fixes or do they fix the non uniform erase
on some flash?

Cheers,
ta

On 10/2/20 8:17 AM, tkuw584924@gmail.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> This patchset fixes the issues in handling non-uniform erase map.
> 
> Takahiro Kuwano (4):
>   mtd: spi-nor: sfdp: Fix wrong erase type bitmask for overlaid region
>   mtd: spi-nor: sfdp: Fix wrong index of last erase region
>   mtd: spi-nor: core: Fix erase type discovery for overlaid region
>   mtd: spi-nor: core: Fix erase command list setup for
> 
>  drivers/mtd/spi-nor/core.c | 10 ++++++----
>  drivers/mtd/spi-nor/sfdp.c |  5 ++---
>  2 files changed, 8 insertions(+), 7 deletions(-)
> 
> --
> 2.25.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
