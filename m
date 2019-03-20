Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA95C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 07:16:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A41B22184E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 07:16:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vDiBZn7+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=norrbonn-se.20150623.gappssmtp.com header.i=@norrbonn-se.20150623.gappssmtp.com header.b="lF+8UjnT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A41B22184E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=norrbonn.se
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=80TZcWynHqw4W3OlXr0j77ysXWC9sLuoub2s7yJyupE=; b=vDiBZn7+n4ZO2w
	A/9mVYpCpMoiBR42bYJMv1ujT9mwABY0b3xy+7ALfmO9nDHD2aG9xqEbCg3qy2o/ie2EJ18kWL+BT
	qQwwORJeAIofVPZToVWj7ZmuTkppL60/AB4CxCdIrbnFHUEN6DE9XqYUhHWen+dlpGo9wjtdJfl6W
	gL4Vvnon5KLdlJom2Auda1xcr+goIw6M6TdqZFNN+rLlR2p/gfXgxz8801aKCu6sSYopjm6zWH2gC
	fyO7ajjpFBjuX5OYBMBh9rAe4nzqLLJNGtJp/CEb/qPfF4Rt30js/daBh59+vxtgxPisBzgY6QuOk
	bkLTpPYd6fk+4Z2+LIWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6VSQ-00080v-2N; Wed, 20 Mar 2019 07:16:14 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6VSM-0007zw-SM
 for linux-mtd@lists.infradead.org; Wed, 20 Mar 2019 07:16:12 +0000
Received: by mail-lj1-x242.google.com with SMTP id x13so1285179ljj.5
 for <linux-mtd@lists.infradead.org>; Wed, 20 Mar 2019 00:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PTjl4Y8EEyn17gmwVuPOfcQ7gmZXqFSX9gqv8wcjFEs=;
 b=lF+8UjnT+48SigLg8qucDd32MnFKCd+gjYH6BjlZhjbhAoGM8ZqnLeW1f2n/ZZdkFg
 ckD0dneey2k8M09hL3gM8n1VQUdGLk5rGjZOCghPQf6Wwy62G4tN7WPS9ZO/twmj1Pc3
 fENajUkQvojVj9c09Gw4qWlG1/32q7g0hJ+FQiQJ1X8KHmgMIw09n+6KIti+ozrUGl6t
 QvLLZG+9lcJ4llZ/mlTxRIeKOh1hMQBn0VrFPCs4oJVF8QxDdOvWtHEuQKSShvT48ZvU
 GZSVaUxJTyXg66JVyASFNRJAQRoW7lXXeqWE4RYD3XGiex/oM4VP4jLYQ/Dx3tgs4xkV
 g7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PTjl4Y8EEyn17gmwVuPOfcQ7gmZXqFSX9gqv8wcjFEs=;
 b=j/QGNTKZn12XkTxiXHeWPzij9VVroNZeCuWe6VaurgXoH4MtIHRBwklcYR+sjh8hq8
 U86iyH3mBkNtQbYaxDNuJ8VWJbVp+iW3gH3jhyhOhmu/XUU74fC2E0bAh1bcAjt1H/ak
 Y2erIo3rfEaZdlyULIxbUWzbDbkb6ioocGk5Pqx9n1FqD9Fk0pkpN+3qmXrGpkZtmyXr
 OiAK/m5OSPy5dRHrTWEPI2eAzJcOjbudo6na8S2wifYk6QzMAbvuoiAVJNhaD7a+Vex3
 4pOt+maR9npNeUnaJGvPHAK08PreYRbmRV9/cZUBerNqNJ/oQLEUj6uczPOtk1Pb8nHG
 nkFQ==
X-Gm-Message-State: APjAAAX5341ghAV4E1qdT1cq9V3MAO0d2X+eeUG2+c64RYOnmHgfAcpx
 By5e2VQ9c0n44Q6JnjQtzl7UN7+bpqs=
X-Google-Smtp-Source: APXvYqwAr1K5phK70VmB+1RZfOKV8R0dw3xUZbbjvPP75pLk5mDFVqm8NIxyLcVzJPnsoJoTbEXO9w==
X-Received: by 2002:a2e:9983:: with SMTP id w3mr16270421lji.71.1553066168133; 
 Wed, 20 Mar 2019 00:16:08 -0700 (PDT)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
 by smtp.gmail.com with ESMTPSA id s14sm217243ljh.0.2019.03.20.00.16.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Mar 2019 00:16:07 -0700 (PDT)
From: Jonas Bonn <jonas@norrbonn.se>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v4 0/3] spi-nor block protection
Date: Wed, 20 Mar 2019 08:16:02 +0100
Message-Id: <20190320071605.4289-1-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_001610_919533_04ADB805 
X-CRM114-Status: GOOD (  10.94  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Jonas Bonn <jonas@norrbonn.se>, tudor.ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Changed in v4:
* Send to right mailing list! :)
* Re-add BPNV patch so that the idea does not get lost... undecided what
to do with it, still.

Changed in v3:
* Fix up patch esthetics
* Drop BPNV patch from series

Changed in v2:
* Provide the below cover letter
* Rebase patches so they apply cleanly on linux-next


In order to make device that's effectively read-only except to an
authorized user we need:

i)  Some way of defaulting block-protection to on when device is first
powered
ii)  Some way of controlling the write-protect signal so that the BP
(block protect) bits can't be changed

Some SPI flashes support the BPNV configuration register bit:  block
protect non-volatile.  When this bit is set, the block protection bits
BP0, BP1, and BP2 default to 1, effectively causing the flash memory to
becomes read-only at power on.  If we can set this bit, we solve problem
i) above.

Controlling the write-protect input is a matter for something external
to the flash itself.  Unfortunately, the WP# signal is only honoured if
the status register bit SRWD (status register write disable) is set.  If
we can have this bit always set, then we solve problem ii) above.

This short patch series provides the above bits, allowing for the
creation of a device that's effectively read-only to any actor who isn't
able to control the WP# signal.

Jonas Bonn (3):
  spi-nor: always respect write-protect input
  spi-nor: s25fl512s supports region locking
  spi-nor: allow setting the BPNV (default locked) bit

 drivers/mtd/mtdchar.c         |   6 ++
 drivers/mtd/mtdcore.c         |   8 +++
 drivers/mtd/spi-nor/spi-nor.c | 119 +++++++++++++++++++++++-----------
 include/linux/mtd/mtd.h       |   2 +
 include/linux/mtd/spi-nor.h   |   1 +
 include/uapi/mtd/mtd-abi.h    |   1 +
 6 files changed, 99 insertions(+), 38 deletions(-)

-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
