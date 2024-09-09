Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90295E6FE49
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FkC0u/WguHEkAtmyCSA44uCdB5GNqq75MCiTKehqGG4=; b=LhjfiIw6rhzoKX
	Z0FdwiqIhTmyiX+4AD8wWmi22K/dgcjTvKz+S08bvKS+chisWlCT/BAR9Lc0NVkMmaiT679nVMbiA
	pXSxFN96/CqDeutF9Tg4Q77E+itPuiywtnCcr07xQnnHAKI0fc+RzhlC5LDj48Fnjr4VC+ILLVv1T
	+xJ6/rJplwib/08XJ1cloBuePd3Oe6nx3ahkt7aAe+RG5xtui2CxemG44lOc91U1pZ6W6+HXcBbWX
	MwV3P7PNIfRluJWP2pOUllFlnPWWXMw5gVfa9BDugco3DzDUcWQt2C+78qYQm41UJeYexpul912mV
	QPE1+54uvtMI8i50I5tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGq-00000000wK1-25aS;
	Mon, 09 Sep 2024 07:57:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGi-00000000wB5-13Fl
	for linux-mtd@bombadil.infradead.org;
	Mon, 09 Sep 2024 07:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SjWx0r6W+Y+t7FzaeoDZ7q2Fdghbi7J4Jwrj3xNRS3k=; b=du8s5Ji/A7eGMth7peYtAektWJ
	6eI/yVxMNBQGkh6edOVzkbcddEgmBBcLgw1R7iLR87ao2Le9jsOpA3WO6lLbFCrBuL2PBYHmxu6Fn
	MshXfTcYrp/hECjC99q6fVO9mIPq5l9i5RjIgEzbNFr//InxcXeiu1iEPQ1Ym52ijD54lgxm1qNdv
	dRJE/xkTkGTBMXvio6mOLyJO2yI0g8+5nq1B38W62t8VltkRoAatn+6FFov5k0Xt6lN/ip+BEYDqQ
	yg0KlACqfoF+Bo5z5LBRN/LobDFtPIKJJb+u3G8Y3oj0dfRlELFcbwjglvqiJOSOvmGQCjSbqy/VR
	swzlkLrQ==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1snZGe-00000000LOT-25zl
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:57:03 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-375e5c12042so2219972f8f.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868617; x=1726473417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjWx0r6W+Y+t7FzaeoDZ7q2Fdghbi7J4Jwrj3xNRS3k=;
        b=ZbXPOA1rxXKCiUriyTFYBw6Nsj27hCqzmfRGubdC/0ZGEewo+CBoXu2LU2ewk60CM2
         XUJGz6PxwMWbPIEmMOIBgKBgatSxZQXcrxpYDlv4tUCVgZ2g8gSa5gXti4Waa4zS9XSX
         fYwyCYfB3TNv9/iXutvQjPF7qFZmfr4tqxSd0DJFm9CAIvxosB9NgM9kdiMbGSyPHdTD
         0x05VcEc0H2P5al3lo3KymSfN3Evyz2c3HZZ8TnV3bxXiW52e6GkyHGzyKh1hWfccrwx
         OQjGslKDG3R6IKCfYd0aOtNJ2nZTbMv7AqbNYJZr3R3VJNZPNCGcS8+rIifYKvM1/f4H
         RnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868617; x=1726473417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjWx0r6W+Y+t7FzaeoDZ7q2Fdghbi7J4Jwrj3xNRS3k=;
        b=mJnUhqIyWeWyWpgXilmaQoOMQXUlXQ7Z3ychSfe+gLtuFKGyBMre/LMGk1zMvObX3s
         d1r6mrdFmfShaw1X0NEhdDiHPZ0F+OmbcrWY+LPOOFoObSewe6yNm0V7/KZJnsjfliVB
         siMiNFxm3+lrP0gdI2+D449PyRmRluuMN5LPz648NaF/YdTHp6FwFKWN9G/Ua36z0VYf
         xlU+t04dO3zRptAEpxAA5C3yfHsp27YSPX/O4VYhid2CZEmrL0xoI2xdSdI15GIoIpQM
         jLMfDcN3YZUgtp83eCLiEHGB+5Q579wCP43UUf4bKw7wKI/3+tmW+g+20qdwOcQhWCki
         8rrg==
X-Forwarded-Encrypted: i=1; AJvYcCVJXqH/KQPu2VLEm3iPPCf8bP2MEBhwsdFCtSoW5mMHGx3O6u5YmUau9WiL1gFi+c/37tP1bu8oyvM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxpgTLa7FqjoufoXd1G0PJElan028w6yCRj30AAqWM2TxZYJpeL
	HfkPA+WbVf2FryOB31RtoRsSdt5z0C/tI3V4Tt0+hbpOTbt6Sfp9
X-Google-Smtp-Source: AGHT+IGbp7ULiuTNUf7vRfm8ezmMj4Ynf6irlpbF3StQp/S9yZeLlgA3L9pUiafOY1eFXvpthfwEbw==
X-Received: by 2002:adf:f6c8:0:b0:374:c945:2569 with SMTP id ffacd0b85a97d-378895ca6f2mr7015316f8f.15.1725868617528;
        Mon, 09 Sep 2024 00:56:57 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:56:56 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-crypto@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-fscrypt@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"Theodore Y. Ts'o" <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [PATCH RESEND v2 07/19] fscrypt: Include <linux/once.h> in fs/crypto/keyring.c
Date: Mon,  9 Sep 2024 09:53:50 +0200
Message-ID: <20240909075641.258968-8-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_085700_622972_A4E4F499 
X-CRM114-Status: UNSURE (   9.02  )
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

Include <linux/once.h> header to allow the removal of legacy
inclusion of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Eric Biggers <ebiggers@kernel.org>
Cc: "Theodore Y. Ts'o" <tytso@mit.edu>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
---
v2: Include <linux/once.h> instead of <linux/prandom.h>
---
 fs/crypto/keyring.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index 6681a71625f0..82fcc5683649 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -22,6 +22,7 @@
 #include <crypto/skcipher.h>
 #include <linux/key-type.h>
 #include <linux/random.h>
+#include <linux/once.h>
 #include <linux/seq_file.h>
 
 #include "fscrypt_private.h"
-- 
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
