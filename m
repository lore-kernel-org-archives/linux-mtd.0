Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA192C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 18 May 2022 17:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fLbHxESpP6ub7EWCpD/kvD43QKKOUDArLNqO2w0oo3w=; b=EDQSDEOU2pEDhx
	5/D8YXh8XlQbODVj1s1a539yHLOlE5NarUFo5OxTJ8KN9hxA1gwf68bp35v115tpq6wnnE1i8wwTo
	8i2QNJ+92k+adca3QiHAC2nh2I2kRTBO0cCtIZzASKXciBLDX1Na2P2pybFi8vruNGOFXRdO9a8Sd
	DWjMtCidkq1YmODz3C93xxhYz9X/mtVoj/jEt6nIFqHhRW3UhDOoBvs918U4Zf5ChQtkI0oOFRXbX
	W/Ays35fQ51U4NB5VHJpRHph2VHL2AFZd0lrD5/IqtUl66EvLxAzrZBoBfv2hBKhSzND+oxmi5+Gi
	KSvcIKsYwKyu13c3PgBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrNY6-003Fc9-55; Wed, 18 May 2022 17:33:26 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrNY3-003FbM-Fd
 for linux-mtd@lists.infradead.org; Wed, 18 May 2022 17:33:24 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24IH6lCd028348;
 Wed, 18 May 2022 17:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=i2dsZqbN6sIq9R4zRP8KcOhb79jZfkcii8M7dVbnTXw=;
 b=m+2X0mT914FZX0mc4v4/+GHBmq8jK4wtNQrWvz+necM8R/WvxpR4IhAPsBcSEygiMsfN
 UW2LUDIv7HJub013nj7svt9DC8K34SPC7kP70hooV3+1Dx81RwC2ATC8kSV99tVKT7DG
 1X/DsRecz+BFHy1ryliqOtIpTOVvu/zeZTAMJsv2bzTBaoJuj9DhIkU6bmtgyiba4Qmg
 jsexl/IyLjFayQT1nR5QyVbKFgZRaGbW8ZNHTC8AlIXkrEuGoJZ+EmXC6J+Hns6sdsqA
 Vdj7UWG8uJQCVufBfdgV7AKSzmHOf+DxzeEPZriwPS1v5r0OY7p9WS/fQf2aJbhWD5IC 2g== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g22uc9s9g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 May 2022 17:33:15 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24IHPohr014484; Wed, 18 May 2022 17:33:14 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3g22v4kutg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 May 2022 17:33:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QP0LZbgBj9WUJpllbtSyJ2BoJ3E6cpGqylNdwDGfdg3tLhO5MNyTcIcCuSAbmTB12w9ffIFAqlMRXmJvx+XdeRAJh3VsQq51CO3FXthZxrxdsHmM4uAdbqmh3kcGa+meZ/H2+5hJoLxYsw5lhs479q5LP56D2u3IcnO2eHS1zQJ+BOKvIFOhXl0VgECKSObip9T4bVCp0gvIThj/0Me5JLgNSeu3CWzfMCSg+Z9+qceaEfu9R3TDStQFn0JJ2PO/fcxODXCgO7KvT3+EmB7RM20mnmX70Lh7GMewq3CAtm6wgbSkRBXrwZ8xEB1VN4kFjSjMAh4yyLipclg38mqdPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2dsZqbN6sIq9R4zRP8KcOhb79jZfkcii8M7dVbnTXw=;
 b=flTBlD/HKhObQKYDGqlZSTiPm9PymSXnHovTdqJ3uc8V5DZVBQfBO8QPJpCVnw0EwXwtdcjvvawJR9BCcVTX6b8ASGm5eySD+0M3yEXeG3IO8aJNo4LuvqYcIds3eTqkCCKn8GySzPVbOQHSxVAcU98pzvNr0LdGg5WPPPlv9TO/Wf/hcb670WTfWojOEC9Mp8ySBu76iBSe0wWQO5VhWCaEJInPPi8KxatwBf7DuiqgtguLShsbgA8B+LL2yZCzHjzmrSfkrMDhTAcHGmTv05qRqafKy3bf1eW8SwvBhZEUOFWWR2uXHVhfHeks21Zz+yp9GUmOjxVuWQAh08YcJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2dsZqbN6sIq9R4zRP8KcOhb79jZfkcii8M7dVbnTXw=;
 b=UtbyZtvcEY3s6JDdPxMukDwigztXjM4C6Mjt8ZwYWsBVf8+cD8SEwMNKoQDEguMhEfdEBxXdJtLaKZQ0tXQ1PqdpeJdoflkj7XLmnKuK6/rQu3GAxflwATQ339C+CySszpf4IS+/WlHqQo+rcNr6SX1nflOMbpZlKRKXrrbX/v0=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY4PR10MB1927.namprd10.prod.outlook.com
 (2603:10b6:903:122::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Wed, 18 May
 2022 17:33:12 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e%2]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 17:33:12 +0000
Date: Wed, 18 May 2022 20:33:01 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: csharper2005@gmail.com
Cc: linux-mtd@lists.infradead.org
Subject: [bug report] mtd: parsers: add support for Sercomm partitions
Message-ID: <YoUtzUMdJOihZv2L@kili>
Content-Disposition: inline
X-ClientProxiedBy: ZRAP278CA0010.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9192afd-d29c-4146-86c5-08da38f47bc2
X-MS-TrafficTypeDiagnostic: CY4PR10MB1927:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB1927B2EF6D0E82A4298E7A918ED19@CY4PR10MB1927.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fi18Yjbq1odGtHp9t2K/on6jtXYX710YlTEbr/pkp4B4wA0Mr6Sf0TQM/dhu8eInyFGrAGYOg/5L2Y6kifF9R93RbQ1YhBYN8NVsA5Wy9I1qDLaud4L4jDULS0+QiX5FfHeNimXpe034fYTjtfxR3KrNjY3gQtKoLEeMDaocbmxGOK0n5bghIrJEcl3JKh7DR3E/kUYeheSpGSrLF/UBRWFTtgkPxF1FA+v26wnqta/Q/NHxY+JWGmVNOznges7kLnU8Quv5LIfUG+IYbGTfY62iry642kTV7znqXeIcs0z8xgpBHfiyQpbn9WZJkRzlGcnRCk26HaUyBxJM9BxwZiJN93VGUEG67iJb4wTxsQpFN5xd9hhjmJiHhPVXx66GIAwqjktYZhYjboeK6H/qjegdpwwVYLjo9c4DFdF/sZa7zoEjiBPySlg3nTju3BpZWzrlzkc2/QzWC8cKifmiHyt3hTnPAgARSsvBBWHD0FOo48C7SIDNxlsibnrjKhjuvMI9CpWxGt0qCQS88YaTF7ZVx/2eAdT1dVDaC1XQC92NcnB7TDCF4k9/P6GRQ7/kl0QEDjzNvgXnF17zl7b6HZEiPkPMLlGvu2ffq6NinZ5+OrXDff8KTgxGdGUkCFRHimH23oxEzYJiqTna3mdHkMp/Zy1P4ROgok6ZsauZTrsHE1GcKWaCwiD1QZrLfN7kAUK+Ibe5RG4GRg67FX9MEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(6486002)(52116002)(86362001)(44832011)(2906002)(508600001)(4326008)(186003)(6666004)(66946007)(6512007)(66476007)(38350700002)(316002)(83380400001)(6916009)(66556008)(6506007)(8676002)(9686003)(5660300002)(38100700002)(8936002)(33716001)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yb31rHJLHOKcK5c0y2m5XF7a/8p0RipxhA2ElnYahFF4mjEEIC8fCMP47GX7?=
 =?us-ascii?Q?B5GCGBSGhw5RD5df96+3ws2Obs0zf8nhjNbd9CmU9TfKn9ROsHXjtQYSkit/?=
 =?us-ascii?Q?RfaB3KuhAj0R8uWl3UehXFVsoKwyYCXPzfBhlhuRq/aD5+48jO/qfc4JFjbq?=
 =?us-ascii?Q?RbwhGT77WEpL1TfIHkHbsm7dBQo5g0ADtHkkO+//h9sqyaBGwtw90xJjpzBV?=
 =?us-ascii?Q?P+A8PN7yoDVZTtH8pbbZYr6D6tmCy3Qs1HNVRkIqxNDcCxOp1IrmCKIpoNVV?=
 =?us-ascii?Q?ZkIcUQkmWKbZYmKrVdEV2fNwWai5udeaetVh6lXtwEnIVVEg9mA40GnmlM3q?=
 =?us-ascii?Q?UM8zDCGAomyZ2FA/8AhisMNfpJz1Qxy/hl0o8w8NgYJ/oYYOmJ41rhvE3kBu?=
 =?us-ascii?Q?PbDZRuQypW4OAi2txT6JyR1hGJ1DyWxde733pTHxB4pT/RaE3OmrUvQDjf3S?=
 =?us-ascii?Q?+g/riqWESVpA5/enXcxbl/jsREp3LHidzBiEwt06QbTWLTAIcCJgeecjq+W8?=
 =?us-ascii?Q?PZJtoaE19ksf743M1TfRWwk4m3KJxaF5FH5B2eWPPN+2FBccuKdR7QB24gAN?=
 =?us-ascii?Q?DxW2VJKEzfFnFpMGDdQpwxCv4Tj7xIeDlspHaRtPb8OndDVw++5TFGDyNvSB?=
 =?us-ascii?Q?nTYbM8qL3f/CO64FmsUzgiOUazDvydXIIqcL+QFWLS6E1/srv2OpARstudmx?=
 =?us-ascii?Q?zZHyevdC39U6kO0mbnNyLOKztzzas84esQoC9kHamogQv6Z9B67TkRQwN2nl?=
 =?us-ascii?Q?tI9/dHSKxBZM1RojklKmm+jEvBFpkg+CEp+hyCy6BjxJjnY3EAPtP1xZhCxl?=
 =?us-ascii?Q?5lDgvF5lLtnfS823JtMF0Lpc0DrlFCnkmlZbumFoiH0pSyX5FY9qmn1lQ0rv?=
 =?us-ascii?Q?7BsOnbzrm1v30jQtmuOKJFVvuHeXr4LGPQLd4cPAxWY4yng+a6NdPklMoLWl?=
 =?us-ascii?Q?ntOqsaL4VarnwWqn52VG6ClYkoFMTs8CMxedJIqsyB2sljqv/wLl/zGGxYLk?=
 =?us-ascii?Q?nmA1+wn8Tz71QAkXbJbW+maFSOvrsJlqb3hbFg4wLvdGUBd37Gy+PK1jtueW?=
 =?us-ascii?Q?wgs60nmLO81/s95d5hFZDt0Oqy1eZh8m/dmrJ6LSB+26PrL7TGNWdDDosoRn?=
 =?us-ascii?Q?WVuDSaz8GF9R+iSxgOm0z+fhIpJ+WG30bNdb6ZUUUnuJya885TNffiQCGVwe?=
 =?us-ascii?Q?PK+Lrnu5xQ9ORiyIY45mYjBIPr4vKoniff1MdbPoa1F0OSPQRTcsvuu97urO?=
 =?us-ascii?Q?X8np7xLCDlpKQAoBwn1Q8RaGD4ijJZIgXNTAekxDz96iPLt5OCfopg/pzkL7?=
 =?us-ascii?Q?H7SVgUkgXQIz/LRzc+u4Cd4SemFiCWKUn5fKj0tsgiNZcxvma1wpQHrLhlHw?=
 =?us-ascii?Q?/JZ8+EX9ajoc2IcIFNFse2G70kZlgjk+CnLUHE0KgDxmsk/5IgUXncDeZjvi?=
 =?us-ascii?Q?Se9J6kq2ZiugudC+QgdvsMYvfaB+x+usdO6h2r3O1WsK9KBh9CgHt8TYZn9w?=
 =?us-ascii?Q?Vmqah9qeSW/rX+ze9th3sckNl8xbhIWoHdEH3fXJ8EZReK65xKA0n0vw5awQ?=
 =?us-ascii?Q?OmY59CGl1R+9GBpRxudxhTv36wYDIfOWON59oMgfaihHn+ADhZ7hVI9BQLMb?=
 =?us-ascii?Q?j5GK/ve2IqrBUQUr/ekfguVY4LjoefN5qPlvQ+8pndnRB8pGOWYCLmxsWqQU?=
 =?us-ascii?Q?P1IN3sCw/XTAwGaVlrikSqxGlWLuO8rvZgyBDStX/RcuNE/o3qXMc8vpxz8E?=
 =?us-ascii?Q?40BXXE7HJ0mnPRQmbeFVnDZwnBsWUbQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9192afd-d29c-4146-86c5-08da38f47bc2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 17:33:12.7430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8FQaiCH7xOYFrToe77n8gEzUhOveokzSHHa3uB9lkuO527QAZqNnRVMSzkwJHF1N6rRxVBavGltod12fSVIshlx6RoUmiZIdT+UNG0NKGi0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1927
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-18_06:2022-05-17,
 2022-05-18 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 mlxlogscore=639 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205180104
X-Proofpoint-GUID: WvR8QKdpeKblqu8JYR_5xm-MXTXaITXR
X-Proofpoint-ORIG-GUID: WvR8QKdpeKblqu8JYR_5xm-MXTXaITXR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_103323_684350_4F219BEF 
X-CRM114-Status: GOOD (  12.84  )
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

Hello Mikhail Zhilkin,

The patch 4213e556fe2a: "mtd: parsers: add support for Sercomm
partitions" from May 3, 2022, leads to the following Smatch static
checker warning:

	drivers/mtd/parsers/scpart.c:155 scpart_parse()
	warn: missing error code here? 'mtd_get_of_node()' failed. 'res' = '0'

drivers/mtd/parsers/scpart.c
    138 static int scpart_parse(struct mtd_info *master,
    139                         const struct mtd_partition **pparts,
    140                         struct mtd_part_parser_data *data)
    141 {
    142         struct sc_part_desc *scpart_map = NULL;
    143         struct mtd_partition *parts = NULL;
    144         struct device_node *mtd_node;
    145         struct device_node *ofpart_node;
    146         struct device_node *pp;
    147         const char *partname;
    148         int nr_scparts;
    149         int nr_parts = 0;
    150         int n;
    151         int res = 0;
    152 
    153         mtd_node = mtd_get_of_node(master);
    154         if (!mtd_node)
--> 155                 goto out;
                        ^^^^^^^^

    156 
    157         ofpart_node = of_get_child_by_name(mtd_node, "partitions");
    158         if (!ofpart_node)
    159                 goto out;
                        ^^^^^^^^
Are these supposed to be success paths?

    160 
    161         nr_scparts = scpart_find_partmap(master, &scpart_map);
    162         if (nr_scparts <= 0) {

Is nr_scparts == 0 a success path?

    163                 res = nr_scparts;
    164                 goto free;
    165         }
    166 
    167         parts = kcalloc(of_get_child_count(ofpart_node), sizeof(*parts),
    168                 GFP_KERNEL);
    169         if (!parts) {
    170                 res = -ENOMEM;
    171                 goto out;
    172         }
    173 
    174         for_each_child_of_node(ofpart_node, pp) {
    175                 u32 scpart_id;
    176 
    177                 if (of_property_read_u32(pp, "sercomm,scpart-id", &scpart_id))
    178                         continue;
    179 
    180                 for (n = 0 ; n < nr_scparts ; n++)
    181                         if ((scpart_map[n].part_id != ID_ALREADY_FOUND) &&
    182                                         (scpart_id == scpart_map[n].part_id))
    183                                 break;
    184                 if (n >= nr_scparts)
    185                         /* not match */
    186                         continue;
    187 
    188                 /* add the partition found in OF into MTD partition array */
    189                 parts[nr_parts].offset = scpart_map[n].part_offs;
    190                 parts[nr_parts].size = scpart_map[n].part_bytes;
    191                 parts[nr_parts].of_node = pp;
    192 
    193                 if (!of_property_read_string(pp, "label", &partname))
    194                         parts[nr_parts].name = partname;
    195                 if (of_property_read_bool(pp, "read-only"))
    196                         parts[nr_parts].mask_flags |= MTD_WRITEABLE;
    197                 if (of_property_read_bool(pp, "lock"))
    198                         parts[nr_parts].mask_flags |= MTD_POWERUP_LOCK;
    199 
    200                 /* mark as 'done' */
    201                 scpart_map[n].part_id = ID_ALREADY_FOUND;
    202 
    203                 nr_parts++;
    204         }
    205 
    206         if (nr_parts > 0) {
    207                 *pparts = parts;
    208                 res = nr_parts;
    209         } else
    210                 pr_info("No partition in OF matches partition ID with 'SC PART MAP'.\n");
    211 
    212         of_node_put(pp);
    213 
    214 free:
    215         kfree(scpart_map);
    216         if (res <= 0)
    217                 kfree(parts);
    218 
    219 out:
    220         return res;
    221 }

regards,
dan carpenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
