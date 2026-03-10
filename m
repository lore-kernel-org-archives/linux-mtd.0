Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5151EB1052
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dMtcAU++zV/jbLlt29LqWM3ut3VULRfPqsg0pk6wgsI=; b=nFrZTrQ5Xp90k1
	lzGG5sPhsHFAmjHI6XOZb4K8Gz8coBQr8r/5I0Gxtb2fe+fHq8bTDR8LwWCMMnzB//y9vsa12UJFU
	MWGYDcY/VJYFQ40/f9xQPa4ztNaOpmI7IgXY30KuNQbdF8pKQ+pD8NUGSCTH0MMvI4rXgweaum29s
	a88Pn1SrH6wW3LdSFcKYaGukcIHiNof858raGBODJbVrZPXVecnNlawzmYTEdDSHmymP85x12uTFS
	z/plAj+96DPtAezXXgBryTFhVIcLswW8mvvxw/qO8HOQ0WCe/a0vRHh8ESFM4p201h4vMqAe6s+3V
	UtbR7LO1KMi5eFEt2NVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzviL-00000009NQJ-0sLT;
	Tue, 10 Mar 2026 11:57:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgg-00000009Ki1-2r4u;
	Tue, 10 Mar 2026 11:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CGmSA97P5zoUAPVKt40UlhgFAMOY9j0jHxmE1RUkWWE=; b=csgCQJ+1G893tq/f42+yZwclJ5
	yfHPN4uffIIa3RkkIehiXgJg4DK+9ehXJrZ6i7NvLwi0GzrzxhLNSdEQugKaHerLuTmEFVNFC7z0U
	CYv1PW6yfoSYMtoBK/SShyVmLSevGQAlJ0XUbbL4yVm6FFQMJxueMwS0jWkak2JqZVqp1y13Xq86x
	eyzBXn3XXkSawjCFxbhlSASgaBDJDmWGwuCIPfjSgYTKR0QtbpJWa72pj/AEiit3vqNRG5PjqnVLg
	2nI0PwIY41vBxJ2GlhD0gLY7JiwULAn+L6LCZ1EpwdkWT0ZFQzqGUxKs5+JwvEQSSUqVbcKL8TDwP
	u3BQOxtg==;
Received: from mail.avm.de ([212.42.244.119])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgT-0000000EQ7S-3yYp;
	Tue, 10 Mar 2026 11:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143724; bh=vGrPLNOiClPR9kf2JYtGEgONwIn4sxqTHiWcc1kKKyY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vGHDpooj3kbLZ+8D0plCbMeYqQhZctChcZoWM2Oz3ppzOc10y+IZamI2t1Up6x5Oz
	 ZOQWpS5VxsHODQ5E0bYLhrVtG85jFVZABrb+vIZU9NfiYqywilzOFMSb7wFF9KlZxk
	 XMjhpb+uZFDFGYC7810AK5hKKVXc3NZ47/tNCbvg=
Received: from [212.42.244.71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006ab-2367-7f0000032729-7f0000019cec-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:23 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:23 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:48:31 +0100
Subject: [PATCH 05/61] smb: Prefer IS_ERR_OR_NULL over manual NULl check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-5-bd63b656022d@avm.de>
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
Cc: Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.org>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
 Bharath SM <bharathsm@microsoft.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2182; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=vGrPLNOiClPR9kf2JYtGEgONwIn4sxqTHiWcc1kKKyY=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAXmFi2noeXj0abdUjIB9kKoSnFcuerTTnqGw
 aIV0JkIMuiJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAF5gAKCRA0LQZT0ays
 25ZYCACJTZVo2gUPO+X2etWPNlTUp7ClEwWSNg3dPZBa5w0Z7EuwahYUGGyy8BKX2Xr3Nw3eStQ
 sVKw7MXxWmXWt5UTxCuTdRP3F8qkFihhAcyZGnaWXtsHW80RrqCOvZyrn/d1kQqYEpMpKbZIZxv
 /EpbwmWT4XeRvGuaEWqQ2bbe/QDrikm2suvUw6m77AVK8ag0Unhi8yF7km5ZQPmNxRG0b7wRfDu
 f9v8qAqM0yTILYLsa5pGAGuQ+9RoWhRyw/Vp6w7DPGkGl5Ft2gyZ5dwPzpx69OognVNti4fm1g6
 tztjOPF3hTnYGvxjbl6RQZRancjyqct71KnXaO98GUCNnx9j
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143723-8ECA1E1F-59018045/0/0
X-purgate-type: clean
X-purgate-size: 2184
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_115540_553397_08CA7D4A 
X-CRM114-Status: UNSURE (   9.96  )
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

To: Steve French <sfrench@samba.org>
To: Paulo Alcantara <pc@manguebit.org>
To: Ronnie Sahlberg <ronniesahlberg@gmail.com>
To: Shyam Prasad N <sprasad@microsoft.com>
To: Tom Talpey <tom@talpey.com>
To: Bharath SM <bharathsm@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 fs/smb/client/cifsglob.h | 2 +-
 fs/smb/client/connect.c  | 2 +-
 fs/smb/client/readdir.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
index 6f9b6c72962b09260542b711d4c64e7dc42c7845..fb731b2609465ebe50742936b458aba210ecbd4a 100644
--- a/fs/smb/client/cifsglob.h
+++ b/fs/smb/client/cifsglob.h
@@ -1336,7 +1336,7 @@ void cifs_put_tlink(struct tcon_link *tlink);
 static inline struct tcon_link *
 cifs_get_tlink(struct tcon_link *tlink)
 {
-	if (tlink && !IS_ERR(tlink))
+	if (!IS_ERR_OR_NULL(tlink))
 		atomic_inc(&tlink->tl_count);
 	return tlink;
 }
diff --git a/fs/smb/client/connect.c b/fs/smb/client/connect.c
index 3bad2c5c523dbd1d4b1ab253567984612be0f348..aa12d327894b270b59ea30be0e6d77b4188fc98f 100644
--- a/fs/smb/client/connect.c
+++ b/fs/smb/client/connect.c
@@ -2895,7 +2895,7 @@ cifs_get_tcon(struct cifs_ses *ses, struct smb3_fs_context *ctx)
 void
 cifs_put_tlink(struct tcon_link *tlink)
 {
-	if (!tlink || IS_ERR(tlink))
+	if (IS_ERR_OR_NULL(tlink))
 		return;
 
 	if (!atomic_dec_and_test(&tlink->tl_count) ||
diff --git a/fs/smb/client/readdir.c b/fs/smb/client/readdir.c
index be22bbc4a65a03ec64b87d8505d1496279f22efc..3e9260cca196ea8ab17aad82c4824ec5e468e2e7 100644
--- a/fs/smb/client/readdir.c
+++ b/fs/smb/client/readdir.c
@@ -165,7 +165,7 @@ cifs_prime_dcache(struct dentry *parent, struct qstr *name,
 			inode = ERR_PTR(-ENOMEM);
 		alias = d_splice_alias(inode, dentry);
 		d_lookup_done(dentry);
-		if (alias && !IS_ERR(alias))
+		if (!IS_ERR_OR_NULL(alias))
 			dput(alias);
 	}
 	dput(dentry);

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
