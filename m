Return-Path: <SRS0=sdQx=42=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75AB3C10F27
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 07:45:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 410CA20675
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 07:45:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CqX6p06S";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="skh3QEBA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 410CA20675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=46pvxlc0nJRK671KSUzRP8ihPsKy+g3w1QEP2qu3Jt0=; b=CqX6p06SkOe1/7
	MSsxSKRi6ToKY7Dtn9DSQweVTp+19aQQq6PnQdQK4WRNffUTqOe2SGdomoZ7Hv//Qi3mx6F3fk929
	rIXu38nsK+teYQu1nLBkjeDHjRVFZdfIMcC69iM8lFlbRJC+/Rxmd8AiDCU0/tF05kloSOJh/uePZ
	IN6pwcxnG+5LG9kFr1xyUvwSKF4uEPPMtMiSWofmSBex29/Pzqd+jhi99aqQzSI4/asKUyDgFrjXR
	r75RukNbKz4KCYNvKYKkV+Zvui+T8jmrFAdlCocGn3slcc+AGP7spvDCxHzVdwKkZk1jO+rP2P6OZ
	i8MMv6rNkUYd4cAksI5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBD5w-0008OB-Uz; Mon, 09 Mar 2020 07:45:00 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBD5t-0008Nj-Ie
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2020 07:44:58 +0000
Received: by mail-lj1-x241.google.com with SMTP id 19so6010462ljj.7
 for <linux-mtd@lists.infradead.org>; Mon, 09 Mar 2020 00:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ylz4C8BXeUK+Jg0yomH1N+wYse5xsBihSTA/BJNuDFU=;
 b=skh3QEBADxKN+Ovz+2fKXbBENmBWrHRKGofmeICqDLUq6aXgNb8Jd8wp3ShPH/clT/
 mv+F5jIXY9fiHv7/jhjlVkNRO/lrOS6CpAWWC4DmOU1tXVrgwH7e67FWZfwdv9Iyn9fy
 x67SNCDub/S088VOpq6rJNbvt2VAhC5fp06IWG5FYmjEklAIArCi0+RQ3gkIZ5WmwNRD
 Wlzw7uRLxKOP3nTU4sqHYCS/+7T/jvfqjXaw+UjxGIklDDcoq/+EoX07w60nF4E7ZDaz
 O5O2wKuClYL5Tx3yN6TxKN5a7ub2gZKadB5gU6SzAa7GwsNbHzStkWq8MVm0J/3RlgAA
 Ncmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ylz4C8BXeUK+Jg0yomH1N+wYse5xsBihSTA/BJNuDFU=;
 b=mYLgHD9LQ42lf3KS9viic6Fpz4VCvD4SJLC/aS1kstTbqSUq27SQWSSK5IT+XJ8Fxn
 KzQSzYdTby5yHokWxd2aRr5VCYWQGlN1r3QvR7BFXGhmbFAkGM3yFzFHHdrlB3sQSNXg
 di4IqELCCHTkbEMXzGxjRp1CVt0bUUL2IhB5ttpedEYftyaJRRfGJmiylaoAUHdN3xhU
 LV1C/oD+To3PnG29G1nbSdvSTg/Mjqr25cwwhTOgNkvAtwMVCzUWHdmZ6EOPBCgwMaVF
 SRiP5Uo3GPpwH7GPSJq9iPM3YLYwIeDuv3agoh/ctyubJdLE1zWotYl476FTcto+XCSZ
 RvWQ==
X-Gm-Message-State: ANhLgQ1FDiD+tGme+k40RUgHJQu/2uuG/gcztnnDlx47zwF/NsuRUWH+
 3hxOTXtE87cs7T7ehCqD1S0=
X-Google-Smtp-Source: ADFU+vv7P3wFAFQBuKbp5MK1TKAnJ3KFnVO9Tt4rJkEbDDRQ4hy+0b6aR9YQpAtcbRa6CRUW0MPE+Q==
X-Received: by 2002:a2e:b04b:: with SMTP id d11mr9149613ljl.267.1583739892009; 
 Mon, 09 Mar 2020 00:44:52 -0700 (PDT)
Received: from localhost.localdomain
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.gmail.com with ESMTPSA id p26sm2084838lfe.44.2020.03.09.00.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 00:44:51 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Subject: [PATCH] mtd: fix calculating partition end address
Date: Mon,  9 Mar 2020 08:44:45 +0100
Message-Id: <20200309074445.23524-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_004457_614237_74BE1733 
X-CRM114-Status: GOOD (  11.53  )
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
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKVGhpcyBmaXhlcyBjaGVj
ayBmb3IgcGFydGl0aW9ucyB0aGF0IGRvbid0IHN0YXJ0IGF0IGJlZ2lubmluZyBvZiB0aGVpcgpw
YXJlbnRzLiBNaXNzaW5nIHBhcnRpdGlvbidzIG9mZnNldCBpbiBmb3JtdWxhIGNvdWxkIHJlc3Vs
dCBpbiBmb3JjaW5nCnJlYWQtb25seSBpbmNvcnJlY3RseS4KCkZpeGVzOiA2NzUwZjYxYTEzYTAg
KCJtdGQ6IGltcHJvdmUgY2FsY3VsYXRpbmcgcGFydGl0aW9uIGJvdW5kYXJpZXMgd2hlbiBjaGVj
a2luZyBmb3IgYWxpZ25tZW50IikKU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZh
bEBtaWxlY2tpLnBsPgotLS0KIGRyaXZlcnMvbXRkL210ZHBhcnQuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL210ZHBhcnQuYyBiL2RyaXZlcnMvbXRkL210ZHBhcnQuYwppbmRleCA3MzI4YzA2NmM1
YmEuLmM2ODNiNDMyY2M1ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbXRkcGFydC5jCisrKyBi
L2RyaXZlcnMvbXRkL210ZHBhcnQuYwpAQCAtNTI0LDcgKzUyNCw3IEBAIHN0YXRpYyBzdHJ1Y3Qg
bXRkX3BhcnQgKmFsbG9jYXRlX3BhcnRpdGlvbihzdHJ1Y3QgbXRkX2luZm8gKnBhcmVudCwKIAkJ
CXBhcnQtPm5hbWUpOwogCX0KIAotCXRtcCA9IHBhcnRfYWJzb2x1dGVfb2Zmc2V0KHBhcmVudCkg
KyBzbGF2ZS0+bXRkLnNpemU7CisJdG1wID0gcGFydF9hYnNvbHV0ZV9vZmZzZXQocGFyZW50KSAr
IHNsYXZlLT5vZmZzZXQgKyBzbGF2ZS0+bXRkLnNpemU7CiAJcmVtYWluZGVyID0gZG9fZGl2KHRt
cCwgd3JfYWxpZ25tZW50KTsKIAlpZiAoKHNsYXZlLT5tdGQuZmxhZ3MgJiBNVERfV1JJVEVBQkxF
KSAmJiByZW1haW5kZXIpIHsKIAkJc2xhdmUtPm10ZC5mbGFncyAmPSB+TVREX1dSSVRFQUJMRTsK
LS0gCjIuMjUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
