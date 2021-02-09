Return-Path: <SRS0=FWsg=HL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD80C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 15:57:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEA2A64E6F
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 15:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEA2A64E6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=studio.unibo.it
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wGYb+jGVXn8PT3dKaB4nsZp66CceRMaKKcR9q6BFpoM=; b=JBR+xVpIl1DyE2qzR/UqoBlEX
	KeOhZVrIAouh/rf/6Iy9TBzowWnuQq96TkOUaw/3zQpOJBKd+xiw874cyEw7mKyQ5y3NggIivrX0K
	iSfd343BXOYB3PMKt5BO6LUXGSTPi0wSt1ChOMI9zHnZWJwfGnmVYnfg0Y6WJytz1N/0rMFZPyUxM
	jYNWQfjYsvNAy46U9LhyD3wUTRNtTurkpj46cku8LRv275EYF1WBNqHQgC1Sdeh1oeWUrgAM36Y99
	P2weIFhUol42DmCGAYqA3l+GazyGelyTmLeYtDypAAR8C6lNDRe9QWpHcyjWJL9hMn/0pRs9rpb2d
	KLqjGetIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9VNX-0003OK-TG; Tue, 09 Feb 2021 15:56:40 +0000
Received: from mail-eopbgr50126.outbound.protection.outlook.com
 ([40.107.5.126] helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9VNV-0003Nk-KS
 for linux-mtd@lists.infradead.org; Tue, 09 Feb 2021 15:56:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7kD5ZDj6oHKJgj/8RcxDCeLDVftM7luA3Dnq2e8kPTRsPtJ+/A7DBTftZFVbYlxe3dQX4kl1ixdIaPJQmygBeTo1MGR8fVLrjtn2HLxpioee0LlKJUUwGBxd318HWp1K3MGQVa92YmtF33opUiDsLFnDt1j2MbyA7HthoX4J4YITMdbFvU7yy5qX8EZi1v1OM2htIvnQeJZvfsYQDJZAZc473vWBN0VB0wqKu4Ld0ITBNZMd1PaEQrZPk10Z6MNHsk752dYZ+VvPGItwMsQlCP14+3CTGErgVl1Hi4NR1GBNgf4BMUUeS9w87gCk24tBZu9GuZvl0p5v8nHJNksGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVRaCIeJbbCATJ1DL3cMS4oVam1b/JfFkq6XE5tt1wo=;
 b=JEnUcvQ0o29gnZ9GiXgnv2kwz7Z0oVbrJTTpIL4AAflrTVmut5tlbwagRumSQ6DxJKh8VBIqHxZUTHjcP4xmqwhkffRBn2ryabVzYXVoixJj+qDidsfCBKcIkrXITzpMkvq7OLmO2VS8qaLFv4DYmyW3B49hwanCZt3lBUTJukEM3e1NZ9aGUDFrt/lBQldNYgbkYSDa2KxmWhfTn9T1zZUI1V9Ro7+6lOLLC7AVXzeNR7u32IwvbGLWjK8wfZ+Kx0WW5TVGlIPcDNfDjJ09hVjjMX5akEcGkLVNvvA0xbC3YTx6nnv5+Cv4OXRQm4oyEQbEgEnERFiNav3PxM+lFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=studio.unibo.it; dmarc=pass action=none
 header.from=studio.unibo.it; dkim=pass header.d=studio.unibo.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=studio.unibo.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVRaCIeJbbCATJ1DL3cMS4oVam1b/JfFkq6XE5tt1wo=;
 b=F961bzTMzPaRsnlli4EpUDrmEuHV5j4W851yNvgv1UBEAQ8FBbtzO9g2zH6qJyqA23BDQ0T8f/wf0RUYNtUCgeItoyk09fpinEoHuxzpy+SVgHnqJ8YzCRMC4mzua5u2BnVMSExwHLkfwD+ekpaAe6sO8tUnY6CJmQmecrWVyNU=
Authentication-Results: narfation.org; dkim=none (message not signed)
 header.d=none;narfation.org; dmarc=none action=none
 header.from=studio.unibo.it;
Received: from DBAPR01MB7109.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:19a::15) by DB7PR01MB4761.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:69::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Tue, 9 Feb
 2021 15:56:34 +0000
Received: from DBAPR01MB7109.eurprd01.prod.exchangelabs.com
 ([fe80::39e5:9fa3:1133:7922]) by DBAPR01MB7109.eurprd01.prod.exchangelabs.com
 ([fe80::39e5:9fa3:1133:7922%6]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 15:56:34 +0000
Subject: Re: [fuse-devel] [PATCH 0/8] MUSE: Userspace backed MTD v3
To: Richard Weinberger <richard@nod.at>
References: <20210124232007.21639-1-richard@nod.at>
 <CAJfpegvN2KdMj_7T-OF1PAs8xZiU3f4233AvigaXwwRAsgQEjw@mail.gmail.com>
 <563952295.378372.1612881357746.JavaMail.zimbra@nod.at>
 <3a9c19cf-2c25-a3bf-a200-6d223952797a@studio.unibo.it>
 <443281182.378615.1612885278254.JavaMail.zimbra@nod.at>
From: Luca Risolia <luca.risolia@studio.unibo.it>
Message-ID: <b2424246-d42b-d0bc-8951-8cefdf5b681d@studio.unibo.it>
Date: Tue, 9 Feb 2021 16:56:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <443281182.378615.1612885278254.JavaMail.zimbra@nod.at>
Content-Language: en-US
X-Originating-IP: [151.41.227.128]
X-ClientProxiedBy: ZRAP278CA0008.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::18) To DBAPR01MB7109.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:19a::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.6] (151.41.227.128) by
 ZRAP278CA0008.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:10::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Tue, 9 Feb 2021 15:56:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d60d1d7-3cea-4f27-6167-08d8cd13469d
X-MS-TrafficTypeDiagnostic: DB7PR01MB4761:
X-Microsoft-Antispam-PRVS: <DB7PR01MB4761B62460AF4B5DD75D32D6DE8E9@DB7PR01MB4761.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gxC7Z+X4w/EZYsoFR/WT0p/U46W0udQ2tgS2BBOTPJ2eoEpgQCEecQcM3KFdBjSuvGMNf67oV8mWnMBh7nSU6NXHnTC1SlmFO3vcFSKK4vPFm8+LnrWvEqdMQtzZ1/ThdiB95Ocw+4/9Gr7vMEWFhhD+UyMgx/3Yd5ZZ2Z+sFN+get6pjSW9lrXbGX4ONbWc+fuP90mQFsOGjaUpjQrOeLuJ7lk363RTaELsbA1i8kobMaIRz6tV/Q2kn1PfpJfSYPxpGPO3lpAPAILUvUHKBflx6ujuabSLPWFIuJLx/92Cm4W5z2bSztZJPJDpQjWgzsTlr3PNbWiqnNmz4dfvJ4seh1atJUTe9fpNTInQlKsR4tFOTnLsvKpzixZRg7AQKT7IBf3P7ZjWNHDI8hQoiW5aghRi+Bqlju3uMA+10Q6oODUJUwJR4HbzflXbWkasnM+ehHFCKgJm77pMHhNJgxf+LxIvvNGVYoecCQeeo0rkWsFSW1r8uqmvyAU22stDDIBsf7KL4Hlu3q7ci4u5sgR79vfVHuwLpSrepLGDBlIjaMmQ9of+qXrOdD/gX67VWbiKwycLqS97CXqrHSL9icW63WvTkIU/kKw+ldNJJX4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBAPR01MB7109.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(6666004)(4744005)(4326008)(6916009)(478600001)(16526019)(53546011)(186003)(8676002)(5660300002)(52116002)(8936002)(7416002)(31696002)(6486002)(31686004)(44832011)(54906003)(66946007)(66476007)(316002)(16576012)(786003)(66556008)(2906002)(86362001)(26005)(956004)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?STBkQnFrQ09kREJMOHlGZ3lrbXVGMjRBMW55N2VzRWZ5TzVlS1RRcXJ4TWJa?=
 =?utf-8?B?SnFFVFNnRll5WU9YMTZlTlFhbjJ1RTlUU2h2SEtpOW14UmRxa1lhUXhVOWlY?=
 =?utf-8?B?ZmphMU4zZ3J6Vy9qN2Q1TUp4eU5XY2tLRmZlUWN6L2FmSStkdFlGTURyL0tJ?=
 =?utf-8?B?d3VhS1lnTlRqTTJkQndNczBRZ3QveFJnM1QrQlVhZU5xNS80TFhFblEyZHBq?=
 =?utf-8?B?NE5mTW0zQXpYWkl0cXVicnI1enliSFRndUFiYmd6cHNVdEVBdm80b3JhYXEv?=
 =?utf-8?B?QTBPVzJqMDBqUEF0TVhseisyMzBlb2h2U0ltRW5JUGp3T2x4UlUrY2xFS3Ur?=
 =?utf-8?B?M0lDOENlS2hTU1lUVko2c1VEMTJEZE91Z1NCY3hvdnhhNWlScHZ3YWpKQVIv?=
 =?utf-8?B?SFE1d1VTdDNkU2xvN3hPR0Z0aElyNFFSWXNzZHBtekVDK0t0ZjVaZkhGM3lI?=
 =?utf-8?B?OVF2c1k0Mis4cVhHdEZTYkRJakhUbGxoOEg3T0FnTE0yU1Z4THhlNWVDYzJi?=
 =?utf-8?B?bHJ3bXNPNEpjbFVpUXRZblRtNGZmLzZDdE9QUFR5K2IvL3RWaXhKaUFXN0pk?=
 =?utf-8?B?eElZbVZ1MEFSazhaTjNRVXNmME9KVk5PakxoMHZtVTJGRllPcmluSThvY3Rm?=
 =?utf-8?B?VFpoN3ZjRkNNb3c1cWtRbGMzSEV1L1BiWjQvb2Zyei9CRHRKaHlwQUxJbHJE?=
 =?utf-8?B?dkVFdzJra1BpNFpTdUJPQ0VUWlc4ckFCaWQ5aStmUVF3V2VoOVRkZVN5THlv?=
 =?utf-8?B?VU5ocC9EdStaL3hsNmVFMUU5czlNWHpKN0ZXSDNybzh1TXhvVGJFY0E0NDJI?=
 =?utf-8?B?cGRRckRJelhSWVNsbXBjSUxRNWdEQUVERFJxVEF2N1JWNFBycVJ0Z20vcXY0?=
 =?utf-8?B?R3lzbkJEZmdkUGJWem9oNkJUNHdLZ3RTWkNCSUhtUUVLaDVOYmdWMzd1SnVI?=
 =?utf-8?B?LytSaXVNbjZLN3p2YVFaQ09OUHRyenFSZ1Z4ZkJUdXNaUjU0ZklBQzlwb3VX?=
 =?utf-8?B?S3NBcm9LU2I1WVA2YVcxNGVuY1lpRjFDVTRRNktyT3NPV2NYTmxGRE1UWnZx?=
 =?utf-8?B?cU5NaEZ5TjlaUVk4cmlzNXpIZHErVkpyMDl1MWUxVkN4ZG43VUl1dWc5ampH?=
 =?utf-8?B?dWp6NEVSWjFnYnFiYzA3VVUxYVF2Tmp0VWJKTXd5UTZrZlQ2NktHeWN1UXhV?=
 =?utf-8?B?enp4WGF5eithVStiRHlMbjNjZXVUNEt1OEh5MEhZOWRtK0lkUlJOZ1ZsYTMv?=
 =?utf-8?B?MGUraC93K3ZYVXZqL0NJSndVMDFkdEFIMGtzV2l3OVp2YjR1RHYxb2NWaG44?=
 =?utf-8?B?VG80WmFndFVMZzdxcXV5QnBCaVZpOENOTHFYQjZONWEyeTNWajJJakllL2Q0?=
 =?utf-8?B?NnF1S01obnowN2xJNm05c094ckZEZnZmeE80Ump1SGFsNkFxZ1RJMXl2RzlQ?=
 =?utf-8?B?V1c4KzBiUmhYd0hsbERNS1F2ZlZjVWJLMngvVlAzTlMzQ3hZZC9wakJWMXlh?=
 =?utf-8?B?Zi9NUzZKRTl1QkFuYkxYZjFqR0xibUVVcWJ0VzZSdDBRWU45OW44Sk1vYThy?=
 =?utf-8?B?UWVROW10TlZDWTRkVzg4SnVtRDF4dFIwdjNPd1l2eHNYSm5lZmR2bkRJRVZo?=
 =?utf-8?B?a3BOZitHbDEwb0dnRW9oUnNXRXgvZEgzSVNGQThwcDNpL2I0YWtTZXMzLzBE?=
 =?utf-8?B?cFV1NUVGSUlSZngySWNQS1N4NU5rK0duWnRHSEJrazI2dHJ6a0FxZDhGU0Qy?=
 =?utf-8?Q?PIk3nsiOE1PWJ7SgbvEzyIPjyTk6RCpm/gjGV4u?=
X-OriginatorOrg: studio.unibo.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d60d1d7-3cea-4f27-6167-08d8cd13469d
X-MS-Exchange-CrossTenant-AuthSource: DBAPR01MB7109.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 15:56:34.7190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e99647dc-1b08-454a-bf8c-699181b389ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ksV641T6r56lZXZffphm6jEEA3O1uu3bm6S3s3eLS5m0y8UKAn/In+QQOCT8Te4Ovs30GJhLQ8Z6puFxYyGumobUk3uFMiK58bVf9j+AxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR01MB4761
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_105637_729534_BD5BAE62 
X-CRM114-Status: UNSURE (   9.55  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Miklos Szeredi <miklos@szeredi.hu>,
 fuse-devel <fuse-devel@lists.sourceforge.net>,
 Ron Minnich <rminnich@google.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, sven <sven@narfation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 09/02/21 16:41, Richard Weinberger wrote:
> I wonder about the use case.

for example, many existing video applications use mmap() to map the 
device memory to userspace memory. Adding support for mmap() to CUSE 
would allow these apps to work without any modifications with CUSE-based 
  device drivers other than kernel drivers.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
