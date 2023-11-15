Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391C1C07548
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Nov 2023 06:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D8VmTB5Tcq764II3kTus+OAzK4VLgQZo3o7TtwqUBV4=; b=jwY0YpYcvJKwGq
	HLoFxtfupjBsqdw8pfYVN5e6fcDUvgSbgsFPsEHgo8FeLewB0DWrkObEuiRp1FkpfpOfNkmdkD5A9
	D5dEwi140hmmqVnDpuWLCJwan7U+JLyzCpt5M7TxibIVUmQ0Qh0c9ATeTjZxIozgIzvPmMgIKJoZW
	0Z6lByy9Xm079UlRusO/pNTKMVUHiSb1OLc3lY91KEfRrMW2viqTX0kI2jLuOib88Gr9cx1KCZE3H
	kN39JJuS8tu/ZB4b0MNQrBNkzxvo0tmqEp4lafkJReeTe68iTScRd3+wKxeHW3hZXGE5N5Gbva6Em
	xElf5M1A7e5As5wIzfZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r396Y-00HaxU-2J;
	Wed, 15 Nov 2023 06:10:27 +0000
Received: from mail-ej1-f45.google.com ([209.85.218.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r396W-00Hav8-0a
	for linux-mtd@lists.infradead.org;
	Wed, 15 Nov 2023 06:10:25 +0000
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9f282203d06so61932366b.0
        for <linux-mtd@lists.infradead.org>; Tue, 14 Nov 2023 22:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700028615; x=1700633415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ie4k81deVnS6eE5/8Q7GvnYL+PUqnKNbj3uV1T9qK2c=;
        b=GkxxWyPTz2qpXa5b4z+eRSK2nbLvAfKMI08/8bUyWnV4mGZUcFk2WCOyNArH54bk64
         NpQr0UEvHvupLUPc1zTytcVAHDxJnbGXNAvXFt8gB3C5Qypmb5wVk2ek8cNoyXkAxGiB
         5ycSgopcFb1bEGz+Xs2DpWK1R88nXoAUZ1xFyFAY4sBdV+qtmIlvwy2X0us6z7ritwk7
         +14ho3c/WHD+JA756uqrojU+5ZWrl4JQLwcslo124MFLX3zp17ANCvvkgp8gr0J6BJMd
         nVHzY6pO5jULoWkssO+NSSKv8tIReFuetLbr7yE10Xw+5DCV0ZEw24wD5CJPdNDmw9VT
         +kUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700028615; x=1700633415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ie4k81deVnS6eE5/8Q7GvnYL+PUqnKNbj3uV1T9qK2c=;
        b=wmdTYQnxEsDBW6PfF7BufowWgLZWuxPNs8wyNgUYNXunjV1SVpeGolx3F0Fz++lFWK
         ad8mEvnmzLzdCfSDMvIQKqna+vNz8sw87yGYI2tngh1KSbib452z/s6Tj2AIz00hvc6r
         P2v9zn96ameAEswzrS83CnLy7vU3WVMmpVQPhl7QzVs9mHICYxv1yj440I7rPRUZnzCM
         eATNIfPvuSKINU2s7J2dtKBRCy9ETrc+VVpoOt1wQjPH5fqXDAmDmImMvEtHkq62/0Ym
         h/wFx+DZ4W1CSwn73/LxlMry/AesMgyWUZYuJ1qWlprffUqCXbt7Vf7ns6uo9Orx//sI
         xpiA==
X-Gm-Message-State: AOJu0YxW1qTytEzGkDNp2ySlkc6ribXI5SAbLDF3PTOR9HoxR/yf/ej6
	gt4D2QUMiJKaXh74YGEQs3dsng==
X-Google-Smtp-Source: AGHT+IEpXfEorTmornRxn7Twq+F8z/2YwexNob3NE/Mk7Ci+ajxRXDWqXwqXAdCGCIbygxQ7oG4BiA==
X-Received: by 2002:a17:907:364:b0:9e4:e405:27b4 with SMTP id rs4-20020a170907036400b009e4e40527b4mr8219566ejb.53.1700028615130;
        Tue, 14 Nov 2023 22:10:15 -0800 (PST)
Received: from 1.. ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id w20-20020a170906185400b009e618eebf9dsm6554530eje.182.2023.11.14.22.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 22:10:14 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	festevam@denx.de,
	takahiro.kuwano@infineon.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at
Subject: Re (subset): [PATCH v2 0/6] mtd: spi-nor: introduce die erase
Date: Wed, 15 Nov 2023 08:10:11 +0200
Message-Id: <170002856829.6423.5733214105639256341.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231101145853.524045-1-tudor.ambarus@linaro.org>
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=689; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=EhnLJkBkC77kH82gDu5S0XCwZKIKUobtUAtRHmO7m3g=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlVGDCFdz/cPCYIRth/PKfsLU7Epl+bsD2iW9Ck 8PAKhPEkamJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZVRgwgAKCRBLVU9HpY0U 6W81B/9kiltDjryf7vZPc/LaFhnmigodS7ZPjyLqYtoCmlcCA3tAZugD4RMjEzS7Co5yz21T15B RuUxl4RTosqBnZgshld7T3U9NFdOZcfBM5pm2oV0gqXznb1OiboPlNGw84UbAJyUCwX/9obWdmX q6o81yRSjPR1oElc54B0LYxhkwjpqQzBxBkFv0D0zhqfeRHmSaz/GxGcn7Ej+oXRHeQKeI0ltHa RkSMrBAl7E37ZzJYkbByWGtv1VIix5MutgiyVDF3ybFwQophw4k0EJQFeu8IXIfRpi7l/nUE8VZ lHepPeF0m4vP+D6NwB18rEmb3J7Ybsim/P3rOX7zBLohOtgk
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_221024_254419_007BEFE9 
X-CRM114-Status: GOOD (  11.83  )
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

On Wed, 01 Nov 2023 14:58:47 +0000, Tudor Ambarus wrote:
> The patch set is just compiled tested as I don't have a multi die flash
> at hand. Takahiro and Fabio, please test the series and let me know if
> it works on your side.
> 
> This will be followed by the removal of SNOR_F_NO_OP_CHIP_ERASE and
> implicitly of the old xilinx SPI NOR driver, but let's take it all in
> small bites.
> 
> [...]

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/6] mtd: spi-nor: use kernel sized types instead of c99 types
      https://git.kernel.org/mtd/c/075ede8d20f8

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
