Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CD1CAC5A7
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Sep 2025 16:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:From:To
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HTl2OZUPRAT9fhj0Nzs3pIV0oCJLRFRSfjWSUfr/olY=; b=HsEMjCZwbNR5/p
	jlzYWtvQ8w7M5oUbr2kwAluDcW5Ac+p4kQH0GZ4kvefZLiZdWXeUJbWvWYC6Od7UEdeP6ez1UBm8u
	Sgn3MGz38Hzqy/JkiFGqsgd+VYURvNwgFHLzFsfsT37d9txduPZ0Qh0Bp8vwdHQ2ZMFK3SvMIchQq
	sPGNlitVMKboEaZt8PAPQ9JLGMfpO52/QPxS0jNVRRvJfnMhRgqrzStza8Hbc2KsM1yylDpThwmRD
	0/owCBnl137DPCZZzP9EX/bd4o85kR3Jm2+2cJBZL6ayM7LNZ/9tUTSITgZBtaBTngpGogaotFH7f
	gCnB934p1VZPG6OHq4BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ogz-0000000B3D6-22Ud;
	Thu, 25 Sep 2025 16:19:37 +0000
Received: from mail-07.mail-europe.com ([188.165.51.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ogw-0000000B394-3EwM
	for linux-mtd@lists.infradead.org;
	Thu, 25 Sep 2025 16:19:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1758817156; x=1759076356;
	bh=nLaWytU+ozWx5gzmV6EXmHhgOBTPqDcKfP1f0iAMh3E=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=UZYC2HAKAOTm8zuBgA96X5uKYNbIftwCJFQlzP/BuaEyk44LHP/mT4K6p6z/hOYzJ
	 Y5a0vDylEQDUqMCJv0XKtVQTRm7xdtMILI41cbeNTEmuF+fiUcrMpCKD2e8l1egnyA
	 LH086yE6yxqzz/Q9svARAmAIfT24XX7M3LKgiDJrsd6Ve1kEefbmZqG9Gxb0wM8g09
	 FZyQ4jckve4cPY5f9pyki7+hhg7SWHq+S732PvVFYJAEL+KPdXQ7Or9dVF9FEMWzEm
	 KjYVv9gGFYPSZReZCf/+Eg8kJgdYFdH6DmANcHGFwlU4tioGP+g/oYOQsyiZhv0H3l
	 2sNYRTZLsXAOA==
Date: Thu, 25 Sep 2025 16:18:58 +0000
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Tj <tj.iam.tj@proton.me>
Subject: [PATCH 1/1] nandsim: add names parameter
Message-ID: <MH1D8MWgxkKk2KD0WqUL7nTAGxcRTln4gLTqw9-F1qYZfCNOM0nmzsYE0TZs1KceApusfqLF64ceBD25EybRzf7HuJNqQNBf_dqU-PrVLkM=@proton.me>
Feedback-ID: 113488376:user:proton
X-Pm-Message-ID: ba06f9df5a23744a8389c3a6f4581251dadcaace
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_091934_949765_0979CCD7 
X-CRM114-Status: UNSURE (   6.63  )
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

Allow naming of partitions.

Useful for simulating an embedded device even on a different
architecture and with the help of qemu-user debugging tools such as
flash updaters that expect partitions to have defined names.

Signed-off-by: Tj <tj.iam.tj@proton.me>
---
 drivers/mtd/nand/raw/nandsim.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index df48b7d01d16c..085b5e2b8a0a6 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -103,7 +103,10 @@ static u_char id_bytes[8] = {
  [3] = CONFIG_NANDSIM_FOURTH_ID_BYTE,
  [4 ... 7] = 0xFF,
 };
+static char *names[CONFIG_NANDSIM_MAX_PARTS] = { [0 ... (CONFIG_NANDSIM_MAX_PARTS-1)] = NULL };
+static uint names_num;

+module_param_array(names, charp, &names_num, 0400);
 module_param_array(id_bytes, byte, NULL, 0400);
 module_param_named(first_id_byte, id_bytes[0], byte, 0400);
 module_param_named(second_id_byte, id_bytes[1], byte, 0400);
@@ -129,6 +132,7 @@ module_param(cache_file,     charp, 0400);
 module_param(bbt,       uint, 0400);
 module_param(bch,       uint, 0400);

+MODULE_PARM_DESC(names,          "Array of name strings");
 MODULE_PARM_DESC(id_bytes,       "The ID bytes returned by NAND Flash 'read ID' command");
 MODULE_PARM_DESC(first_id_byte,  "The first byte returned by NAND Flash 'read ID' command (manufacturer ID) (obsolete)");
 MODULE_PARM_DESC(second_id_byte, "The second byte returned by NAND Flash 'read ID' command (chip ID) (obsolete)");
@@ -629,6 +633,9 @@ static void ns_free_device(struct nandsim *ns)

 static char __init *ns_get_partition_name(int i)
 {
+ if (i < names_num)
+   return names[i];
+
  return kasprintf(GFP_KERNEL, "NAND simulator partition %d", i);
 }

--
2.39.5

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
