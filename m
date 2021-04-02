Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2CBC433ED
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 15:03:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A70961029
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 15:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A70961029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5Ib6tvKLVT5OFYvHdMzx5cdtwfAJTJzvfy+jH0blGuA=; b=IPtxZXpZm9epuX0//XfGwgSZG
	OvD/ULen46Zs3TrYI4HNmhqrZqNKiuR7QHh+AGaKTbVwni9ytOtEyPBZVIBVAipmrh8AJ6omUvuLE
	xYTNr/nqo8D36RC5oJ2i0ILGRMIiMzlRjUJObbNJo+95P3DYi1OWruBs8fYOHz5YQi+JMXv/1pi6/
	zhE/8/hwmj4yVTOMuDZ+/K3uapub99aQWcO7jp9bD065ar0fhGiBKaAJaXKB41Wz0w13gSzXAoNDQ
	X8NkcCaZ95UTiPXBDlgZdSI+0uMqY7tZjoTAZnUivVcxF/JEhJSsfqMe/0byUs2gzzeKgFBrLwULf
	KszrOgCFw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSLJz-00DAXA-60; Fri, 02 Apr 2021 15:02:51 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSLJI-00DAO1-F9
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 15:02:12 +0000
Received: by mail-pj1-x1031.google.com with SMTP id s21so2829438pjq.1
 for <linux-mtd@lists.infradead.org>; Fri, 02 Apr 2021 08:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ww076wtEw/l52B1eQC1HZmnMQQ8Ebtr9JfK+3ViX3so=;
 b=ybrJ/XWa/mCxIE3noK0GCj+uKoLYgbMhcMQgqAAFk3B5fG/hCSYv/F1qtTUUcWn2Mu
 KxjVFEXJv/ORf4CfApwFggSqAln5Z3+I3OeriRpumvglfjwXC6h7dhcMnPmo07QJ/+ZG
 wwHjxZZb0wehKDxWPQ3AgMwikrdDxH05aNo11bZYQFDvjaEI1ie62PbcR0VTcNg5pz5n
 cAwjmX45Pn+yiGFbwQ3PqPvCRzA/Won4h4uiO+pCtAc2G9jgY63mG50TtcT9rQuodYpf
 XLU5cPfAZmlgju7jpwNLZsdsq3RtrSCd+icLLJESKQcSj5RD+fFev/lCAQ92Dm7dekXh
 GtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ww076wtEw/l52B1eQC1HZmnMQQ8Ebtr9JfK+3ViX3so=;
 b=LbmmNW55hfT+Q5mfVcJE6KDjGlTuIYJCBeLpdV0Nz5X3mUxHOY3E6+W+UAIRCe54jU
 1JzMZKwe71U+eIVkZV4GmzxYAmQ+1l82ghaN6ckcfI/yO2/6p9Kat+rwsSNm7FChk4C0
 /0zRGg7Qt1PMY9xY/h3GZaJQ31DC8VScruCMP/ggbyepT61czT0E4508PIS6Wt04DOgj
 Mv11/ikqmewJl+oh3pOdaP4zQKltJYfVOPNh4NhPDDF1XpFzm1PoLjWlV8GtgsfAXJGv
 aMJ/VzxJUI2aVYe0M3LcmfVepry9X/SLKVgXnUo/t8CPGr4MhAtXR+RDR98OzHcWv43Q
 heDA==
X-Gm-Message-State: AOAM533a5Oa4TIP7/8eluhe1/k3OzFs9aUvH7WV39Sm9dShbSqcJ8gZa
 KvO2WJaLJE86XB22RK+7nHRK
X-Google-Smtp-Source: ABdhPJxz13FLUMPQqOofA5mU/CiwuDuOWUytmngYWZcm28AENSnwG/TOkh7u7d7f6fDaW5lwBooosw==
X-Received: by 2002:a17:90a:c249:: with SMTP id
 d9mr14444710pjx.104.1617375725992; 
 Fri, 02 Apr 2021 08:02:05 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.174])
 by smtp.gmail.com with ESMTPSA id x7sm8773647pff.12.2021.04.02.08.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 08:02:05 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v11 4/4] mtd: rawnand: qcom: Add missing nand_cleanup() in
 error path
Date: Fri,  2 Apr 2021 20:31:28 +0530
Message-Id: <20210402150128.29128-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402150128.29128-1-manivannan.sadhasivam@linaro.org>
References: <20210402150128.29128-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_160209_786887_A4737AA7 
X-CRM114-Status: UNSURE (   9.61  )
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

Add missing nand_cleanup() in the alloc_bam_transaction() error path
to cleanup the resources properly.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 87c23bb320bf..fe74cf3aece5 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2882,6 +2882,7 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 		if (!nandc->bam_txn) {
 			dev_err(nandc->dev,
 				"failed to allocate bam transaction\n");
+			nand_cleanup(chip);
 			return -ENOMEM;
 		}
 	}
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
