Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22056CDB482
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Oct 2023 04:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nGWALgWKe/XfUVnFMQV03nuZJsYHr2BGX9OlSsT40K8=; b=kWA7ocFQTbo2RS
	iPFcpU4G2AxOr81lmspV1MVJRU/fUjlbXyfUWfhG+Up/sR5GJMUb7UXur0E5xK1ftqH/MvBWcLqQp
	HaiWfKMicNCiPICha5rKIcHnJcQJMPhEmiilFLnYqfR3P5d8nJ9nD1mVbRnsTo9ExxX19vXwO5L+G
	JsYRsmSsshxBswX/20TVAEMBHGFN2SDjdA1BsnZckHXh/Jai9wODPsMdBVbicSAcPIdGWXn+6oIKR
	rT2ORo1+qw6D40+nDY9WYnIHKYTUd2JSwiCpeeEuzux1Xtj4oshhwptHWhHUiXv+vY2IWk0XUiAPL
	+MIFvDqd2EouLsc97FOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsyWF-00DmY7-0e;
	Wed, 18 Oct 2023 04:50:55 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsyWC-00DmXe-0d
	for linux-mtd@lists.infradead.org;
	Wed, 18 Oct 2023 04:50:53 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-53dfc28a2afso10932541a12.1
        for <linux-mtd@lists.infradead.org>; Tue, 17 Oct 2023 21:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697604649; x=1698209449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJTgecuO9IlcEiPhpF1l4nKhffuqUxUpzxSxXR6k2WI=;
        b=v1RO7tZfhdtkNW+0dc+OCBi0y/lpBMKJMA8UbDQxetiiVMD+xKSnvi2QdbMJgYK7Kk
         rqT7wYqjSjzroZ/rra+yIxdocTlJ3w/ptsGlserI/3XsMlvdCN97SQLeBBaQA1KcHYE/
         rY6MSvG4kigwsultjBIMUmjEYd6BnbpBy3ojkfHscBHT8jim7dam3QumXTXceRN0QDGi
         nTnFnlFwY3+bXQ++Ou08wLUB2FITNsouoKNBPAcXKvmvNRO6Myb+iHgLFfaOxuauKE4P
         qYq4QeVZIxXuGid7y5NaQ7qod/1i0VogidcaSfVujgBNdhPGLNSLSWtjdZLOAv5B28tf
         NSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697604649; x=1698209449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJTgecuO9IlcEiPhpF1l4nKhffuqUxUpzxSxXR6k2WI=;
        b=Xr7OUOYjOO/nSYKBLClD3PDmCRsWTwry3dw2/K8c2nKdiXrFnuEWj15XWeo6mDAIju
         iaM+hZx34D3y6G7ZLCQtgDqzNGwyFUbaJ2oXDvHf/U9ZVw0HNqCTggkki+cq7CEpUBJC
         0fBWz6h3D0Pl7yuXry+RuJsQY4JhiI91/WgxzlAJHnQFCeTsJpddW0AxI6JPCYfaVNtL
         eFMidJeAkI2xGUhJXEaLBuZhgj8BEqHDJtETlwr8g7zbNuSr/1gbjR75Y1dhugJvgBii
         +oHvxWq0oujSpOW1EgIkyGWckSwPvX63PpUkbJT78a8jpksecGe1f6+gjFxnv1+5k0BL
         jFYw==
X-Gm-Message-State: AOJu0YxcoJt1+ZUfXT6kUM1h5rC+imwRj6oRKkulhOAVHhhmDAeSTe/S
	U+nl9izmC26Qz5erOGVcZZ8evw==
X-Google-Smtp-Source: AGHT+IGjPZ9tpAlShZ0QPpySXzyhCBr1xtf1fcfhMo9RW3fvI+GuhFJT9QRkEKU0ndTsgjkMEHz3gg==
X-Received: by 2002:a05:6402:50cc:b0:530:77e6:849f with SMTP id h12-20020a05640250cc00b0053077e6849fmr3496073edb.27.1697604648893;
        Tue, 17 Oct 2023 21:50:48 -0700 (PDT)
Received: from 1.. ([213.233.104.181])
        by smtp.gmail.com with ESMTPSA id n30-20020a5099de000000b0053e469f6505sm2196878edb.26.2023.10.17.21.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 21:50:48 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mamta Shukla <mamta.shukla@leica-geosystems.com>
Subject: Re: [PATCH v4 1/2] mtd: spi-nor: micron-st: enable lock/unlock for mt25qu512a
Date: Wed, 18 Oct 2023 07:50:44 +0300
Message-Id: <169760461825.6371.1786952858220503854.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017074711.12167-1-tudor.ambarus@linaro.org>
References: <20231017074711.12167-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=620; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=4Fa79AGkAfQS2RZS3SU5DMBGknFdIGFh+yLgsIhDUqo=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlL2QhQML57IIx5rz4mOWlvdIvFXMR81sXg9IoH QRIeZY0xSSJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZS9kIQAKCRBLVU9HpY0U 6bRJCACYL8lhh1R/Aij6phFer7+gwBjqMQkfg7oa5Ym/dcZaymlmbh+k45ldRFvuTWs9Ir5ucaE pwyNWMeYoWu0PpUUn2TV8e16j/cPgngkpSuEcFGC6PhZS+Y8kDF88cS4sO+y7tqqdnAbcnH8lr0 PusnqogpAlRByC18InUI+kv1elwABndLpIBXbMwK+FZXpaUeLk12zai6QyqmLkwmR8XCu7LJ3H2 YjriO2QbJsKXE0U2jXGoIbTEuwfIOKITn3RaznJxoAvPRnRF2xA7hbfwCSRzTA8Dq/GySveklwd 2JWbJCgW9AGhp6ksa56iqjKa8BN/sLzrAUsQbhXGDa0yc6fs
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_215052_281348_9EDF8FD8 
X-CRM114-Status: UNSURE (   6.70  )
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

On Tue, 17 Oct 2023 10:47:10 +0300, Tudor Ambarus wrote:
> mt25qu512a supports locking/unlocking through the SR BP bits. Enable
> locking support. Tested with mtd-utils- flash_lock/flash_unlock on
> MT25QU512ABB8E12.
> 
> 

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/2] mtd: spi-nor: micron-st: enable lock/unlock for mt25qu512a
      https://git.kernel.org/mtd/c/a2a3e5430e7b
[2/2] mtd: spi-nor: micron-st: use SFDP table for mt25qu512a
      https://git.kernel.org/mtd/c/6823a8383420

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
