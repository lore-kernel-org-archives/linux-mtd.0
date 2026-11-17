Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB990606A8AF
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 19:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gh7pVcf4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DURZB767
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=e5CF8h+AyAZEQD63AYlnAUFBNYeKDCs78xWH/6QeOp4=; b=Gh7pVcf4dM/gOhOGN8Wr8Qzmwu
	MJoz6p/wO+TUKDcVILZlD54mXNRy3J8RQmDDeQ0FkT16LIOER4J5Fiu6J2P24ekLQrFIb6CRAfOm1
	cpHtv265UfEPkNrWF0E5k33ouItCb+HDWVhPbeg60JA3iA9qO/wPwLLZfnujyiXgOOgInoqeoQWOj
	JwSALmNM65noKt/WH7U8f3Bf1qAAksVFvUVnqgOvYm2XWEf31gTrWxsz6xCoLEEsyoWDcOuH0JujI
	XRnUfbflvWjDmjTpLBN5+oYqZnjFEyJCFN7/gqHkN/ENjp4DVs39SqziknuZll4iPUPino33Sz46c
	MOkpcamw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP0m-00000006vIK-2RDv;
	Tue, 17 Nov 2026 19:38:36 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP0k-00000006vFk-1fRf
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 19:38:35 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-703be215729so110672eaf.1
        for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 11:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944313; x=1795549113; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9DIN0rAQkEW8U5nsqT7XDQZL+K6j1354oAyZ/5xfRqw=;
        b=DURZB7677miW8E+/YvKm9FP+gH5q+rz1OfvJr9aJte1jlms0jpSGlfWpLHMDwZULOO
         PfcOFBQb9p5CmSCGFCfE7WUI+/p8E4g6pLk//prtXElunHz6qk/DmQqhtKbx5bfuxw7n
         VgTrm1eaXQHGfCqM3mvjM1Kzfh0qlxnwb3d0RtfNd7trNmBm6eOxA7MBlVhJF8MTc2vR
         N6haL1cCdUJPeBxoib1+Xo/P6ubwB310hTJGhbo72DMtEUl3bYPg6A5H84yX7n0ph/Ek
         sucyvKcHNPG6tpXMXoU4CpsYWA62pLWGO3fnKtERg6Hdbe9E6C4q8eL8AxEMyHC4lrLq
         J0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944313; x=1795549113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9DIN0rAQkEW8U5nsqT7XDQZL+K6j1354oAyZ/5xfRqw=;
        b=HGuSIlPGdwKhz+hnf1k9v6Z2DHjCpOpK4HtW+HdQB4W2qbxRrmTabmvQxCPpwiyVPA
         0Y/iD7Zegf93GDDNb9T0JQW3ujbptOL33vFC+1H5BwxIUqyUj+SD8Al4+p26HDMldmiP
         FGkbuwv0rOpscfh/4Itt4jyxqSUD42KhIngyp5kBb6+prvAT4SlbELJseSsXKdJzeFCG
         EMV8IVndShRU4yQHZBpXwisfRw2yUZOfJclJGZPHSyNZtiEYaNfHrPGu7/eZzSR+FISt
         YT/ByumQ0a9qWl/kux9eSSZHBkqwrp+Gh+gLRwSckEyXiH3zolj1+WaOY8AKhVzX/ur5
         wOWw==
X-Forwarded-Encrypted: i=1; AL+hErF1B00GcVzhGiA3p1/5B3g2a+3RlTeOmDFtxWvF9H+UfLrZdRI9OBQfTkKJPKuOD1cySgLyhzlaIxE=@lists.infradead.org
X-Gm-Message-State: APuU4Z9y2MjqRD7MLksbtyTXi9A4ODSUdHxSUcE2k9x/kyLP0qkylpoz
	YdAHJzSnDIJh8MTDb4bfOylImhhh2rxQXSIbG5xBuOYyh6oQ+h3alZp0
X-Gm-Gg: AYBFou1QJjciTmEpejw4BBDuDXaFMMIUe04CiY4ZyZeuNnME0GvXaCT5I+QZOSP7jFm
	E1MPGjY/37KicFxxETyUQv+RxujyiXLdg7bamHEeChJtZBIW0iEZOsdtPoYx4XvJ4syvuM5+RcJ
	/lgHs1bBLMJ7ukNdrwmR0Vhw7OeP0qSwEEmtI093rQ70uZJg4XHO7nEGcgAoMpSP45v8WJWwvgd
	jkKgiGSlGS7bBmdiZsB3Yv51QLhqvAX5gQlVKTUpYOdOPaBvRB/5Iv/cCLUnM+PMnKCCRF6r2iv
	1IxnLbnu+/Zrg2lTljJD0tZ3/ErdIBKyPKenQf6NwmZsEchVnYClwhmQrnpsM99OYLH/8ZZr3zK
	v/+Oo5OjPgipO/vpgph5Xx2A+HxoAFpsuTcTDXxMnZ0fr8aHXDHy0Fu1Kue3ICKyorIsuu9EQ5d
	j+PguJx5sD9CcgNiOZK1OzgneDcIu0plP7tLhKbWZqaYk9J36Jvx07/6AeUt5cSj3C5DwNfhopA
	5tRR0CcPnTWXhxcEjOmDQdncgcw5uUBNGJAOzUQf0eHW3FHsdptYpT46m8jjVhnhbZzl5l1eECw
	8l+LJ2ACvbsWCVHDxPT8TLkJf2SYfhabkJv+Q997Bz534EcJSgiqykGFJS7QBKU3Wzrw9+itWCB
	dpqGmdBXe1Qsb3PhWR60y6lR0ItQv+QxPor6IQs0QxDm87d0044P5WNWeBr4SVyjsIGCdH//Lnb
	e8IGvgvLnT8gSvFESWSHL4m1iDaQo2/oXb2n1Taf+ZMpvKOmkTbwU=
X-Received: by 2002:a05:6820:1c99:b0:713:ddf9:4502 with SMTP id 006d021491bc7-71b1846d7camr283052eaf.20.1794944313266;
        Tue, 17 Nov 2026 11:38:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm146281eaf.2.2026.11.17.11.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 12:38:11 -0700
Subject: [PATCH 04/11] nvmem: release write protection when the provider
 disconnects
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-submit-nvmem-provider-lifetime-v1-v1-4-3cfbd48812b5@gmail.com>
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
X-CRM114-CacheID: sfid-20261117_113834_483826_A04D12B0 
X-CRM114-Status: GOOD (  11.69  )
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
index c41266241f3f..65d89498edeb 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -584,7 +584,6 @@ static void nvmem_release(struct device *dev)
 {
 	struct nvmem_device *nvmem = to_nvmem_device(dev);
 
-	gpiod_put(nvmem->wp_gpio);
 	nvmem_device_remove_all_cells(nvmem);
 	ida_free(&nvmem_ida, nvmem->id);
 	of_node_put(nvmem->dev.of_node);
@@ -922,6 +921,8 @@ static void nvmem_disconnect(struct nvmem_device *nvmem)
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
