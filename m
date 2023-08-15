Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CD0C0015E
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Aug 2023 20:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Xs4TQI5k2K7jHvXpKbFPZSnw3tYZK8ZxShuR/Y7MmEI=; b=SU+
	ewGgTTgsCUKbcIOL5fCA+VEwrSqrTUyRg7xStO/fK4ZSRzs1++ZbDWupiG201f0LgLd7j+a7UiF2u
	gzmNGuOAOjqCHBIbwkXZ/+26GHwke77nhvfPv0XF1DTGgUMTNSck0bm4zmrbrEi/56vgLBAkL+I35
	eWhE+R9GxBeKUgBoaO9S2/HfyuNNpDmqYQeDYpR0Pzmwtbc6rKa3rKG0U4AsjuIXCaFdQvGy+mkpx
	Wjj6w/iD7M7peahle9oeBl90OcUaNZTV40ysjHu0Nf6yjR4nNIrGY2CJR3HgBL2HbJmzrClKhI8/G
	arMKkr/Dlrx/Fc7J7Lxlzm1SlDJMubA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qW17t-002Tn3-2q;
	Tue, 15 Aug 2023 20:58:53 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qW17r-002TmK-0T
	for linux-mtd@lists.infradead.org;
	Tue, 15 Aug 2023 20:58:52 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-56c6c502822so5902675eaf.2
        for <linux-mtd@lists.infradead.org>; Tue, 15 Aug 2023 13:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692133129; x=1692737929;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i43ino8+cQV5fs59YFTMpgpy3gd6Kvhnph8ypvpU1+E=;
        b=OaxNZF0XeYWAxRvthJD35Tl9i7hNdMx3tQUmVK3WMKxUOPWVZGqtu8tPhOn+L5tulx
         xuSR6QwuQzjucbrKrku+UFgwmRL4KepxrquekQ9XHqbI9qnEr9712T3kQUag/EbT7vDe
         QKpZGn2ap+1vWwydxynUDL3mkCGS6wDvdjEhMHvAqZp847wBPjwKQhp5cZRrFsUmyZ83
         L36Dlb6XMxbhYXcEZ0hmMRqvzFFXIdZieTZG9HOC7jXZerkC72IDSE9I8tFL7ile8CsV
         wep05GdDlBWhqmhhg387YEwJgwmZDYQO97zOyx/XphXe/2FcRkPN8ScnustwRB+2yLyC
         6q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692133129; x=1692737929;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i43ino8+cQV5fs59YFTMpgpy3gd6Kvhnph8ypvpU1+E=;
        b=FsN+I2TFoIGa+KRY8E+rwEr/0He3ekcgMshwpVEFIZO3xGTVgMv9IIK1acbhb8/IBT
         t29bv7FaZt1q22q3/imE7hWW34KsBg+VmODjfsx7zM0W9dl1a86EfXQXHxZ4ms8NwoBI
         tjrEzMuzm5Sx4ehaZr46ywWIqVtWi0kPLLpkvhyDU/TVbVbXFHgnUUEatwwV2x49gdla
         edkjKWQCprrhYee6S74o0TdBBINS8uPoDDbd7+dQhb8SjyFYmKk6eBSSB9I1EDV6slHp
         hEM6yt8Dz/lAzpz0xxqMzikm84JtMoxq3pyyo4TusbBZcWXNAuIolSqbiVJKvgtcLHje
         WNxw==
X-Gm-Message-State: AOJu0YwzgumMHfBV2RWTzR3Ww49zQ+AnMsdGhNrseKMHF6ZYZBDTAosp
	lfs/R6VCDpKrL0mRZUPcTSaJStdnellacS+I4Q==
X-Google-Smtp-Source: AGHT+IG6T8KFew1s+X5WQiOn2+4/yct62q/iaRBeV0Fq3wY/nCalyvWlspLQ1IMg2y/MrcyQDbBVxlt0Frv3SCy3aw==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6870:8c34:b0:1bb:6791:cc68 with
 SMTP id ec52-20020a0568708c3400b001bb6791cc68mr216505oab.3.1692133128823;
 Tue, 15 Aug 2023 13:58:48 -0700 (PDT)
Date: Tue, 15 Aug 2023 20:58:47 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAfn22QC/x3NTQoCMQxA4asMWRtoOz8UryIitUk1CzOSDlUY5
 u4Wl9/mvR0qm3CF87CDcZMqq3b40wD5mfTBKNQNwYXRRT9jW4WQTBpbxddGqEkJLX2wlcW7m5a MSx7nWKYw3WOCXnobF/n+L5frcfwAXHqUeXUAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692133128; l=1875;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=y2JbzG62AXClW5TbICNapFpMx9TWmAr5KjVSEN24CHY=; b=ph2dAzVEzI/Hp2y1+thActuqF4avgbTqiwLRd0iD0lkfUbCpSWXtXOTntsjxLLcfcDGOL6GDD
 Zd6jcbvOxHWDmRwh4JoND6QutLqs/72t+7bRVE1J9SSS0NDidFEsL/U
X-Mailer: b4 0.12.3
Message-ID: <20230815-void-drivers-mtd-nand-raw-vf610_nfc-v1-1-7cc65314c56c@google.com>
Subject: [PATCH] mtd: rawnand: fix -Wvoid-pointer-to-enum-cast warning
From: Justin Stitt <justinstitt@google.com>
To: Stefan Agner <stefan@agner.ch>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Justin Stitt <justinstitt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_135851_183885_D6D4CB0D 
X-CRM114-Status: GOOD (  13.27  )
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

When building with clang 18 I see the following warning:
|       drivers/mtd/nand/raw/vf610_nfc.c:853:17: warning: cast to smaller integer
|               type 'enum vf610_nfc_variant' from 'const void *' [-Wvoid-pointer-to-enum-cast]
|         853 |         nfc->variant = (enum vf610_nfc_variant)of_id->data;

This is due to the fact that `of_id->data` is a void* while `enum
vf610_nfc_variant` has the size of an int. This leads to truncation and
possible data loss.

Link: https://github.com/ClangBuiltLinux/linux/issues/1910
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: There is likely no data loss actually occurring here due to the
fact that `enum vf610_nfc_variant` only has a few fields which are not
nearly large enough to cause data loss. This patch helps towards the
goal of eventually enabling this warning.

Also, should we use `unsigned long` here instead of `uintptr_t`? I've
seen maintainers request both and I'm flipping a coin here.
---
 drivers/mtd/nand/raw/vf610_nfc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 86522048e271..11d996dc655d 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -850,7 +850,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 	}
 
-	nfc->variant = (enum vf610_nfc_variant)of_id->data;
+	nfc->variant = (uintptr_t)of_id->data;
 
 	for_each_available_child_of_node(nfc->dev->of_node, child) {
 		if (of_device_is_compatible(child, "fsl,vf610-nfc-nandcs")) {

---
base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
change-id: 20230815-void-drivers-mtd-nand-raw-vf610_nfc-6c358f424b8a

Best regards,
--
Justin Stitt <justinstitt@google.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
