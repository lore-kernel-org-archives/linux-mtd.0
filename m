Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDED606A331
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W9/w4RY3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rIDTTpn9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=30elo7VpSoxOnRmfCYi/DHmQi911TLdPbrqJOcwlYac=; b=W9/w4RY33DVSjQH5hWxIJfYz2x
	cutfPyFoLzOt577tb/ml3dlcsLYqiqCuajkkT238mhPfrnvbS4SO7qF6RDmLOT/VlYvvpK2mJmOH5
	UCDMb4/KRd4SCE3LFD60ilnHEfW/Qwcp/pMjXHr+NGjAqt1euE9N1WcelD4c+GAnV8AW0GceddNUh
	liXEEew+6fnqFXBnymqO37jj7qiU0d5AtI/NOk+mN4Bm4ll9u6VHFsf6C+qeTDuOaLbPO6z6vjUNG
	l3mZ2jngUoJnJtTtgivjsIHlrsotzoIVQPM8tHtUrogqOKrKPSS2E0sDG9fdw697OJ2eP2MElJ65x
	ZkjZKp8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgWn-00000002vjX-0kYd;
	Tue, 10 Nov 2026 07:44:25 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgWk-00000002vhv-0qJq
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:24 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-8256106635eso763715a34.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296661; x=1794901461; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IAYsb8CQhquDM/WpsloaWHJqp5TKYZ428PRJAG8/2hU=;
        b=rIDTTpn9lAcb0WtcRWfjhE8CpLbnzgmzL46J68JKbc/2prNYjyAhoqrWkexui/oo4O
         6RVAhvpijS5g6lFtdMDu7+zYSgPVIMyFETfkpeGQpBjbwq1yRaI2rvQ5sGPO4iQreZj3
         DGNt53O54rf1Dfm5KRvduuuYwdfzWjDZodg7mSqkIIvI4viBJTrDvRwoJmk/3s5ShTzf
         8KLISumjmxISB4ajUC0AKwyIFE4Fi24y6jlpYMSgZHKDFvyt5t9r2xy7/Rk1CMw9UiJS
         5Wgb8hXZlk1LzCoEYtSZyjQrvuH0Rx8TjXQo65M0QKoOvIAlLsVYTAC4u5xpO01qJcul
         Az+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296661; x=1794901461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IAYsb8CQhquDM/WpsloaWHJqp5TKYZ428PRJAG8/2hU=;
        b=VaBPpsDr6bRLvcmeEVYqely5WytM8Z2Fjf+87PSqYEy/UP8Zu0GVMFYkSyGamv7KmQ
         bH/+/w4qMG+C2NKxRbGMN5PwRhR9eQ6tKF7/xRPDOP2Wq25MbFExRQwXyOR7P0Y2KxLL
         CP98rjLlMKH/kB83YorRuhEthtNMU6ZePIlKjX3m1A7cwT2I2YeL8/6YP570kBAP6O1o
         e75cHEvrPXNi/IIOaUeNFpAx9M3f8Lsy4+1LCeU41oNBop6oSo5fnbpaYMjgEFTksdkY
         IZrznKKdem4QHCFesvkfL4zsjSNfaM5OiCiqT13WdMKsLT25XwgA0WiC3bGph3Lxg1uj
         F8jw==
X-Gm-Message-State: APuU4Z9BXI2XU753eET4xmxcnCLqEXJ/5PX9xr8WDwNxXp+nWQWTLr+9
	d2H9XhexGiskwWOvT1Lenh6XOqJHn09oYJkn/isbr8eqnST1EciNX9VI
X-Gm-Gg: AYBFou3pxLKG5WNespIyAX+53t4BFO0G65Z59R29s9ekQ7CG8sP88fVz++h18uZeVbL
	GeG+O+5I7IkNt99neTdJygDs5teqb71wsim1N6vhzGNOKQgHPCbmMHu4yOS6e2jTE3wJdimFALD
	UNrKgpfBvheINlA6S0nsN9/ayd2ZE25PGdl7shOVdb3DbHbqId6JJVzlqdfPrD42RQ+T0hMRddK
	pAldiHFbgFnqpSCgz63IyCZK4VkDjDeiK0WjKctHAD0xGE0LRggXewsNKLIRWCHEqipSM6XuRkq
	hAgpO0yP1m2CBZvOMsXypXFYkc2k6vBU3bI445FHleKoHGZ1HjSbGYzJgAcBIXZXpdpRkarzcpB
	r4JNyvCzZlwU03A03Mk7TraJy7IhRw0Eah9ClgELl3LK5CY2Rfm5WMWTXe3ohx4AYe3gIo9eE5m
	/EgvPXkFE/0VrWkteULWOpehGLtXkSxrtKEV5r8KX+TRz121b0fTi81CurZ6Q1F1fEpUvk6c5L1
	g0GKkvvXypoitL37tkjd+GWEST/3ROlY+JQRprp/R25R9VHjlodPB2hzr+qbw4e57Qhj0jdVqwh
	9y40+MqAmnXnmVBfQ8LLFz5hkxuftWGpjyHU1M/O4fsz8xT1QVyhLJk8aPQId0JRoSlJDtfnn83
	HLY62vTf72iMq7Hll6fyPF1sDLHWTEuZKKN8PjlXQF+y9QAUC6XSnGiKnZRp5mqSK8d7UBqSnRc
	1LvjdSVg9iByTGbCoD9np3a6K0/xe/R2WPDqwe2z/C2+BKnd06+KIx
X-Received: by 2002:a05:6808:4f52:b0:4f1:6ab6:8fc0 with SMTP id 5614622812f47-5683cc10679mr1895310b6e.15.1794296661135;
        Mon, 09 Nov 2026 23:44:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:04 -0700
Subject: [PATCH v2 01/58] nvmem: retain provider context through final
 device release
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-1-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, Tze Yee Ng <tze.yee.ng@altera.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234422_257485_26A7044B 
X-CRM114-Status: GOOD (  17.88  )
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

An NVMEM provider can keep its read/write context in an object separate
from its parent device. Retaining the parent does not keep that object
alive, and nvmem_unregister() can return while consumers still hold the
provider. A device reference can also delay release after the last
consumer is gone.

Add optional paired callbacks to take a reference to the private context
before publishing the provider and drop it from the final device release
callback. Balance the reference on registration errors as well. Require
both callbacks together. Pin their module before taking the context
reference and release it only after the final put callback returns; the
context callbacks can belong to a different module than the provider.

MTD OTP providers need this ownership because they are children of the
physical flash device, while their callback context is the separately
allocated MTD master.

Cc: Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c           | 18 +++++++++++++++++-
 drivers/nvmem/internals.h      |  2 ++
 include/linux/nvmem-provider.h | 12 ++++++++++++
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 0556d140170a..8846354ae063 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -541,6 +541,9 @@ static void nvmem_release(struct device *dev)
 
 	ida_free(&nvmem_ida, nvmem->id);
 	gpiod_put(nvmem->wp_gpio);
+	if (nvmem->ops->priv_put)
+		nvmem->ops->priv_put(nvmem->priv);
+	module_put(nvmem->ops->priv_owner);
 	kfree(nvmem->ops);
 	kfree(nvmem);
 }
@@ -896,6 +899,9 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	if (!config->reg_read && !config->reg_write)
 		return ERR_PTR(-EINVAL);
 
+	if (!!config->priv_get != !!config->priv_put)
+		return ERR_PTR(-EINVAL);
+
 	nvmem = kzalloc_obj(*nvmem);
 	if (!nvmem)
 		return ERR_PTR(-ENOMEM);
@@ -922,6 +928,17 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 
 	device_initialize(&nvmem->dev);
 
+	nvmem->priv = config->priv;
+	if (config->priv_get) {
+		if (!try_module_get(config->priv_owner)) {
+			rval = -ENODEV;
+			goto err_put_device;
+		}
+		ops->priv_owner = config->priv_owner;
+		config->priv_get(config->priv);
+		ops->priv_put = config->priv_put;
+	}
+
 	if (!config->ignore_wp)
 		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
 						    GPIOD_OUT_HIGH);
@@ -945,7 +962,6 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	nvmem->word_size = config->word_size ?: 1;
 	nvmem->size = config->size;
 	nvmem->root_only = config->root_only;
-	nvmem->priv = config->priv;
 	nvmem->type = config->type;
 	nvmem->keepout = config->keepout;
 	nvmem->nkeepout = config->nkeepout;
diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
index 4e610deeaa7b..21e26b73c160 100644
--- a/drivers/nvmem/internals.h
+++ b/drivers/nvmem/internals.h
@@ -11,6 +11,8 @@
 struct nvmem_operations {
 	nvmem_reg_read_t	reg_read;
 	nvmem_reg_write_t	reg_write;
+	void		(*priv_put)(void *priv);
+	struct module	*priv_owner;
 };
 
 struct nvmem_device {
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 6063fe5b7784..b674774ee156 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -98,6 +98,9 @@ struct nvmem_cell_info {
  * @word_size:	Minimum read/write access granularity.
  * @stride:	Minimum read/write access stride.
  * @priv:	User context passed to read/write callbacks.
+ * @priv_get:	Optional callback taking a reference to @priv before publication.
+ * @priv_put:	Matching callback releasing @priv at final device release.
+ * @priv_owner: Module containing @priv_get and @priv_put, or NULL if built-in.
  * @ignore_wp:  Write Protect pin is managed by the provider.
  * @layout:	Fixed layout associated with this nvmem device.
  *
@@ -107,6 +110,12 @@ struct nvmem_cell_info {
  *
  * Note: Specifying name and setting id to -1 implies a unique device
  * whose name is provided as-is (kept unaltered).
+ *
+ * Note: @priv_get and @priv_put must be supplied together. Each @priv_get
+ * call is balanced by one @priv_put, including on registration failure.
+ * The put can run after nvmem_unregister() returns, when consumers and
+ * device references have gone away. The core holds @priv_owner until
+ * @priv_put returns, independently of the provider's @owner.
  */
 struct nvmem_config {
 	struct device		*dev;
@@ -132,6 +141,9 @@ struct nvmem_config {
 	int	word_size;
 	int	stride;
 	void	*priv;
+	void	(*priv_get)(void *priv);
+	void	(*priv_put)(void *priv);
+	struct module		*priv_owner;
 	/* To be only used by old driver/misc/eeprom drivers */
 	bool			compat;
 	struct device		*base_dev;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
