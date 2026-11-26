Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BE1606A31E
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 03:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nRBa7Y27;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vmN43HN/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ez04Y5vuhciG5rMP6pE7pwJmG0HEuEoRoAEUK6hFWI8=; b=nRBa7Y27Qk+iL0rq0loF4fZJ4T
	I5kfq92f2F6FwRR87FnWCiAVCq5fBf6F/r3UFYdT8BGQTmro7INkc0Wo9XQixVmun+wAXSdT8LDpt
	aqtBtUw1xuqZKGCpOal3wW+Xf9+DgEw2hVC4w2vkGVNV9SQEq3XBgfM+TgkgC5Q3UBjJoZTrecSjB
	bulLUxHFrldKqGp7GAXm7qfiZTL5PuPw4vx6TDq7ZsDmB4P/DPtGWWVBKmx/YvnPgi9Z5lxTCMQqA
	lJDGDlwqAEMv6uFXAFGYwHyl99ql3JDMTxLwfqdYueMnr3zPSSavF1GLZUCawQidjzFsKcoaFvhJG
	OFLzjxGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPj6-0000000Bwlk-2NSu;
	Thu, 26 Nov 2026 03:00:48 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPj3-0000000Bwky-0b2G
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 03:00:47 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2f0481b35c9so38552095ad.0
        for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2026 19:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795662044; x=1796266844; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qVpHwvLFp+v60v6hectFbxaKCke3/ic0ToeVXJOKYkQ=;
        b=vmN43HN/Y863IZAhYrx7i//QBHmr6uIGy0+j1lJ9tlWP9bn7zTQwJ2fyIAzqoBweGC
         12iyzXY+lCZhKfJoqVV77VWDoIymzEcPKBTgC7exjjVYQdBIkfdpwJw2PxlUL+iBi0S9
         vaUsqCQ21H0y7fomNRAZzaQhwFaw1P/KjKew6WcTYRAsDnV2USSOrAUkQ3zYURWjVEys
         SJNY9HnaYnmHt4WqXcrf9zgXOV2Icxpo9v4zrKEifaLuQ+1g2e59i3/r4y5Cbz8yceeD
         LD+W/bWYp5mSAs+G3vm94EFhWhs9FoPQP8UsWL71QBQAx+cz05bcIt9qe4/H46z9t95C
         KQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662044; x=1796266844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qVpHwvLFp+v60v6hectFbxaKCke3/ic0ToeVXJOKYkQ=;
        b=OESDbi0Qo0zqUalToz69b3sShBextfjeF9FKG9EU0uqqRYR22uuyx39a1aUU7Lm4rT
         kRo5YCrRYj4iQEJqt+y965lKbeCqdTTb8vIpLv01mQqalbxm6fI146Zay3CUPcCqJ2Qc
         6xcYFdKQYoxOzRViKFaw2jEjftysrJIyibmWjU1//mCIoTvuDrtUxAeH54wtdldGl1Oi
         OYmktJjA/qtCbj48427w6hsW4ZU8TvnIM8x2QBYw8HYbT9EvjsPU+JgdbdQE5Kv7GQXl
         4O8HhSR3US7uJ/mDPvbkZjBdqDHEHj4T67GXjfzGByElio4GpzJUvbyHDFIWujWVzQ2n
         tUNw==
X-Forwarded-Encrypted: i=1; AL+hErH1jTTnU3KzCdXAShrsNUM9cI+EGTfrp1mpDazTm3jtcwBuK7piy0RfunE86tU2uByeT8rFeHEZhCU=@lists.infradead.org
X-Gm-Message-State: APuU4Z+v0qHjknlWy9+ubLZQYPz2YIJUELUU/hpQYPhQPPSWwsPHKZjv
	zUPw/hW4KAkWVjAhXe4Kx6ikeTEjycUgEWXuR02RV74u+IoBYZJC6guF
X-Gm-Gg: AZFdTZecAA9AceURuUz8eZC7ukIAjQGkdElL9fuCjt/K2bXp0I/zgmX6wAs58GC52vp
	BiqQ2s5HKtra87iNTTflqfYXazteg5gPs9L3q2tPvXmOuGtwxU2rm2cM+CSylGUaqEMOZ4tbtLN
	BtQ0aglRtSo1skJ9Cw28IwNrajrN2Cgpjn9JOhpSvKjLWXIW4iBc/e7qh8xuZkzVWEiu52y3afb
	4+k4v1hkSGjET0tQRVIRgQupEjochrNhtkrybMru4Iq/MiiesmRQXyjW8PdwlfQPdKW8tH6MRHG
	DzEGdMDi45U+2uj52GX5Tm+lK/lUDSzm3BsLpx3APRFzKgeBG63IW01N92SSUdK5aUfYY0Z+W6d
	XIYNJu1HFxeWLjCi12pOQHt4v9mI0mdEtaCf9l/3A3uR9uyLhGHntBNfRH1q+43I426KmAAAFa3
	ufChdSW6B/8e+hTYgifze34TsNTYYA3msHKLO79/Q7Ef2KkavN+YlaX54RPuDz+SK6mfx+G67Sa
	eveiDNHTjPVactNagC2K6iiy5mLp7sW0ti6pO3Nn+TFKdkwqmB1ZQ9SY2oOus9lj+can9Jw+xuF
	oCo2fqyw516w4iXV1V6wqHUiG3XrniGXhACXyAJrlPpiLa5unzB2yflXhpVU+Pw1mnIaP219l1z
	73rYGTZjc3nh7HKWwtKSj
X-Received: by 2002:a17:902:f609:b0:2ef:d46a:aa2b with SMTP id d9443c01a7336-2f03f215985mr165554365ad.38.1795662039378;
        Wed, 25 Nov 2026 19:00:39 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([2a09:bac5:cad0:1caa::2db:4c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c2091sm94576505ad.20.2026.11.25.19.00.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 19:00:38 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Zhiqi Zhang <zhiqizhangg@gmail.com>
Subject: [PATCH] mtd: ubi: fix nvmem-layout reference leak
Date: Thu, 26 Nov 2026 11:00:33 +0800
Message-ID: <20261126030033.35385-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_190046_338183_8E4F55BF 
X-CRM114-Status: GOOD (  13.30  )
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

While reviewing the UBI NVMEM provider, I found that ubi_nvmem_add()
only uses of_get_child_by_name() to check whether the UBI volume has an
nvmem-layout child node. The helper returns a referenced device_node on
success, so the current code leaks that reference when the child exists.

I fixed this by storing the child node pointer and dropping the reference
once the existence check has completed.

Fixes: 3ce485803da1 ("mtd: ubi: provide NVMEM layer over UBI volumes")
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 drivers/mtd/ubi/nvmem.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/nvmem.c b/drivers/mtd/ubi/nvmem.c
index 2dade9727..d6c5f191d 100644
--- a/drivers/mtd/ubi/nvmem.c
+++ b/drivers/mtd/ubi/nvmem.c
@@ -61,6 +61,7 @@ static int ubi_nvmem_reg_read(void *priv, unsigned int from,
 static int ubi_nvmem_add(struct ubi_volume_info *vi)
 {
 	struct device_node *np = dev_of_node(vi->dev);
+	struct device_node *layout_np;
 	struct nvmem_config config = {};
 	struct ubi_nvmem *unv;
 	int ret;
@@ -68,8 +69,10 @@ static int ubi_nvmem_add(struct ubi_volume_info *vi)
 	if (!np)
 		return 0;
 
-	if (!of_get_child_by_name(np, "nvmem-layout"))
+	layout_np = of_get_child_by_name(np, "nvmem-layout");
+	if (!layout_np)
 		return 0;
+	of_node_put(layout_np);
 
 	if (WARN_ON_ONCE(vi->usable_leb_size <= 0) ||
 	    WARN_ON_ONCE(vi->size <= 0))
-- 
2.54.0 (Apple Git-157)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
