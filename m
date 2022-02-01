Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161B5C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Feb 2022 13:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6oq0zfNJHpIf2ed7CRL9UtQ/3il92z7Nf6/CkgTGrw0=; b=Y0rVaXi/IrFldn
	pvL78zSdudi6X4UNGo92qrQAyjlhvzPc/qVJXU3qsNBtC5UwXDpF1op3wralCfsiFIQmyUJDextC0
	wVk/5vx7mRCaYhbUVENNsP9pTVSFHTA8Cw9HLtjdfyqK+RgxrQO/dYWt+Ft0Zs60SJi09DAd9/sLW
	Kz3RjMkovKEjrYsoZkdc8giSJXsrMbIZBRcjUK5EJ/GZ3F41HvSO+QFtG6R+nTgZ6itTq3hWQ2ELF
	d1GDc0XfI4fW8dHYSF4fk5d8A+v029p7kJNHH5rE9nEb/pKckA9ZHf86wCKfzsPWfQVPCK/MUapBM
	Kncv9KdjfDcoFpnESZfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEsu4-00CItR-KB; Tue, 01 Feb 2022 13:09:00 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEsrK-00CFJw-0P
 for linux-mtd@lists.infradead.org; Tue, 01 Feb 2022 13:06:11 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 211BJwFW031549; 
 Tue, 1 Feb 2022 13:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=Dw9mkV9GG/y+pBVf+65PEmAzwGBC1a+qGSN/q7kW8nE=;
 b=PGF890aNkrJAM7Kl4wkDMHyO8eMd85je+r/blxmnxGOrRG20FpH0+KuNrWjEybb+HwUp
 oGDp9anMO/mCLtR84EDytYmw1PXXhEaZxBqbmQy1yJrPPzEFTvlF6Hbi/TjHNHxxKyjq
 0BJSnU7RDBidZKvwSYIPHM4hlXEAuLA9CIaSiiuftixJS54FiAan825AaS54njJiQSv/
 cyCpQOsHnJofKOy9jY7C+BRu/B4jorAMnk+AKFZz08dVfAWJTpMJvj9kfuM5xSMGptmh
 T8L12EkS+Oo6leNpbICvgVGlhu/CAUTTfFeIklS6bZ1eqBZzUm1ilTVrTkp0x4jqS/JC ew== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dxjac2ujy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Feb 2022 13:06:08 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 211D19aV088159;
 Tue, 1 Feb 2022 13:06:07 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by aserp3020.oracle.com with ESMTP id 3dvwd66p1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Feb 2022 13:06:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOZzJd39Ba/LFCn4p2yT9W46hNj7DdUxuTpyZMxN+8pO3nHzdhgnuaYAOtU9dAYFb7IY5UX89TOxD7sbxoRzpxNfbI0rKBT6WjQ91KpFHe1ZPZ4ijRb0czDOK1DtkylUaZOeWvwzBwdAmv0aDcbYXnsG4cbISNB4S07ICL2y2wTpAAHem0S5qkw8goXo8qr8VzWaU5sStS0plpNph2J7LCZQydeT2CmOsGs4MZ+vzkKc9fGSLn8jKQ238ykwgl8Knis8OaaXfl9hvH3yXXrAIBpBSjK6/16Z6UJy0L7SgUUWLXHfb49ZplnOxFTRy3NNjFsqJzzqWq/UOPGFsWuOsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dw9mkV9GG/y+pBVf+65PEmAzwGBC1a+qGSN/q7kW8nE=;
 b=VFQmN4wuQJoHL12ChYDmkBS/UD9JO+txu42vMtiaSAe4daBFpe2u7kRrhZBJCh0SX91h1FrJ96SqrZ/ikKD48U3lAXII1NQCoY+lShmHiYTnLmXPSYdDxS/YyuH2O0LSsMzcgNtzBh5TK3xsineWJCW9jCd+mCcQpWpVYa6VCjrtkWxqKcJ0rhSTQGT5KLQEEJt/GtLAWEkAF4q3/9Yw7+gp680ESlD57716sme81w5yqwqY8ViNLsXzTT0PBXqVQoffpPXGBGDN8HOqjtPK/pj169zKSPo1mSDBGyMr2e2QaA8s5qccymjczxabd+yKcmeHjfG+d8DROaTiGgyWDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dw9mkV9GG/y+pBVf+65PEmAzwGBC1a+qGSN/q7kW8nE=;
 b=MGgbIzIjollXYmKMignqGfUZLddG2kxkM/UBdFdTKI7IQzu6udm2xFGBoS6KamTSxoEHkTQiWwQhRcBfk+J8t/sLE6NmHXG6qCfpTxBGAWNO8SnhiCxS23qVfh1S9ErMQJjLALWEl3GkpKTmA9EZmMSklCf9ruAZ8B57y4i9wvs=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CH2PR10MB4184.namprd10.prod.outlook.com
 (2603:10b6:610:7f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Tue, 1 Feb
 2022 13:06:04 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8%5]) with mapi id 15.20.4930.021; Tue, 1 Feb 2022
 13:06:04 +0000
Date: Tue, 1 Feb 2022 16:05:55 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: linux-mtd@lists.infradead.org
Subject: [bug report] MTD: mtdconcat NAND/Sibley support (rev.2)
Message-ID: <20220201130554.GC22458@kili>
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0011.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::21) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0220ff0a-bfee-4263-4656-08d9e5839a6f
X-MS-TrafficTypeDiagnostic: CH2PR10MB4184:EE_
X-Microsoft-Antispam-PRVS: <CH2PR10MB41847AB5A7108DBBB9929B438E269@CH2PR10MB4184.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wlyGOPI8Uoi5BSr7cRirvr/rI+yK+9Xx101rujgFUm7ADueIH/XG4a1CnsdzC98PuPBFcd5g0DTK5XJaDKVmI2gODm6r+XnVraDqTbdPyAyWYPh5DFJOLwI5FFbNifZjuivBC/Gc7OXrQEijECpA/E6z9frA9mGRdQ3xKiCkt/auAm3NdOO4h6nZLS6RsFSCdscv8djYvLdterCldDiJGX2yFKsvtU6DvHGCxRcJYaG2Jmh/4SVzvy15V1LSn5Zs3TXh6zjn0GbGDZMJ8yrJ6qtamfdkAEaUgV4/sbsIVdTcrJWrk+9YuI/8qRMAD3aAjmTZeK9moHwT/bDmvlOBAeZITSM/DXnMHConhg1QIGZp5cpRlBP+0gI2PkHQ61OkH/SBBDzeie9sGPQXzjYzz7Zk0XWtDHAHZZEs9Tzvajg3yqRy58Dz1Rm1XNJ0iMH4yupdQBAK+vinQG9lMbcSK1WfbXzEpY6NbYkhlXxJk/Z6jqn/3X+uVy7WbHflAAqDIcUsLGN97b2p5s46guXGcNmHX9eUPyhaLMyxBOSecVDEfG76XhJ7/vR0MeTXIpCoyl5jOcq0aFU/ujE84+FLdmbJcs7uJHToVMMjnA4nTM9omN/dl7mvX3Jj+AWvlHf8++3DRpCCB2DT6LBybYc6PU7GNlSGk2SM8zJRjk/7Si/gTUpQGoTVQhaWMkuzyNnI8qmGXe/Xg8BhQtFfG0uFFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(316002)(66946007)(6666004)(86362001)(6506007)(52116002)(5660300002)(6916009)(6486002)(38100700002)(38350700002)(508600001)(4326008)(66476007)(8676002)(66556008)(9686003)(8936002)(6512007)(33656002)(1076003)(186003)(2906002)(44832011)(83380400001)(33716001)(26005)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AC/MS4fLGll+y41QueFX+ju7kggUD9b9PKoHomwmKn2YreNiL/ynWyZ4pM2G?=
 =?us-ascii?Q?2Qyj1mQm7wnPWuMdAWbn8JerKXxpOVAfI1D5/tEGUnCnD53dg9Hual/rrWOH?=
 =?us-ascii?Q?YfZlWkGDxTcHxVXb+JpyO/ybTbwd7X27AqBMIWhMYrQhZok+C8l3SiEgEaTt?=
 =?us-ascii?Q?uupGg8ugwcql6QQ8hUxP27zpDLopIykh3rFcUWTubEGRR4LrWgdueiU7aiuj?=
 =?us-ascii?Q?rh7oxdgFnoycAIc26SZztvlcuNGe0pRqgV66gsPWvOIPjvhJOk3R3qp57tSM?=
 =?us-ascii?Q?d/NKAZ0UHlEP5q8S6Wu/3sCqs/NR7v/S8/XxAIE2U01QZSt/41w94BoAI8kL?=
 =?us-ascii?Q?rsuvNCExyW198I7kQBm8cd5w0F0yrPkAENI76kqbAQ1Vx1FwLLpKqoq9x3Ox?=
 =?us-ascii?Q?y3AMYDsgVibhwHt03wAf++h+OZPmNqkV+Je67+2QHSN+JV8VKUQ2A9od4hka?=
 =?us-ascii?Q?FJrcDSD3Q4Xq3QtFS4495i/QX8/xCvh2otGmJ/O9B/CtbbuWiBBkEStsbaDg?=
 =?us-ascii?Q?DAb+a6z1zg4ldwVFZ3r9CFq1xgd2x1QmgU4fidCnSTGugDvlqiL29NZXHu8p?=
 =?us-ascii?Q?7GL2nbmn6PLO3gqtwa+bSohe8Bj7KB9TQzw2Sk275CsPEhe6WxKyShGijhXi?=
 =?us-ascii?Q?mS7nGiUKlszL8klCKp+qUC4jsjvJVBFlfbmx6tIsSZem7AyS9eA6qZVDmkCK?=
 =?us-ascii?Q?05RwPIJmjn8ABZ25DLh9FffxMupjaqFnyJUE8bG9ramztoI8By24YjKqdY2C?=
 =?us-ascii?Q?C6XcQ/QJT40jEdjPPdMArF/yaMgZoKJEUHj6jEaUyeIONp9l0edqQ7/DmZsz?=
 =?us-ascii?Q?LkXde5Fsjhc5X6HwtXIuoB/R57JVdgCUwskl39yw/oqKim71LCWAPt2aE8uF?=
 =?us-ascii?Q?M/LAfjzGO5chMGpxww/jcyC+r78oDO/Fgbyd79dkNTrPaKvr4ryJaTKDIb+4?=
 =?us-ascii?Q?9i61LOC+ARXSDHF7UkgQnTfhAf+5ZwRGUIedGlEFQDoLiYS66+QIEUN8FxqF?=
 =?us-ascii?Q?T92ZysYsdEWTlLWH4XFKKZC0dMcGjkDmXEZwuLKfp6lvU4i81DWqmo0J5PnL?=
 =?us-ascii?Q?59MQCniKTdMAdsF4m7ZizncGiyG+UoaTXg/rvFQZqGEqOylkX18690HZ5okw?=
 =?us-ascii?Q?dDtkvhUE/nHEIOuv1ebcAdeFzuLThTXIvVeU+dHccT/5gysK2UHu40bJkX0a?=
 =?us-ascii?Q?gemdUyiahXenTRlTAJjqvGZ9lDPTQ8THyke3QUo4IlcSLmGxDeOiViHbs3dv?=
 =?us-ascii?Q?mAEXDhOF+842DsqBOsK/pPBqrUPA25rWRFS9FgrdXvwKSzprSRd40uYEKFtu?=
 =?us-ascii?Q?x9VuN/O6fLuI8yd8uVBiwxd3PBNtitrRhqC1gDRn4rOkseFnzer+vuw8h75V?=
 =?us-ascii?Q?9ukPpaCW/2MRMNkCOiEjmjmuY4rRLo3Zv3e1Igk8R1kppZAXBYQIqweZHRvr?=
 =?us-ascii?Q?TNaKJBv0hGMIXLSBbzmR9kGHxQv11NvIyqPeup9/At8tOJif/5p+LJGRn/1U?=
 =?us-ascii?Q?PENvOswyAUaZFmXe+FzChBhW5C5H8Oz/4/UiFNjqTNFIyeIEw9cUmIEbuv3P?=
 =?us-ascii?Q?u61X/VwiasWt8j8MxnCtn1QAQxjRkCtBUTqVlsHLO+LFOoAd5IfOYE67b4up?=
 =?us-ascii?Q?wEbaZ2tC/UyYqUK5D2C968E+SOdAW4ngddqbUD9epXDwETh9vv2JGWGNlH7M?=
 =?us-ascii?Q?eJOIi40FbLe1HLLnd+/KLmrdYd8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0220ff0a-bfee-4263-4656-08d9e5839a6f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 13:06:04.5502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A4NcKjC/OTE4bfInjbt827OgeVXWqCe7I2YJz41m7T3hbzWJSlu4B8RxbgWt6bo4X8QiLqPgHK6le45xd1/CuXtARz8UCHS5qKoobFQALPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4184
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10244
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=691
 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202010072
X-Proofpoint-GUID: hw768dxTA-ntzt-FnHGd3Yf8PEtuPzh-
X-Proofpoint-ORIG-GUID: hw768dxTA-ntzt-FnHGd3Yf8PEtuPzh-
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_050610_095238_96E6DF2C 
X-CRM114-Status: GOOD (  14.35  )
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

[ I was just going through these warnings and noticed that it had been
  eight years since I reported this.  :P It still looks valid.
  -dan ]

Hi MTD developers,

The patch e8d32937d9f2: "MTD: mtdconcat NAND/Sibley support (rev.2)"
from May 17, 2006, leads to the following Smatch static checker
warning:

	drivers/mtd/mtdconcat.c:231 concat_writev()
	warn: potentially one past the end of array 'vecs_copy[entry_high]'

drivers/mtd/mtdconcat.c
    184 static int
    185 concat_writev(struct mtd_info *mtd, const struct kvec *vecs,
    186                 unsigned long count, loff_t to, size_t * retlen)
    187 {
    188         struct mtd_concat *concat = CONCAT(mtd);
    189         struct kvec *vecs_copy;
    190         unsigned long entry_low, entry_high;
    191         size_t total_len = 0;
    192         int i;
    193         int err = -EINVAL;
    194 
    195         /* Calculate total length of data */
    196         for (i = 0; i < count; i++)
    197                 total_len += vecs[i].iov_len;
    198 
    199         /* Check alignment */
    200         if (mtd->writesize > 1) {
    201                 uint64_t __to = to;
    202                 if (do_div(__to, mtd->writesize) || (total_len % mtd->writesize))
    203                         return -EINVAL;
    204         }
    205 
    206         /* make a copy of vecs */
    207         vecs_copy = kmemdup(vecs, sizeof(struct kvec) * count, GFP_KERNEL);
                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    208         if (!vecs_copy)
    209                 return -ENOMEM;
    210 
    211         entry_low = 0;
    212         for (i = 0; i < concat->num_subdev; i++) {
    213                 struct mtd_info *subdev = concat->subdev[i];
    214                 size_t size, wsize, retsize, old_iov_len;
    215 
    216                 if (to >= subdev->size) {
    217                         to -= subdev->size;
    218                         continue;
    219                 }
    220 
    221                 size = min_t(uint64_t, total_len, subdev->size - to);
    222                 wsize = size; /* store for future use */
    223 
    224                 entry_high = entry_low;
    225                 while (entry_high < count) {
                               ^^^^^^^^^^^^^^^^^^
If "entry_high == count"


    226                         if (size <= vecs_copy[entry_high].iov_len)
    227                                 break;
    228                         size -= vecs_copy[entry_high++].iov_len;
    229                 }
    230 
--> 231                 old_iov_len = vecs_copy[entry_high].iov_len;

Then this is an off by one.

    232                 vecs_copy[entry_high].iov_len = size;
    233 
    234                 err = mtd_writev(subdev, &vecs_copy[entry_low],
    235                                  entry_high - entry_low + 1, to, &retsize);
    236 
    237                 vecs_copy[entry_high].iov_len = old_iov_len - size;
    238                 vecs_copy[entry_high].iov_base += size;
    239 
    240                 entry_low = entry_high;
    241 
    242                 if (err)
    243                         break;
    244 
    245                 *retlen += retsize;
    246                 total_len -= wsize;
    247 
    248                 if (total_len == 0)
    249                         break;
    250 
    251                 err = -EINVAL;
    252                 to = 0;
    253         }
    254 
    255         kfree(vecs_copy);
    256         return err;
    257 }

regards,
dan carpenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
