Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CB2EB105F
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+3EcP95Lop63myTGEZu/UcrVJA1HH4dvUTdrLPFCKI=; b=ijRAoVy8Kz2OAT
	CSI1clJcpQyIMsv4Xsvaix7duR7mPs9p0lBxXvTvdg1qeaJA4Na9G09Ls8kdn25APM9D0xIgt++bg
	a9AKQB515D6uJrkwMDjzTjRxmak0emNG3Kfu9uLGvxX5DC83wYjpiTyf125kIaec7nhphUQa6FIWv
	7I+yAlAgGsiJU8gVCbPPbTlDIuToKDLOcLLENodPNNZ5oVZmPKIjkHzj9bbPnnFEoSfi000mqaTuB
	JHndh1inM4kU3BkKDG+dbwUYvShx8fSgGWI6eRkTLUi5EH84T7cKMWFcnpKxxhK4y9KZbAGgg/AXr
	MsOcNZzud9P3imBXjeEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzviI-00000009NIA-0qzs;
	Tue, 10 Mar 2026 11:57:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgg-00000009KiB-3cOQ;
	Tue, 10 Mar 2026 11:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=C+GdyesCqjDCe4PZkQJNYjcFFIcNfAxTkK/W4yWnbYU=; b=KN6yT+9lxdYl1Ia8+QDqw97UMO
	ApfsVDnfp/yBga2GP2t+9Im1yi7HX0WEexuebRFIJijWoRYqiWmZUJEog4qoxgxl2cPf/9V3n7Q8d
	zAF7I0t3ip1ycA5pTnMGcgerX1HYpUtD1HgKR6K3gIrI00KMcpU3e467d3VTz3py57uQUFUviaxO2
	p8MB8Q6Vx1S8Hx5ChvQF7AtiMQC5WLzl0o4dfEjzh6u4DQV6AbNtHb5kpO5sGc6VVu3yFhkKkT6/c
	jjTXDYO6rP+KE4H8tgSjbnx1SN15FbUEKOX+oHrUa6CkYJxu7PxT8XwD8ivbsqKajSI5FMuXoQvmx
	0rke9U/w==;
Received: from mail.avm.de ([2001:bf0:244:244::120])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgZ-00000007leE-00nK;
	Tue, 10 Mar 2026 11:55:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143727; bh=gXi6ivSyh7ZdNYhxQJgA68gjpGeiYyVoxWZ9PHNV1mk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i31l4ZLCMLhpXpaK7/Y2yOfuiAhnSJr8fMnqxjs25j5opOPrdqJNTkpsIEDFkqgSp
	 sZnvLSPj8tGgU4HRU29DH4iPyKhf4v+uoWFgpTspJJOsv7N1zoPc8cizNZidyZ8Q0X
	 jUywybPonMt30TuRnw66+h5bxhBLfRmMmaXnPfrQ=
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006af-b734-7f0000032729-7f0000019c20-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:27 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:27 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:49:17 +0100
Subject: [PATCH 51/61] leds: Prefer IS_ERR_OR_NULL over manual NULL check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-51-bd63b656022d@avm.de>
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
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=923; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=gXi6ivSyh7ZdNYhxQJgA68gjpGeiYyVoxWZ9PHNV1mk=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAaDRzpibZr08PkdSw8N3Wy2DsiAYuwbT7jaR
 Q+T5qeGz2qJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGgwAKCRA0LQZT0ays
 2y8ACACMKWU5TdDg1OYJ2RnR6HQxJ+2JBIhOyDk8x3FmHidd0wyjcAKA49FqYhtFEhdjGJpgNO3
 wlcNr4zJ0vDoKzMmVWNj4Kco49QymIlKxd4ko1v9jLom22gL6FIw+i0pd7JG7Dw9K0M9qv/g65X
 psKPmTQlkBRnjyq+gEp1UF+Z+aW8svU4fmV048TA2bEb7zgfrp0dmnA9hbj2JEYjWrt/pHjBWtC
 27oF1sxBbFSjPkNzuaBpb0y9RWyLO/07lImA1AItNHZGlvNpydtzvqp/I3qxgt9sXKt1PHRt8iZ
 u4zVb/lltaBI2wPScPn/3+nmKc5y9QbdtT1oK6vzRsjkH2h6
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143727-CD5F3A3D-F6F9F436/0/0
X-purgate-type: clean
X-purgate-size: 925
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_115539_100299_3BB7AD39 
X-CRM114-Status: UNSURE (   9.31  )
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

To: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 drivers/leds/trigger/ledtrig-tty.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-tty.c b/drivers/leds/trigger/ledtrig-tty.c
index 8eb6286b33ac3cdcbb72ed9ad5ad7105e15d20b6..3725571144d910b225ca9605771fc0f0c8355efd 100644
--- a/drivers/leds/trigger/ledtrig-tty.c
+++ b/drivers/leds/trigger/ledtrig-tty.c
@@ -220,7 +220,7 @@ static void ledtrig_tty_work(struct work_struct *work)
 			goto out;
 
 		tty = tty_kopen_shared(devno);
-		if (IS_ERR(tty) || !tty)
+		if (IS_ERR_OR_NULL(tty))
 			/* What to do? retry or abort */
 			goto out;
 

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
