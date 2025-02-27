Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF8AC197BF
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2025 19:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5jPAL6cO2e3u1e++zM217R0ct4Ns1ex/wUrQXTbYuxg=; b=zzVKrYOZCX5HCT
	Gxa/yfqy+mtw5IO0xhSkRPb7XV/AtCQNpRUv22CPbwUSUzhG4CrGitotUgyxDA/SUQtVPcz/fd/Wp
	J2Txmj3gvC3XdafhrzEBGxE0N9nsAmakdRAa3RCBMXRTDcuOaU9pH6YDccxESTn00CrbV2DabfcI1
	St2IvVycBv3iz9aqoxMzg2hZORoa17hL3RlhnGNvuyYLdm3SWIPO5Dj9fGKydaPq8BlDF6jNi8kl8
	yFunjWDYSzYA7r7P/t3bB9b4mJIsu9f4p73KPyrhZOv4MgNeBfIRyfhNQkZDj0K8nXxvZFuUaXTBi
	DKxiR4yGVDN/ULX98tJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjlO-00000008bbH-3Wht;
	Thu, 27 Feb 2025 19:41:42 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhym-00000008F7b-2Ezl
	for linux-mtd@lists.infradead.org;
	Thu, 27 Feb 2025 17:47:25 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-2c12f9e9449so667262fac.3
        for <linux-mtd@lists.infradead.org>; Thu, 27 Feb 2025 09:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1740678443; x=1741283243; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HC2J6Mb9/RYSJwCU37fb1IaAz399El4qkG/TtbCDhMs=;
        b=HCc4Nt2feX+yj4vCCyMVNZA0iA8Ctmlx8PyN+ZaoeZrAXXPoa+fo8MU4VGhe0R9l1M
         GFJcVy24KMWzjK7EON92j3XJVsM3hl2g2FVNcAlQEMhmARXw2oXsluAFHamPuR3Ocyug
         xV0T4BiZBzrk3aQM4S57FSdnwgCXfCmOpnexI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740678443; x=1741283243;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HC2J6Mb9/RYSJwCU37fb1IaAz399El4qkG/TtbCDhMs=;
        b=OClGUtpQzQZBWnwvGwU3Ss/RpXBzlKBdXdm6DMChC8aWClQVer/cNTXUall+foGqlS
         H/hmIU3Zh0m3dpDJBiNtw0Sm1yIHE1DMepHulwGc7Nui3Ujlr1II3SskJak3W+VMbSyW
         7XDEfwJj6Msrd3KFEvTQcEZJyHRTbNUWghUMiVbhzoauBhsUNbn6VGzTDaR8B1pCZmOQ
         agfTTKx9wXHmCjPrSfaUqN4QOm07fIDT5YVE70emZmVJVSoTOS3YuMy2ki4/9othzgZh
         ldPTb1z9O6gcUycKV8F9EP2KGos2AqKCxNc6jaYj5qjE4zU2EzryKGoqGpeZpdmBd33h
         qjEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV57jM4B0gQHV43bESFmA/LPJ609DPWPzKe6iGuoI2yEmdFtHCoZEbJU5gvFAuGX/uMPRAJfgqo3U=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf12fQuvJdHLVj7ByJ+1pmV0QpBycIQHn5zHJLEpGF4z+eOgt2
	gxn4HdC8Pf/zx/ApjEswqGbwbCO3JFW8OyStMZiWcKMxt2nLcw5/rTlkdGnoUw==
X-Gm-Gg: ASbGncu0FZl+dO9b6MoE5lwh2T+W+wd2Wyf0Eivh6+32bOda5xf0d3is07Q9WYYUU8E
	Aj6vWB9HGdyRv0njFdf8cCZ/7PwPs5wyoQFUktA2Z7hno/dqOcXJRNx1CfSk6Ib1W7mAWxlzk5A
	nHBE1noUWnVqrANmR3Ee/pF5fN19o2A5s34M3xjmpmqXGHAzAMVy3mOeZA1w1VbZH34GRASbvsl
	wFwNfxlgGI00yWSuhkCeKe0DnJVBNjQ64YM6fx8DFYV4KchAs1dTlJUQRwcR1ytnNrRETBQRWu3
	Bnz3XWMWkBOOuqQTNpqd/4UE0wxZYcMK/gHr21koE2HUX4W3nAetOpfd/sQB7w==
X-Google-Smtp-Source: AGHT+IE8XZ+28PXtIF3rqQI56RoJIDoRjyLhnTul82ozQ0249c82pcF8rg78xs90VxHUTHIvPlr1HQ==
X-Received: by 2002:a05:687c:2191:b0:29e:499d:1d33 with SMTP id 586e51a60fabf-2c178433b9dmr51623fac.14.1740678442705;
        Thu, 27 Feb 2025 09:47:22 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c15c12639esm362545fac.14.2025.02.27.09.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:47:22 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: florian.fainelli@broadcom.com,
	Brian Norris <computersforpeace@gmail.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2] mtd: rawnand: brcmnand: fix PM resume warning
Date: Thu, 27 Feb 2025 12:46:08 -0500
Message-Id: <20250227174653.8497-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_094724_618722_D4D9F333 
X-CRM114-Status: GOOD (  14.34  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixed warning on PM resume as shown below caused due to uninitialized
struct nand_operation that checks chip select field :
WARN_ON(op->cs >= nanddev_ntargets(&chip->base)

[   14.588522] ------------[ cut here ]------------
[   14.588529] WARNING: CPU: 0 PID: 1392 at drivers/mtd/nand/raw/internals.h:139 nand_reset_op+0x1e0/0x1f8
[   14.588553] Modules linked in: bdc udc_core
[   14.588579] CPU: 0 UID: 0 PID: 1392 Comm: rtcwake Tainted: G        W          6.14.0-rc4-g5394eea10651 #16
[   14.588590] Tainted: [W]=WARN
[   14.588593] Hardware name: Broadcom STB (Flattened Device Tree)
[   14.588598] Call trace:
[   14.588604]  dump_backtrace from show_stack+0x18/0x1c
[   14.588622]  r7:00000009 r6:0000008b r5:60000153 r4:c0fa558c
[   14.588625]  show_stack from dump_stack_lvl+0x70/0x7c
[   14.588639]  dump_stack_lvl from dump_stack+0x18/0x1c
[   14.588653]  r5:c08d40b0 r4:c1003cb0
[   14.588656]  dump_stack from __warn+0x84/0xe4
[   14.588668]  __warn from warn_slowpath_fmt+0x18c/0x194
[   14.588678]  r7:c08d40b0 r6:c1003cb0 r5:00000000 r4:00000000
[   14.588681]  warn_slowpath_fmt from nand_reset_op+0x1e0/0x1f8
[   14.588695]  r8:70c40dff r7:89705f41 r6:36b4a597 r5:c26c9444 r4:c26b0048
[   14.588697]  nand_reset_op from brcmnand_resume+0x13c/0x150
[   14.588714]  r9:00000000 r8:00000000 r7:c24f8010 r6:c228a3f8 r5:c26c94bc r4:c26b0040
[   14.588717]  brcmnand_resume from platform_pm_resume+0x34/0x54
[   14.588735]  r5:00000010 r4:c0840a50
[   14.588738]  platform_pm_resume from dpm_run_callback+0x5c/0x14c
[   14.588757]  dpm_run_callback from device_resume+0xc0/0x324
[   14.588776]  r9:c24f8054 r8:c24f80a0 r7:00000000 r6:00000000 r5:00000010 r4:c24f8010
[   14.588779]  device_resume from dpm_resume+0x130/0x160
[   14.588799]  r9:c22539e4 r8:00000010 r7:c22bebb0 r6:c24f8010 r5:c22539dc r4:c22539b0
[   14.588802]  dpm_resume from dpm_resume_end+0x14/0x20
[   14.588822]  r10:c2204e40 r9:00000000 r8:c228a3fc r7:00000000 r6:00000003 r5:c228a414
[   14.588826]  r4:00000010
[   14.588828]  dpm_resume_end from suspend_devices_and_enter+0x274/0x6f8
[   14.588848]  r5:c228a414 r4:00000000
[   14.588851]  suspend_devices_and_enter from pm_suspend+0x228/0x2bc
[   14.588868]  r10:c3502910 r9:c3501f40 r8:00000004 r7:c228a438 r6:c0f95e18 r5:00000000
[   14.588871]  r4:00000003
[   14.588874]  pm_suspend from state_store+0x74/0xd0
[   14.588889]  r7:c228a438 r6:c0f934c8 r5:00000003 r4:00000003
[   14.588892]  state_store from kobj_attr_store+0x1c/0x28
[   14.588913]  r9:00000000 r8:00000000 r7:f09f9f08 r6:00000004 r5:c3502900 r4:c0283250
[   14.588916]  kobj_attr_store from sysfs_kf_write+0x40/0x4c
[   14.588936]  r5:c3502900 r4:c0d92a48
[   14.588939]  sysfs_kf_write from kernfs_fop_write_iter+0x104/0x1f0
[   14.588956]  r5:c3502900 r4:c3501f40
[   14.588960]  kernfs_fop_write_iter from vfs_write+0x250/0x420
[   14.588980]  r10:c0e14b48 r9:00000000 r8:c25f5780 r7:00443398 r6:f09f9f68 r5:c34f7f00
[   14.588983]  r4:c042a88c
[   14.588987]  vfs_write from ksys_write+0x74/0xe4
[   14.589005]  r10:00000004 r9:c25f5780 r8:c02002fA0 r7:00000000 r6:00000000 r5:c34f7f00
[   14.589008]  r4:c34f7f00
[   14.589011]  ksys_write from sys_write+0x10/0x14
[   14.589029]  r7:00000004 r6:004421c0 r5:00443398 r4:00000004
[   14.589032]  sys_write from ret_fast_syscall+0x0/0x5c
[   14.589044] Exception stack(0xf09f9fa8 to 0xf09f9ff0)
[   14.589050] 9fa0:                   00000004 00443398 00000004 00443398 00000004 00000001
[   14.589056] 9fc0: 00000004 00443398 004421c0 00000004 b6ecbd58 00000008 bebfbc38 0043eb78
[   14.589062] 9fe0: 00440eb0 bebfbaf8 b6de18a0 b6e579e8
[   14.589065] ---[ end trace 0000000000000000 ]---

The fix uses the higher level nand_reset(chip, chipnr); where chipnr = 0, when
doing PM resume operation in compliance with the controller support for single
die nand chip. Switching from nand_reset_op() to nand_reset() implies more
than just setting the cs field op->cs, it also reconfigures the data interface
(ie. the timings). Tested and confirmed the NAND chip is in sync timing wise
with host after the fix.

Fixes: 97d90da8a886 ("mtd: nand: provide several helpers to do common NAND operations")
Cc: stable@vger.kernel.org
Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index fea5b6119956..17f6d9723df9 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -3008,7 +3008,7 @@ static int brcmnand_resume(struct device *dev)
 		brcmnand_save_restore_cs_config(host, 1);
 
 		/* Reset the chip, required by some chips after power-up */
-		nand_reset_op(chip);
+		nand_reset(chip, 0);
 	}
 
 	return 0;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
