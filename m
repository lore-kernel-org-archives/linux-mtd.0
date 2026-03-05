Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B72F513E7
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2026 22:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VJ1UEJNWvI2OEka28XdjUaEfMY6sUI4Aae/VBTgEk4A=; b=TPnhWyY2g03pur
	GkQ1QQGPfBRQ2c/wVfAka+imG6LTKMXTUzdgDNUmeCriCTmdUYF06pHiZGqaVjkB4SnSfIgG82Dra
	CIzRv7mIO2ZIKF9BJCK5BmaMIk6ZpTjEzUkILQgCyCfiVXojSfgv1j5A1/2Ydhr+PbFqn+dgqpn46
	BD0mB01CXRNwM79HN0JPJIO+iZ0NGeHuI+OCzK2KG7N3X75bvOivkfRCx7CoQCYPZJTsSFSYXh/Ds
	o8wRK5vlMnTNjVUcY63fJcOKsjKHdApNcWfLI+KMvR50SDwdC/flDsLb3JkIlGpr3z05ry8fevFTE
	wEWoGtxcpv4aslAwWeZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyHQl-00000002h8c-2lXb;
	Thu, 05 Mar 2026 22:44:31 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyHQj-00000002h83-39t2
	for linux-mtd@lists.infradead.org;
	Thu, 05 Mar 2026 22:44:30 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-829781b2b01so1428210b3a.2
        for <linux-mtd@lists.infradead.org>; Thu, 05 Mar 2026 14:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772750668; x=1773355468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iBOQeouQPHL68ELqihtmFwL1QfT6rkZ5FJ68dANzC/M=;
        b=gSU/HiHW/t0M58oceSyRylZHzRi9Wnlg5diCqSTGgsrqixvlgXtkXy0CbQV86XMZw/
         7o6OVyzkmTGKxOUkSsgYHGqFzeb2OIGMSwR8Dn69ol2TNlT9ZAXK/cemBj5j7kjdhrn/
         gesHZijQ5YxzFw/N6NPzKuAgot6toNXQLvZbpZobwbbjFGYefCaOK6gN82P+pFLzpRXZ
         Uc71sB1bRDU2Z8lcAb1JjvWgcMchB0nygBuiJLBZKbxZoH7LmFHIQRl7GKPt7pLbnWY6
         Ld5MRYDBmEdTaeWPSK7ojj0HhypfC4tzf5dYXxAWSvpy35l0JWllNRXxsAQ91biCUB7W
         o28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772750668; x=1773355468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBOQeouQPHL68ELqihtmFwL1QfT6rkZ5FJ68dANzC/M=;
        b=b4KUvLQhkDw3s1UfmM3uTgOfm5yEDXFk7v5MerXwYo/tQTJzZR/odizLbkGKG3y9NY
         l4BBiSKoqDsnkezwGYqSo7LfvNtSMnHsWZAj5v67CrbdXl6VGbEKjt+sSbizuPQcHjLj
         gy3OJ7arQEGobuOnI8zkxbefqCqAaLfzEZG5WVYKev4um7Vbg02uN/ppISJWtqa/oTDc
         XsrGkAMzQU/Pn0f5xxLezVn0UkfwGeSHIuX0fwNuVnl4BUgfhtfiSqqCvFbJfPLpSPOi
         qFK0M4pW2KJolGpL3FTpwQ6nAWVYDgKY2yGvKMqCjyj9RFvrJuVwXpuSoCf026w8WVSX
         t4Sw==
X-Gm-Message-State: AOJu0YwAvt3WD+Z5QL+PR+HoTWZgPc048Koi+gLhFs+5Ukeu37O4u+eW
	ugvz0kyQQIVNscW7zTht20afJiIM5qedORiQQNULCU2NwEwAU1fjCDNdlG07vNah6SE=
X-Gm-Gg: ATEYQzxJRYxxnr4VACgeyC89pGFjWdhJ+iV15OIA1RpGbC50hTL+H0FclBLGPl8wttN
	5gfbhs8+tNWZL7ANy0ClOf308s7KQFc17Ou16ShHE6hy1Gj37bnfe3eNkoTX0Fd+NcBMVzyBMve
	U9Mnykj1XDTFirbs6J8titW+Jf556QZtJG1T5B/8+jQL6OppV1Z7fJ8dTL2eOAq+Oh2RuZUSUpl
	Ib3j7lfHB5henMecp1EeYv7B769lynIkym8Y6/lackBwMpTbtS5OsvcKdiZvZt8CrU6mL6rOqcU
	CEugIIbrZ/M2pImPra90nKK+h/rPVpYZf7jnlzQ7lb6OyPRp2li/XGBg/2ro5xDR3ntRsyoEePS
	jdhwhuF033OIKMA0GIGwPWqcA//zgj7wIH03IE1prRvV5Z5Sgk4VRCcVxhWke56lFCOmfblqagR
	KCG2eujPvC+Fni7lb6CZdcWdyV957qWitSvn8RqHbgrfSICJjcgK4v/A==
X-Received: by 2002:a05:6a21:4c11:b0:38e:9ebe:525e with SMTP id adf61e73a8af0-398590b51acmr141202637.52.1772750668423;
        Thu, 05 Mar 2026 14:44:28 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c738877202fsm3565477a12.25.2026.03.05.14.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 14:44:27 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2 0/2] mtd: concat: use flex array
Date: Thu,  5 Mar 2026 14:44:08 -0800
Message-ID: <20260305224410.14251-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_144429_816099_DF5CFD66 
X-CRM114-Status: UNSURE (   7.62  )
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

Simplifies allocation. There may or may not be missing frees here. One
allocation is simpler to reason about.

v2: fix mistake in counted_by in first commit directly.

Rosen Penev (2):
  mtd: virt_concat: use single allocation for node
  mtd: concat: replace alloc + calloc with 1 alloc

 drivers/mtd/mtd_virt_concat.c | 19 +++----------------
 drivers/mtd/mtdconcat.c       |  5 +----
 include/linux/mtd/concat.h    |  2 +-
 3 files changed, 5 insertions(+), 21 deletions(-)

--
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
