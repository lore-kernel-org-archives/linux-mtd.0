Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05A6606A885
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 19:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RNfrZzxy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qPkraLmQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QmXKATYDvw3nI5rmkjUECg64b/7dqNv4MBcwqxy32P4=; b=RNfrZzxyrDwKdkjit7eK79E6lA
	ofPcCcv7qbmHEi+35pVQSV0jGqiXDZd1M8J0bt58N715t3Sen5DrtJpYobhMGZLdIYPc26muriDX4
	IYFHirNOo0hvtPBlnvqoD3W5ngwQACcvpCL1ePRQ2wmGAHFR5z9bLPD4xBzj8NQWx5ylJzLLqZ/I4
	Bu8xvJLmeajlqP82hnk46Ldr7XgD3OpWH6SRoCGjfuDqU6XUPaBq6HT2vQmnX3I9fzqzZNVAfRy1p
	fdcexXRZbokebEGeTa4pj0zE8vnl6e9BjaGRszzN0o5lOLf8ihzzGpU6c9/C8Nnq2EzoXsTX9MUi3
	6xRZUNgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP0h-00000006vEd-0b4w;
	Tue, 17 Nov 2026 19:38:31 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP0d-00000006vDF-21cu
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 19:38:28 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-71ad099391dso117110eaf.3
        for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 11:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944306; x=1795549106; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mzUXuDR8OHK81TyfGQx/IwpVMtB3XzAxHCLnFDfTBRk=;
        b=qPkraLmQjUALZDxqLkuBW6XcmfaVnBnshFJuh/5Yolc3KMbJYUcPottlVABHxUxwr7
         hYtLmDHwhweLwREgMtEX/ZVRePpfMyEOSXzYtfTnRm0+WoJB2moph657LWMlW+pqzaUf
         WZWuMTKA/YDWl+xWsDX0dvcSfnK2YZP1heby5pGdT6l0G1AbvDN5x/7o+X9UXHPfsvR7
         lS5dq/lz8xudn88A8clVi5+G1TcmvzqoNMdFeUnkaArO+4DJ7SFfp0lStspLn3xmUJ7a
         Gs9QD/bJODoY4Hw8j7TkhnHJCMkGk6jYjBMG16/qFcgQ//CNyC2UmGGUNnc83biyIyaU
         tlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944306; x=1795549106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mzUXuDR8OHK81TyfGQx/IwpVMtB3XzAxHCLnFDfTBRk=;
        b=1DzQCQWBxzxPZGLDDD4JKi6WaUqaG0AIYCH9whqtqyrQR+C5q2WhrY9s/uOEI0oOKX
         mm0lISanU9NJwJICDEIWBtQTvc2Tzhg4cklVBAiMBtFu9vwt24RfvFKzktHxntrXkH80
         CX5CbvHxU2OWs88KEjb1bNr/py2SrEjWvbWWbB7mntdjbfBI8LHk/JIY4tvU1Uhv62NU
         x9BQrYY+A+pB7kwIr+JqDdCbK3lIWgyZNCYy3eHNUKQvRgQl0oVa0PyLN9hqQcz8Fa+Z
         ZJBdCct1d/RMZIYroytisz8G0GU2849cfelqJ2vUlzZJvRMyVhj2NvJh7y5hHuFJonCD
         Ro4w==
X-Forwarded-Encrypted: i=1; AL+hErGcZ9l3Q//aSzfAio+ZtMnHculbOuzhLdB1moePdy1niJvta6q6hM9KmfRcJPjJZWwz/vBpLfcDCAE=@lists.infradead.org
X-Gm-Message-State: APuU4Z9HxIZQq0ATqNvNXM0u3DpPo5hz28/kyw9xjiavcdvgv4pbc438
	Zu53cM99YT/9IkBb9owW9k9yeT/+HaPEu5EI/4fi3U3FIbJbcUVG4xUo5MPluw==
X-Gm-Gg: AYBFou362+zh3Rzn5+gDfsITtGl4IeIKb3EoeijdQ+oUS8ldc/uAiVBBb+GlSaXXSYt
	zaTp2oe5xHHTYYeGXKLXePz+A+N7fVGkftlffdP1PjHmcCtsPWlAQ+hYse5O/bj2HguLQhNWBbz
	zaVXaKRCUG7stop2TQB1swLyPk6IEOBcTCjRfoGjTCy+jJGyrmpZivuI1y3tf8SVIsykNti2l8W
	/XZWVEvjjlGrsdTDKyyVgmYFAiYdjbB1IXBmRvVFO73OF+hRKZp/a/MspsSwN4f+5nk2FOgDlF+
	BfqhzF0UtnQYgyWNRV8iaFlkSh0jzGtnmeNk48CMsGQ2LMef8ecrsGhNXlUqLWAuIvcZcW98Q7W
	Rkh4YAcsjDym80ziWoNAk0QiBidS8YqBOU9JkrtzrJ4FBhu7n0ceoFQLCQbihR55lPCbeuaHtDq
	2nqLRyrfh2sl5ZuBKAYRtLOsuzmn0RVnoOA8gfNIyK+zw10XP2A2mZy8UH+Fb5DWh/o6Ar3a94H
	nvjYiYy9iYMv0B851z98PUYJVPtzFVbDIzFi6HWFN0pQrriPjBCUuDQzUUqBy1vpO7V7xZw13DU
	ng0kDMNpiSynVOFI3PnAYrLEb08rEe1SVMwnSBjT6p8MKYYKC4FwkZiyyUWvf3q+L7FVDMMeGZJ
	v/vDYkILgGuCmlRwMRJe+GTTU0uRBYpbeJKCEk39EguAreNTfhiJxYUrjPzuzAT2AFVRnfbA/dz
	fmqhMb/yyw5SnfHL3Esz5+ve1tSRIUk+Q8F2sapbQSsoPmz02nYqI=
X-Received: by 2002:a05:6820:55c4:20b0:71a:fcbf:2476 with SMTP id 006d021491bc7-71b18485668mr207605eaf.14.1794944306356;
        Tue, 17 Nov 2026 11:38:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm146281eaf.2.2026.11.17.11.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 12:38:08 -0700
Subject: [PATCH 01/11] nvmem: retain the provider node until device release
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-submit-nvmem-provider-lifetime-v1-v1-1-3cfbd48812b5@gmail.com>
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
X-CRM114-CacheID: sfid-20261117_113827_530106_66267518 
X-CRM114-Status: GOOD (  11.90  )
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

An NVMEM device can remain referenced after its provider unregisters.
Keep a reference to its OF node so retained devices do not depend on the
provider retaining the node. Drop that reference in the device release
callback, including registration-error paths.

Fixes: 1333a6779501 ("nvmem: core: allow specifying of_node")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 7d4cce8e2742..802637f375f8 100644
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
+		nvmem->dev.of_node = of_node_get(config->dev->of_node);
 
 	switch (config->id) {
 	case NVMEM_DEVID_NONE:

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
