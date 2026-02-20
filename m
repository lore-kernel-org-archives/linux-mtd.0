Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E42C55AB9
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Feb 2026 14:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KHaCy3vjRb2/qb4r+R45JiP35rrPPXrLULWYM6ltQFA=; b=hRcJG3BxjZ8SF7
	X9FTIx+YNoJ5UK3zDLMmdt/eiyhvDvuACRJHNuFcTosNhWHWTfM9QA6H59SpYmJzqmlpZ+56Vm33v
	VdPlAQqShIFMVlnMTx38E8iqPJ4ITNzBTieFy3/J7UUfycNFP05HLME0EfriH5q4cZh0AVS7XhKPm
	d1HFXNmwSwdQ8TMsPOv7kib2KaJtM/60Krncp3wrboNq7VXzpSUD+pxBw1uAwC5KuUtVRgizWMBqC
	TyHmDsXC5K5Std4Jp5IggtLVfqXbomeJ7LxvNy6cfJ7JfY0MPB747qeW0oR9lHeAjXoxpGkerPC3M
	endlWsFMo+M1vBDlRtbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRLE-0000000Elzr-1QPl;
	Fri, 20 Feb 2026 14:18:48 +0000
Received: from mail-australiaeastazolkn19012012.outbound.protection.outlook.com ([52.103.72.12] helo=SY5PR01CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRLB-0000000ElxD-3509
	for linux-mtd@lists.infradead.org;
	Fri, 20 Feb 2026 14:18:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EUxTi85pVAtNb/P9QAqvVnlRXz3mRVqEB0Bzhh+pY9q5wgcwXDYn6OyWWu2/PPIYPgQ9ZrWfqkBgIM4nrqjnJ+f3ye7uhDhtTJE9let4Y2X3KthvGeGHspU/jJ25SARDdJRqRduWp5KkHaHL5QlVQ4zyQbaXVUPIcT2cTapI8F415OIXXrlyuz9rPDrkQuFtQcWVi1EJTBctPi4josV9HeTDTkIKbHnuxI8YLx+7cdyE12+ngr2sop1zs7VAE3cbtRoncE0dUsTXczX6zyth+iTxx3LTx18SEZVf2HlneE7aVNSoqmmq9kUK90gyMQ1nLH0AqmAM1Wnb/T60TvYkOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=le8Uat6K9KJ4/7dby4wGRDGsHBpDyspwtQe/t3fqeFg=;
 b=Gkz6lHG8dQFDEOk1ZcjzJO/W3jFCEN0CwH9v3AkpUCOnZ8UVSsL2VXQFOfxqyRM41YQP/kOAESSu8G1ZE+ARrQ8nIsyNrHC1zZZQ5vgyqIMszciK/2cfcttWm8TV/UQ6ibWRAowxkvgYR1V7KqxcJhpIGhfQV85mc0VGyG64HmIkjL5RbHPPb4J/BYW6zBTl5SCGZVKPIuLepzJbmvNhIHPUvovcPZ/SnzGXTTeJMMId3oQ3Q2GTxQ2Yavp+gydo7EQ0rNc0qGjvEWF5aurJMK80Cipv40Y2wquesob6u+QA8Xdjfp6mTWGQsKu9KcG67UBfG2VU8SE3iDjHCFAiXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=le8Uat6K9KJ4/7dby4wGRDGsHBpDyspwtQe/t3fqeFg=;
 b=Xy6IDCStZRGkBzS555ewwi2AIWi8fjSZrMDYBB87fH6imlLUgOzPCOKr2gOhql16pAWQQesDaFTG1F9iZkYOp5LzXFbiMjjxgt9A4d6cyBmH4twGEsC9PT3HMLrCnoCaW2sfOjdJ2yQK2nRdBocPI7bujfaHUiG57enEmlfalNRhAIT2xc1lodxdxNtAx1QArzEEBiRjQrO4zSYcbABm0lnIE88w4zO38xRGP5lSV02f5GDP9idyNnnvTQ5I4hVwDJvnAbbzjO3s1/ihN8txS8S4yVcCa555PBswhaYW6QdKQ0ejOjyT2P4sT36hh95f0e3c455RaIEBC0xdO/XgIA==
Received: from SY0P300MB1556.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:2cb::17)
 by SY9P300MB1531.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:2d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 14:18:37 +0000
Received: from SY0P300MB1556.AUSP300.PROD.OUTLOOK.COM
 ([fe80::8273:e3c:7a1e:4f8e]) by SY0P300MB1556.AUSP300.PROD.OUTLOOK.COM
 ([fe80::8273:e3c:7a1e:4f8e%6]) with mapi id 15.20.9632.017; Fri, 20 Feb 2026
 14:18:37 +0000
From: Yihe Jiang <he29@hotmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: Yihe Jiang <he29@hotmail.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] jffs2: add erase_on_mount mount option
Date: Fri, 20 Feb 2026 22:18:07 +0800
Message-ID: <SY0P300MB1556E1473F8D2ABAF56AD23FC968A@SY0P300MB1556.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.52.0
X-ClientProxiedBy: TY4P301CA0063.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::9) To SY0P300MB1556.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:2cb::17)
X-Microsoft-Original-Message-ID: <20260220141808.15912-1-he29@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY0P300MB1556:EE_|SY9P300MB1531:EE_
X-MS-Office365-Filtering-Correlation-Id: f41c544e-8b39-45a7-d156-08de708af020
X-MS-Exchange-SLBlob-MailProps: WaIXnCbdHrPy8Gg0T1tV+ubdyTLMpos/AvIOSg8iNoN0XCCtoQOec2jYRxEczCKLfkiofBVcvHHACxttfEmyC7xX+96kGsGIA2RTA/fVfiTaRusTwAaQCO94wgWCSFUYjRjZBu2hE+fJCPgYvGzFysw5tztbvYcznYkrW/q8MY9jreUc7AsmirQYlHIz+ElAAIbAt6Tee0gydvJwTtvNsHPwuTKKRa7BF1sz4ONaIUbxS/T5dtyAg1QB39z3nfN7QA4/x52uwsFdaqoCbi5uqAuBIEhYeRTaiRxF9umL9IvPiZN49XympkjkHCzN765a0P/dW9yFvFfgMPiF8sFs0Gc3c2EuExVbuRRn1MUjdu7GPa3pFVhr00zfA4ycRg2Ldi8d0o9g++Y9CKBG2jXR68R2wEfp399f87sESGw3MNYPHeoPR1wp8iEs6NhlazAvp2m/UUnIR72p1uM1wE0MDZah6q/Nr+x8Jc3TBCFYwviAU+NdLNV0ppGynB5OogzKUSVUFI45cpktVNfxaT5LbpnpeaPPROlyPu+EdxBcDtTMJC/T29ZdMmBMsB9KRLUwtZbSDszvZBnnYROBI0lfJDrLYFG+xNs9urvm+T4iwpuV24pI8kRpf1ipWgV6tJc/c9HQ5HizXzuWzejAo5kiovskJjFo3xm419PUi08hyBU6vKVrVLVlQwi/dBk3SVNHbJ4sD/IZlFS+GPd+aCqruGKv/IUS6JxRVdiE6K6gbzlkg77FfRzR9HFIRz4jYB2A8fuMOyAG6oU=
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|5062599005|461199028|51005399006|15080799012|19110799012|23021999003|8060799015|41001999006|40105399003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4sKBlYnbvY8pbd6/d5OL8OY+gxo9fOtf7OSXzz4W8cironAyaHYVHeqc3ldI?=
 =?us-ascii?Q?dJSY/U33JTUOS/C6zz021IEmDNI45feWLr3482cz+DlD3UWV/1v7S+me/RwA?=
 =?us-ascii?Q?gswsINBcNzOT+EvFvOxCPTI8AxLSM30il8M2Jls+CQRqpHb5XNLlpTHFLdtK?=
 =?us-ascii?Q?3f/f3njWtfAcVhp3sOBzk6mCoIl1M7ZU+VTae6QCxEr0sPoJkStJ7AgJc96R?=
 =?us-ascii?Q?XR0yhgDqwKnEucB2pm6G1Xkawjj3B1KDVha2QAjGV6sUCWDm42U09FMKNLqP?=
 =?us-ascii?Q?dhWmeNFzZOy9cko+EjHU3C/sUYfQDZ9hxCaJG9XV9AcIBiAEkr4yzHmgenuY?=
 =?us-ascii?Q?EWHE95o+32QGdcvMBUpFh6CEySd4uYDHgh2GjUvU5E8K4Hc3YxtPwNu+ZALw?=
 =?us-ascii?Q?clrgrPgNr2g2VNeDAZq1/YpcJBs5wddolO2hJX8snlGdl/HCGy4v9YP6cIMJ?=
 =?us-ascii?Q?Pzu0AleON7aLU5SvBweTataiQa5H/lKK33cPYlUDimHKxV6VOdLo1Zrgl7e1?=
 =?us-ascii?Q?BrbaH4SrDWveCY0Dn6qAPHMxffZDNFe4+Bglf+c2OGoXYbYR6EoJKPc+fn6k?=
 =?us-ascii?Q?JixGH/5FYEpFqvixYevxvZLYu6kdz/qxzyQwnpVhWTFxML2JfnPIzTJhUGuG?=
 =?us-ascii?Q?zWKWO9Zcy7Rk+wko6ZR1pPfyZxivxCqI2Pb6+dFhJV+C2wZuG0sya/lDWyVu?=
 =?us-ascii?Q?E66KD8JVqxD4wQMX7GJc45Zrioz309P+TE/2NSCsZGKZ0I8B02serGenv9Ry?=
 =?us-ascii?Q?i3QKicQv8pLETxs/7tCItOerCG22jicH2dZRR2PiVyq+rPwo9MFg0NFvEqpH?=
 =?us-ascii?Q?PUu2Wzq9GU7ROdbwxwN7Mnfi5xgq6SocuwXuDprzLFSDX4D/nyD5XmfJ71UR?=
 =?us-ascii?Q?WFp7PmU9YphfulFq9Hin22lEkFcdPXmI0LeFQMeymEK12SmrVO7HegblzdWl?=
 =?us-ascii?Q?GytU0lxSfX7R7FsEAwGkI7h6n42YQ+QUDeJvr5ltILOxgbGK17ZhUrr6PQXB?=
 =?us-ascii?Q?OFIqOO+OUxsBxFHlHAz7HHk0woyq+qS4RcISDAf0dNcKHVbhVezAzhAlcVnh?=
 =?us-ascii?Q?cYYJPeel0B/dS+1dxDfDpSozM+Nngy3vkGK863O/Phwd8lG7q9+GqCLZGxID?=
 =?us-ascii?Q?A2Dj1YpncmTmmrPVRKhZ8QCTn5US/ww85LF+rPoxI3OfIbEvwjHhHXRBWPUX?=
 =?us-ascii?Q?SohZorMcA/jKtvfZD0B5gWrXolUKK1AphPe34tIWPzaxfgaStLjmhGZndzNN?=
 =?us-ascii?Q?oBDfLS6kijlqP5u5/O0C294qZ/6l0rB6M8pv+gnw/Q=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MpGDR7/VoxMukydGHurNZKKSHaXg2YpktxAjHVdmAAiOwO6/qy/gGJnYlKL2?=
 =?us-ascii?Q?/QGa/SNZL1Z1MUVCzt1Bj9v9Xbx2BB60TkARRSR2vMfBLDJJOAp7LhvapOiD?=
 =?us-ascii?Q?v58RjmGrjG7L2XdX5Xu3DNepJL0DrcvsGSeUkVf8iIFPxPlOssFtLWQj61Nm?=
 =?us-ascii?Q?61yLZxBlsZUvHoyi4IJ7JP2oD0VrU9s1JVzmddZIi2jalxhwM3Ee5dQlzgvh?=
 =?us-ascii?Q?CCFf0jjO/Img+pYwMVp+FAtRqiO7Qn2ykcZNLHzBm+baNhKwb5JfD32AkThj?=
 =?us-ascii?Q?s5uCYFgoo0FbH3kj8y4fj6q2rrmv3dxoS5QBmkHLNSrwiYGQmUH9eUFiPjxB?=
 =?us-ascii?Q?Tgjj+qQkXWg76Fb/RjecUnDiaq5TSa8JeFplj9iU3M6XAC5Ys4ZPTurjZiVF?=
 =?us-ascii?Q?EQ/BhcPONwqZMVhZNzsWejwR/G2n22xaHS/CDaOFcaJfEkCVSOMLBvJdDIh2?=
 =?us-ascii?Q?LygxRxUOpxdtrAyb96bpLC7ps1SC7irzmWqJ6tOQ6SoGOCTz8QfG7xhdB+Bm?=
 =?us-ascii?Q?WjlIGOOGNgA9MZmJR20gTQ+K6EH07Vi4Gc/EnYu0A96F1Mh36CCJitRlZH4I?=
 =?us-ascii?Q?6HsCyLRLr4tJ0OvWhmBsJVRYdlnmwr11r2ayxmluO1AoRB/yyvJEvclaOq0C?=
 =?us-ascii?Q?N6Jy+FM0BEfq7rhdThVL8ep+HPvtQCmjPU81IJNLqQ3/Gs8BCW8EbyIQ8+Wj?=
 =?us-ascii?Q?gYJESrPlMEbipgYE0JlMqjxCQaFrFulSb1+dKFVzBd0Q7CwvJxwiYPkTrAmX?=
 =?us-ascii?Q?0XOTfPpIwOMo81OCf4Gtr7c+8Ql+TwG6/RWKv49X6WfgTt4WZ5JU2D5UyzYT?=
 =?us-ascii?Q?rp0zlSuNpadwhap1Oe4HkTxIYPfCL6Nm+/ONOWZHFQocet8WeEnHG+M7vp9e?=
 =?us-ascii?Q?tFkeJcKGj1rZcQQVr45PMBO0jqHKY0MLymfhiyWdENuK+RZYaqCcTlLny9T9?=
 =?us-ascii?Q?QSP25cJsTqILimMheDVWUuGnnDyiebsGyTblnYuWu4ZZkMqVFcaDlff0o2do?=
 =?us-ascii?Q?g1y8qBqZRwkbhOhqoL69/9zR6L4mZRGVKOIAU6ojIq48NSjwX/e5g9vJsuLj?=
 =?us-ascii?Q?Qj/Dk/AW2bAHyQQMIAzIDL0OwTaSmCckGEzT/LyVfqf/VGnlvNDsgTdF+rm/?=
 =?us-ascii?Q?hnmYae+dRh7krfZ7/1IoaxXEy8bsnkqoKYNLVZJ3i03x80VjxCNwnNLEHmBl?=
 =?us-ascii?Q?Zx7gyiLdUuqL2FzN2pdq5lPiXelIH/t7b5hEb0nH+TyhDdQyMO+ABPWaoVlr?=
 =?us-ascii?Q?jovdGRpFeSVBvEkc+VcWdA/aMXQfAnF6McPBePGJ9xszkRY1gY1Odjiu54Nm?=
 =?us-ascii?Q?UQOXrjXDmMnSgwwHlbi+p5JT9K20+qUkA4dBXRx/c0T/4w5rCcPcTXBItZQV?=
 =?us-ascii?Q?Ph7bKHs=3D?=
X-OriginatorOrg: sct-15-20-9542-1-msonline-outlook-c4d2e.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f41c544e-8b39-45a7-d156-08de708af020
X-MS-Exchange-CrossTenant-AuthSource: SY0P300MB1556.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 14:18:37.4336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY9P300MB1531
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_061845_807196_BA927341 
X-CRM114-Status: GOOD (  13.81  )
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

On some slow MTD devices, mounting a newly-created empty filesystem
can cause the system to become extremely slow, as all empty blocks
are erased in the background after the first mount. This can preempt
userspace operations and affect filesystem performance.

This commit adds an erase_on_mount mount option. When specified with
rw, all pending blocks are erased during the mount process, avoiding
the speed drop after mounting. The option does not take effect when
mounting read-only.

Signed-off-by: Yihe Jiang <he29@hotmail.com>
---
 fs/jffs2/fs.c          | 14 ++++++++++++++
 fs/jffs2/jffs2_fs_sb.h |  1 +
 fs/jffs2/super.c       | 10 ++++++++++
 3 files changed, 25 insertions(+)

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index 764bba8ba999..6a9f52b91e39 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -411,6 +411,13 @@ int jffs2_do_remount_fs(struct super_block *sb, struct fs_context *fc)
 		mutex_unlock(&c->alloc_sem);
 	}
 
+	if (!(fc->sb_flags & SB_RDONLY) && c->mount_opts.erase_on_mount) {
+		pr_info("erase_on_mount option set, erasing all pending blocks\n");
+		while (!list_empty(&c->erase_complete_list) ||
+		!list_empty(&c->erase_pending_list))
+			jffs2_erase_pending_blocks(c, 1);
+	}
+
 	if (!(fc->sb_flags & SB_RDONLY))
 		jffs2_start_garbage_collect_thread(c);
 
@@ -595,6 +602,13 @@ int jffs2_do_fill_super(struct super_block *sb, struct fs_context *fc)
 	sb->s_time_min = 0;
 	sb->s_time_max = U32_MAX;
 
+	if (!sb_rdonly(sb) && c->mount_opts.erase_on_mount) {
+		pr_info("erase_on_mount option set, erasing all pending blocks\n");
+		while (!list_empty(&c->erase_complete_list) ||
+		!list_empty(&c->erase_pending_list))
+			jffs2_erase_pending_blocks(c, 1);
+	}
+
 	if (!sb_rdonly(sb))
 		jffs2_start_garbage_collect_thread(c);
 	return 0;
diff --git a/fs/jffs2/jffs2_fs_sb.h b/fs/jffs2/jffs2_fs_sb.h
index 5a7091746f68..eb43416997f0 100644
--- a/fs/jffs2/jffs2_fs_sb.h
+++ b/fs/jffs2/jffs2_fs_sb.h
@@ -40,6 +40,7 @@ struct jffs2_mount_opts {
 	 * available space is less then 'rp_size'. */
 	bool set_rp_size;
 	unsigned int rp_size;
+	bool erase_on_mount;
 };
 
 /* A struct for the overall file system control.  Pointers to
diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 4545f885c41e..f328551a2e6c 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -91,6 +91,8 @@ static int jffs2_show_options(struct seq_file *s, struct dentry *root)
 		seq_printf(s, ",compr=%s", jffs2_compr_name(opts->compr));
 	if (opts->set_rp_size)
 		seq_printf(s, ",rp_size=%u", opts->rp_size / 1024);
+	if (opts->erase_on_mount)
+		seq_puts(s, ",erase_on_mount");
 
 	return 0;
 }
@@ -167,6 +169,7 @@ static const struct export_operations jffs2_export_ops = {
 enum {
 	Opt_override_compr,
 	Opt_rp_size,
+	Opt_erase_on_mount,
 };
 
 static const struct constant_table jffs2_param_compr[] = {
@@ -183,6 +186,7 @@ static const struct constant_table jffs2_param_compr[] = {
 static const struct fs_parameter_spec jffs2_fs_parameters[] = {
 	fsparam_enum	("compr",	Opt_override_compr, jffs2_param_compr),
 	fsparam_u32	("rp_size",	Opt_rp_size),
+	fsparam_flag	("erase_on_mount",	Opt_erase_on_mount),
 	{}
 };
 
@@ -207,6 +211,9 @@ static int jffs2_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		c->mount_opts.rp_size = result.uint_32 * 1024;
 		c->mount_opts.set_rp_size = true;
 		break;
+	case Opt_erase_on_mount:
+		c->mount_opts.erase_on_mount = true;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -228,6 +235,9 @@ static inline void jffs2_update_mount_opts(struct fs_context *fc)
 		c->mount_opts.set_rp_size = new_c->mount_opts.set_rp_size;
 		c->mount_opts.rp_size = new_c->mount_opts.rp_size;
 	}
+
+	c->mount_opts.erase_on_mount = new_c->mount_opts.erase_on_mount;
+
 	mutex_unlock(&c->alloc_sem);
 }
 
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
