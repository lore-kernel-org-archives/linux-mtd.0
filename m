Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91565CA0ED1
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Aug 2025 02:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xRr6qq6YyOjpnV1l7wU6s8Vu6u4eafnuHfnKmlgj0Xg=; b=lL/PmiqZgQfj69
	N9j+OX9A/yLDwOjVnBgK7bRsGt1cTew6aI+33QnSe4n7AHq/KppTIRnmGuCV4m7MK6qMfiA3JFKVR
	jhTrB6Qy4cZTMrqQfTb5qi7wEtro7bGsKNfBh2LgKeNa2qA3Tf5ThBFhvrw2Kcl30TP1LY9IWto7F
	DZmH52FJEvrhYnbLxZZpIBEdixdeYChelvrOzJhFuEjuhFX8eMxt+AObj7L984Xd7d3WdgCPNccET
	3Fben0IILD0XfO9gDb7VD+jk7gqRGVvyhxBMt6fLJjIFwqa7ub8O213j4ElG5nzr0oEJ4SpwZmNWn
	2lBWQI3Xmf1qYBKE2RTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uleTQ-00000009ag0-0d9q;
	Tue, 12 Aug 2025 02:10:48 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uleTN-00000009afJ-0UTz
	for linux-mtd@lists.infradead.org;
	Tue, 12 Aug 2025 02:10:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yj6ECWfnWYHV3eG6Jq/GcjRlxvYK8eucXw86iFt1pxAdj2gprX+L9fv7f9do0LzMdZFTkMNMYyNG8Ej66TIXycdsCw/8euVLbENa875+jwfilpA3kBXzKCWUNQv3BEGWRzSC6Yyvc4hsE12nDHvOyijnlsUbvuQguUNsPcTy0ZP/duSzBAkt3pJt/LEP/QvGXSfbVmFHXWgLE3ls2Bd7s2d1qpqqstLS44Wc4dOiLFCwYHXLLO+j7wAUIfW5Z7B7kHkVSBVrN8hLeiWlQ1Cz2eMMnMWD7psgm3eJRP5UylY5nhNc1mjnFQLTq+1ftEO8NZLeAWLwz2uhu3h8bJdiVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkhYVeqAAJd6cC5L8aUx5LQEisl+ZwvOge/hwwWMUNo=;
 b=Lf4Nh5atwuQizLVg2W7wjzDkO4lRN+8tt6Hc0jrjhsjecU4q54zItnCFDt36+uHYSEfTEBh7L4Vk4nclVgNb1oZwrmh/qTmvdnvA0Xf+wjCdRUUzTHMZDR9hqzrsrCW3UZS33ob3Dgja2QP8eRitoiXrSFriHokGs7juKo3vNt8qGVjJ55KQzxPyaVxUWqHiNADUdrOgYVNcO1xXCaESQobNtgY/U+SsYmn4Oo0mkp2aHHNLI0wp6AeCw13xZmj/Os6cCl0V2txcRFLxFKDNXZNwWV1LNqYRd9PN0d+EIYf5DQU3grsWpB+gNGi9tBI5TY2Kl5X9xvtR0da7NIS3lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkhYVeqAAJd6cC5L8aUx5LQEisl+ZwvOge/hwwWMUNo=;
 b=nzss8+pAgSsk8rEqushIxMln/Om6LZW8UrA8jeIAzQSnFwC7mIYrlfxGkVW6Z7cCiir02i6/wt1SwaCItikStNL6CsOZi9X4b15sVY6m17XAVRIAhosa5KKBn83V3SMMyBRmL0BxBMokjE+yfg0X6OM090ZXctAg1QuUrU9+0aCwCwfKmLONLGGImy7h6ckaNrKGILHKQxRA66wgqxI+aQI+1bbsFtijho9BIlTfMdXC7NxGdLH1JmWBR1uBKTqSkdNhy6AL885RV+ONazzG9zq5qkypBA8LFBME597vy4//K30dFdlScMUDOg93Emmg9r/DTPggAeh9yjfqAiOZ9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com (2603:1096:820:d8::5)
 by KL1PR06MB6733.apcprd06.prod.outlook.com (2603:1096:820:fe::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 02:10:19 +0000
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb]) by KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb%5]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 02:10:19 +0000
From: Xichao Zhao <zhao.xichao@vivo.com>
To: Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org (open list:UBI FILE SYSTEM (UBIFS)),
	linux-kernel@vger.kernel.org (open list)
Cc: Xichao Zhao <zhao.xichao@vivo.com>
Subject: [PATCH v2 0/2] ubifs: Simplify the code and remove unnecessary parameters
Date: Tue, 12 Aug 2025 10:10:06 +0800
Message-Id: <20250812021009.414756-1-zhao.xichao@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SI1PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::15) To KL1PR06MB6020.apcprd06.prod.outlook.com
 (2603:1096:820:d8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6020:EE_|KL1PR06MB6733:EE_
X-MS-Office365-Filtering-Correlation-Id: dfd00e8d-cec4-4744-cb40-08ddd94562ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OfrEY+A3p+fhICUtdpDszw3iV5xs2okbp1D0iqmS6pZsEWOeVhKWiX9TT4Fw?=
 =?us-ascii?Q?0Z29NttGNlpXoG5ShpdVaFouRe04YEI7APukGhfnoz/tkoKWFBrD8MRlSUfM?=
 =?us-ascii?Q?S25vzQXIwP/8BThle0dZW4MWzvoU5RffSMVNyTVZjnJzZG231YBAdnhozcBn?=
 =?us-ascii?Q?C/IxvVDVbaqxGhFFGewn1cLF15PehqSnuALpFakKOZiqle5T8oIpsNBa5VuZ?=
 =?us-ascii?Q?TyglrR6N1nW1O2XSV9NPjEq6Imec7pLgYwZcJqYnYkN8q0bCl7rXeIrBZ3hK?=
 =?us-ascii?Q?JLHWH8B3OON9xW2sqlo8UDJ1NhBV/ZZfFCXGbJUjfMPbwZTKVUriAUufI86v?=
 =?us-ascii?Q?fqRjVoSsPEN5+EoHiGf8I6DGu+BlgNha7VcgvNzgoKASOYRqBjQT8LdFvSz+?=
 =?us-ascii?Q?0m+1ZS+yrTwo3dBh89PtSp9Ae8/UjJ7fxwtjMjcWJQbubAmLGzR9xui7hAfv?=
 =?us-ascii?Q?PqHoUJ3UKJiWCxvxcwRT9kAtezKQpJsekJR8mWWz5Ta5VZhAYVVXdQJgZXLn?=
 =?us-ascii?Q?RjYooMiK/Bv/OfncDOrV+L2htHFwxnouYX0FVG5QblQ/Gxixp1VHxW1KvPBB?=
 =?us-ascii?Q?Osk1g/st8h2re9sMVuV92+WM36WfxGQsii27UWO8iYT9TQEvYbqgIvvsqF9Q?=
 =?us-ascii?Q?dPS0mLsM9Dc7v/wF76NjN55N56SJPy0kCvKd+2CMt8o3oHRWQWvomIzg7RNI?=
 =?us-ascii?Q?4Ad2tYoHih8eEJOuYaoe3LX2nPJAx0lxiy8fpbDBPKfBiuofY289urlnvQJf?=
 =?us-ascii?Q?lHO9Qbza3VDVkJG/LygRQ3ENZECpCbXj4KlNXR5ZVouQm0qQ8FteoDaARyl0?=
 =?us-ascii?Q?wBbhNhIRtbo8b/aJ6hVqscytxy06WttqI4cJzLaLQkrFtmS8AsQ6OGsuqfv3?=
 =?us-ascii?Q?WK/VMf57seYtg3UWysjh7b0dBqeJv04dTzRRj0V0IaPDAN6WWd50gwlWOtpa?=
 =?us-ascii?Q?sKDUjjCLXhMkeC6JYqYyqRVQdebaW74lqPf/lBnt9yBQQKnjfbOVzo+dk5mn?=
 =?us-ascii?Q?dXuexGdXzl8UH/nMoTxxMZN6mir4zPCrbc9nBI9R5wnPJAiPNZmO0cOo2F+P?=
 =?us-ascii?Q?NXhNw6dgXJUcf99kggFY+IZ5OOhW7gGrQByyifbHfrNfN7vXKuQy3wIi5+fn?=
 =?us-ascii?Q?kk8E5vcL6CbWxwPf0LX+n8v1BhhhUqo4LE/0JjoF+ycUjxG7fFRyfpGHQMsF?=
 =?us-ascii?Q?EZKOff9rz+pylH0efibjv7mZN8+fqHhjgUXyJzA7VFuMbl3vgoSTocC+HXRv?=
 =?us-ascii?Q?/1v0j5z8u5vqtstT+U4IyvFwlKdqXb+XYxzG+9+4sp019VdmShIvBywX4WPQ?=
 =?us-ascii?Q?acWXcYEf2aQeh1Hla5YKlklH3KXynjiZzWrbcDY04t//25lRG9z2sLJlJ4MR?=
 =?us-ascii?Q?l4s0XnYN575Mz2bfpr7qx73YWB1yMHrh2gdGfmG19kG0LNfhBSPtFwWJJwRx?=
 =?us-ascii?Q?SvARI6IUsl/Shbk0ckL0NGmpiqARRP5mFuuLZX6WvO1wxzIzVOwJiw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6020.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WVmXIpdRewZ31029DMIFDKRxl0Sf/b0R1J1VLSdGmb/XPNVsvCTAT8b2yi8d?=
 =?us-ascii?Q?GuXfXqjbF2HetFw/KAsefSqc6k2/efQajFR69ke38Q5IVQ0/ddZvaY660N/h?=
 =?us-ascii?Q?Ce0VzdYgDh5DkdlS7Tfgr/eyWXaKEUPvP/ft94dVXHsZNPEtp5WJWlbtmdYn?=
 =?us-ascii?Q?Lg6jHxGpLDIMd7ONy+Bc03YkoAWxVaqN7WSYZcIp0NGfjGygxcDqGRtgFi85?=
 =?us-ascii?Q?cXx7NTxr8kLVH0Kny44NELo1suMd6hyb64zym2G/nHZxIj/9Rch4/2bmKnQA?=
 =?us-ascii?Q?ZbME4i76BhvXp1SIMPbimI+dU0eGSEw87+cqJcrHql5rTUUADV7iDiopH1SF?=
 =?us-ascii?Q?vwNl4yf5f+2mT2Bd2lXncJGJIg1hjffBmfK6D4ieOIYCwhoa1Bv2k6e4z4Zw?=
 =?us-ascii?Q?ulsCNtI93A5Rr/4geGQev6fy+XYT6pEXeTIuo+w1TJVWzFlG6aEbLUAj0lg/?=
 =?us-ascii?Q?37dP/+VJfDcQGTQmd5//2TsdbaZR2vHjPHfOP5NZC1Q/cLKMYf2nx9xitJCx?=
 =?us-ascii?Q?B9M+YSLXCptXaHELWcbd4DULXotSQbBkNYs/gHP7Lthb7nSVHIFO/C3LFXY/?=
 =?us-ascii?Q?4sdxg1kD6BhOQm/lWtkeHn6o2r32rFCJN+3cSnvSFSrj09E38xoCQBQMyFoh?=
 =?us-ascii?Q?gp39gSSoaWp+HPxnTICLxVsdw7EJkTLoSL858EJW7SF7HuZo/KZpjtfj+sZn?=
 =?us-ascii?Q?wH9+e7HTYRMmONeiVd1ZwbQNpZvCc8cn08LXNCYAaHSg8cSG3HWnOiggB02p?=
 =?us-ascii?Q?kQEuzuWo4DmJQ6cdnUgjsEtF7/fNqMqYo6c9D7hz5UMfTlndMH5HhzO0zEQn?=
 =?us-ascii?Q?sdiSghAba8EcYCG+u6O1gMFrPRoqMby7GdCPhkISXKPlGrs+z98nFU1mi89X?=
 =?us-ascii?Q?GB08//Vmt9V9eGZar2Neh87KJBvCFvGvqRQ8XqB5lx1FV+Zei0bGXowWPR0/?=
 =?us-ascii?Q?m3LNqaKFh5O0N2uK/vmdm2K+BZL/rsXRc4iLqJQyWIoHSGIRQ//KerkGeTI6?=
 =?us-ascii?Q?Qnp1Z9TR0XZRreJK0qcMKJw+fwrx1Js6hW0wsEp9Pyp+szQuMoUDOssq3wYo?=
 =?us-ascii?Q?9eqdEUxiSPK3MuWaZFCaRmsj9pwfHdBcD3tTYiGO8dFKk7oFqPqBb+rEEuL5?=
 =?us-ascii?Q?u9Pd8+vwFaQinUSWI5inpmMBhzM6xO+OJ9Vg8nZ2py4AV6oTYOPRS3cF5Xy2?=
 =?us-ascii?Q?T18nTu+zpeJ0xwchRGB9q7fnTfXmLZ1KgcJPU193BOanIoKyPN4xi78QWYq0?=
 =?us-ascii?Q?WhfWm5FP/2nwXsmG079IY7S8aebSU3l2jCSdyfbaSLEN7Xu4Xd1mUWm9Jtbk?=
 =?us-ascii?Q?sm2ZxM/DQUJYnvrWWFvxjuI8Iyarrq0DsFWUdXE8Vihdpa/AmPCgdqmQoFn/?=
 =?us-ascii?Q?r+EVBrZckDpeoRnTmnrodDMwpWaSfWNiqiFlU4BVIyOHGUcSADDC9PJDOv0C?=
 =?us-ascii?Q?D4Oji+OqLzzwbk1orXf6S1AiTleA4+ry5weypt3BcS2KcJ0grhtOBKCvJN9v?=
 =?us-ascii?Q?kXQA7lJQC/JvdyQpM6UviGbNCl3yQ9iwHM6C1/Bl2EPPM4Ujc7SPFFxgaUIW?=
 =?us-ascii?Q?n1Kh1X+ZoOG8hGNWTNuokG5rGr4WJJE1FjC4r3q0?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd00e8d-cec4-4744-cb40-08ddd94562ce
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6020.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 02:10:19.2820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DujYBCHCZ34pS8Tr+zwTNXURnsM0dd+3R6CY6SFnYBBQWsP3ZkhrDqiUKO8jHLhj9NPoNfRSWCo8gVJCmgLyXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6733
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_191045_150704_6FFF5176 
X-CRM114-Status: UNSURE (   6.68  )
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

Remove the parameter '*c' from the ubifs_crc_node function,
and replace part of the code using ubifs_crc_node.

Xichao Zhao (2):
  ubifs: Remove unnecessary parameters '*c'
  ubifs: Simplify the code

 fs/ubifs/io.c       | 13 ++++---------
 fs/ubifs/recovery.c |  4 +---
 fs/ubifs/ubifs.h    |  2 +-
 3 files changed, 6 insertions(+), 13 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
