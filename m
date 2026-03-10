Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123CCEB1058
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OjdASygV6Hx2Rl9PI3d45C+KqT+uzaUsx9l9KFi9HqU=; b=QJbaHPHX7mP00X
	4c/F6h4EoR0ulwOXM3yJ9ps5lvebbA2gh56mzMwKRplzIpSEG87a2YUHSiHXr7HhAwhlTBZAet0ke
	3uioVM8hlW+ckyD0t18FqBgIYn89zAQCrpxlN6+hyGLW8p1RRGojgtl00xmXu7nX2wSyv8T4BltpD
	bcNT60+Z/fPIRVZLCuR5hSqDTu8neJgEDqeQJg3qK7r/Y9FtFEo9O1qqj97Wg8IeF0OXQCct/waAd
	FLlRYKWJgIVc8DOnbmcB8Xp/gvWBDwKAk7yMAXiviKuPMR0Dj8t91k3UWV3TGOQEjEFcy/UiUZ6Wm
	VKw2l3OTOScLavnEN2tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvi8-00000009Mwo-0bMV;
	Tue, 10 Mar 2026 11:57:16 +0000
Received: from mail.avm.de ([212.42.244.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgd-00000009KZx-2KNn;
	Tue, 10 Mar 2026 11:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143727; bh=7QEjQvc53kHdYvJikGIe0XIqNo63J0gbffxhQyvvDmc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=xkT1xwtnaKnF5zwky80U90tVBtgjXUcX+GeykmrAvdmpppC5+8VK/cr2uIrG8dU1M
	 7wm2m1OyU4JV6u1islMHTFtIiUXXXY5n/w/md+c+5C+f1bhtmzGNVLxiuCLq3+FykP
	 yZ+BZpZfQ6y4Yx2gZPgoiPOharwFnkzMOEjjrW34=
Received: from [212.42.244.71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006af-2367-7f0000032729-7f000001c9aa-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:27 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:27 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:49:07 +0100
Subject: [PATCH 41/61] pinctrl: Prefer IS_ERR_OR_NULL over manual NULL
 check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-41-bd63b656022d@avm.de>
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
Cc: Linus Walleij <linusw@kernel.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=974; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=7QEjQvc53kHdYvJikGIe0XIqNo63J0gbffxhQyvvDmc=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAZht0v/gzetsO7BqEut/SimpAgjLSUxejqDN
 jYPITjd+qeJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGYQAKCRA0LQZT0ays
 2w/2B/4pX609pdZXvqHfb+Vqmmi/TuKtxSLe3zgXgKoCJW/gh17vsp/T22wIBqf6SXS4OIznDwc
 CqIbsgeOEAAlNDyBRYAY6KPNdElI/rv3fa2ORfx9RdjhIHa4x5wKb3P01gEbIVxJDT7L+eaQBY5
 W5yNdsizunhdj+FuJcUWkiWweG/sakXiGLIkqX5NlLESVIppvEGGOaxwjbsMisZ9PSaDKihHXQV
 LTJsTcuZgnx6Ly3LMJ0SQkiMEfMsx1Sbu6dG9rRM3ckN2uFTC5HrsnBNmmT4sZqY9FpULICBCkq
 q7sHGVDOpWpuw1oJ3VO2Y9YZsG2cD9KHQpB9olXNSESNKBcu
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143727-86C91E1F-25F0153A/0/0
X-purgate-type: clean
X-purgate-size: 976
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_045543_838922_37096A86 
X-CRM114-Status: UNSURE (   9.73  )
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

Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
check.

Change generated with coccinelle.

To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 drivers/pinctrl/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index b5e97689589fbf1b6750620fc193bc820012be2b..97a80989601abbe969d4b64cb0f3926fd4f291f5 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1991,7 +1991,7 @@ static void pinctrl_init_device_debugfs(struct pinctrl_dev *pctldev)
 	device_root = debugfs_create_dir(debugfs_name, debugfs_root);
 	pctldev->device_root = device_root;
 
-	if (IS_ERR(device_root) || !device_root) {
+	if (IS_ERR_OR_NULL(device_root)) {
 		pr_warn("failed to create debugfs directory for %s\n",
 			dev_name(pctldev->dev));
 		return;

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
