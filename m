Return-Path: <SRS0=4hvs=RW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69309C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 16:17:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3989D20854
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 16:17:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JHBwjKjK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nRJZhfnm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3989D20854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aD0yb4b1WaCZTPu3yLHM6st3GGKum2fVpgHeYaFYfdY=; b=JHBwjKjKMiLvie
	jPaGoEX2zbWR6BBOiJnJB092ADsQr4Yn/MAkI4hdrKlbuphia5am0Z9R2duxfBDsFNB9C18iucoKp
	PGS1x3j8BvpMT5IMYDbpz2P04SmUsM+FDqM4SlT0ZjmRfPwC+hoDDdny1dyCNM5/ZFRPuZegA2ZYF
	wJCf89U/y1Ee6LZbnVQhL2E6bP7gZvKbiinwhplvy4CIFigsruGTlqexy/IloPYpDWivbXXRp6dPB
	cPIPO4piV+IjmD4ASSwjrUcGl21FN3qWEE+s8UFfKi66/sAsHM6XvtNMmbfYobdVsSY6R2gMDDdbn
	Pkfka8MY2TcHQrCvcj6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6HQM-000276-Ly; Tue, 19 Mar 2019 16:17:10 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6HQJ-00025I-Ks
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2019 16:17:09 +0000
Received: by mail-pg1-x542.google.com with SMTP id r124so14199950pgr.3
 for <linux-mtd@lists.infradead.org>; Tue, 19 Mar 2019 09:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=r6fCR0Ba++QOuxz6R+4A4oS+Zt54avu6KSLhTyIAJSc=;
 b=nRJZhfnmhnyP7yqNTqtX3dofQ4Nk5Qo+78ekVgNnrD9jiAwtEz7IMyldhperXeOLpz
 4undoaMb7UkqX6bIns/qvuN+JwTIB5ez0XYuOFXInz1an8AaZtdztOsaMqJeuD9aGCE1
 NVFN89pcvnjGLDhHNWsgVIOr1h6X30Hs0l0Sn1Qsg1oFmgX4R+/RR1q2dGJezoJOn79j
 ekxaNlly32/WoWzq5hoykBT9l9IAKOMzUCmEcL6+LyBhc10yRgEwqxlTVrArQZiAjXjt
 KeGsASAEgoXp0a1cfeNnMLCmzjd/jq2IcqfuvWObJZAplvoBmK9KZzG87kghFNXJmLo/
 Ovyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=r6fCR0Ba++QOuxz6R+4A4oS+Zt54avu6KSLhTyIAJSc=;
 b=c3yQ+iePu9tiCXG3RofpynSXoLpNaWsyHQ/z5UyaQPleu7ake3UbeqlR0Um4SMrz5z
 OsfJtegwM8mUED8f8Ry2v+S3Kq2eVbeydykPP8el7Ut3JVaZEkJmDOQWBxwKGfqWqOpb
 7mPfr3Vcy23s3OiA6APXp3Eh47R/ODnAeCKyDqaW96tthb4DGHt1MB2DXmghC/4ojOK+
 OhWgj7u8u0+l14Gkq1WAuPW8iieoVaEj6cvCXi4mua4iSxv2vGWj8v8RK93iyZLGn6aZ
 LtNWKbq5QrFk3bZPK+gZeUHDF7bNar31nh7YuwCDkt8YQNMZv67slzB04z2pxGx7qg2B
 +HMA==
X-Gm-Message-State: APjAAAXGEI+3x49wKXwmzG5j0p7sRP8PP9U5B0sKBl5L0Ds39orrk+TX
 0JgN4QPVrtAVtNAUCrIb5YDbjc/ait139Q==
X-Google-Smtp-Source: APXvYqyTh4Rz3ZIjKty65iBaLCRjboFLLl+hqSEPoWui2KPGhH4GS2c3aIqkV3tGPbTvLDzMR2P+wQ==
X-Received: by 2002:a65:6154:: with SMTP id o20mr2557086pgv.205.1553012227183; 
 Tue, 19 Mar 2019 09:17:07 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 i72sm29114760pfj.147.2019.03.19.09.17.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 19 Mar 2019 09:17:06 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-mtd@lists.infradead.org,
 bbrezillon@kernel.org, miquel.raynal@bootlin.com
Subject: Re: [PATCH v2 2/2] mtd: rawnand: meson: fix a potential memory leak
 in meson_nfc_read_buf
In-Reply-To: <20190318204722.9901-3-martin.blumenstingl@googlemail.com>
References: <20190318204722.9901-1-martin.blumenstingl@googlemail.com>
 <20190318204722.9901-3-martin.blumenstingl@googlemail.com>
Date: Tue, 19 Mar 2019 09:17:05 -0700
Message-ID: <7hva0eg7pa.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_091707_686829_DAF0592A 
X-CRM114-Status: UNSURE (   7.59  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, richard@nod.at,
 liang.yang@amlogic.com, linux-kernel@vger.kernel.org, jianxin.pan@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> meson_nfc_dma_buffer_setup() is called with the "info" buffer which is
> allocated a few lines before using kzalloc(). If
> meson_nfc_dma_buffer_setup() fails we need to free the allocated "info"
> buffer instead of only freeing it upon success.
>
> Fixes: 8fae856c53500a ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Acked-by: Liang Yang <liang.yang@amlogic.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
