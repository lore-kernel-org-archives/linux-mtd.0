Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A917760A2612
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 19:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mQ3R7DnL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZXzuLad4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=591044eNIJ2I6r38/57c0jWxe41yf5BHYluO2YT9XEM=; b=mQ3R7DnLdXEFvE1B9PSph+QHwP
	lHr44m3xsfyiyWvmRg00BrNFBieLHVfcAq0L1ZTKpIO0JWiXKsyAmyiigWKdrRbkDtvVxxalXoMu2
	N6JP9Few2GnRRiKzlNxJhQDUMW8TiHKeIrry54AdyKxraAsuNY0dCNF1J1OSjukV5G34pfd2Dlll3
	trUGm1BoCv9iLJciXwnRtXYlkNMdQrdTHU+vYyEdjvFfWhR4NCf+aWWT+HQKcWWAyPbEGtamMiwFN
	HXLnHDes1UGL0yC7q8ZKA5hbk4qi886lvemZfIXExrJx0xHXr+kFxHFlO50BcX+X3HbbCc6iTHPZ9
	wlvMbeyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7lj-0000000DCES-1TOv;
	Thu, 19 Nov 2026 19:26:03 +0000
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7lg-0000000DCAA-1dGg
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 19:26:02 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-8b32efd7ec4so136393b3a.3
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 11:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116359; x=1795721159; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MCKguj/vcFyjyUsBFpEVwvA/Ew8DwdobaKTpU+d8I2Y=;
        b=ZXzuLad4+R7o8Oh+IsCRenzt6n+Xt9vaA55xVG24vk1oeKlA/YSjvgYu2NuvYK2lIB
         tGR0d8o1eyo2s/ZJbv2anden1Pv8IvX43ff/E5t60PJc4jeBwUpz4tzExp18kUn79nXs
         JjpThNJeODgKgidWCmqnpMbT1HuTbjN9PRQ6w1Z9hBbbtM8a7NRCWrG82wrxsJfPOrO7
         5gdGTpIY17X6j5/PU7wC8PS7GYySIFJu74wO0jqiU0k3Q5irktaxJw2dnd8FfpLtluOW
         Dq7HI7srWidg6mO3xAABiZeI4z7sAOFf6S1VdEqB18oAKXeTw4LUaQkontW2LusWJNpm
         pSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116359; x=1795721159;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MCKguj/vcFyjyUsBFpEVwvA/Ew8DwdobaKTpU+d8I2Y=;
        b=CJ17IRx/f2SjDB3NtQgOLFPlLyK+ZTlE9GPt6VG37MtVa3wTdJgEwM2ESEGHdpqUkT
         PYTq0GFy6zV/poo8u89WVQXdJuN41ySdV+hCcwgfhrUsvo8ax8kG5md4CamrgRjQSPSp
         Ch2LjqRn4yUeidFDzc1LoJyFE1fRcIsIiPP6CpX1XU3ZvBL21Zm9MrUd4GxQbKJ2/kh5
         uq7Q4YaECsryinl53HRcoNqnB1TmCdk3jajsRaJJidHxskQNyf1P/7uxsze/Jm5A4oqM
         zrRQg9ETyFyALNdEGiLaBmiilW4K+TZXKrCLt0B8FaOSF2qhR/HfeJr/Oi7epI2M3LTm
         VvEw==
X-Forwarded-Encrypted: i=1; AL+hErGoJmy+rBDSaYVNmF6Ylm29r6zfV1MKEhVIk1hrl4WxAi4wRWCZegPQklhhb57IatnG2nnDfDEttMk=@lists.infradead.org
X-Gm-Message-State: APuU4Z8GNKcBGfyWMPbCR6kMVQe8DnUP/4KUVYsmc/HYCHOr57hrNV4I
	dFQTcQf98bpRrk22CnatSWY6KUgjsiP0ZZR0e3WNo9kZeNdoWPiojrhG4kQ+aksiFL/ikIw8/V2
	y19jJHSJcRA==
X-Received: from pgjk11-n2.prod.google.com ([2002:a05:6a02:81cb:20b0:cd6:1fc4:6199])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9191:b0:3fb:1bfb:ff29
 with SMTP id adf61e73a8af0-4014e74d624mr589862637.69.1795116358583; Thu, 19
 Nov 2026 11:25:58 -0800 (PST)
Date: Thu, 19 Nov 2026 11:25:17 -0800
In-Reply-To: <20261119192520.1983406-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119192520.1983406-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261119192520.1983406-7-irogers@google.com>
Subject: [PATCH v4 6/9] xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
From: Ian Rogers <irogers@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Srish Srinivasan <ssrish@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Alexander Aring <aahringo@redhat.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Sumanth Korikkar <sumanthk@linux.ibm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_112600_447888_3FE8CDA8 
X-CRM114-Status: GOOD (  10.28  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

hypervisor_init() in drivers/base/hypervisor.c creates hypervisor_kobj
with kobject_create_and_add() (which allocates a dynamic kobject using
dynamic_kobj_ktype), and hypervisor_subsys_init() in
drivers/xen/sys-hypervisor.c then overwrites hypervisor_kobj->ktype with
&hyp_sysfs_kobj_type, which had no .release callback.

Add hyp_sysfs_release() calling kfree(kobj) to preserve the dynamic
kobject release behavior.

Fixes: cff7e81b3dd7 ("xen: add /sys/hypervisor support")
Reviewed-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/xen/sys-hypervisor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/xen/sys-hypervisor.c b/drivers/xen/sys-hypervisor.c
index 91923242a5ae..0e8a2cd69fd6 100644
--- a/drivers/xen/sys-hypervisor.c
+++ b/drivers/xen/sys-hypervisor.c
@@ -659,7 +659,13 @@ static const struct sysfs_ops hyp_sysfs_ops = {
 	.store = hyp_sysfs_store,
 };
 
+static void hyp_sysfs_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
 static const struct kobj_type hyp_sysfs_kobj_type = {
+	.release = hyp_sysfs_release,
 	.sysfs_ops = &hyp_sysfs_ops,
 };
 
-- 
2.56.1.708.g77570a6a1d-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
