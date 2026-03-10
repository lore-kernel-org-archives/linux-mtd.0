Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38C2EB1057
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ONxEEWwusa9bChiC2e/um/o8u9qZ/E4ehwa63bdRFc=; b=MN3h3UHLZsrcGJ
	7kEwA41TQYREcTZ6BELo4JBZQgjK6DbObX5edMBjVo20eQc8qWu0rSgcwZlKbPahH47E33mloLKTr
	oLob8fw1gL4t0pF8hUsXEj6f0zDFFlC075Nc3CvGHS3olKhDypBhqWmHWACx8B74UzZiaUVEFiiNU
	1ZUpS4I3U3Anz5VAM0c0lWyXsk0AbKzY24Pp/4EN595RgANLVwtpjCRRWOHOe/DxGrwy0LRett8E0
	wzcQLCWlau2SZA4LbqbhsP5RK0C4guJ+Q8AHE0/Tau3i0/VJd+H2PUc4fcoD76Y0AZDx3GngBGr66
	ZpyhAZo4COSkOY0FBphA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzviM-00000009NSr-1sP7;
	Tue, 10 Mar 2026 11:57:30 +0000
Received: from mail.avm.de ([2001:bf0:244:244::119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvge-00000009Kbs-2FYn;
	Tue, 10 Mar 2026 11:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1773143728; bh=ZbyyRff0LT6QULh5d8SMPc41iTaBzP0/3JVOQy1bx0k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aVdcR7RTuv8C7CerJpQOdVZlvXCBSYXBl1Kv3fGDCxhNKTGGiEGlaXMofbFocGsc4
	 PzD9er4ULxnCoKhdyrJwuV7PXDV42OgML5UN/9dor/cwn1OQ+AYgKJ5KgncLE+Nq9J
	 Tp/LrzPDmFSH5N41KkG4TAeS71Wuyf5xaF4BLtTc=
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006b0-2367-7f0000032729-7f000001c9d2-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:28 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:28 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:49:15 +0100
Subject: [PATCH 49/61] media: Prefer IS_ERR_OR_NULL over manual NULL check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-49-bd63b656022d@avm.de>
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
Cc: Shuah Khan <skhan@linuxfoundation.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=ZbyyRff0LT6QULh5d8SMPc41iTaBzP0/3JVOQy1bx0k=;
 b=owGbwMvMwMVoossWfHHNmtuMp9WSGDI3sNXOaG8LSpQxY8hSPVKqIh1pc5sxIOPz7VZbeXXdX
 ZHfDi7vZDRmYWDkYpAVU2SxzPmQuzbhSoEJ07IZMINYmUCmMHBxCsBETr7kYJhV9Mu9xk6ccYGt
 z5eI8srl4dfXXYqUXRzEX+fI1uJjH6WxrLeo7biojv5WpVXreE2zezbYn9tpWFQcfdhA7GboGts
 YsRtM2Sv+M4kcacuwnNqZvb/GZGJWrZS8LE8bh/QGFvGyvRsUfnm1/N3xyXReUlT8crHiVPEW88
 th9t3G59lklUJeXporbNhhPOddhfW2O0w/bnRvOz2h//fC3tr8X+mn7tezeLhE/9TY8ugub9qq6
 ED20BjzW2dmxov+rXp6lOvAkub/n+Z/6nD5cFX/zdFNpRcPRKxfsPR8nlf6/VdXbs812Sme8b7r
 xv6PtjP3CotJpB81uFK+Mnp2gw1/TIQQc7bV7OyuT17mAA==
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143728-1F4BEE1F-D1FCF248/0/0
X-purgate-type: clean
X-purgate-size: 1139
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_045545_013288_DDD00820 
X-CRM114-Status: GOOD (  10.50  )
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

To: Shuah Khan <skhan@linuxfoundation.org>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 drivers/media/test-drivers/vimc/vimc-streamer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.c b/drivers/media/test-drivers/vimc/vimc-streamer.c
index 15d863f97cbf96b7ca7fbf3d7b6b6ec39fcc8ae3..da5aca50bcb4990c06f28e5a883eb398606991e9 100644
--- a/drivers/media/test-drivers/vimc/vimc-streamer.c
+++ b/drivers/media/test-drivers/vimc/vimc-streamer.c
@@ -167,7 +167,7 @@ static int vimc_streamer_thread(void *data)
 		for (i = stream->pipe_size - 1; i >= 0; i--) {
 			frame = stream->ved_pipeline[i]->process_frame(
 					stream->ved_pipeline[i], frame);
-			if (!frame || IS_ERR(frame))
+			if (IS_ERR_OR_NULL(frame))
 				break;
 		}
 		//wait for 60hz

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
