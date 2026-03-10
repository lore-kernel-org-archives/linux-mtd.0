Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355D2FD2D86
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KGM2em7fjI100pA6jqyp5fOGmAWRg7pT3BRA7Kf5sh8=; b=x0kIExnUAwcyJG
	h1q1rEWCk2lMQY1c+KR2v29sWcZT5MzhrIM0llP5GB0qnUztgS7dfQsWnozmjIypUy1rzTxBBBQEl
	dZqHh+LgEOhGytqbYOiJ9HNcXjAdsww/P8oqg4xC5pd5i8PQh0ij9MBEgi12ZFz2nGzDU0Zz25J1E
	JOGHDf1+kkzOeakCeuPEUu6HIOabdeG/zA0PwRJ+cbcBDib/UaME3XXgYUiqPDmCc9iud/BECjh88
	Nu2UJ0MnVt5EGu449Jq2bfd7TvtUyVVfk/m04m9ZOSh1q9rVCSSHifhr0VS/1Uzd0uI2y+Qd0+/o9
	bR0MjzAbf8Y3nx1aGN4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvim-00000009OP5-2V5b;
	Tue, 10 Mar 2026 11:57:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgj-00000009Kms-19iv;
	Tue, 10 Mar 2026 11:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=uE139u5zoua9TnetiXGtcYlFuz9R+VpXRn5VBlrCpnQ=; b=H+kym4x+kBs1D1inN5iW5E8f3L
	ErEEAir1syofsovpY4uQykOfSGAodg7up+yhnzXBFI7ZGCANp0Em3fdvdjG8/icabb+7kiwIDPONc
	S9eZPjvMyiQ5qUtfffCHf+qExgxLh/N0L1vaOOo6Sr6AJVnJA3rdmi5RpFPECLh6bL7qcYOBK/hXM
	M6V4xuzlvaBCL7F8JgyHWs9DEjJEKXVYojOZX004SAvVLTMDvHX4i6ml43KTsY8JQ+59MtnNLEf2B
	jcVWjKPpJF8nfkmzzT6Qr+XUpcFI2ZXtL1eO15InFHYA9OkiX+fXjTR6tib7Cvi+l9motAz2P+g6/
	+ZHEiSjA==;
Received: from mail.avm.de ([2001:bf0:244:244::94])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgc-00000007lhz-2VM2;
	Tue, 10 Mar 2026 11:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143728; bh=u291MpoQyOoQ8laFPzXzGEOIKYw0K1QgWZAkzpMyO94=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ykq5xCtCLnpuisjh7yCkntpXVoj7+lenTonMwnNyj3HEswqyJb7tAewrRcpMAVrss
	 htdRzuKIhEkY2u9z8HmZVLAVG9LXQEK5KzfFb+glv/mPDwZDOJWP8p2pGfwANfwg8Y
	 cyh+Ai5Y49rs9bC9KZyLfdR4nR4N9Gt4Gg3G9z8A=
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006af-e21d-7f0000032729-7f000001ba8e-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:27 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:27 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:49:11 +0100
Subject: [PATCH 45/61] thermal: Prefer IS_ERR_OR_NULL over manual NULL
 check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-45-bd63b656022d@avm.de>
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
Cc: Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1238; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=u291MpoQyOoQ8laFPzXzGEOIKYw0K1QgWZAkzpMyO94=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAZv85jT8mK77P0DgzyoB3jbjqxnd52qin/43
 73TECCS4NSJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGbwAKCRA0LQZT0ays
 2zstCACwpYJlOocsZ3HBVMWCF0IhNq09wby5LkvAsENXavKVYKWH0lNK553mHyG2L0hqOjwgfmQ
 2R6ChfeUAdB1pLjTViMeeaIXq4AlyCRjEyAsVR/bQ5/US1JrFGhJzXarTPhODhjHiBoPAuzZhOB
 8fipmcjA1HLbJFaREcynXwQWmFtG9ouLXgkvipVtzsg9HQdQPWOUefHLkAAvMOKdk+hmDB4ECbB
 NiykkLaAUziz7cfWSAQQRPcA1Gr6EaK8Vw6tF4Kl2S0zRlJlORdN+u8vB04XH9TW/DB1ISJvpll
 cqhryBZ8g4FfGeREfmgUyiQqqlzXdeOdKWH1FU8uNB4YFH+q
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143727-7DE07F2F-8C4B41F9/0/0
X-purgate-type: clean
X-purgate-size: 1240
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_115543_708850_0EA54416 
X-CRM114-Status: UNSURE (   9.67  )
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

To: Eduardo Valentin <edubezval@gmail.com>
To: Keerthy <j-keerthy@ti.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
To: Zhang Rui <rui.zhang@intel.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org
Cc: linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 drivers/thermal/ti-soc-thermal/ti-thermal-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
index 0cf0826b805a998abd0d4e2cfa6938de8a46c4f0..9218417e6d923ec370e032f5b91f9a839fd293f4 100644
--- a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
+++ b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
@@ -228,7 +228,7 @@ int ti_thermal_register_cpu_cooling(struct ti_bandgap *bgp, int id)
 		return 0;
 
 	data = ti_bandgap_get_sensor_data(bgp, id);
-	if (!data || IS_ERR(data))
+	if (IS_ERR_OR_NULL(data))
 		data = ti_thermal_build_data(bgp, id);
 
 	if (!data)

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
