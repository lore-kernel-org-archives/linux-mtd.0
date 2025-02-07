Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23C0C02192
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 08:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0L9XhCeb+omYecVs4JkHMpRoz3uXq1seuh8c33NP4IY=; b=tru441o8UlWZvq
	DTU+vGxSdhxp/fGawEMSXGhGKFa076E4Iw1X02CDSkxOpVO9CF3vq3QFD0rUaK3KLSiLcynhTd2rf
	EKYiEUL5PrOSXhNlCtXT9mxgMz6Ll2pwdIjzh/eVgwmv/JYM6pcbCPrRUwly3ursiIGkyyNdJzaqJ
	HbvUXdBxYDGnyc54s3CFYeXgLPk5wPs4n74Yh5zaTCOfvCSknRAKECM6zmwQqvhimCUrm/ksgWuf8
	hLoYZvJHfz77VxfPzf02ALo//sfTrKefH2qMEsYwZdA6m9Rv/JPaJcW8Wgi59CbZwCQWdVAVKWvCa
	ipvZKCRd6HF3DV6+yI5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJdX-00000008nOZ-2UrN;
	Fri, 07 Feb 2025 08:22:55 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJdU-00000008nO8-454z
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 08:22:54 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21634338cfdso43856135ad.2
        for <linux-mtd@lists.infradead.org>; Fri, 07 Feb 2025 00:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738916572; x=1739521372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6NAiSeXeQFULPrsnR71rc90kNrIOq9STMbYBYT8Gxm0=;
        b=bwfsDo3o6OfJno2OiiGmTWglJoumqtz7ktUDsLx2TBg4LqLAwYO69bXt0wpJmFBP0T
         pkvKy7D4UH4czq93M5a789tVsMlfOHlIU0P9ds/DK4rzAOS1CMHHFkqRTrSWWbQGiSE8
         tqaGlriD6kC2e6B+Plio/Vs4DSq8V9UUkWkwz18kCUgzdRSJ2T7jXyNP1nd2mJuWKqGA
         7pTp8RfL5aWz/uXn5oh+kxZYX9mmYyTPZIOadYnRaCQIMUASh/eaOJhe8W+3ZyXlqQFb
         m/KioYu+SR7g4L45frzIOLiGBNX9qALrpcWKnkXcMqs5bRwSXyHPXRO27xEJjUC8JLtS
         ua5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738916572; x=1739521372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6NAiSeXeQFULPrsnR71rc90kNrIOq9STMbYBYT8Gxm0=;
        b=gKWbpMdbKxOwrNVOxDM1hOGltb9g5Y8Vn3ruD/1C0sQ+rdUwxkyNbnaqyarek7N2Bl
         AV92cxmJeL580W3hQUX40BYLtdyUV1Ee1BKHjgj6Pgvw7P2uBxBmAYvTQOOch3lIfBwz
         MwNcq5odTGS+eXHMViZm63O1FiomHE/G62JnAnQrdvGUp7bkOw4oQ94nz7uUUbOLgOUq
         5vJ51PXODi/Q11yKSlj3jCjeEd/Znf6CZGpokaHQSrL1lq5r7hfi/HfCS9UslE/4XCCz
         wyszygVTHn7jhCg19m9Wy0pDYBceeZDH3RO9qyf0EYdKtIWFSuoCPpjbl9XLjGRybLPg
         OR0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJCf8NBwhkbtS138MKRWRwJLxmcEedbKUYK+663IU8UfAcaS9qqoRuhIEZzDRVtK3WWeLggnnF07E=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJu8O4zrUDTvP78nsf/lz2yiQzOT6SFEq6YUQ911eoLs5jDfc6
	TAMsThHl8gOXYajBOMU6PIMcfSYRY8l7Y1HzVhCftPsNnphXan9T
X-Gm-Gg: ASbGncuMJIlevFGejnZ6Suc2TKlNGP8jbew80ZtceKvj62D2awx9CMmItoHgDpNnUMF
	ss8TONHLM/qsgPzBsWRGhTrs+0u/9cHlUr1IR6fVs2qDvt4gdInTcANnL9h/arZjQYMlkNmwpfo
	e9X+nSc+C7ec/O0127+Xukolj9onl1kiFwURKoipS9nDp746+S/iQ+uPYGh66S0dLo+zts3LElD
	kIloeyqc99ujKavlRXG+/uno+L3rMzNzxsci8vxsvHqQD8Vq//MtVoZhXNfamd0a8pCiJ2bpEkI
	tMTCtAWX81uqMAUMNiKDHddFkCT3RHP2bqB8a/U=
X-Google-Smtp-Source: AGHT+IFP0PkPcC8YPzxgcsn383QzhVWpFbsKFyeOUFvkKYl2b4/vjbneVlGKNLVhDvHbWmtj7ciQIg==
X-Received: by 2002:a17:902:fc4e:b0:215:6816:6345 with SMTP id d9443c01a7336-21f4e6a9ae7mr40673995ad.16.1738916571721;
        Fri, 07 Feb 2025 00:22:51 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09b3ee3csm2748197a91.31.2025.02.07.00.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 00:22:51 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id F16F6805EC;
	Fri,  7 Feb 2025 16:33:26 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 0/2] Add support for Quad Input Page Program
Date: Fri,  7 Feb 2025 16:18:44 +0800
Message-Id: <20250207081846.362919-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_002253_011662_66769152 
X-CRM114-Status: UNSURE (   5.59  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Support for the Quad Input Page Program feature.

Some Macronix NOR flash support the Quad Input Page Program feature, but
the 4-Byte Address Instruction Table definition in the SFDP is incorrect.
To properly enable this feature, a post_sfdp fixups implementation is
introduced.

Cheng Ming Lin (2):
  mtd: spi-nor: macronix: Add post_sfdp fixups for Quad Input Page
    Program
  mtd: spi-nor: macronix: Add support for Macronix NOR Flash

 drivers/mtd/spi-nor/macronix.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
