Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74320C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 15:41:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6098B64ED4
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 15:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6098B64ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4++cXmIe5Re8hovI61Nky2wFCZ85Wad+Jo5CQqjfHl8=; b=g2u/XKlXbYpo5lDoGiF50ePhCj
	VGym/qMnFribZEXRO7EW33TyWHAZVeIEUfhrJ9JfLLPNCiRtY5x//KmEbRylTVscPwJEHUacUjPq+
	v1JrIQXyLgxBekCjj95jb5RBUVd3cAzYRAr/2bPCDRbwNWGB35cQGHW8RCMc54AoDbuYGaOtGFtYw
	enypuBSO9BB5rTPzxcGm3aRq/aZmggKRcHxTRSZxMSZk2lHEfCOX4LKcS3OFECnXboE5xhcxjCH/A
	HkD/hJB4f+BFqhntVqmXvDJkL1VtWEazYLPu6YyXERiDqpkRbEbu91vUUIRkpSiqtV0AS3rsY2lEs
	Y2yctiZg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHTcI-005QnE-TD; Wed, 03 Mar 2021 15:40:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSaE-0059ns-9j
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:34:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=E4Ad7Ent8cof3XMClRVgB8zjonCBcH2IrC0ql/TQI38=; b=DAp9CS47mI4HpTyyHe/XjxJMjG
 epGO5eay/btAPzrJrw13QlCr3+b0FBqFs4qsw9rlP05pr+LaLtFWePDwhWCwsFwvb4PX3BC/2mVCN
 fk+xibOSJHj5pzlJtmXEinyHhPwp9fjvwTLMlTEWE8Z4Ae/1h/gC2w5+JhR4HhOAgF60YoLQ08W68
 ec77OHkut9yipHMHbudexQ6+W0dFBvGqhFC1QkfIuaJX3pjSCrrMab6JEJAepcr6zyHVYIYCm0RHo
 +cjLOyXuPOaG30Ojkd+nEIT9J/tEUtYKq4uJHpOP80QIBgYuNS2N58PADahQAfpqRVsEunhNXUzsx
 gqYFdoVQ==;
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH55X-00HBJD-7s
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 13:29:25 +0000
Received: by mail-pg1-x534.google.com with SMTP id t25so13824953pga.2
 for <linux-mtd@lists.infradead.org>; Tue, 02 Mar 2021 05:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E4Ad7Ent8cof3XMClRVgB8zjonCBcH2IrC0ql/TQI38=;
 b=l8tRrWapgbJRkYaus/ItyDv82nTfHZpF6+OqBUdkRkJI7yPujxRr2oz/pyWwuB8LuF
 //zcr6Dk9KA3KMvAtldOErs+j2sgJbzfR2yDp7RauZIsKXoe8xtRbxZwQnAzxmHNvyC4
 8axFWG+9e4S5+caDu3lcpvNs9YuC6VAQynPgBD40VHbDb2pVUzccAipV9LvCHJiSaKbH
 /Da7k8vN/ABqvhg8itwiPFEhpSsjLjJBfVUrfHwyfF4m2KOkhP/7DeOHdanrtrwR8PhX
 u/veZdXSs9qUcc5HiZEbuOwS+jaw0P8j2QfBX/ET4aGv0UdSPM1ggTdbi87MyeuUWUTd
 SnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E4Ad7Ent8cof3XMClRVgB8zjonCBcH2IrC0ql/TQI38=;
 b=XRe9GR1yNr4fKt+oOf4JQiZ3HoZIU4m96NtuO21kswHCRE2C/FQJ9FZBnGzn8ZE+gt
 uyNr3iGgDOLD2H8aw4cAe5HIGaZlv5QrzuAnMW2IxfECCErzpKieE9kkCFSOCN08HLJA
 D+qbiayARdAO7rbx0zY/17Hq9gHiYRcG+8jmnPNFlr/+NBDYOWEw+9AhrCnW3E8gl+Do
 ROBcr2y6AMVfjAfWddr/BogStsnTfo9r5nEckF+dzIVZC1OOgK3LsykC0uRzQkmCOlMV
 OjMOVt3OgoF7hslVTGM7f5EWBfR1FRNI3E1vcVJ9qpjsRfYIegQQO2SCHmbjNG+a+TnL
 iLvQ==
X-Gm-Message-State: AOAM531iSqGLPHSFLp5w0hbG9jaUdFBDfn3dYue5AV9ZBGNeCbxLMukB
 ga+ucki68ydR++3ZG9Itjinx
X-Google-Smtp-Source: ABdhPJzLbkWTyQk4y0GRM9ZfbaZuf3I4UEKB1ioFKcMq2eC/YLMqWeWZ1I05pt+w1IBSL89+7tvGTg==
X-Received: by 2002:aa7:9182:0:b029:1de:e96f:a866 with SMTP id
 x2-20020aa791820000b02901dee96fa866mr3292765pfa.67.1614691692127; 
 Tue, 02 Mar 2021 05:28:12 -0800 (PST)
Received: from localhost.localdomain ([103.66.79.74])
 by smtp.gmail.com with ESMTPSA id w1sm13027454pgs.15.2021.03.02.05.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 05:28:11 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 Daniele.Palmas@telit.com, bjorn.andersson@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/2] Handle probe defer properly in MTD core
Date: Tue,  2 Mar 2021 18:57:55 +0530
Message-Id: <20210302132757.225395-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_132925_697100_2FF506DA 
X-CRM114-Status: UNSURE (   9.51  )
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

Hello,

These two patches aims at fixing the -EPROBE_DEFER handling in the MTD
core and also in the Qcom nand driver. The "qcomsmem" parser depends on
the QCOM_SMEM driver to parse the partitions defined in the shared
memory. Due to the DT layout, the SMEM driver might probe after the NAND
driver. In that case, the -EPROBE_DEFER returned by qcom_smem_get() in
the parser will fail to propagate till the driver core. So this will
result in the partitions not getting parsed even after the SMEM driver is
available.

So fix this issue by handling the -EPROBE_DEFER error properly in both
MTD core and in the Qcom nand driver. This issue is observed on Qcom SDX55
based Telit FN980 EVB and in SDX55-MTP.

Thanks,
Mani

Manivannan Sadhasivam (2):
  mtd: Handle possible -EPROBE_DEFER from parse_mtd_partitions()
  mtd: rawnand: qcom: Return actual error code instead of -ENODEV

 drivers/mtd/mtdcore.c             | 3 +++
 drivers/mtd/nand/raw/qcom_nandc.c | 7 ++-----
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
