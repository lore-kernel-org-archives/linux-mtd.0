Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A13E7718A
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2024 07:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h98Dt18/46AM5rnoQPte6oeMQzsEXXHzeCkKKcuW7Hg=; b=yCyfyAR8W77bhS
	nxCu53ILTU95oad1TTDL2yaIpNI4ibxEZ9BzkgPJv/RzPGfNqtx6eg3F1OtJBONf+He+GqP2U8ccw
	ygsLChzyC5tfJKrwzmZ5nQ2BXnn/FZcJnSYYiFlRBQ0AAyqZ26/FNtSlMS0DGvU6c4QQyooggDjGi
	kflyhX0pQLFGp2jDzcVVNDB5RiFjRxKZJ2Jji2DSo/S3MsyX+q0mivydt/eEO9sxXMddtBKq5fgBA
	2rjCPme7KfMy0jexQ4VYF49n98asw9ycKadvlfqQPMe3tSNEQ+yuDA7l+0OM1Ul+NivWAkZmWLrDB
	l/Sk6h/H7jQRjq5keLig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOAdG-00000001231-2Djn;
	Thu, 19 Dec 2024 07:07:38 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOAcB-000000011v8-112O
	for linux-mtd@lists.infradead.org;
	Thu, 19 Dec 2024 07:06:32 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-216281bc30fso5638375ad.0
        for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2024 23:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734591990; x=1735196790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mmGEpQO3Cgb0pPgwtxOnEsAs/ybMwGSnD7wR6t7yEYQ=;
        b=ntFkNMTv0izRley4wFTYAWVOeKpPMJkBPc1uHDmGAtl2XQdcDgE2hXPrhLHlrYQZii
         nIwADmXgRHrVeoYKuh4DYtKUCzcb4nG/TYgcCQC6+aiPFbZUCy806E6hbxwDYtzGhELF
         MNyV+e84HPnnw5omHejSVi15dYGt72WRgU0dH70FLJ/kxf4FKrjsrimKMNexGSGBM2pU
         fkCLRGGTxONwR0EAE15gId7QSd8O1JOIS/jEwQ1nvbfH7LIviYVj9wc/no5LFZRnnc8C
         NYWZNufVzmHvZSwEuZRfgl5/83hKQrJBrh6F9AWOWcKAI7o4k93hJpkYUlY0zIbhOmMl
         soFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734591990; x=1735196790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mmGEpQO3Cgb0pPgwtxOnEsAs/ybMwGSnD7wR6t7yEYQ=;
        b=AVbtRKv6h3LgjPLci48gcRjGVqUVnnrsLaDI9AhoBQxvNA3v68BnAaO66PVh7yZc3M
         HlmIHCslV+v7DGFfA677R1wZnDjRpAvuYs3dk3aNYF63rrnvP+4FChhz7sZV3PVVeb+7
         isvDL7EVugw7ARbN1O/wCPU05lrodpBFHQclslbF/Hy+Fa6mtYNQWf8aoAafqx9PCmqv
         PKCVp3H/sNAEh1a088tljHcdMx09ouYTvNU6vdsK6E08aWLRZWMZj7rMhAPZGOD3FvZv
         Z6rgB9sC+Knv9MXdFUQGl4+Pv9qDO416ahxeeSZKHvWY4+WQLLxeVNp8mkkYyyrN+o/v
         qRRg==
X-Gm-Message-State: AOJu0YwzviQhFzN/Dt/N4bV3g6xSUsYu0Qg/DfDCfNQ/yV2KlCpNHyjZ
	h6fR43dn98JSdDSyU9IKfk7YZMb6rkTNxnYq3pwqZII3ywUoDv6Fevcd/w==
X-Gm-Gg: ASbGncu1CnHS2gCam5aCyMb29ggto7BPN4UiwHvot7I14XFV8GowLFnOAbXdMxcGI4X
	gxGNutpgbQMkn7SQ/5pH5X7mpqYPcgEswfKhV+vUY9A35dCywRI5Nyhnl3BsBk5HmNoaOfShm3o
	EL5B6pD71K0Tn+QsGsByE5zYbaMSLOyR/lL2ERnsYpGSMp0NC2yjJl4DkwQJb7v5ml4fIfF5t/z
	0tpcA3pGWl0hxXzXO0jkU56vk7pVKFPnP8rlA0tEESkpcARWI/Brvwd0ndWGG3TgDQfrcLjwHkQ
	nbwagCxT3troYrdZ9mx99nq81iXVvdF5qrCQIwqlmrjW6cf2lQ==
X-Google-Smtp-Source: AGHT+IHeWvFPuSJHU2RMB1Gz9K+uXCQVfB2jEBHVSnoxdNkKjfwevrBpjTFzhHb5ahFsHpFGe9xn4A==
X-Received: by 2002:a17:902:f64e:b0:216:644f:bc0e with SMTP id d9443c01a7336-218d7216f37mr85077645ad.24.1734591989399;
        Wed, 18 Dec 2024 23:06:29 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b2b3e80fsm445529a12.31.2024.12.18.23.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 23:06:28 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 0/2] Add support for Infineon S28HL256T and S28HL02GT
Date: Thu, 19 Dec 2024 16:06:14 +0900
Message-Id: <cover.1734588106.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_230631_277832_820EAEF7 
X-CRM114-Status: UNSURE (   7.43  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Those are 3.0V, 256Mb/2Gb NOR Flash devices with Octal interface.
Same fanctionalities with 1.8V version that are already supported.

Takahiro Kuwano (2):
  mtd: spi-nor: spansion: Add support for S28HL256T
  mtd: spi-nor: spansion: Add support for S28HL02GT

 drivers/mtd/spi-nor/spansion.c | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
