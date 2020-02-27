Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC5FC4BA24
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 08:44:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C4312467B
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 08:44:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WGr6r+Nt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=niko.eu header.i=@niko.eu header.b="UruEchmN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C4312467B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=niko.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LVk0Oa9mhSshF2Wpc//sgR96E99KWb4IyzKwnkAmsAc=; b=WGr6r+NtN+yUQwVCFIT3oiRHa
	LLljwDyWqdi/+0EmQLH9sHlangl950c9RHwGnCeSBlKsd1dglPG+mm1Fpz2ubPiKF7Z2Wzrr3J39q
	C7kefW83laBTOrG5unuC/MPs8lbFBzllZA7X7qFKJR6PHPCZ6XJeZMFN7XclD6/9Udy1L/RQ0kkei
	7Jy7boEcwtd8lOQi/N8/Or/3+uzP1Haz8FGo3UloX3/6b1vVtNqMJO+/bbmvf1BV1MWefi2wf94CS
	WLPFUI13liy1ANCQkXmAqrKRDB+MeJxJRnLs9o/IyoE5GhDKDSYDZT0UAsDjv4oGDV1kGQGol+XX6
	rYnHilPFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7EmV-00025f-QS; Thu, 27 Feb 2020 08:44:31 +0000
Received: from mail-am6eur05on2050.outbound.protection.outlook.com
 ([40.107.22.50] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7EmT-00025C-BX
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 08:44:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVs44ipeD4exLiCQ/ubDzUReY8gPMWnIORvoXKSOJ4Dw6Usn305iAh0ReUtnJ3ceTwhLtDqrrcigY1QuGt1EO3s8P3Lu6OTaj1LMOTvQdPtg+IB/eTJkPqzCVl9nE1Je9GvplaD5R9jHLkrxaKZjKkbzTcCIFc6KQcgPxVKOYGXOjdxqQMVysmevn6dicaWWIUf5YZPuEdYGuF6/DibdVOZzweWOFYWUxTbF4YWa0ioVFvyiRC6hUXvLC8I+C/t3ebxfHtIy6UY6uFpQHoKGSD6OLLjruAray/XbIQu0JPC03bANINQGIbQgsucu+JHC/VJ/HGbQYpwNqGXRSUK9CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1i9WLfIGDWxzVg6K7D8kOk/SeIkH/K+daHg3WdetD10=;
 b=MUgJe53namX0bIueEMNyOP4ZgGbVUvkP0sOY7Mnzsxo1weaG4RUPvGsSNSgVIlkz6pGhxIuhqlvUP8zz43Ql1N5JtpcyU9NOjM0tH16eokEbU/pCpwkZ4mvhWtPla257R8HTVOlaHUxpE0jSvmfCyfuReDUD5gGF8oc59JIb9boPH+dK49yM7Vc78C6fPAAerttjKbrNn0iUfpvcFUfftMTtLj/qGub+9K41m/kqEWXW8aukOMPE0x1eE0398Rj3E1q3ReOozoEAVPcTk0gxf7B+mhsgvTj8CwX2KC4iEciuea1fSQfQcwp4n+JUERv/mX2l+RcgnZdzxOosiV0yuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=niko.eu; dmarc=pass action=none header.from=niko.eu; dkim=pass
 header.d=niko.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=niko.eu; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1i9WLfIGDWxzVg6K7D8kOk/SeIkH/K+daHg3WdetD10=;
 b=UruEchmNBo+dvCuOpBsdPDueGMUzRfOlv06uX/olQkRsmXpNg0E/Oemkb+soW0eM8cYWuNH3+maDPqU/aocBMd7eekFwbuY0DTQdN3DSlVtKx7bccwFPfE8rGwzOv23y4t3xBQyaF57pxBN5W3U9Zxvdi78fqTg2mJmzr7iFsWQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jef.Driesen@niko.eu; 
Received: from AM0PR08MB3874.eurprd08.prod.outlook.com (20.178.82.86) by
 AM0PR08MB5506.eurprd08.prod.outlook.com (52.132.212.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15; Thu, 27 Feb 2020 08:44:24 +0000
Received: from AM0PR08MB3874.eurprd08.prod.outlook.com
 ([fe80::1548:5958:de47:1434]) by AM0PR08MB3874.eurprd08.prod.outlook.com
 ([fe80::1548:5958:de47:1434%6]) with mapi id 15.20.2750.024; Thu, 27 Feb 2020
 08:44:24 +0000
Subject: Re: ubifs: mounting fails due to error in orphan file handling
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <0d3a2ed9-8ff0-7030-a8c6-c5a204eb6b5b@niko.eu>
 <20200205092202.5f0929c3@xps13>
 <21a266b9-ff3f-7a94-4562-11d6f59d4327@niko.eu>
 <CALLGbRKotskAgZpxNFHF+RdrA0HB7U2qw6bzvZ9WDJEAiWYwgQ@mail.gmail.com>
 <d86c95cc-3393-0f6e-73ab-56a5bbbbedd8@niko.eu>
 <CAFLxGvwKfcw=Com5U7uGsA-iJ9SuQyqHdEeaWPUmnoxqwma0Gw@mail.gmail.com>
 <9ff6f4ae-8dda-608b-4e60-6d391cb4efb9@niko.eu>
 <CAFLxGvyaBu8Uu9xMgk2fDK_erv0eOb4B3_JgjLM9m0iu66Gr8g@mail.gmail.com>
From: Jef Driesen <jef.driesen@niko.eu>
Message-ID: <fd364e81-b816-1b77-317c-cd030b7833d0@niko.eu>
Date: Thu, 27 Feb 2020 09:42:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <CAFLxGvyaBu8Uu9xMgk2fDK_erv0eOb4B3_JgjLM9m0iu66Gr8g@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR04CA0140.eurprd04.prod.outlook.com (2603:10a6:207::24)
 To AM0PR08MB3874.eurprd08.prod.outlook.com
 (2603:10a6:208:108::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.31.0.155] (91.183.54.155) by
 AM3PR04CA0140.eurprd04.prod.outlook.com (2603:10a6:207::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15 via Frontend Transport; Thu, 27 Feb 2020 08:44:24 +0000
X-Originating-IP: [91.183.54.155]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8e76efd-ef6a-4de9-af99-08d7bb613f4c
X-MS-TrafficTypeDiagnostic: AM0PR08MB5506:
X-Microsoft-Antispam-PRVS: <AM0PR08MB55060C76C66CE20C02000AADE2EB0@AM0PR08MB5506.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-Forefront-PRVS: 03264AEA72
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39840400004)(366004)(396003)(346002)(199004)(189003)(186003)(86362001)(26005)(8936002)(16526019)(53546011)(81166006)(6486002)(81156014)(4326008)(4744005)(52116002)(8676002)(316002)(66946007)(54906003)(66556008)(5660300002)(16576012)(2906002)(66476007)(31696002)(31686004)(6916009)(966005)(6666004)(36756003)(956004)(44832011)(478600001)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB5506;
 H:AM0PR08MB3874.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: niko.eu does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8WHFudGznsF25t+ns/gqoWwMw+2dvf5ErnPFqayGDE3oIzTDmBfWl9wlhKovMMN5ohdnJ38UJ/kC6fTlh3UAGfugwVy8Gkgd5FlL85JnxAP2WFdRumfpByT4vU74atM87VSGlFgXBY62PWnc9W0TYIB2o+bRuH9jVh+y55K9p0d5yH+Qr3yl6lXBGuQQmZwm61LNZFfTCmgM2bgglCXuqrZ71GZGyWmmVqHTLqCxNptcjq9w9MBwHJP/LvQZdnH+eG46W8jr60AJjfzKaICKGRs/HSqPPgd09njKbcxnh6tZxs1ckfbG7hvLwQpGgJpMsx4RSIAsiSMFMefOUPbffQh/zKnc5zO8YPaUrPFogYWI+PSGbxfWRmwI+pNUgb2hAmkrvOpMpv+DaCkeRg0uZIRgGBZjdai0qBEjwqT4Xvfbcq4Qm1YnEgkqI3LYKOMhD58+5utm6cL8S1zvKEyfHmvk1ILlGE94B98v368FNdBY5WmkLhZarCOIERRpz1tBY7CAJo5PwczK0OBPt9HN2g==
X-MS-Exchange-AntiSpam-MessageData: LKTsYwKeEjyAp3pZ1/HGHjMu8QI7Gq0xqaomi3r0fQMvn0qr8Vdog0bYdldFaQyvRQJ+8tu+alHa5R+1JTBsmR48tnwdSMFtsNLR5LP+0qmDbJjA2cjhnUMcBblV72x34vcLx76ozOaaNM6zK7G69w==
X-OriginatorOrg: niko.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e76efd-ef6a-4de9-af99-08d7bb613f4c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2020 08:44:24.6615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a4faf0fe-ff3f-4912-b675-3cfe1470e385
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ARe1fb9O+Z8G9c3Iyp+N6OCXtxcjqN7zz/yk5T3k9ANOxSIE41Rpa6eBwSNut0ybar1OGVk89fiOxLUbKY8bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5506
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_004429_601220_134BFC5A 
X-CRM114-Status: GOOD (  10.55  )
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
Cc: Steve deRosier <derosier@gmail.com>, Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 27/02/2020 08:55, Richard Weinberger wrote:
> On Tue, Feb 11, 2020 at 2:47 PM Jef Driesen <jef.driesen@niko.eu> wrote:
>>> I send a fix for this before I started traveling:
>>> [PATCH] ubifs: Fix ubifs_tnc_lookup() usage in do_kill_orphans()
>>>
>>> Digging currently thought all my mails....
>>
>> I found your patch:
>>
>> http://lists.infradead.org/pipermail/linux-mtd/2020-January/093390.html
>>
>> I did some tests with it, and it appears to fix the problem for me!
> 
> Thank you for letting me know!
> Can I have a Tested-by?

Of course.

Jef

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
