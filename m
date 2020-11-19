Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DA1C5519F
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 02:52:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00AE0246C0
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 02:52:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="coomWc5R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00AE0246C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F7wZPQFjLtFQMKELTwxXwQ1sZCXHW5fbjz/CTUM020Y=; b=coomWc5RV55DwQ8/bLqFc+dFz
	OPPy+P1e3od1cBxGILflhl+q3uOgxCPpmZSpb0WKCwjNRAfG9TGkWWqxfkjyUlxxMO9xS4mkMS/XQ
	npcFRLgyEGOw+bS3rDRgQlPBSQ9zoGizkTaFtA1/Pi4FENn6aL9G8NZceT1jFfuH+rXkCF+sGGHXE
	1YvtSiSIAWCpAC6mi5ogBphuxmgE6zkaY0d4veMD95t7UtDgN34LPAE5+qqEWPbQK89RBTN2o6Gci
	YB50eNCm0AE6zvT7eKro0tW60krAnG6+lOPo/OJzdyVaAC5EK5hwnkZuIUfxy7Wk5VbckwTEKzWDc
	Lhl/veNmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfa2c-0005qL-Et; Thu, 19 Nov 2020 02:51:22 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfa2W-0005pZ-9Z
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 02:51:19 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cc41G35s5z15MtC;
 Thu, 19 Nov 2020 10:50:42 +0800 (CST)
Received: from DESKTOP-FKFNUOQ.china.huawei.com (10.67.101.50) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Thu, 19 Nov 2020 10:50:50 +0800
From: Zhe Li <lizhe67@huawei.com>
To: <lizhe67@huawei.com>, <richard@nod.at>, <dwmw2@infradead.org>
Subject: Re: [PATCH 2/2] jffs2: fix can't set rp_size to zero during remounting
Date: Thu, 19 Nov 2020 10:50:50 +0800
Message-ID: <20201119025050.38472-1-lizhe67@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20201014065443.18512-2-lizhe67@huawei.com>
References: <20201014065443.18512-2-lizhe67@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.101.50]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_215116_701138_B0AFB0A7 
X-CRM114-Status: GOOD (  19.22  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: qiuxi1@huawei.com, zhongjubin@huawei.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, wangfangpeng1@huawei.com, chenjie6@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Maintainer ping?

	Zhe

On Tue, 13 Oct 2020 19:41:30 +0800, Zhe Li wrote:
>
>Set rp_size to zero will be ignore during remounting.
>
>The method to identify whether we input a remounting option of
>rp_size is to check if the rp_size input is zero. It can not work
>well if we pass "rp_size=0".
>
>This patch add a bool variable "set_rp_size" to fix this problem.
>
>By the way, the problem of NULL pointer dereference in rp_size
>fs option parsing showed at
>https://lore.kernel.org/linux-mtd/20201012131204.59102-1-jamie@nuviainc.com/T/#u
>should be applyed before this patch to make sure it works well.
>
>Reported-by: Jubin Zhong <zhongjubin@huawei.com>
>Signed-off-by: lizhe <lizhe67@huawei.com>
>---
> fs/jffs2/jffs2_fs_sb.h | 1 +
> fs/jffs2/super.c       | 7 +++++--
> 2 files changed, 6 insertions(+), 2 deletions(-)
>
>diff --git a/fs/jffs2/jffs2_fs_sb.h b/fs/jffs2/jffs2_fs_sb.h
>index 778275f48a87..5a7091746f68 100644
>--- a/fs/jffs2/jffs2_fs_sb.h
>+++ b/fs/jffs2/jffs2_fs_sb.h
>@@ -38,6 +38,7 @@ struct jffs2_mount_opts {
> 	 * users. This is implemented simply by means of not allowing the
> 	 * latter users to write to the file system if the amount if the
> 	 * available space is less then 'rp_size'. */
>+	bool set_rp_size;
> 	unsigned int rp_size;
> };
> 
>diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
>index 4fd297bdf0f3..c523adaca79f 100644
>--- a/fs/jffs2/super.c
>+++ b/fs/jffs2/super.c
>@@ -88,7 +88,7 @@ static int jffs2_show_options(struct seq_file *s, struct dentry *root)
> 
> 	if (opts->override_compr)
> 		seq_printf(s, ",compr=%s", jffs2_compr_name(opts->compr));
>-	if (opts->rp_size)
>+	if (opts->set_rp_size)
> 		seq_printf(s, ",rp_size=%u", opts->rp_size / 1024);
> 
> 	return 0;
>@@ -206,6 +206,7 @@ static int jffs2_parse_param(struct fs_context *fc, struct fs_parameter *param)
> 		if (opt > c->mtd->size)
> 			return invalf(fc, "jffs2: Too large reserve pool specified, max is %llu KB",
> 				      c->mtd->size / 1024);
>+		c->mount_opts.set_rp_size = true;
> 		c->mount_opts.rp_size = opt;
> 		break;
> 	default:
>@@ -225,8 +226,10 @@ static inline void jffs2_update_mount_opts(struct fs_context *fc)
> 		c->mount_opts.override_compr = new_c->mount_opts.override_compr;
> 		c->mount_opts.compr = new_c->mount_opts.compr;
> 	}
>-	if (new_c->mount_opts.rp_size)
>+	if (new_c->mount_opts.set_rp_size) {
>+		c->mount_opts.set_rp_size = new_c->mount_opts.set_rp_size;
> 		c->mount_opts.rp_size = new_c->mount_opts.rp_size;
>+	}
> 	mutex_unlock(&c->alloc_sem);
> }
> 
>-- 
>2.12.3
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
