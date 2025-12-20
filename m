Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF02CE6689E
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Dec 2025 06:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ic3D2EdrNUyXf9UQGCOsrPUUW55Pzj7Ewp1cFK6Y814=; b=RkCkfJsRF+mh1u
	/keG8NrY3I7HUiO+dhuQvgtwtvhpxIyHzYc1dbFu/Q4YeMN2VEG/VjqsI8KOceINxSbqepwUQWoPt
	IzLevvm14GNI6mhIkD6gl1e1PjzPFlvfQ2559/m7G1zaNyqJciJcc7V61lKhEAEr7/D9dk3xBwxkx
	L5nRRxlNL6eRrmWbRWr/auQAvUZZEVEI9AJTyOPtzPNYNcvS+pRlbeAfaXsSlWT5DaAAMNhSbj40U
	kDQK/OY02nG0AEMLQJxZJhp6iualBhTFbw3HQvsOvY+8Q2B9z9GSXhz3Oi5i4S4iOvn0KTxFYSvwE
	mXuOeJo2fGHYtioXiiaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWqf7-0000000BMSB-3ewt;
	Sat, 20 Dec 2025 06:41:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWqf6-0000000BMS0-0nlu
	for linux-mtd@lists.infradead.org;
	Sat, 20 Dec 2025 06:41:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 49F906001A;
	Sat, 20 Dec 2025 06:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579CBC4CEF5;
	Sat, 20 Dec 2025 06:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766212915;
	bh=0cYM1OGkisWER17OI/JlqgHBJhvaSLpBwGWv79i5mOY=;
	h=Date:From:To:Cc:Subject:From;
	b=R6Q8HXfTaM1mxlpJVIInwBxbjdVI3LZKbiEc4Y9Ka11Ok7k0FSQjGLVXkZLaWWm+s
	 EJlfpPDnsCIxsbC9wWD/yEQ0Y0X9XSLmF1DcJ9PW/auxENjIieuwt1xXSH6pigyefK
	 h1PYhZcRXnUPfEK2PxEjlUgbNIX9di3ZTDq1uRF+aO2rBOF0DNPLJuy3Colf+piyjB
	 NChFEH7uIp9NFUIESMXvrAzhIkh+wi2E6QPq9xzfkvUt/z1jaUHQFAEKSJku1puAv/
	 eq3stnViZdZrpWZ11mjaZZ1dWzZsYhKG7RRlke9BqHJhVW986sYBEUjlhn4UNmrSFI
	 IGv4/SkPwBD0w==
Date: Sat, 20 Dec 2025 15:41:49 +0900
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Raag Jadav <raag.jadav@intel.com>, Tomas Winkler <tomasw@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH] mtd: intel-dg: fix array-index-out-of-bounds in
 intel_dg_mtd_probe()
Message-ID: <aUZFLezigzZQVt55@kspp>
MIME-Version: 1.0
Content-Disposition: inline
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

Fix the UBSAN: array-index-out-of-bounds issue below by updating
counter nvm->nregions before the first access to flexible-array
member nvm->regions[].

from kernel bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=220823

Dec 15 22:01:52 orpheus kernel: UBSAN: array-index-out-of-bounds in /var/tmp/portage/sys-kernel/gentoo-kernel-6.18.1/work/linux-6.18/drivers/mtd/devices/mtd_intel_dg.c:750:15

Notice that this flexible array is annotated with the counted_by()
attribute, hence the counter must always be updated before the
first access to the array.

Cc: stable@vger.kernel.org
Fixes: ceb5ab3cb646 ("mtd: add driver for intel graphics non-volatile memory device")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/linux-hardening/90e419ad-4036-4669-a4cc-8ce5d29e464b@infradead.org/
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/mtd/devices/mtd_intel_dg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
index 2bab30dcd35f..d3e89fe324b8 100644
--- a/drivers/mtd/devices/mtd_intel_dg.c
+++ b/drivers/mtd/devices/mtd_intel_dg.c
@@ -768,6 +768,9 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
 	if (!nvm)
 		return -ENOMEM;
 
+	/* Update nvm->nregions before first access to nvm->regions[] below. */
+	nvm->nregions = nregions;
+
 	kref_init(&nvm->refcnt);
 	mutex_init(&nvm->lock);
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
