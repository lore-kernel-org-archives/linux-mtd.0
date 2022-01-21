Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F56DC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jan 2022 05:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Va9r3TuPqk7898xkWrMjitBUhmXI6rm7ZQaHVFxm7pc=; b=zMLUsiHVZKOoAs
	NGPm+nwV6m3v+eZEtgK64Z0H1jUDIkR1OOzE+PPycxm9AII3n7hgPYrF6TFdxLsuyBbtsV/ZR469X
	WAEp7pYhiar5f8rM6MD1LDI57rrAcVUKcEaE7FhHPOZRGLWaEi68EBHb/3vcd2eJ6QngfeJIIFYER
	gDgytzW8EGNHSqqgt64GpJxzqZ6kWLxJWbjfKn8CxRpRm82A/0GOjPTsvYmufB4RnIi58RXlh8EGq
	S6mWXXpo/bAzWL0n7n74IiyVvuHTOAdQp9cn9KOIlt5KtrNkLbJ8YBO6q3IkW2n3LCEy8enq89nAl
	2YNFLU7QEiHyZ71crzpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAmdo-00DtSZ-UK; Fri, 21 Jan 2022 05:39:17 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAmdm-00DtRa-Sx
 for linux-mtd@lists.infradead.org; Fri, 21 Jan 2022 05:39:16 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20L04fkP009111; 
 Fri, 21 Jan 2022 05:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=VlCPmn+ed0QTAEZFqb1Ap98PG5dWdoZRPcbW/gzKKx8=;
 b=dYryY4rLbVYLNJaNnwGXYg/W1JFwLZ85JMmeFWospzLI60vqEGa7R0H2TXyp32JNVN5T
 +hAZYsF2lZIuwoH+dpn4xE65yXB19Cw+HiKiUIM0mKDHlDRsrhveXLTcWIvvC1G/5sBw
 6o0FqK0uP7nqT4jbqDz7B+oiiXtEpk2zOlCkZJWfG3kKdgRqWp3tj/BqLIUDZhAsTFhs
 BO2LkQnvZK1rtn8H/iWuyTilZdA8qtb5jqz1FxqLDid/Po/7l7agbXMEHnQdk8xbbDXs
 T7FQDZM3yR8V4Y0yXlLrefnJOyIP0utc5PgMXWmKzlBo0C7cwDQH+rMUj/9GitzjCVSX 2Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dqhykrdc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jan 2022 05:38:50 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20L5KhoT094514;
 Fri, 21 Jan 2022 05:38:49 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2041.outbound.protection.outlook.com [104.47.57.41])
 by userp3030.oracle.com with ESMTP id 3dqj0vc2fr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jan 2022 05:38:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SrlLpFl0rVSDZkMIARs/vbYlIX3/afKerR9YOM5tfhqoAt6voircTBHbYZw0r+64DqEtbLX0A75bEZ8oSTs2FxL4zZodS0s78Bpt0JgMq8n8HQTFzrTXhy5SY90kQ6iQThSNmikII6S5dV44mYB1rvBo+J6kl+cGDJeFAvTvQ0+/xtn5Q1HcKlF9/IfvLijZlo2TZT0xW3+5Iv5EUE0v8jrX2R0jm2ETEmTmOTUYl+5CORP4OUoYv1p0mhytMCNc65e5RimqX6ITH/2NjV0kqbsDyPSo3auxP/z/OKIBgZ2IcmdGsN/Y3V7rZC2oD5PBsWnjkIc2N3F5MVZEbl2aWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlCPmn+ed0QTAEZFqb1Ap98PG5dWdoZRPcbW/gzKKx8=;
 b=HJ0CAmB/xByVskTPbQnWdqyfpR77g/0XmmD/YXCGCnbUvxXYYyhFCFdSLB3dakmeXIcn6do39yFgLuRkCTYwYEF9HjkuDCQ4BqyCtEDeR5gxnP/I2vSVCAenssVo7FEfDQ+Wb14Z0NAaiQoPYC1YvncDwdQ/bnuS1nC8KhIlVqteuD0qx6L1XDqjrdEZ7eRoRw8UfYII/pVxYQcNBJh8MRQf0VKO5FrbuL76pEog2IapLy+R2HLKtBxteM9217EUTVTb1jsB6/XLe7Y0wzwBLJz/1d1VwOS8zsEruFwILE6fiPgs4xptAv/sm9GY+f1jsjbCLM9zKKf32HOIN8bvqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlCPmn+ed0QTAEZFqb1Ap98PG5dWdoZRPcbW/gzKKx8=;
 b=UiA+huMfDrOFNCB7GgEGI317vT6ArlQsF9/2a3cuERPwxS0mvgiBmfZ5Nt2nHF92084EmDARw/LOMqLtafRKsuFxnZmeUuoUiF8J8y+7IZZjwoFoskPVtpUhI2252AO/9/HDgoVtUz8PMC/nk7xakwWUCpTLQQoQHHkAWaAj5LE=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB4332.namprd10.prod.outlook.com
 (2603:10b6:5:220::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Fri, 21 Jan
 2022 05:38:47 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%6]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 05:38:47 +0000
Date: Fri, 21 Jan 2022 08:38:36 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Joern Engel <joern@lazybastard.org>, yangerkun <yangerkun@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] mtd: phram: Prevent divide by zero bug in phram_setup()
Message-ID: <20220121053836.GA27293@kili>
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0012.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::22) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 349f3bd7-7de6-46ed-b070-08d9dca04bce
X-MS-TrafficTypeDiagnostic: DM6PR10MB4332:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB4332D7DF5E0A22E114FC41B88E5B9@DM6PR10MB4332.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7n4i2yCiYz7h/4sJNGRzLeDDCEnWTz2It7pH8MMeqWfPIKCghONJwu7eGnY5IPtVW0A6WVlxhACrjRlJTBMZc7JoaBMoDmzR1CmE2AzhnKW6gSpWE5tmrH+ah00gW1BCG63LTg4dO7+gnhPu5caZ/F77mnABUYGsLxZcxYEkBSbvvPIo8MK5WVtFWb+qxjDwkhMSgo046H2u0YI+wKfKxpGI2IKX6q6xTto8TKyzIZBhUL2bZKP4bBagsXHguxkelLP/AKhROOWIwC70fVYgOy5MD6ZSPmEhTt2F7Vs5dsq0nKQTlgLAoXm5pTQAGQvoreFbggO+ljYJk7jHpF3+GYhD1WelcWZa6CQo3BpRM1WapQSLKzQkPerbcFCk/08Bv7jtI1Dtple/eXlOzihiyPwWYxv1tP0ruXpXFbWGkbeLk0h18auSKZJecEFJfNQf3bfktlZhU1DnsXerdIX/HdJAVGBpwPIeJHZmTpp0JWjwzFCNZ5pbYxNcK8gGSW0auNn48IFGv6Rj1P1mNX3m+OabYGjUWINBXKt3iH+2tjGe/+5vPFO1tQl5s4Eac6uuAMfH8vqo2TTTST0y0uvql8t/BO1QkRjH2PlN+Dbbd0h/4nFaXQ5/RtWewNY/K6dGgBqLhWWeTwCCN3bPljASxajEMJrfI8wRzaKNKJD8dgi1GHtRZBHrmLWxilAGb5zzYgO1pW1udhe285SZWfqlyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(26005)(52116002)(66946007)(8936002)(66556008)(66476007)(6486002)(86362001)(38100700002)(186003)(44832011)(83380400001)(33716001)(5660300002)(6666004)(6512007)(1076003)(2906002)(6506007)(33656002)(508600001)(110136005)(54906003)(38350700002)(8676002)(316002)(9686003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GI1SkJ0qOxvqnCDykgqeMidiRKYoSV7UFGZrn25toVWxcrSrMlHYnvbEsGAv?=
 =?us-ascii?Q?SEW64B0AhypKnixEcoDNaVrYE6vNef77xFaqdXqaSrddMPWCS1D2gTtEfR4J?=
 =?us-ascii?Q?ZHr+cVDkLgZ224AcSR2rTWVnZAHq7p+fs2f++EUmDdWv2U4JMle+u0vq3TAb?=
 =?us-ascii?Q?763fFwvHTv+kKMGKsOC9FTjxmsHKA1BxezXCMxF+DzwAo/OMA+p5Phi2inI0?=
 =?us-ascii?Q?RQOWvxSmf1jTJglz8Wp7fZpJLQRgkUbdX5jbrpB/t1acwqfOo6qedJCaRkUW?=
 =?us-ascii?Q?ll4eBoD1LN9HMQswCfhlgqyKJcqr2ZtQICcUgYJkYA4VmRyCE1slu6s0X2w0?=
 =?us-ascii?Q?NDt5rKxRtLg8Fjub3CsPqONEelQagLMvF8/zfFmx1SR5wY/CtfZk9QahKU7+?=
 =?us-ascii?Q?Srl3kcqtT39LeZtgcuXiLgqxAqq2YQ7v9hC7pz+kjYQ/xr+GTj2vXeYhkEN4?=
 =?us-ascii?Q?61qivJPsGKgsPAEoeDz5EbxhcckTNmrrxRSPuxmpo1uWnKNo/DtzsL+nizeU?=
 =?us-ascii?Q?nQe5Gb7ZozPLNjJGlkffjBq7WNMu/UkS4RC6BnpwrE/QnbnbsYjK1SjYrh8W?=
 =?us-ascii?Q?W86vVDj5B/pPBhJvPD1Y7yehlId4b4BO+t9mkl+IXrnJFnwrWqSx0/iIAB3D?=
 =?us-ascii?Q?EO+za3/k6GPWdUOXC60VTzjJsBuwZgxmQbor42WQ3l7n6xpFzbhJnEUl3Evn?=
 =?us-ascii?Q?/2q4JIswUNEBfAPpBPyyYRg0id8gSoZ3fJb5vsE5otMEnAeZK8WzQsm6uMZz?=
 =?us-ascii?Q?5D4LBJ94Zi9aFRUGt8S39yBkERAEw4mfBIhOsFaARnwN3UEZ8Z/iWhWqYDJ5?=
 =?us-ascii?Q?NlvJNvYkP1G6L0Hq4Wf02ROVcgk8/lDDwXiiGRMQFWaOFhiHI4oLPuuB5tCS?=
 =?us-ascii?Q?B0j2E+odMQkd3QzNbFIugx4tICn1IFnKcBsOKIWsQDIcWYDuBVZBV8fD5MFP?=
 =?us-ascii?Q?LedV84bME+enCSONWEVQOhaALj8z7nWHP4gz+d4XnMzqqxG/5Wh4oqAjszJJ?=
 =?us-ascii?Q?pb9lWiAzYKC9YEP90GpuLQSfVqv6ktC6C4o9lsXB+DfsSMLUKCdNjDwfSZsH?=
 =?us-ascii?Q?yUGJU2nACOMg8ZboF5P/DKihARHhdwEoGkg/0diPqSg7Wvv8kyf6itodjtBE?=
 =?us-ascii?Q?j8q+eir66xeCFDUsYPQTFElMqO4mqik57Ydk3ifNjcyMM7bjQtTRIVaw8BAv?=
 =?us-ascii?Q?DeYV7nP/P4EzJ3BFARonwr6WGYMAl+d4YyMSz+UTL7sujoIzH/4zTe1Ygty7?=
 =?us-ascii?Q?3FO9QQhhAG9lwtpL9G0XklpR+jxXEfsWdoTlwUZeCd+U4Fe2PVBBBDmJABJD?=
 =?us-ascii?Q?utuxlexukYMnBATIjpWJ5Dm6elL0+KkhHuOc7hhBOujzUZoyXRX1vCcgRF0y?=
 =?us-ascii?Q?xSGz3u5Ejyiy9S8q8MlAb/nmQoS89vdJFe9pAbkBIZgnk674F1hJdGZyfS9z?=
 =?us-ascii?Q?UJTOhjIcdbQIsVKR6ollp582Sad0hAQ67Ba0f8M9Bv79A3TJkEEoleoAJmmB?=
 =?us-ascii?Q?xX2De2LEB8vaye58oa3s88WCV98vwRLWzGoqH4fLF47DIUxoOtZ+MSXt9GHm?=
 =?us-ascii?Q?J+PwSab4ZQHcSzTSDDRYV86wbmsRNps3lA5XEwaANMc36+rPNjYkQmG/YZ7f?=
 =?us-ascii?Q?MKiHnoxcE2Q7HzHR8MrfnbT1PeKjOoOw4TqbKfktarhPHKWGnYLaiskX7JJl?=
 =?us-ascii?Q?iHqUjg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 349f3bd7-7de6-46ed-b070-08d9dca04bce
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 05:38:47.6381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S9OR8jth9ncVeR/wofUzW1cSxBqapKXqPDNLkxO88PwspF63A1OPu5C1MU2Bq87NGIIzDO/Qey3qBxEOmVH2kVC9dkY98M5Yun0/+LQLNkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4332
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10233
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201210038
X-Proofpoint-ORIG-GUID: HqP5L6VNim-Lxx49UtmYXik2bP-6s5-S
X-Proofpoint-GUID: HqP5L6VNim-Lxx49UtmYXik2bP-6s5-S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_213914_971107_FB270F75 
X-CRM114-Status: GOOD (  16.49  )
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

The problem is that "erasesize" is a uint32_t type so it might be
non-zero but the truncated "(uint32_t)erasesize" value *is* zero. That
would lead to the divide by zero bug.

Avoid the bug by delaying the divide until after we have validated
that "erasesize" is reasonable.

Fixes: dc2b3e5cbc80 ("mtd: phram: use div_u64_rem to stop overwrite len in phram_setup")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/devices/phram.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 6ed6c51fac69..d503821a3e60 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -264,16 +264,20 @@ static int phram_setup(const char *val)
 		}
 	}
 
-	if (erasesize)
-		div_u64_rem(len, (uint32_t)erasesize, &rem);
-
 	if (len == 0 || erasesize == 0 || erasesize > len
-	    || erasesize > UINT_MAX || rem) {
+	    || erasesize > UINT_MAX) {
 		parse_err("illegal erasesize or len\n");
 		ret = -EINVAL;
 		goto error;
 	}
 
+	div_u64_rem(len, (uint32_t)erasesize, &rem);
+	if (rem) {
+		parse_err("len is not multiple of erasesize\n");
+		ret = -EINVAL;
+		goto error;
+	}
+
 	ret = register_device(name, start, len, (uint32_t)erasesize);
 	if (ret)
 		goto error;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
