Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E70DC4BA24
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 09:10:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFB692467F
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 09:10:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iqttgtde";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=niko.eu header.i=@niko.eu header.b="HNkvRmMw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFB692467F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=niko.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g38DXsQW2VLQyv+Vio2Yvu1zjlf3OieZ3M84ewGyvcg=; b=iqttgtdeQhVgRueUEHKWLifyO
	93WlCE6V4No2Xk0h6RdCa5xDWa5/FNJu5p74OYJMboSZMUnaPiKoi1+LHkV/ivQVWPcjRMbhDc6oa
	pr1w11U+7sDrKDobl+ztHaum/lk2QJmg7a1DrsNxFAvdhLHPVFqGjVvfnw5UtHmaU4k5cNinTLNgY
	M1sxDPWtqGz1TKKIv7EvsLecXYNgtJUlFpjuox1tyA9vnCyX8A9djU5SUXxZUZXT/0czeaS5Yj6Cc
	wPPBfGJTSnLUHb+EgnvqL4D5I6zE8xsM28EKWEus/76Iit7OAIxUV/a34v6dl1QIey8V4Fs0a3J0N
	1a+hXqRgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7FBS-0000I1-1l; Thu, 27 Feb 2020 09:10:18 +0000
Received: from mail-eopbgr50085.outbound.protection.outlook.com ([40.107.5.85]
 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7FBO-0000Gz-Tc
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 09:10:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gcxbgUkP+0U2miMTYhPqM2eEOPQQoXJ7ZXvvU1J4+KWIYMbVt4QCxewWE5HHN95YC3yDsECp1Sm2bYphbFEnp9lcggMp0UqGZKfYLkve/kCt9kTWNSssWwpjP1UgxfXaCuhCpzIS6FLviAQwhcQwyBBTrkr5Qa9DWQWNttm+umWyOquYouGsfO8fT4jGWDZKNFOoNnugcd+2j/0pBUxDTxmGMHMqJrkkmki8I5JT3DzFsdHzvSo3AJkiY5H6MbCkj9rMvYfYyenTPf5ZGBJ7VhjOOTkT7RlkF5NWlO4A+L9sJK7KTzjL1bxieI1fOOuYdboQomcqeS0jAN+AIOENHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8BrVJwxM/2ORZ4HUtOrWEQzaKC2XD7f7H5cCoY1yzk=;
 b=bQVfmRbfXC0bUecXmFl9Lf9s0Ghn2Vv3Udzai3IW7NNAgFxYE3zxr69FCOdo9pNUB87QM/zC8NxAtdVxMqlXcY2Wbf3RfAj+unIjeQr0IquSCQdWVZVlrKecGmMDisg8PW5QSWKktaoXIF/BwSNrURurbd5NRpYc8vY+QXCC113L8pbNicfyZ/OpbX4Wo661snPkkT94a51lZ93hUo3AhZI2cIVeEvfuY97VOt4MXis75QHEBoIVSfe/HjdVtQ/CKfY2YOk7g1Cs96Owj4xuPxG5dmhNpqh8UyIjCRuer0ovroPd6l53uoFIIC4mIsQlJJY1X72WhiKHCaf+IEbkgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=niko.eu; dmarc=pass action=none header.from=niko.eu; dkim=pass
 header.d=niko.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=niko.eu; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8BrVJwxM/2ORZ4HUtOrWEQzaKC2XD7f7H5cCoY1yzk=;
 b=HNkvRmMwD8CzCe9N9uSohaXAJzxoUN2iyz5edduEJGttkNtdJoNcGLduAagX2oGwATXGimfIK6RjWkQMJx7cv+YdGGx1GiWetu1rjHxtznBpTBmKROAxScNH/J0JHzh1cBg7dZxDLcAU4Iy9ReMYegLwxbc0fYBuXPP2OUy1QD8=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jef.Driesen@niko.eu; 
Received: from AM0PR08MB3874.eurprd08.prod.outlook.com (20.178.82.86) by
 AM0PR08MB5011.eurprd08.prod.outlook.com (10.255.31.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14; Thu, 27 Feb 2020 09:10:11 +0000
Received: from AM0PR08MB3874.eurprd08.prod.outlook.com
 ([fe80::1548:5958:de47:1434]) by AM0PR08MB3874.eurprd08.prod.outlook.com
 ([fe80::1548:5958:de47:1434%6]) with mapi id 15.20.2750.024; Thu, 27 Feb 2020
 09:10:11 +0000
Subject: Re: ubifs: mounting fails due to error in orphan file handling
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <0d3a2ed9-8ff0-7030-a8c6-c5a204eb6b5b@niko.eu>
 <20200205092202.5f0929c3@xps13>
 <21a266b9-ff3f-7a94-4562-11d6f59d4327@niko.eu>
 <CALLGbRKotskAgZpxNFHF+RdrA0HB7U2qw6bzvZ9WDJEAiWYwgQ@mail.gmail.com>
 <d86c95cc-3393-0f6e-73ab-56a5bbbbedd8@niko.eu>
 <CAFLxGvwKfcw=Com5U7uGsA-iJ9SuQyqHdEeaWPUmnoxqwma0Gw@mail.gmail.com>
 <9ff6f4ae-8dda-608b-4e60-6d391cb4efb9@niko.eu>
 <CAFLxGvyaBu8Uu9xMgk2fDK_erv0eOb4B3_JgjLM9m0iu66Gr8g@mail.gmail.com>
 <fd364e81-b816-1b77-317c-cd030b7833d0@niko.eu>
 <20200227095153.363c02bd@xps13>
From: Jef Driesen <jef.driesen@niko.eu>
Message-ID: <056035ec-c7a0-e629-34c8-f928747cb42b@niko.eu>
Date: Thu, 27 Feb 2020 10:07:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <20200227095153.363c02bd@xps13>
Content-Language: en-US
X-ClientProxiedBy: LO2P265CA0208.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::28) To AM0PR08MB3874.eurprd08.prod.outlook.com
 (2603:10a6:208:108::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.31.0.155] (91.183.54.155) by
 LO2P265CA0208.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9e::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15 via Frontend Transport; Thu, 27 Feb 2020 09:10:11 +0000
X-Originating-IP: [91.183.54.155]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7422beb-15f7-4525-05a6-08d7bb64d963
X-MS-TrafficTypeDiagnostic: AM0PR08MB5011:
X-Microsoft-Antispam-PRVS: <AM0PR08MB50111A053DA86698A2651650E2EB0@AM0PR08MB5011.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 03264AEA72
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(39840400004)(396003)(136003)(189003)(199004)(2616005)(31696002)(956004)(6916009)(2906002)(16576012)(66946007)(4326008)(316002)(86362001)(52116002)(44832011)(36756003)(6666004)(66556008)(66476007)(4744005)(81156014)(26005)(54906003)(16526019)(8676002)(186003)(478600001)(5660300002)(6486002)(53546011)(8936002)(81166006)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB5011;
 H:AM0PR08MB3874.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: niko.eu does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L60ngoMKM2lblaLmMqwOP4/c4aNb/zAq75IYBRvSkAMj7P6yGKChT+H0+mJosQWd7vXt++mZ6ld9iv4NOd7bPsps2GgKd9w+g8BUwwcKutaLeAi25PqZJCHGniydVE8K941C7gPmKWT6uqrI9YUzUSKeVz8ymQV4cVUxozKVfKEH10twERyfsF5SjqpR5fwz4cnmvrxbk+kn/y4RK8PewQDEJgVs715ZJLmtpOvHykQza3mTWWsGRUuQwsuuLAuLhX6a8hx1NGftbwvV5QTrz46dpSIKnKTooSu1yzcdhVd7zCgMW7GO5rSEGhdcRq9R4R12/YyuvtbpnTW6nI/72ghSf8L4Wvif6Cc0yt2x/zX5jbBVfyg70Z3ggSThrVVyYRMUYFeZNJTanvIxISuCXkhI0M2FEi6ZfMQTKmf1Vy22SFsL6d65FH7eLBNWh0xH
X-MS-Exchange-AntiSpam-MessageData: HZV9nC5cRfFQE4SJQdYZKHVmkIrr3yxofqdtzu2SP6vRIsAr7n4U2mfW5hlNKelE7NniZPQ4JVMl1fxFYnDzlo2LjTQ8URJom42nJqa6SMugmZWxkM53QMoZkzcJikhA313a7Ri8n6ZgeBTNoQLW7Q==
X-OriginatorOrg: niko.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: b7422beb-15f7-4525-05a6-08d7bb64d963
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2020 09:10:11.5742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a4faf0fe-ff3f-4912-b675-3cfe1470e385
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMk7HgDNDYWblrxkiy5yC1YBT8xXhbhsxsWCe36LCGUdsnfAwRsXqV21DVURLj2jJnfO6aA1HlzHPxr5IP3Mcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_011015_121242_E2761DB0 
X-CRM114-Status: UNSURE (   9.56  )
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
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 Steve deRosier <derosier@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 27/02/2020 09:51, Miquel Raynal wrote:
> Actually maintainers use tools to automatically collect tags from the
> mailing list (only in the last version of the patch/series) providing
> that they have the correct form. So when Richard asks for your
> Tested-by tag and you agree, you should add the following line to your
> answer:

Tested-by: Jef Driesen <jef.driesen@niko.eu>

Sorry, I didn't know adding the tag is automated. I'll take that into account 
next time!

Jef

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
