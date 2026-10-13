Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3EFCC6B0F
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 22:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hLwzVT6jKkklbE6aDrBMLjQ4fzBnbeAxC9hH9+hByoE=; b=MCQAHLHqnTi4WhZnKLpe4wennE
	tgNLt+4WG9bqcAOjsB8JemGE3kaQyDQcnKDX+YAwa5Hrp5+pTUX52r5kA3R7xBbQLAvEvnyBycV2X
	0w8hRClCR4CGjDl8LVlyeapggjKkG9hoIMTrIeKBN2tRVxXqzkRDCACwzvGTYeQFQg5UdY6pzHZ+J
	cxdA8AzJafGQrdwuC1X00Xl0YJzsMu1NF9r9swQXXcqqIX8JZUdDtNnt50ggSVI6zXb5r7q8s2nvX
	HHCcAE2T2B//zDsiLJxdv9xFCwmlY8Wb4JaVxc1XEOVJCuSAQaC4KsYb2h+tIVLPcec3xuQqnxnsu
	qINnQM1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlAU-0000000E9QS-1unP;
	Tue, 13 Oct 2026 22:40:22 +0000
Received: from mail-dy1-x1348.google.com ([2607:f8b0:4864:20::1348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlAQ-0000000E9OV-2fuJ
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 22:40:20 +0000
Received: by mail-dy1-x1348.google.com with SMTP id 5a478bee46e88-351788121cfso4936551eec.0
        for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2026 15:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791931217; x=1792536017; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qdtOvNbLAOJ9idJnmqNXkxs2lXj3bNW1pL8KRmE6mUU=;
        b=wk2oYDsaPb16CHOvpCShzXjPyXSp2HNl1jsE9YDwFVU6DboFOK6hv1Xwg19rdVxNdz
         8GK8/2+pa6Noia/+4PgEQsGrHcfe4770YnOAW6DHS9dnm/YbgguS3DxHAT4AlOjdm/3Q
         nRQswv+xR1VUZzYRKk7LxOzp7z7jSW0egA17MM0IqGtVUNjjSzQfhRi0n17+Rblzg6NB
         oPVwaTq87WTdWq2pbgBfHq4Snq6WKQhSQasNONAIIfxjAKfu5HxP+j436DQvJQaMCK7d
         B1iJJNf5GuHRJPfJEgNrf0qEAdzkV8MJad6GY9Z1kKYKyWyBL9zT3DlLRKXb4e4BLBGz
         BgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931217; x=1792536017;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qdtOvNbLAOJ9idJnmqNXkxs2lXj3bNW1pL8KRmE6mUU=;
        b=0KXoozoJSlrlYRKkR0eWJqr+oC3ezVqaIETv72cL+pp3PeTqiGCSyumStMKHt7eatM
         f7HCjvDMgD7RW9gPullzk2kVWmRWEa/qgrU4dWheZRWEToF8F/6Folhj6GC8RxU1T/hJ
         3vF5UGw1ffpQAH2c6SR3vEFwGVKQxdFMwRX0y9nP2CCO2ye4aG3S1nySgyyqITKsdwRq
         YeONMCWpf8E11QhvrcHSCrCoFO6+YoMitLK7yeWncQjfQkJSuTNPbIkWmcpP4/IY02/2
         Ykn++ZFAkRq/XaYhmje+zTN+Idn5Oz8n/jQqnGbATEX1VTMEZvJtqhG82x+kD2P7VOHm
         RC5A==
X-Forwarded-Encrypted: i=1; AKwUvBypEqpuFs7bFtN5Q81ZzSvD9B06DqmP39OMURCMHvSlsFIS+AuMRXaQ+uDjkbvnf0//dy0IcY4iztg=@lists.infradead.org
X-Gm-Message-State: AFq9FYJjrmgYeOBOWYFof5+1ajc8NHCupqhVR7IdE5i1Prw6agsKIRwt
	4SG/RCH1qjEL5i/bup8xYErmLNr6WuWhJ7DxDBWsyU9z9BDGUJlzrJtx6MimpksxfaRy8S46s5R
	LpzhKuqb4+A==
X-Received: from dycrm16.prod.google.com ([2002:a05:693c:2a10:b0:358:f250:485f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:4141:20b0:35c:8d1f:5634
 with SMTP id 5a478bee46e88-35c8d1f58e8mr4713972eec.12.1791931216820; Tue, 13
 Oct 2026 15:40:16 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:39:37 -0700
In-Reply-To: <20261013223946.1836757-1-irogers@google.com>
Mime-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013223946.1836757-3-irogers@google.com>
Subject: [PATCH 02/11] powerpc/secvar: Add missing kobject release callback to secvar_ktype
From: Ian Rogers <irogers@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_154018_702144_0CD931B7 
X-CRM114-Status: GOOD (  11.84  )
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

In add_var(), a struct kobject is dynamically allocated with
kzalloc_obj() and initialized with secvar_ktype. If kobject_add() or
sysfs_create_file() fails, kobject_put(kobj) is called to clean up.
However, secvar_ktype does not define a .release callback, which results
in a memory leak of kobj (and a pr_debug warning in kobject_cleanup()
when CONFIG_DEBUG_KOBJECT_RELEASE is enabled).

Provide a secvar_release() callback that calls kfree(kobj).

Fixes: bd5d9c743d38 ("powerpc: expose secure variables to userspace via sysfs")
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 arch/powerpc/kernel/secvar-sysfs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
index 395399bbab2c..f3f6ac25ea78 100644
--- a/arch/powerpc/kernel/secvar-sysfs.c
+++ b/arch/powerpc/kernel/secvar-sysfs.c
@@ -126,7 +126,13 @@ static const struct attribute_group secvar_attr_group = {
 };
 __ATTRIBUTE_GROUPS(secvar_attr);
 
+static void secvar_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
 static const struct kobj_type secvar_ktype = {
+	.release	= secvar_release,
 	.sysfs_ops	= &kobj_sysfs_ops,
 	.default_groups = secvar_attr_groups,
 };
-- 
2.56.0.385.gd3acb90ef8-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
