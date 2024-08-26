Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E6AC5321D
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 09:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y3tMgjxTJbZEbQZ2S2H3yIC0KEs7i07sILFye/sSSI4=; b=T5PdYn0yRGL6hm
	g/nKXCVlZlOwg8TPZ9FEU7mlot308pRJXm0NLl8V1vxBu/06aXq2QlQovY7CIgmcs4Nb2Gu0Mnqnc
	Ss+GxO3Tik1vKCMs5J0S2+h9ljgrqYfbo5PWFWdi65H+lWfv52KwA37xixhFkvSV43lWjbVlZXsM0
	aip9xLrubgiD4hQVUNpcvqEiAsyz0LbHsEMmPK9LPu7l+l7mQpxD1NauET6vaCBjEe8/QQKHN4DiC
	MR+rwuel2jVp+XrnOv6jZkiErFrmeK4vFQROrOIpAM7NEiZHoE/euD1S+xZWUEthSwauv4Chwem6p
	2qe3pgAH3EK+mQeP0ZpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWMs-00000006lmW-2SxW;
	Mon, 26 Aug 2024 09:50:34 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWJ0-00000006kSv-2sHa
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 09:46:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 34164C0004;
	Mon, 26 Aug 2024 09:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724665592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=75tL+s7eZsTmd9v1rzcctzMPqyjZj3/jUEvEyUxsnoM=;
	b=a3iaLlEUia8TFN7S5AhSRg/gh26oKyoiIKvyzYKmX5JZmPBzRFWMTs28ylTGj4irFBt3RK
	WXzynVVtxf5NaoxyTiMM0QnTp58qyqwc8SBXST3u4riajunFLRqxkRp9yDnqv0pAaVRYEN
	gmgbisobFId57hiGGBaPWY7vdWIruBN3+d8Nb3uK1wZwUHqZ6Tgri0sKOrQ5eA39hIVVb9
	dZe2fWd2xAF+kcqxQ36fM1IoKjRC0W4BhMSMCRs+THOfM3aWeuVeqfyVZrkKGfHCakRQWK
	O+CUlhKtVaJpftLipqtQfnUMXsm4Fxigl/Ct5x5au37iIr76zX0wT7K0zVwvxg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH mtd-utils 01/10] nand-utils: nanddump: Use a specific variable for the buffer size
Date: Mon, 26 Aug 2024 11:46:20 +0200
Message-ID: <20240826094629.19065-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826094629.19065-1-miquel.raynal@bootlin.com>
References: <20240826094629.19065-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_024634_901163_9B8529C8 
X-CRM114-Status: GOOD (  11.68  )
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

The read buffer size happen to be as big as the bs variable, but this is
going to change. When accessing the buffer size, use a specific variable
instead.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 nand-utils/nanddump.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/nand-utils/nanddump.c b/nand-utils/nanddump.c
index 47539f5..346af1e 100644
--- a/nand-utils/nanddump.c
+++ b/nand-utils/nanddump.c
@@ -332,7 +332,7 @@ static int ofd_write(int ofd, const void *buf, size_t nbyte)
  */
 int main(int argc, char * const argv[])
 {
-	long long ofs, end_addr = 0;
+	long long ofs, end_addr = 0, readbuf_sz;
 	long long blockstart = 1;
 	int i, fd, ofd = 0, bs, badblock = 0;
 	struct mtd_dev_info mtd;
@@ -362,8 +362,9 @@ int main(int argc, char * const argv[])
 		return errmsg("mtd_get_dev_info failed");
 
 	/* Allocate buffers */
+	readbuf_sz = mtd.min_io_size;
 	oobbuf = xmalloc(mtd.oob_size);
-	readbuf = xmalloc(mtd.min_io_size);
+	readbuf = xmalloc(readbuf_sz);
 
 	if (noecc)  {
 		if (ioctl(fd, MTDFILEMODE, MTD_FILE_MODE_RAW) != 0) {
@@ -462,7 +463,7 @@ int main(int argc, char * const argv[])
 					end_addr = mtd.size;
 				continue;
 			}
-			memset(readbuf, 0xff, bs);
+			memset(readbuf, 0xff, readbuf_sz);
 		} else {
 			/* Read page data and exit on failure */
 			if (mtd_read(&mtd, fd, ofs / mtd.eb_size, ofs % mtd.eb_size, readbuf, bs)) {
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
