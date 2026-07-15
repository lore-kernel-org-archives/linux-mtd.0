Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FC3C44501
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jul 2026 08:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P1qv1bKygTy+6eLSMK4j25hEPMI1kJi+CGWjoYSzCzM=; b=ZK49vp57qRG/88
	wWzKB2OrOcsIR/v61qu4Z8ISnsa6avHwPgJ4JXIHUPjlVBw2jJMyO4djYPabILCN1dc2AUedzGi6M
	1IpYeW5nAoEjrLdNFVhVtghiYlrhLBGImgiGlqDwAToeSX6ZtOOKNctONRKSYbi9gFk37GyNUdzN5
	RfcxXuy+pFARt8FgKt/8zeMsd7UcJ2EdOD1iVYbtRagjGYRpN2cv8mqB2fvirHM0RpQ3RzZDd8Qtn
	5i2zD7P1y0wWUyLgP8p6Z9oQxJ2NvNPB5nQ6cNGz3WhjBI2c5daLXTK4PTcHEABTCMA//1VEDtZr3
	z+rbq4fpc1dNsPQBG3RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvCN-0000000EBNr-24tD;
	Wed, 15 Jul 2026 08:42:35 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvCK-0000000EBN8-04Oh
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jul 2026 08:42:34 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABHntHyR1dq9GpHGA--.31102S2;
	Wed, 15 Jul 2026 16:42:26 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Huang Shijie <b32955@freescale.com>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: validate ONFI extended parameter page sections
Date: Wed, 15 Jul 2026 16:42:26 +0800
Message-ID: <20260715084226.38336-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowABHntHyR1dq9GpHGA--.31102S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr1rXr1rCF4rWFWfKr1kuFg_yoW8uw1fpF
	4Yk34akw4DJF47Zwn7Ca1DCFySy395GFWUGFyru3WYvwsIqrn5Kas8Kr1jvF1qkFy8ur1F
	qrsrtFn8CF15CaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j
	6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUTnQ
	UUUUUU=
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_014232_441378_5380A41B 
X-CRM114-Status: GOOD (  13.19  )
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

nand_flash_detect_ext_param_page() allocates a length declared by the ONFI
parameter page.  It treats the returned data as a fixed header followed by
variable-length sections.  It reads that header and advances over sections
without first proving that the page and each current section fit in the
allocated buffer.

Reject pages shorter than the fixed header.  Track remaining bytes while
walking sections.  Require the ECC section to cover every field read from
struct onfi_ext_ecc_info.

Fixes: 6dcbe0cdd83f ("mtd: get the ECC info from the Extended Parameter Page")
Cc: stable@vger.kernel.org
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/mtd/nand/raw/nand_onfi.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
index cd3ad373883e..40b7db10bd73 100644
--- a/drivers/mtd/nand/raw/nand_onfi.c
+++ b/drivers/mtd/nand/raw/nand_onfi.c
@@ -40,11 +40,16 @@ static int nand_flash_detect_ext_param_page(struct nand_chip *chip,
 	struct onfi_ext_section *s;
 	struct onfi_ext_ecc_info *ecc;
 	uint8_t *cursor;
+	size_t section_len;
+	size_t remaining;
 	int ret;
 	int len;
 	int i;
 
 	len = le16_to_cpu(p->ext_param_page_length) * 16;
+	if (len < sizeof(*ep))
+		return -EINVAL;
+
 	ep = kmalloc(len, GFP_KERNEL);
 	if (!ep)
 		return -ENOMEM;
@@ -77,11 +82,24 @@ static int nand_flash_detect_ext_param_page(struct nand_chip *chip,
 
 	/* find the ECC section. */
 	cursor = (uint8_t *)(ep + 1);
+	remaining = len - sizeof(*ep);
 	for (i = 0; i < ONFI_EXT_SECTION_MAX; i++) {
 		s = ep->sections + i;
-		if (s->type == ONFI_SECTION_TYPE_2)
+		section_len = s->length * 16;
+		if (section_len > remaining) {
+			pr_debug("The section is invalid.\n");
+			goto ext_out;
+		}
+
+		if (s->type == ONFI_SECTION_TYPE_2) {
+			if (section_len < sizeof(*ecc)) {
+				pr_debug("The ECC section is invalid.\n");
+				goto ext_out;
+			}
 			break;
-		cursor += s->length * 16;
+		}
+		cursor += section_len;
+		remaining -= section_len;
 	}
 	if (i == ONFI_EXT_SECTION_MAX) {
 		pr_debug("We can not find the ECC section.\n");
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
