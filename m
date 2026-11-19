Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C45A60A5BE5
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 16:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T4P3ulo+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mVhF1av6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DPUIxl77yzu+tuKTn9wTgrV296qYprwZ8UljmZf5qeQ=; b=T4P3ulo+23gCEJ6VmWgJygd20Y
	/nt/UQ0RKHuCEFGVy2tq+zj8J2B3/g9Bj6u4mhmMLwbltBNUxRbrmmAgYfNOIUNZgRwBCU5TLadyW
	CSfD4yXkwZEqTDrxHlNMoCItauW9mrKnfd9wm+MwMw3DAzcunfb840HlkG75fq3qsOcK0nytPaF9f
	Nc0qxI2EJBt4YThnAi1XDrY4NWmiV/J1mvXwgQ408JzmHQMpFpYgi7f+YiCdO4z8tqcOn89bSwj8f
	fyLtLipxRS/E+L+2++uOgaMblOyapsJu+rmPOHTwHLS3iYfqZZT4YIqGY10i2t//gpiL6tZg/WT1z
	eu4XLtgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5Dk-0000000ChCK-0VVw;
	Thu, 19 Nov 2026 16:42:48 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5Dc-0000000Cgyj-2P2e
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 16:42:42 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-717080a2d50so2122378eaf.0
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 08:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106560; x=1795711360; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4c2tomY78ENRH0Ja91CkTFAAwqmDM/gzLGOxCRtSTus=;
        b=mVhF1av62yZ7OLQ07sSVXv0zeKEThT5YN9H5ESLFqJSvNeh9MditZlC2SjRD0cj+9W
         wseOngIkh5AQlCqHJhqWFz1Qe4YZ4/RoQA8BV1DbqGkz2Zki/EumI/fzkxtHMH1euKpw
         lqiUCTlsj5yiIRWUwuKMdVJmmrUKkGK6aNtcNTnDdWYQBuuAX4iU4bOGYzN7Uffgfnim
         HzoSnPwxdgBidoviLw/fAej0sa/3XTR133uW8ekdTggo7PIBid8a6t+1FEb4xTLwYxdV
         HjLTUAX7fseU2VtXfJebjiGzy3VazAnL46G/3kLV/IvXd+TpLI+34Q90S9GGQl90249P
         d5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106560; x=1795711360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4c2tomY78ENRH0Ja91CkTFAAwqmDM/gzLGOxCRtSTus=;
        b=o6QLkDVt2BaBT7ZtBMfIhKMdVGYyEArGahvBlIEk3/pO8b5bLxJ3jU7GfiWXh6djz2
         gsLKut3AqJrTxITJsHoexB1bu6cJRqlwFL3dboDPFT6AA/cuptUWebd3hllS4lsyPovu
         CJyfeKf6HPAYpgWqYm36ST47y0KZo+Z82s4AqYQGERpJ5PzM/TqEnJAR73qmgWHP/C3d
         UQTyX/sklCU+LeZhkHJZT/RcUzcwve/8G/nGHKAMp0GFFcBWQYNNgxzoHbk1rFpcz65W
         VidDFoZTqKXkmltJr/WgQLU747txlEEaq1BtoNpE3EetZ1L9cSqLogK5RFw8QY+34O0s
         TPiA==
X-Forwarded-Encrypted: i=1; AL+hErGShjrK5qcKg8TnJV7LwFWBf5pAULLdppgGxLwXbEpIHlMRugTmeKRdWlddOu9j+fIpuCHCjGb6hQg=@lists.infradead.org
X-Gm-Message-State: APuU4Z+E8t14lIrzrtWoZD56pNJ8Kax7lJ5P+ofEoOZYccAJ/DbHS44f
	pCBLXckxzPkcHQlKhIKdhe99MiS8hatokZjQ9kc1IO9h1pwqHmPOIePn
X-Gm-Gg: AYBFou0BsYg9RrhJxmr4gzsOvscZ1njj5gkFW8mru8UqFlbbrnG7SljW9+t2ryNuGNI
	DEelkzkPPWDIWQhUsH3CuuIaUmw4sPwsIJoYlo/M6hqUEPfiLhPXg1NNkouWuyF/n8s1t0Kj920
	lrLnmVn/De2wniLQhG23Q5AGPGHTczjRB16wPrzrJUctaVMWawRFg1ZBvAw1I5x0lyENI1EaWsz
	TSeCMWJEErtudoaOY5bYKCcP+h067IwJTFBjap9AFqTgrn9xZ/XiASSaY1GR+aphD6tlqAPAs0r
	l2IG35nmJafibDkv+YLM8pS7w4R+hzA5QjNjTCCZN5sZ3NsIAjoF0Gpxxo8akNnDqM3pbof7Rj2
	VQ2bIYmEatFZLEciFtf789dP1mKoTk0lITy2kgEwpnjt3Dc6LqD5inHS4apwxeAiLIXd7Z7rDjY
	iyq+qfoEsLndsrmCB2BDEljA+rCYAHnDu3G6TnrAomCOapug1Tk09OqLOKImv4h6CdwDuU6abDQ
	fze8WKyCtG9O4UGK0L5/oZ7u5KNRPEKaOs8pmpXdweyz+Vn+pQa1R9Xhe2v6bMM9VBgQHOowGgn
	Gr0/7nV5kMlTr6EmjrS3gVWmOHVGJur6eVDiP+RFH7BozednmwN0k+b1vw2zujewU6TYjADQuRK
	vt1YlGhKlMP62+/EHIE7r4N52YCB8aKgRWbJshQl2KIhDCAKnBGMGc0y2NhiPZJYu5L/yLtgDvI
	SE4N2VnNYTjK4AUkVU+wM2jJPPCdNOY3LgeHHZCMwrLGvRkp3ybnM=
X-Received: by 2002:a05:6820:f016:b0:71a:f065:6179 with SMTP id 006d021491bc7-71b39036693mr173733eaf.0.1795106559685;
        Thu, 19 Nov 2026 08:42:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm341975eaf.13.2026.11.19.08.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:42:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:42:09 -0700
Subject: [PATCH v2 11/11] nvmem: allow providers to specify an explicit
 NULL owner
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261119-submit-nvmem-provider-lifetime-v1-v2-11-8fca3ec5f18c@gmail.com>
References: <20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com>
In-Reply-To: <20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com>
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
X-CRM114-CacheID: sfid-20261119_084240_922412_866EB43C 
X-CRM114-Status: GOOD (  13.72  )
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

The owner fallback treats NULL as an unspecified module. A provider whose
operations belong to built-in subsystem code therefore cannot distinguish
its deliberate NULL owner from a request to use the parent driver module.

Add owner_is_explicit so such providers can select their actual callback
owner. Leave existing callers on the parent-module fallback. Unregister
still disconnects and drains callbacks before the provider releases its
state.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/nvmem/core.c           | 2 +-
 include/linux/nvmem-provider.h | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index e878931f375f..bf6f2cd50970 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1111,7 +1111,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	ops->reg_write = config->reg_write;
 
 	nvmem->owner = config->owner;
-	if (!nvmem->owner && config->dev->driver)
+	if (!nvmem->owner && !config->owner_is_explicit && config->dev->driver)
 		nvmem->owner = config->dev->driver->owner;
 	nvmem->stride = config->stride ?: 1;
 	nvmem->word_size = config->word_size ?: 1;
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index ba11c807593b..019fdf04cafb 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -81,6 +81,8 @@ struct nvmem_cell_info {
  * @name:	Optional name.
  * @id:		Optional device ID used in full name. Ignored if name is NULL.
  * @owner:	Pointer to exporter module. Used for refcounting.
+ * @owner_is_explicit: Use @owner even when NULL, without defaulting to the
+ *		parent driver's module.
  * @cells:	Optional array of pre-defined NVMEM cells.
  * @ncells:	Number of elements in cells.
  * @add_legacy_fixed_of_cells:	Read fixed NVMEM cells from old OF syntax.
@@ -116,6 +118,7 @@ struct nvmem_config {
 	const char		*name;
 	int			id;
 	struct module		*owner;
+	bool			owner_is_explicit;
 	const struct nvmem_cell_info	*cells;
 	int			ncells;
 	bool			add_legacy_fixed_of_cells;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
