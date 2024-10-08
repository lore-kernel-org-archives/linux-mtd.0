Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB9ECED270
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 07:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4Ny9rGePqwxM4LBibCtC9m/HNlcuqIy1ST4f2kA4yQg=; b=3+/Ir+LbDmaZ0L
	OjJmZ7xyta24TC7RTQAsKL31zYtPhzXfrreF7Z6S1/jjgeeD4QnX40e7jj0MxQV4NaZuiMBI7gjRZ
	u+HujhLy2df/smwVNWMHofrqvdZmA+8wpg8uj4a8LpGtYZIjj63UemYHvC6mBwLaxzCdxT528Fel4
	UfXjgWrDLqHt4OSib0EkuKurMuH0c+jJxkabf4CDsT/BwuEmE488UTHcJsbCddcJJudwH9zRh5zE9
	DWtX6rzTSFAL4CGY60t5L/aArQFNtxLydc5wK4dpDYLUknmGrBqCk11n6ROzBZ5oCv2w/CNP2CFm1
	q3tIKHruoKmRvmQ9iadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4H7-00000004k3r-0Voo;
	Tue, 08 Oct 2024 07:04:53 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4FZ-00000004jlX-2LLk
	for linux-mtd@lists.infradead.org;
	Tue, 08 Oct 2024 07:03:19 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2fad100dd9fso72409471fa.3
        for <linux-mtd@lists.infradead.org>; Tue, 08 Oct 2024 00:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728370995; x=1728975795; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3odNuYZMIed7GPFFvu+8iyQutKfD23rD48CKfcifKo4=;
        b=UfyWvnwg1RLwY7PX7pLHFfldrvbYdVuDlDFPPRg0KP4Q5/9fPzb5CNd7wCx3d2pMXm
         1dfI/9R63QqnjTma72u/1x6rsS2C8gCI3GcPc0KcyWZoWEkdIh+wp05LAdEIM4d52rn+
         S4RTfBXL1aMGcp4LPwR8p+sKJkFk+YI0HmXp1ZsE7t9DfjC4/F0qgXkwWvFgCApLx9pP
         NvPzIx3fXQnrfMvpC0WI/p1wEROLQCz8TSpkzKKVLTqJE76Nvt8SdDGjX31aAvlcZ4G7
         dL5jnjFzaUGIYaVli5271XZiLUFub7pyIqtBXJksjB/uSRPZT/qbcbBnBfCk0SVo/HF6
         TOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728370995; x=1728975795;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3odNuYZMIed7GPFFvu+8iyQutKfD23rD48CKfcifKo4=;
        b=hR1dKSaV45aX8zBAZLGq0zCYDujXK0w4I3YiA73Tso2cGwK06TsdVv34sa96GJ89tj
         7QSrE3S0Yw2R0E4ww9iTiDYzEFQvmE18qlIyAcK833pC088wPMzguSG4r8Y9JITQFvOb
         YschA152ajwQTnN6ss/Luw79yy+/eMmvlgT+bpwdFJtCeEC7Da0NUlrBytPDfgiGvrUa
         erHmKq2mD+bUjrRYVFZB4mbu6ACVP5H6qsDkZGzqxQYiidQrgrxs1779jf8KMRBUEgAy
         CrNYam7wFaTuxTNpIXzAZwoC3EZVzsISFJ08iEI8gRlbkyT4Y9u1dxLAFY4tW+sib/mW
         Q5wA==
X-Gm-Message-State: AOJu0Yzj/2USTwlGYX/GQFCdtjz5GZNo2d4NlYr2bxbDeae6B/a5VKEG
	xd7Nat+lLBLOfy3c9D+EvgAG2KiAIteybmbt15+Wl1BrwIMq7jJe
X-Google-Smtp-Source: AGHT+IEfNLkriaz7+/4s5VSk0K+230xqJBPz5JzlUF4SD1mzhZtYMEhqghlhFXeJ3pXae7VqHj1GWg==
X-Received: by 2002:a2e:d11:0:b0:2ef:1b1b:7f42 with SMTP id 38308e7fff4ca-2faf3d728a6mr70396921fa.36.1728370994290;
        Tue, 08 Oct 2024 00:03:14 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9ab1564sm10972441fa.7.2024.10.08.00.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 00:03:12 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v5 0/2] Add support for "on-die" ECC on Davinci.
Date: Tue, 08 Oct 2024 09:02:43 +0200
Message-Id: <20241008-ondie-v5-0-041ca4ccc5ee@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABPZBGcC/13O3wqDIBiH4VsJj+fQT226o93H2IH5p4SVQ0dsR
 Pc+C4LW4e/D58UJZZeCy+haTSi5MeQQhzLEqUKm00PrcLBlIyDAKSEUx8EGhzVx1niQXvIalbe
 v5Hz4rJ37o+wu5HdM3zU70uV6LIwUE6yZ1dpRYaSyt7bX4Xk2sUdLYYS9gk1BUYxKKmorzaXhR
 8X2SmyKFcWFssowABDmqPhe1ZviRXmvGuWt0pL+/XCe5x+s1i4jPAEAAA==
X-Change-ID: 20241001-ondie-a0edcf28f846
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=v1ryDfcLRmbqFdjGYQserfXxFAXhoyLUU4PAJa6uujk=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnBNkYO4fNCiJWIun0WJ4yoyLNkBfPwNopdcJXH
 C1z8bQmHzeJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZwTZGAAKCRCIgE5vWV1S
 MkT4D/4oMThEmNMRBinGponXs8SS8C4WemPlMSCOlJByVJS9uSrmfMOXeIbLF2AIWVknh0/Cx2m
 ao0bhsEQU5qyM0l9UayNM4aXc5NTlQMwK4zWhWR2RX2tfrypaTTkWyu7jQyWqH/nkHKolZ+MENT
 3+epYzHGEFNTrkVReJk4xprZXSwmVK49cRxQNdfwH9rBaz/SKZFebf+rvVWHlL0AAdYzO2Wt4Z5
 xroLG5c+HYYxwJyZcP4FjkeEjRxX9GYNOU6+V/UP9FKdw5+1mHHWUEFuNghH2sADFRrdtWDZIZt
 qhoEGpDl5f4OYCvD+TyAsYE8FfXGJemMZTuPEmT2liGLZSFq7lKnTGNo7ERf27+P8M5YKZ1vmvK
 3LtWVxXKrFF4NcqbE39a0wwaey+wlDig/Pd08nxotzR9ojg6snvBHqVI44ClYcSK83fPo4apUY0
 VQEuDm7+S5q1lSwlmb1WuLnvitusM+pHVMT7BF5li5ZZoR9OkmVf2tNcPHCokFCGKDTKyllFH+a
 0Vy2hkJh8fKH038yxQVZPXrQj9veF+cZR12Suc8tE/wl/X4czzU5i9ZCNgGtPwNAnarSs36vmR/
 dHMjRigHtu3AbogwNtULF3XIVlC4Xm/77Z3U3Fdjsl2tjKpEacW7K4VYSTsYFLtcsoBylqCaE0d
 pmX49IGcKTkiq6Q==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_000317_632585_B3CC7207 
X-CRM114-Status: GOOD (  10.28  )
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

Some chips, e.g. Micron MT29F1G08ABBFAH4, has a mandatory on-die ECC.
Add "on-die" as ECC engine type in order to be compatible with those.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v5:
- change "additionalProperties: true" to "unevaluatedProperties: false"
- Link to v4: https://lore.kernel.org/r/20241006-ondie-v4-0-ff9b9fd9a81d@gmail.com

Changes in v4:
- Silent errors in `make  dt_binding_check  DT_SCHEMA_FILES=ti,davinci-nand.yaml`
- Link to v3: https://lore.kernel.org/r/20241005-ondie-v3-0-459d9c32225c@gmail.com

Changes in v3:
- Fix formatting issues in yaml file
- Link to v2: https://lore.kernel.org/r/20241002-ondie-v2-0-318156d8c7b4@gmail.com

Changes in v2:
- Convert dt-bindings file to yaml
- Link to v1: https://lore.kernel.org/r/20241001-ondie-v1-0-a3daae15c89d@gmail.com

---
Marcus Folkesson (2):
      mtd: nand: davinci: add support for on-die ECC engine type
      dt-bindings: mtd: davinci: convert to yaml

 .../devicetree/bindings/mtd/davinci-nand.txt       |  94 -----------------
 .../devicetree/bindings/mtd/ti,davinci-nand.yaml   | 115 +++++++++++++++++++++
 drivers/mtd/nand/raw/davinci_nand.c                |   5 +-
 3 files changed, 119 insertions(+), 95 deletions(-)
---
base-commit: 200289db261f0c8131a5756133e9d30966289c3b
change-id: 20241001-ondie-a0edcf28f846

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
