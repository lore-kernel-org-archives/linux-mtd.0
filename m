Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F490C54E8D
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 06:00:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 244F620769
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 06:00:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cw85bZ3e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhVM1qh5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 244F620769
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8vaF6I0Ds23MdVPDPrds5ZAVXP/w4xro6nNVyBU+ddM=; b=Cw85bZ3e0YOdBy
	ZBtwH72WFrwgvCw7Aam9Guv+UjtGjIqUYXn/BPRikV+VKi278QvcXzl0HLPiaslkiuGZ7guBkQBtI
	mQ73Y5jaJdj15ub9TEhWCVI6e51djPFUDEtVIh8KGjyK8exRAZnnrnpzFHJXUPnMUHYGfPfiAtg6n
	Rgq3QZ7xX6p4gGVum5dLn2DA0VFvxGMMdLzBpQLCCKSBN0+ZRw9y6Zyub5WGrh9H1dtAaAAQydN3G
	6kngjtXR4ukXD/zvfd5D02uGNfwrbWIyit23VPXoVeabhKhIy7TEf+xH0mQ+uu818mTGuo7LdFShA
	1lJ+YLcZk/tcQMYMAy8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYNxx-0002D4-V3; Tue, 12 May 2020 06:00:33 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYNxv-0002C3-DN
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 06:00:32 +0000
Received: by mail-wr1-x444.google.com with SMTP id 50so13238958wrc.11
 for <linux-mtd@lists.infradead.org>; Mon, 11 May 2020 23:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wpPUiKoxrLHYw4+DH7/6FLsY3bFbf5FDzCuTH+tpmXY=;
 b=YhVM1qh5b2JTfXSFTmL6NUVbLnY8Gh7IKyb82fxao7EP2fTdGqjahewQA39dMIEiB/
 Hez3/pLS09TYLzhhUPbBTLgOfuWQwJ1C8zt5a4Lid90U6Y0lhDJvViWS/vEndxigUoc5
 Uw0dB+xZ/SKVvxDJ3MSufBGwscUAPPZQe6WNWy+0uh/hhSZ89iyfhgHMIIIh+TIjj+Uq
 YErlj+HD+NUQdsYGRqEvkVe6eIB2nvhjrn3FhicXAPQIaggvwEFfZTASnFU/OhYAKYIs
 m+ddiZTWK875hdqG6lIeIuwf8gJdNhhjXFWUc4YNG76U3vMdr5GmEKs17feTls9f8B4v
 EO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wpPUiKoxrLHYw4+DH7/6FLsY3bFbf5FDzCuTH+tpmXY=;
 b=nkutdKuoCJ4ql0xj1femgplrzUVZbE32j2LQa6l7vRUQTz9CItuHY1ThrcOBuAgaxW
 hbISo2pBJlrSdqD9rCRNweZvVJNWF6voetRnNRJ7TxSqpngxJYpzApvQnTIz4ksCZc3a
 H2khciam6jFwJ3Ld9Wm2uiybDpTu+/Mb5BLOuLUki+G410KIe1UkOMY8AqfKhvDPQ2dl
 VEVOonZR/4DHLzkhdB0HLxolwwfmwr1pK5UC5oFBGlZkFbaO8ZA9xvW++3qZ4bZgArce
 ffMpr/KZmWwnXa4uSH32FXluOGF2/b63zOmAmqvLoB8hEKuMVgFNpUoVw6miIc0ANtiN
 8Y4A==
X-Gm-Message-State: AGi0Pub4ubF2tCBo02P2MsDiVlXvBy+LymlhQ6ys0Y8URm9N5DsPM4qR
 hg1FKdgI4Zbfh5cech1chDU=
X-Google-Smtp-Source: APiQypJxBhGzU7FEv9wDSsbA6BcB09ZI6zcZJLRr0s5b2YymW4QimDRvIKvSBklXOggyjXe+NDAoWQ==
X-Received: by 2002:adf:d091:: with SMTP id y17mr22450319wrh.418.1589263229127; 
 Mon, 11 May 2020 23:00:29 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id a13sm20539150wrv.67.2020.05.11.23.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 23:00:28 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3 0/2] mtd: rawnand: brcmnand: improve hamming oob layout
Date: Tue, 12 May 2020 08:00:21 +0200
Message-Id: <20200512060023.684871-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504185945.2776148-1-noltari@gmail.com>
References: <20200504185945.2776148-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_230031_478714_392AFF46 
X-CRM114-Status: UNSURE (   7.28  )
X-CRM114-Notice: Please train this message.
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
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhlc2UgcGF0Y2hlcyBpbXByb3ZlIHRoZSBPT0IgaGFtbWluZyBsYXlvdXQgYnkgcmVkdWNpbmcg
dGhlIG51bWJlciBvZiBvb2IKc2VjdGlvbnMgYW5kIGNvcnJlY3RseSAKCnYzOiBpbnZlcnQgcGF0
Y2ggb3JkZXIuCnYyOiBleHRlbmQgb3JpZ2luYWwgY29tbWVudCBhbmQgY29ycmVjdGx5IHNraXAg
Ynl0ZSA2IGZvciBzbWFsbC1wYWdlLgoKw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzICgyKToKICBt
dGQ6IHJhd25hbmQ6IGJyY21uYW5kOiBmaXggaGFtbWluZyBvb2IgbGF5b3V0CiAgbXRkOiByYXdu
YW5kOiBicmNtbmFuZDogaW1wcm92ZSBoYW1taW5nIG9vYiBsYXlvdXQKCiBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIHwgMzQgKysrKysrKysrKysrKy0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgotLSAK
Mi4yNi4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
