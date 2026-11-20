Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC2060A5BD3
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 20:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e7OU1h2H;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AYpapMYa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TUftXskehCQsAuBjJl54YwgwsirFh6n7CoCH80g41jU=; b=e7OU1h2H6aPWkQfzA9VJsg+hr7
	R21/2K9Menp08S1X26W4QzeN9hczKUYMjhtH2939KC41Qacr81YcBBzTzuAPnyweSHtVam6eAfLsR
	7bIZWH8Gj2YCUSGNQN62+CDHU5cShwkthp2lfZ3Cd0FGaortNuHvx/xXRc2i/eRbUDPJqHGofGBpu
	H8+mZeG17HNXr7bQWCRdoWwaEhRyOTaZJjgts3undpMcKb5i0KXRkadkvvqbCmf/CWo8QwiIqIxJn
	oacKyUHT+WawTLXOodDgNmLrb4TfWyKU4vMifHSsww9UZ2IMpTZWFFoeHraL2uPjS8MzsV8jhAWc6
	W6N6Ppsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUup-0000000GC1w-0JfU;
	Fri, 20 Nov 2026 20:08:59 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUue-0000000GBtu-1kcF
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 20:08:53 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-862b3938d98so662666a34.3
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 12:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205328; x=1795810128; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1EaTywtJ0ZaLtfLHyxoBdWpieG6YjnInrIP+X97zOM=;
        b=AYpapMYahzC6C3MWcTA98EZmBEAcxw4ltYJrX+Yol8wo+f1dFlq2e/lgeMcnqo/Spi
         hnZiqmD+oS3IP8D6Dm8fEbdkWUS9PrdZ9DEMAAOk3sFw3QZRnsVXzmBW5VaBjPfUstlW
         bL+6K7gAKkskELqbrFQ4CC4OGB4arWJ+RtJASrIOkzokcTWIwSSv2cZ21Rbsosp7YbXl
         Z/2ReitKkm3E7Exzkv0suFtd82D632tOQG0t01oQ5iOVcGl1MhFER5Atz+ya+B8NqoNr
         3l2yszqn/sObzAd/5BEgEqblVUn/UrSmyvl7TCFPwyHiyK4qcSn034safAcqDUUpS+mX
         HyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205328; x=1795810128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1EaTywtJ0ZaLtfLHyxoBdWpieG6YjnInrIP+X97zOM=;
        b=rHOgubMfokPA59sD/z1gdXkSLqmUgjzlQFDcJ2IKbjQ2pTxz87OzQB8ujPfMgaVkaD
         LvjR6zY+vkjJiqrheyUVCS3vWMNhEC9H/vz40SxNbC4J6y99rnXOHoZj4p4SZqG/wYlk
         atzDvkiH2pOp/sxaOQk7kUyOhfOrSTuzrG2KoeebMp9vuEvHJltv/PbrnjP/FQxdT5Fb
         V45/ZJqX+bBW6O+/MIe7DWQTO4gP1atqF8TzlZcuSjHUiqxBeikkaIUwGIhaQMtZwIqs
         9HT5AWTp1f7F/At3eAE5sSA3Pc6NkF8GVURV4fI6JpX3weqnQGhq8RXcObEMWgnWWtlj
         nxnQ==
X-Forwarded-Encrypted: i=1; AL+hErEx9C22VrNGAKTtIFk4piwmedU0FP8cdt4qgNgzbztkBsUIkvETTyPFkPu5fQPEbW4bcS5CEI0s/JM=@lists.infradead.org
X-Gm-Message-State: APuU4Z/+lA/tD71IiQyDHKK/8+HGU+SZrJ6t8AsF21UXwgdHJVL6PjLE
	oN7X4Bq0TyRFHdyP5oVd0rah0ZO3v5BPzg272N0+LmjI85cVWuw7KYXt
X-Gm-Gg: AYBFou0aBbK+r4YTYpLGa6Fyo64Ybx1KEizJOwy+CKU5SSZwsqjd9rdy/3wMrzwhMMm
	4gV7P3qZ7kVLOGnPWX72ocm6cO3y7Vy59P6he86s+ryewHBAL244OHxjcu6eY8SbVDUw/WemHCO
	Xg9fAV2MUn3jYgssWymKsBCKyjwyC+QLfOeQEcVWybUDOBBkHDhcbOvFkT46QsXxZX/ejFHkuJA
	73f+DzSRR2bEig7p78KCVZB66SUzUF5dL5vxAfEBIx0z9nhoT6thJMERkM/zApVunGU9QQq0sY2
	NEupsZLgMiEx0Y61TG62mqpu3eeb5i4F2mFuoDPFKzRG3O0Ehz7LWJmbU7hbOAD8BcAVME7WSHe
	RCnVpzOHOdry8bu9Ni3YNyeE2l1rjoQW+s7Ujo/u8mMOdJ6RU+efBfKVP8uj3l234wp0RDqKPdz
	sXf4qr6nU7Ek2H0Ltg8hKCVb/4VOvzmaVYmm8NPkWOf43l9E6m4E5MKJ+iJs9ZoefKbm8aEzbcW
	DQWyw8PWA835rXzP/MASRyzrf8Br1JwdDdbUYpW9SU7ZVZxfpGETRBrI4l5Cqa63hCthOkcIU2p
	PXooJasrrm8jEcK+5DPkQFXBCuv1wrYL8/rXL8laBEDI0t2MmIzqTpFtxOufJh9jXzpxqcI38eF
	NIqfoTLGec4ZLby+TzcDu72m23qUByqoPxmLagPhfCKkB/FJO5e0+zzMg2XbO2FZ0zHY5Nea9eN
	BQtFBBOU5uFVdB45Fc5Ehf/GeSMltb/ZWmMK3daB7sUDuqKGYSF942/6dXH9m6vXKUylrsTBlMa
	A==
X-Received: by 2002:a05:6830:2709:b0:862:c9e8:576e with SMTP id 46e09a7af769-863158eca20mr4709854a34.21.1795205327698;
        Fri, 20 Nov 2026 12:08:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316822ad4sm2746249a34.3.2026.11.20.12.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:08:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 13:08:40 -0700
Subject: [PATCH v3 10/11] nvmem: u-boot-env: propagate cell registration
 errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-nvmem-provider-lifetime-v1-v3-10-523610652402@gmail.com>
References: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
In-Reply-To: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Linus Walleij <linusw@kernel.org>, 
 Khouloud Touil <ktouil@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_120848_795414_5EF89DEA 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

The environment parser ignores cell registration failures, so allocation
failures can leave a partially populated layout reported as successfully
registered. The OF node reference obtained for a rejected cell is also
leaked.

Return the registration error and release the node reference that was
not transferred to a cell.

Fixes: 7c8979b42b1a ("nvmem: u-boot-env: use nvmem_add_one_cell() nvmem subsystem helper")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/nvmem/layouts/u-boot-env.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/nvmem/layouts/u-boot-env.c b/drivers/nvmem/layouts/u-boot-env.c
index f1fb206846ff..83c687e43e5a 100644
--- a/drivers/nvmem/layouts/u-boot-env.c
+++ b/drivers/nvmem/layouts/u-boot-env.c
@@ -55,6 +55,7 @@ static int u_boot_env_parse_cells(struct device *dev, struct nvmem_device *nvmem
 {
 	char *data = buf + data_offset;
 	char *var, *value, *eq;
+	int ret;
 
 	for (var = data;
 	     var < data + data_len && *var;
@@ -79,10 +80,12 @@ static int u_boot_env_parse_cells(struct device *dev, struct nvmem_device *nvmem
 			info.read_post_process = u_boot_env_read_post_process_ethaddr;
 		}
 
-		if (layout)
-			nvmem_layout_add_cell(layout, &info);
-		else
-			nvmem_add_one_cell(nvmem, &info);
+		ret = layout ? nvmem_layout_add_cell(layout, &info) :
+			       nvmem_add_one_cell(nvmem, &info);
+		if (ret) {
+			of_node_put(info.np);
+			return ret;
+		}
 	}
 
 	return 0;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
