Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88211C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jan 2022 11:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yy/Dgti7Fa985YaTbpsR5HYtmkmAaZRqeE6T9zuwh8c=; b=mfov4O6o7Txf5M
	aHgd8alDSY1WBzCEZZNGSWeU1CAkQ0fX90OatZCW39J77GBI64cYsDcSr0sTOMeDYBtkusT7SW/Y+
	0NxKQUu+HEEtLp0nceINO7E0ulFvvk8EOO6rJYYrVLGj3ZjZ51oY7uGhudRQkFb6pGhFshRMlnQbw
	8ogng1ewciPCi9aks+IMUzd19WWXUn73Az2TyKdem2jfpUCLY6CwVE/y92jKOrl3Fd312SoM24JH/
	OoSUdFoZq6EGij5YhMZ1zJDBo5foRJuJ193+9Ej2aTSN73RT4tzqXNU5mbY/KwcPGAUzzBdyV7X9E
	wugCgHg/VBMjEOSnnZwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAsSE-00EqJf-W3; Fri, 21 Jan 2022 11:51:43 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAsSB-00EqJ9-GE
 for linux-mtd@lists.infradead.org; Fri, 21 Jan 2022 11:51:40 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20L7Brco017784; 
 Fri, 21 Jan 2022 11:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=0T+cdUyHSBNYa9lb2RRk1Igu/W5x7E+cufnoySu6vLo=;
 b=y9qPZRe5t3E4kNZ2T9Z966FNBFZRwJALWM/UdPLX6K5m8BxkPXYohrj2Se6yl1h0NcI4
 vYdXJI9yXoeNiu2ZHVRylLx442a0VeH0TB+Bo7/JyVwLusesmLh4MQ1CyCLK3c95PCRj
 AHzrWL6V6j6bFV4mH1npLqNv1Bb49iz+Bl0MXVaobyRPGpREwiGVF5YWSUXyTndJHPe9
 szdnvGpP1h3H8bpTNEW/O51a/IYSWPeYj3/Up9XRxP5K7pjSYVno+2ZnaSd3qi21ti0l
 TJjU+d0ssSXMRKq5ShrDk6D3N0O/0gpoepEj+Ta/hHwj5j7rtWTXryPotMUBgDZQNS96 pQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dqhyc14rk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jan 2022 11:51:27 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20LBoCuE040092;
 Fri, 21 Jan 2022 11:51:26 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by userp3020.oracle.com with ESMTP id 3dqj0muu1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jan 2022 11:51:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nyfkKqLE4L7B0JjtvIEGLCuOIWBKsG9l5/gnjwjUPtDN+LEL5rA/zeCp0F1qsbtRY5yB56cD9uHt0N0EXrY2oYVCaIef+9QFa4cHqUstqq4zYbvni8rvd2kN55KV5lFW7SHq37UFGtHdYIVOvXjBqfObevwm7JjkEIE6ygWkpkTaotkeTFfTqxWgO5MW0gMDW/GpY8I5CZBbGqiqROLprj+Ou3jZJQPfhBSlio74EejAhCZSZTPMpDOrvZl4zFZ45d7RwQqQk5fRZXyEeml9yG6cxQa97LoVPZm7yKN+z0Tgchiok9L20ZO8ovnhHsk6Hqw5/Ne8am/X82Ir/V2hOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0T+cdUyHSBNYa9lb2RRk1Igu/W5x7E+cufnoySu6vLo=;
 b=TMs2a9437CV0hwuwBZeDVrqHq/yJiiZrYqS7YFYnoOlCe2clR+xoUSmfXeIS6kpdS3rd0i/uenYoOz83QHpfO+FhKNt+mwzG48XXK53cM+kzUfcXRKRZ2Su0Ly+40E8tHbeBT4P1jezw0xpVtqxq9Joh/5Uxha2uVqV4PcYtcPc8+iQ1+KaaBRYXDl7GZfB+/sSafv+hubVwVvdBX3czLaaiFvK3bx3X8LLDKNPQbJhouSZU039NRCec40zXiKnw7WPSftXmztyar0R/X/cxOlSo90lyY9unwugxFVcwtOYxTH6IbC9ninuTuYZLMCSJcp4mnUKmap25A/PyeZrG/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0T+cdUyHSBNYa9lb2RRk1Igu/W5x7E+cufnoySu6vLo=;
 b=HCMAHvk9VfWsqRwo6irgXPIn+s3t0CiGWkAAlGWGsSrLaeyFBGXT6uibqxI2iSMLuqfTackarVr7SpSDCCNOlsH9/KqP8nglFFyZrt9cFb5xVUs9Fd0qh4uBv71fa9KDhQeUSolYh15NgWSnnxzecVqTO3VCaDep8yfdmLWhCso=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BY5PR10MB4130.namprd10.prod.outlook.com
 (2603:10b6:a03:201::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 11:51:24 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%6]) with mapi id 15.20.4909.012; Fri, 21 Jan 2022
 11:51:24 +0000
Date: Fri, 21 Jan 2022 14:51:03 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Joern Engel <joern@lazybastard.org>, yangerkun <yangerkun@huawei.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: phram: Prevent divide by zero bug in phram_setup()
Message-ID: <20220121115103.GH1978@kadam>
References: <20220121053836.GA27293@kili>
 <20220121121748.24e98015@xps13>
Content-Disposition: inline
In-Reply-To: <20220121121748.24e98015@xps13>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0029.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::17)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4270ab1-a97e-4845-5842-08d9dcd4595b
X-MS-TrafficTypeDiagnostic: BY5PR10MB4130:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB4130B604DF84383BE4A243988E5B9@BY5PR10MB4130.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ieBBFEX11r9hjFbsiunnQ1lkY2Mrqr2enpgtTU5jQnJB8RHRsnrt5lOc5OZB9C/8IdJkrYSmBsYku28oVlyu3i1MCLBuKHOkFo7BGoqokJ2TeGZcat0KuydmfPXCB8W+0GgXYm9/a/PbRaLjPVcWBrXcyJal//JprRJO4dlm4qbGL7R9oHtxsXGlHQlro0JqcRN97ow8UGQMiAn3BZVF5K4IdCBW8CpJY1FSbUtUYVNH9AF/cZGXiYEC+iFGCSgM9W8jzi+m51c9Ln73OrGiYiCE0eXaBPStARbNkk2reo2vvn4kxjS8JsH9VCwHwJg9foblIOa6XrEzBb4J6z6wVqoLrgJ0fE3wEyko3Bi7he4o8XKZmqUETTDrQehmaPLTARyM/2X9AC/BB5I83KqKzAAIzpy8+aTQakR63isw+uHCh8l1O0p+fCMZ6TK3KIe4RltkRf0y25LFgsO90b01T1/X9WF7P/Ha+ZNGmnKGH7DZCgjoXlZKSmeg3InTHHYjG3dM6+ixsJFkbP4dYUdJCAeLflGF8Rr8kSETJf1Yvtv4N2lvk/DvBMM0HGxpPqjhuiVOyYhOX4t49YKfLzD2fpOd1h1ZmlW83Bfd/MEjHPaZlz+Hx78OmZauV5D0rU7kUdHBSh+zOhvyrcc4/9JGWNOpCPGnEEGzGl7N24/rZtqDwecrWkfU4F5degvbtpe84azO2X/jKzY4/9j+XR9ZTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(26005)(5660300002)(52116002)(4326008)(33656002)(8676002)(6506007)(66556008)(316002)(66946007)(9686003)(54906003)(6512007)(8936002)(66476007)(508600001)(186003)(6666004)(1076003)(6486002)(83380400001)(86362001)(6916009)(38350700002)(38100700002)(44832011)(33716001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wu54z80r4Gy19jv8ppxYnjkaDbrRzTGtmfUI9onM4TeM5+/MpAVTqtMmdobu?=
 =?us-ascii?Q?c1v1kyMdv6RuYWoh31QNVlhExHLzlWoad5oFKyQzqzC4NHDs0gstaGbp7xsh?=
 =?us-ascii?Q?qItTjYs6MyAzAzgAg3suI1w2/nZGYzl9D4t19w0lb65jqobQFylOCKPOjYB2?=
 =?us-ascii?Q?O2sw/3LrGS4hUwLwt7d+X6qsqIawinph2x4f3VkJLANnBDLWPVhUiydgHyG/?=
 =?us-ascii?Q?q78XGO73wh/RQSt+vlGrQ/FgXytRi9X6M8QHXgAqrWxqfezC3I+wNIQo4zX9?=
 =?us-ascii?Q?ysJhVCskTANZAG2QTMb45K06I3m+wIs3+y4sqcU/9rBlxYzHCRsivnkO0MBe?=
 =?us-ascii?Q?yze8D+HX/txyt/HMT3+O++GZg8/YsdaQ5+HNtV9uZDzpcXspPjCd5k3TW4u6?=
 =?us-ascii?Q?3ONrdbVz98+m1QOy2kSl1GUpGeVhLELm18ghuAp3wX57StOfs7r2eI1bRRZH?=
 =?us-ascii?Q?Op8qT6J3j8zeEsyKoAJVUPCHjXQT6MfC1SOdmIBFWivMfJwDT690lImLvjSI?=
 =?us-ascii?Q?dRbQZdDCc+MMiVlX+e+qknNOQ3YYuqReir1pW2Ig4+Q0XgUOx7+5Ga5zuuEi?=
 =?us-ascii?Q?AMKuhalcRVEb1SARMWdUDqt6bcjfRQcXtBE8ViOEbRBGkV3r5eMQWqUnBXqL?=
 =?us-ascii?Q?QBX2MgPekO/B1tsqFLUh6zFo3IiC6lModyDxQkFCc/Cf6x7obRJMq846WBh/?=
 =?us-ascii?Q?rYuQbr6AJjYj2fjBjYi6HC02wU5sDKYl6vUm4WZh2LuWLxpNrswjUqS0bwer?=
 =?us-ascii?Q?+U+qUH09zXPaIFpUTBNtvQN7u/hXvGDIwlZma1NRK2jChFvSQ3xdUxsZbRXM?=
 =?us-ascii?Q?bd/UG0T01HHEpAndovrWJ7hOhHRbW0hz2ZyQjMAB2Fnsww2tEGokEUurzRRs?=
 =?us-ascii?Q?DIUCxxQySPyE9FWc+3NL/M7/T1TEmyDMkwH18jEsNAGF6FajPA9eypkv+9hp?=
 =?us-ascii?Q?F6BUuCuHpdmkY43qNxweuco2PTOHCOBE6243QqGecyhrC4WlAbHu+LvP/3w/?=
 =?us-ascii?Q?6M4XsiPso4J/2tYzJqT1cT3UtthbhJVWJZ2hvBj9TtTdSjmAV6yh96FMArBQ?=
 =?us-ascii?Q?DJv8JanxWv3+j2CqMtm5O/mfsg6v4emT48IB2RegoJGwBtMCYXia5zcxm30y?=
 =?us-ascii?Q?O1MAJwVYmDcebamzGvzSKcNuOToabhPyzwFLpFm4e6PIGqVhtkAdhWP5gq90?=
 =?us-ascii?Q?0qE9M2SsiKm2CukOVh48RlRfPreyp42B4Jv3RoxHpEDHU0Te5HvRxzk5HuMY?=
 =?us-ascii?Q?tUEJVjfJDeemu439tNCqLXHSZ59ftyxsy+bnQzPZlCFrrwAhkMN6Psh2naBX?=
 =?us-ascii?Q?5QB8By7KfwEYKWrH6nCKYu0k58TiLvMAFHArqJJHOQI+z9w3tQox/2SGM/tR?=
 =?us-ascii?Q?zySQG27pUQK3FPy6aAJw9arlcVxxahMO0xT8qfNjI2YxySgKAyunHSEK1RdL?=
 =?us-ascii?Q?B1yceM+RIWBrpoR9ZeUZfY+mXPV172LqFKwJx/ajMnA8XtIW5iQ2JX8On+tp?=
 =?us-ascii?Q?mmZYzokz7YjgF0tjg0hKRtnpT4LE5uy6cR3MALgivqggzZf0I4mWFgdlWdLv?=
 =?us-ascii?Q?Y0QxEAss15vXUmIyFtZAPjMtf9fR9G5zyMHLT9xVyCI+CZdjcNdmzclla4Nb?=
 =?us-ascii?Q?B/BpGlPgz+46MgO1Qy82sXIs1HAx/6vigsC/L3Gmz6sJJYMITB5Ex2Bf2ysp?=
 =?us-ascii?Q?w0jh6Q=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4270ab1-a97e-4845-5842-08d9dcd4595b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 11:51:24.1534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jyzpdKde7v55ShdqEVXZNKrL+22cLTl6tedztxM09+JZ1qQZosPVGM/AMrxf03F8ZSjf+srTncDEWIFLjbGGlVb9+dAQCCroMLZ19ZyMgzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4130
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10233
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201210080
X-Proofpoint-ORIG-GUID: 1n3X3z-Fr3emi_8S0GawmmS7bApDncDt
X-Proofpoint-GUID: 1n3X3z-Fr3emi_8S0GawmmS7bApDncDt
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_035139_638827_B391C287 
X-CRM114-Status: GOOD (  23.34  )
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

On Fri, Jan 21, 2022 at 12:17:48PM +0100, Miquel Raynal wrote:
> Hi Dan,
> 
> dan.carpenter@oracle.com wrote on Fri, 21 Jan 2022 08:38:36 +0300:
> 
> > The problem is that "erasesize" is a uint32_t type so it might be
> 
> Don't you mean uint64_t here? Otherwise I don't get the sentence.
> 

Yeah.  I meant uint64_t.  Will resend.


> > non-zero but the truncated "(uint32_t)erasesize" value *is* zero. That
> 
> s/*is*/*can* be/ ? (again, if my understanding is correct).
> 

It might be a situation where "erasesize" is non-zero but after we
truncated it "(uint32_t)erasesize" is zero.

> > would lead to the divide by zero bug.
> > 
> > Avoid the bug by delaying the divide until after we have validated
> > that "erasesize" is reasonable.
> 
> I don't really get the fix. If "erasesize" is big enough, then
> (uint32_t)erasesize can however be zero. But checking if erasesize is
> zero beforehands does not fix the situation. Or am I missing
> something?

It doesn't just check for zero, it checks a couple other things
including  if erasesize > UINT_MAX.

regards,
dan carpenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
