Return-Path: <SRS0=DZ8H=ML=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D931CC07E95
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 19:13:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8939C60720
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 19:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8939C60720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=frclj5EUHcRDHkfvm0IBTxdxhPi4ye8iN0W1McsODOA=; b=MD5k30uGWAUsbA
	SGHvb2I8Sr4hAUldtloTAHctYkuVNjTnp9ZJnce93CDhCf+vvfcZcqbD02pUPAI0c53nt6E3tBAbp
	PdNarjY3P93rIZ9c4ijGO2ILUR2/rAjqXrF/0Ax/DXmTv9bliseaDvdFf+GarWliVsIkx0zPTv4zZ
	d0EjubxYkgxXq1K5PRMDoblfX8LwGXkmU+lSfQTiG0L2LKaj6op7xhfeilnwvfdSAJEuRCLzad9/1
	DYdLC64fGUUruBrJXqjCVppn0gkNy5ZaHY20kGGzarTIz8IaZ30uVIqjMS2mbVZAvpFTI6qCQoquY
	Yn3pHqXtD7djj+ybBFgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5Yh0-00B391-AJ; Mon, 19 Jul 2021 19:12:42 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5Ygx-00B38S-GR
 for linux-mtd@lists.infradead.org; Mon, 19 Jul 2021 19:12:40 +0000
Received: by mail-lf1-x12b.google.com with SMTP id g8so26134837lfh.8
 for <linux-mtd@lists.infradead.org>; Mon, 19 Jul 2021 12:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ukY3dGNfnOu3pO4DTJvGnp/W755wNgK9mLKEHhB/Fso=;
 b=TXR1FFJP9oXiQM7ixHrM2xvzVKeYTdbpT8PpSq1JebBgKJ7kmNObfCygNhVfntekKb
 NZp8jGj0dZWz3BnAn6GBSfq2s5LTiiQacNXs0ngP4dT4IDJ/8HKMNEHE6nuvC0E62vps
 RvLBgMnlQRuA6bcHyyC7iMZblScANhsb7I4KP5RsGJy/1rx9buok+l0QrsoWhQY3XCKv
 9zX5QWc5bJFIZFzh2YGQCnX6SXwvkqckVJYpqYpobkKPrtnrXXU08cV0s4OQDZjm+OLd
 citfyXNACnrIJw6uMlIrdOe/be8lwRZFsEql2gayUgKntg0UTY8+ZUe0o7tY37RrPr8U
 f45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ukY3dGNfnOu3pO4DTJvGnp/W755wNgK9mLKEHhB/Fso=;
 b=NDIOQFPYdUkac67QMDpFqswiCZtPIkXFJdLhvQ5jMkwUuyl8KLX0unIkNZiZLn7j65
 3iMbqiVjJKt0tDY3c4NmuKfZEpgwyjx5ts8yscEJNLq9Xk0ArWt51vv5H+sEGim/Js4S
 w7mijXTYxPYY3EXLrHZISWMc6oKxjOVl+kIZ4yuE48BoQRqMFPIi3o2GWw0AvfV3MhFi
 sTL5BnDDbnuPHE0B/qE0RGeCijiQXp/ezxfOKJJpoXlpbaBCtUhULbX3jqfj7O2c7g7O
 nbcWody1oWmsSs7qvwdpMMPSqzicX3RNaWum9jhX3KfEIunDeY216Z1pJc7AoLlZ1OA4
 1pRw==
X-Gm-Message-State: AOAM533za/IBlicN1dGAEyDOvVfXZDR5fjVZ1nESeomfDLK5Kvs4pT1V
 mK4yqZd8ldum6QL4CbCKm51T4XptWG1lSdv3/K2eadNMdNDxLQ==
X-Google-Smtp-Source: ABdhPJwe+4xf4jQADZcRWiCYZUk7xH/OG6oUShIs+HRATKz6OukJ540Mb6wfh1sgEAZ9It604ScoCcbt6vvYCulC4Es=
X-Received: by 2002:ac2:494c:: with SMTP id o12mr13110098lfi.229.1626721957052; 
 Mon, 19 Jul 2021 12:12:37 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 19 Jul 2021 16:12:26 -0300
Message-ID: <CAOMZO5BX9iYmZwBBGEstbcWpvftRNExtwq+kX_rQff0v_o1P5g@mail.gmail.com>
Subject: mtd-utils: Proper way to handle erasize=0
To: david.oberhollenzer@sigma-star.at, Richard Weinberger <richard@nod.at>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Marek Vasut <marex@denx.de>,
 Heiko Schocher <hs@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_121239_586905_E282CFF3 
X-CRM114-Status: UNSURE (   6.09  )
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

Hi,

When using a Microchip 48l640 SRAM (drivers/mtd/devices/mchp48l640.c)
the reported erasesize is 0:

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00002000 00000000 "spi0.0"

This causes a division by zero at libmtd.c, as mtd_get_dev_info1() has:

mtd->eb_cnt = mtd->size / mtd->eb_size;

What would be the appropriate way to fix this?

Thanks,

Fabio Estevam

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
