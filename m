Return-Path: <SRS0=Kp4F=33=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 317C5C352A2
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 10:19:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 049B220838
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 10:19:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U/1Dqbhy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=niko.eu header.i=@niko.eu header.b="QTI3RQVV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 049B220838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=niko.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EVvEGiXF4h/5mst4FJlAjyYfVJYZeNzp4+X9Vb/EjjI=; b=U/1DqbhyYGYSB8KwBJkygx8n9
	EE6PrhvehlNzNfM+hV2rRmPRDgZ1Qlrm2dG9DVhMDZ30qiCtCqtKm4ULWY0WcrXlxNiCRURd/SlFk
	8/jayRGC/pBs3bTZ42N0LbnXFlTLd6e1WvsXwr8vEuion4Lm8vPeLnEAOeDykuO1jIYTW3H8bxuUS
	hVJgPBbbKidJlzwwdaBXhQuXtkLlvuhFd5RkdzxWqklVNZxf7F7366/4W8K7kDb7MNKdzD9OTs4WR
	KgLzKQbckMBO2ZrZRqwQBghDJ7sIAxSDeRqDXQN9yizFdXQwVqIdu9JMRcw+VZ7ExjtAOKGeiqdVk
	k7Uyx+/DA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j00it-0003J6-VK; Fri, 07 Feb 2020 10:18:55 +0000
Received: from mail-am6eur05on2078.outbound.protection.outlook.com
 ([40.107.22.78] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j00iq-0003IM-U4
 for linux-mtd@lists.infradead.org; Fri, 07 Feb 2020 10:18:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfH39Cca6LSRGHBwkGb0wrtPvRLCQDhC/KoUaqSV7NbPp5mOV/snZcxJ2kMJHtlUVvxxmtJnf3YqEtByhiL2/tw9unUBqj2tAmrEwmbBPXWCOhWqDMasxOfyPBoV7CzdydaxqYko9gq7kneS8YQwfjpJBRnzObG2h3JSSOEA65ZGKVgiLu02o3vxXY3RciZ+j88W8YIik3SX76KcQZHrYOqFmhPBIaE1NPssP8esittvSL3WuNpAX0WldESbGITeWPytyt0kJSDRvTLB/stuKOnXIO5Zbvwnd1X0VSvNn8ait7eFkdmBktJeHyr/w1SSJozVJG3DdXFC0MJbd2ygCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ML0Tt0SCnTBSUtHCwRBgCOFVSViOOnuOS/C0MILDjbY=;
 b=ZX7UNdN01rHbbvipV5x7wp+0nFV8FzXmugFu3QTH5TtqvbIDsUQBWWpIxZPD0cWdyqaJr3eXUzVXCCnt6PDfcZ7zFb7sjNBAh2owN/5UBYhd8pQl4LLL3ZFmVxOm1PDWzrBqnK0q8WK21ohlqUE01W91seH4Qbc4TJBIEolWyw0xsjJ761rO/mCg/H3AUXxJq/JWiHpa1Xz1zCGhYSf8kjgn10+gZctJoGF3tbJ3NMpckyfzBZa/vyye4Qye8JDf5XQx8I1xrZW1YAyc8C5SjzLZTG0NDQPHMIRxXkKZruoTb/ahRVTZqHKMbUjtLeLhxAJ1CGBv5frzK5jTH3HaUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=niko.eu; dmarc=pass action=none header.from=niko.eu; dkim=pass
 header.d=niko.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=niko.eu; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ML0Tt0SCnTBSUtHCwRBgCOFVSViOOnuOS/C0MILDjbY=;
 b=QTI3RQVVvy74kmRi5akrw/MeVg8KrX9XPc4qRHCyZNJVSUhz0jnygBayCk9oFOAAq2RitkiMP+3a6w6C3m2N7TH1LsxvtdaRt3SZsRqYKrA+AMbH/CQmn1HzNUhV87XmYfe5R6jRakq5M400EF20+QZP520YAKZ3ZiQnVSmF3lw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jef.Driesen@niko.eu; 
Received: from AM0PR08MB3874.eurprd08.prod.outlook.com (20.178.82.86) by
 AM0PR08MB5395.eurprd08.prod.outlook.com (52.132.214.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Fri, 7 Feb 2020 10:18:48 +0000
Received: from AM0PR08MB3874.eurprd08.prod.outlook.com
 ([fe80::1548:5958:de47:1434]) by AM0PR08MB3874.eurprd08.prod.outlook.com
 ([fe80::1548:5958:de47:1434%6]) with mapi id 15.20.2707.023; Fri, 7 Feb 2020
 10:18:48 +0000
Subject: Re: ubifs: mounting fails due to error in orphan file handling
To: Steve deRosier <derosier@gmail.com>
References: <0d3a2ed9-8ff0-7030-a8c6-c5a204eb6b5b@niko.eu>
 <20200205092202.5f0929c3@xps13>
 <21a266b9-ff3f-7a94-4562-11d6f59d4327@niko.eu>
 <CALLGbRKotskAgZpxNFHF+RdrA0HB7U2qw6bzvZ9WDJEAiWYwgQ@mail.gmail.com>
From: Jef Driesen <jef.driesen@niko.eu>
Message-ID: <d86c95cc-3393-0f6e-73ab-56a5bbbbedd8@niko.eu>
Date: Fri, 7 Feb 2020 11:18:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <CALLGbRKotskAgZpxNFHF+RdrA0HB7U2qw6bzvZ9WDJEAiWYwgQ@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR08CA0069.eurprd08.prod.outlook.com
 (2603:10a6:205:2::40) To AM0PR08MB3874.eurprd08.prod.outlook.com
 (2603:10a6:208:108::22)
MIME-Version: 1.0
Received: from [10.47.50.82] (81.83.24.121) by
 AM4PR08CA0069.eurprd08.prod.outlook.com (2603:10a6:205:2::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21 via Frontend Transport; Fri, 7 Feb 2020 10:18:48 +0000
X-Originating-IP: [81.83.24.121]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bd8f40b-b8c6-4d3c-3377-08d7abb71ef5
X-MS-TrafficTypeDiagnostic: AM0PR08MB5395:
X-Microsoft-Antispam-PRVS: <AM0PR08MB5395EC3208E5317FCB060A6AE21C0@AM0PR08MB5395.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-Forefront-PRVS: 0306EE2ED4
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(39850400004)(366004)(396003)(199004)(189003)(5660300002)(6486002)(6916009)(4326008)(54906003)(956004)(36756003)(52116002)(2906002)(2616005)(31696002)(4001150100001)(16576012)(86362001)(44832011)(316002)(16526019)(186003)(81156014)(81166006)(478600001)(66946007)(31686004)(66556008)(55236004)(26005)(8936002)(53546011)(66476007)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB5395;
 H:AM0PR08MB3874.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: niko.eu does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gZLElBfoVaxH9K5HIHoNypvw7yM3c/ZOz1Pnp4Cd5KyAvfXlKWw7PvaFsyTGGlernXRCMDHVssue1LWZIchqtlSteY1bFnQhWpATxLOjYiIFnQv08koeZXAengCKkRlZ9D+zd83Ao0hLy6fNqWIkgN8C9mZwJo26bjPvb2k8TPBfYw+R1y0Cg3aRUoGI1tf9lgG0m2YzHur9+34tlqA8J4jkvn0ssPh6nXTyqMPCCBWa/0mdB9vYmYtp8QVGisb/mp0qGVDR0Ep6FcDRZsnLivEbFQXxhgkq12c7g8sMVSwQo9ECBVV9yFjFmiy1uF8S9AYDVHufXTMQ9SBs+v7+cCU11TN8FaZsw5e64LInmWLOtWF2RUQW6ZqaGXkLe274NOqzBt4RaSJD5XKfAqMXmyQ3zI3i2Dl5m2bGM1CR0DrgUqjyFFncqw3RjsOGkPmy
X-MS-Exchange-AntiSpam-MessageData: F91b5ExR45zr0FIE0VRKEB6gAay308X4sZnMV44E591eUUNRKgD2ZTvgdRXrUTWktAESIdN8dwMvtB8WgxJcWYC1QEZovnyapt+mskhrejPkcsiskOerwEARKMoPKOwvH4ryRvQF7K/ozeiFvkCTXw==
X-OriginatorOrg: niko.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd8f40b-b8c6-4d3c-3377-08d7abb71ef5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2020 10:18:48.5304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a4faf0fe-ff3f-4912-b675-3cfe1470e385
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zfFJ1rS+UF2paW1A74cQEUYgBece6C6oVVoEfD2A7v3cnVya8bMrzZ5JQyjzGWyyw4rF5g8fQwx//OJ+skLIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5395
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_021853_193098_317607B0 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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
Cc: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2/5/20 5:17 PM, Steve deRosier wrote:
> Looking at the comment in the mentioned commit: "This corner case
> needs to get addressed in the orphans subsystem too."
> 
> Was it addressed?  Was there a second commit for that?  If so, is it
> in your tree?

I don't see anything relevant showing up with a quick:

git log ee1438ce5dc4d67dd8dd1ff51583122a61f5bd9e..master -- fs/ubifs/

The only fix that refers to that particular commit is this one:

commit 10256f000932f12596dc043cf880ecf488a32510
Author: Zhihao Cheng <chengzhihao1@huawei.com>
Date:   2019-10-29 20:58:23 +0800

     ubifs: do_kill_orphans: Fix a memory leak bug

     If there are more than one valid snod on the sleb->nodes list,
     do_kill_orphans will malloc ino more than once without releasing
     previous ino's memory. Finally, it will trigger memory leak.

     Fixes: ee1438ce5dc4 ("ubifs: Check link count of inodes when...")
     Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
     Signed-off-by: zhangyi (F) <yi.zhang@huawei.com>
     Signed-off-by: Richard Weinberger <richard@nod.at>

But that's about fixing a memory leak, and not the on-disk data.

> Beyond that, no ideas, it's not a chunk of code I am familiar with.

Me neither.

Jef

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
