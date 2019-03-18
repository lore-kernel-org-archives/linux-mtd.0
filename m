Return-Path: <SRS0=8m+b=RV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D7CBC4360F
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Mar 2019 20:47:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A0272171F
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Mar 2019 20:47:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="niZm5mio";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="CIPOqkzt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A0272171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wu//m6TwpPEv5yQjgNqcn/jpOEsoFLSN3skXNjDtQBo=; b=niZm5mioqqn3kl
	P0eyIsVfbLCIMP5BQNC1/WYJHXu7/jJdKwu9WtvjFs5kTiCueEtRxPhM2yTH97gXF1m7Fa4g9pm19
	E2vO51mcDyOv/dZfTHynqufiIECHM8LqnWbs9tt+NoET5cJe5+V/mFuTtPRJwFlEB138s7i4y+Ip1
	P0WwiE0fDLGXoTHnm5AgSRjr+aY4dPqZibVLcCBiKqpZjDBjEoJqDTkrx1M/2srhzI7qu697bj2Cb
	IL33VbE+dqqJVDHFN0e2FKCtJfgTxr/wrX5KHgj5pF4ztJ7OR8AyTkgNz9DSHQMI9Z18zklOSQTht
	lgJsnKNTCMPQ5eK2PAmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5zAT-00006O-2t; Mon, 18 Mar 2019 20:47:33 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5zAP-0008WQ-F1; Mon, 18 Mar 2019 20:47:30 +0000
Received: by mail-wr1-x441.google.com with SMTP id j9so4470763wrn.6;
 Mon, 18 Mar 2019 13:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xdEjMClilgNv8/8kONKzwjjh/piLUyVN8GRovW1S520=;
 b=CIPOqkztsjF0JLMSRllS4l2mccMHIMLYaAz7gdg/mdMwXpDdJ9ReuODAQHuzQbXkjS
 kQq2iHPbq5BSznOZVbjyQ+z6mRjXvzHQ9JloW7GX3fiVdpqN7KoQeoQNHnSuyYCS0kvO
 KpOdDlwlTNC2aFQA8oPEQmVqPVnWmHKo47Tuy+xvi/6pbREcveueGEM1MaO+9d+pc4Gt
 3OJe8is04jvXlDPnOiFXzxS5xjHuEpHcGjW3KQUAl/M8z1cnYsCqZNSR9hF2wsZwvLE3
 Fpl8gHEos6FkjxTaWpFePDx1c95iIXpeZHfL34edKcE6qY+u5w7Iq/6dbnpelnXWB4IG
 vwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xdEjMClilgNv8/8kONKzwjjh/piLUyVN8GRovW1S520=;
 b=fZMcdSBdiT6qwNgxOXREbi6gpXbCBreP9qJiMswLES2b20lAPxrqze14Oz0WGPCXpT
 C7PGfdjCdeT9eMwVDkPORSVaWoiFZmwz1pZosA+6OthfftUxb+nQvBqarVn5xGZMLROe
 FHtH9tiiYdsMffjFHzfrWwFohtQxxMoDUfnw+U5edFiUSKvaAYA86atVpfT+MWGugjcT
 0Ugmkku1o6pu+t+4dT7AfWEHVLs24UQ8GupeUxabUdV+GwvzMzEZ0zEqzNMb5QCXsRpn
 4obLCl/YAZmcGtWpSmtTcvJx5NFVSq0NA7qstvg9LSUsdO87hYqT9GgaV5OkmpmdD6Qh
 Hdlg==
X-Gm-Message-State: APjAAAVIBX6jNiJu43biCgqxUyKZfK7p+hZBN9/4wpOvEYfrK/GDGYx+
 OEFgoObe9zyt8VsC9a9PQXMpY33u
X-Google-Smtp-Source: APXvYqyAj6VPfPkkwt0HGRwCHv7yvs/hbUKdXalZBFEtOcrjvQmJ0Y4YnXiV7Nga5VPbpKF8Z8Z5sg==
X-Received: by 2002:adf:82c9:: with SMTP id 67mr5757540wrc.261.1552942047561; 
 Mon, 18 Mar 2019 13:47:27 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD7399900918378ACFECF051C.dip0.t-ipconnect.de.
 [2003:dc:d739:9900:9183:78ac:fecf:51c])
 by smtp.googlemail.com with ESMTPSA id y12sm224849wma.44.2019.03.18.13.47.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Mar 2019 13:47:26 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-mtd@lists.infradead.org,
 bbrezillon@kernel.org, miquel.raynal@bootlin.com
Subject: [PATCH v2 0/2] meson-nand: two small memory related fixes
Date: Mon, 18 Mar 2019 21:47:20 +0100
Message-Id: <20190318204722.9901-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_134729_507232_6E38A261 
X-CRM114-Status: UNSURE (   9.34  )
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

While trying to add support for older Meson SoCs to the meson-nand
driver I was experiencing a crash in meson_nfc_read_buf(). While trying
to find out why that happened I inspected the code in that function and
found that there's:
- a missing check on the return value of a kzalloc() call
- a potential memory leak in it

Both fixes have nothing to do with my original crash (for which I'll
open a separate thread).


Changes since v1:
- collected Liang's Acked-by's (thank you!)
- rebased on top of v5.1-rc1


Martin Blumenstingl (2):
  mtd: rawnand: meson: add missing ENOMEM check in meson_nfc_read_buf()
  mtd: rawnand: meson: fix a potential memory leak in meson_nfc_read_buf

 drivers/mtd/nand/raw/meson_nand.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
