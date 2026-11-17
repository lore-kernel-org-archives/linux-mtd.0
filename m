Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F086C606A886
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 19:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0YFD5HVs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pirwCURN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xDl2nM979ULlvn7ZcMNFYi022Ur+hQz+s2RsIAekOJQ=; b=0YFD5HVsOQR8tpJAoOllx+wvft
	wtQVNwbB+tywOjwsq7odWx818BrwLKOQw+VjoiHlMVLq0crYA7GtiQT88bE2xnSdTvgliWPUzEfU9
	c3b45D7M/PGBPqgCb442QMd1GtZswCJ0tcyEiZaqAA4JV+D+pjrt0/D7jt1N/g7wfXuXHD+LQsw3N
	jNt48gWEGiUSYrWVyqiuvM9kkAsEOWiIG3NfSrs/J2pdioIeERwk10xJiDE2yVB7+nRYUrktWLiGH
	HqVdJjthcX7rUlcY2VAA0mcjguYJ/MCHsJf3Y1/G0PMIytoBy6po0L3+96fazSX2LYTKttf3zorIP
	EdRzcKiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP0h-00000006vEn-1Dlz;
	Tue, 17 Nov 2026 19:38:31 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP0e-00000006vDo-42Sc
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 19:38:30 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-6de2f213b7aso102559eaf.0
        for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 11:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944308; x=1795549108; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+eAGOxWFaa2a5JyiXtLznZ+QwzFoe3T3DPshuhjNzj0=;
        b=pirwCURNcGEaEcobSKlQsigC50B3yr8b/14Olh23HdYZ30A+uLZ58sj1aLWVPeOK8T
         iwJvMS05IMjoLIbz4ygv9EIsg2bOw468ajmqtgSRTHO0zRcwjyqIyJqQJwsQ9vMunpR5
         W2JlPSre0FmgBRTWG0AKEsknpoGz5QMahdKkkvMJWlTKDCPig1QyFV05UbWKR+rJJhCj
         UvuY2KrK7OEC/yNVsTvek9RPU6bj80xZxRMhBANYL6e9S3eGLNtVG6lApJRL+gOi+kRG
         +gWfBM20wqMy/kHk2nf+OLYIQMCwk/ydEwqw7JCku993GOJRJJLjlvk2Xzd0mVNXbcuo
         sGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944308; x=1795549108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+eAGOxWFaa2a5JyiXtLznZ+QwzFoe3T3DPshuhjNzj0=;
        b=JVi2JFnDEuZBn1qcV3/lUiB2ZOn/BMn2S8V6/l+QaajrvubKBey2BO8EzsvIF1KAOP
         O0d59J/LiyavplIh4/0sWJD4G3ssrujdTH939g4zu09yZIu6KOnpQ2+7gCCXbTgffvmO
         80epLO+rWwqEmq+Wwo9rNvkP4aNqIGvaGrBJllaT1E7uqXMNtv3NCUojMNyYJmJ3rtks
         LejkLHRSsjyNFmvQN3/hJIELazdHfWkQaTEB3cEwqfZk0L2bRrBdsbKlL9JcdzGULe0W
         VQH+pHfYI/X7LrdKRVNp5R+2cbq3C/oWriGhercrOXovgMcF66emSG6K7okQC3Pgi73g
         g0ow==
X-Forwarded-Encrypted: i=1; AL+hErErxHZw97AI4XQcSwfyC3W9pSnqx70Tae9rviEXvw98pl3CqnRrXBNvqQgNTAP84eYJ5oEB33/6ybI=@lists.infradead.org
X-Gm-Message-State: APuU4Z8NzzWN2RdxVtZsntxQl3DYq37mWSj+/EYXj8mf5TS7tiLOUsf5
	4rz/hJ41JKAhn9cyOTbYfffz2Xue7SNW7V9TmdLptWBE2YAbkr0T2+uK
X-Gm-Gg: AYBFou1UxitmCor3Gyahe7/x2sa95F7ugH/pTGh5v8C7vod6hSlb7t8oc0/phzq8bb5
	3FXklBa62veMLEw9CTG5cUxyLrYg7blyputLipbkQ02aR9VGAthSx/5mtxUdXMTHUbRfkCDsGNG
	2js9EoVpqueah0UEkpHcZdI8AkM2SwRyBjBSOfy0tZgRJqYUyQTXI8smZVSWCGs4RnGuGYylAj6
	wKJ3ukW4HfXExs3muiEd1lbThgyFwxcq6CkvieaxWSqfXn0IShFD6RDN7Pyi4ASGL8BtsyAgFWf
	lMpvgThmJBOyWGcc+whoy/gQfE1gW1SI1SpGGSxWOZ6K7f1p+QuFi4xRzckK/vylAEdRHfAOzxX
	7G6HBaiTQGbZ0YvlMmHX7jxJ8gQrbBCA2smdeOZa06tkqz+aEHtfwZqSvkrBcyrc8wSntnJkBdl
	XYijFzVk7eIYNHJ9ScHbLKdK+4hXPCTy0Z2tcmDc7sYjanIyzv4Rxxt+ejZ1ryUuh/Q7lFJQrTW
	3YY0f2lbabMyPnxCsp2y9hlmz26xeiy9aYw0OEfT2jBiE2mn7u2c0vLJ2RtBI2ky9PEuIAeBHYv
	up4ZHxlPxrTdPXDjN+ycrdk44Bvlry+/UnEaZJfhOW/OhblC/XBJIhTk5xO6fDb8M7utk/dR+el
	HkWYeJrQE9qlrHsS36KRctLX6G6gifQINSkL2+0cPiIMq+5lAahQgu59CPlfSQjSgQnFbX9+rbH
	o/dlqXSqwJ7AbHypRKLK8eRl4WcEi1vSKIVVxIwB2jdVZovJAd27I=
X-Received: by 2002:a05:6820:f035:b0:71a:df0d:ea22 with SMTP id 006d021491bc7-71b18465311mr297652eaf.17.1794944308105;
        Tue, 17 Nov 2026 11:38:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm146281eaf.2.2026.11.17.11.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 12:38:09 -0700
Subject: [PATCH 02/11] nvmem: drain keepout and cell post-processing
 accesses
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-submit-nvmem-provider-lifetime-v1-v1-2-3cfbd48812b5@gmail.com>
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
X-CRM114-CacheID: sfid-20261117_113829_011087_07BDD404 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

The register callbacks are protected by SRCU, but keepout traversal and
cell post-processing take place outside that protection. Unregister can
finish draining a register read and return while its caller still uses
a provider-owned keepout table or invokes a post-processing callback.

Hold the SRCU read lock across the complete access, including keepout
handling and post-processing. Reject accesses after the operations pointer
has been cleared, including reads satisfied entirely by a keepout.

Fixes: 6a7b4134fb7a ("nvmem: protect nvmem_device::ops with SRCU")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 802637f375f8..73aa53145f0b 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -164,6 +164,10 @@ static int nvmem_access_with_keepouts(struct nvmem_device *nvmem,
 static int nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
 			  void *val, size_t bytes)
 {
+	guard(srcu)(&nvmem->srcu);
+	if (!srcu_dereference(nvmem->ops, &nvmem->srcu))
+		return -ENODEV;
+
 	if (!nvmem->nkeepout)
 		return __nvmem_reg_read(nvmem, offset, val, bytes);
 
@@ -173,6 +177,10 @@ static int nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
 static int nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
 			   void *val, size_t bytes)
 {
+	guard(srcu)(&nvmem->srcu);
+	if (!srcu_dereference(nvmem->ops, &nvmem->srcu))
+		return -ENODEV;
+
 	if (!nvmem->nkeepout)
 		return __nvmem_reg_write(nvmem, offset, val, bytes);
 
@@ -1651,6 +1659,10 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
 {
 	int rc;
 
+	guard(srcu)(&nvmem->srcu);
+	if (!srcu_dereference(nvmem->ops, &nvmem->srcu))
+		return -ENODEV;
+
 	rc = nvmem_reg_read(nvmem, cell->offset, buf, cell->raw_len);
 
 	if (rc)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
