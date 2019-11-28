Return-Path: <SRS0=Piv4=ZU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E64CC432C0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Nov 2019 12:57:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D15BF2176D
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Nov 2019 12:57:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KttFXuSW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D15BF2176D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=z5+AlIcGvRgMyb+oN0hEAyCJqKQolHu0TadCnJrBGsc=; b=KttFXuSWk/1arUZhjbXoAXPdVZ
	mFpLf1EXsYZhyhRAc5FNwhuulNvSVxWmo8+AmI20xGjTb436Dm0qiUbqLMPPAAYH9ElMJtS3wJPqj
	MhP6WGdf+bpz1h/ik4x5SBm3WTMvkdwa5yXDGOOiL6XVryV+A9/Gjfk47GEWbD244e69HqHosHCXz
	B+QNhusZblZxhgw7nHf7/QWO4qDGTObhtKXXwrf4qq2w9jd8XnNGTGIJ0rFJdVMhqYIdovEWxh4FL
	skF2VD04+pXmmFxpAsxyp9ZqzR1BUogz3Is3+j4LVz7FKC3LehXBgOE0fckxRB7AfJLOxZhm9X4AG
	7Np84Ueg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iaJM9-0004I0-Sy; Thu, 28 Nov 2019 12:57:14 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaJLm-0003sd-4T
 for linux-mtd@lists.infradead.org; Thu, 28 Nov 2019 12:56:51 +0000
Received: from orion.localdomain ([95.117.37.214]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MUY9w-1iRTe00XvE-00QSQQ; Thu, 28 Nov 2019 13:54:36 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] char: hw_random: intel-rng: use pci_get_device_by_id()
Date: Thu, 28 Nov 2019 13:54:05 +0100
Message-Id: <20191128125406.10417-5-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191128125406.10417-1-info@metux.net>
References: <20191128125406.10417-1-info@metux.net>
X-Provags-ID: V03:K1:EbWrMi3cKVLJ5grbOjx3/hSD38kPrYADX4wYa3I2tB+lljpckSy
 15HWVYCgNQbjb4Jw3Jq5wDzRihvWg1A40U38MsKdMEXp34A3CDPgBn18wQGaajyXKEeu5ay
 NsIDm3ieOx2cqQOzjrtF3v4KCOsDSDg4nKPQBitqKPLXkyvJNky+o2SHLXJPJQ6Nw06jjRO
 p/cWYppeb0dvhCnWHwmrw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:b3/pDDdW3UM=:HOt218E1TJBg5l8PwQMbn5
 w/I+vFLUvPQdEAp5cDPDg8n2h4ya8JtA1HanhyNAmcyh4vGsMgeYRXlZpmvZupMH+axBIuqxu
 pVFcwt4Sp1TMawpRn0F8Dv4vvffgxawkECTS8zzNlz8idaOZtBZbVNa8LAmWjXwgSKrkpSodl
 GnNhy4Pq+UMaqA5ikRxkqWeg9y/u5VllU0cKvl8g+g/brdHyCsqj1pXtL2K/n5bHFOTqC+rzu
 kI9M8bVpPIUPwYxM0aRhWZ6s8bTo4/CCiIDqsN2HAGB/iyPXUNnPROFJV7w+Z4IMLFcxMm2e2
 uNX+S+c0Mr2Q9jCug6/ntRuVhcBUpFChhRw1nCf3jlJi6Rrl7NU16lumMoqUoBmNSdO5ZBiua
 JDI+G2P254oeJieUNKspfKPMjXMZ+mVbeVUGIBV2EHkADJvn4zHbRZA8npJo2h4urY8LcjVCi
 F0McB4lBnIjPPbL/XyEZKdx53XUn8OTfNAdQWnk40u1SQ8cjqYLCjbdqw5YHP99HwciWY6qYw
 YFmBo7tZmLZuXvwd+B8O+8CiJ/K6lSUuZXn3RqDz18foPro7g1/IKzz3/623ktdU3AChdOCud
 BBaIsqme1ehxmVRejswtrs6qTMwX7saoU0f+2BbMnEWjKA+zrpvwppooxFiT9K/3JcsI4CRRQ
 C1lU8pQ5UCuTW1INIXckNLWG+HTBP7lmhcLKzmassUponhmRCYGY8LUwg+tC1U2V1s4NBM3DV
 M376+7mY/UZ2s/l0w27Lqhmv+C7hfea+YTSGQrNnOnNXBS4mFSGa/gsGiJXGg9qt+bXgnF4vx
 Wf6zkZEV35085jbvkNP9VGozwPbfIZsVTOE+NFgOcG+0J5BFDm3tdRJ5FqwaSS7iQU3gN9iQH
 yI5kHlzVQgjPoyZ/zF2Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191128_045650_533654_F7FA95C7 
X-CRM114-Status: GOOD (  11.44  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, vigneshr@ti.com,
 richard@nod.at, linux-pci@vger.kernel.org, rrichter@marvell.com,
 james.morse@arm.com, linux-crypto@vger.kernel.org, miquel.raynal@bootlin.com,
 linux-mtd@lists.infradead.org, linux-edac@vger.kernel.org, linux@roeck-us.net,
 tim@buttersideup.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Use the new pci_get_device_by_id() helper in order to reduce
a bit of boilerplate.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/char/hw_random/intel-rng.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/char/hw_random/intel-rng.c b/drivers/char/hw_random/intel-rng.c
index 290c880266bf..6b8d37a81166 100644
--- a/drivers/char/hw_random/intel-rng.c
+++ b/drivers/char/hw_random/intel-rng.c
@@ -335,8 +335,7 @@ static int __init mod_init(void)
 	struct intel_rng_hw *intel_rng_hw;
 
 	for (i = 0; !dev && pci_tbl[i].vendor; ++i)
-		dev = pci_get_device(pci_tbl[i].vendor, pci_tbl[i].device,
-				     NULL);
+		dev = pci_get_device_by_id(&pci_tbl[i]);
 
 	if (!dev)
 		goto out; /* Device not found. */
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
