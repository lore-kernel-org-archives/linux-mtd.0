Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC89EEB64D7
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jun 2023 14:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=weSF6V9hU5+Fsz/df1TRsMT6O3hLoKIiSg2yKwCgsB8=; b=jGY
	EWoZdFQdO38B6b97CwF8wJQ9l0hVa4j2kHUr7IJ8985QwXHfJaIgZCiAWbv9r7C111AbkWmsEe4cn
	B1dVti1YTzwd1e4g+p0gQ4YsETeelX0dUBs2LWwwUJWuO90POQk9kXRFpb5IdYPrt/ivlReG/YdB5
	UuFZ+nn6CbXe9xs+T0w+8ipFSjTXkb2oICEOO+YxmLnhNBwMU8NhLQrf+lnXWDXn7soqlPqN3cam3
	Er45LiIXbx1Us+Z0s9vX4VZvSOX3UQ9YtWEPfPODgu74pasy9nFeyiGKOZdgNP6sJBQSBXlk5UsmV
	yRNrUBap9frTfuVkUTXZYNGBYhtKCJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBymd-00EoJ5-1J;
	Wed, 21 Jun 2023 14:26:07 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qByma-00EoID-2V
	for linux-mtd@lists.infradead.org;
	Wed, 21 Jun 2023 14:26:06 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b466073e19so66121531fa.1
        for <linux-mtd@lists.infradead.org>; Wed, 21 Jun 2023 07:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687357560; x=1689949560;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K7G81xxU46LUeuMRQQu/QxvmIwgTN7fHYirOyasK9CM=;
        b=f/Dc0rWH3PlSpdHdLLBlLfvoCPhR+HgxmaiYzvoO9BwTBzEICPM81Qptm7h/UIqWSp
         amlOamQLiBKvdg1Skcra5kl3cXDx60RRliC/VT4IGUyEmRdK41Puk4vO0bJjR47tm2In
         8LjSoijkzwFF/JRRLQhKMFMDR+LCOv1o8l93YXz5WFcVwo374R9r52Z5MMy/mCrsCFiQ
         qEj7bkLUdnM+LK6r/+0Be12jmIWQCCMhDGJczL4L124/Xz1y2eFjkXAu0IbNXLp9qx0e
         DhTQVR8ZKmKLdew52Kc/jOb0w9HkeZ3ih37GlAl2lNaF96ze6gTKFgpKU6STUBzlQlRo
         tSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687357560; x=1689949560;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K7G81xxU46LUeuMRQQu/QxvmIwgTN7fHYirOyasK9CM=;
        b=VblzCHSvpAxABL0JUYmyCHUv0latrhVOz6Lj4oQmcVkkzbgmwxBi5OItSGkZfyOCNI
         erDuWDrgEkQ/yE1uPyuRqdkkM4nNS5OXqzDFrBidM1i1mk2X8g3KBV3QszPNEsK2QHoc
         gnHFKGzFjqjwiX0CdGeTpowhMdS84w8vkPFuZBuy8r3IuUbZkOH6tIF0Fa+xRv121kBC
         RlQdQjIh3aHkynjKkAB6Hst12/guGS6hVxz7OlSNIDRA0c4hrO5SVcvHNlY6bgr/6/gq
         J70A/vVxKJfv+jl/l4ufvJpSPI73O0Y8Z2Lum+L1SjocHDzMdAqM4bOMRe2u75XsocSa
         ttMw==
X-Gm-Message-State: AC+VfDwI9+fSnuV1g5yV6COilMgHLuE3UU/UndzDRyJqNrcZHgl14jRh
	qBDOiB63Y56ptR5Zbdl9DC+YUsaej3rhIyUqlwDQeXDB6pE=
X-Google-Smtp-Source: ACHHUZ461ShBHx9ITX3+ldrsFrB4k3xR11LUclbfHp2jWRab2qIeQUg5q7gPc9VMNMMWMaTmjw2IkmJBnXORk0lY22k=
X-Received: by 2002:a05:651c:1045:b0:2b5:8206:e12a with SMTP id
 x5-20020a05651c104500b002b58206e12amr2269134ljm.42.1687357559401; Wed, 21 Jun
 2023 07:25:59 -0700 (PDT)
MIME-Version: 1.0
From: Kegl Rohit <keglrohit@gmail.com>
Date: Wed, 21 Jun 2023 16:27:04 +0200
Message-ID: <CAMeyCbi16i4mdkOnqYhbW1tnqNwPwg2FVYqbdyhXt1fT10EaUw@mail.gmail.com>
Subject: mtd: raw: nand: gpmi-nand data corruption @ v5.10.184
To: linux-mtd@lists.infradead.org, han.xu@nxp.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_072604_839228_598EDBF8 
X-CRM114-Status: UNSURE (   6.10  )
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

Hello!

Using imx7d and rt stable kernel tree.

After upgrading to v5.10.184-rt90 the rootfs ubifs mtd partition got corrupted.
https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git/tag/?h=v5.10.184-rt90

After reverting the latest patch
(e4e4b24b42e710db058cc2a79a7cf16bf02b4915), the rootfs partition did
not get corrupted.
https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git/commit/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c?h=v5.10.184-rt90&id=e4e4b24b42e710db058cc2a79a7cf16bf02b4915

The commit message states the timeout calculation was changed.
Here are the calculated timeouts `busy_timeout_cycles` before (_old)
and after the patch (_new):

[    0.491534] busy_timeout_cycles_old 4353
[    0.491604] busy_timeout_cycles_new 1424705
[    0.492300] nand: device found, Manufacturer ID: 0xc2, Chip ID: 0xdc
[    0.492310] nand: Macronix MX30LF4G28AC
[    0.492316] nand: 512 MiB, SLC, erase size: 128 KiB, page size:
2048, OOB size: 112
[    0.492488] busy_timeout_cycles_old 4353
[    0.492493] busy_timeout_cycles_new 1424705
[    0.492863] busy_timeout_cycles_old 2510
[    0.492872] busy_timeout_cycles_new 350000

The new timeouts are set a lot higher. Higher timeouts should not be
an issue. Lower timeouts could be an issue.
But because of this high timeouts gpmi-nand is broken for us.

For now we simple reverted the change.
The new calculations seem to be flaky, a previous "fix backport" was
already reverted because of data corruption.
https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-stable-rt.git/commit/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c?h=v5.10.184-rt90&id=cc5ee0e0eed0bec2b7cc1d0feb9405e884eace7d

Any guesses why the high timeout causes issues?


Thanks in advance!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
