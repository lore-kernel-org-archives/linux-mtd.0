Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655EE60A381B
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 16:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ztNQbZdU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NT05HYE9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KM8jObzEHNHguz+bCmoQK/eXG8CSN+dYD6wOn+wv10A=; b=ztNQbZdU4Ij+JHjOSsGhE1og02
	KIUjEZLmO4pJujvYjcx9IolfretqRdV7owrwOIKiNHbhzj+F+Mu1Fp3PJQ50qnAvYHsC8KS0bvg6q
	mUZKQ322tOqF6MWGGwiucVqMOwQrKg4WpSZDRKVk9PACCBvLWd/zdtwYonbaNUpFvwLgaWg7Cleq/
	Xp1WHsaUn/z6v+E8pXIyXunHJxv3L7NITg/0ARiQr5MhneRRoLiFvk57EpEsCmZi7nvpw0IrBRsN/
	ba6opjlyTa1urLlvEOMINkGHq/OjHSfjhQXVlkopsrfF3lkAgepENbBVWR1d5jw/yE3z7QEZLIlnA
	NMU6Y17w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5DZ-0000000Cgsp-09Cf;
	Thu, 19 Nov 2026 16:42:37 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5DV-0000000Cgpo-48BV
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 16:42:35 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-6d68de53053so1747569eaf.0
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 08:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106553; x=1795711353; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqKDzxR8/MwRhYGlZRDRfU3U5l4BYLDKFh60zfjgpbE=;
        b=NT05HYE9Hcb5A7RdYgwpDj2p9Z1kX9WfSdLqHnYum6nwfWm2EBzMzddrzpu5SmhQ+b
         josbNl6NRhxJ+F9FVLEcjkDd7xu+vDYl5Nnti+H8A9/0eQFil58xLsLiL8asCkFg1fwS
         xfpB8EO6q82iEn/w2FsyFjEA0Zf/6iWukhcRG0k+Ij22dP0FgUe4jPo1UPf25GMsO5QS
         npHy9l6u6mqKlqbuGGppvvbhz1C5aYahs1ZL3Q9WZAnO55KnTZSxABY36X5zgIeSoxMt
         naQ7C4aQWhgVVI/onFtyneUSyUBd872Nx7JQy0yuUH85oeGgJ2hH02ZJt7A8vt/6mNVz
         FZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106553; x=1795711353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GqKDzxR8/MwRhYGlZRDRfU3U5l4BYLDKFh60zfjgpbE=;
        b=uUfhFiygvGk8cg1OIVHG8VUP21siqHH/4RuGpIQEAobi0422PGxgJ8lygfebuvbxSD
         PfU2SEbGNghXlhCHrXCQ7afim0tBNR7/DTCJ4YXtG6TW1oHb8kJpTaUB8M+Ppv1L4oRD
         cFYQxJ0AWN7DrO+sgvxyYcpE7Dzhr9ToQgV7LUFy3BOBA0DMUYyfBJTWX2Z8wK3K8ag4
         zi3kxscI8tsEt3lWfqcwtO+wOCvjgcLNx3VG7AEv9CqNLlPpiifiBya6q3e5HNuxZYhj
         CvIos8TmkW82N8EQKD2swWZBp9QKJrS/Box3zofqkUSX/ijXobaxVUFvzHl2Hky1D8Ay
         loow==
X-Forwarded-Encrypted: i=1; AL+hErGnKATYKco9GF+BaXAmFmtvi9RFYQchsxItH0VS/MaO1VPVbqDg+pot9d+NBXlF1/lywb6/B0RnoXU=@lists.infradead.org
X-Gm-Message-State: APuU4Z9CnMaOMU5wFNYNjmUkq3E+1cxxc7b/mbNtguKYXNguyhtaFbRE
	ATEw/zj5+/lgO64m4JDy2n1agfsY4Bndvvjy8m+oOyOyLWgmue5jr6eQ
X-Gm-Gg: AYBFou2GZM4IYbUqc3N6B0HveNurqXnSje6KCi2UspWUe1VulUSR2qBrrG7lwn1uGQn
	yiVXaoV6w2xVo0EWKrTivggiJ8/0isimUEzPUgHAgIxs38UyIEuC81vo6XeMUBAme3XPjtOKq7M
	Ba+H5+E0p9h2bDEO2r28IoVHCRBmDAXUn2MHyJYg+6rf/y4BC/VmL1pc4mSAMZaSrfqZDKweDxS
	BmN1elAxp1hxi9yHx+vpwkTtAZGEFN4BPUy02jXmV/6Pax9jpJ/kGTOlyQFzfyYtqAc52gFk84k
	2c3GYpJwfaq6frt7LdgEPUr1zu+XmSIlJ6BItdOlJl2n0kSa/6Dn3GS7n0FbEumxr/PMoQkEoGg
	Pm1ynyXnFxOXB5w+THmjuyAyqQEdxO8uNpUVe9twbwEeyqq2CtUgm3nLTHLf8MbbYpgoTvjeZBo
	Bd0IO1J4dMjZwspMwdWUu3yQ6OtzqYGN3zMnhUWfUAG3tX5EczYW88I/Tw9e2KB/ed3qnDpkGbb
	mP/O7DUAUMS9SlSwKIHsI7Qao4GL+a7XLBASRYaOUFPKsBWsB9HMxIGM6stOPkriN45VJdSTbtX
	Va6Nu2nb9pmgDfBFipqGxz3ZN46v3/mQL53Xkeih8Z9b5v95ucvNOXWrIK3ymDVpzK7w6W0q0L9
	oqVMlM4tifIRFKZgKU1MF4nEZShOKYGcdy9ZUu5VyVGjZALP+AUunMjUZVrJMVL8yMzzBHeR3DA
	pISfxecUFrGgb+9KZk9szk6AgrSds0abxZi6hd7nk4WRcKhTmZXdw=
X-Received: by 2002:a05:6820:1344:b0:71a:e091:7368 with SMTP id 006d021491bc7-71b3920f35fmr156695eaf.3.1795106552830;
        Thu, 19 Nov 2026 08:42:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm341975eaf.13.2026.11.19.08.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:42:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:42:02 -0700
Subject: [PATCH v2 04/11] nvmem: release write protection when the provider
 disconnects
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261119-submit-nvmem-provider-lifetime-v1-v2-4-8fca3ec5f18c@gmail.com>
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
X-CRM114-CacheID: sfid-20261119_084234_053732_ACCC2CA2 
X-CRM114-Status: GOOD (  11.93  )
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

Retained NVMEM consumers keep the device allocation alive after unregister.
Keeping the write-protect GPIO until final device release prevents a
replacement provider from requesting the same GPIO.

Release it after draining provider callbacks, when no write can still
use it. Do this for registration failures as well as unregister.

Fixes: 2a127da461a9 ("nvmem: add support for the write-protect pin")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 7d75076cda49..8c9dfd2e2a63 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -564,7 +564,6 @@ static void nvmem_release(struct device *dev)
 {
 	struct nvmem_device *nvmem = to_nvmem_device(dev);
 
-	gpiod_put(nvmem->wp_gpio);
 	nvmem_device_remove_all_cells(nvmem);
 	ida_free(&nvmem_ida, nvmem->id);
 	of_node_put(nvmem->dev.of_node);
@@ -912,6 +911,8 @@ static void nvmem_disconnect(struct nvmem_device *nvmem)
 		ops = rcu_replace_pointer(nvmem->ops, NULL,
 					 lockdep_is_held(&nvmem_mutex));
 	synchronize_srcu(&nvmem->srcu);
+	gpiod_put(nvmem->wp_gpio);
+	nvmem->wp_gpio = NULL;
 	kfree(ops);
 }
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
