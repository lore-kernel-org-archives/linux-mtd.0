Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEA5EB1061
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rpTbojHNpnrBY/1CLKoglcCQzGO2gs7ZrcsFUi6aBy8=; b=ID0wtJMDNR+/pk
	e2AkKYE9KCt2DA682HdENUyPpXWz9AiUu20rDfCTpZnNvGK52Uvjrq5eEeU+VNqzSYKzUBaeBzaAJ
	ATJYYgslKoqOy1joZfPG4XKRwAyRy75MUor2UbeaKYzLDL3z0RgRotL07GdfSakNsNKBeQ+Z0B7Ze
	lMi3YozO0EbzOC6P0JovRe9Re0MJEXJHdGX4V0zFGGbVoJvUO9DKs7PeN7JOXOpj1u+JS09I5haWh
	PvXF0JTZUHw8/Ig8P116SsCFpstANq7uiZgKvCl6OuR7kgeekIqOQMP9er+xbGSKT2uvy4/zP2PEG
	IkaIBUW32f/QlIXR1P0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzviK-00000009NP7-3ATq;
	Tue, 10 Mar 2026 11:57:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgg-00000009Khv-3WZa;
	Tue, 10 Mar 2026 11:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=FfSzQd7kv4UrwUhbLdoRlPs9cYP9/YWD1INFReBo/3M=; b=TVARC1p8QYGQclGFQvWJiE2bcP
	BT0FxEYm4IqMa/YGyNQCGQ9CKMdjsZmT1Y5mIj3nssYD8V1BfmO9KjmmJDGx1ud76mkUZqwXIY81O
	jTe7bKrBZ2VDaO6klFst4sjav+zhnVmVJsOKalfRNUSFbOsW1j2ZZ8lpYOuP8Cc6dCqUbDfbkDyh/
	PVH7SCBn9kZHRMkaI0It4f3JUwzc8HzkeK0o+JPCzm3oroULJSx00uh1CnFKoOVV3MB90LMsYUMNb
	FmHR8elH6yVt5Jy+6T23h6Q9innDcU7LFZLemQ6vJ55G8dgHmm51uEE9Z4ItBn1+WM8M5FkL4ZUut
	oLa1YJ4w==;
Received: from mail.avm.de ([212.42.244.120])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgX-00000007ldE-2jXV;
	Tue, 10 Mar 2026 11:55:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143726; bh=7kdqP+tYIFKXEbW/CcutoIH+BaTJGO9lG8xGd+KBKlA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nh38mtwHyUV9SKw+BNpXSRFMzfO8/FcrsieQzDWw9oji2O+z7Psbni6v7KAffehjx
	 qmid8HatIGHMRnktoTMo9XRdUV6Ztkx3lRZel+NdFrmuz3TY6gos5gVQP+DoaQPsNi
	 ndWgzemtoyfAka1Tah5hiKpjxy0BL5dDr2HvKeZc=
Received: from [212.42.244.71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006ae-b734-7f0000032729-7f000001c0a2-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:26 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:26 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:49:09 +0100
Subject: [PATCH 43/61] s390: Prefer IS_ERR_OR_NULL over manual NULL check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-43-bd63b656022d@avm.de>
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
Cc: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1168; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=7kdqP+tYIFKXEbW/CcutoIH+BaTJGO9lG8xGd+KBKlA=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAZn1sZXeMLIPVJuPMvtIFyA6+Lb/ZSleHAPf
 T0qLrc6EciJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGZwAKCRA0LQZT0ays
 20K6B/45z034OMVnc7IW5eSlZRm22idjp9lRSYx7bSAgasz9Q69aq8L0v4zLmsPUTUANCklIZV3
 Ky9LpL/JQ27BKEBlPFUkZv7HOQgdozWfUf51X/x0BdMhEpEPDFIJUTovRoUphEHN8rw1r9KUQDQ
 dRKeWS5ua07ZtP69du+2qOW1Bjj55fWBu+uxvI7fohNlQeSwssQzt0rpy3r+7xRxxg0LdKDF+Eo
 Y+QuFzLHRhLpEtgPju+jKGgQPeWyFuaSnteU1ZzTdDhjn5fvjXBJ7IuXzcVk6epAYwi3YolC11O
 rwheclTeEca9nqJY9eYYhG9OXtZeHQ7d173Po939eVnoDlQn
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143726-E3DCEA3D-4F569189/0/0
X-purgate-type: clean
X-purgate-size: 1170
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_115538_769314_574CE8E6 
X-CRM114-Status: UNSURE (   8.77  )
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

To: Heiko Carstens <hca@linux.ibm.com>
To: Vasily Gorbik <gor@linux.ibm.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
To: Sven Schnelle <svens@linux.ibm.com>
Cc: linux-s390@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 drivers/s390/char/tape_class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/s390/char/tape_class.c b/drivers/s390/char/tape_class.c
index b69430220a813e764ec1514c27ad486ac9e95575..aad4fff1faea69ae055b517910ec6467b14cb6e8 100644
--- a/drivers/s390/char/tape_class.c
+++ b/drivers/s390/char/tape_class.c
@@ -100,7 +100,7 @@ EXPORT_SYMBOL(register_tape_dev);
 
 void unregister_tape_dev(struct device *device, struct tape_class_device *tcd)
 {
-	if (tcd != NULL && !IS_ERR(tcd)) {
+	if (!IS_ERR_OR_NULL(tcd)) {
 		sysfs_remove_link(&device->kobj, tcd->mode_name);
 		device_destroy(&tape_class, tcd->char_device->dev);
 		cdev_del(tcd->char_device);

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
