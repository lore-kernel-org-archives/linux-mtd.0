Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6D0EB1056
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tevryec7V8eVYRYlG/Of++YA5Im/C7YAzYIUxOPren8=; b=C2XlqvDt8Cxrqa
	2jHKVL/UJBNlkNONijaleStgAco+SYbsZq61y/v9pVhL7NqVsYJwuATRM9A8Yzgbiawguvo+fX5m0
	08ZJAKJxzIdB9ZVJDRNmRex4TGu9SLoG63c3V5uQ+IpUjR5j94PfYphvOEOd0pR9/2i7UwOWRVRlj
	g9+GIHM7mPdcCmuzJ2n5Gk6rf4zl1Hc4kzzk/uudq4jZOt7c13ZySDcGi+I0oQ+ZIakrshXLYRRQM
	HvNUL0Enrlu3+8aP0e8YEQNTtYXrdciUh/7Vddaf9DW17Q92XyXHs2irLZgSC3spkmFs27sdO0PTR
	BoPJjF+RbZAO99LLfrJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvh6-00000009LQW-0PAd;
	Tue, 10 Mar 2026 11:56:12 +0000
Received: from mail.avm.de ([2001:bf0:244:244::94])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgQ-00000009KMN-1whY;
	Tue, 10 Mar 2026 11:55:38 +0000
Received: from [212.42.244.71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006ac-e21d-7f0000032729-7f000001d9c0-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:24 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:24 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:48:37 +0100
Subject: [PATCH 11/61] pstore: Prefer IS_ERR_OR_NULL over manual NULL check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-11-bd63b656022d@avm.de>
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
Cc: Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=958; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=50ahf3Ovo2xs3bKtWfsEny3TDWNoY4zAg8ay7QEz3LI=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAX7sQcV3VwS+mx5jK1HizkW2meRfNqVaBq2u
 sez6firU+2JATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAF+wAKCRA0LQZT0ays
 2xq8B/0SUo4r3rxVq9RsANPcVwQvjAVIq5IHS3vrGpufO9mdcUCVswBYAGcqVWlGUWYhZ9D5Afm
 wOzPQKPaAOE+fY5h8prRvYwP+dSX3nADwI8Y6unKqygPjUrnO+GjcQ97MVfA906q0I9/A6k6cjF
 jRX1r++tFvKvjX46AZyTpQKZC7YoNaBrH37lhDan3ZiZqsJrJDSI+f2JPLEkh5ffnrBrT1NRvPO
 /GMhxFHqkXWNux7Q6NSnWc5GTjmQY/JD/+/V9BILGVpDvPcV2orOeVbtK+hA0s3T4ekXooFahFe
 5VVhIFMEZXUHZMw53adA+fpwHBkKMznHg4ePWJsQNeHf/dyM
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143724-9167EF2F-D7D1D994/0/0
X-purgate-type: clean
X-purgate-size: 960
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_045530_646705_F134541D 
X-CRM114-Status: UNSURE (   9.81  )
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

To: Kees Cook <kees@kernel.org>
To: Tony Luck <tony.luck@intel.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 fs/pstore/zone.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
index a3b003f9a3a079c482b673f57023ce88fc290dbf..dce8403ca18566cc4a7a853ccdc7e1c165666fcb 100644
--- a/fs/pstore/zone.c
+++ b/fs/pstore/zone.c
@@ -1226,7 +1226,7 @@ static struct pstore_zone **psz_init_zones(enum pstore_type_id type,
 
 	for (i = 0; i < c; i++) {
 		zone = psz_init_zone(type, off, record_size);
-		if (!zone || IS_ERR(zone)) {
+		if (IS_ERR_OR_NULL(zone)) {
 			pr_err("initialize zones %s failed\n", name);
 			psz_free_zones(&zones, &i);
 			return (void *)zone;

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
