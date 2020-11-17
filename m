Return-Path: <SRS0=l5Rv=EX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157B7C2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 17:49:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A05612468D
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 17:49:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VBv9/i17";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I+O7Yo6C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A05612468D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8cLylNwToazHtrP/UubFAOoEIFC5Z/YleN24yA//GKs=; b=VBv9/i17Z106nE6pAncasJL0sw
	g8hJQdG0NhQZhQBUhMBg9tqo3nV/PC1oAwYb70qlvr+oJPU3wJNYdLN2g5L4qUB789slnZHS3F6Mv
	LVqpoBUButgljwADzl9inVkHJkKsJjsRBJWMytDal1vFMW6XYT08WxpfITgHA7lkjIfcJb2n5ZBqw
	ZTy8xFw5Rq1ZJp+gn0ZsxJNR8SlzVt3vjJyIEv98xOB8YT3k24CAkY0INzMlrVKNfYcb9SAeSmTvC
	3wU+obSrDuM12rjKZrDHoxVeYanLxRzpttv188TNcsJ82FPuRl/aO7ddqoHNRRMsJ1lUXVHT61qiN
	bI3CwOVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf56C-00076o-Hv; Tue, 17 Nov 2020 17:49:00 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf56A-00075k-D4
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2020 17:48:59 +0000
Received: by mail-pj1-x1044.google.com with SMTP id r6so858641pjd.1
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2020 09:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=O0PA9nf7G4M2udGN4+q47WXE4Qy7KA5bu5YIoNe2LFg=;
 b=I+O7Yo6COQWNxmqewYTuql/S/oMpEKVhTAdBS6QxYTq7LJQp4PLzTmXAmd3z88YZZn
 bey0pn5KrqwJScrlAVY602fvKUOwSj746GPwgI1tSNZWPf5HhRj3glWj4MhaPYfoPFiL
 QnP0psRV9rvO4Ia34yAeIb4djJdEGNbxJLNIrQrQ8zDaJjmrWbV5dXFY6TQIo/joVePx
 qEdw8bi0fQOnKnd0tGSPb2MPvWtgCwQHeEB28KbOR+YkQgzv5hGtLHa2JbYQ+3VmXboa
 E3cy5W6SYtwwug1WKODqHKlJF83ehh/G2e1DA2XoXj0ZY2/ghOrfbvcSHrJl7fJDcjF2
 wmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=O0PA9nf7G4M2udGN4+q47WXE4Qy7KA5bu5YIoNe2LFg=;
 b=G53dx+sR64f0yY9vYdzoIA1/y8o+1jyPYZmwNuf8U6/tPgOfg2tfSL9ex55txX1Kvm
 QDFyXv2hRHdnhlv6VYd2T19yPuiK3gCNlpSYq0PINZ03RlKVyb8gdlj8BQZ6DmbxOS5X
 tHqFZGFPbTlPp7xrcaI1iDMdcirCpLMQL6Rbt2l3rPlJKA4kNKTofNJtTmBqGoYIHYnW
 0d7LZi0SVW0knxT9NaujJ4/1sXcfW2vjI1Eg/aEqKVQLv2yMLBK/aXE87jtqdBuCzN5U
 l9xAb1oyKJsrVXJj/n/R+swq2DXWiZ6sAV3AyLiv3PDA4tt0nTDHSfBKlpbQKUY/CHOm
 5gMg==
X-Gm-Message-State: AOAM531qcy58AqWdoam6fCJAHLjfkBj5PA5SRik7DAxJAwLTFi+KCGfj
 xBkWwqmQzRgA8WJHLPd71BGXA5NzIdII
X-Google-Smtp-Source: ABdhPJwXUv3E3rnopnWn4cwu/xUeTSKe0sisjYQxjooarhF/w/Rb+XZEE47uu2Zdb/NCgRQcv8krHw==
X-Received: by 2002:a17:90b:345:: with SMTP id
 fh5mr226340pjb.198.1605635336430; 
 Tue, 17 Nov 2020 09:48:56 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
 by smtp.googlemail.com with ESMTPSA id
 192sm22222810pfz.200.2020.11.17.09.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:48:55 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH v2 0/4] Add support for Qcom SMEM based NAND parser
Date: Tue, 17 Nov 2020 23:18:41 +0530
Message-Id: <20201117174845.28684-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_124858_508239_157EE2F5 
X-CRM114-Status: GOOD (  13.66  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 linux-mtd@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

This series adds support for parsing the partitions defined in Shared
Memory (SMEM) of the Qualcomm platforms supporting NAND interface.
Current parser only supports V3 and V4 of the partition tables.

This series has been tested on SDX55 MTP board which has an onboard NAND
device.

Thanks,
Mani

Changes in v2:

* Added additionalProperties: false and removed unit address in binding

Manivannan Sadhasivam (4):
  dt-bindings: mtd: partitions: Add binding for Qcom SMEM parser
  mtd: parsers: Add Qcom SMEM parser
  mtd: rawnand: qcom: Add support for Qcom SMEM parser
  mtd: parsers: afs: Fix freeing the part name memory in failure

 .../mtd/partitions/qcom,smem-part.yaml        |  33 ++++
 drivers/mtd/nand/raw/qcom_nandc.c             |   4 +-
 drivers/mtd/parsers/Kconfig                   |   8 +
 drivers/mtd/parsers/Makefile                  |   1 +
 drivers/mtd/parsers/afs.c                     |   4 +-
 drivers/mtd/parsers/qcomsmempart.c            | 169 ++++++++++++++++++
 6 files changed, 215 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
 create mode 100644 drivers/mtd/parsers/qcomsmempart.c

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
