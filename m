Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAED3C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jan 2022 03:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oQc6+hkZF4Pf0iGJUaTGhY5fPogBtUhNGF35luhwuB0=; b=pIqKiVEtgqof8u
	OcOEWuWk9QOgpfNU3ue4RDHS61/mADBi+75WsQMX3MNYZ6habfbMiZ+hRiqh0yGZCIxVCvG7UZD09
	Wdu2zKg0anty48ahrx9bucN6+8WTE7gPEpxW61C6yYCvF28kcJMZRfsc+hBBbNV19fe80KlhXO0MR
	hPMY4hchVy68lqUOmLNv8ucQABsiT9LFSjY4oFKHpZYzGohzrlqM8SdCtdfiXDpOao1B0LPJ4mw+e
	M7mw3R0ahyyijtKsgsH7da1adRwLM/YGV608Ugj22xshjsnNAjpSpiqeXb19sSGlY0GLzJp0xvChG
	BSDatxTVnsLoqB2vOo3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4Day-008JwX-Qo; Mon, 03 Jan 2022 03:01:12 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4Dav-008Jvi-NR
 for linux-mtd@lists.infradead.org; Mon, 03 Jan 2022 03:01:11 +0000
Received: by mail-wr1-x434.google.com with SMTP id v6so5616434wra.8
 for <linux-mtd@lists.infradead.org>; Sun, 02 Jan 2022 19:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZPVYLHdEN2vTjfHQg99TQO0KsUtSn3N32X0J9UMa42w=;
 b=H2Gj8QRAS7vbR7dVQuXfqWlVxR/q75a06Yf7SXfC8g7bo6wPNAGbKwvo9e1oDp0rSS
 IqVi5jZ4zlKsJogJi16DJpAnfcM4y5FFmOjuLq1ELUTjNV7KQNVqA3ewSgeG4Y9u/hcN
 7pRuR3J2OV9l2u+zJY+KggAf4kPCLt+XSf89ufkgsX63CHXS91d7tBVh097+h0XU4Lld
 pIn494w+M027JxDJZnw9RmQwAd7JmfI3dVFqXpQIPXodoqTYKq2ZePtl93zKGlHgbpK1
 cGxDMwdFS3f90hOgmhyeDguH5a66LS35QJwFducQygnYMZCLvqKiTzanRw7CPM58kHOA
 rADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZPVYLHdEN2vTjfHQg99TQO0KsUtSn3N32X0J9UMa42w=;
 b=J4n+4h4GbIThasL3Nys7a2Fh9i2F7k7CyqRXTA97ACRN1v0YYfTEjOIxLBL9XN+C92
 x8JaMj6BCp9IQ/iAe3pmXgLTROa9SqQEW2cXRtsAPmWM+bfI5QJ6/IqNvNAT66gEIlze
 +7RtbTXHpaGlYLrJiyMYp627z46NWxuyt1TOOBOFwQVvYjG+3yCexsq1uBJZy8plF+l5
 wF8vNFmft7mMxhg+/n62J6miMuDPvm+tvop3A6+7uNNr+PmhOoF14cbtwARDO+a/2wVW
 Sop6XdsxFL4npxTmu6t09PfCZduhzQZTu1JfEdBHRL0Phv3wHTPkGg6afFHCXeAr+hkf
 YjNQ==
X-Gm-Message-State: AOAM533FBL3klQDHJFnExUBe+bE1jKMzKrrY5y/4V0qUzrc6CvtXkVE/
 LFkcq45jmTyCbdqKoRm3cUdiXQ==
X-Google-Smtp-Source: ABdhPJxcACWfxvCOxKTjwsBBcoTwoLDkHGPSqYp5nL4pj5yyJ6axB85Bz6ziXkkXIbIBhKNcXbiB3Q==
X-Received: by 2002:adf:f245:: with SMTP id b5mr36603818wrp.506.1641178867961; 
 Sun, 02 Jan 2022 19:01:07 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id p11sm38095667wru.99.2022.01.02.19.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jan 2022 19:01:07 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 mani@kernel.org, miquel.raynal@bootlin.com, architt@codeaurora.org,
 bbrezillon@kernel.org, absahu@codeaurora.org
Cc: baruch@tkos.co.il,
	bryan.odonoghue@linaro.org
Subject: [PATCH v2 0/2] Two Qcom NAND related fixes.
Date: Mon,  3 Jan 2022 03:03:14 +0000
Message-Id: <20220103030316.58301-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220102_190109_852406_D9308361 
X-CRM114-Status: UNSURE (   7.79  )
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

I've already sent the ordering fix for probe deferral in qcom_nandc_probe()
but there's also an associated printout in the partition parser that
shouldn't be there.

Add a patch to silence the spurious error message. 

Bryan O'Donoghue (2):
  mtd: rawnand: qcom: Fix clock sequencing in qcom_nandc_probe()
  mtd: parsers: qcom: Don't print error message on -EPROBE_DEFER

 drivers/mtd/nand/raw/qcom_nandc.c  | 14 ++++++--------
 drivers/mtd/parsers/qcomsmempart.c |  3 ++-
 2 files changed, 8 insertions(+), 9 deletions(-)

-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
