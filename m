Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E56C43458
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2026 05:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Th6TG0+zGxVNS2a5QxDAC57mrltcOKObecKx8QJl5h8=; b=TJLtHFAiAxd5FA
	H3K/bk/rjBeJ9fzAJhcsgMSivrgDu4kqGf1+CeUvBwfbdtOVoP8hbxBfdVDUPRWCgQOFSrsNKqysL
	FIy9s7iY+/aQwb/eD4QOOO7NwehtI/CvWiLMK/mr/xyeN0j94kZ6dRdFMAW4VI424PmBP4Ypopfyr
	0YllbIXVtDQiU/3n05jr3N+wCwkPFJ0FyL7Q+9kd9aFnkqKAPiUJ9IBb0hrtRsjhlKmL/kuz1tNIb
	Ke+7ior9qIvEEQc1+fDtVvH3Wgwz3+VgcmCoCo7vaF1egOLqheHvsug07UaLS3ryppvk/3vaYaRhJ
	+E9Gz8Y/UL7i4wi6oPFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wenfN-00000000gnm-2Vjp;
	Wed, 01 Jul 2026 05:39:21 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wenfK-00000000gnE-1qwa
	for linux-mtd@lists.infradead.org;
	Wed, 01 Jul 2026 05:39:20 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowACHf7b+p0RqKd2HFg--.50385S2;
	Wed, 01 Jul 2026 13:39:10 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kees Cook <kees@kernel.org>,
	Finn Thain <fthain@linux-m68k.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: parsers: redboot: reject unterminated FIS names
Date: Wed,  1 Jul 2026 13:39:09 +0800
Message-ID: <20260701053909.53859-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowACHf7b+p0RqKd2HFg--.50385S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrW3CFWDuryfur4UCFyrtFb_yoW8JFW5pF
	9avry8Krn7Gr40yr47Ca1I9FWFgan5tFWUKFZxXwna9w18uryUtFWSkFy0qF1rGrWxJF90
	qFWDKF1rKFsrAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUO73vUU
	UUU
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_223918_892500_871EB9FC 
X-CRM114-Status: GOOD (  10.88  )
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

RedBoot FIS partition names are stored in a fixed 16-byte field that is
expected to be NUL-terminated. parse_redboot_partitions() used strlen()
to size the names area and later copied the same field with strcpy(), so
a malformed table entry without a terminator could make both operations
read beyond the descriptor.

Validate each accepted FIS name with strnlen() before adding it to the
partition list.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/mtd/parsers/redboot.c |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/redboot.c b/drivers/mtd/parsers/redboot.c
index bf162c44..120b2eab 100644
--- a/drivers/mtd/parsers/redboot.c
+++ b/drivers/mtd/parsers/redboot.c
@@ -192,6 +192,7 @@ nogood:
 
 	for (i = 0; i < numslots; i++) {
 		struct fis_list *new_fl, **prev;
+		size_t name_len;
 
 		if (buf[i].name[0] == 0xff) {
 			if (buf[i].name[1] == 0xff) {
@@ -203,8 +204,14 @@ nogood:
 		if (!redboot_checksum(&buf[i]))
 			break;
 
+		name_len = strnlen(buf[i].name, sizeof(buf[i].name));
+		if (name_len == sizeof(buf[i].name)) {
+			ret = -EINVAL;
+			goto out;
+		}
+
 		new_fl = kmalloc_obj(struct fis_list);
-		namelen += strlen(buf[i].name) + 1;
+		namelen += name_len + 1;
 		if (!new_fl) {
 			ret = -ENOMEM;
 			goto out;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
