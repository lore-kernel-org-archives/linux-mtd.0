Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9FEC79FBE
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HWjP15B6nmMVFPxn5h6v97nB54H2Iwa/5hKx+MgKLsQ=; b=CKKrJhUXE1mrDl
	NeEfLY8k/cd3voaT0PQcNMFkHGKh/QoNPFBg0R1mRvbXcK3gx6zpV9apsNDEdMdZvnt8cLUWJ7VVX
	ys8BNwz3wJGJ9RA2SE7tVbvV1Dqb5cUmLU0OmXRGqA7ldPCNBxJU2B3Ac4UA7i6SCYh/8ZfIo5Dvl
	VFy6nbQBpaeXW75Xd6QEWNbn8E6HOq/y5CK91YGoXh1BHRUSsCgWIx/Y6lfKC4QLW+bP8dYBjpSbZ
	wz4HZgqcMW3BnQAwQHfUrJmCVwMZVTWGAD6mjywJftU+X3o22HzL6YKf7g+rQ9D9putYJWEOEhOmS
	Hk8PQqJ5kqz+gFR0LfRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Diu-0000000B7GX-31xN;
	Wed, 09 Sep 2026 08:32:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DiB-0000000B6YA-15MH
	for linux-mtd@bombadil.infradead.org;
	Wed, 09 Sep 2026 08:31:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ykqLTK8+NebOH/B0kSjt8n6Khfc9TP9alLqheTq5PmQ=; b=MnHCpu6HOTiANi96qML0khWvf6
	QUOedgXXVYbMbtPFUSnCA8dGJW4qfW9DODKnTNCCCvQHu7CCGuwOPoZ+ln1fG+/I6tlJJh1ZBnfIG
	HLwPTxZepcTx/TKwp0kGoGKzpEXvbnzg1XjNAeTHWGnTCegycPkFDo+4XwGKPGvGn4dGRhBGYUhHJ
	1FbqPM7XrZoIll8b7vf2SEuStCJMgf9d0fYlrNEFV0+28juYWoP//MAlYYkHFN8g0n8LxzoWDbyDe
	5TLBvETcIIydmCBQK7YdqPd3I65pkCTze5JBuJwQomhZzpip2rFhQWLZwikIZebXuLDvZz2STcGLg
	JjjTH04g==;
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Di6-00000000umy-19to
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 08:31:18 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7f18c0e03e3so2878049a34.2
        for <linux-mtd@lists.infradead.org>; Wed, 09 Sep 2026 01:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942669; x=1789547469; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykqLTK8+NebOH/B0kSjt8n6Khfc9TP9alLqheTq5PmQ=;
        b=HvvWv6jktPafDuKFpvE3/Y8IgVBHD1946bSwqoJ0LKm6P3+bR+W5uuKimV7DbMbAn8
         vDkq/T/ANGvq5fQuk9LvzFMDszLOE39ds9oOkUDjA/WyTEhYYjZ6USwhjSCU7hlUJXvX
         GNUTXmMEy/HcNkWzbC0q3GskpqIbOWxgqjToo5ko69Wk7SEWUWNAJQSP8Ec3ZzcttQiu
         5opgcyPA7dohbBv/QxWuZkjVU/I5V4EAcwjV3LihuvbnEl6jRttuwPz8qrHjAGa/cSmC
         6JQQGyvIiIOrdOukvy81eHltTDxtS0/0D/B9lcvdpvBafIeFHIDrZWm1NUd5NZxIlRxZ
         HLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942669; x=1789547469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykqLTK8+NebOH/B0kSjt8n6Khfc9TP9alLqheTq5PmQ=;
        b=muVOgAINNpkoQkCYJ1dWwRW7dGQluDoAOzRJX4nDZvmfSdshYuekQF3YHLy0kBam7w
         LICYVBZfdtMmnRwviAyM0IHYKmODoA089M3YMNr0lKsiB6H58TYGAozn3QnS1LJc4wwI
         GAJKf2xg1fGzgmK4tQ0oyQ7+jsJpSQvQlQFW0J8mxuNVIQH98GPV/8KDQWxg9BePGTmd
         FS0F3QBCVXg099StYPGGOChL7zg5FTmBfTyeMwcgGteF+fpx6MPmyKSx1SVOyNNETBG+
         ytLFNwtIvjbRejFCJ2OBDWYdBlJorIUeZfl5Ji+nfbpffMV+JuymbpYgtCkp0HGHpZ+d
         dmfw==
X-Gm-Message-State: AFuF++nVEwQ9lyLnpC0MECsecOM1mKAJOM/oGdX4gPU2EHYA2/50nU9E
	jcuU4AspYDUIB1L7qqr+srnCrz0rpKecxSX2ZA72R6gVHfRTahaKAmBe
X-Gm-Gg: AYBFou387au7ekV3MyifPALNRjFeC2stDgkUcGcCLeOGo7bgD5aA+56eEcnkHIW52/C
	w1dnWndHWfCpZc6JrFpSkZc8GK4G10T2B7MI/Gdfy8FeUWG6mfVTuQ1JlgFIAz39VBxNe+E4m4x
	YuZGhKX/6nYB6Qk+58ZqLg6x5XJ6LwgJDwrqYw2EiKI7wpsDP0m9XmEPz+NN9RKVdagSVx32bzm
	gjqdZ29aJbIAjnuSc5GT4uPMfepSmIfJYBFyQCdNswMR7i7PSzKzaL1aK0XqjPcM7WAT2Zg31pw
	IMLggTlb8pdRsNKIPwRDO5n9/CNBmWdV5VdOwQySMfNT13YLsWcn9Hed5j7DJuR23hjNikyzXul
	SmjJiIdqlMEtAlHs49YsbNaD2aJxomZ3TRtKtAy8cyTHtvTCCu9pFjj0xJLk08Dk+P5uAVnH3aH
	PRVjZSRuSpthi14mw9d1ABcFJo1nZfbM5E7wJCgq01f2f0e09UMZf+vykYkTbEad8sxJq+UjJIC
	q0EPheP3l0VtTYkeu5XNvOVInrTOuxUFuzou/+cc2noGCJ6jhtbnaOE562/rStNy6BFop2zDE8a
	3qK/G53C1KbQfTWzXOrRr/Htg2ETHzPh0aBSztS4CTLFOkLx1YiEFCPzUlHQ+T7fABlvL832H1r
	8kVzIuXEKXTpXBHkDtAt+B5qk0yhA
X-Received: by 2002:a4a:e909:0:b0:6b6:87cf:d1dc with SMTP id 006d021491bc7-6b6fcfd90e3mr19776294eaf.24.1788942668737;
        Wed, 09 Sep 2026 01:31:08 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:44 -0600
Subject: [PATCH v3 11/15] mtd: rawnand: sunxi: select the packed H6/H616
 OOB layout
MIME-Version: 1.0
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-11-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093114_676120_7C07C086 
X-CRM114-Status: GOOD (  19.97  )
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

The H6/H616 controller can configure a separate protected user-data
length for every ECC step. Mainline fills all space left after ECC with
user data. This changes the physical ECC offsets from those used by
Allwinner NAND firmware, so pages written by one layout cannot be
decoded with the other.

The allwinner,randomized-oob property selects the firmware's normal-page
format for the configured controller hardware-ECC geometry. Use four
protected user-data bytes per 1 KiB ECC step, cap the total at 16 bytes,
and assign the entire total to ECC step zero. Reserve the same total before
maximizing ECC strength so the selected strength leaves enough room.

Keep the existing maximized mainline user-data layout when the property
is absent. Older controllers have fixed four-byte user-data registers
whose placement already matches the firmware and need no additional
change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 75515ad276e7..6e54d3a92219 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -224,6 +224,9 @@
 #define USER_DATA_SZ 4
 #define SUNXI_NFC_MAX_USER_DATA_SZ 32
 
+/* The randomized H6/H616 layout packs at most 16 bytes before ECC step 0. */
+#define SUNXI_NFC_H6_MAX_USER_DATA_SZ 16
+
 /**
  * struct sunxi_nand_chip_sel - stores information related to NAND Chip Select
  *
@@ -2348,8 +2351,14 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
 	sunxi_nand->user_data_bytes = NULL;
 }
 
-static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize,
-					int ecc_bytes, int nsectors)
+static unsigned int sunxi_nfc_h6_user_data_sz(int nsectors)
+{
+	return min(nsectors * USER_DATA_SZ,
+		   SUNXI_NFC_H6_MAX_USER_DATA_SZ);
+}
+
+static int sunxi_nfc_init_user_data(struct nand_chip *nand, uint32_t oobsize,
+				    int ecc_bytes, int nsectors)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
@@ -2365,6 +2374,12 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 	if (!sunxi_nand->user_data_bytes)
 		return -ENOMEM;
 
+	if (sunxi_nand->randomized_oob) {
+		sunxi_nand->user_data_bytes[0] =
+			sunxi_nfc_h6_user_data_sz(nsectors);
+		return 0;
+	}
+
 	for (step = 0; (step < nsectors) && (remaining_bytes > 0); step++) {
 		for (i = 0; i < c->nuser_data_tab; i++) {
 			if (c->user_data_len_tab[i] > remaining_bytes)
@@ -2425,6 +2440,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				bytes -= 2;
 
 			bytes -= total_user_data_sz;
+		} else if (sunxi_nand->randomized_oob) {
+			total_user_data_sz =
+				sunxi_nfc_h6_user_data_sz(nsectors);
+			bytes -= total_user_data_sz;
 		} else {
 			/*
 			 * User-data lengths are encoded in four-byte units. Reserve
@@ -2495,12 +2514,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	nsectors = mtd->writesize / ecc->size;
 
 	/*
-	 * The rationale for variable data length is to prioritize maximum ECC
-	 * strength, and then use the remaining space for user data.
+	 * The default variable-length layout prioritizes maximum ECC strength,
+	 * then uses the remaining space for user data.
 	 */
 	if (nfc->caps->reg_user_data_len) {
-		ret = sunxi_nfc_maximize_user_data(nand, mtd->oobsize,
-						   ecc->bytes, nsectors);
+		ret = sunxi_nfc_init_user_data(nand, mtd->oobsize,
+					       ecc->bytes, nsectors);
 		if (ret)
 			return ret;
 	}

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
