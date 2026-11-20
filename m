Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DEC60A5BC6
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 20:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TFmYBZWj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SncQOTjt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vGxXo6+eX+Syvd6GjH3rWZdNoWaI2gHabTbLOQha4hk=; b=TFmYBZWjn6/JDwla5KZBP+6Sky
	g6NJopvByZvGBiP0kC4CWGXq/YowjWTVR4c6sBLt8LwO/ltERGSu9Kg5As/RsRz1FMSzw03RE5Pcf
	kpcQ7xoqHCc1bsfsZNrDDIqcGyXArQbR2hr1YSXpkAXjwkzJZnZ3MLFHiC9q0Ub4TyTvnpUjf4zKL
	BaAxYxlFheNl7wg4IHJVPmb2fxEmcwigg7JfSTLMoJIpkz7A5xcavAF7Tt3YeKf9iifUPcZcww9BB
	pP1eRDd8Uu2PcmKYUZGvMvgvPnwSbKGWrc53dvlUyB4u8AgYJ0YSMcOKXWOJvExDLP4s2i5bdcJH/
	CbmzVHSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUuh-0000000GBv9-0JmP;
	Fri, 20 Nov 2026 20:08:51 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUuY-0000000GBrY-3Kuw
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 20:08:47 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-86298f9267fso773753a34.0
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 12:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205321; x=1795810121; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klt7sNsMkqxOJjCgtn7qempQcIN6jFeER978qp5DFdg=;
        b=SncQOTjtHRw7Uev7zAUTeKM7bTorBtE/d18gsh85pJqCS7ZNVmGKoZf0owvrdBOyOu
         MvKqgpd7lr9VY3Tq7exoUd8ziSfxcQ2MdKOiQv+hb4qkVF994UXbgXMtgxLoMePHlE4t
         GwZHJVk/R3ooo0mR0m0LQ9pUB11QqpJ2SiCj3MmsmBiuVxgT3L4sIA96w15iAOu6VIWE
         2rlbGNHTAEGVBbLDnuy41M1N7m2eyDz3Mdpvll9/GmFgszYR+DzrK4FXCL9uadnPnhEh
         HM2v8KX91YoBRfm5Nmx90JqSFyQCn8N1TZphW3WpAf6r/qUlrQleg/iO8qMgCVd4BAQj
         BP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205321; x=1795810121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=klt7sNsMkqxOJjCgtn7qempQcIN6jFeER978qp5DFdg=;
        b=vznVHDBUsqm+jjvbX/iBh5xfjJnlLJKFuCRcXi0c6CQMAVPkBKz7BlqjBTOt2yY2cQ
         +945T4eDUoCYMirFNE+IBx3agzD8g3DyURdcUdvfWSCd0O0J9CmerlqJ0OIwc5J6giZH
         W8tkooTh8COHw6xsRCRs6MTapl827M9Yqfs1PW1MmLhFJuK6gyq3kAjxYx4ibt3hf9Me
         6swWyApArogBuSIJ/QP1iE16u89AIEE+hH2uzARBOdx3/m45UcXfgyXJAnP0QP0+ZKKK
         UR0iPrsjhVorMqkPZWmBfvv+qSA95aIA+bjsFxpN7I884GWb60zNmOFmi8VjGbD2338Y
         prgw==
X-Forwarded-Encrypted: i=1; AL+hErHjXVXzJvNE7j91JFZod1UNe6oJCUaCS4j+vb0YwPbpfuPmUmuEOxv9Na9GSSQ/yxN8r0NPgmBwWQI=@lists.infradead.org
X-Gm-Message-State: APuU4Z+GK1c+HRyvHOgFEnHqeTYi1wphy0MlhcawAbQMWTFfU/CrXio6
	64b3Nxci+0lj3R887rsaq5xvIJ0onqfAftBHEPEX6nXzdKrtQvEEd8Et
X-Gm-Gg: AYBFou1Z3KAG2+c6Lr7Ur1Ep5iRvmZyLPiq6hlON6TFBAbSm275IJSiTP2Eb9IXWJUS
	qf+1TAnWjwUV706EB/IMO8w5ikYaS36oSOZM7QwtzedgunVQ25GJ0lbrhY9M0XSYTR3M9H9KKvy
	2APBCgwhwLxXY09jWj2jJRasgx72CPm2jNgmn3zHNxibxMOdxl21a/xgLSgQ/OEGL3ux9MKZaoX
	DTf8meKH6oThKQEfkCYEWtPhCVIzrucKDig8hvjz4W4+pal58uP84hrRP39hfQkub7ghDL2v626
	lyBQe1dOlTlEB12qW2s4KC0GYYIUZq9+RFhMq697PHrDjF1/r3NsGiO4bTv9v7LRfrE9a3mQtyX
	MtzsKYwlt8xU5ya5atfevXY+xI1MnS9BFr5gbJ/uo37i+jXy4VJlEpS4Yu2BjlD1/OrO7h8JlUa
	v90Cqo2fHZncD88C709KzlBP2OsrOVQqP0CU/h4TJ+F+Mijwykf1VCVL3BX/zrZMeZGhKRWzh+f
	y5KwPOG6o2F51duWPjF7eXEOaP74RHJFOS5mlQTdJCT+IlCnKb9VbrZfLadVmc/z3fDA0dGuOP7
	oes4FbnIBVZaWH87qV6n88IJl4Au2699bXy2h9olAWzi+DJparqmmO1jm1HnCr7X3sWyzzT5+fV
	6EB85OUxRd+PtV8QXQu5dW3Bg92PcEs7XKHfG8VDa8zXTu+PBa1RQFgDeGiH10Xma1v79DacLpI
	0aV/7yfH5TujDR4h/x3dbW65vd8i9X80M4wl8ukZ8S1AMeaeGsafgW
X-Received: by 2002:a05:6830:4c18:b0:80c:d30f:97d with SMTP id 46e09a7af769-86315a29b8emr5070511a34.30.1795205321627;
        Fri, 20 Nov 2026 12:08:41 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316822ad4sm2746249a34.3.2026.11.20.12.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:08:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 13:08:34 -0700
Subject: [PATCH v3 04/11] nvmem: release write protection when the provider
 disconnects
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-nvmem-provider-lifetime-v1-v3-4-523610652402@gmail.com>
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
X-CRM114-CacheID: sfid-20261120_120842_927698_2FF99B24 
X-CRM114-Status: GOOD (  10.53  )
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

Fixes: 6a7b4134fb7a ("nvmem: protect nvmem_device::ops with SRCU")
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
