Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821A2C5AD4C
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Nov 2023 16:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YlOgCRmBoa6BKUpOYq5BhtGQUyJniCf/bHNxucv+ujM=; b=ATU1OPbwyIFG/g
	t8CPmkI3SVT/RqzGjlsupzKsUKSDR7MMBim93Hx2QRQuEufokWkeohnf5PkwzPktzRkBmg3RhRLZA
	aZDeW7KxqAbZBKYuO98eUYEZ3GtgHUnri8UQXukAx4lL+W/VtXzbywi2Btg1FnsWQluODmuUURox5
	Y7m0lmxgJ7kgQrNuervEF5O+LC5xUKrn7GwDyQi522b5MbdjNotRRUKxgSquBamUQ2RrSo6/Yh5qJ
	nSMTwDymBCATwC1q7M+wGMdevK1MPI7wIBoUVcIiPIkxUWNw4WXwy/RWfpSn3ETTerExbpQUJmtUn
	uvlL4jaUezB8SJrHBovw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6CEm-005FgK-1o;
	Thu, 23 Nov 2023 16:07:32 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6CEk-005FfN-0P
	for linux-mtd@lists.infradead.org;
	Thu, 23 Nov 2023 16:07:31 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso137741566b.1
        for <linux-mtd@lists.infradead.org>; Thu, 23 Nov 2023 08:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700755645; x=1701360445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m+HLaQ4LBn/sUNR9G8JbWf1oEDH+SCWwSR/AdZg4c2Y=;
        b=e0hg/nosaAtEZp4K+7r0708ldaFdLA97NsYTGmXDhjf08qRf96D7mWJ2X50Ruf0uQo
         U/O00dT30WE/s6oaiOQ+zjSMLILUCQiCnVFEdTsHuQl9Pirybo09RdzsOKvR0u22bMtH
         cH/3aCKF68V0eHWSFg+Vj1JKN7Kjohj6oucfPeRMlPfDywwP3JTyPdaUhwZ2eN+WafDH
         xXGCSwo9ULmc0bfoB0yyJyvuR0FsW7pmgCx1Gtua7XnWl4u1JfMkOQKYkjt0Zd5MrxQc
         C2XBTZb7VKtpvjoggQrW1+KHsuK/+91G9jPGaCE2CIy0PstW089xSbdSmaCJ/koQTuL6
         OpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700755645; x=1701360445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+HLaQ4LBn/sUNR9G8JbWf1oEDH+SCWwSR/AdZg4c2Y=;
        b=brtJX6wgGd3kfdZKdjc2iMyJeR9FLztxJoKx9hYE4yy5JV077nMCxcF4RiGbWcCs2N
         oUjEeUmiASb1C8n/37Br161xFgwr3EVy5UVVUKIIYkzhT90Qk5ZM5oBBHlz+4y1tl44c
         +0LDiJdp6jOT0dwVntNk9JH+nyG+BSQmYANqEhGrgPSSQAzr50gBZmfdIdR7e0ITHyEF
         ngbEOTM6Gf8Oy+m2j3f2LA3+8a+ihWXoejXe76xoGUIgF7SBaFYU1HTiZrfw2Z5YDS85
         GUMd4VrmUVtMiyJ3KjqJwmzB3GiGvK2D8PM2GCVOhP2oP1GK5vkG4i2wSDVelC8m0QXL
         V0nQ==
X-Gm-Message-State: AOJu0YzFjNNHjoH4R8bGLCXZHZO0p/9pyLhMK4Af3QnxLCxs4dqyIAmM
	oZ4CaqoFbSbJ/hhEulXCZmcchQ==
X-Google-Smtp-Source: AGHT+IFQndvSZg4w3rJtAcl353aA4kMN8cLIKAAKZ1SYxXym9WFmaRRbVMUT8K1eNEDWBPB5R6KVdw==
X-Received: by 2002:a17:906:19:b0:9e6:1dc9:9807 with SMTP id 25-20020a170906001900b009e61dc99807mr2768988eja.77.1700755645627;
        Thu, 23 Nov 2023 08:07:25 -0800 (PST)
Received: from 1.. ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id h21-20020a1709070b1500b00a0180de2797sm941490ejl.74.2023.11.23.08.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 08:07:24 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc
Cc: linux-mtd@lists.infradead.org,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/2] docs: mtd: spi-nor: add sections about flash additions and testing
Date: Thu, 23 Nov 2023 18:07:19 +0200
Message-Id: <20231123160721.64561-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=626; i=tudor.ambarus@linaro.org; h=from:subject; bh=RUUGrpTnn+dK3J0RLE96RVqrRMkZ9QBsAMu5cYh/kLM=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlX3i4B51az5Zp+f+mQkihPnjD3/FOh65ZfsOfe LO5hsaU/3CJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZV94uAAKCRBLVU9HpY0U 6dgvB/4jv9Tw8sjK0Hr3+ZlkwR6ZRSeTFWb4Sqnu8Mu9jjD4Vj2mesXCjLdT/uVvUlAS0NEFfJQ POEmupH6KVbZ1uCcquSiT7+1b7toRJgCRKNGoV/1lmjX+9sg/2jjyWm4Q98S+qJKKmuogY1gFfh CHSG+ExydRc8n87+Tj4IjSrLdSaZGk7gj7gEdgC7MG1B5zFzyXSjhDvr43s6Pn/1GcBbeyFw4Jx H89+OrQceFSqVhgoNyb1jV85H2z66DrgXpctb+Jgoku//MRltAAdBhF91R+TCzSFW3z4h2qGEF9 MzX8jBpS5XtL60zmNynrExjwpTnGHI57xiz3gzXbUfuFXQ4h
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_080730_164639_A4437BC6 
X-CRM114-Status: UNSURE (   7.69  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Introduce guide about when to propose a new flash addition and what are
the minimum test requirements. Dropped the old documentation as it no
longer applies to the current SPI NOR framework state.

Generate the htmldoc by using ``make htmldocs`` and then find the
SPI NOR documentation at
``Documentation/output/driver-api/mtd/spi-nor.html``

Tudor Ambarus (2):
  docs: mtd: spi-nor: add sections about flash additions and testing
  docs: mtd: spi-nor: drop obsolete info

 Documentation/driver-api/mtd/spi-nor.rst | 249 +++++++++++++++++------
 1 file changed, 188 insertions(+), 61 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
