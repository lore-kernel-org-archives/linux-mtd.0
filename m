Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448CFCD5BC8
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 17:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gKS2rOogTyyA33Mg02YJyrbVRyfj6RWtXmwg77pMClo=; b=Un6xVEfzXYiP4s
	d88dplG1vEqEpHOZeTBeLDrxdQpDLq/xd6bi8eQNNg6fwtYhRXF6ygBVZMIg6VVgrFpTITeHimcFE
	EYV+hf3izjLwkt+vmea8Fq5ReODTOqIWKzyXLTo09GZKw0FDMQyzBt2I2faRMC5RUQ7JsV2CzocFg
	nv47W+S8N+oIrXwcif7EMHUXQ6Ew122imD6wLnbA6eM7j4OPzgQ7czbSakeQ8+bduc4JEZ/dpTZmf
	pxAiRvA+OaPGxMP9SZlhtmU6glYFDinXYKc0iESc9fqPCObpkGjjmApY6N3oGsZqyqhKx8i2iO1Uv
	4lcHzMaQPtOCtr2qaVOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvVL-00000002iCE-1xq4;
	Tue, 26 May 2026 17:23:47 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvVI-00000002iBe-13Bo;
	Tue, 26 May 2026 17:23:44 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH -next] mtd: spi-nor: testing locking, fix new doc build warnings
Date: Tue, 26 May 2026 10:23:41 -0700
Message-ID: <20260526172341.773398-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
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

Add a blank line to prevent documentation build warnings:

Documentation/driver-api/mtd/spi-nor.rst:215: ERROR: Unexpected indentation. [docutils]
Documentation/driver-api/mtd/spi-nor.rst:216: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
# for spi-nor/next

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>

 Documentation/driver-api/mtd/spi-nor.rst |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20260525.orig/Documentation/driver-api/mtd/spi-nor.rst
+++ linux-next-20260525/Documentation/driver-api/mtd/spi-nor.rst
@@ -211,6 +211,7 @@ section, after the ``---`` marker.
    must adapt `bs` accordingly.
 
    Warning: These tests may hard lock your device! Make sure:
+
    - The device is not hard locked already (#WP strapped to low and
      SR_SRWD bit set)
    - If you have a WPn pin, you may want to set `no-wp` in your DT for

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
