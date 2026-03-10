Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE55FEB1058
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8IYbXlEcTWW42ICZwK78Zb6bezYGl80QCLCMBm0jSaU=; b=koC+mlCAAU5eyP
	l2KTQdHijnujNPxE36GBCyoNQPJtmJrxHCvFE3dqNHdR9B6a/bcfx2xeIZRMSjFzDzXbjpahXmil1
	am5crzflhQ2hxg1iXEVhA6CAU2nYS8kYEm1936nxFbJKdnYTIzXLhXMpNhmcfjyfhqoL9xGp0gke1
	ePHKJTGGjQRZfbQV3RlpaLaW8sXqGytibOwrRCCXgXjzxsU46FQnh8i7oXjnCYCOApccn7yxPdY3B
	T9JGesZ4xOlWM9NL+2tOkl5VTGfGSV4bKkZ/qAkMSAQx1fXwoepKGIydPJH9o0mz7jkpQYrEkkg7f
	EDsdAMzAvNuXikUgyZVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgp-00000009KxW-1tyj;
	Tue, 10 Mar 2026 11:55:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgT-00000009KQ7-27Gy;
	Tue, 10 Mar 2026 11:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=x3fJnbtkYl6K0I0NQZZfdxYUdlec3ZKNUOa5GtYQQpw=; b=GXyq+TOJRvWiorRx9SGz7swvfT
	nbZdCrcNk9tivZa2NAnpOWc3La2gWhklIFfGlbcRKVebgnwc02VChQp/A3rbz2r2IBEziEFuR9C4f
	p0EQocmQAmAyVxC/khiRMkqDXDCHk9GA/6/4us/nwMGCw54CqmRLLnb9KviuWA+7L65mGgsEsnJ8s
	e2OKY5Wxz84hnXRG+tscF58uNCTaKU1knHe45cQte2QsbNQF6w0ks8kcrlrylpChdaMmOfxiTwAwr
	Ru+HXQqdMQL+KvmuLej5iHVQm80xMXd9jKePiLosgSRLERDLeHmI6BR3u9y3XSTbTdrxYJaCQtXi5
	fIfwc6Ew==;
Received: from mail.avm.de ([212.42.244.120])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgO-0000000EQ4f-1uOq;
	Tue, 10 Mar 2026 11:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143724; bh=I6Je7s2Ep1qm9Op1Es8XHv3XLRiGLKRoF2kXcmkzRQ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TfMCcK8cpiyaOKFFZdA9Md6WNn5KRFS8tSOkSqLD2Jxk5OZPSDDv9UFoUEeAaWCfO
	 ihOoPJUrphZnBRuSVIXmC+zIb35xahiq+vRkcauUTds8dKZ24Y/dr6SYjxVJU0FDdx
	 AKL6kc8+lTp5jQ7C+ooCXPOvtrcw/oxBU6qxFp7Q=
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006ab-b734-7f0000032729-7f000001c010-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:23 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:23 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:48:45 +0100
Subject: [PATCH 19/61] kvm: Prefer IS_ERR_OR_NULL over manual NULL check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-19-bd63b656022d@avm.de>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=938; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=I6Je7s2Ep1qm9Op1Es8XHv3XLRiGLKRoF2kXcmkzRQ8=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAYW4R9Fa4g/yA6j9ZuKFu5I9Vr4Ret7hyOjN
 JwNhe7zVlGJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGFgAKCRA0LQZT0ays
 20QXB/4yM/Evr0C2rYQNWNfwS8E/cG5fl6s9dPrv/gvVYGXSEh8UExGqU9cLwxKHIKVMA5Lse9f
 LrwiXfgnVbG/jY2aDVr8SKAe8jTMddJh/8QeSjkaMwizAfr4QJuiagDa0h2xOKqhGpCOZN//1dy
 f1A425zzalFgQcP/cTon5ZDxtSFbyqutr29XmKKCwwHv2Q8Ku8umjOLZX7dw/4OhOp8cL1xvis1
 1HNcIwV+v3AkQdaY3X17qkaSSKgp3UINnn82IlkzUYd1D589D9+xD3Ra8N0AS0tymC/zbV06vOe
 lGeSrKAmlJiZ7dD4DXHr90X7Cpb/daCyNPsSKKM+Lq3HwsE1
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143723-DFDD6A3D-9438E50C/0/0
X-purgate-type: clean
X-purgate-size: 940
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_115528_660764_A301D330 
X-CRM114-Status: UNSURE (   8.84  )
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

To: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 virt/kvm/eventfd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 0e8b8a2c5b791243e230a91124d32fcc0250a0c6..4099dd11626009a3497ad09994ba6bc1b8211536 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -508,10 +508,10 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 	if (irqfd->resampler)
 		irqfd_resampler_shutdown(irqfd);
 
-	if (resamplefd && !IS_ERR(resamplefd))
+	if (!IS_ERR_OR_NULL(resamplefd))
 		eventfd_ctx_put(resamplefd);
 
-	if (eventfd && !IS_ERR(eventfd))
+	if (!IS_ERR_OR_NULL(eventfd))
 		eventfd_ctx_put(eventfd);
 
 out:

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
