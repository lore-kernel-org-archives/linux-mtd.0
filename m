Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCC460A381C
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 19:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FctGNKkp;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F7Q8MyCr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BoSWWbo3d2UO8fkvdODv9nhlXpUyuOIuy4ye6+B9sqg=; b=FctGNKkpXHJdHpteEPxlHcwDoP
	n2OT00R+5dqGg1iPFcAChVeF6p9cd3njQjicy50K3SlULUd5Iq4Uj7y9PKNT+DwV9b2boGBKPvuYR
	cfRrYS11d8nfyJZSpth0QWdiv4Z4tiGXH0GGscacWObnnB4cTw7vlsyuoh5JyyGHAqUmlWyWLMKZ8
	gJCInQvNRRkHUmVmBzxg5QRpUPFQIT0yk7rFNP0J13+66JW7hkjVuGx1k5+bpkOCsUZQ9g1rJj6Cv
	C+PrdKPbXz6KVTJ09CbbXXlQGaDZ7WHZ39gGTsxT4pUSazNngdpXr3xR1wf9Wxg+J549LKX/VrL71
	SwiLkVJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP1J-00000006vqY-1857;
	Tue, 17 Nov 2026 19:39:09 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP1G-00000006vnx-1jMH
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 19:39:07 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-6d290b10a35so95871eaf.2
        for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 11:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944345; x=1795549145; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Kp/vW2rYbu146OE4ja3gtScPJUsYh5ODUd1IOAYRU0=;
        b=F7Q8MyCr0rML/mIxD16nkVInRp9hZua2Vqd197WEYRwTSXQPJlsjBnZM/BCGJZiYX3
         ijsKliAuMWhDKbirN76oRkjMfUVIjlf2s3XtxcvHpdGZfE+YP/ztaE6qldGVMUscm8Wh
         PHlgHzxB4kOb8hqUG5wwoSu8W+CpUFFvs/yUnya0uC/JzS0/O2hShRwL1jqn9Z6jkSt2
         ji3s1tM166f0uD38X+3zITjwvASIQcoZTlXd0/T75mQUKBbNQ2Ky612paia6bZWK0p1T
         fCXmA/5y6YCqRtWKXbR2k0PtYVCRfyrePpIhFNkhok9Z2g+yKCXHrW+GliuK1GfUnGSn
         JSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944345; x=1795549145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Kp/vW2rYbu146OE4ja3gtScPJUsYh5ODUd1IOAYRU0=;
        b=GYFR4HOCH4uLWyP7oyh3lUY2iF69kEcnKRvkYn9zNGG3bQkDvPH3LmhqSAVk5dOB9y
         ROvqxjYOp5J+yjzs4jv3SKtssoYgPQN6ELdukT/3ZnFTaMZ3mx260astWnupLY2Y/+ML
         5TPYUg4dD6+ThGoAXjDLm5lWAkz9/WR5NbmL733L0IIk0j5auz5OUz+0kQY4fwUKGu+D
         V6IobYsL8LnlKTrQ9DBnd+tmV3dN5oN73FdDeh6jJ1DwYFSmqdblamOAPC10dCJfOO8P
         /tSwD+/MYRPPULzjvcwuwjjLkqu/CmnplHTiNbsfvR+kprUja//hv+q+40G1+Gp4mn35
         bi4w==
X-Forwarded-Encrypted: i=1; AL+hErEJg5SmOZ5Y5cxPeIQFYYmnMRep2u5zHVSUH8GRwaRj7omBFAlS4yDMkp5mYKi1lrNpFXcT2cNR54I=@lists.infradead.org
X-Gm-Message-State: APuU4Z9lFlofYMco4SEVL61dBQkSEVNQp8JY2WJHKLxrc24rS3LGi0Rw
	X/a/uxzIY+20gDaF/Hj61uMms7UEXuE+wZlkAGl6JjS/GTzNIADPJWXI
X-Gm-Gg: AYBFou27Pv0GgINxb9a6kUVPaERQaQ8soxQAPxhCq4kQOnYWulb+52jk4JoubaFRzIm
	PYQvDWfyc3OjiO7svohMhKmn0zSgKZNYqcIS5aG3H0w/kRVzRNcqC1fVGoUwDKv/Mbi70P84TpA
	ieJR62ZE2oUpIS1dlw/yOHFHUwvbxPI8YSDmaTHgNxNs7Wx4eVLrOlVZLXvvUOPhzj7d5eaVndG
	H221l4WpAZkpUqVgfqQ1bVclW86agYO8iCb1OHr/ia5j+ZmuJLo1/KK+WtjxzA0xyZTCcMQi9eh
	597qW7hxun9jCQPiK/fzltXlWYRoXkDKQiap63rJkdkF+SLR4f30dgK1EVcDEOHa7fUbdo2a4SG
	JNYg7Rs9XZcYedsPT47NzCIKuCZNhWfBj1GqWVl4vBhPXvUG0m2R7SgvuKboyrLQQkKd24pDwER
	bFAj+sfh6TSZqvrIFEBdVZ7aMi794A/YjPFa501cGGrIP7EzWpsFz/KJJHGJTZqTG9+69INNVBR
	5m/iTTVIRt5VdX41JMD4ZiyDMPqJ0a1od89k7uoB0UibXCr0HkyC9ava8RCAdJLhygjnTKbNfGN
	Kev44tZYzlCL/5VHzjx5dapi1IzlzBU/nL6tre6S8twaiqd2q+OsNPID4KKxvnQ7WwwUa5VWUFT
	RKeL6j5afv+OpEupeVMzPChVDjOdxCPG/GY24iwx2489rUv/WOzFqUiL5lXW8V2Wv4Y9B8eMiPo
	tjqqnn5wffoeFEvg/Seks8lXOJ4WWXnxOHCMbqDHGQzBDycPioKbY=
X-Received: by 2002:a05:6820:2387:b0:71a:f754:a236 with SMTP id 006d021491bc7-71b1865dca2mr216966eaf.83.1794944345608;
        Tue, 17 Nov 2026 11:39:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm146281eaf.2.2026.11.17.11.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:39:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 12:38:18 -0700
Subject: [PATCH 11/11] nvmem: allow providers to specify an explicit NULL
 owner
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-submit-nvmem-provider-lifetime-v1-v1-11-3cfbd48812b5@gmail.com>
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
X-CRM114-CacheID: sfid-20261117_113906_463357_5D35AD13 
X-CRM114-Status: GOOD (  13.59  )
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
---
 drivers/nvmem/core.c           | 2 +-
 include/linux/nvmem-provider.h | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 619d33a59697..ce2a35cb6670 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1132,7 +1132,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
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
