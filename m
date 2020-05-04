Return-Path: <SRS0=hi6L=6S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92093C3A5A9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 09:43:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6615C2071C
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 09:43:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZW4OgVTr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YAPUKxvx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6615C2071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K76TL4VJgJOSeufVCWFVHp3kXZkv/7uaWIqT/GPlr0g=; b=ZW4OgVTrQPcS4v
	bmKrYfnMf7UHz+2I+uY4+jqTjUKE3Q4T+IyW1kPT4F1iV8p6FhOtVm0qYhXg4N/BX6P+vHxn4FkzL
	vZIT0G9gsgh/QvHFd6bK3qmA5gD+Z5VmdDnyIcKgS01hRiJG4Hmy2wTYp98F8Lrw+RvrvLuxoQABn
	jz7kb3pa9hiAXD4FOIPjVtreHpFbsPDWAavBRv44ImZ1phASEkOX403lkPLmwJRoEe1Xql/SFNOqj
	O9Yb6loM8OCcRSokyqqy6JlJCvvL9K+o6ii7+FpYpK7qIQJti9oWtePg+wPq9f4w08NajeoYxNL2C
	aoa+MfGb+umWx6J9RFoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVXcr-0005Ka-7D; Mon, 04 May 2020 09:43:01 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVXco-0005K3-Om
 for linux-mtd@lists.infradead.org; Mon, 04 May 2020 09:43:00 +0000
Received: by mail-wr1-x442.google.com with SMTP id d15so20127114wrx.3
 for <linux-mtd@lists.infradead.org>; Mon, 04 May 2020 02:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2PePijgL48hP/OTqwgfZQihDqRN1L4nqpcMBBw+8WKI=;
 b=YAPUKxvx+4km4cbaUEcywVQhHgIxiSBOQ5OVl/vRzJ2S6bE1gnc9gFa6K9CkC5yi1W
 iQ3S//xRpTSHs2QzUeHCRYVICFmDr/vYtuG/M9t3sjfgWZP51vzjw1KnQz00w6JOoUAE
 yZeo0P/Yz9vYxE+9sFoOStkJ4Im/FxmrR4w9D2fKGURQtgPrPDDfcByfXjyKFGARcOe8
 ETk+bSbup5WIH0xyOLUOcIsdzWKGyC4uaMESxI9WvAtBW1sWajmCduk7qp8sF9lInF4x
 vHKN6VME3dq7701qfMTr33lCNKfSApD7gDWBTXbjYSi1Zdg5CfV2+maidl81rMD0zJUY
 FxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2PePijgL48hP/OTqwgfZQihDqRN1L4nqpcMBBw+8WKI=;
 b=q7JsgHONW95Mw9DVVQL4wSW6OBvJH76t5CT7RRGiO47KCFy3vL9WuF+57XdvcUDI3w
 wTbTJVTwJqv+E6hFRDrVLamPIqJLeeyOuFrF2YvenOKTj9B3AmMHBj4TiANew9ZJruB9
 WCBJbwPvcsohRpmxaZNvNB6rXXbH5WwwDSgDhDTzvFC157IWxO1cwoTBwo7teSN8iy1t
 hgOowspT8ruuYwycg7uUm8Y2QVlmivAc8pOLX3ayoyo7HttSy9nW2aR+mOTYlbb7z1VM
 MnwO28Q3nOV6kYuM6+zegyDpYa7j9kc1jiyTbHB0nGhUG0w8RnCNbtVtbS11mXe2cCKc
 IK7Q==
X-Gm-Message-State: AGi0PuauwLN6AqUm/rOyqVOBmwEyjWPg89VDGDBTVRag1/1qbklaPBLA
 9UKByZjoJWTvrvh4ZYRDW+4=
X-Google-Smtp-Source: APiQypK+dr+ELxw+9DPmzTETNW0ltDp0Q8pW07j0x7GzYI+R7bAmqMx+tn87tLGhzxVjL+7zMe/gfA==
X-Received: by 2002:adf:f34e:: with SMTP id e14mr18325177wrp.193.1588585376769; 
 Mon, 04 May 2020 02:42:56 -0700 (PDT)
Received: from skynet.lan (246.red-83-44-9.dynamicip.rima-tde.net.
 [83.44.9.246])
 by smtp.gmail.com with ESMTPSA id f63sm12349892wma.47.2020.05.04.02.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 02:42:56 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 s.hauer@pengutronix.de, masonccyang@mxic.com.tw,
 boris.brezillon@collabora.com, christophe.kerello@st.com, stefan@agner.ch,
 piotrs@cadence.com, devik@eaxlabs.cz, tglx@linutronix.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] nand: raw: use write_oob_raw for MTD_OPS_AUTO_OOB mode
Date: Mon,  4 May 2020 11:42:53 +0200
Message-Id: <20200504094253.2741109-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_024258_806753_58426876 
X-CRM114-Status: GOOD (  11.83  )
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

U29tZSBOQU5EIGNvbnRyb2xsZXJzIGNoYW5nZSB0aGUgRUNDIGJ5dGVzIHdoZW4gT09CIGlzIHdy
aXR0ZW4gd2l0aCBFQ0MKZW5hYmxlZC4KVGhpcyBpcyBhIHByb2JsZW0gaW4gYnJjbW5hbmQsIHNp
bmNlIGFkZGluZyBKRkZTMiBjbGVhbm1hcmtlcnMgYWZ0ZXIgdGhlIHBhZ2UKaGFzIGJlZW4gZXJh
c2VkIHdpbGwgY2hhbmdlIHRoZSBFQ0MgYnl0ZXMgdG8gMCBhbmQgdGhlIGNvbnRyb2xsZXIgd2ls
bCB0aGluawp0aGUgYmxvY2sgaXMgYmFkLgpJdCBjYW4gYmUgZml4ZWQgYnkgdXNpbmcgd3JpdGVf
b29iX3Jhdywgd2hpY2ggZW5zdXJlcyBFQ0MgaXMgZGlzYWJsZWQuCgpTaWduZWQtb2ZmLWJ5OiDD
gWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgotLS0KIGRyaXZlcnMv
bXRkL25hbmQvcmF3L25hbmRfYmFzZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
bmFuZF9iYXNlLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwppbmRleCBjMjRl
NWUyYmExMzAuLjc1NWQyNTIwMDUyMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
bmFuZF9iYXNlLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKQEAgLTQ4
OCw3ICs0ODgsNyBAQCBzdGF0aWMgaW50IG5hbmRfZG9fd3JpdGVfb29iKHN0cnVjdCBuYW5kX2No
aXAgKmNoaXAsIGxvZmZfdCB0bywKIAogCW5hbmRfZmlsbF9vb2IoY2hpcCwgb3BzLT5vb2JidWYs
IG9wcy0+b29ibGVuLCBvcHMpOwogCi0JaWYgKG9wcy0+bW9kZSA9PSBNVERfT1BTX1JBVykKKwlp
ZiAob3BzLT5tb2RlID09IE1URF9PUFNfQVVUT19PT0IgfHwgb3BzLT5tb2RlID09IE1URF9PUFNf
UkFXKQogCQlzdGF0dXMgPSBjaGlwLT5lY2Mud3JpdGVfb29iX3JhdyhjaGlwLCBwYWdlICYgY2hp
cC0+cGFnZW1hc2spOwogCWVsc2UKIAkJc3RhdHVzID0gY2hpcC0+ZWNjLndyaXRlX29vYihjaGlw
LCBwYWdlICYgY2hpcC0+cGFnZW1hc2spOwotLSAKMi4yNi4yCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
