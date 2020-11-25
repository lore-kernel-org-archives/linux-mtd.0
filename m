Return-Path: <SRS0=DcMO=E7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B05C2D0E4
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 00:25:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AEE1206F7
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 00:25:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LL2DSIDc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="K69+GBBX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AEE1206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VFSzKMNE/frl7i6vHBCrFDKX4y94lsdYO3gxqA1btT4=; b=LL2DSIDclJkPdl8WSnSzbx8nM
	el/YbRi6YwppuJOwpKVcn5wPpjee8r0WdXTXp/dfudv/3WkTAP1CM4+6eGbtCLgDL8JylzAoAYtZF
	hLCDz845aIfjR7atYz/3ZP0mHO39aDx3E1FyucwCmaUv2bvMgD7ZkuYOoDbiB9mRzTmeI8ONZ9fdo
	jjgYVYc9De6nMMVjUTXRHE7eICH6JGwF59BqRu+Nn9lBx6sWZRpAsurBAH2AisDLo+X972qJRAaVm
	DX/i0UdlEVB4/N6YcL/8f8bYzEUKdYRgP6Elv1NMIwejLJjRdKp67XHcXxpmLdlEUgwhnpR/WD+Go
	v3kW9oyow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khicJ-0001ZQ-Ge; Wed, 25 Nov 2020 00:25:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khic3-0001Sn-Ec
 for linux-mtd@lists.infradead.org; Wed, 25 Nov 2020 00:24:49 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BD4682168B;
 Wed, 25 Nov 2020 00:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606263886;
 bh=sW9kCpHg/sDmA6ymdn9CX3KA5XvEp3ayB2EpWqKWKAU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K69+GBBXBn4aXkvDANL2m4C3Uwm2MG/DwglSUIEvtrVbRom0kW3lKn/v51W6I0AZp
 EvfWZAt+vU9ps1TyC4Wvoe5R3WKuIPEKEhV1Vzt5W5ypvumvcCCi1wlnBF2IXXMHGW
 NihS0BQPZCcwny3n3ocL9m7Mvn5puvL49h16c83w=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH 4/9] ext4: don't call fscrypt_get_encryption_info() from
 dx_show_leaf()
Date: Tue, 24 Nov 2020 16:23:31 -0800
Message-Id: <20201125002336.274045-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201125002336.274045-1-ebiggers@kernel.org>
References: <20201125002336.274045-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_192447_575714_1D3E116D 
X-CRM114-Status: GOOD (  14.29  )
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

The call to fscrypt_get_encryption_info() in dx_show_leaf() is too low
in the call tree; fscrypt_get_encryption_info() should have already been
called when starting the directory operation.  And indeed, it already
is.  Moreover, the encryption key is guaranteed to already be available
because dx_show_leaf() is only called when adding a new directory entry.

And even if the key wasn't available, dx_show_leaf() uses
fscrypt_fname_disk_to_usr() which knows how to create a no-key name.

So for the above reasons, and because it would be desirable to stop
exporting fscrypt_get_encryption_info() directly to filesystems, remove
the call to fscrypt_get_encryption_info() from dx_show_leaf().

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/namei.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 793fc7db9d28..7b31aea3e025 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -643,13 +643,7 @@ static struct stats dx_show_leaf(struct inode *dir,
 
 				name  = de->name;
 				len = de->name_len;
-				if (IS_ENCRYPTED(dir))
-					res = fscrypt_get_encryption_info(dir);
-				if (res) {
-					printk(KERN_WARNING "Error setting up"
-					       " fname crypto: %d\n", res);
-				}
-				if (!fscrypt_has_encryption_key(dir)) {
+				if (!IS_ENCRYPTED(dir)) {
 					/* Directory is not encrypted */
 					ext4fs_dirhash(dir, de->name,
 						de->name_len, &h);
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
