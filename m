Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92BD2C282C2
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 12:29:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61A1F21019
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 12:29:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P4IhXgJn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zfs1fIY2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61A1F21019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qkls3ZaXHL4z87qYDnLkAhzDbDM8SgU0WMe8+nagwzk=; b=P4IhXgJncUEeWY
	NVFftRzMLTqoa1pKjbOX5YMWnAqcftFdVKH7gR5FPKR7Q8r4YslXFrTc9PGBITcPA9FRtn8S8IZIR
	iitSjgy5ubtxKT2Ghr2ZWIpSyI6t+1VHC7xVwFyG8yq0uTYWUV6MEMJmp0sZAzxM4cgSw9EvogkhF
	UlXvfxo5TnQDIjz5rvpxZpdeOeaSZ73ORqnUQagp1C8Ts3URZs1rqKrW8OzOSI2jjUv/1onsdXlz2
	cNJb2eS8Ii8Umkn+EdJ4eGvC54U4yyN/88zlUril+dGrWhlv7HVqChaUB012BIqfVOdhL2tBME7Ip
	Le1I5JSIykG9tOQ9Xm3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmHel-0002Ol-7N; Wed, 23 Jan 2019 12:29:23 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmHei-0002OO-Eb
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 12:29:21 +0000
Received: by mail-lj1-x241.google.com with SMTP id q2-v6so1740559lji.10
 for <linux-mtd@lists.infradead.org>; Wed, 23 Jan 2019 04:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8CsLa0e2oCYBZBnEUfO5QZ3SEIIaFEGabXxwxzp4Rtw=;
 b=Zfs1fIY2Q+VkzrUXNtIZznniCtKiqpJzg4aiY1nOa9AHIljeQkBKHpxzjKnyhk0Uw4
 pZUg+GhfFGAAR0JirXyBdnENAO0Qo3LaIhGnUP/64N/56IS7ofe5HrUbCkiGQV1IbZaF
 yT9e4zAJth5KbYFtA12uW58TNEwFLG6xZsc0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8CsLa0e2oCYBZBnEUfO5QZ3SEIIaFEGabXxwxzp4Rtw=;
 b=ZO+rXXKIZdc6CQ5dFClxCvp3PyCvH6qVYC+IppShpjtGguLUltw2RWVl2o+qqBR+Vv
 lQuiqKupIY6P8moBeZZdViWPzEjecNwwRyXhiNgWndgk9TT6Juau0faXhas4tDYjpiLk
 G63OCBVIAvb+po/Ku/Jl0WqFHWeegKdCSAAH8FAfhKZYNQWqKGpAJ8Pw0EOL6Rg+zCf1
 e86+knthJMndsII/CLAAAWOQtZVhQQun0tU6KayaOb8EO5zRuigMS4oC2+MqKjH/c2X7
 85z9A5CCZfixLIGXycGkVQGY39cO/J8H5rsiEdhMCjzu9dkb15zXBf0miSvQkONtTyJ3
 +T7w==
X-Gm-Message-State: AJcUukdOy3WRw60nO9y7LHCbE51FRg/QePjh6QRwkBOw9OGKbeW85CcK
 3VbYLow5b6f8dNGcLkr7l9k3RQ==
X-Google-Smtp-Source: ALg8bN5NfL8fCCWiYoXvIeTz51N1e7R/HHFuoV6cLAYuU+4aQj9bCl8rY2JdqyJLrU8OCNqrIVsPbg==
X-Received: by 2002:a2e:5b93:: with SMTP id
 m19-v6mr1923744lje.115.1548246557204; 
 Wed, 23 Jan 2019 04:29:17 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id q2sm475935lfa.63.2019.01.23.04.29.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 23 Jan 2019 04:29:16 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 0/3] AFS move and OF support
Date: Wed, 23 Jan 2019 13:29:07 +0100
Message-Id: <20190123122910.19024-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_042920_531923_364D1DBE 
X-CRM114-Status: GOOD (  14.46  )
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
Cc: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

As a starting point to fixing up the AFS support on ARM
reference designs, let's move the implementation down to
the "parsers" subdirectory and add OF probing support.

More refactorings will be done on top of this change.

Linus Walleij (3):
  mtd: afs: Move AFS partition parser to parsers subdir
  mtd: partitions: Add AFS partitions DT bindings
  mtd: partitions: Add OF support to AFS partitions

 .../mtd/partitions/arm,arm-firmware-suite.txt   | 17 +++++++++++++++++
 drivers/mtd/Kconfig                             | 16 ----------------
 drivers/mtd/Makefile                            |  1 -
 drivers/mtd/parsers/Kconfig                     | 16 ++++++++++++++++
 drivers/mtd/parsers/Makefile                    |  1 +
 drivers/mtd/{ => parsers}/afs.c                 |  7 +++++++
 6 files changed, 41 insertions(+), 17 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.txt
 rename drivers/mtd/{ => parsers}/afs.c (96%)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
