Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74921EB1054
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GJq0R2zxOY4QdGiMItH2ly4tBgIgLns/MVKVEUsqQ8U=; b=2knJoC/OGEu1N4
	dVNOenQkAUvz+VU39EPHuaGB+TYh9qlyNWta2Y6y2GNaHucWarw5A8Q3L9TB/y4EUkiNBSHYeHH6P
	FM7odsfR3TRAfMGa6ZLIn7GE+Zf4MEwYVZM1j0/Gg8MuJ5M7ynHL7Jk4VdZoCZ5dbCkwdmXHigeUQ
	s12+YeXrjJT+gYEiTF893YtUNypXWChYChF9F9n627/iHXh9+E3GJXcQUOzmI/JFDTzSwJtjlzzSl
	j0pbLbjdtBl98O+6p/R2lBylh10CFy76VuAZp+fQZHLZbU7XpItV+pRl1ZglZNvtt0sQxw3XxI/UF
	XaJmcduHfmJpEKQxuIKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgb-00000009KZS-1Jev;
	Tue, 10 Mar 2026 11:55:41 +0000
Received: from mail.avm.de ([212.42.244.120])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgP-00000009KMD-0kM9;
	Tue, 10 Mar 2026 11:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143723; bh=5P0DiWaZEPF/d3SPdMB+rZQJk1DY1mVuY8d9xffySsA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E8nt1Igfikzg1UTgOGISAzAMiKswf2ND49bi7Kfi9UIZL/Ebzc+UJJz79rFMcVayH
	 w+/EzW9fK7u4Bg5GlsqH3X/nHnzFmDjyW7AnMKYXmhb+RvNdMihtj8ZP/p/a51PpAe
	 gPrdgwP6uGn176nZZmhXnabbuO0mAOF/przWQZhQ=
Received: from [212.42.244.71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006ab-b734-7f0000032729-7f000001bfd2-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:23 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:23 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:48:39 +0100
Subject: [PATCH 13/61] squashfs: Prefer IS_ERR_OR_NULL over manual NULL
 check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-13-bd63b656022d@avm.de>
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
Cc: Phillip Lougher <phillip@squashfs.org.uk>
X-Developer-Signature: v=1; a=openpgp-sha256; l=775; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=5P0DiWaZEPF/d3SPdMB+rZQJk1DY1mVuY8d9xffySsA=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAYCOfXcw6nKYZXjZ+DBieT/hiu2NsAfQUre0
 jlVRw6aXW2JATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGAgAKCRA0LQZT0ays
 213oB/sHjZoOpAMz20yPf5W58oaVS3VDOW1zZjyOZfXyKihmnOb8lV99cBPQClALjvBUcqLXemg
 tpELfmCMWmmS2DLDh38s8m7H4SkSFm3iB+qUl+u8a8NGrDjTz2g0nlLXJ2i4mzmAqWbDldfEhAp
 ePslhLAf6MqAOAwxF9goTetOQ472ZWbOa7vI5fCqcvwcF/q5QIEUmGs+z5b0yUklyrSflqQlQo4
 adffOC5kl3ETGEGqBgVXEIg3h8JiDkJe6MaBbDmB/JG3IQRjeJ8YfJc6t+cVg+eXVpCRQOreMFS
 jG7NgF/eCJBIlcELmHlOCy2pst+P0hiPrthj4RBlPC3hRS93
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143723-265C1A3D-EB4B679C/0/0
X-purgate-type: clean
X-purgate-size: 777
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_045529_721299_B7EC00B6 
X-CRM114-Status: UNSURE (   9.71  )
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

To: Phillip Lougher <phillip@squashfs.org.uk>
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 fs/squashfs/cache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/squashfs/cache.c b/fs/squashfs/cache.c
index 67abd4dff222235e75d8c2b10d5e9b811d6e38d8..8888cc02966e2e33210c872c733205d4c581ecc9 100644
--- a/fs/squashfs/cache.c
+++ b/fs/squashfs/cache.c
@@ -198,7 +198,7 @@ void squashfs_cache_delete(struct squashfs_cache *cache)
 {
 	int i, j;
 
-	if (IS_ERR(cache) || cache == NULL)
+	if (IS_ERR_OR_NULL(cache))
 		return;
 
 	for (i = 0; i < cache->entries; i++) {

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
