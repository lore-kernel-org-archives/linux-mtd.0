Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEC2D41D68
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Nov 2024 07:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bi71VrReFn1GThUGyFWMr595q7awrcWvz5Zb/TEM4hE=; b=zkcNoZIIU8/snP
	ROV59Je1yNRPYXSfN1iD3LSfBHkfdHg1UWNNl9z3QFQOLsBto8GoCTpigQmHdyx4RU0p8V5Cl5VGS
	20HpunkFsOxCE1jd+LIYsIRvMv/WjjM3PnfXNNPLWRDtA4Q63M8ZGETTTCmKmNp/Xtqhywsv1Mufb
	ODoLAmrTVGVbQ2onMgqvVZiR7y2wmLAknSQJfXR7Ot6XRB/RU2SVnoKXIE+QcQvfIYUsrBwGND1gy
	8ecRyZbUO/5cUDqqA49Lzvl1STqUgstvfMm7NYzJeUixhnA079z/i7YOAgYnvdPcvF25sIRmYCsNW
	8HDqfEaFJpfNRvQN2amA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAlln-00000002YPt-19SX;
	Tue, 12 Nov 2024 07:57:03 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAlim-00000002Xq4-2c52
	for linux-mtd@lists.infradead.org;
	Tue, 12 Nov 2024 07:53:57 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-72410cc7be9so4324263b3a.0
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 23:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731398035; x=1732002835; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LUwAJIZH9sTo680OiXmze6FtZ8WG1hRbdJzQt/q5QBk=;
        b=Sb3PMa8zwCmJ4kZEXzdNFB4q4vMDYi23Twerbl29BwnYQsQaY/ILFReS3iABSI6GTk
         rxFahFNJ67D1vyCOPusEr+wBQFmGEJdvPvexzQwYZGHPKVNjkDyjPybbFSJRq1r1Nrwp
         ZikVJjYFXj982u96Ir0GFLQuTo0VmBFbcr874XJwdmOpuq8hyEXmsdkhCWx4iQk0YzWv
         hB2SIQNHVHdDwXCfMwXNKlr56C7ZjzyWs6wyb6RgDSYMMgoOHXtCdPbY6SjWKZk7RxP3
         mWwovsV50jLsTJ6XpyEAp1xtymfF/A2r5RABNxGIhWmzi97FW3Ir9FY1Lr0/TjtOmYRw
         ZWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731398035; x=1732002835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LUwAJIZH9sTo680OiXmze6FtZ8WG1hRbdJzQt/q5QBk=;
        b=rortg40e2uYeWN3dRi+ay3KvluKLzx27iEX4s8CGlQpi1+fkcDQ4W3df3TA6Yy5M3Y
         JpvjCbclh7OCCFKNlpqRt2bRaYLS++mrImMtJc7+UUOUEyqHJtHKzahFaWeGzZY6Wxp5
         fgJrpB3bO2ky5D1OXoLEvyjgJOwvkg/uebmBoTB37AK6uQPhNfe5kZEMkFoFVCFYvNEg
         TqjOd0BIMtCmRLU2aZNY+P0Zi/kHLY0RDj/3Tygs4lBBouz0kdHmzXUDE4UAgxRUFBa6
         o8Httb1sx3VJAm8lXbuGfC4lMc+CvKuaAb29Y53vvZZYrOWCb7e4mlS8ndm1Ot4k0xIo
         cQxA==
X-Forwarded-Encrypted: i=1; AJvYcCW0UMRdU8r4PRoGxmmLQ8FczwDmLDywQ+ZDwl2Rfb0f3oitMvNe+GcaOgv3rLmlOB1R7SJzp2GnUuE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwnSrrt2fz2dx9EiJyzG28ICBP1+YTXuNbxDjm6JdzI44tX6LQe
	vtOeaiki9cTFR+2FrEZaIv56Xi3XdBF59BnMSH86yWm9uQ0f1+4z
X-Google-Smtp-Source: AGHT+IH4leXedmlfE+VTVXUnzIMfMbk7THOnMiR0cPkkaSiIWMOKES5RK1O4lVDpN+mPy3W5vAKqWw==
X-Received: by 2002:a05:6a00:2e1d:b0:71e:7c92:a192 with SMTP id d2e1a72fcca58-7241336afb8mr21476069b3a.24.1731398035391;
        Mon, 11 Nov 2024 23:53:55 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a17ed3sm10798564b3a.142.2024.11.11.23.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 23:53:54 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 9659D802EC;
	Tue, 12 Nov 2024 16:00:23 +0800 (CST)
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
Subject: [PATCH v2 0/1] mtd: spi-nor: core: replace dummy buswidth from addr to data
Date: Tue, 12 Nov 2024 15:52:41 +0800
Message-Id: <20241112075242.174010-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_235356_682072_F3414B4D 
X-CRM114-Status: UNSURE (   7.91  )
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

Set the dummy buswidth to match the data buswidth.

v2:
* Add fixes tag and cc to stable.

Cheng Ming Lin (1):
  mtd: spi-nor: core: replace dummy buswidth from addr to data

 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
