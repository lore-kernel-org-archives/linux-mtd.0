Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E850EC33CA9
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 15:35:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7EC8207FD
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 15:35:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SHnTopvj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="blnpIWyK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7EC8207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jwW7+UDymfroG3YJtXEPZ/AvXdQE0NrtambbTT5Up2M=; b=SHnTopvjuBC3qq
	yUbOVvDVHZRn3MGGb4R73wVfrrTNRulCiNUIBsr7jFAx6K+qxVJLa3z2rzr09nlFwKeFHzFb7/+pj
	nbJG5dvCVviyznfBkCKwfVGddjpbYszntTQzFwT7k3XNgB8Y+b6miFNqbVP3AOFRqZ13xNbZDdLPu
	hpAc1IK4ow77UyUL+RhZupRcRrBlq+hWaAYIfK/JJZa1IKSGAOgj8IVLGUUK35sZWbP2rMp+anpUj
	tkfL/cqexQvddQ515yOGRErYjz+yEq85MeAyJNO4qvldax6eAKYKZ0whrUF1mZRF5vikVBsl3wSqQ
	lLQL+q5skXdR5u/tlCnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir1jt-00053n-V0; Mon, 13 Jan 2020 15:34:49 +0000
Received: from mail-eopbgr150129.outbound.protection.outlook.com
 ([40.107.15.129] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir1jq-000531-C4
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 15:34:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmvsEBJsRFRnhazlB9YlusjOAmInP2T7ezCZGiwiQCFI7ygM+YQVPk0GCYOau3lTcGP6uXUnmqqeSZVX7YxbcdYd49EtzVLciljH0S9xL/WkEb2ojLdDRd+uIPrT0/gu5E9kAOrsOWOwV6tsh4mPrVdapxokkJnFrI83LR+zXddS3oCEm9w74Kv2jfvyjcWqMB8x7ajjOB4C5mBKGU+GyDeBzAfHMOAry48eHNtEtTlNP2R1CrjHtYD2ED7pwkB5y+PGVqcBf2J/R4AkfSnuLYGoB0Al/paoHaMWvsEBARwZAmun6ea9LGwZ2s6MbD8Q+Q/Me58HCE79Cy5bXT8p1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sunhIbcz60iNyplSYz80zhO3scKiwlkQD3cFtomMMNg=;
 b=AlkO0LSrfO3ri69xVvH9dPpbWIgVrc+GgitOrKNtj2Akjev83gCLpxpqcV25PEk4jYqzuIY2ZZYomzYuZBXQukGpsJiY7mh6FrGH7F7GDDLRRnh4RtuJFobeKM+cwQfeMyU4hgjIl8ZLY5iOrfG+M4xBJb5ovb3g6t3ZbEoIWYViUN1rydNJJ00l0px2emo3Hbf3s+7Yw9uHRpJgNiYtZxQv0RMpoR9T8ds6d3QggxKrYOfTaCZ8Yzd39wGtsecdf+8l/WZwi5WMQ7Wq4MCfiqD3Jv2hStHzWWyETfOOMAYrt9N8H2GGEfqyZc1NU/u/AkRIWgQAHy9SVU8dX6/TSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sunhIbcz60iNyplSYz80zhO3scKiwlkQD3cFtomMMNg=;
 b=blnpIWyKTJCObyY++0qE4L+RA2poU3iXX5pTYVrVGZBSWtNbq+zABzuQ9qwS1bWtGnrbyoQJekB4lC/cvlR2irz69Fjuc6gQtDNxBNQMt3mk5wBhSTHwxQo+z6H/V4vvFQud4EvxS5H5Oc/os/bO+honWs4ftt/3yXW/vysLdBI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
Received: from VI1PR07MB5040.eurprd07.prod.outlook.com (20.177.203.20) by
 VI1PR07MB4688.eurprd07.prod.outlook.com (20.177.57.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.6; Mon, 13 Jan 2020 15:34:38 +0000
Received: from VI1PR07MB5040.eurprd07.prod.outlook.com
 ([fe80::20c4:7ce8:f735:316e]) by VI1PR07MB5040.eurprd07.prod.outlook.com
 ([fe80::20c4:7ce8:f735:316e%2]) with mapi id 15.20.2644.015; Mon, 13 Jan 2020
 15:34:38 +0000
Subject: Re: [PATCH 2/2] mtd: spi-nor: Always use biggest erase size
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
References: <20190124112014.20167-1-alexander.sverdlin@nokia.com>
 <20190124112014.20167-3-alexander.sverdlin@nokia.com>
 <08858201-eebb-b9c0-a94d-9eec9106d23b@microchip.com>
 <e286d6bf-99a1-eedc-7b9f-a082603b0946@nokia.com>
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <f6be94ce-03d2-6e24-bddd-115966bf5e29@nokia.com>
Date: Mon, 13 Jan 2020 16:34:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
In-Reply-To: <e286d6bf-99a1-eedc-7b9f-a082603b0946@nokia.com>
Content-Language: en-US
X-ClientProxiedBy: HE1PR09CA0051.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::19) To VI1PR07MB5040.eurprd07.prod.outlook.com
 (2603:10a6:803:9c::20)
MIME-Version: 1.0
Received: from [0.0.0.0] (131.228.32.166) by
 HE1PR09CA0051.eurprd09.prod.outlook.com (2603:10a6:7:3c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.10 via Frontend Transport; Mon, 13 Jan 2020 15:34:35 +0000
X-Originating-IP: [131.228.32.166]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4f17e82f-917c-467d-f309-08d7983e19c5
X-MS-TrafficTypeDiagnostic: VI1PR07MB4688:
X-Microsoft-Antispam-PRVS: <VI1PR07MB46886D45DF48A585A0965C1F88350@VI1PR07MB4688.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 028166BF91
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(189003)(199004)(6706004)(2616005)(6486002)(956004)(316002)(8676002)(6666004)(66556008)(66476007)(66946007)(16576012)(8936002)(44832011)(16526019)(186003)(31696002)(36756003)(86362001)(4326008)(478600001)(5660300002)(52116002)(81166006)(31686004)(81156014)(53546011)(2906002)(26005)(78286006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR07MB4688;
 H:VI1PR07MB5040.eurprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3qPhSIb/bg+nSJpI/JP8VpEcCrq1zDMpqFSX2G+P2OzMkS7YcyuVL2AxyupVAPBqtTrg0sa+Fo3FdVNgEpWZrz4s8d/fD1jR5QCJulOSVqq0PkHTlqsT+TvwpmC8dvWxO+uPlnuFBrzCGxV9eGrUFc3yz/s+a4w4XvbAXMASrwGwh9lnRKEmjS/qxtluMkqco4Q7Qk5pFQ3WVPZAMhwNzeQ3Z4WRPhwD6ferZJvjcpsMWJRiKhqT0/MzmwdrwawSooWiooJtH2fGDm7aOLc53XO1RFM5DPlg5xML5BYFGPSL8up2Bmj4Ml+d8g4QPK9tV1G/wlN06kxDSWqYMcWX7UHnto0gRYZIocbWmml7TCquLi2ImUW5TkjVbovl3i/4OToVxf07P3Xi88AjTwCN2TfEBXYBWyFH/TK4GdRpJu2WWk0hampetuRrMjdclBqFa7Br80V+TV/1E215/NEgGg1NBOJMLUUdpQZeDUeJPjZ9k/y8N4JQvpYaza329OrH
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f17e82f-917c-467d-f309-08d7983e19c5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2020 15:34:38.6380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjvHNBYCgwF2/f5d5aqVfTAQqEXU71081FsNwzp057QJISoRxrhlKUAXiGz0Zn5/oDHqGkBdmiolT6aMQDfRjVwxZzBeWLgEWNb6X5G+Zds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB4688
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_073446_462377_BDE1236B 
X-CRM114-Status: GOOD (  12.24  )
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
Cc: marek.vasut@gmail.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 richard@nod.at, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Tudor,

On 01/03/2019 10:50, Alexander Sverdlin wrote:
>>> Optimize erase time by always using biggest erase size for given erase
>>> request. Do it by removing "sector"-at-a-time erase code.
>>> spi_nor_erase_multi_sectors() seems to be mature enough to handle all
>>> the cases better.
>> Did you check if the upper mtd layers are affected by this change?
> For now I just change static function, I didn't want to remote
> spi_nor_has_uniform_erase() infrastructure in the first step.
> 
> So I personally see no problems with my patch. It's also quite well
> tested up to now.
> 
>>> For the above to work backwards-compatible regarding 4-bytes commands
>>> spi_nor_set_4byte_opcodes() has to prepare them always, independent of
>>> spi_nor_has_uniform_erase() flag.
>>>
>>> Remainder check in spi_nor_erase() becomes superfluous because
>>> spi_nor_erase_multi_sectors() performs it anyway.
>>>
>>> The trigger for this change was n25q128a13: enabling SECT_4K increased
>>> erase time of 128k block from 1.763s to 11.335s.
>> When needed, one can disable the 4K sectors with the MTD_SPI_NOR_USE_4K_SECTORS
>> kconfig option. Does this help you?
> This very same kernel runs on different boards with different flashes.
> Seems that more modern flashes are not so slow when 4K sectors are used.
> 
> Moreover, I truly believe this was a dead code and want to be convinced
> otherwise before real problems start :)

in the past 10 months I didn't encounter any problems with this patch.
Could you take another look on it?

-- 
Best regards,
Alexander Sverdlin.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
