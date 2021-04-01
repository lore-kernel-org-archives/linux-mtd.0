Return-Path: <SRS0=GKVC=I6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F22E6C433ED
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 06:10:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69D7561041
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 06:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69D7561041
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cYXyU0lHa13QOdhpph7eGzy3TVZfNMeXgiHxWVwh70E=; b=lVvyTm8gSpNG28a8mF4LdBxzb
	rzAAUvpaAaVOS5uB3Ln82g5RSuIZXVQQkZSw6GAGZGRRlkH5HG5w2l6UJNkgdOuiPTAwQ3f8RBRa+
	4OsU85uG/NKqMQcvRe+NiuhyonyXmLd0wlwnhh+a2m7lDWBcZZsDZSEr/9K0OhFeAjfsytIzMlqnp
	fsMRlL7HtH0f8tebxnir3Pe4u6z4UzyRhqEacMZfS6KqApwSKEZClN2cA0wHjRBeSwaGYF5sSzcrC
	pNk3WNBrF24vZ2hoEkWNcIgz6sGK+CwrTndWztklDgd3I9X+MkSau6dxAQSVgwNpD7C5yVn18q7K6
	r18+tgNNA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRqW7-008eFO-J0; Thu, 01 Apr 2021 06:09:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRqW0-008eEf-Gj
 for linux-mtd@lists.infradead.org; Thu, 01 Apr 2021 06:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1617257352; x=1648793352;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GZuZL6EwsrfRiUU5GHvSVXotMRxkr61hCSmArmGN9eY=;
 b=AbHAvegOQXgZEw2ExnRt3a0w6y4GL2tD8Rc3oNrSh4NmRyIgjgDWDGYC
 KEef7qZ7krFdiUielEs7dybavbOnAPV3wIGrDTAQfMbQUztEmbaBjbO9Y
 GD+gG8ROZRADoUoXMKAOJxv4MTF1OvnxT87Os8As3YNzYlyJKYqEjFP6K
 snjGK9UdlfXPkaHIFw80xoEflRsuzidkfKaVxajf0RBmpv1bvOrxSx5Bg
 YqCceIQJgl3NfT6tI1KCjk6T2rtMRG0CjJuPs7poJAmsYVLZfegCuZHA1
 yGrdK2m//8ac3vQ2W2GCpiR0rW0XHacChqDL6H47jrtgozT7wN7VaqIrH Q==;
IronPort-SDR: 3rdG6y7Z5K1tTlWoVU6gEMPh1bzkxepojujfLYmhax0Bxk90W1pk3bh9w/nIATM+Hn6YVl+Dkt
 vs7adlyCQjQelfLINgzA3TmTC5OJhVsgtM8t5qWDNdsiGE6Mw/RygKeGOcfWnFIzdQq0U177v0
 r+YzkKJk5wOjBTBAvBmoHmmXbGaTLZmppNswNR41DQdMfz+k8CTRTIWjtoaGzr7DAu+yRAsx+6
 mM41Lm4OsepmKE00E8pSX7O3F9rHJ8RT7ggBWLJQWZx/Tplkc3HSkbQaJvAkzUt/oWrd8UWEXB
 C1o=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; d="scan'208";a="114946546"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 Mar 2021 23:09:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 31 Mar 2021 23:09:06 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Wed, 31 Mar 2021 23:09:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VN+qyMF6F2B+YZdXajEpbPEGBOPxRMWMswredGGN9B7Q+6uAuCDoADx9K8zC4kxELGTwt9yHbsy311txaxISdqF8ytr+lfEIir2sZByIeTi+mp1SSN5SoUVeOY3VllcutNFuXjFmIm/y0r1QXfdApGuFaLkXQFNeQyENbU2y0nNUTkukBsGF2smi6yW8GM/kNNYkoKyJPpx3JcE/JlrpSvT8cha/BLMH5ld+l1WEu50X50xWkkk7yZ9+h1Awg307QyibWfpRcEv11A06UkDC1uz2MmXfdxjIhddi7Am/o6HJD6L+7hl6qvSFTd6B3zAUOvGq/KOyBtL2DsAGGAo3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZuZL6EwsrfRiUU5GHvSVXotMRxkr61hCSmArmGN9eY=;
 b=XXBy748kBHgbX7aCalK8Xb4MK3QzhWVK9zCI6nXJyxxFp4hUozd/6AC3zQfDxRRl8M8I2E6RnuB43Qj0IC+snZkfJ1QRoIDfrqiQ4FNWPdIyAExMgRUDO5DKMnYy2m/FTy7fsvcXfFBY91kWeLHuAsPWJ0tj8oCSPjXjZNbAryWSx5e9wPJASaKTlT7vaiJl2P/KJf3XPsFTBDkpT0PVQiNCvvyYxfeg246NEAIqOPfcobblW5y4CKLPw6jbdYYL72EzsK0YTh1let2n75t3m7yfFaU9I33h92FuFtMl2ko/0geLWCI8Cs0QqAPJJU25LwXc6EcLfPEH7KxuxE4Osw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZuZL6EwsrfRiUU5GHvSVXotMRxkr61hCSmArmGN9eY=;
 b=B5FpQrIIr3Tb5T5IAbnZMmpZ6RH2mjVys6uwYwHodCHquim56abK1tUWzeC9AeWWm8GBYkC6yfC61HdaAttbhQobP1EXaGrFoen44NR93mJzREwxGeAlTSftx32/Aq6WRG15khAke6bsV9Nir9OA9c/XYKiDka3qR0mHDef8opI=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3055.namprd11.prod.outlook.com (2603:10b6:805:dc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Thu, 1 Apr
 2021 06:09:04 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9%4]) with mapi id 15.20.3999.028; Thu, 1 Apr 2021
 06:09:03 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v4 0/6] mtd: spi-nor: Add support for Cypress
 s25hl-t/s25hs-t
Thread-Topic: [PATCH v4 0/6] mtd: spi-nor: Add support for Cypress
 s25hl-t/s25hs-t
Thread-Index: AQHXJr2Dl0IvaIfezU2humJwIWm1bA==
Date: Thu, 1 Apr 2021 06:09:03 +0000
Message-ID: <561ec6a4-5e64-8a82-043e-9e825aa00a3f@microchip.com>
References: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
In-Reply-To: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [94.177.32.157]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8837f6ca-aa34-4210-bd7e-08d8f4d4a6ae
x-ms-traffictypediagnostic: SN6PR11MB3055:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB3055270664D594B0AB42FD85F07B9@SN6PR11MB3055.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:741;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jQrWGfcTSDU1KXBn6pl4HJr6KjHeoUCBKq70AXK+MaMsabyI1P61epXoZg8ZjEwRS7rSaN7EA9jPI+KVfeCeo7jZwzxVz/y/2+Www/vf+wNiB+3+PYi7/jQlCv2k06OEeN5zK19z+6jnrEwy5cxAPgZQz4nTC3r7VF6CV9tSu282Hrom/DiohJcprFfEl0tLFr0BYKcM2H54JD70sdf7v75FbKxJ6wk3uK03QpFVooc4ZNe1Hw4h6lN9+0mFa2i46imKNfufvZj44opWu9oIffx7m8/8EXRcowLZqkwMCHm3UrzidfvMMeCo8FOfUI7QN+ZXr7VFvexpTM2NUrPpgqrVg8ujzcnVo1bH75sjfSBzHu3fFIBnaPYf7+V0k4vqXmbm0MNvsUm9EbTeZ/eNSoukHFXzE3+E8h5e/Muc9dzDCAtE6zO7GBoXyDtX10/jsDmhK9eGxe3zhvIVF/qfgkbukykX3GU2VFnta7aOghCJPMayMANIUC1EP0quj/3CDtWKhqv/XUxj4b/KOG6DMJ8ewdQjpOD4XqAYLoBjxUcs1j8jDvjKRwM/XVvIgWjHqJnZbarxoy9vmYXwAuThU7Th4FND/wxi7f/yOwEfTQqWFbeHzyQNAPq9j9KTLdiuwngDVVaH3QLefv9A2/VlkC1hz9ZDRI0YCW6XdPSTlA/d+xDQvSb/zkQmyDj9MRXBcEDp9d4WbK7gIWNoFzOQ1aNaWq/QKyDHMp+QwXbBet6/Y9dYkayCOZouHhfHu0S/V8/Jbvei9sXWy+QqpKY/yICn6CxdKoNo75hTcnljyMi4JK5iPgnmEGfB9RG+AUOh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(346002)(396003)(376002)(136003)(6486002)(2906002)(76116006)(316002)(71200400001)(2616005)(5660300002)(38100700001)(64756008)(6506007)(86362001)(91956017)(36756003)(31696002)(478600001)(66476007)(66556008)(8676002)(8936002)(31686004)(26005)(186003)(83380400001)(6512007)(4326008)(66946007)(54906003)(53546011)(966005)(66446008)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ckhNcUJpQTBtQzJyS2ZvWjZuc2ZXTEFGZWl5aERncm54amhaV25CYk1tUktt?=
 =?utf-8?B?cGtYNTkrTHlpS0Z1bnJKRjdZeTFiRWpTd1hJOHlhRXRvUHFGVCthY0hDRHll?=
 =?utf-8?B?cm5ycHU5YjZFdWRQa21veC9qODFBQm5BZko1aDVRYWtVLzVGVFY0T2ZtLzZN?=
 =?utf-8?B?Q2hpZmdQcUgybFEwMG1LQWdPelRXZHJNdW1xNWd5akRuWnhudFpNNW10RXln?=
 =?utf-8?B?SjQxUEI0RTY2VzlhQ2hlckdyVHRaSldjT2RLTEpnM0U0M0NxZlpRUW4zYVNG?=
 =?utf-8?B?eGw5Ulh0WnhubVBoQWF1THV3NjhiNVE1MDNrTHNERmppbXhNSW8zVmlVZ0hp?=
 =?utf-8?B?N3loSm1lYmF0ZU9CdFVLVkgvNWZZS0F2SGxITllPbzRsanpMYk1rZVFBSXVM?=
 =?utf-8?B?d1U4RlRYTVZubkRDRjJVa2gwcjd2SXpUem5yOXFvdnA3RTdRQkJnUUE5emtF?=
 =?utf-8?B?V2Q1YlFoMUg3NGFyOGIzLzNwS2UralRscnc0UmdxZEo3MUVvSk1QR21qRUMy?=
 =?utf-8?B?N09iRm1TTllBN1hTT091VlNjNStySVhHNzcvWlZZZUFKb0RwcjFEeloraDhE?=
 =?utf-8?B?V1FYYVUwbVRJVTVPL2NHTHlpNytDOTBmWDYxN3JTN0RmZm1jTHc2RlpGbXJs?=
 =?utf-8?B?Zi9BQURVTUdjTllZTm1tYUV6ZDRYcW10TjVsZXhBelhlbGlFaGVsVWVHY1pS?=
 =?utf-8?B?aFV0cGFvZHNVTHV1MFZoWW8yUFpQZmlmdmZQdnVTbTBhNWpKa0ZBL3BKTDJT?=
 =?utf-8?B?WU5kNlhjSExVRklrRmVUSjVidHFYdUJTK0x5TExwNyszN1V3MEk2VytZbnBC?=
 =?utf-8?B?VnAvOHNKTS9JSHhRL1VrOTZkU2FXMkg5Qi90anZORjlySWdHTkRNbDRkcmgr?=
 =?utf-8?B?bTBiV0QxbzVBVkhEOGtPbjlZS043d3RqRDlqNGUrWW9ZYW9KTnJKazgwRlcz?=
 =?utf-8?B?VkNIM09KZlMyR1lhbm1xT3RyTS9DYVVhVzN4bjhtYVNLV28wTHRVRjRuWHl2?=
 =?utf-8?B?anZUQXdJTnpnM3pkUjN2S2llQnBDa2VtdXloalllQlp4VnF1bjlTL2YxUHpr?=
 =?utf-8?B?alZKazdkcExhejJpUW5EZVZaRXRLbXdvZXZCZEVVQTJKZ1RaVU00RmQ5QmQv?=
 =?utf-8?B?OTNBalZISjYvcmZPRE1NOGN2WU5qdzhzNXdPc3VvQXQzRkhSeHBzQzZaZ1VC?=
 =?utf-8?B?cEpFMnZ3OVB0ZldLVWhoWEd2OFNxZngxM3NuNmNMbC9Uams3aUNKWE5kOHU0?=
 =?utf-8?B?VC9sbVhZSE93S3NoaU5zVURKNTFnNER5WHJpNVU2TlJwMEtTTWtzdGdzeTdv?=
 =?utf-8?B?UUduNkVVN2x6WkJuZ1J3UnhpWG1QM0srRVJ6TnNZaGNCQjEwTHBiZmJoRlRP?=
 =?utf-8?B?OGl3b3FlT1F4RG02TVhXc3BjUzBaVXU2bDBabWl5eEFRQWk4WnNERTFOQWQy?=
 =?utf-8?B?cURVUlJHOUo0YXNUdTBWZkJRNlZ2aDc4azlyengzcHd4T2NMcVZFMjFNYWxF?=
 =?utf-8?B?b016R0NhZ0ZIQ2VEUzBmandoWTBpSDh6Z3hCalR5dk5WUEtma2FGQXdHa1pM?=
 =?utf-8?B?Qnk3anVjTkR2elFIL3N5LzRBTW9mbDg2bHVQbDI1VHorMzhCY0x5R3hBcWNJ?=
 =?utf-8?B?dXNRYXdIUTVXWUxtQWJBQk9Ra3BZZzFHbUt0YnFSdHlyd0RuWVFhdEdZci9X?=
 =?utf-8?B?KzNBOWpWbXIyY2t3dStiTElGd3RlQW9GbUJyUXFHaCtrYzFvSCtvVW9OSS9Y?=
 =?utf-8?Q?JGYxHNFjqqlWxGvWjs=3D?=
Content-ID: <E19A1067A74C70478EEFA49CC8106CC8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8837f6ca-aa34-4210-bd7e-08d8f4d4a6ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2021 06:09:03.8165 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: roqUBKJM/fhpBRF428ir5I4yiaoPPvIzQTZKSIdNZg/a8WGnrNyyb75FabqXDilYWGZ88YVdEuh/9RbJVWo6misrU6EsfaIUJTq2Lwv1IAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_070913_254479_2DE23D78 
X-CRM114-Status: GOOD (  18.98  )
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

Hi,

On 3/19/21 8:51 AM, tkuw584924@gmail.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> The S25HL-T/S25HS-T family is the Cypress Semper Flash with Quad SPI.
> 
> The summary datasheets can be found in the following links.
> https://www.cypress.com/file/424146/download (256Mb/512Mb/1Gb, single die)
> https://www.cypress.com/file/499246/download (2Gb/4Gb, dual/quad die)
> 
> The full version can be found in the following links (registration
> required).
> https://community.cypress.com/t5/Semper-Flash-Access-Program/Datasheet-Semper-Flash-with-Quad-SPI/ta-p/260789?attachment-id=19522
> https://community.cypress.com/t5/Semper-Flash-Access-Program/Datasheet-2Gb-MCP-Semper-Flash-with-Quad-SPI/ta-p/260823?attachment-id=29503

Takahiro, looks like I can't access the dual/quad die full datasheet, not enough rights,
even after creating an account.

How are multi die ops handled when crossing a die boundary?

> 
> Tested on Xilinx Zynq-7000 FPGA board.

Have you tried to erase/read/write multiple dies with a single request?

Cheers,
ta
> 
> Changes in v4:
>   - Reword 'legacy' to 'default'
>   - Rename spi_nor_read() to spi_nor_default_ready()
>   - Fix dummy cycle calculation in spansion_read_any_reg()
>   - Modify comment for spansion_write_any_reg()
>   - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
>   - Remove USE_CLSR flags from S25HL02GT and S25HS02GT
> 
> Changes in v3:
>   - Split into multiple patches
>   - Remove S25HL256T and S25HS256T
>   - Add S25HL02GT and S25HS02GT
>   - Add support for multi-die package parts support
>   - Cleanup Read/Write Any Register implementation
>   - Remove erase_map fix for top/split sector layout
>   - Set ECC data unit size (16B) to writesize
> 
> Changes in v2:
>   - Remove SPI_NOR_SKIP_SFDP flag and clean up related fixups
>   - Check CFR3V[4] to determine page_size instead of force 512B
>   - Depend on the patchset below to support non-uniform sector layout
>     https://lore.kernel.org/linux-mtd/cover.1601612872.git.Takahiro.Kuwano@infineon.com/
> 
> Takahiro Kuwano (6):
>   mtd: spi-nor: core: Add the ->ready() hook
>   mtd: spi-nor: core: Expose spi_nor_clear_sr() to manufacturer drivers
>   mtd: spi-nor: spansion: Add support for Read/Write Any  Register
>   mtd: spi-nor: spansion: Add support for volatile QE bit
>   mtd: spi-nor: spansion: Add status check for multi-die parts
>   mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and fixups
> 
>  drivers/mtd/spi-nor/core.c     |  10 +-
>  drivers/mtd/spi-nor/core.h     |   3 +
>  drivers/mtd/spi-nor/spansion.c | 325 +++++++++++++++++++++++++++++++++
>  3 files changed, 334 insertions(+), 4 deletions(-)
> 
> --
> 2.25.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
