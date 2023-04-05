Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C33DC7619A
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Apr 2023 13:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G1CgCnABtaRFm6KHxSQTq+LFyxaAjKk9U8f2OKtTvqE=; b=qczcxq/b7R3mHm
	YdsQspogom9QTp2kV8F1gprw98qosyjxoLVKhYtmPvAHYrMrTKqX/OVfSbceR1w8nyTcaZolQelFf
	iqSGTnqPHllFa3s9GVGFPp+hrNIzb+ltc4qUDgu5vwPQmxcHDfWy5kUzybLKIjrYEKfuHhWG6DYmr
	MN3iZZhy5PP44Rfp0OfwjWWrxteckBgtPXHmbfsi1KYCBYhj+A/CP5XeeQGf+VpeV/2y5MsS6Hcdl
	bovBlh24Sd1Qd1e15znn3Tj29RRljzDBQQ85TrxeQ1e+iDzRz0hHawbeK/1/VG1ZR5XenHfEdWGWx
	l6Zw2PFqHeMFQesHH5cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk2s3-004U9a-0o;
	Wed, 05 Apr 2023 13:08:15 +0000
Received: from mail-psaapc01on2071f.outbound.protection.outlook.com ([2a01:111:f400:feae::71f] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk2s0-004U89-2m
	for linux-mtd@lists.infradead.org;
	Wed, 05 Apr 2023 13:08:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pft8ISaJxzOY1THYOW3n4upMwGpAAv2gyKGUe4f3FjwvNhfrMz6c7h9lAxsOB2S0DQCrTPK3XoqXEzspAGUmvy3rUTF5kBUWahSF2NEiX4eVtYdpMhvo8UmUl6oeaT0XH8DyFO8C+5VZ9uyRJ06u0jHR8NzqevcSniLspBmaKCpAy8ypa0H8qTv4ZGnpHmL5tA9MQJe6F/maR0ewtMEHII5f0tIBw3Fm71Mz66wV7XemT3Ppa7aYNzd61qgfieyYXkffHZTc/2N3pbdVUesRcCL7dozoQN/SmmQO6dhWrgGj3y5IwuxQSS7u2XIS2KQ6EW8djs790kdXmf7fS9HLPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRB8RkVUG4iyjf7pN7JNY+Vegz9/XVmkBYpqS0Fi8gc=;
 b=dKQvChkXBGY/umlqxotzK4Jitam7NX5aHMp2Tfrc39OmLFs66ZNQK6ZDGJh3lePzu5yJictorsElruZBbzCO0EjAIBc5x5d7YENjwdx1/v4IM3Zo/UFaheuh4QS3JmAw9uL7mEwch9YZXvof/9kCJf/XY+vp9nZvlXPS6I3WZ8a6ctoWZ/HTFYGrJx/u03yiu6JFgsA+7aUCYerDKW6dLfNWAreRO2gif+q/ph7FPUeOsepbSHIeQ9dF+CMaIKm+ewDCGoYOSuqh0dTvcnZ6aP2Tw2jp7pW2JAWVNay+RwTqcq+oacZxb2Gn/U+9wlsH43h42n19Q2iYYciELYReVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRB8RkVUG4iyjf7pN7JNY+Vegz9/XVmkBYpqS0Fi8gc=;
 b=Jp5oxHhQymmN2MxtYNQrtWi4Mxdd0a7gmnCYhg6zZ9oFCXOKnqZskDmWsHN5b/6ixwoDE8BPHP2kyFX55M+D6IfIUnw3xKNT1Csg2JZbMb0OQDxsniGTqCS2qvoY+az371heRfEomZIC2dn2ySDGZKlfqBTcaHHlts1Kw93CtCsnv/U0LyBnIszN/9Yj3Z0PamFn46vFiqMOpRBDaKpaQMoKeAVMFUqfx1i1VvdqTvtGorSQTYSa9KI0fNlXw3EhF2GaquRZ2NxQ1lMUfE7wbWgRF0psRTkgaDyeL+VzbbyniRP2QQnmGeWKX3vhaO6fBj580YuHTU5Pg32grRIOlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB5790.apcprd06.prod.outlook.com (2603:1096:101:b9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 13:08:01 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6254.028; Wed, 5 Apr 2023
 13:08:01 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Richard Weinberger <richard@nod.at>
Cc: Yangtao Li <frank.li@vivo.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ubifs: remove unnecessary kobject_del()
Date: Wed,  5 Apr 2023 21:07:46 +0800
Message-Id: <20230405130747.66006-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR01CA0037.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::9) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB5790:EE_
X-MS-Office365-Filtering-Correlation-Id: 24e52fea-1f3b-4666-424a-08db35d6c8ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	bNxz8rUFE6kXhZ1QBFbyZlMwfCgAmkmd92OhwADsIjCRu7mcQ/Ovcm3ktEAZVa0eNKAicb7idxsIPgNelU6+bbC2yc3xpBUycAKw8hQQ2woNyYt5nHozkQ0DxrYnWou6ByihpTdXhKll3GPv1WJKNq0nfUAOiH30x/xPQYqO9qyRHXGlVhJptahqkL+6JjqjQcjdiPb6432bv6P/UaP+CvPXOUWj7ho4smXT45VYtPMrWd2ly1AWkuKD8blFuh7xIvfi3Dhxi+KS/YpThCtsSjmFVg03J6J5K4OUOLopdrv0PtlfXyizsfcVq0C0BzSsq5Cs3qGRKkZ38MdjUlUGSeOoWIRmOjjOtLg+J/oUrU62SOuxL3tJdjSBZZIcxn9uY/bFbkctIOreA2+mFrh1lAHI+8exRA4p5f7TH0WzsEfP9Z2QYEkTCGHbnFpCzeub5OTapV6ZmK0KX9G/RCiUiRkBwGaU5imu457ei/7kZqjf89Y5IyKrEo6cisHm/teD6fsNlAf2fOUiCcwKZMF8mfmmhs26gqhTfpyEJUwqdFOZVa2RegQy+LldeosHovDKz2dICy7fBegU8DKRN0D+dgYFMwveSkqSDCDJFp+AFnECDV5wrV8jttSeORPAqLik
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(451199021)(66946007)(83380400001)(6666004)(186003)(52116002)(478600001)(6486002)(316002)(6512007)(6506007)(2906002)(1076003)(26005)(2616005)(4744005)(5660300002)(36756003)(38100700002)(6916009)(38350700002)(4326008)(86362001)(66476007)(8676002)(41300700001)(66556008)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?J5xiSuS9WI4NGeM3KoPa8iMlGRFOCRaGsWsVXRawK/hC6mCJEsXh5ykRQhfH?=
 =?us-ascii?Q?meSSxeciKb7G24eouIEK5sRHHp+yvJ3G8bWZJz4/RIfHJa4vag16IkVg+moQ?=
 =?us-ascii?Q?bD4OMu0iqBc80z+4TYPQ/nG/4l2ICIgLW86GHZdyWgF0ik0Nq7kyHXqlSAsq?=
 =?us-ascii?Q?YwRXutPtbMJzgIsC9hk2mC92NCYkY18qRHr7DHnqZEV8OmFO5Pl/TRfrPYs1?=
 =?us-ascii?Q?So9Ll7h4T6rx1I7/EYhIESFByJedD+jPprVnJcuz0agi4043sexdde/0lFGG?=
 =?us-ascii?Q?8KfuAmlVfhmuvIzshlB5vxLHpDJPR12HeoO40BhTzixcRSQShAjCl/0J0iAC?=
 =?us-ascii?Q?Z0ufkBfZFgaqlSTewt6e/fBDKWIVzRPwxs6MbAAweWufXSlRndfu1xxvrg43?=
 =?us-ascii?Q?w1Q/BAGe7pvvB8N55V4KVubp1Hfr9HlFLK+AkrjYXgOJfjgh08SiwifweRTV?=
 =?us-ascii?Q?wC4LnlNLieDpM2Ttgsxn0/cMCog6o4hvTrKdEo0gDuoUKVcYdn+KsdQCgEgS?=
 =?us-ascii?Q?2kfuMchOIVeaMRDjw03G8Vtzy6NZNtDv1n6htAsfCdDv5aVDGHy3GZeUSuQZ?=
 =?us-ascii?Q?NWc4PFBT+Sqy18mXpfS9WtdocwgAXeSg5AVJdOmzqjaubAOsOJ9HRIdFOJZv?=
 =?us-ascii?Q?W+JBoNsR97YsUdElV1jj0hFs+ZoaoY27CTDs4hiPpG+B/xYhPa0AYZjhzuBY?=
 =?us-ascii?Q?ytBLXjcs2+XDm7/bRr6VPI4Q3eljFjMnE3CNWVgzFfMFIXd/qLmJ9KRVRJHz?=
 =?us-ascii?Q?EoM8SoWo98UUtt49bqg/Cagz6+/aye7klnf86+y2JvTVGKOGIp2Qa16BmYZJ?=
 =?us-ascii?Q?F3nF9YYWJ/qG1EPoJ9vrROhFvZilb1cJ2VCq8ViEi6uZqI+AyIZtvQ0DBo+r?=
 =?us-ascii?Q?XPx0vOQ1nptKndQAfidbTxPApuqztH8kgN6tp66qA2qGPudhbyB5gI/gDvhC?=
 =?us-ascii?Q?60z7MwqSoJtYnTVkdpfU6qFol8jV7H+sH+zdQkm0HrzN0Ua2Wacf6rKXLWsA?=
 =?us-ascii?Q?avYFTPYMj4oU9qPPYE4WpFhKzsfGgRG2f3CamfObv5K5Q8+GPAOjBhsC/hvI?=
 =?us-ascii?Q?kUpSRfwZccd4PuAExf4gQkgszJOSoZ8gov4RwZsYDB5iVEKGJGaIubv+7YU6?=
 =?us-ascii?Q?2akfIeGtzkxJuVUmJ8IAMZpFEGW6ie93/bVoFkgqRG27UoNLP4VCLDd42FfE?=
 =?us-ascii?Q?q2ZKsdpqVghQGZ6ashEaQ7T2YX8xDbIUNLLhJW10wNO386A0xAnKUrenLoQt?=
 =?us-ascii?Q?b8rT1Vf7sIkPQfT9/xF1wzcxT1LmQHBcI5wyNfVUeYiJQmN9XwZiHxgcf6bV?=
 =?us-ascii?Q?l8OBddbJV5ZkENy7CJppHIMSm2IRsmnBHCUV5ziNuUFyjcjBuAmNFE9F7Sj0?=
 =?us-ascii?Q?Li7AzDmiWnLXgZ6crDkxgp/K5GYbj3uPPGkau4m7UKSnnFx/eyEEyKoUYWQP?=
 =?us-ascii?Q?bbCIFtzcMM1BCEPliFOLWznUd9PYc9IKmOCBcPqZill2vwXIXT2EUjD1Eojs?=
 =?us-ascii?Q?lQXpyaFd5BsPAA/rcGxAE+dWgKLBjK3bGtRr4J+j2TqknR20jBKTPzF8whiT?=
 =?us-ascii?Q?thQYRN2eVkKAQGqeZTitr5TZVVHB5JKDbtV4yEU3?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e52fea-1f3b-4666-424a-08db35d6c8ac
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 13:08:01.3630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k4iRVcmvSQ4plgYOPa6/0qQ5hhTTzu4O9N7oypo4I7JHCdUurLSqV85OkKf9erciieZfuQB/IlneOxgkpCuc9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5790
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_060812_902893_078E548D 
X-CRM114-Status: UNSURE (   7.06  )
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

kobject_put() actually covers kobject removal automatically, which is
single stage removal. So it is safe to kill kobject_del() directly.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/ubifs/sysfs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ubifs/sysfs.c b/fs/ubifs/sysfs.c
index 1c958148bb87..1ffdc3c9b340 100644
--- a/fs/ubifs/sysfs.c
+++ b/fs/ubifs/sysfs.c
@@ -130,7 +130,6 @@ int ubifs_sysfs_register(struct ubifs_info *c)
 
 void ubifs_sysfs_unregister(struct ubifs_info *c)
 {
-	kobject_del(&c->kobj);
 	kobject_put(&c->kobj);
 	wait_for_completion(&c->kobj_unregister);
 
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
