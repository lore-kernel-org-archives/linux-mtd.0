Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FACEB106E
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=opV62SPund0pwljDd8PemY6GhQ1t4dxnwkawO7A1/bU=; b=thGX2CdbT5Ognm
	nwZQybB1WbVIpNGAn3PmM0C+K9bBA3CqGO59gpHOznGS90e33gwBpSXnE9iDU855L1jchV+6XKNrY
	Lr9SpOLT3zzjRAZR2C2RGojksWRO8L9qtmVWXIsBwVFG6ROKRRxUAvgsJw034KGeD6l2zRP4jGjUU
	U2EN0bbujRZ3P/336V10nIflFIULY5WeXsxdhlRiqz1qZvolN/PbxKjcRElsJ1e0g+YD7qMKMAoK7
	iaTfehJep27a+fGcEnXRE3l8slEIpTO5h8kHILVvwAcejnQhXWmTra0UrRSHpxyxofyt2TzlsNjk+
	rohJOCirX1iW50hdMPUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzviR-00000009NfD-1VNk;
	Tue, 10 Mar 2026 11:57:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgj-00000009Knd-2gh2;
	Tue, 10 Mar 2026 11:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=VeyuMlBSXCUl2HyhMWtK62gNrN2xqJpTn5I2B2Zc2uk=; b=eoXWngz/xIo82y7QZlFVrwSGGK
	m6kCH/IRo3x/ahwCAJvSWixA1KRJbx1vvsCrK+SpIIzJ6n/Amudg6JcLftb1DrfNbOyHEbDRLW/5O
	pcTB4XHnmS7Du4RVwPAnVd/aiS7Ce1ETb3uvR5/kHAMzWVWFhCziXJmxj4rYMGmfiImhlZ9MOijOu
	/FKUGQFXZEoGBoc7nm+3VG083fKtnbypMRATLb50SYR7JHSLs5/iI/7rL/CchV/CMnw7ZglUJ7fdz
	HwFkn9QJSw0o/MfyeCjpiNBVw+3O9z4OMkSdqgmnkp+M8AP1ewxoob2iKsMna78cuHV+E9sa+A8iy
	4XJsXHxw==;
Received: from mail.avm.de ([212.42.244.120])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgT-0000000EQ7V-3ygf;
	Tue, 10 Mar 2026 11:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143725; bh=xBKhBreRFiEpPz9/49OtWlCzYkq81mZihzEqekyK7xA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=helEnKZUDYmuyC7r9itC+dVARlXrRlYpZWzDAaAXEYc5wN1FHoKQsdSjCaomchjhv
	 +41zqDKlH044FWtyvi2VX9TAdQF1rs14U237EegHWJogLxynx4m+2shwi9NDMEzjxe
	 k3vCUFrBTw+1/DCUt/wn8qmUGFq+b5Q0TC9ytTvc=
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006ac-b734-7f0000032729-7f000001c024-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:24 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:24 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:48:48 +0100
Subject: [PATCH 22/61] md: Prefer IS_ERR_OR_NULL over manual NULL check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-22-bd63b656022d@avm.de>
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
Cc: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, 
 Benjamin Marzinski <bmarzins@redhat.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1995; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=xBKhBreRFiEpPz9/49OtWlCzYkq81mZihzEqekyK7xA=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAYgLcFKxegL/bQqhgTo4RNQJgrnmxL3YCzsA
 NwbsOtNPYeJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGIAAKCRA0LQZT0ays
 21bACACtmD+JNOZZE2WtYGgZs+OKFUvGXg8BvTcg2nAeuTAfDV15mPSXGDJtr1bOhVuDnL/Nw9l
 YuHe1nCI3Kb5gMl9oJ6QTc/nxqpUehwIiPaszmCzsqUT9Av4+JV9tbiRExsTnWgWp8/ohC7O/t7
 0F2HI97L08/EOhP6er3J/caSpZnOpbWXT+xXd1cfFQmhFO8426W+HbSPnqaYqXoPZvzXs04m+U7
 Y+HhZZm9gUaVM39bOf2O7FpXKP5lXlaxHXla0Syc5xOdqOCZGHEwLXH/1MeFU5JbVnp/DFE01i8
 2gpgUDB/Kr+8ov9qYVC2ZPrR+l2cjmrUojAxw0U8eiSwxKRA
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143724-71DC2A3D-384367F1/0/0
X-purgate-type: clean
X-purgate-size: 1997
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_115541_509596_884EEF27 
X-CRM114-Status: GOOD (  10.91  )
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

To: Alasdair Kergon <agk@redhat.com>
To: Mike Snitzer <snitzer@kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Cc: dm-devel@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 drivers/md/dm-cache-metadata.c | 2 +-
 drivers/md/dm-crypt.c          | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/md/dm-cache-metadata.c b/drivers/md/dm-cache-metadata.c
index 57158c02d096ed38759d563bf27e7f1b3fe58ccc..32f7d25b83a181a30a78c663d48f7882cb97f7b5 100644
--- a/drivers/md/dm-cache-metadata.c
+++ b/drivers/md/dm-cache-metadata.c
@@ -1819,7 +1819,7 @@ int dm_cache_metadata_abort(struct dm_cache_metadata *cmd)
 	WRITE_UNLOCK(cmd);
 	dm_block_manager_destroy(old_bm);
 out:
-	if (new_bm && !IS_ERR(new_bm))
+	if (!IS_ERR_OR_NULL(new_bm))
 		dm_block_manager_destroy(new_bm);
 
 	return r;
diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 54823341c9fda46b2d8e13428cbd51f3edf642d5..05eae3d3c7df6baebd0b7a4219f7b6938f6e7f87 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -2295,7 +2295,7 @@ static void crypt_free_tfms_aead(struct crypt_config *cc)
 	if (!cc->cipher_tfm.tfms_aead)
 		return;
 
-	if (cc->cipher_tfm.tfms_aead[0] && !IS_ERR(cc->cipher_tfm.tfms_aead[0])) {
+	if (!IS_ERR_OR_NULL(cc->cipher_tfm.tfms_aead[0])) {
 		crypto_free_aead(cc->cipher_tfm.tfms_aead[0]);
 		cc->cipher_tfm.tfms_aead[0] = NULL;
 	}
@@ -2312,7 +2312,7 @@ static void crypt_free_tfms_skcipher(struct crypt_config *cc)
 		return;
 
 	for (i = 0; i < cc->tfms_count; i++)
-		if (cc->cipher_tfm.tfms[i] && !IS_ERR(cc->cipher_tfm.tfms[i])) {
+		if (!IS_ERR_OR_NULL(cc->cipher_tfm.tfms[i])) {
 			crypto_free_skcipher(cc->cipher_tfm.tfms[i]);
 			cc->cipher_tfm.tfms[i] = NULL;
 		}

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
