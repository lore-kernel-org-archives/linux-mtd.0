Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9ED5C6FD1F
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Mar 2023 09:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eLX74lFoCnV0m/lOjZZjTNNs0Hb4WkR+I9q6uGlKle8=; b=bIK49NCvYe5XGp
	cYBy88O+Ee6KKoQaM9WgAh29xzUEFrVxY4KR5/wrI8O3XbyXxL4Smbbw2Xdc0nSuAA2Byhyuz+2VF
	iSAeY/HatJkIKbj89cnM6aqyNvnbWYnIu2T0bKSjNVeTDlUlQ6y6qi+8KLaC/DnTLA32P5S8U3iYz
	d0Gc02rRq5pxxb9SAoiAirwdfRrMpBKVag5mjZp3hoJ/vW86O/coR5laTJw4rz0/1RoEuTq+tyjVs
	8/NXLKhQms6Or8U/mZ3Lr4gsoYHl6bbs3UGzK+zZ0OweEwmHnpOdUi4SsTE+6Ahb6t9IqLcewFpOB
	5muiqeWFtfl9ucSUYCtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdpK3-006InD-0c;
	Sun, 19 Mar 2023 09:27:27 +0000
Received: from mail-tyzapc01on20731.outbound.protection.outlook.com ([2a01:111:f403:704b::731] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdpK0-006Im9-1G
	for linux-mtd@lists.infradead.org;
	Sun, 19 Mar 2023 09:27:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgmiyNNm7fsAw5PKiLynNsH8FsVBnzoqwzQROdSn/c2/39xVoDHP/lD1/c11vcx7pQoBaU+BGkyQNho7U7FWa76dB1En88o9CyzfsiwuI2n7NkknQ/H6SAc8jseii9XTaA99iPHWQT7xdTIXDZvVibgjGfuDzselGhM2FU6vS+YDClFGt5Iv/B99qaoiPya6dnIRG3Y13cboNnbhc7qoYEkwPsFqf/c1EaW6cu5AWWmoZIDhiQEi3naJJloB3+PXjq7winaFd6imWe0teYGi/PGeBdkg4N/pwcA87nAtAl3SlgYhAFokaGXxchGGoielHz53LaYyoDmbAUGmRGbJig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+WVe+eW2z/9yfg/TRa2E/M143S7vAL7nIgcL6N9o8M=;
 b=HMJC5o1gqZzPqhC6zW3CYFIaeYIPuSAK6gqRmQqEI3Ubt6e8wGxAkSoHzhcmX4LCkNBsMM1aAOco01Z60cdtF0/4ofVi0JfrN3ez6E0tR88VCPKkqq8A1OrfM1lxS+ZPQJ0L38b+mAU71RjayBVik9WSeUOdKf4oa3FxaIXDuKa1JTsR9D6pQ+Z67qOHl6mF7BXz2OMafUAe1AOIlvBal3fsbaWaT+6dFkYpelrNfs59C7/F/8+GE65+Rnn/QTpbvQ2TN/sp4Ki9R/TD15u3PffA8Rlrj8LSamd04rjaYbILuSnS/WTA/BEjdU0HGS8QXF85M0inzS04yIBUvwRH+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+WVe+eW2z/9yfg/TRa2E/M143S7vAL7nIgcL6N9o8M=;
 b=oJAdBLlS3aJyNK1qi9YIj4jBKNQIgTpOIc+A02nPRV6oFs7nbhzz/Dc7L25coX2Yeg0vt+CPqsQIP0nSOocFdfk7D11UkawxGQLLro7aG907Zv+A6MrrapVXmFZS6hR2a7owpJS3+h5CbkKHal2h++jjSjZlHpx2evXHKkB8adA6jnFmt+Y8pR3BVZ44/0q3XBxyME8mMWyLcKAu14MpAH7O9J/nTTaHi1Nq/WBYkjJoE2Obwbnn8I16ZNVN+RioAxQYyVSw7UpjXs/jN/jZRkVaCJ+pjZBtuPDmnIhkC2ifqGYIXuAxuMpGwkqFCkQYnE3VDAvWwiCcNpj2HfmFGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4012.apcprd06.prod.outlook.com (2603:1096:4:f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Sun, 19 Mar
 2023 09:27:17 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.037; Sun, 19 Mar 2023
 09:27:16 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Richard Weinberger <richard@nod.at>
Cc: Yangtao Li <frank.li@vivo.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2, RESEND 05/10] ubifs: convert to kobject_del_and_put()
Date: Sun, 19 Mar 2023 17:26:36 +0800
Message-Id: <20230319092641.41917-5-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230319092641.41917-1-frank.li@vivo.com>
References: <20230319092641.41917-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR01CA0137.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::17) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4012:EE_
X-MS-Office365-Filtering-Correlation-Id: f9432d6c-79d8-4513-333b-08db285c217b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	KT4kwKOho5154ydxVdXa6k13Xh+4YvFX9/sASIwidM8JjT8CYYxglV79DCk3b2cgO1mwORGhB342ZIeG9AS+znZYfOBxwWiz6tuP4q5gVeHMQKF/3hYbyQXW9ZSWAgfpdDcKwUirfM3jF+34BAO9UOOdOJ7jMUsixHBa/QobAx4adBoWp7xSA+SNWXzZ1OYNJAZwEVhj3JHe3jGASybwHpcZTkTNIIcgQGfiLxdtpJ1jKbeps3FlDzIEJxLZWZJqjvhTy+uN1hADIudBjci/Ey4dVHId/ztfZwjF06bpKa6nxPOzrTU3L1NhiO/qvZecVgFC0vKmOW3AIs3c5rvhVOmO83pUBWtLAtwqg0VcQcxOn5x3W8PfjNtvNxqT9CjPYdIh3cDiEFlxUQWcdp0tYep1LpGknfHJdppIxKWFtfWwWj/73nqhkLSvISSa8Nx22RHr9Ou7+PWRjRVN7VBVKrjiAbryfWq0tLARrbcUYMUJ6DuKiESIb3mqjAScUy4s+Py9UDKGKHCSbT2RxSazsPgrmEXn9tVFBYzqi5x1n53KXN3C7YJ69iB2HyJ6RInL9OoPYMLYIjtkYA+mnvvVR9kqvVntrwhbcU0dwBlNrg7+KrjlEc5zLMnyhSGlKVzkHA/BCgnLz/1x9tl6PYtc7knR2fU3KyWiBIFxh0YiUWotzHCR9VWoGCFDfRagSOr5GjknssWZh/0ruMglPFo6ag==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(366004)(396003)(39850400004)(451199018)(52116002)(2616005)(478600001)(6486002)(83380400001)(6666004)(316002)(54906003)(8676002)(66476007)(66556008)(66946007)(186003)(26005)(6506007)(6512007)(1076003)(4326008)(6916009)(5660300002)(41300700001)(4744005)(8936002)(38350700002)(38100700002)(2906002)(36756003)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?JQtibGmkmXbQCspkRsW9cV0Q96IytN1Thit9mI0LcBzRPfIYpAZ/r+Wiv1cE?=
 =?us-ascii?Q?1pRfUR2ECU/2rN9qcbLR6vs3i+Z2QHM2HhXBnVpJKuEZpJANiTaOsj1lXB7s?=
 =?us-ascii?Q?LRF54u51NFjdb0gUcw8DDGEsbqgXKnjg38zePp/nzE1VfPxm+kwpT2bw1uQJ?=
 =?us-ascii?Q?aJxBBCn0WIU8EHDnpoDdsIxnZliIvRdqVAiNL2j0Xk81oieZI7pOcS/WyGbJ?=
 =?us-ascii?Q?BOdsRcHgCdbnrCMz8A2dGteVqkHiNlOLGq1dac5JzLMAHTBBl+M9oZaSVdJi?=
 =?us-ascii?Q?z/HKLphLIY9ZBbfKqhszmEHmUhaS2gDhH1uhNFdVHDFoumyfHWnpprVSLD0+?=
 =?us-ascii?Q?fTi4X6ChyTI06E8iih0GC5PxBt+tuvhsD6qVJ3HBiPNOi4FEYy79boSfGUc/?=
 =?us-ascii?Q?fLhkpaDyvBHpxv2WH8cx9VzvCCJkVAb8mlBaId8qE9QiAv/QC9VXp0LcQwIb?=
 =?us-ascii?Q?MbvL9QetgRaw1OMdTiPZcHCkbSawT+Rsiaeis37Fe9T2QpF+cyeLACDnU72d?=
 =?us-ascii?Q?2zZpDWsNb9PEo4ukZaqTAFb+rcfluXPiP/wnpIL6NW9Wh9hjvtJlrHtUJQF+?=
 =?us-ascii?Q?ZItM3bm2/MjCGyIfb4Sbi23G8Up0leK6a05DDb157fQR4WSQDtURNJFGfVnw?=
 =?us-ascii?Q?goihDT+mxXxh47rHsx/Nx7dC7fjAOA5D58FtU8jI75BcDbPfW3rNGNlJtBce?=
 =?us-ascii?Q?l3s9mFRsGMTAwRrZr440pQOO0G8gQTpli0miwRgHJJvG4lH+Kx6qnpNMMoV9?=
 =?us-ascii?Q?Q3vE7n9dGoIAqm5lmIjjGPQVuwhvCUVcps6pHy+umh/7fum82/AKqx3Ra5WA?=
 =?us-ascii?Q?y40Iiv1qyBJSqKl3uEYbWl/0Cof3ssWGnISOLUICouHNGTdhIN63AXd3nU0K?=
 =?us-ascii?Q?3qITRNRrBj214/y/dVZQdhPQmC5JRkHxIZ1Or55thC18vecQ2H2UnTCjKRNs?=
 =?us-ascii?Q?aUxCsUl5P5jAA8FVRCUifjoIHvVi+i7tUie1VffGj+p9HXTQDGj1Tg0ziBuW?=
 =?us-ascii?Q?z+p13BK4ThwdXkuexnrq7/b5rXbCejjyYx0EWo6q0rck7AEFpLA/t5nnU6Xp?=
 =?us-ascii?Q?cnJN9aUtUJSW+b9YIDOUkfEOyaSAUFLTMKD8Oa7lGRBKeG1+c+4mZyfkGXUr?=
 =?us-ascii?Q?llJ0b09eNMzqyod+DJAGmY4i9XnG6rDiMyL8YFY6Gr8zg+1glAeSRNUNRN39?=
 =?us-ascii?Q?MttTnVXo8F+LSLmToezKlsBaHYSyf/1Yu4paAHU4x2IYgQDvk818RFmBstYh?=
 =?us-ascii?Q?rRc8DzW8noWRPsJiYG0WzfOvuO9DkUM8raA2BozO+tt16MeCvAbBrZz579lJ?=
 =?us-ascii?Q?DlMVVeu5MLOwdCng2NXQc+AiHVBrtfkwtT2lh/TakwTTuQ/J/fuV7q2L0Q38?=
 =?us-ascii?Q?6ScaA4rD4cYUwC1HhtkbKr5txho7yxIf3jZELTVhm7GZWta2IAo3zHkJArl5?=
 =?us-ascii?Q?JqYlrl0MBKfy9KrN/np0+1DZILRlNH2MdZPUS4nhFF3/0Lh5KQLgQ5BUrCzh?=
 =?us-ascii?Q?zxVBJ1MLhJJWsVUyoDrQ5dqbsZmhPC8kV/Zpo5XhCvZ1/+GngPXYHXQFQeOT?=
 =?us-ascii?Q?cS8j/5XjEcwGntLvF1HIDjG7gguAfOGd2ENGgtzQ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9432d6c-79d8-4513-333b-08db285c217b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2023 09:27:16.8600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uE/RNphEW4t6fm5DlEAThO5s5R+nZ/ssWiLQrrXYn+yvcqdjDMIrE1A+6ZxUEpxnVtG4K2DgRygXH7Fh1rw/ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_022724_707148_83DEFD23 
X-CRM114-Status: UNSURE (   8.50  )
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

Use kobject_del_and_put() to simplify code.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/ubifs/sysfs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ubifs/sysfs.c b/fs/ubifs/sysfs.c
index 1c958148bb87..9571718e61a9 100644
--- a/fs/ubifs/sysfs.c
+++ b/fs/ubifs/sysfs.c
@@ -130,8 +130,7 @@ int ubifs_sysfs_register(struct ubifs_info *c)
 
 void ubifs_sysfs_unregister(struct ubifs_info *c)
 {
-	kobject_del(&c->kobj);
-	kobject_put(&c->kobj);
+	kobject_del_and_put(&c->kobj);
 	wait_for_completion(&c->kobj_unregister);
 
 	kfree(c->stats);
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
