Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33343C61DA4
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Feb 2023 15:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oPM1yqu1XeR31aGyZ+LnWsoFtaOS+ngDQyCKmoOx6PM=; b=W7gpOaxiZYhVRO
	7W+e6ampY3YPunGmxjn75douaGa2iPRZyuKXThkfHL6+yKCmL2MyN+I9amXp/xyfxPwkyPw2OrHCO
	lPDxvpzNTz2bdufYRQ6GriHYbEPSGJ3Xj4WCQXs23qwymcks5gQRoXmiccLkdIVdiN5hpHPsou+TT
	y/GRmeZEPLcXVOHPp9CAWu9ePbYv0Z8mkQyMiILMbNKDAibpygJy78dEtIZPD3awaPDeV2jlomdbD
	2z/VoAAt9GL7jwIxk0h75OWhu1FXr5nIBqIxsMwI/lU9xXCBJx5NTRBK5u7Xhq1H26TchTg82QMlQ
	mD6fH7f9QsyeYV4ztYSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUr0H-00Cr19-0L; Wed, 22 Feb 2023 15:25:57 +0000
Received: from outbound-ip23a.ess.barracuda.com ([209.222.82.205])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUr0C-00Cqze-GA
	for linux-mtd@lists.infradead.org; Wed, 22 Feb 2023 15:25:55 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170]) by mx-outbound10-241.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 22 Feb 2023 15:25:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3TaK1D+YSIwwtoWhGTnrsyXRvzvClcv3g+5/bRvevDk8up9U8yRxbRxF9g0DBDPLS/LKrF7skI/tz2DkAReU/xhumzQDAOUNTVoCHLzoc6j7jm1C/9xzzH6R91MsK8B7VOhhxTRrTM1YZXYzZpqMFesIs6C7B7UdaKMtMxhygHQnIHDD3TRLch1/m4OfhDgg9Rj/96IBSrCLtI5xrYN+1GOWGPWnqw4zhFJfhdgZcxe+iekVPlTqCnzwNwDgG/dVjcHqsNsUsm/+6KvnvWZkx/irAlnTfDahh2Xk58jeX/szv+9Y3+fCOwUvmQ265SyXi0Mn2Kt1lggMtX0LmHa4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzWNYZW7+cv+IYPT9F00PNvuczMq8lhqSLRj8L9T9zU=;
 b=nfSi+ct7EmlvriYjKpWK9vxaBI8Sp/l16Pufy252wVWqcvxpiNtEa3VL0fSuzisKAzPM92c869pQRjS/Hy0JVSp77jjQPeqlkePtdT0mJUdFb/uv/3KZczHQJssoplLcORrH9e7EPXoEHtbg7QgMbTdROvN46YGDHGOcanuxhIt0kN5HCirAtG4TcfcbjynxTGpVV3DsBWWv7xJURdy9ZqHAsqkh6PPHx/Ywd2uTV2BsOdt1eDhRnzngpkQrULlsVgJjvZksSt38WhD3TyI7HuQwWPN+dLYDG3TuTRPbKxh5yRhrxX5c9BvPcWrIGDKmIZX9SrviXWaMSZMqlPhTzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NzWNYZW7+cv+IYPT9F00PNvuczMq8lhqSLRj8L9T9zU=;
 b=iWQXhykoloCs9vsNjtg5l74gT4KVoMCCZbpMV5HeP6DdKIkcAlNcTiyn9eciYcrAwsjQ/pC3nnsabZWKDJRhhxqLvQ4vORtEusMwD8ECbZYBozQCKWhE170bRj8+urRWL5GyxAZaeYPvGYOQY65JwLu9UDs3gTVqbETsIRgIYQ/MGejwtNv3OsYTmt5IvzqLQxGAsiPcn6MBz6b+/4DwgEiWFkD4RnNw1SprDNuJvkh5mT77JF/HhVI+yjl/cyff6GMkb+uRFiH7y+eZEC6B8/jQPNr5xwBBzO/aNwpfBJp1aXZtsMioaVcLOPume/ahYvalxhrIAmu5LkClMgXGiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from BY5PR10MB4370.namprd10.prod.outlook.com (2603:10b6:a03:20b::19)
 by PH0PR10MB4536.namprd10.prod.outlook.com (2603:10b6:510:40::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 15:25:36 +0000
Received: from BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::88cb:a839:2d87:1124]) by BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::88cb:a839:2d87:1124%7]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 15:25:35 +0000
From: Hector Palacios <hector.palacios@digi.com>
To: herve.codina@bootlin.com,
	miquel.raynal@bootlin.com,
	sashal@kernel.org,
	linux-mtd@lists.infradead.org
Cc: hector.palacios@digi.com
Subject: [PATCH] nand_base: force best_mode to be >= 0
Date: Wed, 22 Feb 2023 16:25:10 +0100
Message-Id: <20230222152510.1064332-1-hector.palacios@digi.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: VI1PR07CA0237.eurprd07.prod.outlook.com
 (2603:10a6:802:58::40) To BY5PR10MB4370.namprd10.prod.outlook.com
 (2603:10b6:a03:20b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4370:EE_|PH0PR10MB4536:EE_
X-MS-Office365-Filtering-Correlation-Id: fe8aac51-d681-499d-1546-08db14e90b02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	1x1nxYq6KyYHdG2DsJZ1VuJg95g70WsgIa2NMzs8J5UdjYbKB+QZBTygGaqQMk3YF16lU/ksuy/nsF+GwRfeN1TXRj99LF5KzYJbMiqHc97xRJ5e6PJqSN+rBns9JOOOQUfHWrY8HlWAdaWhHvtJwaw95QDPREdzBHfFmyYuP8P9om2jw71uvbxfoVj1is1CQFKsQCZXJZA/IAFIKRnaPfty/Y/Uha16atp6Od2Nx1b9xFCAiXi2p8Z47fVqbZ/LgF6y4KTY77k6C3Tdvbkkp77M42AFajlMC/g2vGb8YPKr8cR3y3Iz7f6D9MTW8L20dPf5gHAsT9zl/yLnePmGSYzRAVdGcDzwrdDz21DSwvtOzR1WdUxPNmq6tXMP/RXBVkPZhzhix/Bj59ozdUyBfFqlBl3Gfz4ykumxVxSBg2RE4Arua/LpAn4pMPpcI7LeEUa6azQm4bdh5abF3Q7DOOkMYJgh8MNfz6lLBUztl75iPoSJ7p/uidNyjSOiteUmYL8NtNkxVrs7qPbPonEOEm/cENCieChZv+J0F2AWrS2M7a2qMj/Xx+2WZsCHm2TdrqMcp2rvts1zLGggqDrvjIR1tHKY0bVDMFWyEkRMA9cljC83hOe2dRuGJXMU+1ouZSd8YlVEUQ97rpHtWd969ncdVKixEq9y+UaW65TYuXmMT50mlII02z3JZevl/+bafxXytO/UNE+K3OtuHYn95Q==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4370.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(396003)(39850400004)(346002)(376002)(451199018)(83380400001)(66556008)(66476007)(26005)(316002)(4326008)(478600001)(8676002)(66946007)(6506007)(6512007)(1076003)(186003)(6666004)(36756003)(38350700002)(38100700002)(86362001)(5660300002)(41300700001)(107886003)(2906002)(44832011)(8936002)(6486002)(52116002)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?u1c33CwGZtIUXkmObSvyWE6cFelfTXMc0jkoFpjq39mKSPp/vJIHr0wq2rqs?=
 =?us-ascii?Q?Hty88oSRu6zQlsqttBgpg38d8adC47LRQElnr89SrZStKV6Ec0s4AOBcY0bY?=
 =?us-ascii?Q?JOxLDTiAnoPMfrzEizV6JbpioJ/LbkzAlTPFcnnGOXfNmfndG5Rk7UCTiCiS?=
 =?us-ascii?Q?RX4DJwM2xLPnyDmyslqC5xcIuoVxnM2K12QZ29Qm73uf2xoEyVCWraDt584F?=
 =?us-ascii?Q?I3Xz03D/jczz63EdwbX0Cwb3Ep1MPsDINutZCBW4nsP+kdgf1vDyxn9MHnu3?=
 =?us-ascii?Q?I4N5RVmFGDTj6urnG/Kk24qtNCli2W5MOMY2feNEaNEs4vQM+Bm6memYxmxq?=
 =?us-ascii?Q?YS1cNTCPK+Nz9S8G1/MzIUsR1Xlin29DkVxAjgvkVbybwO3U31gR+ZFlWrIj?=
 =?us-ascii?Q?rwNaC608Y7lr9vohjyjWPVa5uY8mJAe+mzJShHJExl4wbynemYo7d+ye2v5L?=
 =?us-ascii?Q?iLyj/25y1PIQsO3hFc1OPB2uqSGLS8AgLGWxIZ5HRbnkKjrTX2BLiikn5DOB?=
 =?us-ascii?Q?hk8l6hCUcxZm8EwDLfjLBodjDzBV2+BuqbzSWArURCHIC/fp3WpAKuy5GM8Z?=
 =?us-ascii?Q?BhNTZNdNytuLqvqnoaYDJQdziEgxNzsbVC0VuC4stf9/ZasJgkx723qjH10G?=
 =?us-ascii?Q?9qMkMe9IqoGU1q1HV1rE00B/jDhNwTm1O0r+wCsZzyoOXve/edj9MpalM1t9?=
 =?us-ascii?Q?nhMQKnQqp1xrA/e2JOWxgBD+iDkryly2NyG8A4sjoUMqrS4JHbqyoKN97wRc?=
 =?us-ascii?Q?Clruik+z9OkwPVZD7z7n3j/0FnzTrYgj/ocDnTsW/iyhu5McEAIFRDrB3h8+?=
 =?us-ascii?Q?CcXVM/KCMXm+N1jfWxQ/fcO7thTKfE0VFLhS44L/pB+vXX9MpGvwznU+4QCL?=
 =?us-ascii?Q?wXW1gH5CenK0jQM3ydE4kGLCGws3N5xBO7bKz7TY7V4Irj9nEsuWrWafLHZt?=
 =?us-ascii?Q?moVg0jrUvI3gGQ8g9/3AU/+B678ZdR8s0ZZDzyxq7O4Q9X0Xtu4+059Otq9x?=
 =?us-ascii?Q?1DKXSzjQMKcF/6AZ9Filk7MO4ijRIHP7OOhpZuYYHh++RhJi+czHZjbobair?=
 =?us-ascii?Q?QInmvO1FWl3jYH6LyghvBysy+dAtXoJ+tf9Q8Hqd95pF/yKWluLaInA60QRD?=
 =?us-ascii?Q?ZjV61xkbyqp8t6nb2Zdvog0gMITXGP8XgNnNA/qP3R/5+tABmO6FoXC38AQ8?=
 =?us-ascii?Q?Ar9c/HnlbcnpjgZBiHDoCSG8WHoPoZLU7q28i7oKP8mcevVLVNxtm5yUxoWl?=
 =?us-ascii?Q?iHjn7f7kuXZHPGJRM+c3GWtm4Fypce3jxsaqD034fnk0QLgBMBmfdWlvPqIx?=
 =?us-ascii?Q?vZXLNYOCn+l8VFg/H3DuED0laFSIOz9JnXYYdUKhDtQYnCJYACaCf+wRBP++?=
 =?us-ascii?Q?zRe1Kbc+a818WyrQ1hzNlhMFrkZpYlAYKLWccxYrQItzd19dZnIHFd9GK6nm?=
 =?us-ascii?Q?qXIM4B8iQaKViIYZ2J6RGRX3aBR1IZwW4W2DS/woU1kM4brUKbNNpMM3asSl?=
 =?us-ascii?Q?C3AjlVNGLtCK0ReMdzAMA6qw1O9PwDDWM/dvZaBOFaQFou6W7Y5kGbyyH4CC?=
 =?us-ascii?Q?ddPcdeWCZhhbyY3K4eFVzmb0czLfszGazlpn20UA?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8aac51-d681-499d-1546-08db14e90b02
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4370.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 15:25:35.1740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xToAkQfZUtAuWlnt6x/o4vYNV08hUTCv+TGZHphjv64/1tO0GN5+GODFXrhhqdU968t4H4lTPn3sg110ecwUzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4536
X-BESS-ID: 1677079539-102801-5454-20650-1
X-BESS-VER: 2019.1_20230221.1854
X-BESS-Apparent-Source-IP: 104.47.55.170
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVoZGluZAVgZQ0Nw01dAi0czQ3N
	LQMDnZzMw4JTE1xcDS0tzcItE4xdRYqTYWAFdgj+lBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246332 [from 
	cloudscan21-242.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_072553_960301_5C5824B0 
X-CRM114-Status: GOOD (  13.88  )
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
which makes best_mode = -1 and the following loop be skipped. An error
code is returned upstream and the NAND probe fails.

Given that sdr_timing_modes *must* be 1 by specification, force best_mode
to be 1 at least, so that this function doesn't return an error on a NAND
that can work with such timings despite reporting an incorrect ONFI value.

Signed-off-by: Hector Palacios <hector.palacios@digi.com>
---
 drivers/mtd/nand/raw/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index c3cc66039925..474850e4455c 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -947,7 +947,7 @@ int nand_choose_best_sdr_timings(struct nand_chip *chip,
 		/* Fallback to slower modes */
 		best_mode = iface->timings.mode;
 	} else if (chip->parameters.onfi) {
-		best_mode = fls(chip->parameters.onfi->sdr_timing_modes) - 1;
+		best_mode = fls(chip->parameters.onfi->sdr_timing_modes | 1) - 1;
 	}
 
 	for (mode = best_mode; mode >= 0; mode--) {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
