Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E742C6FD1D
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Mar 2023 07:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VwYEaDa6yMS9q5NgmiENf4thxhY5QcGgq5myntVP/Rw=; b=K0hkKh2heh3f36
	DojFdTRPmNhQAFAygrZvb/bK8EqHr52Xya+rn4thSc3Y/D5qv1nOoPASI2zuS9sNAtTrtmCIGF1hm
	jThvKoK18OrtiC4np/73g5UY70k0okRQcnQFz/OS0/bOLV7Qpds9xK6Fx2fAhjr4UoE46HabcP0sS
	FOjuwmnTNCrZh4rA1XmTTbMi0HS14HhaOopKi8Ti9GhxwdSxjnlDDgA+Hhat90Sx2qoAmNsdH68N5
	EBBWfwQifCAWLj17jqnyxsUE577qXeznJjuNz2ynG6uCW6GT8x5GLlVKQGuc896nypFNuV5vECdEk
	+XIjxPzOmGhcyYRbcqKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peWA5-00BUQH-1t;
	Tue, 21 Mar 2023 07:12:01 +0000
Received: from mail-tyzapc01on20714.outbound.protection.outlook.com ([2a01:111:f403:704b::714] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peWA2-00BUOk-0C
	for linux-mtd@lists.infradead.org;
	Tue, 21 Mar 2023 07:11:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Si+Ln102CsviYsv0SEqjXz6H4nKru1mwMMlhk758uPAeKWmBN5vIHKCGMOhLky55572kb1rqEg7HEXnlutOvs819wR2hXHEvSa5phWZCdlY+0kDPYbMsSVNxTgY6YMKgIUcvuCmXiLcrnFQy7GWdwoKunseXVBQt73YavXkN45oy52T7dyCcxr5RRBi31NqqUSEfHwRZouxi0oo3fOgFsCHyV+5lTu7KXMBUCI/AM2MDy+HuzP/mNEYrHFe84Yoa2cmYoY5MeW7Gl4CECCls8CGFX36Pm6jMHA2mZSXjdhab50AfmcaVmYEnC39hjfCSdgKrwTvqd00OKjyh83c8Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKKdE7m8Almzk+6rAp8r6PgKf4Y3D5iLHbndMnE/rhc=;
 b=Hkm7Hta/TbAb4e4toyl7t1MwNyGNs7jbJUB289+808kMXo1we/2cVk2GQzj0ZuZiKXbS4cJTV5+FRdeL9co+DdUdIS/t5bGUxmoQmmikMaw7mECGvUceDEb4nTsjYeUWLZp0tCZAvgQMZIZt7GW7qMYmSriPijAoZ8lAykKxBLUsS96ZgosDejYFU1kTSt9rY0VDL2J19TnDXwqk6lt5k0O0QHeekwLEO3f8OERbfSRqhN4iGP/jdi5R0lWwkic5N/CileYLFaXI3+PYiYwDitoUjvWGcNMSJGkWpbTk3lGMHt0T0uHvuOx3FQu6nMjCmPh4HgyoHG9VAMuIuwBvQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKKdE7m8Almzk+6rAp8r6PgKf4Y3D5iLHbndMnE/rhc=;
 b=R6NigmaCd9+mfq3t3sk4RNEswMK5YZrCeNyon9+i2qUTMukMfHWRCe/2wE2PW7zjVlKa+CwQNBOdQwaIjPjDmwadhyq41vaqK70eISPG/NMGHEw4NT2n68EojwdCnuf4IoPTYkXNy5FGL++EiVEMDVNPgU8jL900esQMNJki94kiAZKY1STmNakvCsTqnDHDWJKGJUFQ3FtVu+c2xvcxA+KlABiCthi7YdolGf+UFkLVc+NXbKXPyTN89/Az/pkOBazf7iqknJgk0c+s/aZXngb0+ULzTrxVDX/1D0KpT/Ly9iAzLhS4InCzGsCGc17EqYy4qybga2EFqlwNWqztNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYUPR06MB6220.apcprd06.prod.outlook.com (2603:1096:400:35c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 07:11:49 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 07:11:49 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Richard Weinberger <richard@nod.at>
Cc: Yangtao Li <frank.li@vivo.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ubifs: remove return in compr_exit()
Date: Tue, 21 Mar 2023 15:11:36 +0800
Message-Id: <20230321071136.68872-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR01CA0125.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::29) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYUPR06MB6220:EE_
X-MS-Office365-Filtering-Correlation-Id: 50739539-73fa-4b70-e57d-08db29db8a0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	uGltBMgca+FPSQqNvUiSJW5tBNegFosAvpJsxTzoPdGJKqDwOS8fy9+zqxE2vMvLGIATvgd8xzsNO/r7+54p3fGd4/mire4PjNF9zdW+3ksUXACeVFgDbVqHfgSGu4/kcB/Fazxr439roXKKBkSqHorYwJ98GXe2jOvr0TLZ0MzLWKoGZspSTlHJ5dHO5KhI/VVhsXoW9xUekrNO4GrQp9GjFC3PD2oR4We2Kitncn0wSUcLz5OD15HraCoFmCXB5v2xBB+96s6VwKBwRLzhz1dOjwPofn13WiN5Ptrv2ZMnxelP/JAB1yQfJmnAPKroNxxEo9MYsJlR/6J6mKzZugMzNXTgCbXYgR91lu0tR1ZuyPGCcYPx+t6FApKNMDeksNX1dHKnbx4CSRulQT3S24OmTZ+IWVb0xNl43pZPxUodB03Nunee5IvG+D5S7U28CvHyqFdufpuJgHWYmc1vG3Kh5hrf+K0aGR/5iUPDHi+yx8yH5MAEkUEiAmcrEwHZTwmSy6J0Or1YtQOmPSgyZa+YkJLvr0MQ8W+5r/b3VOodmjJ3EB/sZbioA8jygC3COVBTT/bAJwWmfIUF/YlhEZ2M6ZY1vYEc7BU0uDgWUXI4PdOWxF/owHwYXGofPkLcRHb/8gMO4Hg9TpzdWtON5cDYDxgHoY/HOyj69WW1Pnze4jEivczTSS2J2ni91QBY9jbqre73+E6Wp8T7M77Wuw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199018)(2616005)(52116002)(186003)(6486002)(4326008)(83380400001)(478600001)(6666004)(316002)(66556008)(66476007)(6916009)(66946007)(6506007)(26005)(6512007)(1076003)(8676002)(41300700001)(8936002)(4744005)(5660300002)(38100700002)(38350700002)(36756003)(2906002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?s2/mNrpTEjk1A2fi64tzQyxQPHMRr+arNiyTJ/KuJu+7lFnWPXTs845oHyEK?=
 =?us-ascii?Q?/w3Xyup1N1/t1CIOEhF1FnXM1OW3Ed5SJanV9UpgY7wLDUY4b2TbSbzyaRrD?=
 =?us-ascii?Q?BXtn5xEYIk4JartJHfZ68uqEECkWPpsa+OkmoIAF/zAlcl/0PA7k7XES+bgG?=
 =?us-ascii?Q?UoL7DMR+URAYGA4QYTCkE7RLn6cqIc254JS7+oyGb/wxs9FDxpxjcVovYxKv?=
 =?us-ascii?Q?LF64TrJJo5FPi65KzkrJH0FuTl2/pHuRGJsZvIpAmyxjQPEHNgm3d405+ri7?=
 =?us-ascii?Q?DEl7E+TeTfqhDQoZ+eXZnD8b+1hdfkP63c3Z3GWru1xqIfcB/QRUXhikDNUT?=
 =?us-ascii?Q?+j8Z1ttFeQ2s6Du98ffdbs/S7QMkgaSbC1+v4/AdWqXxM9erkULeR4sz4n1T?=
 =?us-ascii?Q?vFx+UA3hqvmlnHeQHXs2wHm/ukWz0tAQD5T7bXs82cElPz9ooedNEADZtFaz?=
 =?us-ascii?Q?Sz+YO0iZ99cNCT3khVU4sO95RzHJzCwxKqqBwTV9QF/68NZQvBytzCwxW/4k?=
 =?us-ascii?Q?uslxxEu4AduiibIwAzob2N5J8HuCeu9mUr52Dy97SUAeSH9fDlF+n6Dd1thD?=
 =?us-ascii?Q?Zwc8g1GFmX5mETVYVrAiPvbRLDLHld5Lkca4+bGpvG3ku1bjzquJunp7L4+F?=
 =?us-ascii?Q?bkG6KMVkYR3gX9DoTj/HXjFk76mYNvLNHCVezZjARFTMIIYMn6uezelmn9Ro?=
 =?us-ascii?Q?sxdavppIwNTR2K78hsZRkeB321cPzZQq+aZ5aivLMH4zRhhziFkuvG4RIYVK?=
 =?us-ascii?Q?MhhyyfuV1CBr8DGgPlHAztjvR3bvVjbKez9BpfJ+JB6oPAnm1gCLiMHjfZTq?=
 =?us-ascii?Q?65l2JDav4YLl6lQ2r9KRdWJnlMf6gEeb94JZA/JmzMYM1yeJ1yG86nwpaU7O?=
 =?us-ascii?Q?Etksb5ChW/sUwOY+do4kNK3/4Y47t5FDQbkWIKZDBUD9N1bzhVwGBdRXaWZ4?=
 =?us-ascii?Q?p65uz+Ne6+7INjmzuIBbZ8kZVX+ScjPjKRTrNtc2B8jqiGvt51mI5KwFI50P?=
 =?us-ascii?Q?owtX71eJ8o4PxjEXDLDKSJMJTuTcu/izqCFKdSD9Qj9dJsniqGiO9tv66DXW?=
 =?us-ascii?Q?2o6v9xWG1ap4bi83N34MY/v5DJsqJXnQXAaLEHrgtrLzwWF7qI49QIbnd8iD?=
 =?us-ascii?Q?Nt66DQaDziR5ySu2DXcL9D/nea7ioGgXlYuPEXPz07x01oY/tzw2zPqrOaSm?=
 =?us-ascii?Q?AsNsAbVR1yWlBWlIhtFHck9BNNJDPuPJAvWZrnraaZ4oENUrT6bm6wW3Nbiq?=
 =?us-ascii?Q?05XJQZEUks5RkBi/eiH8NcLvR7hTcBqL9aJXxDmaROCxFwzCnJXmsl3nUCUQ?=
 =?us-ascii?Q?W5PKezgqV7cv0SlaO5/SJMuyoEVIIvj0NlA578qM9uWcar2o6A9s2PzZJuHI?=
 =?us-ascii?Q?xcmL9Z5el2xaWxGBVMhyxSJ8sDFrGMAskgBa4MC2PZnx3mGwWzSlYaY1naij?=
 =?us-ascii?Q?dIf9Hr/6vqW+n9RmEIpEe5/UayrMkExMp0AwTYThOcv5fhgDbTyrwLxgy8r6?=
 =?us-ascii?Q?K9lSQ+DRVfy4UxdyvQb7e06jqHlGCfVhM7tvAOWUK2KsvdKqhUX43iK0fwK+?=
 =?us-ascii?Q?2uK2opmfDwwDWD8+6WONlv3xHr6tqJrY8fdLYeY1?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50739539-73fa-4b70-e57d-08db29db8a0e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 07:11:49.6365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPqjaP2OXsaJJP9slZrswWzfsil4hWkUMXhYqrixrz32ueqj+2chZt8ovimDZHzLjEAxYSitNxM7aHSneqz53g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6220
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_001158_627384_DAB34F56 
X-CRM114-Status: UNSURE (   7.72  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

It's redundant, let's remove it.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/ubifs/compress.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ubifs/compress.c b/fs/ubifs/compress.c
index 3a92e6af69b2..75461777c466 100644
--- a/fs/ubifs/compress.c
+++ b/fs/ubifs/compress.c
@@ -217,7 +217,6 @@ static void compr_exit(struct ubifs_compressor *compr)
 {
 	if (compr->capi_name)
 		crypto_free_comp(compr->cc);
-	return;
 }
 
 /**
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
