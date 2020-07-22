Return-Path: <SRS0=7+w2=BB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA768C433E1
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 14:02:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F3092071A
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 14:02:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KiCwQtPF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="v+jxMi7O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F3092071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:Subject:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=detzdUJqK74Of65p7yxCHxJSN6BnV27bfWkDEruz0sk=; b=KiCwQtPFaeWTJpQuFi2IdriXO+
	OxlB05OsYZrjAqMjG19TNE+7wuU7RnV9NenWShEGZxq+PmVc8vSX1oonuFBP5t/UTRLXzt1Ex7IyF
	FmOJz7mlxjRs8KH39DChwWFxYjqc7IUEz8KEexTQUtmc1O4mLniWy7tSi21tBNP9d++QWU5Vk48EJ
	s77TTyHn5vCjZCP8gv1k01NRqA/6c8+NoH/gyud6eSl64UwyKBVGUFwIE+F/hVt65I4yMutSod6mX
	kyRyD8BXk3I7jeU+192X/tZO4EoukLapzSlcbfa9iEvXgyo3kJXtwQOa8O2drenu4Zy0fPJjFRAea
	C386A3sg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyFJf-0001aD-EB; Wed, 22 Jul 2020 14:01:51 +0000
Received: from mail-am6eur05on2123.outbound.protection.outlook.com
 ([40.107.22.123] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyFJd-0001ZA-7e
 for linux-mtd@lists.infradead.org; Wed, 22 Jul 2020 14:01:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmTUY0r74zc7I8bZR2vp+qhkqZBBc3gtrz4luDDG6PMelfUgzbKkWMYjEEeCooHg8Ut8nZzihEc62stodlQhWw6qQSfGkI1mBmjX7EksYR+rmR0gKLw0uyVKB0EtFFdGkRw+/vyimF9YN9q/FClga09+MXrE8MyhjTt+Of9p/xj5yUIJnvmQgvjmaT/NB6LlwefplmOnLpalR+E5hB2a5SVw4c0vglkOF4Gfd/RQu1WQ7IYWYg6t/lfBtEajRnRWdAIArfDhDOuNGWLcHtsv2HkG/Z+Zws23Cki1pPTBlfGZBxyI7vC/1SdgaVDhbx9HTkDl+mZbRWFtBaUVTkVlXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+474C47e7TuNGKdhDEqpRqwYs98btVg4YHvMoetApwE=;
 b=GqsnQ7ZLt3d2TzTspPgBAoRO4L19aiOmxxFq1ZLQNdhUhz6xpTDjpVVrcmEN6/Ms6UXc4klOGjz6VpLG4TOwmvrqhz7KaIF3M6zp/SDXaM3f5Ztii3Cmm7Wj8Tdu2Onxzwyypjjp5PH69QpA6g3Wr4FhEoH/rIhIu2K9FXUaKpiTtEfu1SNxpeMW+RZlV+y84je3b0BNFP9Q5NmgqObTyAVDRNWsALz5rxLnOVWxRQZT4u3VvHfZJefoPfYg7dZzXP3LuRYe+Lc4NifnVMGk0SLJBdHkm0/Ufc3gfpfvYdJgYYQcayP8+2eR5QMHhgQLPot1aSj2pwRTHjhby0SKdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+474C47e7TuNGKdhDEqpRqwYs98btVg4YHvMoetApwE=;
 b=v+jxMi7O2E47HQ/W3GsfBB026yOU5ZDwHif41mqlBnUCqDUZp6gnL2/QWAIjL/NXtxbG0iSGxtmQ2ypnYstsoRejTyp2HrWp8QAf9zSwB0FwtojKJHxvQgboWLtTUXyNzOHxf3XxYHFG9odGs8rRvqkQ/ftIIEiGvtSZPHD6nPM=
Authentication-Results: ilbers.de; dkim=none (message not signed)
 header.d=none;ilbers.de; dmarc=none action=none header.from=nokia.com;
Received: from HE1PR07MB4412.eurprd07.prod.outlook.com (2603:10a6:7:96::13) by
 HE1PR07MB3516.eurprd07.prod.outlook.com (2603:10a6:7:2b::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.9; Wed, 22 Jul 2020 14:01:40 +0000
Received: from HE1PR07MB4412.eurprd07.prod.outlook.com
 ([fe80::7071:9f4d:b39a:823e]) by HE1PR07MB4412.eurprd07.prod.outlook.com
 ([fe80::7071:9f4d:b39a:823e%6]) with mapi id 15.20.3216.018; Wed, 22 Jul 2020
 14:01:40 +0000
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Subject: [PATCH] mtd: spi-nor: intel-spi: Simulate WRDI command
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Message-ID: <282e1305-fd08-e446-1a22-eb4dff78cfb4@nokia.com>
Date: Wed, 22 Jul 2020 16:01:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Content-Language: en-US
X-ClientProxiedBy: HE1PR0501CA0026.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::36) To HE1PR07MB4412.eurprd07.prod.outlook.com
 (2603:10a6:7:96::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.167) by
 HE1PR0501CA0026.eurprd05.prod.outlook.com (2603:10a6:3:1a::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.21 via Frontend Transport; Wed, 22 Jul 2020 14:01:39 +0000
X-Originating-IP: [131.228.32.167]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7eb051ac-a919-4626-73ac-08d82e47c185
X-MS-TrafficTypeDiagnostic: HE1PR07MB3516:
X-Microsoft-Antispam-PRVS: <HE1PR07MB351622053591276DE4C66C8E88790@HE1PR07MB3516.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jiLwFBYnFskZQGKhaDfz0dawisN2lcDOYEauDGCHTo3uGcVCBrAkT98sb7qOJkLgDioSRHEqEWb3ZqDcmyUigAz8XhHiQdCPjDtWw5SP6yvJAVEcL1NMzLaa3x3k6DjTaqjtu4J+6j3adZUYjA6eeJAWoZe8yxopyzJU4mixMl+d4jKTN2/i+X638IJhjuMREpM0d65YC8GDj8TRu8f4WOgNZW0rYtTUXR5BGi43OJae89v27ycxsfpSMB7+s6+t6z7Um10+5Lrt+xImCicO9Cnz0MUL2FI9QxHVmtuQMSYB8C2GsCFkRGyosIzjyBCrZ9kQ9I9bAapC0Fo1s0QpG0rd2XGjjNAdoZv/u1ZJyrQU9jhu0nx58NcPngKoMrff
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR07MB4412.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(6506007)(6486002)(956004)(2616005)(5660300002)(110136005)(52116002)(8936002)(8676002)(4326008)(316002)(6512007)(31686004)(6666004)(36756003)(86362001)(66946007)(186003)(66556008)(66476007)(16526019)(44832011)(2906002)(478600001)(26005)(31696002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 1HKuUfXie1b+I+pGbm1arIrqJ38OobUcV3fYyzYiH+uFFBYZgkYfSFuZudZcbSkRW1P0Vp+5RwJNrRTEH8pBU3hQ/mTACnq4ev1vvA2BjU7mvkkgin9NI+qpqOFwojPGnxaXxjI3KU1Jt88HCKVowh/SPxq11VoRnR6dpXbdERyFFAO5aI7DaaPvVVOY6X6QydsAU4OM1E8pRifd99Y0HvjBYFZzkX0bJkeQxQV1fiqN++K5GYIZTTEunal6vzsHwXBMYFGW6/7Pg6DwQr+Z0zpk0XlMGiBQPst8CWssiJHR0CIABcXZOV/tKufccNErMOqj5MZw++E3Bue/GIeolY/6tlqHILOP4tafwrh6ZVNfG6FvD+43Etdgn7Fy40DctAW6+Lc1CwPkpMqTC9jVA01SLQasfpypo7wEAmrAFIx9nM1jGUPMJ56dkDhvrCSfAt+m9HwdxibkYw3nPkb6XX2DJ8xhZvgbvCZnc5yuyX1QFSA4WBKLGTRu6l8VPvfpW5BOhj8WbNZTLLIRlRXubF20Y0UyaJSqYzm+zHRlC4jjC4LEJRJQnLn/exgW7p3Q6iL5wnIn52EwGiWIiYAs0G6ZqynlOcP8pwKMQv5AsH8EzgqPcQJ0HuWgLejbYDHbG9jxt8TwyS0/ezfcvIwVvA==
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb051ac-a919-4626-73ac-08d82e47c185
X-MS-Exchange-CrossTenant-AuthSource: HE1PR07MB4412.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2020 14:01:39.8938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dmtmXQ49sdgcPe6TVTKhaUxCqRuB3wh0wgYrVPBNSA90PYsdA7xO+QTfgF04/8CPJooC3OQb0ya0Wgn27T2Zqw+yxRnikJdJY4+klBY6c1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR07MB3516
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_100149_293891_1452D944 
X-CRM114-Status: GOOD (  12.36  )
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
Cc: Baurzhan Ismagulov <ibr@ilbers.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Alexander Sverdlin <alexander.sverdlin@nokia.com>

After spi_nor_write_disable() return code checks were introduced in the
spi-nor front end intel-spi backend stopped to work because WRDI was never
supported and always failed.

Just pretend it was sucessful and ignore the command itself. HW sequencer
shall do the right thing automatically, while with SW sequencer we cannot
do it anyway, because the only tool we had was preopcode and it makes no
sense for WRDI.

Cc: stable@vger.kernel.org
Fixes: bce679e5ae3a ("mtd: spi-nor: Check for errors after each Register Operation")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
 drivers/mtd/spi-nor/controllers/intel-spi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
index 61d2a0a..134b356 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
@@ -612,6 +612,14 @@ static int intel_spi_write_reg(struct spi_nor *nor, u8 opcode, const u8 *buf,
 		return 0;
 	}
 
+	/*
+	 * We hope that HW sequencer will do the right thing automatically and
+	 * with the SW seuencer we cannot use preopcode any way, so just ignore
+	 * write disable operation and pretend it was completed successfully.
+	 */
+	if (opcode == SPINOR_OP_WRDI)
+		return 0;
+
 	writel(0, ispi->base + FADDR);
 
 	/* Write the value beforehand */
-- 
2.10.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
