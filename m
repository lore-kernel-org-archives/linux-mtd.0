Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58126C531FA
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2026 07:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HFi+q4oyOxMPl8wNpyhm/zaGew/fjla1uqji1oG+ktw=; b=lMh1EARX7a0dSw
	YGcMEH6Xz/iu2P6ZdcSbXrcUel21YoECiIIsiZpIai+CkmY+7lwVD5rYhFp31emgHJgxQzpejByhp
	i238vrP4WkSa0YsrnSpGnxWaWcK5tLEYN5F7C+gyOHQ4ySksPoWahN+28yCu//RaFCTCnz00WLyNX
	vd8FhfEy/ABPBAZliFYfnmlD8JyzudXpDzW7IkP9DZg42fNnAAcQgl5NKcQztVwKPO1fAWvGESAzf
	RC8JA0by2Aeoony+7uP3ycaqppc92PnMwgScIzPvIUuhiIMdQQRNmKi+aToir/Et6gw12i6mAHOZy
	x6R+6f5orWOlbefFiQpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAZM-0000000Fiaf-3IsH;
	Fri, 24 Jul 2026 07:43:44 +0000
Received: from sender-op-o17.zoho.eu ([136.143.169.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAZJ-0000000Fia7-0nmy
	for linux-mtd@lists.infradead.org;
	Fri, 24 Jul 2026 07:43:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784879012; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=RWY5rkGircPIX2yy+6nv2kZ86tnH3h+dR++mgplKTCpsT2pghkLia61TU4ifbKdM4NfSUcAdx1AIXrwrL8iHyGP6GReXvyD7ng1F54LLClmwfwtDzybsIYUjbhrxcwU7sOuwa7pb7Lkm6ZLPOOHDsllVNj6OGmG2mwRmBRcX3O8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1784879012; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Le4ZX6sba4Tq7M3OLf/DlGvQrpsIeXOzElaPQnzU+cA=; 
	b=J4ouml5levgbf/onIJg0le/XpnS3F0ZdOHYRU5QIKqezIUIFEhTFxYfLEZBtkQ7SKNV5BRtyVxbKCa8p6CVZoj4Ul8K3CFNt13aHhsKUDJm3NXjeHiBqlrxfhCQREJu0E0K6lsnquhNo7dPBKafHBOyyoQw6VO5T7xe+OhevBnI=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=auditcode.ai;
	spf=pass  smtp.mailfrom=security@auditcode.ai;
	dmarc=pass header.from=<security@auditcode.ai>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784879012;
	s=zmail; d=auditcode.ai; i=security@auditcode.ai;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Le4ZX6sba4Tq7M3OLf/DlGvQrpsIeXOzElaPQnzU+cA=;
	b=NhDGjhSsOZ2vmX3Z+Qs2x1kiD/dWLMZAsnB94sWKJvdm0TdJfbucEIW8YPuAnE8e
	LTrkEuykY1AsHy1puLGxxqfLgKXV5VEdHSUcHpgmQ1B+U5A3RZpo64EAlGrBB+0Tz6s
	8pYfuuW/bvXqjJiwkkzm4hj7Xniea1fHHBKZrU3I=
Received: by mx.zoho.eu with SMTPS id 1784879009962307.0625662205176;
	Fri, 24 Jul 2026 09:43:29 +0200 (CEST)
From: Ibrahim Hashimov <security@auditcode.ai>
To: richard@nod.at
Cc: chengzhihao1@huawei.com,
	s.hauer@pengutronix.de,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] ubifs: fix out-of-bounds read in signature length check
Date: Fri, 24 Jul 2026 09:43:27 +0200
Message-ID: <20260724074327.73582-1-security@auditcode.ai>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_004341_556372_42E1DAFC 
X-CRM114-Status: GOOD (  12.96  )
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

ubifs_sb_verify_signature() bounds the on-disk ubifs_sig_node->len field
before handing the signature payload to verify_pkcs7_signature(), but the
check has the wrong sign:

	if (le32_to_cpu(signode->len) > snod->len + sizeof(struct ubifs_sig_node))

The signature bytes start sizeof(struct ubifs_sig_node) (UBIFS_SIG_NODE_SZ,
64 bytes) into the node, so the payload is at most

	snod->len - sizeof(struct ubifs_sig_node)

bytes long. Adding the header size instead of subtracting it accepts a
declared length up to 2 * UBIFS_SIG_NODE_SZ larger than the node actually
holds -- past the end of c->sbuf, which is vmalloc(c->leb_size).
verify_pkcs7_signature() -> pkcs7_parse_message() -> asn1_ber_decoder()
is then handed that inflated length and reads beyond the allocation while
walking the DER headers. The node length comes straight from the mounted
image, so a crafted signed UBIFS image reaches this via
ubifs_read_superblock() before the signature is cryptographically checked.

snod->len is guaranteed to be >= UBIFS_SIG_NODE_SZ by the node scanner
(c->ranges[UBIFS_SIG_NODE].min_len == UBIFS_SIG_NODE_SZ), so the corrected
subtraction cannot underflow. Legitimately signed images are unaffected: a
correct superblock never declares a signature longer than the node it is
embedded in.

Fixes: 817aa094842d ("ubifs: support offline signed images")
Cc: stable@vger.kernel.org
Signed-off-by: Ibrahim Hashimov <security@auditcode.ai>
Assisted-by: AuditCode-AI:2026.07
---
 fs/ubifs/auth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/auth.c b/fs/ubifs/auth.c
index a4a0158f712d..1f770795ee70 100644
--- a/fs/ubifs/auth.c
+++ b/fs/ubifs/auth.c
@@ -217,7 +217,7 @@ int ubifs_sb_verify_signature(struct ubifs_info *c,

 	signode = snod->node;

-	if (le32_to_cpu(signode->len) > snod->len + sizeof(struct ubifs_sig_node)) {
+	if (le32_to_cpu(signode->len) > snod->len - sizeof(struct ubifs_sig_node)) {
 		ubifs_err(c, "invalid signature len %d", le32_to_cpu(signode->len));
 		err = -EINVAL;
 		goto out_destroy;
--
2.50.1 (Apple Git-155)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
