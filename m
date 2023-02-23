Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A8EC636D6
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Feb 2023 12:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HaUvLxuDcOIhYJ3nw/VZRGmK0+gWS+zV6eHJKgsnorY=; b=dF2Q62V0gz1LzD
	9/8k8GnaXqWTWe9auTO3o01kN/0BlA4ZfTEIpW13ufymSgYIm7eZ00TMCp/hQ6zsdVlJugS9bpF+s
	+Oxt10uVwCZhq2yJQCUWShVe0dE2QkniiQFBhqsKk2bFnJ+9DAq7nYx9U+bRf8EUyjt8xqHAxbftu
	LVY1B5zdTAr6I6GvQMo1MAtYZYVdpEBkRKa6/1nL8TOY9mzwhrNkDXqPxQWB/jNYoLv++c/D5PyfH
	+pqPiZ4RKDCLqwD5fXW6xvVp3eR4tIVj8YFt7DsPaREOIguXS4R8ihBnoMryHfzIkqqElS0CHTeeK
	zYK2Sbc3SaidfY4cDAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVAhx-00GISx-8u; Thu, 23 Feb 2023 12:28:21 +0000
Received: from outbound-ip23b.ess.barracuda.com ([209.222.82.220])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVAhs-00GIRb-OV
	for linux-mtd@lists.infradead.org; Thu, 23 Feb 2023 12:28:19 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42]) by mx-outbound41-73.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 23 Feb 2023 12:28:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4i5vrnO0ygA6w0QQ/9yOcfT3MlB3CoUZBhSf60zMEQ5Y2hL3L99cFANaksuz7igXAnjtrvx9PNE5QPgu/XKXu0wVYDuXdZo7ZVM4OkvguqaW72IdsUbWhzDYMA6Ik7PJpoX6er2mUq5DuNCRJZo6PEYcBlAriIpW7SCoeQ+SSOcx+1YXh02Z2iRg69XbRn90VnzY2q5OFu6H3Q9foeXdbIwFraKgvrxHpLfSIqcG+GzC0EoFc9d3YsIY1eA46zcdKofB6SvbjCiWsyhaEya+JB/Ee/50QdYKYdO9C+eoNcn6nYqnJEw4NAg6ulHm5VeD7+sxfD2NVz4JeNgD8YC5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+HOBZoqsy5FnGOmfZASFOSfPKh0/LmKCkz2+KtEQOA=;
 b=VmKEI3TQL75945Rla1RbvwiAHlPONQjLf07s9RaP+DbRqCmW+SpvwRBU00RXzzr90Zuje1AbvVQ93brWGw+r4uyTm+zJtxvWhRKj3pl5S6OFdhdlxlXKNLXtWmv3kGGX31FOBNbhZ1EHrDlG/MtylvRNEnZU4KAWBoX9ATaGjSRWC85saUkaf8kvCgNAi9gshZPms69CgepjuP+ec1qFoo6knZgDqcRdaOD98tIrf6/+Acvd+YCki488vX8zkhtDizEOm7ccPHNSY92z2KGfe9jR38mUJlU2O0DG6Z1mWaMqwb5JFHMb44m9OR30vAX0notnJN0i0LrKX/Logt+qXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+HOBZoqsy5FnGOmfZASFOSfPKh0/LmKCkz2+KtEQOA=;
 b=hF/A0tPYmPxPNoV7oj3JbQLFn0omYAVj4RH0kJQKyUhsGKcF+jyzVgIXCv5rQRs/Wv1Fxz9Y96zN9OvuJxGC8yeAkpYqY+D+eFdq8XT3rhWDU0oLjjkmajhEC9CCCtdodM7q6ypaQzX4XqNNSgAzCnkMTpLHZ/ITPykni5lem4DrsOCbcnIbko1SJRHbV6Z4vsrNzCxru/kApt9Zf0N0u2idxX75aBH51N+yjVwMONlWaZj5F60aPcva4ilGmN6vAFq3V39AGwKfQPcNpQ6K4DzXWjAfWpsxZkjagnWOG8nUKoT0H279Th3/Xtjf5BVN2zaeRlMYB/WVo8LMj/gijg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from BY5PR10MB4370.namprd10.prod.outlook.com (2603:10b6:a03:20b::19)
 by SJ1PR10MB5955.namprd10.prod.outlook.com (2603:10b6:a03:48a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.15; Thu, 23 Feb
 2023 12:27:55 +0000
Received: from BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::88cb:a839:2d87:1124]) by BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::88cb:a839:2d87:1124%7]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 12:27:55 +0000
From: Hector Palacios <hector.palacios@digi.com>
To: miquel.raynal@bootlin.com
Cc: herve.codina@bootlin.com,
	sashal@kernel.org,
	linux-mtd@lists.infradead.org,
	hector.palacios@digi.com
Subject: [PATCH v2] mtd: rawnand: hynix: fix up bit 0 of sdr_timing_mode
Date: Thu, 23 Feb 2023 13:27:36 +0100
Message-Id: <20230223122736.379537-1-hector.palacios@digi.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: VI1PR0602CA0018.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::28) To BY5PR10MB4370.namprd10.prod.outlook.com
 (2603:10b6:a03:20b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4370:EE_|SJ1PR10MB5955:EE_
X-MS-Office365-Filtering-Correlation-Id: 55951d14-cd40-4cb9-56d5-08db159963b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	TmIGeNchk1ms3HYsYy+7ZcNwweTjiLSvmhKcKbVDBjuyoRexH3FYGMjsXRlHw7ztLUswbZDG2Bry3GCPirspbFF4BOMg4T/D9y6RTQXeN6IeFRGrUBaOfVB1FLCGjRISxVJtgvYjT7KsMHi0ZhgVyX3ZWZL3bPlqnxgQcpGk/t7MiDZuu7FoFjVJYP0KBY4rTYpyiK/S86kWdo9pH7CGikV4yAq4wh97PaNaC9xWOkrsJ16UJXf+cYuD57sDqASWza7zKfM3+KwBB+LscvwaujplycPS7nVdZ918Aku6DiU1jkBOHwuKSqyh5BLPm5+wn7661PaXESHL4+5Wg7av1I7jvV7322j7POVkvSR+yWiufr76qWZtK1jvMrML63ccbLwd53jSHkCuB/0ioFyi6o6G6VKPe4WuDzaffCYlKA/cysWWsoakJNdqphDKq/lYBuXGGnXb1uhwhI5Izqt9LJGoE3ecuiQVjKmQAs0WWd/nnrz7KrBTK78jQKFfOtTAWh3I5d55wdEKFjHyi9dITrSPChn/CYyTP3WTcgPJx+ye71baUSYWnVZFTQUm3l3nJwyE9yTqyuFuVsG8hJ18+VgaA+/dj0QBMrv1HDMJZoDmBcnhdHHfdIgpyjRY8KBQfJw4txgXOFYUmzhwPvdS/hQ0IzivV7Z3ZFrU6VaWEdm4DPQohwA0mb35mwRn9cEvloQJuBROp2Op0pcxNUo/Vw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4370.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(136003)(346002)(396003)(39850400004)(451199018)(6486002)(26005)(107886003)(66556008)(66946007)(83380400001)(6916009)(4326008)(66476007)(8676002)(6666004)(5660300002)(186003)(2616005)(1076003)(52116002)(6512007)(8936002)(36756003)(6506007)(478600001)(44832011)(41300700001)(316002)(38100700002)(38350700002)(86362001)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?5naIVCpeCWpDzAH2ePMlS1j7T+B9k5fitVfa5kcoA136kckV3qz/qtwBZzPN?=
 =?us-ascii?Q?l2/h/C+VmQeKxbPvtyHTsiik4j1z338MhnOgQc0x+eD9KPBdhVke4IuatxAf?=
 =?us-ascii?Q?IV6PH9LbTN0EwbIgJQMFKaXoJ8fNy/HjqavufcrZlaEu5qMbRPF21ai3Ygwj?=
 =?us-ascii?Q?LSL3MCNOkI5nV3JL0kEH9cNjYakvsC/jNOgvepxA3Jw0NriD2Fwq408S3QQo?=
 =?us-ascii?Q?AjFJgX08O7EZeYhotO67irOYQ6cIuXO1CiYZmxB2yUB6h6fBbRFahKJW935l?=
 =?us-ascii?Q?s20sTYeOSrkelHVtuvWcLNsaGufBkSC1XvsPOrUno7AfbpcYITIYgWyHKO5V?=
 =?us-ascii?Q?PkEXbQAN9vcVqJnR4zaLgNB1A0L7BsKYKvaOa9ysyyADxKfG3T62/QZGwiSY?=
 =?us-ascii?Q?t7/URzug0r8SwgH8UvPZ9c5M4GIhi+AL8uLyavEHoCmMf4DAKJjTOjuxK4q2?=
 =?us-ascii?Q?kqCrkL60YozeVTlHH2WyMkwtxOc/npCLEw5LthtiHraLyJoI360sHISF1h/v?=
 =?us-ascii?Q?CmbqG5CMu3c8KK3/gbgnbhYwvLtfVJiNEQSR22CxmGZTisLYhdrRk20VFesd?=
 =?us-ascii?Q?xxTZLOzQHCqRriM6ZtSgxg+m4ndbCOt0U1o2LxNRjoc1i5F6zPW0X8zLyKD4?=
 =?us-ascii?Q?xIvC6bBN4aDLgE+ftnQvMXN8D20cQgfRbkUxoXGuMpF8iq+Po09MAbp8AlS+?=
 =?us-ascii?Q?P3oeQrhDyvj+EtLVIPFcipYfTZnT8p9BSnFG7qIYbNX1M0leZWNnd7tTMlev?=
 =?us-ascii?Q?XOaxY9sFOZqA7allu+JcIWrSF958vft9QfGNEO9X1TLo9vWsQuIutHMOE05V?=
 =?us-ascii?Q?20KqoAmD8Ib0LkrFYsl2cq7cxSh75wFTTEp11tg8FmgBAuCL3FRdhpCufVxC?=
 =?us-ascii?Q?XK5BNh9Vghr3Ru0I9wtv0p7wKeWeLPX8TrbHn1KfOWdqbY/xN8dpbNDWH8ok?=
 =?us-ascii?Q?VW/xiJ0s4RGEvkipRJbO4lcUsxEjA6SFNdfWrULO3upKVVEtxiM8R1Z5YQiG?=
 =?us-ascii?Q?Wkqho3vTHeIqpDHtPaEIMpRb5pCBx0c1IP8NHRy1p0XtUqE6hak2t5h6Psyw?=
 =?us-ascii?Q?lwmugOkpEyFlkHb4JHmzCT8bDVlHo/kU7zFnRVYqixNoITYC9SZ+zAbZW7OA?=
 =?us-ascii?Q?AIV464CkdaWSUYy4noUx34xnQk2tUzlfQ9M3E7UU3jZY8eowNhuTW+bTUw5S?=
 =?us-ascii?Q?eLqV2VvQSnUHMPBmIN7epxJcNukeuXMC6gwHg1UDiz9n6kbDy7oNxF4EQCM9?=
 =?us-ascii?Q?GwBVm1NpRULjNN3VVy4+jir8mCaYdIBcK+lAOpHsExTVLKlggs6qokNn4Hsx?=
 =?us-ascii?Q?sqIbCFewtyiX47Msqo+mkLKKlww8AWDSio+zD1GWhcv8tjOx0xCf8Zx3OCeO?=
 =?us-ascii?Q?/kemzbe+X0s4wq1l1txQ0iknOR/QZlRf6rVl4XXCWeFNdeIPiAOslBWGBsmG?=
 =?us-ascii?Q?jfYYatcWQ3pGhGxLxzg2bEQgHP5g+thX9/RkhiYJNE/poHtqg8YSkoN1FBRe?=
 =?us-ascii?Q?V6P1hLcrJ48MIAPtjnQI4sygrSl6nNSoCqt70UvGfn2caMTyFd46/t9EN5Kc?=
 =?us-ascii?Q?2swRHLfDOisWI/VpnxUgQrpuADA5+bhDZf6TEBBD?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55951d14-cd40-4cb9-56d5-08db159963b4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4370.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 12:27:55.1874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J0Ss2XFOg5X5yHj4wIbZIqw08D/hoY9jj1focsSjuwGyptAB5xoqOHAwM2TyNop5M0HSm7O/rvFVz+DVgr3MBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5955
X-BESS-ID: 1677155283-110569-5413-3188-1
X-BESS-VER: 2019.1_20230221.1854
X-BESS-Apparent-Source-IP: 104.47.66.42
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVobmJhZAVgZQ0MTMKC3V2CDF0N
	Q4DYjNzdPSzFJNDA0TzcyM0xJTk5RqYwFSA8QnQQAAAA==
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246351 [from 
	cloudscan20-160.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_042817_928342_8A5BA2B5 
X-CRM114-Status: GOOD (  13.30  )
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

According to the ONFI specification, bit 0 of 'SDR timing mode support'
(bytes 129-130) "shall be 1". That means the NAND supports at least
timing mode 0.

NAND chip Hynix H27U4G8F2GDA-BI (at least) is reading a 0 on this field
which makes nand_choose_best_sdr_timings() return with error and the
probe function to eventually fail.

Given that sdr_timing_modes bit 0 must be 1 by specification, force
it in case the NAND reports it is not set. This is a safe assumption
because the mode 0 is the minimum (safer) set of timings that the
NAND can work with.

Signed-off-by: Hector Palacios <hector.palacios@digi.com>
---
v2:
  Move patch to Hynix specific fixup hook.
  Use BIT(0) macro.
v1:
  Implement generic patch in nand_base.c.

 drivers/mtd/nand/raw/nand_hynix.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_hynix.c b/drivers/mtd/nand/raw/nand_hynix.c
index 0d4d4bbfdece..93f97290e3ce 100644
--- a/drivers/mtd/nand/raw/nand_hynix.c
+++ b/drivers/mtd/nand/raw/nand_hynix.c
@@ -728,8 +728,22 @@ static int hynix_nand_init(struct nand_chip *chip)
 	return ret;
 }
 
+static void hynix_fixup_onfi_param_page(struct nand_chip *chip,
+					struct nand_onfi_params *p)
+{
+	/*
+	 * Certain chips might report a 0 on sdr_timing_mode field
+	 * (bytes 129-130). This has been seen on H27U4G8F2GDA-BI.
+	 * According to ONFI specification, bit 0 of this field "shall be 1".
+	 * Force this bit if unset.
+	 */
+	if (!(p->sdr_timing_modes && BIT(0)))
+		p->sdr_timing_modes |= BIT(0);
+}
+
 const struct nand_manufacturer_ops hynix_nand_manuf_ops = {
 	.detect = hynix_nand_decode_id,
 	.init = hynix_nand_init,
 	.cleanup = hynix_nand_cleanup,
+	.fixup_onfi_param_page = hynix_fixup_onfi_param_page,
 };

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
