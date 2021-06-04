Return-Path: <SRS0=b8TW=K6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE51C07E94
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 13:13:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA96561242
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 13:13:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA96561242
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=deAx27LpLOvsrH/ckQAybV98WlFPjj345VuCzLIA+NQ=; b=ZZeZxmHaRrD6zC
	1BbRTYXZiMyY8P7QhQ3PufKWvdqqF1KcBOjoNZCAwsWxgYaIr8VftvzF/V1hmTslx1c2cnEyCLBut
	a0apAyQ5s8yHc/kGIoF3SpE3bONkgNDzNI48OgbJtLtW13ZR4xcqUyM0TklT5V0w6SExHBkK7jYXa
	O9EBJq38A5RqceTQXw6+ISfJbuzKBGCW2F210IsmOtvzrMpABLfZf2a8i2Aat5SiwJu/GD8m3DSpd
	hSzvMgDP8HB3mi8LZ4AWFGpUIysWCx7MU9c12Ds/0Bp1C9Yre78e/SG663btR3d3P4YUR267LahBH
	xSL0LmxxW7ebFiEMWnnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp9c9-00DeUh-4F; Fri, 04 Jun 2021 13:11:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp9YP-00Dc3A-5k
 for linux-mtd@lists.infradead.org; Fri, 04 Jun 2021 13:08:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1622812081; x=1654348081;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uJtCddZ3KkALMGo06GK960VJb6jOOg6DV5FsigAHodI=;
 b=KSUvs7UNXt0CJD/4BJLS5bZoLktHyqLF9Eyr+LqPbUeliaibrlmHIQwI
 Pya8QkJ+ZRAbf2iJrWAhwMXS5txeFrpefxs0oJ8jWNicsP/se43C2SF2C
 WUjYiyo0+HGkS1m3aSl6WnsXd7qf8oy2Ln5baS3FdaLYAfBSwKduU3s3Y
 eLJBz3mBR1p2Ft2n4jF5r3UFV4xvZSuWMeuwr0Ks9RsHONIEZ467NbWgW
 xCLWq9tAJp1dweoh4e4mQToxQ9MdG///bZHmxCvqDGL67/26eHgMdkFre
 Xpe1EOgUGifA5v4DZGb4zxEk3nErwrg0LT+Lo9orkfWPAAkkroXq2ScUh Q==;
IronPort-SDR: SOPmu6vNktOt+G2dZHGBgdfGR18LfrKxqu+8LvyA61u5G36UoV0g6QqLW22qvqGlk5pQitU1jK
 uR1y4LUffMhgEQGb1CiA3SLm5YH8rPPS59ufj+KmQnay51/EUdfdJCgfFGMNkr1DZgleHopuz3
 XpmE477o8DTNVjY+dAQ5Ik9Mm3P596O8OLpGgLMnHd0x9x/AaDrWOx2riJ+ftzZHXV1NDw6S64
 E2iWxy5TjIX1Wlq30zlxhjgKQSje78wRMFf0YoWYBa44c+u7HNn0GSGG9nbb9pBTONstaRfGvP
 bOo=
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; d="scan'208";a="117652518"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Jun 2021 06:07:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 4 Jun 2021 06:07:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Fri, 4 Jun 2021 06:07:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9n9jBQ/q8RnK/4udhtI7NH87DgKV7vwk09cZNW0JC6/nnbEQnIKrElSiazA09lhESk5fcphK5T3rzpgluFRr8lW4NzOAvsx+VhDpG25Pj0puTzSsPxg9aSCFY3sc61dLhuH+0Q1IKjGzSKqURn7lqG1g7cbR9rOdQOZtDvDomA4ysWJq6Jfa5gnHQhcWuBcRLaC28Ewhin6BI2tr2Dy9AdM/5sdxis2m+C0N5gNSRP5oSSLGMvouIn6pXM4qlxjNQo86EKeMPKxSle3eu7SMT2tg9oG4q0EjTmboeokaM85czG9Y9OohTwDKSmKWntUFMrSxw0VNG0dq7AqTGjJsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJtCddZ3KkALMGo06GK960VJb6jOOg6DV5FsigAHodI=;
 b=fAJM6/3CD09ghDuR8G77uEVFe/xd62Y9WDVioGpojEFXsiLsRMnYhbGLdrG/NeK0c7mg/yOJY5Ld3ahjFBvyvc7zcMs4YyO+1ceBJKQSkQJ5Rf6qHhBX5qLcVXVq6DWKpeOu2gj6tsLolN6KbDDs7HJNQvJFspsRLmAdqksg3r5wWddpAU9BB2yixEAt8X6De0zXbOHOgohF047t0UtgODL4IzHJfbBrZClDnC3ji+6CziW3FwmWY5sFTQ0mRrAYyAWyfvNM6zuoABP4GLDS8hXHQ98hRLfSiTgKjbc3NjLYj7b3DwOOZxIEQuvP33kkt4Mv95OReAL9WopkE14ulQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJtCddZ3KkALMGo06GK960VJb6jOOg6DV5FsigAHodI=;
 b=YadKpBao+Y2MU4oIYo2yzuK6+cCQRuQ3N4Fybr4eI3aL+hIjzztarDkuqtELSV6K2bKGu9oi/TQVEEWzKgkk2PxVY3PzW4gwhTCZ7TqDijSpBP6NNT4RRGsAGMf6NA7lTSYkzwbJlBx4xP/5HqhkF7baeYeuqXm6FyC8AgWjK98=
Received: from CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9)
 by MWHPR1101MB2303.namprd11.prod.outlook.com (2603:10b6:301:5b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Fri, 4 Jun
 2021 13:07:56 +0000
Received: from CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::1c4:1014:a541:e370]) by CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::1c4:1014:a541:e370%4]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 13:07:56 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v5 3/5] mtd: spi-nor: otp: return -EROFS if region is
 read-only
Thread-Topic: [PATCH v5 3/5] mtd: spi-nor: otp: return -EROFS if region is
 read-only
Thread-Index: AQHXWUKi6uM9wdkNjkycmiOG/lhhMw==
Date: Fri, 4 Jun 2021 13:07:56 +0000
Message-ID: <c2b58dcc-5a60-792c-30ac-a3db327a85ed@microchip.com>
References: <20210604100252.9975-1-michael@walle.cc>
 <20210604100252.9975-4-michael@walle.cc>
In-Reply-To: <20210604100252.9975-4-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [94.177.32.157]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6e0b670-524a-414e-f9cf-08d92759c570
x-ms-traffictypediagnostic: MWHPR1101MB2303:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB230305F294C2B644A4E61D22F03B9@MWHPR1101MB2303.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BQbJHd/5mKZyNEwXNhbcTbGSOPgeLvgH/8S0B2Sq4+ThFPE0xY5ifWgmOP887wzpA3+Mj8F+B2ElT+VigcvNqqGG/4ZV6sBj9mGpauhhpPxERwlPFyL6OZu68la7eWFFR4u5hyZYvX/7tZGn3Bxz/BXt5pCfJMe+tSsjbC3EiyqNn3aagjaUFUKf4nnFHshViNLkjrV90OcRe2j67PM7VWldP97NM4ZC+eFd72ppEf8DrUP4LcHR1W+LewpbuNMkP6R0/YnWfvyyH/YLJh8MjXqqk4eM2Mzo+jER+6YeIDrlThVDNiUqOtj0+v/W6k13k9cWaEVOHhuPWj09flCrPIUXj8qPIbQduJ4C8MAAsvjquuS58E6IgmavrpV+oGjS1VcXDRjvrWBcXTsgFu6368DxmNSpRfHRZPDpNAlsXCv95P84uZm0x2du/vtCYBYRc+Ou8KrR7Oy861H3MGI4hn/kh34tdy0Lo3dN5xBWePqtzgFMs/BX9qQF8XwknAfl/RICDDIeANVYHWecWKria0nOoq0R5LbR8G06hyG1k7bECuRXzEAmGNFrJCmpFx3fMOf/IyCeB/ro/Zgj8l248TLoNQFxpdNa8wSgMSdlzQnrMSXRXHiXdeC/OLNYayGQITaLM4kscmafVHfvhj7+Z+Q2aoASKXSGx71HqROz4Iv3KRLS9Ogbxokg9uPHxko8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(346002)(396003)(366004)(136003)(376002)(478600001)(38100700002)(8676002)(8936002)(6512007)(2616005)(31686004)(4326008)(122000001)(66476007)(36756003)(66556008)(86362001)(71200400001)(76116006)(66946007)(66446008)(64756008)(6486002)(5660300002)(91956017)(110136005)(2906002)(83380400001)(186003)(31696002)(316002)(54906003)(53546011)(6506007)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VHBndVpnM3RicFNrRHcrc0FETmhLK3ZkcTgzMnhhZVFvYjhnUmV1NENQQVND?=
 =?utf-8?B?YURKQWFJekRLVVpvQ1hUa0k0NGN0MWtZSUdyWVh6RUV6ZWEwTmZDbFZiZXB5?=
 =?utf-8?B?MUdwdS9aUks4MFFiTjBsbGhwYW9PMGRLUmtzajBKWW11UUdhYm5QdGdmbUxj?=
 =?utf-8?B?QkRPK2tIV1RoSkNMa3dSRUdWNVh5MzZzVEpEamY2KzA2TTk1dlR6d2lpYVpY?=
 =?utf-8?B?MFl5QTF5SHNTYnpWWDNxMVRHT1RzOWNvL05pU01pb2o1bUIxajEwSmlRbExp?=
 =?utf-8?B?RTZqcHBlVEN4a2U2MDF2UHFPSmVRM0o0OHZJRjF6ckJveW9mdFZOaFhNOTN0?=
 =?utf-8?B?VmdzamxuMVY3dG1xWENJdG5iTXo2VlBFS1pMbEFRcEhyR0ZuZENKeFRaUFA2?=
 =?utf-8?B?ZmxwaDhJblhxWjZydzk0dVQ5MHF3Q1YxUmVYUFhNN0F2QlptTmJ5VlJoZVdY?=
 =?utf-8?B?MFhkcHVPOU9RUUVDdFlYT1lxY1NFN0l3c0FqOFJVaHBkV29ITG5iUTRNZG15?=
 =?utf-8?B?UUNZL1VkQVlzZDRidFRIRFh1bDNORmxweGxYL2trZDlSbFViNnUxcUpXMU5p?=
 =?utf-8?B?SGFoWVQ5Uk1ZMXdXTWFQU3dhT3FpbUdpcitvOTFVazJpa2NKNGpBdi9nQ0dz?=
 =?utf-8?B?RTZPRysyQ2NseEpUVXo2MkQ5V1E2M3plaCtKN2NWNVhEZzB4TlpNU3JLbWJR?=
 =?utf-8?B?bVhYR29TTDB4ZU5XNGpCZ2pySlFkM0NaNmYyYTBObnJWeHdGTXJTOUtKUlhy?=
 =?utf-8?B?RmVaMC95dmdiSm5haktJZzVONTVwRUE2b21IVkg2aVFZYzNRaFM5N3BUakpt?=
 =?utf-8?B?V2ZiU01PRzhodEhMWVV5eFN4S2VZRWdBcmc4b3hlZER2b050Z0JUQVJmQUt0?=
 =?utf-8?B?UkN1UFJDN0lvMXJ2dXJidzYyK0hoRGc3NzB2dXZ2V0pJR1VPMzhab0VzcU9u?=
 =?utf-8?B?TWtldFZDdzFIaE9URWpzM0hKdnM1Z1FyYTVCQ0R0ZDdLMVE0SGhiVFdVZFJy?=
 =?utf-8?B?bWhQSkdvWmhpTVFkdjVYSFZpZCtXeXRaMjRycDgwaHFIZThhc0tldkJQVVYy?=
 =?utf-8?B?WEN2L0pjOUp5Nno3emovTEg3eG45MEMwZUJLQ2tCU3ZzRXA4VXlyL1d0Q3ZB?=
 =?utf-8?B?YkUxSVJIbmh0MDFPWjkrRlZOVnpzM3h1bkNUMVdaNldUOE9EOUNkQzg1UE8v?=
 =?utf-8?B?amVlWkRXNU5YRXpBdWVWcDFrQlFxbHU4cVhHRGVCQ3NVcXFWSFlwT2F4T1dY?=
 =?utf-8?B?ckdXZi9VWUEzaUxOWmc0THBzbVM5dmg1ZnVlNmVFNkxoUnk5eEpmQ2tPdXRT?=
 =?utf-8?B?M2pPdHhXdmcyck5GNUVxTzQ0TjlSUDQ1US9vamhiTk8wbnJLMk1aWWsydmRI?=
 =?utf-8?B?UDhqV1cvTDNNNXdDMVBiRGsxUWZnaUxLWUYvLzlFaDBzV1VXUVlmS2gvMGhy?=
 =?utf-8?B?dnIzL2ZYQXNUZUxLbWg3M3dWL3pFa0lCRzR1b082TjhzU0llQW1sRlk2bWNn?=
 =?utf-8?B?cUlUV2RSUGZBVzdPYkpHWFVGbHNkQTcwYVpEa3QwSlBIWWJ4WXljWnV6TXFF?=
 =?utf-8?B?ZllSMGh0d09OUFhnZ2pwZFBCK2VnemMrakhMWEZFM3gxemFDK3llVjhDR3R0?=
 =?utf-8?B?NmRxMWIwZXlQbG14UUFxYU1GamlYanlGQUdUOVBGWHZZVWRpZjVUd3BOdWRo?=
 =?utf-8?B?cXptamxqSVFmT3I5bU5KNU9YcEQxS2c0TWFmeGhWaFFoNUlIRTdIamFXUUNh?=
 =?utf-8?Q?Nc2h5V6W7+KH1VSsN8=3D?=
Content-ID: <377F74ABFFF37C459B8D53FCB17797C8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e0b670-524a-414e-f9cf-08d92759c570
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 13:07:56.6240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rnGDAfEdz6plDGJQ52mnN+soWrLHppfC+AmzOZKFBHbiJfqU/BS9XAGmqyvQc0nDVBeNsLXvk08ZmT3xis241/Er2ClDNQJL8hKiGYcGnCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2303
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_060801_358651_1FD11EF5 
X-CRM114-Status: GOOD (  31.98  )
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

On 6/4/21 1:02 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> SPI NOR flashes will just ignore program commands if the OTP region is
> locked. Thus, a user might not notice that the intended write didn't end
> up in the flash. Return -EROFS to the user in this case. From what I can
> tell, chips/cfi_cmdset_0001.c also return this error code.
> 
> One could optimize spi_nor_mtd_otp_range_is_locked() to read the status
> register only once and not for every OTP region, but for that we would
> need some more invasive changes. Given that this is
> one-time-programmable memory and the normal access mode is reading, we
> just live with the small overhead.
> 
> Fixes: 069089acf88b ("mtd: spi-nor: add OTP support")
> Signed-off-by: Michael Walle <michael@walle.cc>
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/spi-nor/otp.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
> index 3898ed67ba1c..063f8fb68649 100644
> --- a/drivers/mtd/spi-nor/otp.c
> +++ b/drivers/mtd/spi-nor/otp.c
> @@ -249,6 +249,32 @@ static int spi_nor_mtd_otp_info(struct mtd_info *mtd, size_t len,
>         return ret;
>  }
> 
> +static int spi_nor_mtd_otp_range_is_locked(struct spi_nor *nor, loff_t ofs,
> +                                          size_t len)
> +{
> +       const struct spi_nor_otp_ops *ops = nor->params->otp.ops;
> +       unsigned int region;
> +       int locked;
> +
> +       if (!len)
> +               return 0;
> +

You won't need this if you put patch 4/5 before this one. With this:

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> +       /*
> +        * If any of the affected OTP regions are locked the entire range is
> +        * considered locked.
> +        */
> +       for (region = spi_nor_otp_offset_to_region(nor, ofs);
> +            region <= spi_nor_otp_offset_to_region(nor, ofs + len - 1);
> +            region++) {
> +               locked = ops->is_locked(nor, region);
> +               /* take the branch it is locked or in case of an error */
> +               if (locked)
> +                       return locked;
> +       }
> +
> +       return 0;
> +}
> +
>  static int spi_nor_mtd_otp_read_write(struct mtd_info *mtd, loff_t ofs,
>                                       size_t total_len, size_t *retlen,
>                                       const u8 *buf, bool is_write)
> @@ -271,6 +297,16 @@ static int spi_nor_mtd_otp_read_write(struct mtd_info *mtd, loff_t ofs,
>         /* don't access beyond the end */
>         total_len = min_t(size_t, total_len, spi_nor_otp_size(nor) - ofs);
> 
> +       if (is_write) {
> +               ret = spi_nor_mtd_otp_range_is_locked(nor, ofs, total_len);
> +               if (ret < 0) {
> +                       goto out;
> +               } else if (ret) {
> +                       ret = -EROFS;
> +                       goto out;
> +               }
> +       }
> +
>         *retlen = 0;
>         while (total_len) {
>                 /*
> --
> 2.20.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
