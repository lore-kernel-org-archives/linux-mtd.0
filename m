Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F664EB1054
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G2i8qGkTRA8OpW+tpzfqu9297NMi6kpP8USizxO/Ytw=; b=XRnF88yzaQTSW1
	B/qRJjiCBRTMmT5gwFRHtpjKurlWsTeclTXwm74Z6gFfdUB/Ly06+6MZBfcKbm3noHjOnQHOQsrdD
	j+FQZ1eHv9ok2TAR/Sr+wDktIcIbweudsQS2L4qIdMMqvRylpycsH3N7vEkotvZqCPyQG/0dzMQTi
	4C8wY2+NCzBqzMlfKojlOU524+W+vRbIDNK26wbEtQf6J1b8tKxC9hLO1FzvomLF16JFuyJbYuBRF
	g9toT3TYt0IUG5jYeV5EWw2eLsoxfjchlnvsyC0UwS7qRWiXNEsAKWJdMbCm+sYn83PZ789DIYa0+
	WAfYSkMU4RcVARGTUegg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvhX-00000009M2E-1DEO;
	Tue, 10 Mar 2026 11:56:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgb-00000009KZG-3fbl;
	Tue, 10 Mar 2026 11:55:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=pmzTuS26Tio/4jmwIQgr4S4kHi08tUh40G4OeE8egsE=; b=rRrBvLAVsumhZw3Tx7dE7t4bIM
	0yBJPvKTfFWLHIgeZtVtRtiXtCBMu9o38HoE0Mcbi/s4mrxcx9/iuX0aDRdtewrNZkz5Jpl4VebpZ
	2HQFdMUVnywvC2mOyrLnMgtgWWlHn8D3068zgwTsGVYWlwywWEC1csNl1+b9b70fXv1HSoBm+qo8+
	8T2c+jzsO4WJ7jUzSfr6UZcGsjAHDbLB3sV7U5SpAhK4cYFiO32ooNieNACC5EcovQMKsupuRm0mp
	TwJauLLvkQHFsmEX7hKL0Cm9Pi/8w/wlkkeOegAfwv4Xk1BhLGV+nrmesJt82hhYIn+QZcol5VcWL
	R6rer+QQ==;
Received: from mail.avm.de ([212.42.244.119])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgX-00000007ldG-2kAN;
	Tue, 10 Mar 2026 11:55:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143724; bh=4BhjLgHklMOlrlh15TjcKsWCe6nSKPYF24qnetdWXbg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RqhTx0EmyxrmfRTtljIjRkiBeQRNg7t+I3XXegyOc2QLtPemM7MVWOrGq4kCiIoIJ
	 yGpFXaUd3hORSkXREk1ktMElxoKrmBUfa/aQeKUGnDSmvq0xxQeAYyCNkBsTqff4Cf
	 L9y+LrOrr2cRl/yAeOACqVo8Dn08xMpnN1yM0t34=
Received: from [212.42.244.71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006ac-2367-7f0000032729-7f0000019d48-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:24 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:24 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:48:43 +0100
Subject: [PATCH 17/61] module: Prefer IS_ERR_OR_NULL over manual NULL check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-17-bd63b656022d@avm.de>
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
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1087; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=4BhjLgHklMOlrlh15TjcKsWCe6nSKPYF24qnetdWXbg=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAYP1zVxsf2YMTk3nHod4kxayUyKVXG5YGkG6
 XkvhcJVQpuJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGDwAKCRA0LQZT0ays
 29zxB/9Vdu5hjf1A8B4GpfddcKXgGOm+ASeWeBg79jEgG19UwsDASm00GiT7wXrv7TVWglbpyDv
 ECLvIdXvLb6GFPl24e5Q/Ve/2lM6CN8TnFAQr/bcz+KkA4Hn7jXYyv6h9374/TPjeoBNkjjuKzc
 49rS3Zyn2ZE1N/pwblhVtNHW7x2/CX8DXUg689bp4h2f5jZ7vjpU/WwSX1p72SC1Tlm0gsvFFTb
 dPTe/Bl9fdCyXVd1WxpdGHGUoYwBsXbIz5EfKpJdHSyW9Ymon48BTvBc3UoZP4hxtotyJKui89/
 eL7nz+He7k3GWFJ6LNunqb0XsBSbt8hh3S6Sw1Py47Sdhmn3
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143724-D94BAE1F-25B91F7C/0/0
X-purgate-type: clean
X-purgate-size: 1089
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_115538_768853_5F6264F1 
X-CRM114-Status: UNSURE (   9.78  )
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

To: Luis Chamberlain <mcgrof@kernel.org>
To: Petr Pavlu <petr.pavlu@suse.com>
To: Daniel Gomez <da.gomez@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: linux-modules@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 kernel/module/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index c3ce106c70af165e2dc1a3c79f5a074a5c3e3d34..7f62f0620dcd75960e431f7af3d1cadf4cc41e4b 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1551,7 +1551,7 @@ static int simplify_symbols(struct module *mod, const struct load_info *info)
 		case SHN_UNDEF:
 			ksym = resolve_symbol_wait(mod, info, name);
 			/* Ok if resolved.  */
-			if (ksym && !IS_ERR(ksym)) {
+			if (!IS_ERR_OR_NULL(ksym)) {
 				sym[i].st_value = kernel_symbol_value(ksym);
 				break;
 			}

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
