Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B85FEB64DD
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jul 2023 02:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lz/NilPYPMim8qQWQldTIuaJe3S+ycAln1lFxsKFS2I=; b=AyKgjt7kMNfT5g
	r3IDn4Wn3FUZRxz6b4LdxffwQHv0xqo5EuME1Kca5W/gq52D3EP1n+0bgbPDuuCz/LNgHI+316m91
	/18lpv03N26ZM+fwgkXMlqSyhApaN/umDL3YuoZpopv4caeg3r9y6V0AmhBseCVM+cQEB+ZGdjkQa
	caepm8kIsrzh3uk5BYjlRTz/GtgiHcuJx7CgHbq5jaMocXNltzwL/g45XjK/zVP2yoeduHbhI2403
	XZDQAch7bdjGpC1MoccQBzNG4fnM+rRTL5kydyC4VwNxvtiNpAKnM+JsXTPal866VbCbVSskKeamX
	ESSw7zNMKV2akbvZZX9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO7i7-005trh-2t;
	Tue, 25 Jul 2023 02:23:39 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO7i4-005tqp-2U
	for linux-mtd@lists.infradead.org;
	Tue, 25 Jul 2023 02:23:38 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-666e97fcc60so2842011b3a.3
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 19:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690251815; x=1690856615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RIxkAmHHRIWCCyCI0FFzpY0k5Ej15GMXnSL6kVYyZZs=;
        b=neCN+jwP6q5vNNuykPBztWGgajvt8sOitJFZcSYc7iQnE+TD/CRvmaOTRoZ8qStunw
         2Y1nJeG/YWX4hkFu+WKebSlOsyjIfbmDOMFc6jAigKHXjddkSeRPKCNNvsP7XnLuiZia
         C8UMc7iCrAdJziozn2RzcTI4lvNkUwCasYK7RXNh044ktLA36Q4ZQfc77ZpAV9vsZ4UH
         4C+c27Vv3tcGx98XbksCWhUTnGB3Tngh+rohnAOGirIjDc3FX+PJ3dvFpEm2GiDAXsbk
         QAh00IaPQYdK4lKpitW8T8Q6BBCpcbmGMv0Vna9fA1LnVEv9jC002YXznhiAK8gYSXf0
         L7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690251815; x=1690856615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIxkAmHHRIWCCyCI0FFzpY0k5Ej15GMXnSL6kVYyZZs=;
        b=XqmBCaIIbfg3pVJQFsGWJUQ3nko2ucnsdgeSUw2fNEfPs40zTIQffvny6IoRZQvlLR
         VjLjAFOpZPFjKi6220F27UsyPh8Gj/uO+r9l7XAucMcIYxeSmF+CymdqlNFJRgCtd2MA
         hcW0QCWwmW4xoXPpi4j5/v+UX5pvVndCVZHTiLNoP9MHJwdA77kVoWzElgN9ftF+wH+V
         GOjGUL4pHtTHjeoSE6VfdNxktnD1Fpnr72AfE/q/8UDWYfpaWMGN2rR/VZKxShI4s3AL
         LIGOWLCPqifguHzaWvvjOo6GilkKlkWlQmzTvkaYs79IR6D5Gl/R+8+wGNNEFHi7B8NF
         jssg==
X-Gm-Message-State: ABy/qLbo0nb+faO2frvdXwqa4f3MdReKj3ue+BuePinZuo2i9I+Fs/R1
	UIdmR87M2OWu9tNlH7O9pd8=
X-Google-Smtp-Source: APBJJlHhIXa1K2qp9Eg7LWFT5zLlzbE7AYuO+R7cFryHOuudJwj/PS7Sqz6w2va9ptMTTdSJs3bBmA==
X-Received: by 2002:a05:6a21:6d99:b0:138:dbff:f41b with SMTP id wl25-20020a056a216d9900b00138dbfff41bmr7086150pzb.27.1690251814893;
        Mon, 24 Jul 2023 19:23:34 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id v11-20020a62a50b000000b00682a16f0b00sm8311095pfm.210.2023.07.24.19.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 19:23:34 -0700 (PDT)
Received: from linux-patcher.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 02CDD808AA;
	Tue, 25 Jul 2023 10:22:39 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	JaimeLiao <jaimeliao.tw@gmail.com>
Subject: [PATCH v1 0/2] Add octal DTR support for Macronix flash
Date: Tue, 25 Jul 2023 10:23:00 +0800
Message-Id: <20230725022302.210275-1-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_192336_832849_6A90473E 
X-CRM114-Status: UNSURE (   7.26  )
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

From: JaimeLiao <jaimeliao.tw@gmail.com>

This series add method for Macronix Octal DTR Eable/Disable
and add Macronix Octal flash support.

JaimeLiao (2):
  mtd: spi-nor: add Octal DTR support for Macronix flash
  mtd: spi-nor: add support for Macronix Octal flash

 drivers/mtd/spi-nor/macronix.c | 104 +++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
