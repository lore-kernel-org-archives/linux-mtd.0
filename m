Return-Path: <SRS0=ETWj=4N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A26FAC35E01
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2020 18:02:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78F922176D
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2020 18:02:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n1ivZtD8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="UEqgn2NQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78F922176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UNYMwR1BosARCsBrnfg5rXIEJNU8xHddl07tn3dspeY=; b=n1ivZtD86GPxSR
	uuW7nWQZnT4UbNbtrMU4t44hmhQl7mvGRAhIKeHZ/RrpTONdkpUM0wHPtM5eqWU4FukAP9x/HSQ+3
	p5tqWewdtZsGgho36jTaVIYQGSRKxR6c48s5cLh818MGvTOkwqCcpmYxC2N1FwBaA4DDQIobDFYB5
	9tTlK7tpIsCHSq5KlT78osjLQ+jEzfdEo0kCVypa0iE8kRLAxlK61LbQzHVErXXTlWsucsnXTSPHt
	7di2fWBxDaCjJx5rSpSTRffD1WE/laolIVpLbFiWxT8khK727W8elJK+j36xoZ1DKMUF6JMIvrDvB
	EZPTyOXjfrtjRwmy2bjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6eWn-00061O-Af; Tue, 25 Feb 2020 18:01:53 +0000
Received: from mail-db3eur04on072a.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::72a]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6eWk-00060k-GV
 for linux-mtd@lists.infradead.org; Tue, 25 Feb 2020 18:01:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMafoZK2G9VKiOnWtZf2yKjCuLvZzzTfKVl5FY3eLqDc8K87RO+zLBNwaa0hxN3hzXL6SRTOEwJuy4BzD1tuqhPjgOyp5HYP+gn/9LZ7I42/RGV4k9pOZGFQw1nM5XS8usk2tlH6z6cydyfYIHFosHpA3mcX7TiWxiVdYmwiH1D+gB5SK1svbK899kj8T8ECVA1AbksHG6xQWi9rmYOE9RnplqegniwOMaJmhcLZSXsiSD/PQfyHUODRl4lnTin16pYA9Zy/ja/I9ZjBJT+/D2CrUT+zc14GzYs0jVw6vsPWsv/53ScadZI/zdyamQsT/wNTnRcp0ZdKI2Iue9HuAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4458fDrDSXR9uPJuWeQQBkDwR3YGEmFg9uMx1xEhzE=;
 b=RyAucvg3ocImIfRV+wfiOOQB8xwzMOLN6vnt6c48T9YIOKpUvg1ndKfeclWxDsaPymeeuFq4kQICWNLKOQStGTSxbOv1zcJKqJy0j09pyuhp1beeIvafFr3iWH8Nl4rE3cveXYAzPWsNE9Bp10Bu5o+BRGiyELLJlC3wT0Uk4z8Iaw+6OqHafNeLPEiU0y7z4ZoL0SBo74BnCfb5znqHmWNTzXjE/HM7nqLwwOHqK3N0FzSGVc9QTColOHZFD82bBHYYc0k2ATsmmU7YLCJgVpv2WZYhJLYAk4Wv3f1IaAwexkTJt6RG0RG8HS0l3sw2SyhvRYAKi67W7Mt1EMHfhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4458fDrDSXR9uPJuWeQQBkDwR3YGEmFg9uMx1xEhzE=;
 b=UEqgn2NQSdoCpqEDYtEppoAn09aoNQ0SMne/FHiT2CLn/XqDW84eFgZiwBse2obNWxR9IREL9O9xrmU0s60dQl1y2DDZ9QEeK/wIxIUKbyhpeS1G8XRzYKJArdoYq9lNuI6bxhFNJyMi9G8HchC9pMHglSELQV0aCH5iOfI7evw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
Received: from VI1PR07MB5040.eurprd07.prod.outlook.com (20.177.203.20) by
 VI1PR07MB4592.eurprd07.prod.outlook.com (20.177.53.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.9; Tue, 25 Feb 2020 18:01:44 +0000
Received: from VI1PR07MB5040.eurprd07.prod.outlook.com
 ([fe80::f5f9:e89:3fef:2ffd]) by VI1PR07MB5040.eurprd07.prod.outlook.com
 ([fe80::f5f9:e89:3fef:2ffd%7]) with mapi id 15.20.2772.012; Tue, 25 Feb 2020
 18:01:44 +0000
Subject: Re: [PATCH v3] mtd: spi-nor: Fixup page size for S25FS-S
To: linux-mtd@lists.infradead.org
References: <20200224084741.107963-1-alexander.sverdlin@nokia.com>
 <20200224084741.107963-2-alexander.sverdlin@nokia.com>
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <807c2e06-15cf-9ac3-bb50-79488fa672e3@nokia.com>
Date: Tue, 25 Feb 2020 19:01:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
In-Reply-To: <20200224084741.107963-2-alexander.sverdlin@nokia.com>
Content-Language: en-US
X-ClientProxiedBy: HE1PR0102CA0031.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::44) To VI1PR07MB5040.eurprd07.prod.outlook.com
 (2603:10a6:803:9c::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.166) by
 HE1PR0102CA0031.eurprd01.prod.exchangelabs.com (2603:10a6:7:14::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend
 Transport; Tue, 25 Feb 2020 18:01:42 +0000
X-Originating-IP: [131.228.32.166]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0b5d8d47-e50b-4664-0126-08d7ba1cc61e
X-MS-TrafficTypeDiagnostic: VI1PR07MB4592:
X-Microsoft-Antispam-PRVS: <VI1PR07MB4592717F1C5A8F6014E2F04C88ED0@VI1PR07MB4592.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0324C2C0E2
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(189003)(199004)(6666004)(2616005)(36756003)(8936002)(6486002)(316002)(31686004)(4326008)(6506007)(6512007)(66476007)(66556008)(956004)(66946007)(26005)(53546011)(31696002)(52116002)(2906002)(6916009)(16526019)(44832011)(81156014)(86362001)(81166006)(8676002)(5660300002)(54906003)(478600001)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR07MB4592;
 H:VI1PR07MB5040.eurprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o9enPCXjyrn6etX7v0ltsxu58MezEhxw9CFrCS0Onn7DEKdl8OAWv+LbwnsPy5JrIbpswsYl9T71RrXJjuQ3dKmNMzcDIuVzi50JAl3Wj3YxxXWut4Y3mlhs6uM6SGIxcEigbV3JTSKj1IjBmCv2Ag6GjzuNMe+JjTd/Nttx9UPZoCorTF/SIbX3UMoGeFAUAjGYl4tM4A5iEduYcQnhWlMjGWm9oTmF9QzPDzO/9aYXa4YjZ2ZYWy3lNXfyPioqhZvbUMJ846UZITCR1Py1SYn8iSw3Vdw2yICmkeWX0n4VNeRnBEoL772Z42PN4tAOZm8ZFDfFgsrgtrae04MgJjr5DddxJPWKnvYHbDd0nmLhcyPjHKK5/X9k2+KD9DQxUhGRCwnjwDFKIiES45Et+GVYLC2tVreUtdrssWtSJd9XOQsjcYojW5UDtKixzj6n
X-MS-Exchange-AntiSpam-MessageData: kbiYp7bAK9wYEF3m8+ujZdbIvEMf6IFoUWZOA+tRvpMdYDguJi2PMvZPinJW9s0M2OOB3mk9270+v0RCOJz8tYvwGBUhhBebLU2i+i1assfVUN93PT/KQSTTp9M9Ij7rEclCfFnGqQ6zEem94YvNjw==
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b5d8d47-e50b-4664-0126-08d7ba1cc61e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2020 18:01:44.3509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YD1syB+2x6I42Qtx02rODhpfaN2lFz0XuIKCGRsInJADD1BsNDx20JgYlJgTun4mJVF6yyjFHXeS70cu3jeJo/OgsixVp9ZSlwtLy+tyrY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB4592
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_100150_929888_E2B1FE0C 
X-CRM114-Status: GOOD (  13.61  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, John Garry <john.garry@huawei.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello all,

On 24/02/2020 09:47, Alexander A Sverdlin wrote:
> Spansion S25FS-S family has an issue in Basic Flash Parameter Table:
> DWORD-11 bits 7-4 specify write page size 512 bytes. In reality this
> is configurable in the non-volatile CR3NV register and even factory
> default configuration is "wrap at 256 bytes". So blind relying on BFPT
> breaks write operation on these Flashes.
> 
> All this story is vendor-specific, so add the corresponding fixup hook
> which first restores the safe page size of 256 bytes from
> struct flash_info but checks is more performant 512 bytes configuration
> is active and adjusts the page_size accordingly.
> 
> Fixes: f384b352c ("mtd: spi-nor: parse Serial Flash Discoverable Parameters (SFDP) tables")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> Change-Id: I998829dfe43a6778ac439a693f5f41670acd20f1

[...]

> +	ret = spi_nor_read_data(nor, SPINOR_REG_CR3V, 1, &buf);
> +	if (!ret && (buf & CR3V_02H_V))

please ignore this patch! Besides forgotten Change-Id it has a a faulty 
error-handling above...

-- 
Best regards,
Alexander Sverdlin.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
