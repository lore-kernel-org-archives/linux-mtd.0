Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F61B606A31A
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Oct 2026 17:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cFNCr8L8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QQMyaITO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EwnW6rAttRKtUM5RNtzQMc+VXb3HxwMjQwlJjgA8TKE=; b=cFNCr8L8Y1pob9msSUhl+xF3Sx
	aAp7h4o7om9JSPOhx1crz/42dixt6hFlWQHT7/oGwS8PAADSEYT8wpEC3xYFRA5XFDIgLRE/Xb09m
	+xBoWO+Vc5tkJT3Ww2FH4k4bCjbGIzyTbEAVLDpmu+WHfv7dDNT3d09ldr8HIzTOkqXlyDgLa+GMD
	ZMQJmtnyWm6jc4082BbHIrPq/spuuHPFxS872Qqxo/xvhlt0pYyt07jv1lUtx/gEBtFe4xWYkL5zx
	amuWod9qT1EB6lX2tkAObdui8THQQWEFdqwylMPwaUAcDW7Pu9B4WGwCqxQI8nh5XlXraYIlJzYwV
	4LvKBocQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL24k-00000001E2E-3q67;
	Sun, 25 Oct 2026 17:32:06 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL24f-00000001E1r-0Zuh
	for linux-mtd@lists.infradead.org;
	Sun, 25 Oct 2026 17:32:02 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-14394530ec6so2908934c88.1
        for <linux-mtd@lists.infradead.org>; Sun, 25 Oct 2026 10:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792949520; x=1793554320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pAAhED+ct3sZOaLZuL2wp4pJ6byCoV8CC5//LfmSI9U=;
        b=QQMyaITOCHe57gbs2C7skwaj/qqA1CRSN8+4Fr/DzFzsRLASSBIbKsc4SwaOrQ090R
         FhH/mMJAJKwTEM76I1y/ZEMmgH1358dEeaenZWdbOAVQ9YF66tWH5xUD/bQQrK5wNz4b
         0/rgkKCULVKIkKDUVflkcYkw4TcXbtgX9UZJRxxs/uY5aKuZ5qzOsLpPe2HDqiUre8rt
         FdTRqEue9vUEe9xpfjvP7TfybltecePbU+zJ6Ybvpr9KKCC0gjcOd5+JGxptWtV+GpeV
         vMKLryTEpq/6JPo6NriIcaMrg89GqkQz9jhlfVgzWScCTj+yrD5IdN1KX+ezvDvPcPT2
         m3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792949520; x=1793554320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAAhED+ct3sZOaLZuL2wp4pJ6byCoV8CC5//LfmSI9U=;
        b=xQW3/f4jyJhm6eZE8tmRk0cjlML2KpZsnAUOLcH3p1IN1ogs1QXwYGwsYQJt1Ui3Mr
         +0Jr8ZjujEh30jcEyv00BNrp8mD5Ug09duYTf0fqHy4psLNc9jfR0cCOyqoFJBOZGWXd
         Jpx8LqrEn907JYcBf+zkB38JaKrsYIQxMiTXSo8PgpM1CX/VNr+e6fIm3m87IrVhX+wr
         8O/CMFovEPXu60YDZVIaonBYQ9/ap/tphIPLLY3JrThelndqJjBo7/FSFPo1SsAVno7X
         qzNzBU/vs3CFB6sNZzt9KTnrhcnCb9MjHul2aA/oJOyI6IQSSn3bFv0I/68OtnPhMK+o
         EB9A==
X-Gm-Message-State: AFq9FYJrutHyEbAqUCwcxTvJuOI63xDfwdeL0faDloNjmztfWV/oST38
	jIUVeDBBVyiHlwsO1cdE3xCF34lgR2j/h8iVMour0kk+KSrl7P/Q0NGNfmM7vojd
X-Gm-Gg: AYBFou0BNikReuZQsFBV69zRTWUCC1G5xNNACyiW9Pg4shcR6CJf7cUt28W/Zn8JVvP
	WFL58TWvwANq4rwo9tLbVw1aQbydC3onFiix8c4uy+ODTLboXCJLinrUtENd3/QqX49439ckVb8
	WFErEia6F6M55qBlhPWH2NgI61SpAb9VO+mysqw49C9Cmy7VFxuPV37c/t22rOqFU+rr8zWsSw4
	Xn/AXQ6FveVRSgYmy+wXBpfIja4sq6e10qV2mSTox63Q+VGTgkG9Chms7VDWNmyt032tfVvIBOZ
	VNvLj0ktev4o57Ri/5pWuDMOo71INntqWIyzyOdQbfI3CBWBVIpst3r1lkc/rCXw4y0aFGq4vNm
	lVGG69WOfj4/w7+VjJ809n43k7+0JOxbVdZhaDyN89BR9tOJEPebSpezcSyyBntkqctUID3pjK9
	hAkvD0SfbxKDPjPbgUtwR8uUbrIAnrw3CE8z+lON2aJtWG1D8WPjZhU0fH2jE+YxGy6qD5/jOkr
	DogcX9HdnjZbUt8kGNq9cZfZ7A0wVLYcWpeldtKcSBHOgyrpY6iBmTs3ZmxBn0BBZIoYXnmYpXY
	XDzxtGPoxS/ocNsN3KnmwyJVupOcUWbWfFNnSmOMGtn3LxvPE8QV3rOREoxwFbFNOoI5iNRrkPp
	3/Ec/1oOmrCb0DHL7VxZEE0UVmA==
X-Received: by 2002:a05:7022:e27:b0:160:6a5b:7edf with SMTP id a92af1059eb24-199377d8e91mr10837106c88.44.1792949519509;
        Sun, 25 Oct 2026 10:31:59 -0700 (PDT)
Received: from LAPTOP-97G9G880.domain.name ([106.222.203.46])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d59f90sm16844251c88.3.2026.10.25.10.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:31:58 -0700 (PDT)
From: Karthikeyan KS <karthiproffesional@gmail.com>
To: Richard Weinberger <richard@nod.at>,
	David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Karthikeyan KS <karthiproffesional@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] jffs2: return -EIO when a decompressor reports failure
Date: Sun, 25 Oct 2026 17:31:52 +0000
Message-ID: <20261025173152.147123-1-karthiproffesional@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_103201_216932_13CD2D24 
X-CRM114-Status: GOOD (  16.46  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

jffs2_decompress() passes the decompressor's return value straight up.
The rtime and zlib decompressors report failure by returning a positive
1. That breaks the kernel's error convention: a function that can fail
returns 0 or a negative errno, and generic code (the page cache, the
write path, IS_ERR()) relies on that, so a positive value is read as
success. JFFS2's own callers only check for non-zero, which hides the
violation: the value travels unchanged through jffs2_read_dnode(),
jffs2_read_inode_range() and jffs2_do_readpage_nolock() to that generic
code.

On a read, filemap_get_pages() returns 1 without filling its folio
batch, filemap_read() carries on and dereferences the empty batch:

  jffs2: Decompressor "rtime" returned 1
  jffs2: Error: jffs2_decompress returned 1
  Unhandled fault: page domain fault (0x01b) at 0x00000000
  PC is at filemap_read+0x1d8/0x5b4
  Call trace:
   filemap_read from vfs_read+0x23c/0x318
   vfs_read from ksys_read+0x74/0xf0
   ksys_read from ret_fast_syscall+0x0/0x54
  Kernel panic - not syncing: Fatal exception

On a partial write, jffs2_write_begin() has to read the old page in.
When that fails it returns 1, generic_perform_write() carries on, and
jffs2_write_end() is called for a folio that is not uptodate:

  jffs2: Error: jffs2_decompress returned 1
  kernel BUG at fs/jffs2/file.c:270!
  PC is at jffs2_write_end+0x50/0x3b4
  Call trace:
   jffs2_write_end from generic_perform_write+0x144/0x280
   generic_perform_write from generic_file_write_iter+0x64/0x10c
   generic_file_write_iter from vfs_write+0x230/0x3e8
   vfs_write from sys_pwrite64+0xa0/0xc8

Garbage collection has the same problem. read_cache_folio() returns
ERR_PTR(1), which IS_ERR() does not treat as an error, and the "folio"
at address 0x1 gets mapped:

  jffs2: Error: jffs2_decompress returned 1
  Unhandled fault: page domain fault (0x01b) at 0x00000001
  PC is at __kmap_local_page_prot+0x8/0x5c
  LR is at jffs2_garbage_collect_dnode+0x1dc/0x518
  Call trace:
   __kmap_local_page_prot from jffs2_garbage_collect_dnode+0x1dc/0x518
   jffs2_garbage_collect_dnode from jffs2_garbage_collect_pass+0xa54/0xec4
   jffs2_garbage_collect_pass from jffs2_reserve_space+0x12c/0x344

Restore the convention at the one place every decompressor result
passes through: convert any positive return value into -EIO in
jffs2_decompress(), the only caller of the decompressors, so that its
callers get a negative errno. The warning still shows the value the
decompressor returned. Negative return values (lzo returns -1) are not
changed.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Fixes: fe051552f507 ("jffs2: Prevent rtime decompress memory corruption")
Cc: stable@vger.kernel.org
Signed-off-by: Karthikeyan KS <karthiproffesional@gmail.com>
---

Hi Richard,

How this was found: we backported fe051552f507 ("jffs2: Prevent rtime
decompress memory corruption") to our kernel without b29bf7119d6b
("jffs2: Fix rtime decompressor"). On an AST2500 SoC, the off-by-one in
the rtime bounds check then rejected a valid node. We reproduced the
resulting failure paths on qemu, using crafted flash images that make an
rtime or zlib node fail to decompress.

Tested on: qemu ast2500-evb (aspeed_g5_defconfig, v7.3-rc7, 32-bit ARM)
with images holding an rtime or zlib node that fails to decompress. With
the patch, read() fails with EIO, a mmap fault raises SIGBUS, pwrite()
fails with EIO, GC logs "read_cache_folio() returned error: -5", and
nothing oopses. Valid rtime, zlib, lzo and uncompressed files read and
write the same as before. We did not test GC with zlib or lzo nodes, or
on real hardware.

 fs/jffs2/compr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/jffs2/compr.c b/fs/jffs2/compr.c
index 764f19dec3f0..da317ed3ccdb 100644
--- a/fs/jffs2/compr.c
+++ b/fs/jffs2/compr.c
@@ -288,6 +288,8 @@ int jffs2_decompress(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
 				}
 				this->usecount--;
 				spin_unlock(&jffs2_compressor_list_lock);
+				if (ret > 0)
+					ret = -EIO;
 				return ret;
 			}
 		}
--
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
