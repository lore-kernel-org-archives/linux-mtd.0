Return-Path: <SRS0=LKht=3Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A569BC35247
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 15:25:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A7A920659
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 15:25:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SdkyltQv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=niko.eu header.i=@niko.eu header.b="t90XDc2d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A7A920659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=niko.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A1Wfd2mpEK9/vhQBau8044tOJ/Zs2FzweV97oHlUKLQ=; b=SdkyltQv8g2z5p5uUF5f2y4XM
	lq5+0VEQNBWLGjbfyQQcN8E6w2L97AQ4hsppAZ4QOc1B3ho4pZkNxnFbMQ/EwH3X4vc9BjW5ICLMB
	MSLn3FwH9c3exfC0VhJvV9Yh/otdrLPB20UfYmuGnOAakTWSiCewrUh34kkfOllbSZegPCaXhMz0L
	y4SrU2qqMKC+PMKw41j31bc4KUkuhqwcCzkfjGnM1MCegwijoDyn9LlacJBea4OnMQCnTwncpKxT2
	evgMmP9w2qApNeTiQMBnGFY3eomnCJpQNhMh/ZoHpFIKwWDrY825jjg6E968tiMief6634u9O7ap6
	jy5jnSpaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izMYY-00059Q-R4; Wed, 05 Feb 2020 15:25:34 +0000
Received: from mail-eopbgr80089.outbound.protection.outlook.com ([40.107.8.89]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izMYV-00058o-M7
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2020 15:25:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAzlt0ihrk63/TjTaAKJif3w0YrGj2vuGmGhVMsfjSqwbmW9V4ZsDF5yY5xcptPMXDzkXSf4zSC95hp015l2iqaqUnyljYwiS9kaL/bEEMc8orF0pohNd0SxbvGZNmkrnAOCHf0otAhcEoeD6YUxEuMawVuvz4F2Qff2O1ruOxNZ+B60+ZRyzReg6REjmUHebkcHoUNz3pO+lbI+qBm/fzmhanZPLWXMQUWgswtjSWLz6TQ/VxVRkjymdh964PRyl3jAwtoKJDQNuQ75PZuqQrhxBMTBp+iE646KU7PiZRSRWm2tq7VFJXBeKNdO1LsO5mVCLpaHVEuCabYaRdIhxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7H7xOV1QXp9Oe8SIOvVGBpB4ck7Vx+WE34buRsLpw8=;
 b=U5TVy3zFLq8pHlNtVxu7LRqwWnmaw4rkeNgpZfRovYRIXvuwbBWSlRdFsbEO/dP0+GB3cyHLpLV1BmGxVN1uOk4nhhbQbGQPGdfniCJ0AYuHxPi8BOm2eTCPoXlrvlua+o0xS6ig6AIlfPnQPl4jkGbydjwVHkU6dp9AIez4icTZAGn+aLBR3tGfnQUVxZoUW2KJXBXdC2Un5YRA9gDuMdMLswG33RmSXlTYikUQ2lpy4p+ixvViyzxoL0d7glgA+2fTEdwNba5ef9v8RQ/2+o8m6MIa+0PzsRxqG1P6ZIARrNIXi1x7JjNp3TkGKBZXPKwumVandNj7DrcghaRWbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=niko.eu; dmarc=pass action=none header.from=niko.eu; dkim=pass
 header.d=niko.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=niko.eu; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7H7xOV1QXp9Oe8SIOvVGBpB4ck7Vx+WE34buRsLpw8=;
 b=t90XDc2dIvRlicE3rfmwdCa7d0an8V/GbBB0U6v5wc/Z0NRx7L2/gAxbVLUDCHRIUURnODlB9AVVUfaS23jfB45R4fhxJJuVb5Z7owo6QIKgEbwqBDarx5kOh9U0MZocINwJ025GcCszrnW39uW39+7oadmc0Y1i3bYqSMfIp9k=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jef.Driesen@niko.eu; 
Received: from AM0PR08MB3874.eurprd08.prod.outlook.com (20.178.82.86) by
 AM0PR08MB4596.eurprd08.prod.outlook.com (20.178.22.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.29; Wed, 5 Feb 2020 15:25:27 +0000
Received: from AM0PR08MB3874.eurprd08.prod.outlook.com
 ([fe80::2c29:d125:7cf8:8b4e]) by AM0PR08MB3874.eurprd08.prod.outlook.com
 ([fe80::2c29:d125:7cf8:8b4e%7]) with mapi id 15.20.2686.034; Wed, 5 Feb 2020
 15:25:27 +0000
Subject: Re: ubifs: mounting fails due to error in orphan file handling
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <0d3a2ed9-8ff0-7030-a8c6-c5a204eb6b5b@niko.eu>
 <20200205092202.5f0929c3@xps13>
From: Jef Driesen <jef.driesen@niko.eu>
Message-ID: <21a266b9-ff3f-7a94-4562-11d6f59d4327@niko.eu>
Date: Wed, 5 Feb 2020 16:25:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <20200205092202.5f0929c3@xps13>
Content-Language: en-US
X-ClientProxiedBy: AM0PR05CA0082.eurprd05.prod.outlook.com
 (2603:10a6:208:136::22) To AM0PR08MB3874.eurprd08.prod.outlook.com
 (2603:10a6:208:108::22)
MIME-Version: 1.0
Received: from [10.47.50.82] (81.83.24.121) by
 AM0PR05CA0082.eurprd05.prod.outlook.com (2603:10a6:208:136::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21 via Frontend
 Transport; Wed, 5 Feb 2020 15:25:27 +0000
X-Originating-IP: [81.83.24.121]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b81755ef-a980-4c53-f446-08d7aa4fa0b2
X-MS-TrafficTypeDiagnostic: AM0PR08MB4596:
X-Microsoft-Antispam-PRVS: <AM0PR08MB459674B196F7B0A357F581E1E2020@AM0PR08MB4596.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-Forefront-PRVS: 0304E36CA3
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(136003)(376002)(396003)(39850400004)(199004)(189003)(36756003)(6916009)(16576012)(316002)(66556008)(66476007)(31696002)(5660300002)(66946007)(86362001)(8936002)(8676002)(81156014)(81166006)(52116002)(478600001)(31686004)(44832011)(186003)(6486002)(16526019)(26005)(55236004)(53546011)(966005)(4326008)(2906002)(956004)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4596;
 H:AM0PR08MB3874.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: niko.eu does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QxsWlrdjnd/MTr/yqufcZtXlPUaI1JQV5QUIzxFSe9NDC7lzhf7PzgHwLXkOTSm/CRzACHo/FkgRVfbXJCQoa4VDSnS6JjoDeGEMQ5428DVj5FtqB6OhKAS13jwAHilaqXMzouvCXQffAVeHTxxH5NeIWcHby+zAyANeRxjc3CNaNQ3faVVPeaONu5V4Ytpw3Y6dG2iQKxjypDx158B8YVbrcA6LjbeUrKy14Z02UeoL88WqwitCbcVHRoEMmTHHEktDYLll9h2f5L8rJcg1YHCmzvTMKwKpk5KDOj/zzX3qaKs76pilNbQZn7xPX91LdlPoM6gKKArWMJSSKxsgYMAksTkJr175h7F1bcsOFrr81ayqSXNIZo6WgiCAHMKI/qboVdzTdRUoOlGnNRXQmdvVveM+RNN5r76WdkK/cALkPWY3fJUvTxeMwBKuCnHhoogGdMNva7pE/s3wySOoTa2cYga3yvfbtecqlsrDAXR+wYqaZtNrjYNLk+OvKZS/Lsw1c0g96lvivcfFjpna3Q==
X-MS-Exchange-AntiSpam-MessageData: 7m6T47SjyfLE5gsGD5ADKmq1QqbUoVdw1PBRhY5FuTB7OaS9xsrrfGpt5B8LzDMmIMnFwneXoy224dZ4oEc5onxGzwoc+iYBlrgnbXmdk1hyYAqnSBnF1wPchqONREXUNNlaPzsbld9vbw9tlygVOA==
X-OriginatorOrg: niko.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: b81755ef-a980-4c53-f446-08d7aa4fa0b2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2020 15:25:27.2644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a4faf0fe-ff3f-4912-b675-3cfe1470e385
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jRaFLEMxxgW+8+l6clbbgIt4NNOq2BlIKAmCP76g5pVCYo+40rGqoygo6ayV/cSQB/MRBp51q68k30xxWbF+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4596
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_072531_946278_F54F2D1F 
X-CRM114-Status: GOOD (  14.78  )
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
Cc: richard@nod.at,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2/5/20 9:22 AM, Miquel Raynal wrote:
> "Driesen Jef (JDI)" <Jef.Driesen@niko.eu> wrote on Tue, 28
> Jan 2020 10:51:39 +0000:
>> ...
>>
>> I'm not really sure what's going on under the hood, but it looks like a
>> problem with the handling of the orphan files. With this knowledge, we
>> are now able to reproduce the problem reliable, by doing a power cut
>> while running the attached script. The scripts creates many files in a
>> loop, keeps them all open and removes them again. With this approach we
>> hit the problem about once every two attempts.
>>
>> The problem appeared for the first time after we switched from kernel
>> v4.7 to v5.3. I tried with v5.4 and master too, in case we are hitting a
>> problem that is already fixed, but they show the same problem. After
>> doing some bisecting, this commit appears to have introduced the problem:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/fs/ubifs/orphan.c?id=ee1438ce5dc4d67dd8dd1ff51583122a61f5bd9e
>>
>> How can we fix this?
> 
> Just adding Richard into the loop, he is not available right now but
> will probably be interested by this issue. On my side, I have no clue :)

Thanks. If additional info is needed, or some extra testing is 
necessary, just ask. I'm happy to help to get this fixed.

For now, we have reverted the above commit. That appears to work (e.g. 
no more device that fail to boot), but I'm not convinced it's a good 
long-term solution.

Jef

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
