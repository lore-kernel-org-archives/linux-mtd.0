Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0613C54FD0
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 10:39:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE3D520679
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 10:39:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ggjmgXOV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="oc7Erv5A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE3D520679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PHlnx/2cr3kTGiQrNNhJ0ONiM/g3UwPOU59GJC+bkDQ=; b=ggjmgXOV4XQt3p
	8hZNOG6KzLDwle1hPTtSLd3CSLw13tJeDeCct5H3hFuPgzXqwKfHzdN3tkHmdzffmc2slEBBTy+JZ
	i4JGQ7hdSCAuNmARNCCJIGxJ9SbUP1U1s2zMeF6DPkNccMSJGpSKgZHUVNwsVTFYcVMFjxIF40YQ5
	imZ56gNUsbmm1eM8pUsEZ7ieDf5lfLsALJ9MhS+mH+kmPzQ0fBDfBeDP2duO4bVhycLHxjg/HKljf
	bzTIlvPIeqyYyNexnpn0jp8RvhuxBIarNsFmUJVByFTGLJsQxXkAiUHhGXk54Jlbyl+VibYDYheZK
	RwrIITUQwP/mIKHyLGdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQqJI-0005TP-8J; Tue, 21 Apr 2020 10:39:24 +0000
Received: from mail-eopbgr60128.outbound.protection.outlook.com
 ([40.107.6.128] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQqJF-0005S8-6F
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 10:39:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMwgCpKL5F8hwp5Kaqvfy5Yxj9vLM2/VT3JZ1lIxE+Ty54HT4BIRHDFnuJCSRPD3PAN6VbFVMvMkGWSqnA2o3ozBsCEuI8fLyuLwpkIRaQrl1/HvuaiKD3ktJSZpz1W2Z7HQRMSd/RzIWF/55jY6UEpv7ElU7rU3DYlhhyfwGgbRkWc4UJmm6E3zI0S3Hmlbtzmmtp5xpnBF8EN5vjg9hfnVH1cLTFyIyDuolMz6ug4jhuH/l5eUT15q0y2cqeh7MMArwgwdqb62oYvP2VB3prfz3k9Oz9FquCUwOIA604SW0xCmozVEzsd6QfVuLUY6kaJIh3f87SlzeFqBE2E0sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6fgMFkbZBL6eNrA6VOhsTXa2skE5/+a5ewvYVO/zeI=;
 b=SMJQcunBUs1Y6t+UilvxY+Ey9rAywpaz0wN8nP6OiYQ9GFwGKTqIKIZqBYw9uaCVzpqaOrkPIBc5JQQitHC6FV+jmSbQoS9xK80KbvHBWlZPP2o+LYh/epD7Wg0NpzrVgBtiK8QMkqIn6DEPFRkun97uRnXoZMyeB/wea/deqLtbYw8GtOqY1C70Szg0Ov+0ryMQgEreGJwnvR1SVWIznj4fvLrNJpC688oPpWywwyJ3yHy2ATmVnXfQqdLlaC90FUj2uUdVCCmUDqZqce6KN7xMpwtg+56eH/6Kg7xhj0VF6MsMqdmn8zsF0m8UIR5X8C+ZctDdxloUwXIzNg67Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6fgMFkbZBL6eNrA6VOhsTXa2skE5/+a5ewvYVO/zeI=;
 b=oc7Erv5AyQbyJcejylOgfiLhUHWizC5GIYo3/Y0lbt4b6rJUr+pnU6/0VWk6cgxEQluq+TEnLiCqaKBb6bqLsLAmVcHKSb0fmcjX+6kwfM0kPX/KAP09HSq8hGz4wUZC17MbEFxjfKF1GejxEo8fb+CNbhGeh+hpEts6txhUF/E=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
Received: from AM0PR07MB3937.eurprd07.prod.outlook.com (2603:10a6:208:4c::20)
 by AM0PR07MB6307.eurprd07.prod.outlook.com (2603:10a6:20b:159::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.10; Tue, 21 Apr
 2020 10:39:18 +0000
Received: from AM0PR07MB3937.eurprd07.prod.outlook.com
 ([fe80::6958:35d6:fc84:49db]) by AM0PR07MB3937.eurprd07.prod.outlook.com
 ([fe80::6958:35d6:fc84:49db%7]) with mapi id 15.20.2937.012; Tue, 21 Apr 2020
 10:39:18 +0000
Subject: Re: [PATCH] mtd: spi-nor: sfdp: Fix wrong addr length and dummy when
 perform SMPT detection command
To: Tudor.Ambarus@microchip.com
References: <1587439812-49387-1-git-send-email-yangyicong@hisilicon.com>
 <f893b8d4-03e8-bce8-b14e-1584802c6d53@nokia.com>
 <5032403.BAliFFt8qx@192.168.0.120>
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <6c3bdfd9-1fd8-6a8e-0e30-03eb82f1f244@nokia.com>
Date: Tue, 21 Apr 2020 12:39:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
In-Reply-To: <5032403.BAliFFt8qx@192.168.0.120>
Content-Language: en-US
X-ClientProxiedBy: HE1PR0902CA0043.eurprd09.prod.outlook.com
 (2603:10a6:7:15::32) To AM0PR07MB3937.eurprd07.prod.outlook.com
 (2603:10a6:208:4c::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.167) by
 HE1PR0902CA0043.eurprd09.prod.outlook.com (2603:10a6:7:15::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.25 via Frontend Transport; Tue, 21 Apr 2020 10:39:17 +0000
X-Originating-IP: [131.228.32.167]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 30ef2811-404d-4edb-5abe-08d7e5e03eed
X-MS-TrafficTypeDiagnostic: AM0PR07MB6307:
X-Microsoft-Antispam-PRVS: <AM0PR07MB630773B6228A76A3B94EDBD688D50@AM0PR07MB6307.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR07MB3937.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(16526019)(478600001)(2616005)(956004)(36756003)(6916009)(2906002)(186003)(6666004)(31696002)(8936002)(4326008)(86362001)(66946007)(6486002)(5660300002)(4744005)(8676002)(81156014)(66556008)(66476007)(316002)(26005)(6512007)(31686004)(52116002)(53546011)(44832011)(6506007);
 DIR:OUT; SFP:1102; 
Received-SPF: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qscjv6sZNcn8kPeO7arz8sWN+gLVEROXiPSR3/xhN7q7PazJSQOwxf67V/tXQ6hLP4vI+JQvXq7GMU97IiDkJfT6Fdk+Vfit093v7klirG6yPJHDmJ6pHku3EzPowpDZ3G3iyR/kQRK7BxiCRUMGKVGztmpNEw1uL9T27lm5wlXKezqZYAFfLS32gUEgfes3Btnmwz7LRNPil/lwRi+A3W7EmAElmlmcZiNohu6AldU65zNzxyr85SEzSpVS1wxqZCtLpX+vWdLhA7rbsOa9+v9Qtxv0MmkTJwAgespmhsxf6TQ2BhvhXBdc8SP//AIOpPpHOXvuoZL0UrRZXyx1ptQ/eNj0lJr3huXpeKckEcVqThurVxgSsgBTTNP3T/1OMXtTIOKAOEDpCPera0pI09QmgFlbfmDDOwcIOhbGp96jPBX2S3McdMAEYBO6bf8R
X-MS-Exchange-AntiSpam-MessageData: I9kY4f4wJ3U7VJ/5REfb5iJshamsrmkQX1qRlNWShZjQogtgcf+KalQp9nd0BumIiKWU01uc7upkGP/hUqcJ0pumnUH8O4YPpq2MUCkGhzoBk0ORrOeb4wFtSpsOKl+eTTtqqk8KGQ0SIRv1Uf28CounUQ5xFuAH6JRkDiLxDDlaY9oALT4EOMISy09WEtBV9eQXjgBbbFQ8FgUIVqCEYseL/eg0TYqNMv5ntIz69J1IcOV+BkKUQGgc39DNUmbgwEFYBZ1ivFf2Cp3zrSTDH/ZnjhmajvuCjG+aDjlcn9sw0/ts5lpQiRpPJ9wtw/4LTyxF+57uANdGkl/vHEoxbxOQZnJbu+QBCXjyJYUURL4ZegD73rnlmhhaCpJ5N9cE7HZ62zOfozl+TlBzeB2GYn+bI92YczXAqjkPwTo9mJcjnXWOpc8P51JYnRx5P4yeILqZnHMi5Y+Jk4uV/O5n4RBUTm4W8K+6qFOcXjLeY46+hQQ7AnKntVCDX1PnGextcAvVcyVtv5ahh6t+x1m7LqvCt0alOCGcGPvajA9dLVAw7u8ygfx8tocx+BHg8w6XGT8t+o5RvjjcYQ16a7Ug6fuOtFAxvXt7S9sJ+EAulE7wgSK3OGiUDhI1QsH21YcovEXCGjqIpnjmAgjVs30OU+fxXxG+xqheRS28ogm1q0eEyLbugHkLdOHjBGLG+m4eyegr6SVUiTcEwlqnhWbM430kDEoBF/yVM50tm0ZfVcgf1fMseIc99bkmIy3+EwF6Ug7MD5jDylxcaIQ/fY9hgSFKTq26qOkb+iY7EO4TNwo=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ef2811-404d-4edb-5abe-08d7e5e03eed
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 10:39:18.8641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rq+Kyc23yCNajdxk6JaYPYZaclz2InK9bxyxdnA0XbvSHq4CykQSfYfv2OmLp9lDU+3Ca4QBvizsyWbznPpNvsveEPAGTsh0Xd4CW/TS+3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB6307
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_033921_284632_70A7B568 
X-CRM114-Status: GOOD (  10.37  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com, richard@nod.at,
 john.garry@huawei.com, linuxarm@huawei.com, yangyicong@hisilicon.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

On 21/04/2020 11:58, Tudor.Ambarus@microchip.com wrote:
>> Well this will work and as the maintainers ignore the proper and even
>> recommended by them solution,
> There will be no patch left behind or ignored. Your patch is still pending in 
> the review state because I need some time to study the problem and I couldn't 
> allocate time for this yet. But I will address it in a week or so.

With all the rework of spi-nor it barely makes sense and if I rework the patches
there is no way they can be backported to stable. I wonder why at all subsystem
rework is prioritized over bugfixes in MTD.

-- 
Best regards,
Alexander Sverdlin.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
