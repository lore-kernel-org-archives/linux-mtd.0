Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C9BC77B75
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Apr 2023 12:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1xOJTqzSNsP51wRKN5QFXgrBaWVevo4uWL9egaEL94I=; b=45RUi8F/UTA3Nq
	bhajQeoYf+51Ww4iU28xFDrLR7OHrT4KD9fjkTJ557atByO35t+7MQomeLKM9KC/9EDSdgy/dcLCW
	L0ZbI+k2W57qAj82OpbtYsPhYi362OqOnp7RifxOhpi8b/63tFByWNskjdte8VSoTrmHbGtvTvX1j
	SShtg/hBcwp/x+IFuQpf6+Ty0jRXTuZcqpjRJ1libclNIv9qbl3TV6/N2PZLUhR24Ymq8z/1fUzmE
	A4Rwi7BxS/QZwoY3wR3YitM688jwxwe0W3ehLBgOWSoWnxRKpE+glHrFY9woKdmfuuvZCpa3mG0bb
	XJ261XNmvtwloXi3QbvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pokQX-00280a-2T;
	Tue, 18 Apr 2023 12:27:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pokQU-0027zb-1n
	for linux-mtd@lists.infradead.org;
	Tue, 18 Apr 2023 12:27:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 219C963196;
	Tue, 18 Apr 2023 12:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303BEC433D2;
	Tue, 18 Apr 2023 12:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1681820833;
	bh=cEzvS5up4NWFY3Crm0XGyRgtbdIq0JCQAgVI7KcWIdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=0LTMrLoiBb1dKQh5brsnJ4nD9+cpWoCw6sp45gcD+4V/jUWjel191Te0yYRNkEqG4
	 rg/HIBpowZsl8NfA7UlFH6A0HsG1Mi/BaBbt1MVeMaeGUkmfDNIlCJJRyWJnpBnan5
	 EUuRmzCqtQrq2m7KZp5SsOQ9eZyJ1BYLbTkGMEiE=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Lee Jones <lee.jones@linaro.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 4.19 49/57] mtd: ubi: wl: Fix a couple of kernel-doc issues
Date: Tue, 18 Apr 2023 14:21:49 +0200
Message-Id: <20230418120300.454570089@linuxfoundation.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230418120258.713853188@linuxfoundation.org>
References: <20230418120258.713853188@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_052714_629937_FE4EB435 
X-CRM114-Status: GOOD (  15.10  )
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

From: Lee Jones <lee.jones@linaro.org>

[ Upstream commit ab4e4de9fd8b469823a645f05f2c142e9270b012 ]

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/ubi/wl.c:584: warning: Function parameter or member 'nested' not described in 'schedule_erase'
 drivers/mtd/ubi/wl.c:1075: warning: Excess function parameter 'shutdown' description in '__erase_worker'

Cc: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Link: https://lore.kernel.org/linux-mtd/20201109182206.3037326-13-lee.jones@linaro.org
Stable-dep-of: f773f0a331d6 ("ubi: Fix deadlock caused by recursively holding work_sem")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mtd/ubi/wl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 7f0847ee53f28..210866614f492 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -568,6 +568,7 @@ static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
  * @vol_id: the volume ID that last used this PEB
  * @lnum: the last used logical eraseblock number for the PEB
  * @torture: if the physical eraseblock has to be tortured
+ * @nested: denotes whether the work_sem is already held in read mode
  *
  * This function returns zero in case of success and a %-ENOMEM in case of
  * failure.
@@ -1046,8 +1047,6 @@ static int ensure_wear_leveling(struct ubi_device *ubi, int nested)
  * __erase_worker - physical eraseblock erase worker function.
  * @ubi: UBI device description object
  * @wl_wrk: the work object
- * @shutdown: non-zero if the worker has to free memory and exit
- * because the WL sub-system is shutting down
  *
  * This function erases a physical eraseblock and perform torture testing if
  * needed. It also takes care about marking the physical eraseblock bad if
-- 
2.39.2




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
