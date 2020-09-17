Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B7CC43461
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 07:33:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAD862072E
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 07:33:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZdZMfMu4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="RZ90dSYj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAD862072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yzTD34fVFU2giplZbccnpnbH4EBFzJWHFU/BgvTLaxE=; b=ZdZMfMu4zaRz9XZAu02b0udJ19
	LKjxphcUCxGPCYfvedXtMepMg/swF0MHHITSDmv9L/kPDcj71gow4GmIMMcAmNu4tQ+MWF20f8IoZ
	PruziY4Txpybd/8djzKYK3316ggLrcIVsOJtAolljL83uPXkXsjJHQfUpWkipnEkj5SHUeE/H29Bm
	cN/A7vnBWUwpWK+dMiirdufL0SusT6FyXrdTXtX5BYgmY5T6IeW7Q25+Az/PUlpqz55PpvXKK14JD
	G8wbd4vbD81wpTkOfTlqEJwU/Xcn2w2zrGHcu0FRowPe0/twPOQLztm5o6OJiICfLCqvshXr32IDw
	GXrpcY1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIoOj-0005fn-9m; Thu, 17 Sep 2020 07:32:05 +0000
Received: from mail-am6eur05on2103.outbound.protection.outlook.com
 ([40.107.22.103] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIoOd-0005f1-Ge
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 07:32:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/SuVwaaYumwd0+6gzuNW9Xs7U/L2ZdcU6npCDi/0wk3OLtnyplhzpagSoUrdV7OHpfnGZ4VGaZ3EgdvDjxnRl9sPmjN1m43OOrK01H9xfiZrKiXBhNYD4uELWy+L5PKLKs0Jcgsd8iCLVyrYUpQ4qI3z2OfUmSY0huAck7jAKReo4aXk0SmQLJtS2cvQAAEjCuhZEsixIGLRCrIZ8hMlHqzX6qMAnFq+uQlMdFvLN4SC370sfCdw+JvTQiB5+wmhCjmayl5BF0V+rQF3Madtp2ey4VYPNl4ceVdREZhjLA9Kgnka395j0dAj99VWfwyZ2Wc082iDxi25/CgUjbJAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2v42f8VbKrEcU6XREwpIOiAboFGySw0jsUR19Cc8oU=;
 b=bBBkcbxFFbJvXeJGqoA6ot/fHwvBSJsYKn5ogU1UEy+7afeEm2WpcpUmjlRJqcr4eccl8br8iyOmposX7IzenVA3E+z45DOrSt2vGANc22SHTfkF7wWvu4RzNG95qKHdMXFmq1whejeSGPq8A5SdfY/1MQ+fDK6y+qEr1H3oH9m/aa3MaxAjgdybYJC0htRkdUmsioQGOxIYYkm77G1xaV0XFMqiLC9MInnzEWNqIx7eJJjSQhu98GgyFpZU8kL39lABm/d+wi6eAnMM0QvX+Z+pryb+3eTc4QOCPFKC92AMprJWCkIaH86IO5ZnU1Zm5ijEwCVd42/u0zcZB4B7EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2v42f8VbKrEcU6XREwpIOiAboFGySw0jsUR19Cc8oU=;
 b=RZ90dSYjlmfd6zxkVux5nSpcktlmYFBuf84DSz64G+KE0RPna3Kw+noY+7O9A/mDQtTbMHu14h/j757cKBuflHYgBxS/1zA8VR4KMiTDjVT6n4ZkUGtBzNAnrXslfYomWMUtWDpIRRtqRK4flpfyXD2mkHmfsJNEyWmrpIX96TU=
Authentication-Results: nokia.com; dkim=none (message not signed)
 header.d=none;nokia.com; dmarc=none action=none header.from=nokia.com;
Received: from VI1PR07MB5216.eurprd07.prod.outlook.com (2603:10a6:803:b0::15)
 by VI1PR07MB6109.eurprd07.prod.outlook.com (2603:10a6:803:cd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.5; Thu, 17 Sep
 2020 07:31:57 +0000
Received: from VI1PR07MB5216.eurprd07.prod.outlook.com
 ([fe80::4d01:44de:bd25:b64a]) by VI1PR07MB5216.eurprd07.prod.outlook.com
 ([fe80::4d01:44de:bd25:b64a%6]) with mapi id 15.20.3391.009; Thu, 17 Sep 2020
 07:31:56 +0000
To: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com
From: Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>
Subject: [PATCH v2] mtd: spi-nor: Do not proceed with spi_nor_sr_unlock if WP
Message-ID: <25c209e2-f48e-f4aa-4043-1f259e26a7f1@nokia.com>
Date: Thu, 17 Sep 2020 09:31:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
X-ClientProxiedBy: MA1PR0101CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:21::34) To VI1PR07MB5216.eurprd07.prod.outlook.com
 (2603:10a6:803:b0::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.30.9.7] (131.228.32.167) by
 MA1PR0101CA0024.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:21::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3391.13 via Frontend
 Transport; Thu, 17 Sep 2020 07:31:54 +0000
X-Originating-IP: [131.228.32.167]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4ad99035-ec76-4fe4-9991-08d85adbc1b3
X-MS-TrafficTypeDiagnostic: VI1PR07MB6109:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR07MB610920DE7EDE699B6971678FFF3E0@VI1PR07MB6109.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YKzdqzFrGyPRBcdNS2DiuRIf/mzCwTP3VH/JdL99Q+foyimg/cM5q+0egyjmuxanBI9ROu33jtSPX0qOwQd+jHWRrnn5I+OnBfS02H+/zQUMHyIAW/uX5P/JBDwwrV4WLg5OUryPG5jZYTA0t/K4sSCZgsTBivnHVUNoSh7fRhT9Sqwjpp4/TZgDLgdkkq2/ixAsof2WgjNOPYKNSfVPvmecPTo50Wyie9dt/VlNRboXW8hu+VeQmed9bpDhV8Ynuq9NMdxhsg4Un52Bba5WZjIxlJF9GJU5WWT7NErbQnndduRhLD7GNW7QZ2DV0p5lro0NEaTZFf9Kyb126zaJBEL/hmTgQhbxBJ/oQ4OF3RYVuBkVV3QGhfv15NabR4pf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR07MB5216.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(956004)(16576012)(316002)(66946007)(2616005)(83380400001)(86362001)(36756003)(66476007)(66556008)(8936002)(6486002)(52116002)(31696002)(186003)(5660300002)(8676002)(2906002)(31686004)(16526019)(107886003)(26005)(4326008)(6666004)(478600001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: xZnrnh1d6r53SHMVgw5UtW56hQWMdq8jwO3wiZUXQQnpVc9Zr84KmdmRYE5o2/u5Aa2+xf3NnSjClRIqvy9UTAbbFsgN1CrDD9sZJLGtNz8RGOd5VTomzM/HV0L6VVZBaS5pGyR+YLC1J1NwX28ryEuJkZzjRy7+EHJtoVEv5Dj+gil+gwbXXA70qSjSk6z1jmhZhLTSosquD++I9qXcjpEdY7pK8uDHJ69+cwSJ6z7n45tOob6UT6GrOGbJdFExhTB0bRoqjs6cHxJJqO4vyTftcZepmnPn8BOs27SAPMdWuYM+YPKlUg1Cb92SAfJwvJADeF0bPUzzwS9xl1Sydpn/Qrq0ahk2fLoNZovvH5FEv0r1VXD+M9d5fFfxbzgiJHi+cdOcHr8nXUOIvCWaQbsaAWOXSpRn0QxFynO2dsum39uOl+F5drRnFmY0BaXBC5271kC340/I6rMh01+w6xeD5oSXXjaQVro4x8fBZYMi9kCMlniF/Nf5YJPCxkqs9qDy3+bVgWnBA9JEsPQR5t9YrLRapuRi8seDRkCVuBejBlD6HgpMVL+QGPw2p0djR/QYzqvcA+dMKB6Wlhol/wBd4/fae25niwQpXliriTcl9MNst95Jj/pt9Cw0n5sWY/8KrfUYuF3tb2nmMgBTGA==
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad99035-ec76-4fe4-9991-08d85adbc1b3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR07MB5216.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 07:31:56.8654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jCPjX5vViYNUBUL448fV+JviR84ScXrDDU8hFRJwrMKBRHhLGm2zXoufOpwx8+UPFqEAf7iOJRJeGkQkXj82fyw9UsklTuVW/TCNxdz6lPBXjUu+uJ6FMiRbtr1k0XEd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_033159_730275_03241680 
X-CRM114-Status: GOOD (  13.38  )
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
Cc: "Sverdlin, Alexander \(Nokia - DE/Ulm\)" <alexander.sverdlin@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In case Status register 1:SR_SRWD was set (either by software or write
protect pin), sr_unlock fails on spi_nor_write_sr_and_check in 8-bit
mode due to fact that written value will not match read value.

Problem was observed with n25q128a11 device having protection enabled
by W# pin. Failures lead to device probe failure.

Problem was uncovered by 82de6a6fb67e16 ("mtd: spi-nor: Fix the writing
of the Status Register on micron flashes"). Commit selected 8-bit mode
for micron devices. In 16-bit mode, CR content is verified, while in
8-bit SR is checked for sanity.

Signed-off-by: Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>
---
v2: Fix whitespaces added by mail client

 drivers/mtd/spi-nor/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 65eff4c..4c3acc0 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1777,6 +1777,10 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 
 	status_old = nor->bouncebuf[0];
 
+	/* If SR is write protected, we cannot unlock */
+	if (status_old & SR_SRWD)
+		return 0;
+
 	/* If nothing in our range is locked, we don't need to do anything */
 	if (spi_nor_is_unlocked_sr(nor, ofs, len, status_old))
 		return 0;
-- 
2.10.2

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
