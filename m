Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA69F3C27D
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ct7/oZL53t1xXfnjPIFGrWrsPHQ4IuAjjKkyT1FUdQQ=; b=wxD+7/ktWLmfxs
	1F+xav7SUOVD0iFvqWjVVnhXnfwO/AeW9ncPmuxHQx5LZUEdILXFy2/mM38zJc7XWvil8LYZK+LZT
	e49mFOGcR37gaCvIvny9rmnzFOm+VSIiSpSryFUNaOQgoH15ceAkALZf1biacpG+7Z4ZALx6FNBlA
	eRUSTZ2LXmos2xvV4FrEctaoIHSlzwq4XJkEM5qgFldQgK57hEg8j6MoAqRIkoquS2Eq6jP3tqOiE
	UXaBsNJOsqCIOtDAWurmTmwfSjSjG71eiCoG0w5572LT1Y4EfUklZ4sD8eORqIYGgjmVjDWcnz5G4
	yHVzUvJK+jwLoI9h/13w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvib-00000009O0e-0X46;
	Tue, 10 Mar 2026 11:57:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgi-00000009KlR-2RYe;
	Tue, 10 Mar 2026 11:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=+mEgDc6W6dmx2m0hBCrDKrYdyaZdhiJE+p4uCpJlqL8=; b=cJYdT/c6+qfylt3WRj0Yl2TiK0
	ZMfcnknUcb5bhN/xuXNu3+21i0U3MFIh6a5DGwwxvXFMBkgOCWSxr71hXL0EinyviYtzagP+Mbjk0
	zjVOJrcT00ntt8ituVwj4VzlCGm2Q9/4XvgcmVdAldM5lZIe2cWVieZxj6yExHHvXBSbjRdF5OimL
	oBbty1hU3iptZ12Wc9lEgnHqPAxqs7UKXfFE1wXvOhVMmg/hNXWj3ea7Cs9Xr1ZAPYMOsvtDcA5lt
	kv21ZuU6openuofu3zok7wFLjpZLFRswlxjW6UowZP2rbauCYKG3lO5tiOU7++leqYbulg1pFaKZb
	QkZHhWUw==;
Received: from mail.avm.de ([212.42.244.119])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgb-00000007lgG-1DeC;
	Tue, 10 Mar 2026 11:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143726; bh=MCi9bfMt/yjRjpkUd1ZhwbiaE2CmX7FKcN3LCeZC+s8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PKx4gVlkKTdBK4hC8DhkZHv6XjY3aXLFzpRRf+9yfpJ7sETH73wJIPUWVun5ApODc
	 fB1HpEzfhSmPsza3W/UlEsW+FK27FdFsyHgYe+IbnAc85JpgiLO0UqynRTi7RRWY3c
	 Qcjq/1RWaavgSPFWfIRpI/rqChIvo10IblUQ9PGA=
Received: from [212.42.244.71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006ae-2367-7f0000032729-7f000001c98c-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:26 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:26 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:49:00 +0100
Subject: [PATCH 34/61] arch/arm: Prefer IS_ERR_OR_NULL over manual NULL
 check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-34-bd63b656022d@avm.de>
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
Cc: Russell King <linux@armlinux.org.uk>
X-Developer-Signature: v=1; a=openpgp-sha256; l=925; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=MCi9bfMt/yjRjpkUd1ZhwbiaE2CmX7FKcN3LCeZC+s8=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAZJPXZg3WsXcrZtjOff8m1jvG6yKXz3axEvS
 kboSQL/SpuJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGSQAKCRA0LQZT0ays
 2zfACACzyLECzgi3MrIMlJkcwSfYhn2m+PRIL8f9uOY3XlWqWmweHlYuZj3OMlVlJtGjvYSQaMR
 9+D2tmynuqJf309fIXDWVkgzjy8866w+a/UJmSXv/T4izax84D3f8LghtIzFi7mZ97slccnBaIH
 bYp2esZnYrGMRYLzsh/aOQvmQdhErxNZysqZJWPMzNnDfK6XoXYg2wPfHrL2waLBmLBd1ruAh8/
 q/1mTUtEwi8tnMzF9vKrDxFY8VrHUkQh/DKxepIobrtB7u/NL1zHZyVzUjIKrp3fP30IB0/fbFP
 nBUcDJnBx61wdRtaxbBVJBgZihX6FfH11PRkPQUNc/WVeaiP
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143726-8AC99E1F-6B772227/0/0
X-purgate-type: clean
X-purgate-size: 927
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_115541_519604_77AA83F1 
X-CRM114-Status: GOOD (  10.14  )
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

To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 arch/arm/common/bL_switcher.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/common/bL_switcher.c b/arch/arm/common/bL_switcher.c
index d1e82a318e3b22bf6f54e9a8d5366ddc7a6e44ca..46cbb5caf9f17a22a7c42e4254cb68c6cdebc4e4 100644
--- a/arch/arm/common/bL_switcher.c
+++ b/arch/arm/common/bL_switcher.c
@@ -628,7 +628,7 @@ static void bL_switcher_disable(void)
 		t = &bL_threads[cpu];
 		task = t->task;
 		t->task = NULL;
-		if (!task || IS_ERR(task))
+		if (IS_ERR_OR_NULL(task))
 			continue;
 		kthread_stop(task);
 		/* no more switch may happen on this CPU at this point */

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
