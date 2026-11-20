Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0FF60A261A
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 20:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=isMf+lca;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bLhzx5SH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=I1+aSmCq6nEpNfk3VW81/j5Oe4T7Tdl9Vbg5jPLpWmw=; b=isMf+lcaSjdaVVx0mcfAUgPd/6
	Vu27sA1KpoMSpQbUht/O7+JTnOCpLFVJ2HgKubBYWX+BJivX7ixy4Z6Hu1Odahq4MPAdynm7QYb7z
	riuk9HkyL15JlR1/UOZyip9Hatr7ePlycD1uJu2RruZRmqywmIfl+vXACXgaqI+7RzOHPVJ3j+xA7
	R3xHXY+tcd3T2rPcYhpWZ6ewfiZ0PUi2ONMCBWsbYM6LK2+GJihUSzcFJ66q4/t9OoEGpMYnZGjbh
	5nErTJoisx1Xx7BU6ZfWFW9sQY7vKIyiFVVTeKU9HrYtE6jT9MyYacHxrXre/Vxfihr1SZuSXxH+s
	NxkmfRqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUup-0000000GC3W-2FvB;
	Fri, 20 Nov 2026 20:08:59 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUud-0000000GBt3-2xDf
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 20:08:54 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-8470d7d430fso669556a34.3
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 12:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205327; x=1795810127; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6YziSWU9Vv/SSiOeWoNYhrCtlddrN7QMjXsUxwqwUE=;
        b=bLhzx5SHHr6I3ZvhJdNvuzKGKcaO7LFMcR5cDUsP2UN+i8Jo0OA9LjRDkctSGD0u3u
         zopzu+Ej94L88An8wEZwKAW7zp50nJPgrtryi+uxIYQ5n43Ba5Z6vpVXxbi2vaVgQM7N
         Gw2ak2KsvxOrDdixjby9KDaxFLpBgTECAtSNFe0mACQcSyGueDRWYwZTwhyvROve0PBx
         ljxkWIcRkJLsmY+4FekORz4OXYm9/mmonKpfwunylhSdRKdyEm31STt46QYmQAq02bYE
         9rIwS1U6vwKZvH83ofm5WwMQLBQysAA6aqjogRCsmSjwTm0xKHzysQ7vtlNwnWKiNUE2
         q+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205327; x=1795810127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6YziSWU9Vv/SSiOeWoNYhrCtlddrN7QMjXsUxwqwUE=;
        b=cMzgkf9AI3qBy/EQmJf0xT4ZkaJRQj4rjv+UazUjWqEflQEaNqpP2ELKOsb3JBbexh
         omTcn4t/RiqLptzS6iLst2W+nF74AXO5c/BG5JXhH4t4Pqn6nM0Az4kSSO414z7Hc5Mb
         DXNofv8YojtkJrjFUZVWac6MHrUZQ3qnvj0aDcyl56URHG7k3JpPk1r4usScaBQivd7d
         kBXqHfAVQQ9Panum7/8XkwZwRIvrCB4VBKG+SuILb3b3qubwkPrckjNFbS6g65UwN98p
         /vJkYw3crTWs1hYJCC7wwKUn7f3d7iWcCWYc/cxpZ3lfRdUB73GB38vBR1a/E4OWIWOT
         GKEQ==
X-Forwarded-Encrypted: i=1; AL+hErH/tkiU5dsYoXsXNXHQpVIL5asMSZUAncBZYH2/2iU1rIHG/ZduGePsr4mMlKFqTtpRL5ZCo2n+5Lg=@lists.infradead.org
X-Gm-Message-State: APuU4Z9GAsO7Bgvm/Kmc9TPUJYCn0SN5AHOQfCbDdGeGLtmPrkM4oJxp
	RV9MU6vSfyq5fvtekwF9uqhB40M2jVAyFgIyJVniIXe7o414BqIrRcTh
X-Gm-Gg: AYBFou2bXImelO1bcVjKSsqS8qbo7x+0fA6MItvL11qmUiWYipwigNYqCrx1DCiiCbO
	HNsPLjz6YLomgIvxwYnaTfYt4FZfL2tygh3DcU6Ur9WqvJOqwh59MtKp3MRdXwVNKRw98fvWFbQ
	vjBw5IEARKqYMmLSH5sy2Tv4aJkbWjRbRcM1B2SC+TB6TkGro+w8Qw/pA+mQWqLyzby0Mx5Pygs
	dK5B3BDtntTOeutc4SmRyh+rddrkphY9TRUl/qEz0tVcS/ii7n4u8WgWngLy8ABpCZV9muI4M07
	oYwkcpjXbLkYd8augw5Ij2F7r+SdCshBfOM5iKQ/cYGTpLx/tDF6iG/5WLhYukB7oZIx++qDkGD
	6d8UnLMZUPSctR+xT5JZFqsZk4ydurfUoeANqpMx+1K+6WC+wwFKzX0hBtD050e4gjmeDHf4Jec
	gP+wZcD/+TmY2goy1yztoUDAB9stVfljz6NvBlitEgbnaYIQeZTP3uAg5ytVR1MNXb0d4SVFMUH
	z3NW+dbmhh/dd7W8Pbmjybx7FSC9hAO+BbSdhvtzcSJfYotYUCNgrQF+2FYiZ7WGLS5wX9APV6S
	Wol+OssLPhpuPGCyhYkbLECsVWDaS+3YYGOXh6Riju2ywMwcDqtouoQ1Z5wXFF2fGltFyWmhnt9
	IUphchfkVLCtfvLT2WRT/+C6jSz1bNqJRoBpJ9+D/JpJLa3QkssdzNi3lEJcTXzB/9HIO+9Mxgo
	6ZhuzYgBDJEaxtgVL13P+Tx8nvrRk1OyjYXt2GV6AEUn/AzUTpB1Y7+GbG4h7kGv317DFLcZx8G
	w==
X-Received: by 2002:a05:6830:b14:b0:7fa:ab72:9e01 with SMTP id 46e09a7af769-8631595facamr4891000a34.25.1795205326803;
        Fri, 20 Nov 2026 12:08:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316822ad4sm2746249a34.3.2026.11.20.12.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:08:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 13:08:39 -0700
Subject: [PATCH v3 09/11] nvmem: disconnect published devices before
 registration rollback
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-nvmem-provider-lifetime-v1-v3-9-523610652402@gmail.com>
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
X-CRM114-CacheID: sfid-20261120_120847_911342_C8B90012 
X-CRM114-Status: GOOD (  13.79  )
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
index edc2f61e6e0a..e878931f375f 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -27,6 +27,7 @@
 #define to_nvmem_device(d) container_of(d, struct nvmem_device, dev)
 
 #define FLAG_COMPAT		BIT(0)
+#define FLAG_REGISTERED		BIT(1)
 struct nvmem_cell_entry {
 	struct kref		refcnt;
 	bool			disconnected;
@@ -1181,7 +1182,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 
 	rval = nvmem_populate_layout(nvmem);
 	if (rval)
-		goto err_remove_dev;
+		goto err_unregister;
 
 	/* If the device has WP GPIO, default to read-only */
 	if (nvmem->wp_gpio)
@@ -1190,20 +1191,17 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 #ifdef CONFIG_NVMEM_SYSFS
 	rval = nvmem_populate_sysfs_cells(nvmem);
 	if (rval)
-		goto err_destroy_layout;
+		goto err_unregister;
 #endif
 
+	nvmem->flags |= FLAG_REGISTERED;
 	srcu_notifier_call_chain(&nvmem_notifier, NVMEM_ADD, nvmem);
 
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
@@ -1218,6 +1216,9 @@ EXPORT_SYMBOL_GPL(nvmem_register);
  * nvmem_unregister() - Unregister previously registered nvmem device
  *
  * @nvmem: Pointer to previously registered nvmem device.
+ *
+ * Stop and drain provider callbacks before returning. Existing consumers keep
+ * their core-owned metadata, but further access returns -ENODEV.
  */
 void nvmem_unregister(struct nvmem_device *nvmem)
 {
@@ -1225,7 +1226,8 @@ void nvmem_unregister(struct nvmem_device *nvmem)
 		return;
 
 	nvmem_disconnect(nvmem);
-	srcu_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
+	if (nvmem->flags & FLAG_REGISTERED)
+		srcu_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
 
 	nvmem_sysfs_remove_compat(nvmem);
 	nvmem_destroy_layout(nvmem);
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
