Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8143060A3809
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 19:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tK23KSZC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=YbrVPBhO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cgMO+mk/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=DBMEePrIztO+8Kf1FH8LnQDuVr7i9OuYPUOs2o4YraI=; b=tK23KSZC7zykvFsIWm/JYgu87P
	MEaWZHyt7vUEU4BNrvGDf0J/HBfUgYDYWEVtRq1Mr7DAd8AGQ/WN1VqfMe8hpqxn6ffKoR2TgL3nE
	VwBxkOWYMysc5vzNUyFc0zNzlqc+CkE86M/rK+N18pjnzqGHl9ePhvRj1VDSg27Z1DPuJR+LyJJSA
	TwumTjvKEDcAX+xCiYiOZF/LRDBznBeZwoGe7k0noOwssX5yW+cbtNI0QUQvK8yuWto29P+2YT5qv
	w1ruzO5y0fbAi0ow6u50H+k9uHJAU3fiCYRLOF0o4ALRJvRDGAvfnxGccmC8s0oI6nKKHJnQgitG0
	+YuR1fbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7m1-0000000DCUq-45mk;
	Thu, 19 Nov 2026 19:26:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7ly-0000000DCSp-3OHB
	for linux-mtd@bombadil.infradead.org;
	Thu, 19 Nov 2026 19:26:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ed6ZuPWwDHIYUoQ+FZI+Wi1n/4SIGbM4V5gI4MqacGo=; b=YbrVPBhOMNQ2BLv0LLn0NBuJ/7
	t4+lNDed5w4ef3BmnIMYtyjNwkMxoC9W/iR+/zgJPZXdHp8KzhO9Cu7Yme0u23iTFCjmwGKzGYIjE
	8n0Uq+ytd5C/WUuo326xz62FDLOoK5agsVGfjJoQYv74AzkXsXTBDK8XU+4dS02Jtg1XqTlQS6pTo
	CwEv3XfMWjcCNoIwiw7e+vNi7HngGzA9Hbj0xz/h9RQaIRy/kLKNGeG3Si4kEa22826MG3fAMQBI3
	3EARrRnTW0Xsndpm4EaLtCIfKmweipX7JVn8LdC9Qw8tkrXwutBN+DLqqlIoOh2J+X5Mjym0zR+x+
	xkAL18dQ==;
Received: from mail-dy1-x1346.google.com ([2607:f8b0:4864:20::1346])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7lu-00000000052-3EZ9
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 19:26:17 +0000
Received: by mail-dy1-x1346.google.com with SMTP id 5a478bee46e88-38531c1a566so112260eec.1
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 11:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116371; x=1795721171; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ed6ZuPWwDHIYUoQ+FZI+Wi1n/4SIGbM4V5gI4MqacGo=;
        b=cgMO+mk/KynZSDWmkvLpK0UrfVm5sQ2NsiBPb1yvYBjug90FNbQ6JU7qUelPXhjPna
         IPar03JiFmEDVnBBkbNHM0xJ1bVt4838C51WdWmHz4SIwP+F4zR55Az9Xr7oWwS0ANrd
         hYfapoagCH19ahwyxh876aL6i2smm/Fh5ZfcwxDtEktKqkGXKCSj+aqCo4z3wyER5cRF
         XzLzVqln8LLtGWxX50gWPT/DyITMU5C8RZPY38W8lSVOL+xa9GAzLMjIOQUpxEMeYnoA
         sDiRtgUtZpHRkN/JeLw8ZYOiXvda6B3CDG8u+Gco7TxDZX0gxNR6u3Ly3kNBrlRw9yMc
         iWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116371; x=1795721171;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ed6ZuPWwDHIYUoQ+FZI+Wi1n/4SIGbM4V5gI4MqacGo=;
        b=N1gGo1TBu0LTmCxw/Gh8slElCjrzYBDq88Cjd34rAjPvyvkThI5CSjONkpvy2LE/Xf
         XAJgwhephk7p3t0D1rqs7Q3GJnRW46z6DN376KYk5QPZdr9IYYMYCWnj60KJUSekbxxi
         fsU5n99VgDuwpmAxST5fziAjKoRyp+GR/jpCfFYgzmk8grpmswEJ/f9KVM/l9+xyW5Bm
         IL30kiCVk4wqchdljX9/v8eOAOLD9wrUg70yes43B/4U4SPZfpfaejyQCNs/7SuR0pHv
         OmpzBBIN5G2Rpw9qDgjym8xXUYVlUAQseyh61jPPs6qB5fDppDb39gaYXk8aw6lYVVgb
         bPZA==
X-Forwarded-Encrypted: i=1; AL+hErFB1DfbWyC/bXhzC8GN56tdV9EmXVB5wI9CXdbuiqdYWYo+GQVaOIxc86XrT0a6YijjOukOKqnBJR0=@lists.infradead.org
X-Gm-Message-State: APuU4Z8LdP8Yu2mUlVLDrPKjIntFczTA3dl/4kbpYVKIjgnf5juLcUrT
	gY6tcHRxcuJ99fEqZEwure4ZTqjkBWwhQGGf7UoKH+Xk7nL8TDAx6TSjqHPs3EUQluvELv9ujWa
	Pk6e5FwYS5w==
X-Received: from dyhd22.prod.google.com ([2002:a05:7300:8296:b0:381:d3ca:9f05])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:6018:b0:381:9593:9984
 with SMTP id 5a478bee46e88-3857151d6abmr284926eec.37.1795116370935; Thu, 19
 Nov 2026 11:26:10 -0800 (PST)
Date: Thu, 19 Nov 2026 11:25:19 -0800
In-Reply-To: <20261119192520.1983406-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119192520.1983406-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261119192520.1983406-9-irogers@google.com>
Subject: [PATCH v4 8/9] drm/amdkfd: Free queue in procfs_queue_type kobject
 release callback
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
X-CRM114-CacheID: sfid-20261119_192614_757327_2C8D89F2 
X-CRM114-Status: GOOD (  15.03  )
X-Spam-Score: -7.6 (-------)
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

struct queue embeds a struct kobject (q->kobj) for procfs entries, but
procfs_queue_type had no .release callback and uninit_queue() freed q
immediately after kfd_procfs_del_queue() called kobject_put(&q->kobj).
With CONFIG_DEBUG_KOBJECT_RELEASE=y, this causes a use-after-free.

Add kfd_procfs_queue_release() to free struct queue from the kobject
release callback, change kfd_procfs_del_queue() to only remove the
kobject from sysfs via kobject_del(), and drop the final reference in
uninit_queue() via kobject_put(). Check q->kobj.state_in_sysfs before
calling kobject_del() in kfd_procfs_del_queue() to avoid warnings if
sysfs creation previously failed.

Fixes: 6d220a7e7971 ("drm/amdkfd: Add queue information to sysfs")
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 12 +++++++++---
 drivers/gpu/drm/amd/amdkfd/kfd_queue.c   |  5 ++++-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 6663718fb83c..b349e0d8d47b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -512,7 +512,15 @@ static const struct sysfs_ops procfs_queue_ops = {
 	.show = kfd_procfs_queue_show,
 };
 
+static void kfd_procfs_queue_release(struct kobject *kobj)
+{
+	struct queue *q = container_of(kobj, struct queue, kobj);
+
+	kfree(q);
+}
+
 static const struct kobj_type procfs_queue_type = {
+	.release = kfd_procfs_queue_release,
 	.sysfs_ops = &procfs_queue_ops,
 	.default_groups = procfs_queue_groups,
 };
@@ -552,7 +560,6 @@ int kfd_procfs_add_queue(struct queue *q)
 	if (ret < 0) {
 		pr_warn("Creating proc/<pid>/queues/%u failed",
 			q->properties.queue_id);
-		kobject_put(&q->kobj);
 		return ret;
 	}
 
@@ -697,11 +704,10 @@ static void kfd_procfs_add_sysfs_files(struct kfd_process *p)
 
 void kfd_procfs_del_queue(struct queue *q)
 {
-	if (!q || !q->process->kobj)
+	if (!q || !q->process || !q->process->kobj || !q->kobj.state_in_sysfs)
 		return;
 
 	kobject_del(&q->kobj);
-	kobject_put(&q->kobj);
 }
 
 int kfd_process_create_wq(void)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_queue.c b/drivers/gpu/drm/amd/amdkfd/kfd_queue.c
index cd41b10e0873..636cc894223d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_queue.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_queue.c
@@ -83,7 +83,10 @@ int init_queue(struct queue **q, const struct queue_properties *properties)
 
 void uninit_queue(struct queue *q)
 {
-	kfree(q);
+	if (q && q->kobj.state_initialized)
+		kobject_put(&q->kobj);
+	else
+		kfree(q);
 }
 
 #if IS_ENABLED(CONFIG_HSA_AMD_SVM)
-- 
2.56.1.708.g77570a6a1d-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
