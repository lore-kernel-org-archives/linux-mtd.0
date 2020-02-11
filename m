Return-Path: <SRS0=wpEZ=37=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED0EC352A3
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2020 13:48:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4174020842
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2020 13:48:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="syc8yM3E";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=niko.eu header.i=@niko.eu header.b="ouCrQH5l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4174020842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=niko.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Di+2v2SMf2XjcljxQ+BVLx2ArMOoKmFTi2v9bCbwGec=; b=syc8yM3EZEI+oYS4vH6YeLIDr
	cS2cjaAvps5BD+kG4Uf9u54zeqdbkPW7nhF3taPNUxQD6BapNLcjK2+dmqg8SvEMwViHc+InSaxEH
	N7WENE+5wDv9lHOL/3URNq47Wpm6I1co07P3hGS3XlFzvtZNRkFjbFwAT1Nnd0j3otk4pyQdZZ6HK
	zMd0G9sluBJlWcc8JuSl23XA80aXq7SAY3d0/KhQj3yx8OBQ9C7GIi/f1PNFSqybciKKfETFMBACV
	5BRrRJ1rqk5fLy/xWruzfIWtUBzHcI2FzjN+RyWXj0BRZ0HWpoRKjQ7THxX8jG0JY87adSAVUHrko
	v5m5bwMAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1VtL-0003jT-2i; Tue, 11 Feb 2020 13:47:55 +0000
Received: from mail-vi1eur05on2085.outbound.protection.outlook.com
 ([40.107.21.85] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1VtH-0003in-VO
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2020 13:47:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYIP2oYZBYGplOML38isqJdlob6n0lE/AohOBNhjguXW2NjLE2uCdgJgaZdupM1uiO6ZvDOXySk/qZ5EYhUuCvXO2QPwZj0WCgBPB42cb+ueHSOIb77KI8kOi2nOvmwWn+aINMiQMHXeLGRmNG9WaMYTxHD+WvdcpWAFNvYKj7GCNyP75gdB2Mt7OqVUabGrY5SRK1+s5vbCBw7KXtwEAuFdmteds3sVmaQAyZzDdVCMGMWaJnx+dEJklyrodBYmVfVRWEiH7i1hxS67f3PrppwohUicxZyByNM2RfBVPadm/FE6O6n8TtwtJmTBp2t/DjNIOTY1NFHTchbC24x6eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUpnxEroY/bAHdHBFBm7cdoUm3mEBPA1IKpeAVIMdJ0=;
 b=QACrpGahnQ7GreCYFcMWlkMfPlI3YZJ96EtrEIfWc300eUA2CQt/7rcRcphQikD6fACztplF+8HFyD63uAMUx9RoOlCf5rbOV/UdFb0+kyBsilOLUIjSq8bXxvl2x+g26sZTdlZJom/A2yh3orNLRH3BfWBV/EHqdExhhk/h4x5/LtBESSR66gsOCUUCOthvryWbOUK9gI6A2n1QjTTMmL3UjFICky0Leuig6yhc/fAtY49kNgfXrzTclexRzMtcgMb/FnU8hYCV96wnnjZjc6BGILYaU43UVkcHwMYdOO8SIxrf8C/uPMAIJCdrFc/NzObV/y8rSjjS+1sbqHgBCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=niko.eu; dmarc=pass action=none header.from=niko.eu; dkim=pass
 header.d=niko.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=niko.eu; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUpnxEroY/bAHdHBFBm7cdoUm3mEBPA1IKpeAVIMdJ0=;
 b=ouCrQH5lQXyQxV+aILuJd53xDzuRv4PRu4dM7FV6ziAmvJQi1raHSSix3hNUIHQs5L4YuxzMgoDYmQU3465MMX6jVUG3D35yPxNOB18VYjm514WqrWV9+9x60x5u+usDYNVEJYtS5DyBi/3Idkm/jF3xN0MpWnyApUhhFtsFTpM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jef.Driesen@niko.eu; 
Received: from AM0PR08MB3874.eurprd08.prod.outlook.com (20.178.82.86) by
 AM0PR08MB3795.eurprd08.prod.outlook.com (20.178.23.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.26; Tue, 11 Feb 2020 13:47:46 +0000
Received: from AM0PR08MB3874.eurprd08.prod.outlook.com
 ([fe80::1548:5958:de47:1434]) by AM0PR08MB3874.eurprd08.prod.outlook.com
 ([fe80::1548:5958:de47:1434%6]) with mapi id 15.20.2707.030; Tue, 11 Feb 2020
 13:47:46 +0000
Subject: Re: ubifs: mounting fails due to error in orphan file handling
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <0d3a2ed9-8ff0-7030-a8c6-c5a204eb6b5b@niko.eu>
 <20200205092202.5f0929c3@xps13>
 <21a266b9-ff3f-7a94-4562-11d6f59d4327@niko.eu>
 <CALLGbRKotskAgZpxNFHF+RdrA0HB7U2qw6bzvZ9WDJEAiWYwgQ@mail.gmail.com>
 <d86c95cc-3393-0f6e-73ab-56a5bbbbedd8@niko.eu>
 <CAFLxGvwKfcw=Com5U7uGsA-iJ9SuQyqHdEeaWPUmnoxqwma0Gw@mail.gmail.com>
From: Jef Driesen <jef.driesen@niko.eu>
Message-ID: <9ff6f4ae-8dda-608b-4e60-6d391cb4efb9@niko.eu>
Date: Tue, 11 Feb 2020 14:47:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <CAFLxGvwKfcw=Com5U7uGsA-iJ9SuQyqHdEeaWPUmnoxqwma0Gw@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0046.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::26) To AM0PR08MB3874.eurprd08.prod.outlook.com
 (2603:10a6:208:108::22)
MIME-Version: 1.0
Received: from [10.47.50.91] (81.83.24.121) by
 AM0PR10CA0046.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.24 via Frontend
 Transport; Tue, 11 Feb 2020 13:47:46 +0000
X-Originating-IP: [81.83.24.121]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22f5828f-3bb4-432a-c683-08d7aef8f9bf
X-MS-TrafficTypeDiagnostic: AM0PR08MB3795:
X-Microsoft-Antispam-PRVS: <AM0PR08MB3795A5B278A7D6C1323AA987E2180@AM0PR08MB3795.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-Forefront-PRVS: 0310C78181
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39850400004)(366004)(199004)(189003)(31696002)(86362001)(26005)(81156014)(316002)(16526019)(6916009)(8676002)(52116002)(186003)(81166006)(16576012)(2906002)(4326008)(8936002)(44832011)(66556008)(66476007)(31686004)(966005)(66946007)(53546011)(956004)(2616005)(36756003)(55236004)(54906003)(4744005)(6486002)(478600001)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3795;
 H:AM0PR08MB3874.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: niko.eu does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /uKq93LLQmp+6Uv6DyzACWtogvff+G7cRUlnD/ha4PQmwT8Wa9ch8LIapw6/6+0I7PMY6f6pqtE9nAPdXzsn7W7Gih8OIJJpTF+gbl9QRGZYrykTj1TaCygZLaCHl6TuyA/Q+DDjh9DPWFAHsSFvku2ZHlYnIFSNUFns53HxxzuOAjJT6gD12McMzy/SuuFiWjclTpAy2q/F3PB7HIHWC0jir2xlIi/TtQdtbEJ5M8AOjkk79VpmGvfzGxO7Vk7f8mWh7PCiQ5eeEh5EgSaooc9uwN9JpMmBFRrMAT7AIJJECGDLLDsQ2gQbnXvU/1lxoNs5A8B9UmIB1gdkBzI8LcNTbHwAMMbKA+XcHLOY36N3Jj/IgfoPTmnLgGQVGtnRg8KK7/YrbqYTkeQwGJAnAiQr6AtQTIef3OTvz6VfYFHvBfhZ5HU/kzc6zREI7iIlSsx/Bfikveg9KYOjAekhZSgJYHuZCgA6yFeFAs2xXF/qMh96WIWBEwebqGaumqJmntvcSoMg3KuHIsbHTL2IXQ==
X-MS-Exchange-AntiSpam-MessageData: WwBbzVc3aiTmjoxRLNWVTSyph+9SmMHyJa7OXqSZfJ7oN3mlw6kwk5x4NvLdrpXtaE2X0FwOd5UdSsH/nrNrYsDhGfI2lpRbBb0iYNVaJHxftvo7aVgxjltT/g4Jm8YkA9IfHoUk3JxkGvIJaTErEQ==
X-OriginatorOrg: niko.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f5828f-3bb4-432a-c683-08d7aef8f9bf
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2020 13:47:46.4780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a4faf0fe-ff3f-4912-b675-3cfe1470e385
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uybd3YrPy3ngx1jw43bJG84RdimA/dGgF7XC0m5i3rmZD5FXz3FZRAMMuMCA4Y50GfZQqCTtKtGbKDMbLcOUQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3795
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_054752_225344_CF0DA428 
X-CRM114-Status: GOOD (  12.48  )
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

On 2/7/20 12:04 PM, Richard Weinberger wrote:
> On Fri, Feb 7, 2020 at 11:18 AM Jef Driesen <jef.driesen@niko.eu> wrote:
>> On 2/5/20 5:17 PM, Steve deRosier wrote:
>>> Looking at the comment in the mentioned commit: "This corner case
>>> needs to get addressed in the orphans subsystem too."
>>>
>>> Was it addressed?  Was there a second commit for that?  If so, is it
>>> in your tree?
>>
>> I don't see anything relevant showing up with a quick:
>>
>> git log ee1438ce5dc4d67dd8dd1ff51583122a61f5bd9e..master -- fs/ubifs/
>>
>> ...
>>
>>> Beyond that, no ideas, it's not a chunk of code I am familiar with.
> 
> I send a fix for this before I started traveling:
> [PATCH] ubifs: Fix ubifs_tnc_lookup() usage in do_kill_orphans()
> 
> Digging currently thought all my mails....

I found your patch:

http://lists.infradead.org/pipermail/linux-mtd/2020-January/093390.html

I did some tests with it, and it appears to fix the problem for me!

Jef

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
