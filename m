Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF727C04A95
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Oct 2022 15:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=73jd4mS/yzuMGlplwX73BibUYq002iA3PSLx7QmrGao=; b=wItvL1k2/Q4gIZ
	6ACYvtoU4DZfSZ9pyqTd6URe9p+u2WNu6XY/urxq3Wem/hmv1JgcXZvF6TFhhkqpHpVxLflFzKkFD
	fb5jfn/3QVAO/qWKg68/qgvmp0EcxGTcsR89AcH98vt8JicUOQnJTaSpj/9IjBOr7KAXtezV52L7a
	FSyh5JeF6mRMfKPJIeXxoXK/CBt824J4qCQ3XLCljHzHneVFPFJ2GSqww3KlWXIG0OQ7ymNqlzYiN
	PD2yUE7SIqqfQe2kh0y5WKoyM7QlcLV8WwWO5x5pk15lM3A2N2AtInUx9oHt0hzuamunMyFTNtSgl
	QMCBt37WxQCGjEAFXNQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onLwx-0067vW-KO; Tue, 25 Oct 2022 15:34:43 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onLwt-0067tY-CJ
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2022 15:34:41 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29PFSpQ3029892;
	Tue, 25 Oct 2022 15:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=PwGmVcjW2LQMcUDvkv60iNcmDyJ+poD7hYQYRXHBsNA=;
 b=dte2hqhhHdwkEl5s3qquUky9LgPLl6xD2dLcmGctpiZvsuqo5FL/cRG2xtuQVjIl6Iyq
 lHRslJG2qb5QQ2bT1o3OWSz+zVBRNUbhRuwRytVk2ov4nVwMPwgsG2R+AVV6/caBV9z5
 rsrc0ytnyvcV9kMWEw/nTKofjI+PdW0wLlGjfT8p6/dsLjt0F7tChgLCJbvzDH+bEPNx
 ZhkV6RFLPNgbp9hKVAiZqfTldEBv1kf+35BPKbYPufQaMs/ZLfTwXriUnYJKVcyLew/1
 O7+ShRHsM4javgi7wd6W6alar4wDl7oZBNTLN+C5GQG3UeOu4Uqv6b7MvOfQPrGIIEcy vw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kc84t3vkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Oct 2022 15:34:34 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29PF8jxP017215;
	Tue, 25 Oct 2022 15:34:33 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3kc6y509j8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Oct 2022 15:34:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIaLXG0b5SR5tlKmRLRNZJTHvSnsDe47kq6oRhiRgf/malyQy4SR7i2eZzr9eKHocjif9J/oYdqcHcia6yrvCNvCF4I9PbJAR/IRHdARP5Ns2ec0AiwWwS9FCRiYqG/eRj1otDlN8S8vuGAUjlhnlOPqfoMspg6Slo7nVWheYt3B1iCYixjMBxpVvQsp0DwNXP3iELxp4d7EH5Le8FldSKcmAtfSn0tBf+1xJm0LaVNzzxw9GCOS9cwXH2sH8QTr/ZvaPlraQRQiobVFhWNo9ZVjSrzfyeKX/cyv6Qqpf1z8mJNqvFys4Im9eiK7GgoRDeoh1i0tEmC6hqg4bEZYkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwGmVcjW2LQMcUDvkv60iNcmDyJ+poD7hYQYRXHBsNA=;
 b=GYeayJLYVOpeslk96cJb8sB3Qkc6GlPIuOfQQJjxTNc7TN+euFGRI1l8Stnt6zuQohYG0kH8V+ioxox9rjeiqIOrI6ARgO/jCNgvT67FKe1HJxagh5q+O+L3RAzjv53KiLYz0Odkxr6QqN2CQVScMkxfG3rJdYEOrMhGbySaZIgnOTOS4RLhPWjCwhTNPMbEYQp/gU0QuGtVW1EDUCWfVkR5eXd1M3hoePHdyi8I6N1J+nAaOJqfLBTIluGiRWf+uusNnQkIcEpH8sPBzXFedTDWofNfYUONFq4nX5pyKqaY2qodLQaPuBm57ZGXcp1cxtQDO0+rb8Gm5hR74tPH/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwGmVcjW2LQMcUDvkv60iNcmDyJ+poD7hYQYRXHBsNA=;
 b=KwL0LX+j85NJ5HIWHq0vvhzFCsJTaviFM5jEVRkcY0Fc/uURml9UqNAy3Q7Haxs8BlDjOnueL2S9sEiArAAQ4azMVdcyfsNdwvWygeiDl0wktgodiC5C6qM4dtali0nMUeC3FsP1kW5Ifcz9rYVsQsnPYg+OVI7aDrx9PpW7vC0=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB6345.namprd10.prod.outlook.com
 (2603:10b6:303:1ed::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Tue, 25 Oct
 2022 15:34:31 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec%4]) with mapi id 15.20.5676.031; Tue, 25 Oct 2022
 15:34:31 +0000
Date: Tue, 25 Oct 2022 18:34:24 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] mtd: parsers: tplink_safeloader: fix uninitialized variable
 bug
Message-ID: <Y1gCALFWXYYwqV1P@kili>
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0169.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|MW4PR10MB6345:EE_
X-MS-Office365-Filtering-Correlation-Id: cb300bac-908f-469f-e0e7-08dab69e6914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	bvRTK93ckasz17elB7s+Vtttte0RFrhcYwPQrAHVtYQB01yYzNCwZRvfc5PV4jtHe7ioAp99UQBUHEZGhceawbBNr8i2g3cRpHstbq5r7w3nyyBOvJxB6PnCumoBE1ddGeGB2he6KWRd4Q26yVUUFx80/ZSMZtVOZ+wizwFu3ZWhytOgU5HvaCeKILapM/YLeUnJxJjKuNZc9X8O1Y96UTCLcVIwqDEFPfH8D+H4gxljXUtHRpBw1p9rqSO/KtKyWP3Hzdiyk5NsDykI/mtLE/2VHihZj39+Na5U9cBo7EVZT2Bnn+uAuTUvANG+r7HyEN1dooDVh66e7UH+9GazWEvzh3/1/Ga8E7E5V3BNaF9FAEDgqteY8Se66/NgsXi8ISFMu2UD4BJXF4EuqNsLT6Io0IN5K4jwyr7Z27NR1W72a5d9gcla3IxwZa9XreUTmuTPhKnVA8hx/dDvgJQN1SIyql8xv0c9ZhVf7OBUlNz/gdzwP/g8Q7M3j8zjLqnOg5azwN5Wvvh6OhqvPejccbwXz77nCCNPDCej+zxezvKtoanMbHfiHmczyxo5DC0uOVk1CaG3eypCNw+edm3VMW/pE14Eqtq6rU38zvJp+HTbyUq9IEwSESN5Rl9fL21tf00bwmW/rN8SKavolnUsAynEzsG4hV5iLAk0Sd3P83NOJvplmTer29hChVy+fJp5uKYXZQIZxkv089g01oBZuQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199015)(6486002)(186003)(26005)(6666004)(33716001)(86362001)(8936002)(6506007)(2906002)(9686003)(6512007)(4326008)(41300700001)(478600001)(5660300002)(6916009)(316002)(44832011)(54906003)(66476007)(83380400001)(8676002)(66556008)(38100700002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?eGDHFJn/BfBY3o9P2v6Ud5bGsSDwQNOyTWh/EIRBw4R5Oh03uTg6FdSuwEsM?=
 =?us-ascii?Q?QJqpoJkSUt1ZN5ahsfarrKD50Vs4DBCzr0NbXcGJmnpwHqV3qUzd619fNCmH?=
 =?us-ascii?Q?xIx9+WoJ6IXe7svgIIQrZ3ULO2JQ77hGMKPJI+lvxgV5oHu7mCjxIIKGqdGn?=
 =?us-ascii?Q?nplgg8K/RfPcrcRzednR455KZXWVpdrtSVGOS0n/eEarSbZ34sDUd16G1wej?=
 =?us-ascii?Q?K0VcTxcr8SGY9/7uS51o8uEjZN6HZzRu3F8C6VSGrD/edtvrWqZzI0pNk88J?=
 =?us-ascii?Q?frFuon7sk4ypQa4/K6OG5maE5XsIPwkOv+UTqbyi+Qqc6STpl6MP3gicbjm7?=
 =?us-ascii?Q?UYSGvu0ckx6u4qzb5LKDGa1I3VMudANR/k5wEkL4oHDPKS4HMU66OFEm7+Ed?=
 =?us-ascii?Q?UnNOlhAGhwbkUOjUBBl1UU3vFXTksmMYH+696PVmNvmqF1Ih5VsfhkVbJc7m?=
 =?us-ascii?Q?j/I1f4dKmOlxFCS0zM0CjyqEQgPxPkvi23Vln5XoSL2uSnrz9dYZqvJ+HHjV?=
 =?us-ascii?Q?1X0V5qYjxiWLLe+w2T6pgTcLHmgcHatCvDT0kSmMWNLb4jafTv4/8LTjnnSi?=
 =?us-ascii?Q?bmbIPiAM/znU50IXVPzQyMLEXB4b25x7rGdkm+JhxqxwzsdojDUnCVIpyIaD?=
 =?us-ascii?Q?u+ewNz81b0qasuiya7bQtURusLilYWpoBDOgkwS3w5fCKL9cn/IT9KpEkc85?=
 =?us-ascii?Q?DzgmRcfGfFsQsgqXJ6g1WhyA4jo/SVLXwpFqTEW/FHooDGR+aCVsLGPbxOG4?=
 =?us-ascii?Q?OCXQA89iwj2fS6P6xT+zguypiYp/bziKD8+rttP7L3weBxlMRr9moVDA+4rx?=
 =?us-ascii?Q?ah+pZzK/NrOQQWykY9UZ3FULah3mro7zE0i4YqGHe06012P/G+srIR3eUBhu?=
 =?us-ascii?Q?06TMGJrW8gxUEw5OUi9VbmWnEipZkzyNE4hiw+w/fLzB7nfhrdGE++qpFT0r?=
 =?us-ascii?Q?d1/o/51c24Ke7ISDbJU1zULqllLDR5ddGyzxSqPa9l/9hDLQtyZASZo4Kl4V?=
 =?us-ascii?Q?Z3CrmVUNjEmuuWn0mJ7X4TahhIv3fGy5FCani3xIA6km82hJCKQSsxNWtveN?=
 =?us-ascii?Q?AI91WVdvkM2XdeMAtA8LxJe+Yp1Zpg9mMdq7Qy8IAq2JfL7Cy1OjSp9uL+H7?=
 =?us-ascii?Q?CnE0mV8j3uWob3eoe2xs/AqfGkdrGTpbfnvtsCcElG8gBgBnYUoAYmz5+FdA?=
 =?us-ascii?Q?ajleMCEUGv8ltEfuTS63ab4zfycLFtnXWu0mzIwyba3/1kFcQPThrZ1/BbB+?=
 =?us-ascii?Q?YgqFhQzNvhtXNhJVHUl0r/bzm7YAVh9FF11Tc27p8SRr0M1gJEDJqStnjYgh?=
 =?us-ascii?Q?EFoRWZo6TOdjrMphVVfXeOujirtW1wddt7vnWha3fkRYgmJ7q5io512RYQLv?=
 =?us-ascii?Q?x84htRge+lGZS24FAqsbGEgAvkbsD+bX6BcKjEcoP/3vh5WK12Kua9/EmRrZ?=
 =?us-ascii?Q?icrgVOu9sE3pspVE7gBgTt+O1X26fWxyDQPSCRV0+Pth1hV8jIT6UhLnLcNS?=
 =?us-ascii?Q?bpnZp/nfWLBg1uDnUDCFdn7j80Xx+lhr6fOqinwpAmCuuq68dH+sz2m3lAr3?=
 =?us-ascii?Q?aeIoUyW2AAHQvUODBSEwJQNnHToppcA98JT22ivw5zz87CZd2JiHBgFx3blS?=
 =?us-ascii?Q?KQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb300bac-908f-469f-e0e7-08dab69e6914
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 15:34:31.3222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9FBzBmmEXxPo9HXmmqeYOCJ/eqtumfpn9Iu+3OSQoGa820Drg9XPGcXOvMYqZys4IhyWoRsxheewO951H65gw1Wk2LWQmi7/MVMCREW6iuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6345
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-25_09,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210250089
X-Proofpoint-ORIG-GUID: tA14O9c4fJemtvkMEnn5-deQuvKpWuwB
X-Proofpoint-GUID: tA14O9c4fJemtvkMEnn5-deQuvKpWuwB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_083439_594113_1DD7FF89 
X-CRM114-Status: GOOD (  16.11  )
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

On 64 bit systems, the highest 32 bits of the "offset" variable are
not initialized.  Also the existing code is not endian safe (it will
fail on big endian systems).  Change the type of "offset" to a u32.

Fixes: aec4d5f5ffd0 ("mtd: parsers: add TP-Link SafeLoader partitions table parser")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/parsers/tplink_safeloader.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/parsers/tplink_safeloader.c b/drivers/mtd/parsers/tplink_safeloader.c
index 23584a477391..f601e7bd8627 100644
--- a/drivers/mtd/parsers/tplink_safeloader.c
+++ b/drivers/mtd/parsers/tplink_safeloader.c
@@ -23,8 +23,8 @@ static void *mtd_parser_tplink_safeloader_read_table(struct mtd_info *mtd)
 	struct safeloader_cmn_header hdr;
 	struct device_node *np;
 	size_t bytes_read;
-	size_t offset;
 	size_t size;
+	u32 offset;
 	char *buf;
 	int err;
 
@@ -34,14 +34,14 @@ static void *mtd_parser_tplink_safeloader_read_table(struct mtd_info *mtd)
 	else
 		np = of_get_child_by_name(np, "partitions");
 
-	if (of_property_read_u32(np, "partitions-table-offset", (u32 *)&offset)) {
+	if (of_property_read_u32(np, "partitions-table-offset", &offset)) {
 		pr_err("Failed to get partitions table offset\n");
 		goto err_put;
 	}
 
 	err = mtd_read(mtd, offset, sizeof(hdr), &bytes_read, (uint8_t *)&hdr);
 	if (err && !mtd_is_bitflip(err)) {
-		pr_err("Failed to read from %s at 0x%zx\n", mtd->name, offset);
+		pr_err("Failed to read from %s at 0x%x\n", mtd->name, offset);
 		goto err_put;
 	}
 
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
