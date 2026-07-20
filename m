Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE50FC44515
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2026 11:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8VhR7enBUkdimL20XUnQZp2Llb7QAFPs/sDkgnYBr30=; b=mOXRNq8NW+4u1k
	kucAY14+X53Qjd0ShsWxhZOjHwTzGdONWBdcBWma76gL8ZzqAENA8FxcgU0OwKEBiKW8R+kd6hv24
	mkjSva6zzYSPz/rSEeFrjKOjx23Ey3c7eVRUslVdfXowPvY2e2K55DGFKA/ef8U+wglI8pNZx0AxE
	KXe/n0CHH5HOJ+2ICMlp+3XoEZoOH0bThP3OinXWaDkycJxZr6hxoxwcnDpORz4E5WiZldZ67M3DS
	lQPwPS206dewVcGTBTyc/tdXnqoq2KfIT28kdiC8ibEC8oIBEg4X1bgQfMDzWVQAIw6k1urb2av6U
	0+NWkG85uT1xnuLvaPsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmcl-00000006e9s-0LNI;
	Mon, 20 Jul 2026 11:57:31 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmci-00000006e9G-0Fm9
	for linux-mtd@lists.infradead.org;
	Mon, 20 Jul 2026 11:57:29 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowADHNUAlDV5qCNuIAA--.52364S2;
	Mon, 20 Jul 2026 19:57:25 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Huang Shijie <b32955@freescale.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2] mtd: rawnand: validate ONFI extended parameter page sections
Date: Mon, 20 Jul 2026 19:57:25 +0800
Message-ID: <20260720115725.10096-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowADHNUAlDV5qCNuIAA--.52364S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWr15ur4xKr1rJry5KF4DJwb_yoW5WryDpF
	4F934akws8J3W7Z3sFka1DCFyFy395GFW8GFyfu34Yk3ZFvr1vkas8Kr1jvFnrKay8Cry8
	Xrsrt3Z5C3W5Ca7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUnGQDUU
	UUU
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_045728_478232_CC294980 
X-CRM114-Status: GOOD (  14.77  )
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

nand_flash_detect_ext_param_page() allocates the length declared by the
ONFI parameter page, then treats the data as a fixed header followed by
variable-length sections. It reads that header and advances over sections
without first proving that the fixed page and each current section fit in
the allocation.

Reject pages shorter than the fixed header, track the remaining variable
area while walking sections, and require the ECC section to contain every
field read from struct onfi_ext_ecc_info. Use device-scoped diagnostics
that identify the malformed ONFI section.

Fixes: 6dcbe0cdd83f ("mtd: get the ECC info from the Extended Parameter Page")
Cc: stable@vger.kernel.org
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260715084226.38336-1-pengpeng@iscas.ac.cn/
- replace generic pr_debug() messages with ONFI-specific dev_dbg() diagnostics
- keep the low-cost bounds hardening conservative because the page is
  CRC-protected
- rebase onto v7.2-rc4

 drivers/mtd/nand/raw/nand_onfi.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
index cd3ad373883e..b5e304c35738 100644
--- a/drivers/mtd/nand/raw/nand_onfi.c
+++ b/drivers/mtd/nand/raw/nand_onfi.c
@@ -35,16 +35,21 @@ static int nand_flash_detect_ext_param_page(struct nand_chip *chip,
 					    struct nand_onfi_params *p)
 {
 	struct nand_device *base = &chip->base;
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct nand_ecc_props requirements;
 	struct onfi_ext_param_page *ep;
 	struct onfi_ext_section *s;
 	struct onfi_ext_ecc_info *ecc;
+	size_t remaining, section_len;
 	uint8_t *cursor;
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
@@ -77,11 +82,29 @@ static int nand_flash_detect_ext_param_page(struct nand_chip *chip,
 
 	/* find the ECC section. */
 	cursor = (uint8_t *)(ep + 1);
+	remaining = len - sizeof(*ep);
 	for (i = 0; i < ONFI_EXT_SECTION_MAX; i++) {
 		s = ep->sections + i;
-		if (s->type == ONFI_SECTION_TYPE_2)
+		section_len = s->length * 16;
+		if (section_len > remaining) {
+			dev_dbg(&mtd->dev,
+				"ONFI extended parameter section %d exceeds page\n",
+				i);
+			goto ext_out;
+		}
+
+		if (s->type == ONFI_SECTION_TYPE_2) {
+			if (section_len < sizeof(*ecc)) {
+				dev_dbg(&mtd->dev,
+					"ONFI extended parameter ECC section %d is too short\n",
+					i);
+				goto ext_out;
+			}
 			break;
-		cursor += s->length * 16;
+		}
+
+		cursor += section_len;
+		remaining -= section_len;
 	}
 	if (i == ONFI_EXT_SECTION_MAX) {
 		pr_debug("We can not find the ECC section.\n");


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
