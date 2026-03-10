Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8956FD2D73
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WytU3JWpZ9OcLnXYqv/SuFR+LqtbWbF3xJtI8Aq20lU=; b=wTIwugUB1UnlDY
	mi0+wqPtoovUEIExYW6W9b0oNzoIR67CLvfRIsZvvuRcNdoGKuTrk2QquhsF99Fg4dJsYlKt5jYax
	JaWmM50cvf35do+1RfjLL60fMW9SrUx5+bkjxYNhZ/5G9QYymfJAW1OfbB3s8zvMZ8ipE3MKfvLQi
	XgWvzqgV+YAeNccW0RD8gS9j3a5D9CeyInyaG5ejNKHb4MZ1vf9TS9C8pwePsx6ddG3bMDLYFnv4P
	qocp5s/fX/Ko0ZcUyvle7SY6IdCv/4+j2p+T9TAuRJCOSMYX4EfWEToNX+wsXn3KZWbS8wi2Kjiiw
	EK21CSShYT93MrWnFoYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvjB-00000009P9v-0J3f;
	Tue, 10 Mar 2026 11:58:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgk-00000009Ko9-0cXw;
	Tue, 10 Mar 2026 11:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TMYuXsAwXlZPj+pNBI19fXQVyelGTABQZdwu3TAkE2A=; b=S5Wx12drjA4PIhuiOq/J0hUO84
	yHlLhn/RD7u0tzMp4JxYy4KgxMzkH+K0lr7i/CtDVxAnHOIxfA1dxcgP8E3A/mQN3CvdLZfL5SHog
	COZBOAk+KmzWiVrzdMDcg3H1vjZcnoylDD1QRAAzFIvqBb8vUElW/WG7K5H+49IuNq7zCG7zzCfYu
	3MiEEDiPqWM0YOwtaRkOabNvLLXfj8MUiL4RCJ49Pt8TF822LcuVVb8i0Qg9VedNIUlPLGsslQRVa
	ekYSU0Yc1prcuVhAyE5xYBNDmahpfmzuKMIPpRCep3wel0cPnRdo9/pkEMvqOYqC4kLrvvuoPfP41
	Ouxo2aAg==;
Received: from mail.avm.de ([2001:bf0:244:244::119])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgU-0000000EQ7Y-03pa;
	Tue, 10 Mar 2026 11:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143725; bh=lEmCou71DQIv3rJiH+2ZIvzOcBQ45/hCLHA8fjFTjEM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AHWaJPiBsL+GwFoetOExpKLG9cmnqvpt8xMBxHRmuFnKfjqJNAZAD1Wuu27hEzCjp
	 yo/8LH57/iizP+bjiVmoMZwTMOiCMC/XLDqy5SSCcm+OQZZ/0iP8EPctZ2sQqxK7Ab
	 XT9/JQSyTpsDOlLEGnKt3l1avwq96+RDdo3lipF8=
Received: from [212.42.244.71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006ac-2367-7f0000032729-7f0000019d40-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:24 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:24 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:48:41 +0100
Subject: [PATCH 15/61] trace: Prefer IS_ERR_OR_NULL over manual NULL check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-15-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
To: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
 bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
 intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, 
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mm@kvack.org, 
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org, 
 sched-ext@lists.linux.dev, target-devel@vger.kernel.org, 
 tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev, 
 Philipp Hahn <phahn-oss@avm.de>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2257; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=lEmCou71DQIv3rJiH+2ZIvzOcBQ45/hCLHA8fjFTjEM=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAYJfb+qOowLIkUmfJbwapQWgbBrCmoY2MGV1
 kQO676TIO+JATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGCQAKCRA0LQZT0ays
 264GB/0ePCsoEZ4dvusK/+59DK+nFUG4TMYrwfcQ9Aw8geb+nDTbFBXmGXKhwNE0FGNMoZ9u6w0
 6Z8ff6aHriAkc9Kt7Cgo70KOX6BjUy2bKgpnqJ9UCEmLABUocGsnikIoRM/S+kmqBXC+hSxD7sM
 X70l7rxeP1jyVHxWJrxfa6E/R35lI3vjpmjnsYcBxz/fgBeGY30s+ys1gafR9RwiFHF5/fl9jcb
 Y3J+3Pom6JCnaZYPGyS2UG84plp5l+rENGjhP2UWug9tGkZ5pwYbuR79z7QaUT6EEnR3YbR314t
 8SpG12KL4Vc7ZU5W2GsSc9E64021CyFWbNdSoNZGwreTwyp2
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143724-764F0E1F-76E75FCD/0/0
X-purgate-type: clean
X-purgate-size: 2259
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_115541_164292_CC03816E 
X-CRM114-Status: GOOD (  11.49  )
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

Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
check.

Change generated with coccinelle.

To: Steven Rostedt <rostedt@goodmis.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-trace-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 kernel/trace/fprobe.c                | 2 +-
 kernel/trace/kprobe_event_gen_test.c | 2 +-
 kernel/trace/trace_events_hist.c     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/trace/fprobe.c b/kernel/trace/fprobe.c
index dcadf1d23b8a31f571392d0c49cbd22df1716b4f..a94ce810d83b90f55d1178a9bd29c78fd068df4c 100644
--- a/kernel/trace/fprobe.c
+++ b/kernel/trace/fprobe.c
@@ -607,7 +607,7 @@ static int fprobe_module_callback(struct notifier_block *nb,
 	do {
 		rhashtable_walk_start(&iter);
 
-		while ((node = rhashtable_walk_next(&iter)) && !IS_ERR(node))
+		while (!IS_ERR_OR_NULL((node = rhashtable_walk_next(&iter))))
 			fprobe_remove_node_in_module(mod, node, &alist);
 
 		rhashtable_walk_stop(&iter);
diff --git a/kernel/trace/kprobe_event_gen_test.c b/kernel/trace/kprobe_event_gen_test.c
index 5a4b722b50451bfdee42769a6d3be39c055690d1..a1735ca273f0b756aa1fcfcdab30ddad9bc51c5f 100644
--- a/kernel/trace/kprobe_event_gen_test.c
+++ b/kernel/trace/kprobe_event_gen_test.c
@@ -75,7 +75,7 @@ static struct trace_event_file *gen_kretprobe_test;
 
 static bool trace_event_file_is_valid(struct trace_event_file *input)
 {
-	return input && !IS_ERR(input);
+	return !IS_ERR_OR_NULL(input);
 }
 
 /*
diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 73ea180cad555898693e92ee397a1c9493c7c167..59df215e1dfd9349eca1c0823ed709ec7285f766 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -3973,7 +3973,7 @@ trace_action_create_field_var(struct hist_trigger_data *hist_data,
 	 */
 	field_var = create_target_field_var(hist_data, system, event, var);
 
-	if (field_var && !IS_ERR(field_var)) {
+	if (!IS_ERR_OR_NULL(field_var)) {
 		save_field_var(hist_data, field_var);
 		hist_field = field_var->var;
 	} else {

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
