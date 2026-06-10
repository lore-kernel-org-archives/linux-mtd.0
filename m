Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4558ECD98C7
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jun 2026 09:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a/Miu38RbEule9EKvmuq9zqFq60Louj4LIwX945HRyA=; b=SBVDicDIXw+Y79
	z3At//ETHXpwh1//HietajaLb9dNsGd68qg9E+7sGVR1WXZl8IMDl4phBfZPNKkZRMy3jLBtRSt+I
	0saENGexPr3I5dl/jjz0R6nIGLR0WSLL+uLo4ZkO8Yr5ing2JdFbXl/lqVp3VzWgrQ9wb6HHYD5SH
	LQIIbfLFFll8qV4iLUiCouK+UB0RndYsWYcMfFh3uGIrHQn0UH3ewCFoNd2dkJsSw/q3LDsXy1VAy
	ab8tW8wZyF/flzUCQ3ZrF3hs1a1bVKJf2z6K5E5cAjM+hqPHz+ewWk499VNSfN/YQh0E+GS1F93zl
	4YX+pbCnJ3pzrU6RrIWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEwg-00000007BME-1hf2;
	Wed, 10 Jun 2026 09:09:58 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEwd-00000007BLd-2Xfy
	for linux-mtd@lists.infradead.org;
	Wed, 10 Jun 2026 09:09:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=0+o72NoFU8J0nMl63pk0zfgtIhNLQExWYKfZBJ6847I=; b=qNPd1eltmYTDrt5/OvQEQ+WzyC
	jb9PX7dCU0w2cgDaUMhbOsW+5aZZa4NEDzGCePlr78xdwypBvfUSReAatkfwrTV4BUFSrBeaZMTR0
	zAQYMXsCQDltf4DWG1C26PWbktt2+/k06+qYsASZhbTWYiEqd95QNr9LpjR/UXlwjiFiFllod1qaR
	b9dZvfVIo8yvMg1wejpERQraKr4IluSWBXrr4JVON2wI23yvJ6DbvHpfsaR0iit6G3zIJ89jNaFyU
	A6hJMoHZFkDCRaR3tl8eCD9ryFaSNWfgTscwWmL0FSPrR5po7l0bY1C6pGCX4O4mM5brInZF4gTN0
	Peqng/XA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wXEwW-00958k-1O;
	Wed, 10 Jun 2026 09:09:48 +0000
From: Breno Leitao <leitao@debian.org>
Date: Wed, 10 Jun 2026 02:09:40 -0700
Subject: [PATCH] mtd: cfi_cmdset_0001: silence spurious suspend warning on
 shutdown
MIME-Version: 1.0
Message-Id: <20260610-cfi_intelext_suspend-v1-1-05376b7384fe@debian.org>
X-B4-Tracking: v=1; b=H4sIANMpKWoC/x3MUQqDMBAFwKss79tAFAk2VylFqnlpF0oqWS2Ce
 Hehc4A5YKxKQ5QDlT81/RZEaRvB/H6WF50mREHnu+BD692cddSy8sN9HW2zhSW5kCcOPnGYbj0
 awVKZdf+398d5XndpidNmAAAA
X-Change-ID: 20260610-cfi_intelext_suspend-6fbe80de8b94
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 hruben@meta.com, kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1541; i=leitao@debian.org;
 h=from:subject:message-id; bh=GUjSqALOjryUwwPuANVy/v1syJaCmvWzm8WdiCBoYkw=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqKSnYIeQs5h5GqtjwKy14y5HxUvBqc0IDQ8s90
 lTBcXdsDlGJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaikp2AAKCRA1o5Of/Hh3
 bSS8D/9/QVAqIBvvzs1bQZ2XIWRzekzIymhR54MNllH1bzE3mf3HTYqsk9wltLZvdHhiMZlOAiP
 NRPuKmvPvLyJ4N8UzOu2Mp4hTdEOwrFKc36D1/zoK9L3EPxmiVhzyze2j/TmwaLRucW1ReDFXg5
 tLt6IqxAgkaR82Hgv+MnyNjInzQt0Gbmnx9ICW5apBykHCMbRSh5W1+088BQk922khJVzlw3fR5
 8HfjJisV22y7oOxkV/Nw93pK81nSOXXWWooFhFKQRQ+fzf+24OSXKoD+PjJPgbZEaODYICWTQXJ
 FlOANL2k/FmZxIuMvLuSbudF0shetCtuZc5YYdGF51gtoUIeH6Elt1jRvzAWuCXq07YJsckAISF
 OUDtB37oIjPoKyZG0aCCxbdGv9Lpv5rgCnQYNkqtRsxu3x6vCvbivgLDnQu98FCc4zYcnVkEZvY
 rX/zIPSSXhr9ldxqmQ+5VeNATZlDsm6w8P3CmJ7C3iCCDkUIfK07QUG10rH6E9fA+EqiWVeRE60
 o75UvwpdJ05NUZEctDIUpoHrbhyV6NfEGWlAu0qiR2wfd7Fo/p3xtPnjUpsO2lZzHBsHRumWzeW
 UEwOjkPFVSZMAzM+/LU7Pknp4Hh/czFh0GpnmvqnQ3/BSCkgYmrQc0JIodQfs1t33yIi09ZmfIN
 ecwvPf9qiJWYTbQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_020955_655661_F8544412 
X-CRM114-Status: GOOD (  10.55  )
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

cfi_intelext_reboot() puts each chip into FL_SHUTDOWN (array mode) via
the reboot notifier so the bootloader can read the flash on the next
boot. If pm_suspend then runs on the same chip during the shutdown
sequence, cfi_intelext_suspend() falls into the default branch and
prints:

  Flash device refused suspend due to active operation (state 20)

The chip is not active; it is already shut down. Treat FL_SHUTDOWN the
same as FL_PM_SUSPENDED in the suspend switch so nothing is done and
no warning is emitted.

Reproduced on every boot of the QEMU 'virt' arm64 machine, which
exposes two Intel-Sharp pflash chips.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/mtd/chips/cfi_cmdset_0001.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index b73596a8e021..6049ba2d6bcb 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -2565,6 +2565,12 @@ static int cfi_intelext_suspend(struct mtd_info *mtd)
 			ret = -EAGAIN;
 			break;
 		case FL_PM_SUSPENDED:
+		case FL_SHUTDOWN:
+			/*
+			 * Already suspended, or put into array mode by the
+			 * reboot notifier ahead of an imminent power-off.
+			 * Either way there is nothing to do.
+			 */
 			break;
 		}
 		mutex_unlock(&chip->mutex);

---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260610-cfi_intelext_suspend-6fbe80de8b94

Best regards,
-- 
Breno Leitao <leitao@debian.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
