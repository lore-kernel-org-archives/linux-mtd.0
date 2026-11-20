Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6840606A6DB
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 20:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=roqwMCCY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lzWGvXmd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DPUIxl77yzu+tuKTn9wTgrV296qYprwZ8UljmZf5qeQ=; b=roqwMCCYeTeQqzqDQ5pkGbSh/J
	QONWn8js/wiHYdNaR4uo3Kr+pp3rYVRIjXi/9Iirhw642bX0/T9t845FK26Qa8DCasnoqo3Ad7uaN
	5Tko33aj+9d92sEgdAfETe9LJic0AUmEbJkUKRDgeJ2EfX1c5xZ6X+OQq6QJhaU6Q0Axtpik/wTuJ
	a6eN8tVubomzEp0l0aYszaZKa8SBgI+/T6aKUoJpj0XS2/bzr5HMz1OEdf4p9m6lEfIj6Nf0WsMT3
	q9enccgtoJpJCL6ECv4SFIhoYkiA8UPlUgAQFw4/cJO2T3hQ8cigD/kOmEmJhRrhB/sN+4LXaoDMg
	9t4LkL6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUup-0000000GC32-1LZ5;
	Fri, 20 Nov 2026 20:08:59 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUuf-0000000GBuO-2Z3d
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 20:08:54 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-862b090e3c3so738362a34.2
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 12:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205329; x=1795810129; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4c2tomY78ENRH0Ja91CkTFAAwqmDM/gzLGOxCRtSTus=;
        b=lzWGvXmdUz5Vpxll/fC80yMsmGluL+fSijGAR9VZ4z7XrjfBIRolkfJaiDSyi9qSgx
         R7soeRutuFGF6JVlrTCxzSJ2K1FhiwxfO5iUiXiBXVQDOMggJXWKH8uDB1OVKOrxmwpn
         cCUfmJwQ/cdCBiHZ3k7p/t49M1IpoGnH52oTZ5tA7tu6BUlZ+llG25MFclol6EvizkmP
         UQIuhnHSBAq+V4WtgCj/YfhQl0v8cJ5buLcMSY9uQYAkf7gY/qsiLybrvDOLIywKLW80
         0WYm4nqlx7BdDz1oaBZrFrRJwy26CtSLFydc0aIBjXPzPxvukhfxAgZixTaznzw7kOjq
         NFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205329; x=1795810129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4c2tomY78ENRH0Ja91CkTFAAwqmDM/gzLGOxCRtSTus=;
        b=KUJJQ0B1xYlcLOzCDcvc+v0FDTFFUhyetkyYZGyO3Hw3ockxjIeQ87mGcyBU/WVv17
         BzEE4/06JJMPQ4JScsw/PfvF/mYseWmbBjltvgYz2DDEQID/fjkf7dAVjwp3q7ELNf/S
         OBSTqXYg5Pz0l2Kq9oP+6vQ5WvMyzWHeJzvYctpGbNIDYfdD6fyJBazrQBKQtLPn3Fxg
         zGakVKWGmoyIXI3eWUVmxgptJsk7SSNwhSx5rg8OwAppdrPKBRREuGpdZQ/7YdQCb4qU
         f/MZ+YS6oEeorgJRZsdBKkWDn5lx20noBgJnmYo1BmmEqwIV+iEzi/fqcbTMAuwT8zAm
         9W0g==
X-Forwarded-Encrypted: i=1; AL+hErEaGZx/TYBHq9Vja/k1Hz0EOiNHgw9GIaykH/UHMJJ1hES+I9/Vbu85/3Whqf0y2ym8h03Jor9W5AY=@lists.infradead.org
X-Gm-Message-State: APuU4Z9EICFp3YwW4SfLbAwIgCAkQv1Q9donkhtpgniO/I8/QZbjvmbu
	Fa9Gw21tEfet6r7F0zKU3u1BgvNDQ08RFWF8WWuPormVwgAVgnPsKJAI
X-Gm-Gg: AYBFou2DLqCNpzqI5QVDit0y5rGZ9H/B/l6uo5AeajZBwt0DSg0R7p79V4xV5TVkpbE
	0iCZ74TXyJiGcNCUlotOjyk+50xGTxyJiGZ6aoyp8/N9jdJnyCevyo3Snrl7GWvX5Edl3aeIkih
	IA0zs1i4D54tkv2Kw0JawpVIMvSiXXnSvR6EHXaqCnO+NRrJ8bKpP9FN1hu1IwFLJQENFSGRMEJ
	St5R/rECgveKdixnTZO3rFIF05JK9Gvh9TAFKQhFcHfL9mFksvijM1U++N48TP3kq5RsPYUyA58
	NWyujbGhFD8UvVWvLd3EWeLF4aH3UK/ewee7w1LSMiLc3IgJqfw2XlPKz/P6qrVJC0mJbDnfnBO
	MYlPcJZU6I2qEoM0GHHDy3VMGbozgLWulX5GDGeH23BhxsiFbMEkaOYPGEv24PskbVmld6gVWlY
	aG3gZ53hekVLKCiMmFGyR6lpsYGKsR4lcs1F1fA+aIcT/JFlZtLr2z+hLP7lYMzuIdcPQ6/ljTD
	4zlJLui66wC4uwm1FtS/lpXiXxFDwGmDkvMBOc3BOW6q8wLhtnGjtsBIdTOU8NX1DxwQtvyma+3
	yoLFMZrz3OMGIRuZAuoFbHE2CTmo8cU2Y1wFl3tCQ7+klvOvBYKKTMShlYqTayFtPcOPpIOm1eR
	hnCkSHdGuKP6ICgHjRoGs7RyDC3SWUy72n5SgEroTcDw/Qb9qIOIECF3rJDnYy9KVl3HcfZi8mO
	jdGEvcUccvS+SPLD3QNnlVT1ZQhas+mbES9uvceXc0+T7pueCMdM0R
X-Received: by 2002:a05:6830:719f:b0:862:c6cb:2df2 with SMTP id 46e09a7af769-8631593a225mr4802462a34.5.1795205328580;
        Fri, 20 Nov 2026 12:08:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316822ad4sm2746249a34.3.2026.11.20.12.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:08:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 13:08:41 -0700
Subject: [PATCH v3 11/11] nvmem: allow providers to specify an explicit
 NULL owner
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-nvmem-provider-lifetime-v1-v3-11-523610652402@gmail.com>
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
X-CRM114-CacheID: sfid-20261120_120850_211507_8A10FEB4 
X-CRM114-Status: GOOD (  12.90  )
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
