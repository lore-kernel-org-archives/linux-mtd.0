Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE58B60A3814
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 16:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wky/9RXN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KR58zEQD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Mjjj9vkkkuBUbcDZPbMA5Ckmu0U0/Sdky2KDIGK30Rs=; b=Wky/9RXNjya7oJE54l3f1ATIP5
	68u6kIhuQJfyWSsSTkNrvc7iFyUqL4wJawU1zgH3SFIvnKB24G9z6zkPiqyvXI0grtr80RSw7+cAA
	bkD1sGecbVkTLxbwo8DuRFsh11fTjrpv/f+Kj+8nOg+AJRJpAyjGEhrs4nCuoWNe6se7SM8bOhktT
	PIRxF5Cy/thRLEBT1NydDcs000rs074sGxFQbQYtWaqrN+Vh6DEzsThGEq/+xGDaajpGjbXWgKKQ3
	vypKjZoCOeyiJiUKz1uonkPyGWuf1h/ymq7IjXkc/2FKly9GTIy6xgktDT3UML2DmMdn5V4ozcsyx
	h7z5ADvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5DV-0000000Cgpw-31Ph;
	Thu, 19 Nov 2026 16:42:33 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5DS-0000000CgoS-2rOV
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 16:42:31 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-7190d9bdb2cso1680642eaf.0
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 08:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106549; x=1795711349; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dviFuqAIBQmCwTlGi/sNefyK6Za+SYcw7iPLWjwy1Ww=;
        b=KR58zEQDH+pnaP1TMVkvp69PbmKdmQd5G/2g3mQakNgUQAYOY9dssgCDzC/o+SWF9h
         TvhL76OqFW/HNusatyxrrHQ2Rw7iCZhUha9mw0kUXQ+k2FIYdNG0M/myx+lG9wF4HXoK
         KMW7THUeFhlmrTUAy9+Gf9f0zYgWg3EBM+nQphzgLQ3i88e4ekG+6wmpqq/Cbe2ytHWg
         DzSrQl8NnbpusTnnJ3X4CFUM0srGIxMXQamT8KjfWZc6r3/+O+4h+qB/6EULZas8Eozk
         Vj2bWndVBdw+r+BbiOkPoFaJSPTCVi3gk/hTyEttzWyfTcuBqAD5fcSr6fifyalXQL9P
         otow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106549; x=1795711349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dviFuqAIBQmCwTlGi/sNefyK6Za+SYcw7iPLWjwy1Ww=;
        b=1Najl12jX1vISbEh2jrrdf+y/z0bikJxW0apET52NotqlVoEXjTzHFX13NYDMn9Yk0
         291sDhAmZBpeBaeiQ0NCgUnDDBliy+CINDw5LgnBj56B8MXfFbMN9RUWNpGpvzIo2Fit
         jEmtDNyo41CXPGznf0v9ju/4BkptwcYmhoaAXeg0oEFTnX+J34O1mkoPHVrJycNOdYDf
         Yd2GHDjAw4O9B59+uvtk5XBBqeLXNRQDTEys76HgYFa8K6v470XoMqlpwECnWMPx4Jj6
         Zill7PcsGwwYFs4J2QRTNoEHF7bhLyv8TyRzRVbjxT3CDoB/y7kTtd+/BUd85rxaLzrT
         Y/rQ==
X-Forwarded-Encrypted: i=1; AL+hErGwnZ0uM1VkFrTIYKWlF1GFj7zPgZk47iRv5PR13RsYUaYEOow4SZAsfzgrtJmP1bjgrM1QWT3uLtc=@lists.infradead.org
X-Gm-Message-State: APuU4Z/O2RlXqcbxg2tyDAljpHGgsdNsdhigYmMvUscOdUsaTxUP/5Ec
	YzmEY2loI+XhW9FKRz5yOnHNmxHTLK41EJjqLmzR/YEq7TSMQyQtdJtq
X-Gm-Gg: AYBFou2YUylUxE1edCNQY2CIz4kMh6GNSvcZI6Pr1wyEz31eBbN72DhhwQoZmjwIAgn
	kOBtKmBbsRjY1xLlXF4MWbI6i7TE4gLDQis4dlJNw/1lBLrLrDhr6E/Py59J3e8bZOz9CYnnZla
	jb61Txp80jrU+0ipgMWg2/aRvRw5qfSLSScpB6CO26lb5wuNbZXxVs4yItU4kT4kXW2+PeqWOQY
	8RbPWw3mkSxYmX+/xFjdr21K5mcxW+pke/6vQPDqdhiP1AfNw/qJRKv6LoKoqMfl1msBU22JLZI
	emigRyi69Bqfv6ajW7tcyz85Ut6N9lzuE2t+26s/B9bvF9VHb6neM06PdLq4RgUjBwy0Vj4Nziq
	KXrpGud/n2L4W3Crtg86Ey6LOKx3QoCnwN5aYWo2N3Fcr/lsMZXp4sTkeyeiyHZwcneclCNEPNA
	uQaRqZ7ARQf3F+iPiJn+LQDXLT5t+Ps9Yjo2k/DPO5p0HEDlWCSDelZ8V3edCFgZzkIskU+byWl
	7GnkX0fVRaOquA5BGDGro7exP3oSqS/fkV4GagO3oXkuj0AsRXMymgobspE1arYpoxIWtC+zoEa
	E5uvQ6Gt207aEL9UmWMIVpmNwZWCUoVsPKmjv+5WjV99p1Ywb4annxohQ3Ir9QD7zziplL2Q/HH
	sncBLmG5bRnl3lLfPD4EGhXa+4v7bEl0gY/FP0BBxGomn+SfjjtmQ3J3TiwQ/57C67Ed3I2jyL4
	lGbeJ81tLKA+ykPchLSxp1CY5s80pHVg9niBBXLgvIyRokem97nyM=
X-Received: by 2002:a05:6820:8584:20b0:71b:123b:9ab1 with SMTP id 006d021491bc7-71b395e7441mr53911eaf.78.1795106549466;
        Thu, 19 Nov 2026 08:42:29 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm341975eaf.13.2026.11.19.08.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:42:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:41:59 -0700
Subject: [PATCH v2 01/11] nvmem: retain the provider node until device
 release
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261119-submit-nvmem-provider-lifetime-v1-v2-1-8fca3ec5f18c@gmail.com>
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
X-CRM114-CacheID: sfid-20261119_084230_732055_5391D906 
X-CRM114-Status: GOOD (  11.77  )
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

An NVMEM device can outlive its provider after unregister. Take a
reference to the configured OF node, or reuse the provider device's node
when none is specified. Drop the reference in the device release path
so the node remains valid for the lifetime of the NVMEM device.

Fixes: 1333a6779501 ("nvmem: core: allow specifying of_node")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 7d4cce8e2742..03ea878874e4 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -570,6 +570,7 @@ static void nvmem_release(struct device *dev)
 	gpiod_put(nvmem->wp_gpio);
 	nvmem_device_remove_all_cells(nvmem);
 	ida_free(&nvmem_ida, nvmem->id);
+	of_node_put(nvmem->dev.of_node);
 	cleanup_srcu_struct(&nvmem->srcu);
 	kfree(nvmem);
 }
@@ -973,9 +974,9 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	nvmem->keepout = config->keepout;
 	nvmem->nkeepout = config->nkeepout;
 	if (config->of_node)
-		nvmem->dev.of_node = config->of_node;
+		nvmem->dev.of_node = of_node_get(config->of_node);
 	else
-		nvmem->dev.of_node = config->dev->of_node;
+		device_set_of_node_from_dev(&nvmem->dev, config->dev);
 
 	switch (config->id) {
 	case NVMEM_DEVID_NONE:

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
