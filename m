Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1A6C04A68
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jul 2022 07:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dl/DHMucwSC4doTiScQFDwr8Us+haN4nhMfhsthMhIk=; b=t6Iakuw8RTNkpU
	KIgUWl9A1oIk89Cow8xjR2AwPjQ5c2kZiahEleprFRJeT14YdGtoG4UMg9Nn5N9B+hWiDjDsaS7yM
	IJ85+cLgnC1vpcNyj1IN8agDhS8x5QiTkjhzy9ioKHvN/lG8jkdZGq/mROTmnj/VhXLAYvK0+mrnH
	VfMWD6dQlw9OciKpf7g4mIhzQmglz/ZaSzdssUIYLnRER2/NtwhwK0aGqVxtCYMNuEg0MGGXu5GDg
	ox+/Wg6awiXcvOz2BnNLVW0/yY1Ws1251+KeKWMBpRAZ1uybENl35lUBm6/rh3beBoYLD5vmfyM+C
	cwgrFTSSj4iPTXfdpeKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGxhN-005L0A-Rb; Thu, 28 Jul 2022 07:12:45 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGxhL-005Kxv-1U; Thu, 28 Jul 2022 07:12:44 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26S66F9b019125;
	Thu, 28 Jul 2022 07:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=fnO7c+j5lUKy2ZxBu7RJHElh46IGQ1aFAJhOX3IK+Sk=;
 b=xGiYQnoPIEO5Oimtkkl1zObMjObXYMlaHAMmST5B5YGvPABsob3voQZsBKEe83X7qF1A
 k7JRFsWqz3KEiX5djxW0d4Ara1Z2Pctlpp/fwC/R/r1PITZll13W/noe49NHyjNchah6
 ySnpGbHV8GJeoI7l/cHCposqCZ/gwsWYVRBYL0ieNawuRb/Z5gvTOHyP207gDJpm978y
 ggV+SnhMoipcB225ZHlXqgS9NIFH8HXBUMkYaUpVXqNkF+f9uqYRUjY0tfnYHfbMRif9
 uPcEkEMvSGqtIzlt5/11u89hm18/v9gI0NRe6KiPn6PGMIW8LPEbI/hZ6chZBLR0n8Px eg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9ap3acc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Jul 2022 07:12:30 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 26S6Ob5B034537;
	Thu, 28 Jul 2022 07:12:28 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3hh6358j55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Jul 2022 07:12:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STmzdJfnApBcyb/1e0JamiOdySaozCq+C9+hAPNIplJeFi63QICrgmq5cVwM95stcLM8lEBJUI0TigIbg2qabq25uS8hYlteyU+2/3wbKLlkZ1STqcrsBm1eUbtCMZrda2weLx6N2jlA8cmTusVFP8LWqhWoBDsy86Z1rzhy5k8tUazcOxTW52D/vKQluOZhpvIY/CyvcjiSStyZCL17lj+WG8bkboZ0fWKESzx8dt03YFdBBLyBGv+ZchCe5ZWLbDpwJizzpMXsaMhDMdaF1dQr9JdWW3yaeGoKWWmVH9gFYlpP+ac9Wgtp/igQiVw/nn29u9GJAJs9cneOpJpimA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnO7c+j5lUKy2ZxBu7RJHElh46IGQ1aFAJhOX3IK+Sk=;
 b=P80pWPDYKPsAknMCmQpBKTWjsEUcb6sSB4AEkweViFzyVGItZGPuyyKXCWydsveUsH3MCbaQECcb/aIrFkLgeNVwS3k+Dkn2sZrHyOTD8/IzgAHiE6Vu3hKfeiwEdSjVcn6MFP0f4mvqwnwb0vv+d1Q5KG1QbAP5hoBBg89GFVeBWezBfK4PhIhs92zNNINwO4eDrUJDpRkgaTZFdfKYN6Jd1Kmu46tQerX1zJwD58REe56sR8voDiweWxYoHP9HQVtQDgHA+g25dU+43LAEMTjBQ0JZO2KUp4yaQVROBKpUC//bFxum0sreYFAMRdlTcA/MSr9EWya6oUjVieGnQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnO7c+j5lUKy2ZxBu7RJHElh46IGQ1aFAJhOX3IK+Sk=;
 b=MYxrLDawkiENV+sT7r05Pmh3d1QhnCZDd70vFKrjIXyZhApFQx/hoz5ok3gmXjB54wC1Qcpa2gOsz0WKFJCW4kigcr2VBepNk3DHpOJ8Fzem/swesbKkXvM1QwrrLVe5nqFKlZgcK3NuY0JvP6PRlDw4xOpigG9EjrUkBL07h9Q=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BL0PR10MB2802.namprd10.prod.outlook.com
 (2603:10b6:208:33::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Thu, 28 Jul
 2022 07:12:26 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5482.011; Thu, 28 Jul 2022
 07:12:26 +0000
Date: Thu, 28 Jul 2022 10:12:12 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Liang Yang <liang.yang@amlogic.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Yixun Lan <yixun.lan@amlogic.com>, linux-mtd@lists.infradead.org,
        linux-amlogic@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] mtd: rawnand: meson: fix bit map use in
 meson_nfc_ecc_correct()
Message-ID: <YuI2zF1hP65+LE7r@kili>
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0009.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::19) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08ea9cf6-3445-4876-b83c-08da7068863a
X-MS-TrafficTypeDiagnostic: BL0PR10MB2802:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	iq9jjvR9b59Wz4azLOy8FSDYzHYTh+mQ+p8gAJfBygZwPMVQQ+ix9KgPFbgvGWiXvETJ4cZG/2+1uIe5cfZ6CbKR6AQIYltTYToXn3eTCAJVEggO1y59sO70kQ8dTxQIk/OC5rVWZ+x06mV4SU6aSVS8wbrD5wSnoNGWkFBgca3YnwQiJ3koKUrCTw5tPGpNA3gE+qNbjNEMDo/2J6ChO3Xx3gZO45cBI56nLfcANSKfhMq5kN+lHM7hJ0icb/q2q990sdUk2N83uFhOuDbszo8crQQnUj07II6iiCfDJHq/+o2dBqxB1qQcie/er6HjtDIppiaTUxpqCVaxQMjItArhGlZqgicDWWzzjaBoqlTsTYDtArlh8HbE4hqNtPZ/+kEt/5RHTUP93QwL/jhPvWJNB4HKVm+UBHAjaBuAJ9s9Mr8uz4+2gifr/yGjkA0nyvM+dVShJ+Bj+OQZ2hHT+x/22jfWCznRs+mqY9kt+8K/XGXoqjB357auGdok4YgF6gxUhlCZK79YWrqWaIJrUMYLD/SvJWsLDWeJXv7rXEKVXtjxyxnLu9qk/3f8i3u1Pt8+bxQclk7obVMLEv2C4H90o5dhPpKCu0F/EakewauYHNiLnHEMpiMF+GJUgmqimiolSaZqSz43FqRI0UcqGzgt2n/R6agrFuZzMRceCRVjK6Hh9BNyy2VN0ve+GfnZUtIpxnZE4sbGFc3FlpEKm1bpR/LDdHHPPRLhcvZgyUtlSp7mFQCME483zVl9a7hgLQRQJmrmq70yCD3B9V/thGfUQ3TSy2mvp6F0mHUuJWOC5ZGVeOkf17YIHFfyF/CiwG1IzLrC/XTKbKVt1J8MNQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(136003)(346002)(396003)(376002)(39860400002)(366004)(66476007)(41300700001)(6486002)(9686003)(6512007)(26005)(38350700002)(478600001)(52116002)(186003)(6506007)(83380400001)(6666004)(8936002)(7416002)(33716001)(5660300002)(44832011)(6916009)(54906003)(86362001)(316002)(38100700002)(2906002)(66556008)(4326008)(8676002)(66946007)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?a8K4cr2oF9VN6x0Fe0dJeyejy7xDPmgR1NEG0udvdhSx31kbBWc17sa9sZ6e?=
 =?us-ascii?Q?BmdmpmqAT3g67LZ6jwIB1JJyNRtHAb9GNfqOvR6UAGrlAkmjyDPF9XeXxMMO?=
 =?us-ascii?Q?cRyXvmEPm+FX9kCXg8Y96FnLMnQYum4Xq2n0Aqu19upMJKLrT05VRKyfP1Si?=
 =?us-ascii?Q?TOcxHfBxnt0GAv36WbXmxsw91ue52e/yRHEVoAnigrU5RhiNcCvsHDRfVJhx?=
 =?us-ascii?Q?PArLz155/bFbiBgxptY63y9U96jeIrYyylpLDoi0gbbV34K4Dh3fNWEu23wx?=
 =?us-ascii?Q?JsI5jmupwit4yGopDX4wv1u1Fwij5+nUSljgJ7a2cDtRq5p6L4P7WtwXKvjp?=
 =?us-ascii?Q?9gBuCAwXXU7gBhrq+LDvDDn8/hkKQn9rKEAWlqbMFpTpjNbd2HATVBshpiMt?=
 =?us-ascii?Q?Chi4LmspE2Zcid5tDOhkibBM662NIw44YIoZnJhqX51W/4CJNFlxuR9xS0mp?=
 =?us-ascii?Q?82xs5ge5yyxqDmuUp6d8lHnUDxr0jY8hUKHs6izj6bDj7gwDko/KoO2gSkbU?=
 =?us-ascii?Q?OeGzXkY5szHR3V0dc3T3o2h8WO69qwohPbdp5QI+4bvBoEcqTGUbDOSwKKKk?=
 =?us-ascii?Q?2KKFLisGCn+01A4hwV0Oc58TOScos0gFmGBYCBgVRKmfJmzawhZ6h+rBcCg0?=
 =?us-ascii?Q?D6qoel3kztOGINxx7/VNULfcPdtyDDrCQkTx9goolcaAd7u6nxFkKjY7hLw0?=
 =?us-ascii?Q?mc1oB9pbMNzLrqYeWLX7jkZsOCFuDR0+EoAi8QMfz+oPjw8vqYAnK7swxl8x?=
 =?us-ascii?Q?WlCeZZq2RYP20Xb4dfGkj3ti1cmLTcnMo8juZZPr1ObsU2M26/rIYs9t2dbl?=
 =?us-ascii?Q?JPoK8S/Ev5nhSkamf7uwlm2Vv+Uk1RSaVhSFB3TQIi7guC3kRN9BBHG6dW8Y?=
 =?us-ascii?Q?acm5ToJEd0wDEq0SGK1D12pK29WqdVSuCbw/OFC3RBVktfti5cQcjvSEvs9l?=
 =?us-ascii?Q?NzZgp2XRsJfzonN9jm5PwiDXM3ndaK5020hgyCbGz8L5YdnQB7BBzWzy5P6I?=
 =?us-ascii?Q?8lmAKZsyutT8uyqCRV8cANIWvE49qbMWSFaOix9eiROURuDgICUHuP4esWvc?=
 =?us-ascii?Q?4/wyWmcW6O5j42mZ//jbaEVjyBbeFr0unsDmvPIdd8fGixlJ66xbujT/EvpX?=
 =?us-ascii?Q?+RtFGGFO5lWDcsRhxGVMi01FaJJ/fZwAggQiR6PoPKjxPQdNgsE+J5s/MgdL?=
 =?us-ascii?Q?y7qJWT7aXofr8Q4018Ob1UnlrytFMg8ba2Pvn/3p56WwliqHap7653pJOc4S?=
 =?us-ascii?Q?9cgF/dhzxIp8+2sQJW0/fpUqoEeDeltoNZAJjdjLWFNaX0KTcTwIq7/w1lLh?=
 =?us-ascii?Q?dSjsxut+/qpgmrc9OaxwwX0FAzNrmF7aXrE0QFDSl4sWAqrQ/5tO5MxTE2SJ?=
 =?us-ascii?Q?hTE0mnBoxDv3gD04WgKoMnYwnzkb/xo6cClFh07j315e6oOnFevlqTmGztAb?=
 =?us-ascii?Q?z4wYg2FWQqwQOXBCzPIbkEcz82yBcKriEfz4PlUB9dWakJNs6a/qMCAcDS0Q?=
 =?us-ascii?Q?NLC9bBb+xIF5uTYYYehE8nYzer+a5nBS0rzj2OgdfZBGYwhW/IFQ+boTyXa9?=
 =?us-ascii?Q?Gi6OJm6SgH8Njg2hyJHvGMQdfnAJXaZmM/C/U8nDcXIxREbSGbj5/hPlnxPR?=
 =?us-ascii?Q?xA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ea9cf6-3445-4876-b83c-08da7068863a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 07:12:26.0376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ZZTT3nRE+eBQTcv5EnmoIvu0vSGaLRE1apN8XIxT96oBnJAd5OpKxOBRYCnBNBUaJDbNlOJ5Ohd4Kj872bv8Qj4hmmLx96+ccH4ZrjEPtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB2802
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-28_01,2022-07-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207280028
X-Proofpoint-ORIG-GUID: YI8qEF4RLQLPa09HdeTdRZ-nhntW0mD2
X-Proofpoint-GUID: YI8qEF4RLQLPa09HdeTdRZ-nhntW0mD2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_001243_749461_72AC342C 
X-CRM114-Status: GOOD (  15.74  )
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

The meson_nfc_ecc_correct() function accidentally does a right shift
instead of a left shift so it only works for BIT(0).  Also use
BIT_ULL() because "correct_bitmap" is a u64 and we want to avoid
shift wrapping bugs.

Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From review.  Untested.

 drivers/mtd/nand/raw/meson_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 829b76b303aa..ad2ffd0ca800 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -454,7 +454,7 @@ static int meson_nfc_ecc_correct(struct nand_chip *nand, u32 *bitflips,
 		if (ECC_ERR_CNT(*info) != ECC_UNCORRECTABLE) {
 			mtd->ecc_stats.corrected += ECC_ERR_CNT(*info);
 			*bitflips = max_t(u32, *bitflips, ECC_ERR_CNT(*info));
-			*correct_bitmap |= 1 >> i;
+			*correct_bitmap |= BIT_ULL(i);
 			continue;
 		}
 		if ((nand->options & NAND_NEED_SCRAMBLING) &&
@@ -800,7 +800,7 @@ static int meson_nfc_read_page_hwecc(struct nand_chip *nand, u8 *buf,
 			u8 *data = buf + i * ecc->size;
 			u8 *oob = nand->oob_poi + i * (ecc->bytes + 2);
 
-			if (correct_bitmap & (1 << i))
+			if (correct_bitmap & BIT_ULL(i))
 				continue;
 			ret = nand_check_erased_ecc_chunk(data,	ecc->size,
 							  oob, ecc->bytes + 2,
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
