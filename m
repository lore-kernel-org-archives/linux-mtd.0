Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC48960A5BC1
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 20:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qzlW40u4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mICQpFAc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Mjjj9vkkkuBUbcDZPbMA5Ckmu0U0/Sdky2KDIGK30Rs=; b=qzlW40u4KkhiECVhrUzeP2ZMca
	P23OxnYP57IB+Z+lVaXa2cihrNXPNknwoZw1KMi/A5NrOONTEOgvqR173UshSltCkeFHRFkK5YEnP
	sYpS2tXFcaUnP0DA5jfJocFHHTszngMUbNwzCXzvfP4TUwq686J01rMXyt9NOiUzhtCUtfXHymVr8
	j7CnGOTZlhYQwrrLiKAdHh+PFZsYdAvqKMg0bzdm6q8Uom7pBl0GA3IQZodgBHLChUklUjy5EnRJQ
	7Tg7a8AZzaO5WE5xRU1dgrsVdp7bLRvI3Md5tEGGfN9a11x+La0sTk2k2qvhsEBAzmRl0NvQnZvXd
	upXz+zYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUud-0000000GBrq-2lyI;
	Fri, 20 Nov 2026 20:08:47 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUuV-0000000GBpz-177M
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 20:08:40 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-85a5455bd3cso791195a34.3
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 12:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205318; x=1795810118; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dviFuqAIBQmCwTlGi/sNefyK6Za+SYcw7iPLWjwy1Ww=;
        b=mICQpFAcvldGI3WP8j+g3VLW7LiJyYEWWUfT2z7hoJwG5iFM8z6aTK+MF6SS8QExQd
         T/QA8vcdbB0/oPKdMqidQ9qXMsaZZJC2MB2RhlKJLaFVAwXQmVNehYghPh+pIhbTwvRc
         TBJBbuwMvjY9cbgBEaZ4UxjAMOG8NgHPvof+MvLRrqiCy8YhLJO24hX91CnttfR6U/4S
         dn+jSAmdgdQzyYOjLCKoS/PdhQvs9C/O8INtg9NMLK5RUtOKqtoxWyb2N8JaFSmehnaf
         J6oZOfXEgb+mJ1T1RJ7Le9xanzEKIO0fb93ag6Hi8a9XTVyl14dgYqxppOwkh5/Y4RvV
         h3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205318; x=1795810118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dviFuqAIBQmCwTlGi/sNefyK6Za+SYcw7iPLWjwy1Ww=;
        b=aDayJIWKHpgtOCyMz5F9v4L5kg/Sg1aLbkU3MiMy7hLRvPWmoNP8epUiExchvg4B27
         a5ixceQtHcMNl0TvxzC8guUJ4inELWOq0MoQuyl9SmzlYeNFDrvKZGZRYi+fqJlJHQVu
         tG/FVEHV8CJYaOqgkxkaHR6LgA1uE9/zklRd12Sq7BemlxHF6fBlh65lXc1g/NLxteTX
         EIwsHujYL6iqFDc9/2apj86fMwbzb9L24MVBZ2H4LKMiqsiINUnm8yNE+l/JNJLvDHOY
         3SvWmYTTiiksZPN62NtWvUHMkgBsf9D3AMb5w5G5YFE7SvDOcypFtcuYzwCKXDY2FtK3
         0dEQ==
X-Forwarded-Encrypted: i=1; AL+hErFNA24N/e4x47c5cQ4C+lrnOW4ti2BuaDafv7YjA6kh1bbGALJ0Psa9jpmljRMacIqaxK7MbqTQIuk=@lists.infradead.org
X-Gm-Message-State: APuU4Z/6RurGH+GkquU96JvymsV/ExI41ciieLuZgB7IRGFyjkqx6oGK
	Gmid9pjPqISkosm6P3QZ5s83Obr//XuCVvGhhrFqHefp2Q/eOCE0d6UO
X-Gm-Gg: AYBFou2dyeiOLzMGTijFWJ113nUbVJvwbaalYF9SJiDn+dmRI9J3CLpGBvrh75G34/9
	H3v0udiQv/txoT/9aZQbok2onovcsl7YugpmY6xc68A16/tADb2qln2y3GaU7aw5Qaivn8URMuu
	fcnLClFZuVAfkHP51EhQYW6dpd2ozFgT9a5U4xYJgosKteth5PWoDHiIDqNWxHmOWyy+Th+HT+/
	Mc43lQfY23fJD36cusaEiHCqzW+fIhcmcLvIejRIWFCzJcd+qX7TzE7T2CspRflu9bBqgNLhprK
	1ljT75n2s26iQfGT8byy2lFQVCIwEmkZg3xyryM+vqketFZYXtsq7FZaX9TtGHqYruOuYRM31Kg
	DzHu2t9aDj7mBfsTI0fDKz6OetYKtnXtxVdE2T1oFIHZ1t2jqzCEoXma/8hErVhJ4fb6cpa4GDY
	uc+aThWIEy4em+9CVK8VyHhtBau92aZ5jRH1IXyVMPZ8AAsjwvqgfRKh5dk+0sS/RCQIXbcSPsu
	XaVWssF8JyOufVzwwQ9LOSIgy+7QxQt1qQbPM3R5oF5DWBewfzSfnOPBhbIWkEqHzfSzc77Stj2
	XiO/eSn3mioM2j/+7eqyyzp5cZ6in3qjlCR3dFaXmzUJby5HpFKzGFuba6Nyh0yqb+7zfbRIBsL
	lgihv8CWeikfe0bu/9i7+HVIxU/Uye+sq27RbQBNatnOPAEtI6dOjdBYBGXCGc1rpNZOdju3EC1
	Aqnwo1sSJlSSErTnEFd2xuqeZDkfAau7VueRpX2Rp3PBN+EaU9HKiu
X-Received: by 2002:a05:6830:3141:b0:862:c6cb:2e22 with SMTP id 46e09a7af769-8631537c5cdmr5735583a34.3.1795205318111;
        Fri, 20 Nov 2026 12:08:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316822ad4sm2746249a34.3.2026.11.20.12.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:08:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 13:08:31 -0700
Subject: [PATCH v3 01/11] nvmem: retain the provider node until device
 release
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-nvmem-provider-lifetime-v1-v3-1-523610652402@gmail.com>
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
X-CRM114-CacheID: sfid-20261120_120839_362141_2D03EF80 
X-CRM114-Status: GOOD (  10.97  )
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
