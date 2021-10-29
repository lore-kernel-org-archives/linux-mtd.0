Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66806C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 19:10:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28E81611F0
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 19:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28E81611F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iecu6nhBov4Y05ynHjKQqhccZHIPFhph3FEDAoWhNQM=; b=eua8hrtxDOSCnj
	WuigAxAxFoviQLpnnvJKMgKQfbmjIbUNtqyWl6RyxpgkTPC3kSCWyA/bXJNAgUvBATVndA+tKlTie
	oUCXegkNQ0rUCq3+IeIKqqPfLVeQdUHvVaJu5Hz+dTPhF6zTLjvuKmwTn/IR7jrMVLrOgG6cr46mj
	DqNDjGY/YU773kp+o/wpNJexzHtVkOfn+cq8jHOakzqhTUXf136+AwhPa8IzUWqPIXUdrVgMIvUBW
	E0DZbufaKJvk/hYa/83PSvh9+YbxEhPk5KsTHhdnAlq/XRHHXM2QESbTBlh8nJacNXFMyxPyw9EO5
	X5wzk1TTWXfM/FLtGp0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgXG9-00Bvp3-VS; Fri, 29 Oct 2021 19:09:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVm7-00BbTa-MQ; Fri, 29 Oct 2021 17:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528884; x=1667064884;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gz1j9EGUWxHYzrx6g+r/r9CcAl16SyVFnEeJzOfqpFA=;
 b=HzAfo37HkM+XsngK9Kd+pbSEQSwBL9DrbQkC+yQFYx+RKZgiIf/MesbH
 2NwWAhD0A9ErvX9dclIrNmqSpONX210NSpbHNQpJJj/879x24S0YyP4iy
 6SeBHmhPEKUzQ2UeDg8qKhUlnzqNFPjQ0s/MOI+yD8VKSi53Vh6uJfs3I
 iou2c5pesEKzTVyizYOTLvPAj+RLzb7lRWgByLMPuQjnKUx0ik9wfPhZe
 rhtZfUOmQfLp9uUU9TKQUcLdMCTc2hY61PENE9Hki0/wdvuU9xPHhVmX5
 MkWNqa9upITjdzCFLGfSbqZOKO/S9mNsjmNkZbQehNPunAbeGXBF7MSNz A==;
IronPort-SDR: Id+ycYRb025rW++Fhejbl0TBnUJVGsUIoDy6EMCl6xf4lfnLnhzf9eNbuItIMjCYoEAB4ClXTl
 BDNUZedlbCc3a8FUaPbmYYGuaWx/OdXpHXh+CfcwoH3rhFInRYJA3FnVV3I7JeQg18qXdFS604
 At7BwUIYJsI3SBk8oXHmhcard6Qk0MjeI7Qr3qiRS/SxMTOK93SkaR/Xu47V+JKEVQRTFIJoBf
 NtRLkgP8JtSaDNtNX7Uf+vlxFkBeee3lCAGsGNl0ZOf/hO7YyIV4iguXXqbId7mUyQNKSvJ0M7
 JpynimP8apx2oxyNifzlk5sN
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="141587899"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:34:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:34:41 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:34:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCoHGO/iOkKIZPDWGi5/1Eo5sCs8k1S6ARQN04AVHuX69xnOcjekgMZp3HFYv69XC5yamRVano14WXl/6DRj6CeDcwO9n1ME6md+KJvBn18IH7jq6ZuEPT0WCHmaEV+8QpMtjaUzYcRXL9hbQCPGxbtyv0IAO3g2ns/zSIPr0syWY+WSoDav1CbEunNphlyw/PAgMbidyieEYPnW8IqAjr4ZTHBLX0ghGlcADtJaV2HX9jE0pjjDnLPQ3Zh0sTuGSuCwZhAYDvg7/bgiE/llZOtG5AuWF0aOwQD9ZzSvvF65eASVQ46XZnyYDtSQkB7/UDN2fKgqLWWsEDj3oAdXZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gz1j9EGUWxHYzrx6g+r/r9CcAl16SyVFnEeJzOfqpFA=;
 b=X4M/X1oE2pWQFC9a3smaR9X3PxJQd0Xth8ApLywrsLTueSNy4ID18eJ/xNBf6siXBcW9jtbvseh9idc4i0rVctC2dZ+tG2xApMKmY3Locq+c7464O9mhDnuy0VL9IE1B6Kw9uwhspbO2z1tlhdF4FifG5sIVwfG+XPQDkYt1cINl4eO1bRnlafvTdkpv0AofSv2rxHFnOulB9QHCSDUqt18aaa9jyy4V5t0NIYGqSJbhVN9gwkdH0ijtRqlqP9ro6/dptw5wOewVSfOIoZbOM564Xc78mOLZn86EalnIrbygMAypELclnQvUyebXqjT7/BhPADc6C9c44cVBYf/yrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gz1j9EGUWxHYzrx6g+r/r9CcAl16SyVFnEeJzOfqpFA=;
 b=qJJCtoo5u3mQw3R6Te6hek0z9tjX5LVRGiSV86c8pVkWpNQHyM2RLqowR9efjrXF6rm3R1fH8DWNS0DbXD8ZbiBqNVPgC1RjLKV7kP8z+ZMhwnimnCGSjXMFj0mq6IX4ZKGStEV9rjDlRJu6T8SlsH+HsQOgWvFH72Q22c4U7Jc=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2829.namprd11.prod.outlook.com (2603:10b6:805:62::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 17:34:35 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%7]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 17:34:35 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: Re: [PATCH v3 25/25] mtd: spi-nor: macronix: mx25l25635e: Init flash
 based on SFDP
Thread-Topic: [PATCH v3 25/25] mtd: spi-nor: macronix: mx25l25635e: Init flash
 based on SFDP
Thread-Index: AQHXzOs9kEH9IrKuH0O5+Zk/TNst3A==
Date: Fri, 29 Oct 2021 17:34:35 +0000
Message-ID: <85d1928d-d9d0-706f-d181-2ad530384f7d@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-26-tudor.ambarus@microchip.com>
In-Reply-To: <20211029172633.886453-26-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3dc5927-6938-4717-6543-08d99b025ffc
x-ms-traffictypediagnostic: SN6PR11MB2829:
x-microsoft-antispam-prvs: <SN6PR11MB2829445ED5BCF7A5356C5DD2F0879@SN6PR11MB2829.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7dLTzJ+pVYLeaCAxMJQTh79lDWozNUsRmTMkAPrJC/1/RBkXPbyOH1PKJbDvHqX3faztwdmQkyZs8ODDh4VeURL+ETAZK91Mi/CgMm60eX7xLR7n5TKaxxEzLikWgcKHBsyyeIDch78zsl84PPnU0lNfhyns0LTA1GX2nm/xRD4SXmDe19YAsp5R/juggvk19FxtdrfUCqeo1XxjmaWnUdrBYzKeGO9Ki3cufZUqBb4PQ2RR0/FpggzlGMylztgdqzUImCoNA29hn9AR2ndO3A28NkRsntd8YvzCjtI0jatiz63wyn4ibjjpaM012exTVsJuiR/zUaVr1xcyQ7MbTrMUaesFwjmc7IQOj9O7N+yThXGjV4A1JQl9DTiCQcXu5oEXOqO6tsSCfOH3Vu9zNcMzTmvBsfNPscpeJ5PxkuE+W5n4TKwanawbTEdZ6WfZ9VvzHAny+hY6xYBQxAxsgVfBnF1KBfOhM0PXEdnolXSoQzWdsjfVPS0e4HvOEkSteKmhuREb9hLEDUIy7cr+WWvOxvMNb9AiKPIiwUb+HDr3HCkoZwz0K3agDYyfRdU0pEjtXjl+w8ZqhruWljrMYHnzzG2CA7ryFvGNi4jnVuucbFh47DzwMgg7mAOlifp3nVdI3vMoORsKORqJbFAgw4nJd5PSLw105Kf777mMrFe7YX5saemDxrMExu6efriKJZUeKet+Q6K69EuL8amYP402EbWZNaZ6M1h051+NFyk3JyfCu2I0eluRDWOmQZflXDE4FPsInwXflQVUPGm10g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(66476007)(66556008)(64756008)(38100700002)(110136005)(316002)(66446008)(66946007)(8936002)(83380400001)(53546011)(26005)(38070700005)(54906003)(8676002)(122000001)(36756003)(5660300002)(31686004)(508600001)(71200400001)(4326008)(2906002)(31696002)(2616005)(107886003)(86362001)(6486002)(76116006)(91956017)(186003)(7416002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVowM29ERFB6YzNzTUdjZzdsZnVoVVlZci9CQ0VVb1h4MitBTXgxb3BLYzVy?=
 =?utf-8?B?Mk0zVlhuY2JtTmkxbHJTYnM1TnI1bm1ZNWxueVJWQW52dkdoWFYyRnNwaHh3?=
 =?utf-8?B?QlBWUkE4dFNKQmJuaTZKNHgrSitTVytUK0pqSUltQk5xVnBLRVcxblZrRERM?=
 =?utf-8?B?Ymg3V1BxWmFWcXdPTTJqNy90QndaLytkVTBpN3AvMnFYeTlvY05FcGFuRzlQ?=
 =?utf-8?B?Ymx3bDl5dkptU3FvbkY5S09pSXdDU3ppaUtEUCtCZXJoMFZUa0hYNk5pb0hN?=
 =?utf-8?B?OGRtZDhab0xvL0t4RWhId3VPRy9NdWhzUm1UUTRtbUFhM1NsT2M3SE93ekth?=
 =?utf-8?B?M3F5Zm5idjhNOHRsay9iemVFZDJSUVp0YWNnQkJtelozTTFtNDREV0ZKaE42?=
 =?utf-8?B?VWJJWU44MlNEamthYW00OXVhYnVVME5Wc0V1WmowR3FyNnFBTXRTMm9ZdmpT?=
 =?utf-8?B?SnR2UDJiY3lrWFd3MXRsdGd1NEFCRTBiTXBLWnAxaVlaNzlhcnBvdXRveEpr?=
 =?utf-8?B?dDhqeGpCRDF1VXJORGU0eXJ1QkUybWdvUFErTkJxdGovajFYSEMzUTlyekVZ?=
 =?utf-8?B?T0VpdWV4aCtyM25OUkREcGd4YnZwd1hDRmFybU45VEFSbTg1amplUlB3eVY4?=
 =?utf-8?B?bUl5YThlSVkxUXdMMG95YW9vRldKUERaN1k1d1VHdkE3U0FsR09EL3RVanBj?=
 =?utf-8?B?d0FaVDBTZEo5alF5blNmUkVONUpwMW9FY3Z2YTVKS0dYYTZxbTlnVng1ekZB?=
 =?utf-8?B?eHBsSkNwL2VIamVqS2VFcUltWFdKL0REUVpmaDFrMjZCZnBTb1g4UTJNb2hn?=
 =?utf-8?B?YW1PY0RhdzFxMmIySkc1dlEvUGxXd0hpWklsTnMxWVJsSUY0RlFDT3l6VTEv?=
 =?utf-8?B?UGNjU0JJUktKQ3RnczMwV0xpVGlKK1hnQkFhOGd0Mm1DK0JreTk3NEpHTldQ?=
 =?utf-8?B?MUFnaWlPV1BUNHdOOTFaT0ZiT2gwVm1kOGE0c1BUcG41RlVRNGorYjNBRG9H?=
 =?utf-8?B?UmtXaGVOT3ZYVld1N0d1c05BeS96Z1A1U3ZybitJSkpKNGJXN1ZQRWljWFgx?=
 =?utf-8?B?dTlGWk1pMFBIUFd4L0hoNlhzSHFvMm1vZFR1REFhWlQvZFRhUXhyc0NNMjNw?=
 =?utf-8?B?ZEdZS3Vpcy84QS95UW85RnVGTy9kM2lMRDkrcHhIMlJPc3Y5R3FzNklZb2pJ?=
 =?utf-8?B?ZWJoUjFHSEt1N0hLSERGNjlaaHA5b0pyMkdsd3k4dHVBU1dqWVVzOFJ3NEdn?=
 =?utf-8?B?R1hkUzBjZk5CcDFUblA1ZmpEUkc5K1VqWVh5dUdINkUrb3BtaFpEZVhHZy9P?=
 =?utf-8?B?cVNGWS90U0xGcit1cjlzZFRSQ1ZSc2lKNGEyNG0ya1cyb01uRjROajg4NUNB?=
 =?utf-8?B?TnkvTmdKcnpVbThJcnVXWUZ6TG1WaFVWUmRLYTViTGNwM25YZlhqRzhsMURj?=
 =?utf-8?B?blM2OStoZGNqeHE5MTJVeVF3L3lzRlhJTDMvdG9mNnk2MWNtcEdEWHNoNnhL?=
 =?utf-8?B?TVp0UFRzOCtsWTZpWTZBNHdBbkk5RFV5THlkRExJdXM2V3Y4dG1LVnlaRUhz?=
 =?utf-8?B?QW1GQ0hGdWovMmswUmlZY0l4cnBzc0dvV21jZVNBTXpzeHBIZGdSa21rT2RW?=
 =?utf-8?B?MnR6SkNGanJPN1A2d0lrZG5RdnF2ZE51Q2l4aFFDREh2bmNoalF6MVVzTXVY?=
 =?utf-8?B?bW9vcFVibUwwbXVYRVZwSmFmbElndURJUTVOOWZmQVRPTkRRMUtxUXhmam5z?=
 =?utf-8?B?K1laSk9CRklYWHdBSkdDM05EczNCelZ3Z3hkOHBleExjRDhza0ZxL3Nnclkv?=
 =?utf-8?B?ZTRFa3JFNUtuVExZTVJsSTAzRVhaRVE0bDJuMkh5SEpWRTlTdXJuMUxWSnlE?=
 =?utf-8?B?a1JjU2RaSkhlMlZHQU82ckNWc2hvam9kd3d5Nzk1QkF2Q2lTa2grM3EzMGJq?=
 =?utf-8?B?d3FiVER0WGd1RGd2ZUh6ZitwNEJLUDRmVm5SM2pEYnlLMjlqa1h3dW12bUxO?=
 =?utf-8?B?ZmdMZEFwRjBrQTRSbXhiSEx4ajF3bHkxelkwUnBRbkU2S2FuMm5xT1dMNi8z?=
 =?utf-8?B?QThZdFJDazFMeWJFRy9TYURyLzN6ekRzckx6bjZ4RFE2dnNpcFNVcXUrVnJM?=
 =?utf-8?B?bDVYWWc0SmlGYUtNSmtyY1Izb2NvUW1sVTJGSWx2dmVKTmF1dFJScFAxT3Q0?=
 =?utf-8?B?ZXhpdGJWNXBjTUpVKytrZCtUOUtZaGdNcGhjWVFldzY4bStGWDVlTzJhZkY0?=
 =?utf-8?B?Mm0wWTVQTTZwd2F6bFk2MFRBem1BPT0=?=
Content-ID: <FDB8515DF0021E4DB908F832AF9BB090@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3dc5927-6938-4717-6543-08d99b025ffc
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2021 17:34:35.1565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HVOKVUGz3sdkdC71UjkvFTwCBPNOSwoCUg6uLMHXJTZSU1duDlrNJ1rimE5uoGq7ypYFQnIWe3P/d1PNf1i2O/km/D8qtSWovUQfeGKdUD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2829
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_103443_849932_0BD0406D 
X-CRM114-Status: GOOD (  12.72  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw, richard@nod.at,
 esben@geanix.com, linux@rasmusvillemoes.dk, knaerzche@gmail.com,
 Nicolas.Ferre@microchip.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, code@reto-schneider.ch,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, sr@denx.de,
 mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/29/21 8:26 PM, Tudor Ambarus wrote:
> Get rid of the static initialization of the flash parameters and
> init them when parsing SFDP.
> Generated a 256 Kbyte random data and did an erase, write, read back
> and compare test. The flash uses for reads SPINOR_OP_READ_1_4_4_4B 0xec,
> for erases SPINOR_OP_BE_4K_4B 0x21, and for writes SPINOR_OP_PP_1_4_4_4B
> 0x3e.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
c22019
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
macronix
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/partname    
mx25l25635e
root@sama5d2-xplained:~# cat /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp > mx25l25635e-sfdp
root@sama5d2-xplained:~# hexdump mx25l25635e-sfdp
0000000 4653 5044 0106 ff02 0600 1001 0030 ff00
0000010 00c2 0401 0110 ff00 0084 0201 00c0 ff00
0000020 ffff ffff ffff ffff ffff ffff ffff ffff
0000030 20e5 fffb ffff 0fff eb44 6b08 3b08 bb04
0000040 fffe ffff ffff ff00 ffff eb44 200c 520f
0000050 d810 ff00 59d6 00dd 9f82 db03 0344 3867
0000060 b030 b030 bdf7 5cd5 9e4a ff29 50f0 85f9
0000070 ffff ffff ffff ffff ffff ffff ffff ffff
*
00000c0 8f7f ffff 5c21 ffdc ffff ffff ffff ffff
00000d0 ffff ffff ffff ffff ffff ffff ffff ffff
*
0000110 3600 2700 f99d 64c0 cb85 ffff ffff ffff
0000120
>  drivers/mtd/spi-nor/macronix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
