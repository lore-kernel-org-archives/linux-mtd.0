Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4763C001B0
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 05:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PbepWRNYT6NvRro9ilB7ON++R0lQetcdfQpmJqC/SkU=; b=3aEcf+5/jCQyFL
	9Pq5RnkzsUBazI01Y6QVrL6Ai+SGCNsbj6oBZbSujOdZ1of4vhpdAZKeMNbI2iyo19AC2j2T3DjCq
	PX6iYfGRrGuIM2moucbM1RuSLjieYKsA5t3j82vu2IUsa9R86Bn9fpdmJ2SV5Tz1hC1rc0zfl8Mhw
	g4eVkHbvJrMXrT3ZfqAh0D5liAouGH4P+/E60LVGMVA57Br2Eys0Ez+mQD+cl3TQwE6U3ech305JH
	kGUkKIVufdJpa6VQerjG4IBCcZSdZlicACE4VfTQeMWpsTsmEDOwi4LAUUogP/DfK1w7ndSaAZP4O
	2ELxwc6nRzFFADRzu6nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLznU-005KSV-08;
	Wed, 19 Jul 2023 05:32:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLznS-005KRz-2s
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:32:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=26BbCt6pTeCG0EneYzzf3lzC38l5nIDE2dGmqYcHc7M=; b=d9YrmWCVdRjgNuDx1u2RsnJjO/
	pAxtbPFLYFNWVwMLz/fAEA9qp8fWIrVIci2SyhdntPbdaE2BRfxH/qyqhzeo5g4MA1cqJODNrv/HA
	cZOKiFdKeiTm0x1xZ9+lLjfR11341qetwga3Y8ZG3kDxaNmgqQlGWsmZ89TKEfQeIBFydmjjtk9jj
	vMxfRRRy5dFxa1oaGMW553H9IVPkQNntbiAMXoLlpFrrPfSao09ErMrdl/77Zvn48btncInqC8OqD
	BDkOmqq7YSc49ZaVQG8281e0jFM89gngwqy2RnU/lsujBrBIZRPgVTsXIhrMBxaeWl7a/pnQsTWzc
	afioHqMA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLkJc-00BYPZ-1Z
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 13:00:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E5C3A61579;
	Tue, 18 Jul 2023 12:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0484EC433C7;
	Tue, 18 Jul 2023 12:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685196;
	bh=GKaoOTrRRgm3th2yeQunqYwl7QvKD9b4yz/UgiWU3NQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m5dvqAwNacmP9ofhTkW3T21chYyCqFIyw+EZKp42wVyn1aBnT5CMtykmkhXPBNAq/
	 dGkTWQjllhBsahtnxuWrT87+tMg5Aj23IVinvMXW8KOejUf8GgnDVVVmMVKVvh2QtE
	 R0+XyqV+Xe9Ab43eG/9cXVw4nBOiwYdiyBav7XTJ2PoskZrgMQQ8fTOZMOsQtUA1NO
	 yIPJjP9XtCxFVuinva0jPVu4cDhNmqsnTt8xiABPoaB0ZVmS+o/RqHoyAe5Fplb5Us
	 e4ZptUjNImOL1KKyHCWo/EJNvdPApIHEdnjfzLoE3LCknGqVwsN0292H46WRVCLqVX
	 ANtj4BazzH8OQ==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Haren Myneni <haren@us.ibm.com>,
	Nick Terrell <terrelln@fb.com>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jens Axboe <axboe@kernel.dk>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Richard Weinberger <richard@nod.at>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	qat-linux@intel.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org
Subject: [RFC PATCH 06/21] ubifs: Avoid allocating buffer space unnecessarily
Date: Tue, 18 Jul 2023 14:58:32 +0200
Message-Id: <20230718125847.3869700-7-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1605; i=ardb@kernel.org; h=from:subject; bh=GKaoOTrRRgm3th2yeQunqYwl7QvKD9b4yz/UgiWU3NQ=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbTwlX6/4+66t8K795H8qq3nyxPGW6+prOkJjeOC3pB VKTDl7pKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABMJ38fIcIktU2XVksXxPvnz 7ZMjji6vymHbt3vhb8tlaW3L36gWdjAy/KlaojvPzyKk+4acZfHypV+1GfmK5ggkHxKI0X7uaXa XGwA=
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_140032_871521_C4D49074 
X-CRM114-Status: GOOD (  15.18  )
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

The recompression scratch buffer is only used when the data node is
compressed, and there is no need to allocate it otherwise. So move the
allocation into the branch of the if() that actually makes use of it.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 fs/ubifs/journal.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 4e5961878f336033..5ce618f82aed201b 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -1485,16 +1485,9 @@ static int truncate_data_node(const struct ubifs_info *c, const struct inode *in
 			      unsigned int block, struct ubifs_data_node *dn,
 			      int *new_len, int dn_size)
 {
-	void *buf;
+	void *buf = NULL;
 	int err, dlen, compr_type, out_len, data_size;
 
-	out_len = le32_to_cpu(dn->size);
-	buf = kmalloc_array(out_len, WORST_COMPR_FACTOR, GFP_NOFS);
-	if (!buf)
-		return -ENOMEM;
-
-	out_len *= WORST_COMPR_FACTOR;
-
 	dlen = le32_to_cpu(dn->ch.len) - UBIFS_DATA_NODE_SZ;
 	data_size = dn_size - UBIFS_DATA_NODE_SZ;
 	compr_type = le16_to_cpu(dn->compr_type);
@@ -1508,6 +1501,13 @@ static int truncate_data_node(const struct ubifs_info *c, const struct inode *in
 	if (compr_type == UBIFS_COMPR_NONE) {
 		out_len = *new_len;
 	} else {
+		out_len = le32_to_cpu(dn->size);
+		buf = kmalloc_array(out_len, WORST_COMPR_FACTOR, GFP_NOFS);
+		if (!buf)
+			return -ENOMEM;
+
+		out_len *= WORST_COMPR_FACTOR;
+
 		err = ubifs_decompress(c, &dn->data, dlen, buf, &out_len, compr_type);
 		if (err)
 			goto out;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
