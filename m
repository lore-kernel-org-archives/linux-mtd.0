Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56905606A8AF
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 19:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Va2ZzHZt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0R/BfLQz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2Ed67VMlBVd0ryoIIIr3ktHGEs6WEVPkQGTgOuKepFQ=; b=Va2ZzHZtfyHgkTWh2ikaq9aEpG
	0pmgjyUUiIrtFdv9D+3HvnpVdoGoZu70KaL2/z9N728TZqt2ORrBgBoWEEnisaSRuyDOgrWRQTlJW
	OdBBdzdgflSDog+DTKo44J/Ei80PVA8ufN0/MYmX5ifZS/LBb90Bgzlv1ixNaLLtfYefKjNVP1CrG
	wDt3PSwq7Cqyc9OMwMM86UWg2Zb2FijAZJGfiJa+zmJz5T3IP0I6pw7245BW6Rtap+M042JRl4YTP
	Kq6o6axjt18pJPS3FbQnSgGms8KKyr5ZeOE7SEMGnzvLKC3zI4i9rY0Ps2BiiYZD8UhvyocWAxHe7
	KhA3YYFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP15-00000006vfL-02dK;
	Tue, 17 Nov 2026 19:38:55 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP12-00000006vaa-1pKZ
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 19:38:53 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-7190d9bdb2cso152096eaf.0
        for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 11:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944331; x=1795549131; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1jqnv5GeXVKy3+PA2J2dSMUWrWP8qlh5fFKvFo9JWLY=;
        b=0R/BfLQzAUnXgwgcNXA+QZlZ/Blcf5+oDSb1WPeEgJ0qWzajqlqW9Fp1xoWFGh4Rfq
         3jOEJEqmKbAtZY7aWEUlSlZMoC1av2U6DO0I2SEsTcPyXS5p9WI91YQmMRz6HJtGs9yz
         uNtg8RqLFtVIKWMmAZPsMRoXD+Uj6UoSJcFMr6KclNMsHjTmqqCkOoVXqA6mSC4Q4U45
         1mEJltufPg3GUf+H5wrtOnRyRfw2K5VhftTESJtsCsZDkE/CyGeUs6Ax07i4AYxiaEpk
         p1agKdGwZ2LllYjxhk+MMKklZZ3u+TkZDqDWRJEav3D8cOtkORt4CyfqqFXWBBc4oLny
         03zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944331; x=1795549131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1jqnv5GeXVKy3+PA2J2dSMUWrWP8qlh5fFKvFo9JWLY=;
        b=rtHo1GpvgdrZQyJxhkr+vaZg7qa5U51ebhRav7PCZTPw8Fw1UVM9oucv1Ismn0AuTx
         4IOa4UsNjdFHOShWul5uh8yc6euMQEeFIRqhFD3zdYAJ394wQ1AJY31x5oUHfJOn3nI4
         pbauZ90fiBcBLNisKJemPuqwDe5BsrqDPOqOLA4x+SKNO6d6Zlm8Dxtj3mLtl3G5uArH
         ZDzGDJ4G6CezlRn8vy9xGheaS3VTCRRfoPHJJbLnCeCekNOIk+6/3KvjvXSW1Jt4EpPJ
         GXVERgrUOHvRcVgjPCiKeLTEFGVHmsmJhx/9eNnKxPjAeAnnjHC8+whNyCQtjg7sV6nX
         YT5g==
X-Forwarded-Encrypted: i=1; AL+hErEDmKyHvH8cIHRVLjbHEFvIdKYmESHMITNtzwlZIl0wNB7hvJ0DbouOqhwvgfwa4rOquV7xrRjKf6o=@lists.infradead.org
X-Gm-Message-State: APuU4Z8Fac4LaWk5qDq4MHsE9Kj5gwIlRw7WFQeo4dF7xh72pF/iI3X/
	6cOM97o5ZKp7SLIPteoK3n42AoRph1rkLuzYS2tZbX2PkK/yJ8/rulvY
X-Gm-Gg: AYBFou33l6+ZFudCoO6bObSe0s35D+6C2Zp7JXASfslQB0GyD0NRexn/2GQhX/Fuiho
	0GQceumK4R351nMtIVTVlQNg/WYxJ1UpvNr2Qyani1UTRyHmtN+7exPAXBwtOcEN/7+7yGGWuW1
	nlUwvRta9G3i3tf2SpjAQtw24v78zDfZxaOwbEmUgifQTGR0BeHi6an9IZ08U9+gn0Ftxkpr1dl
	Rl3c7bOJdOidnCoblrM33PgKhQbbDE4OHP13ZRgLaiuS6zExE663DwWVoG00OkJI+ZnuBpLtIQh
	Nb77CDqR2qxmHHLSJ/YUHJhiL95B1UcPKJ5WVfXhoS1OwiuZS2B1tGK1lScIxkuSnRdomkqbk6t
	kjglpcHBFqcTUJWIQSR3S4gkCRSSH6u8TODZygssMMf7w/CS+RzCzBdYOAvIhJIOKl8s4eUZ6WZ
	KikmMuh9f2kBl93lsYQlst3G9DpZz0xDKzG3XdDZMyVDC0qawJ9VJ4DH3Cbf9sHde7IpzQqVpRX
	cAFNDryda0iUdEknTqswRYEnfPetAi2d+ff+qw1BciFM81AUyyV38RC0o2YsmZ7IVncS0R8J6FS
	lI4LqH9IbuoG7VWx0kuFyLLcjvv6KJsV/Qm5nlPV3gHI9W3igBuhg5NcKW2qDnHh+J4f3dNlYa/
	NfraGZEwDFWzAM5WJv7eSsxpfuOvAiVEgIS/GXLJ23Cz+v5j1MjA4wBinPpAzzthokTXryR5A/d
	uUwFDbjAAwKt7fzoY8roVtC1YH4kqujSmtJmaHFzvwMSbmjmqqp7eFaDdeHFANa1OqCRtaPyM/
X-Received: by 2002:a05:6820:1627:b0:71a:df0d:ea2b with SMTP id 006d021491bc7-71b1883e80amr279612eaf.83.1794944331147;
        Tue, 17 Nov 2026 11:38:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm146281eaf.2.2026.11.17.11.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 12:38:16 -0700
Subject: [PATCH 09/11] nvmem: disconnect published devices before
 registration rollback
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-submit-nvmem-provider-lifetime-v1-v1-9-3cfbd48812b5@gmail.com>
References: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
In-Reply-To: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_113852_495375_297C5688 
X-CRM114-Status: GOOD (  14.13  )
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

Registration can fail after the NVMEM device is visible and a layout has
published cells. Disconnect the provider before destroying that layout
and deleting the device, just as for normal unregister. This prevents
layout removal from rebuilding attributes while rollback removes them.

Reuse nvmem_unregister() for failures after device_add(). Track whether
the registration notification was emitted so an unsuccessful registration
does not generate an unmatched removal notification.

Document when providers may release their callback state.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c           | 22 ++++++++++++----------
 include/linux/nvmem-provider.h |  3 +++
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index f1a254a0a5cb..619d33a59697 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -27,6 +27,7 @@
 #define to_nvmem_device(d) container_of(d, struct nvmem_device, dev)
 
 #define FLAG_COMPAT		BIT(0)
+#define FLAG_REGISTERED		BIT(1)
 struct nvmem_cell_entry {
 	struct kref		refcnt;
 	bool			disconnected;
@@ -1202,7 +1203,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 
 	rval = nvmem_populate_layout(nvmem);
 	if (rval)
-		goto err_remove_dev;
+		goto err_unregister;
 
 	/* If the device has WP GPIO, default to read-only */
 	if (nvmem->wp_gpio)
@@ -1211,20 +1212,17 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 #ifdef CONFIG_NVMEM_SYSFS
 	rval = nvmem_populate_sysfs_cells(nvmem);
 	if (rval)
-		goto err_destroy_layout;
+		goto err_unregister;
 #endif
 
+	nvmem->flags |= FLAG_REGISTERED;
 	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_ADD, nvmem);
 
 	return nvmem;
 
-#ifdef CONFIG_NVMEM_SYSFS
-err_destroy_layout:
-	nvmem_destroy_layout(nvmem);
-#endif
-err_remove_dev:
-	nvmem_sysfs_remove_cells(nvmem);
-	device_del(&nvmem->dev);
+err_unregister:
+	nvmem_unregister(nvmem);
+	return ERR_PTR(rval);
 err_remove_compat:
 	nvmem_sysfs_remove_compat(nvmem);
 err_put_device:
@@ -1239,13 +1237,17 @@ EXPORT_SYMBOL_GPL(nvmem_register);
  * nvmem_unregister() - Unregister previously registered nvmem device
  *
  * @nvmem: Pointer to previously registered nvmem device.
+ *
+ * Stop and drain provider callbacks before returning. Existing consumers keep
+ * their core-owned metadata, but further access returns -ENODEV.
  */
 void nvmem_unregister(struct nvmem_device *nvmem)
 {
 	if (!nvmem)
 		return;
 
-	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
+	if (nvmem->flags & FLAG_REGISTERED)
+		blocking_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
 
 	nvmem_disconnect(nvmem);
 
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index e0638bd50d1f..ba11c807593b 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -107,6 +107,9 @@ struct nvmem_cell_info {
  *
  * Note: Specifying name and setting id to -1 implies a unique device
  * whose name is provided as-is (kept unaltered).
+ *
+ * Provider callbacks and @priv must remain valid until nvmem_unregister()
+ * returns, or until a failed nvmem_register() returns.
  */
 struct nvmem_config {
 	struct device		*dev;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
