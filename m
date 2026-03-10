Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92632EB1055
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wpIkRE7Qlsdy9Wa8UQBWzUVkgg5xKF4Et1mv3U9gONI=; b=cvOctS2ZypXbA1
	PHaiQXXifS04aC9TzhzFLak6FJuQXEnJ+bKiljXSwI2V7bUoG6Z11TgI9gCf2Ka93igZVf1nmJpuc
	Cj9HQmlTv0nCVLT+dqPyr9m1xxF6LINAMaPtyKaLB+l0WRA5i5mnc/tgeiZlRLwXyw64JeaE0XO12
	gk6v/KiWgxjbOvPj4POMAyEmCxrKQKMpQtETRh+fI7CqwH4fIe7duBdeP40PWSzEyQ0qYilnxWasv
	VV9d4Vpl+fZ0T46v9FJ0LY0BuMa7wyHxPOKgwDbatsSpJ86lO/4fnRAoeFAblLz77gXwm+OLHnHSi
	asZlj5u5WQgp27rAexEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzviV-00000009NmN-0aZt;
	Tue, 10 Mar 2026 11:57:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgj-00000009Knb-2fsp;
	Tue, 10 Mar 2026 11:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=dTXCjBRniTLoTR5IZDzkCFvkxhSidV7zyOsOCp6MmUg=; b=djqgfQYSow3D5JXVzKG4UEb38H
	s/Ft6W2+x+r0+t8Op59c4xamfkS4oemcj/N6K7yyJbodgjfDSIHEfJQpSmHJE9C5mcSZ0Hxf+ZQvN
	m9VuzI6fRT3W0dHGVXYUJCjlUcbHzgFvrAF3XJwUIU6fDwXuzx9TpAPeWwyzA5vU+RidbCINcyn8y
	xfMXSr5TfDMGFZ0Wvh/nWbKB6ntBXI0a0xGWGExIkAAMVmltzg0zMq1yTtnxwvGGqLkJVr5D63+eD
	Akt3bKifrN+wT8OMc4MtybPAm9ZslZ02wBvQUHDLzNVv1rvUKsiVE7d9ghot7A5dc76u+HHAcIZRE
	RQnyWgDQ==;
Received: from mail.avm.de ([212.42.244.119])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgT-0000000EQ7T-3yt4;
	Tue, 10 Mar 2026 11:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143724; bh=kiPG2WUM9IIy6uswgVTVvYBzahqCQdDF2WT1QCoS/Vw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZhZk+uUNXnEjnXl3w1yfhkldMOPDqhhLXZDAMjGv1auPlOiTaiSmNuwae77r69zpo
	 wcrpRdQM8a/BZjLbD65ntammcni0DoJ16RicrUwWgtwucTmCe9C/jdQpatxzC+dLyR
	 7BX2TKdOEfp7WLvyJKm7RVbstZgrWU81uOV3ziCw=
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006ac-2367-7f0000032729-7f0000019d32-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:24 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:24 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:48:40 +0100
Subject: [PATCH 14/61] seq_file: Prefer IS_ERR_OR_NULL over manual NULL
 check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-14-bd63b656022d@avm.de>
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
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1255; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=kiPG2WUM9IIy6uswgVTVvYBzahqCQdDF2WT1QCoS/Vw=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAYFWY4XXOtO7D0H7zI3NI24qzy0WRyWgjhsq
 Pb/2PtoUG2JATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGBQAKCRA0LQZT0ays
 2/mIB/9Q6s+1zeiVLXadpRpmyYqAancRy7Bn2FComUQinQhHrSfolPuiVxb6YyfHfnSDtXR2P+o
 ZC/nc1mJGpByDWP4SS6acK19nNK/UVhicQydNeQRM17jmZovojRAWhs2/Nh6sutbizWZwHsYvxg
 dtISFMErQIBKR+INYDqNnYmu1VPajdqnQ2qfmPWd9l1FO4V1847kZKmczXV6MF80eYNGSPwebB7
 l5j+3Vv8ufK5FuVMTE1IDmjxjEXHtLbmfXLvEEcTc8Z+XvV4Rj3NOSWzcbcpJ8pMZ35IaPEecEu
 E1IfNqm4CamuHsKtBBAJcEXcTCoiSwuZuARjawKppxNaRDTT
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143724-84C8DE1F-2119C3CC/0/0
X-purgate-type: clean
X-purgate-size: 1257
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_115540_981101_94765FFE 
X-CRM114-Status: GOOD (  10.40  )
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

To: Alexander Viro <viro@zeniv.linux.org.uk>
To: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 fs/seq_file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/seq_file.c b/fs/seq_file.c
index 4745db2a34d12b1084cb059a667c367f4fb56dad..da30cbd6485ca8eff6c2572eab10659c694387d2 100644
--- a/fs/seq_file.c
+++ b/fs/seq_file.c
@@ -226,7 +226,7 @@ ssize_t seq_read_iter(struct kiocb *iocb, struct iov_iter *iter)
 	p = m->op->start(m, &m->index);
 	while (1) {
 		err = PTR_ERR(p);
-		if (!p || IS_ERR(p))	// EOF or an error
+		if (IS_ERR_OR_NULL(p))	// EOF or an error
 			break;
 		err = m->op->show(m, p);
 		if (err < 0)		// hard error
@@ -266,7 +266,7 @@ ssize_t seq_read_iter(struct kiocb *iocb, struct iov_iter *iter)
 					    m->op->next);
 			m->index++;
 		}
-		if (!p || IS_ERR(p))	// no next record for us
+		if (IS_ERR_OR_NULL(p))	// no next record for us
 			break;
 		if (m->count >= iov_iter_count(iter))
 			break;

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
