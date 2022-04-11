Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27B1C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 06:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YTnoQ6QoqJRqK5+AiDdzPCyB4FEkPvrBz/6ypFj/LPk=; b=YIUwDAMWyxTE/C
	MtOFJVE+oxrdzy15BdtOewDNd2sw1BeSMl05Uc4vG2MDHzNMGd0PmUh5+Mb3clJae4nkT7H3VAGiJ
	DtqYMEQjCzdG1uTuXFceQ/pz34z737juGorI6UGabi/pKcHhCc8yso55jp8LkaVW27OMVwEC5EV5n
	XF7RUU5EqddpN/0sOOWZrUJYIG532NPmysufs6OAuSzxo6g1Kb+D1lfVbYKDEykdjtBXW87+6FR2V
	MhyH4rUwFucVr/LGKnme5ODn1GyTG0hEpqHCpvpwBqXh0nAEN03bA75n0577fdAvNNDJ/uINWJm7F
	WPTzUrF+NxUx3abyPwYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndnfM-006wXa-6o; Mon, 11 Apr 2022 06:36:48 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndnfI-006wW5-Q2
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 06:36:46 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23B34ADp031505; 
 Mon, 11 Apr 2022 06:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=DLFCaG3401qhbW0fIRXQqjLCVrMK0cPWj0tFvNZaOyo=;
 b=fcqMbGupQlQQ3l3DXJtI861aFU7IOw4tSiQB6immepHUEDdOD2P5OjmN2M6MGXycSQhY
 UDfjNQvouNxpT0qTOjb70lmZiG+IWXuvWU7HKFqqGPDno+/0tE+D99y56tQxa1N7OCHU
 Pj2uCY08YOKQJLTTkob29pLWOjlBMcccBut357TgzH/bvEY9m95skxp3BG05squbtfwC
 xERDv7pH8r8cjUkclFrNQZOKmfvquTZ6CzNhHc1mCVHDJNS0VZeGuPF3rfE5ozIGZz1F
 Xf0TZVgI3VcsMqaHbx87scVj1JQ/Qa6eT7YsluIT4tl5uca+rlOGhKpI2khiv/zBVGUq yQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com with ESMTP id 3fb1rs2ft2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Apr 2022 06:34:40 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23B6H9Fh008683; Mon, 11 Apr 2022 06:34:39 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fb0k1rmmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Apr 2022 06:34:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJSxQ0wE29oWtsaDa58Sp77rDfPHaSmhN2evqRuurHSWtmfvpczeKV9uztCnaQRihV+qr5J7h+7brbbaPfJqJO0PCFyhODd9SmrhYI9qFStDDK4CzfY17w8qQKSMTagB2KZh15kVrQ5VTVa7lXI4YZh+glAeJXs5XKzrC8SkB5bZW7tUXyAk+ssk/lLTEdJYr8oKykYMJnZzBOCNP2arDI+k9BZnupG0GuHM7dILzmIVaoxuYVThTLggW/+XKxJRiDAGe4y4DQWqXDUwoQ7U6EGJyEeOOp70Hud+OSY+3plekKO8yrrLmtQI+c6obZDHSA4AMGokWdQ5VJvTGo9KeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLFCaG3401qhbW0fIRXQqjLCVrMK0cPWj0tFvNZaOyo=;
 b=kf5wx7GwbXFEQfPTLg2FSSa7Cx4vp+ydTDKQpYvgiLzcV/YiiAJBMUqiukD4o3mVimz6Kq4jACC8oH9BM1LkazcaSxGFylwKvSnYDf9Mt6olL4MzdF0Wvo11pOLDVcldpY3X3ioiapjgZwEQsUiw7CBGYNLIA6iuKnJhvoKPFPbiaq7r4EwDjOdH9zl/DRFowS0W+fbwIBD6A2H/nxNTyECVPRw8oYEw+K401q3pZ4z/qAvkHel1Ru2X3vELGtm3fYymym/LtTLzUqKDNaeU8eD+WPmRCATv2jtlxjV8fbiTQdu2e4rwbuP+g/Oio26Mu88YUfTnHNohaxBmU7SCkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLFCaG3401qhbW0fIRXQqjLCVrMK0cPWj0tFvNZaOyo=;
 b=zRTTWBkOh2yxGhj5qChFuDXjegx/bUWiEsWDM6FFsUXa9kkucrzEYHd50nPpjN9Vl9JbQAus8Ctbat73lmQxoldQAy1KGulJnWUxi/+Klv4wQOUTy3aOF+7pYod4IjgWCnbhCR0NyNto9RyuR0FRc3wQtIJiUb++s8n5vfcJMxQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB2650.namprd10.prod.outlook.com
 (2603:10b6:5:aa::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 06:34:38 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5144.022; Mon, 11 Apr 2022
 06:34:38 +0000
Date: Mon, 11 Apr 2022 09:34:27 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: linux-mtd@lists.infradead.org
Cc: b32955@freescale.com
Subject: [bug report] mtd: spi-nor: add the framework for SPI NOR
Message-ID: <20220411063426.GA9011@kili>
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0134.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::13) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94df9553-4693-42e9-05dc-08da1b8559d8
X-MS-TrafficTypeDiagnostic: DM6PR10MB2650:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB265032EF5A205D55E46D46E18EEA9@DM6PR10MB2650.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bJbN0Cz+0Q7/e3/pVHiiEaHulxQRHALvZKZVuEqDOhY1uY/+umm+D9Bws7OmxdJbF1k2iSXb9yIdFVmjFyO4eRQObQY75yhmkRlQMM6AtYLlcDVezJVYSDW9o8tQunur1wVawSbrs+to//rDE0e21EWAHabghzevvEdwqmZToH1sTJwaXe8n7fNQBuB5qM2tZ/cdi49e523FR/WBzuTiYffTlpSnnA4AX1N/c+IC1Utqq1Ti9BIc1bHryc9xq/Y8pj7taFemtf2BVm/z0ucCoRLbwcf5eUw1vfX6tpPKSEnbxMiaw0vVJ/cr2dqbxlwzzD86/nlyIUURyP4Z/ik26zRoqAqu2nTBh7NQu3l1o7AtiZgrLNN2npXZ08cp90Ra+e0v6mfV39OW+7uYQK1OFHAbk3pQGIOLLVnruB87RQNFh8RjQfbyPUXzxt/gNB+1YEuLxklXGmumZkUMxY83iAjezGEXloCbpaUA4eH5tt3JDJL6mGGmpIdb+g4m6CJB9QfOdR6pj5HDBG1DYJLgg1usth2H3gXQBkxHcFnoyxRcBKhsdsb6kJ3c4DP5BOsB95LF2XqtOZU+HveHv27rc0xV1yi4RpjDKlpRtcCQY01HMA2ACwY/EDq7jRx2wrwZPwSOyRSAUznpl5zYDDGZhHfkfN22MnlpzymhqRB8BSNS6EeazibD1tDditHzIrIjj80yqv+tN9gbzXgqIZmuuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(83380400001)(33656002)(6486002)(8936002)(186003)(26005)(508600001)(5660300002)(2906002)(33716001)(316002)(44832011)(66946007)(6916009)(86362001)(8676002)(4326008)(1076003)(66556008)(66476007)(9686003)(6512007)(6506007)(38350700002)(52116002)(6666004)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0Ti7iYB22EhSiKurBbfF5NRaTJdvDbVxHqQPE91tGm1MX8vK7ewF5l45YGuR?=
 =?us-ascii?Q?e8idTfxdzmLz71n7zOA/sHsTVYr38XJWRD/vCUXavb0IR2hDsVV0o2B/7lJq?=
 =?us-ascii?Q?6r65fAEWwx6K/6sHrEnFVEdsLgpkSO4IRceWrEq9QigvHZDG+/9HEYi6Y1S6?=
 =?us-ascii?Q?CFPaX0Gcj3vGKJgschp0YQkf1x9BTAIt4rFalKajuV11tp4f9oi2Xo3Jc3oC?=
 =?us-ascii?Q?fIbVeJhhj4FMRjhjWMfWdTU5Ref+qY3GwxDU9R0xnxaA/Ucffjp7Y1suhTLN?=
 =?us-ascii?Q?FFgCQ4ce50K6Mk8SVJJLFmZrXt7sjUbRpaqEXI7kyiMww843A8KeAM3j981I?=
 =?us-ascii?Q?FNr3RNdqT2iMxZMHtip7oCdI+aVmVLsDAdaJ+NoARzibEW0ADxmktclBlQJs?=
 =?us-ascii?Q?+Dg2dWNE8VKIIQbaAs9IP3iufBd6XbvOmTuECl30X20jrMIrofmxkbnc4lSr?=
 =?us-ascii?Q?DXkK4wKuQzVQk1+LU2b55mMhRiDI9VcKVWYh/aTWGr8DuUJDUczfJEta4YV5?=
 =?us-ascii?Q?j3aV9PiKijOXI+rTwuD+Xp6Um2xvA3G15uDbRmMS9LQkPQLZvpeuA5qqlLMT?=
 =?us-ascii?Q?9grEu/8BNpvtcz94s4NASE6J0MgByTsKFJ7YlMVA19l7ojzDjy38EeoKgAgp?=
 =?us-ascii?Q?M8sOJM13yzW9O6u7cwbeFaI6Ax6XfNnNgswpimVjZ3xalEaJc+X1LWazORjK?=
 =?us-ascii?Q?u2HWSBzwbehBuestxoecZ/08aU1YViNPaRQEOm2fl8yYQbMQkZXlSW6gEEaY?=
 =?us-ascii?Q?Y+quHMRb9bVlXFBPs6YVXabTZPwBvPrnPhyxrJoaI6rokHh5BTORhLUt2b7x?=
 =?us-ascii?Q?QE7AygLS5cwx5tObiprmTKhnonG67mEqSgZF2NhzkQ0/6igkyKrcSIp/W/+Q?=
 =?us-ascii?Q?2GF8+/lbp21tn1j2vIn28gkdqSjnM89TV/CxzDiBYH7jlT1b+qYh5mSpPNoZ?=
 =?us-ascii?Q?Kh26PAuAVjNjjPCA2lr1UFfK/YPDtWXXou1NS/t9tHMi782oHLJznn1dePVV?=
 =?us-ascii?Q?/H1vh9m/bDEGi3hDedE63vIjPf1QHKnozbhpi5MMsCmNCvZKlwAD0/ODJaRK?=
 =?us-ascii?Q?84YF71KmtWEkPqZy/7JBOcuuAdn0nRemyUfecGE/Ke9EbUmAe3+4UIhejRNK?=
 =?us-ascii?Q?70O/t9W4lpmIujelQk4a32Uc/bBOGEfluDxm4R7WCR0NhNjRgOyBf76tMkEa?=
 =?us-ascii?Q?Ehg1fwMLhpSTbq4OWv5ONL2Q9goUkTicz6t1O2f/YzeeyrYkPba7CUVsGfbw?=
 =?us-ascii?Q?/SzXQMfWH0ZXvjSTJVDoL36spkr2oWV2YdhoFZ8YmxagF5/mWW938hPCMk2T?=
 =?us-ascii?Q?IKtF84t64wRL2NSTr35vjJ2XQ10SRqaZwM9vInyOoyLAfU7BshFFamc2wiDX?=
 =?us-ascii?Q?cwmRTKrevZlhqUtkQ45bty8MhAfC6AWZNPmZSzr3dB9PBvQHZcM5n6GWA7xz?=
 =?us-ascii?Q?AvUAdfotIWnYPWn7dLtuHMGs73YPX/Tu+cPS7B69iSoMZhPV7EzEMVQrkZ6w?=
 =?us-ascii?Q?JteEpYUmz36ouZqhVWxT004Q8/lYtZjZHfip+XHJtFOC89hR5rETLBWf2UFM?=
 =?us-ascii?Q?URW+F7cDalG57ySTr48QAGLwiP5y/dGygmGZ6gVOSo/ar4Lx1N7fyMerfy+e?=
 =?us-ascii?Q?2xqXXVt4nw3xLMxdhij5BE1O3Teog9PP1yGv1QCVnbvnnkiPDPkN5UROsjU7?=
 =?us-ascii?Q?flXmiFMaWR5z5qEZnba01xMThVRGk8dq2Ly5L0iP/3qhucM4OGIacYTkT52k?=
 =?us-ascii?Q?dG9qxQ7rtMN+CF1AYZJnLIrV835kJ2Y=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94df9553-4693-42e9-05dc-08da1b8559d8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 06:34:37.9682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VcoprxY+/2aGQylFrmCpLXHePD5CkkdZdb4TlZ0njkuDg6wcJPeOU6JVROEMwymrndt0vEl5W4jFOto+Shkg2A7EIBWOt8du6CcuDKEMK3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2650
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.858
 definitions=2022-04-11_02:2022-04-08,
 2022-04-11 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 malwarescore=0 mlxlogscore=778 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204110036
X-Proofpoint-ORIG-GUID: obWdgZ96Lf7f2vLxox54ZUVJXqJXsb3L
X-Proofpoint-GUID: obWdgZ96Lf7f2vLxox54ZUVJXqJXsb3L
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_233645_192168_60355B7A 
X-CRM114-Status: GOOD (  13.29  )
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

Hello MTD devs,

The patch b199489d37b2: "mtd: spi-nor: add the framework for SPI NOR"
from Feb 24, 2014, leads to the following Smatch static checker
warning:

	drivers/mtd/spi-nor/sst.c:157 sst_nor_write()
	warn: 'len - 1' negative user limit promoted to high

drivers/mtd/spi-nor/sst.c
    120 static int sst_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
                                                                  ^^^^^^^^^^
"len" is unsigned long.
    121                          size_t *retlen, const u_char *buf)
    122 {
    123         struct spi_nor *nor = mtd_to_spi_nor(mtd);
    124         size_t actual = 0;
                ^^^^^^^^^^^^^^^^^^
So is "actual".

    125         int ret;
    126 
    127         dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
    128 
    129         ret = spi_nor_lock_and_prep(nor);
    130         if (ret)
    131                 return ret;
    132 
    133         ret = spi_nor_write_enable(nor);
    134         if (ret)
    135                 goto out;
    136 
    137         nor->sst_write_second = false;
    138 
    139         /* Start write from odd address. */
    140         if (to % 2) {
    141                 nor->program_opcode = SPINOR_OP_BP;
    142 
    143                 /* write one byte. */
    144                 ret = spi_nor_write_data(nor, to, 1, buf);
    145                 if (ret < 0)
    146                         goto out;
    147                 WARN(ret != 1, "While writing 1 byte written %i bytes\n", ret);
    148                 ret = spi_nor_wait_till_ready(nor);
    149                 if (ret)
    150                         goto out;
    151 
    152                 to++;
    153                 actual++;
    154         }
    155 
    156         /* Write out most of the data here. */
--> 157         for (; actual < len - 1; actual += 2) {
                       ^^^^^^^^^^^^^^^^
I have looked at the call tree and it definitely seems like "len" can
be zero.  So the -1 leads to an integer underflow and instead of being a
no-op, this loops to ULONG_MAX.

    158                 nor->program_opcode = SPINOR_OP_AAI_WP;
    159 
    160                 /* write two bytes. */
    161                 ret = spi_nor_write_data(nor, to, 2, buf + actual);
    162                 if (ret < 0)
    163                         goto out;
    164                 WARN(ret != 2, "While writing 2 bytes written %i bytes\n", ret);
    165                 ret = spi_nor_wait_till_ready(nor);
    166                 if (ret)
    167                         goto out;
    168                 to += 2;
    169                 nor->sst_write_second = true;
    170         }
    171         nor->sst_write_second = false;
    172 
    173         ret = spi_nor_write_disable(nor);
    174         if (ret)
    175                 goto out;
    176 
    177         ret = spi_nor_wait_till_ready(nor);
    178         if (ret)
    179                 goto out;
    180 
    181         /* Write out trailing byte if it exists. */
    182         if (actual != len) {
    183                 ret = spi_nor_write_enable(nor);
    184                 if (ret)
    185                         goto out;
    186 
    187                 nor->program_opcode = SPINOR_OP_BP;
    188                 ret = spi_nor_write_data(nor, to, 1, buf + actual);
    189                 if (ret < 0)
    190                         goto out;
    191                 WARN(ret != 1, "While writing 1 byte written %i bytes\n", ret);
    192                 ret = spi_nor_wait_till_ready(nor);
    193                 if (ret)
    194                         goto out;
    195 
    196                 actual += 1;
    197 
    198                 ret = spi_nor_write_disable(nor);
    199         }
    200 out:
    201         *retlen += actual;
    202         spi_nor_unlock_and_unprep(nor);
    203         return ret;
    204 }

regards,
dan carpenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
