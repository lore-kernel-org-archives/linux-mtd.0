Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56039C54E8B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 08:25:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CC3D206A3
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 08:25:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Eq/FsS0e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XC8k0din"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CC3D206A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IHiWeh3ll3ZVlmMNxjOLKUFC9OhNKRG7w23orcktx9M=; b=Eq/FsS0eOjhKl7
	k36ZpeCSbq9mfE0iTGxu5tejSGjHZ85ZCjyNY7kCG7fwvxVCfnM5B4j87SxsPPh+G8ZzpM5rXKh0d
	bGQzCF44HwYj4ZdpO2+vJg12mwIDzG/crBOo0RFDiSqDr6FNH0bT+EDzamMUo+63KeEP+1SQLWm8X
	/1fJYsz6FTmKJPd27nVZN6g67tsQxjFvaWT4Gxlp7Wg/LGuaRZLSd/W4a0T5XIhHCImpVwI6VqiJs
	Xxq364clx0Mqm9SHnXGq+O1ZXwd6Y1AlGGAsIovLBRL/HfJfwQdPycwxZiik1C8uy9ul7oDi1u5/F
	ZWseiRzwW7OffScvxAsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYQE3-0003KC-Q5; Tue, 12 May 2020 08:25:19 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYQE0-0003HY-RL
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 08:25:18 +0000
Received: by mail-wr1-x441.google.com with SMTP id h17so5328211wrc.8
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2020 01:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dise/Ltq/8sPUlFw9YHaPR8/vtAeRgM3btPcexpNyWQ=;
 b=XC8k0dinPlJ2lvGmOqDpvhxBSveCJi3dXzkR0maYhVUJ9RsfihA8jhSuLsu+W/DjG4
 MATmPbXbdV/sUUhtFi3MzFv7YGK/rODp185eFekYg2Tk4PChrgd/cQtlKZxMWRJMcqE0
 FTxuQFoB0ThmDmizWbdg1N+IpDMqup4QGgGM1MnZKXNt4uX09n6JYWGGBXGh424j9sq1
 yuj5IvJT7xFOv5N8d8EfvSMaJKADZM+/wvwRF+LciyTT1O1FproupWDlLdfH8Y4rk/Ms
 EJ6+cLCT/xGpAGzm2orEoMmIjmcOHs110mVWphRhVSh+FXLNqmk+JtEmj7FHpOtFByyV
 NogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dise/Ltq/8sPUlFw9YHaPR8/vtAeRgM3btPcexpNyWQ=;
 b=lrwaa0ZaQpXQEWLxRhQKPVcV/jDXlo1lAKmDkd28hh7+0fstE0hGdjNedn1vKq60l9
 lkDx24piLkBFoOjWdkjNT7Bw/t26u2y0RhW1CMANPmLI4S0iDaqeGpG3R6St4r9xG6rA
 0AjFrQPlD8uXsDZiLiRfEZ/GNOv1CySnsyQPeW6oH+MPycTOz64dpcgdXxAyGPk5LYdT
 +AS/AV1Z28avZw6ICrS2V2A7I656gWTzjNHE3SqWZZDT7La1O8QRuJRf/br4v/FsKjXi
 KaTysgDIHcJYqjaqP1s3nZvfOpzZ2mDH6r5UqEsZTooTxpLq3d7WkGMhRFbi6BqKmCwr
 jweg==
X-Gm-Message-State: AGi0PubNaqc2vRmBIjS8hexkhA9/blrBQxJVC+/BkLIzN8xrCNC5rYCz
 DGjqvI0JsnBVOx8HtN/9tiI=
X-Google-Smtp-Source: APiQypKTZOzCoXzgumrk5YfFOoibdoApMy36qfKw6hTJ2mEDbldC1ZxFTRmuKlE0M1lAGh6UcljBrw==
X-Received: by 2002:a5d:5105:: with SMTP id s5mr18599515wrt.202.1589271915167; 
 Tue, 12 May 2020 01:25:15 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id w82sm1809746wmg.28.2020.05.12.01.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 01:25:14 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4] mtd: rawnand: brcmnand: correctly verify erased pages
Date: Tue, 12 May 2020 10:24:51 +0200
Message-Id: <20200512082451.771212-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512065111.716801-1-noltari@gmail.com>
References: <20200512065111.716801-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_012516_891385_1A64177E 
X-CRM114-Status: GOOD (  13.38  )
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

VGhlIGN1cnJlbnQgY29kZSBjaGVja3MgdGhhdCB0aGUgd2hvbGUgT09CIGFyZWEgaXMgZXJhc2Vk
LgpUaGlzIGlzIGEgcHJvYmxlbSB3aGVuIEpGRlMyIGNsZWFubWFya2VycyBhcmUgYWRkZWQgdG8g
dGhlIE9PQiwgc2luY2UgaXQgd2lsbApmYWlsIGR1ZSB0byB0aGUgdXNhYmxlIE9PQiBieXRlcyBu
b3QgYmVpbmcgMHhmZi4KQ29ycmVjdCB0aGlzIGJ5IG9ubHkgY2hlY2tpbmcgdGhhdCBkYXRhIGFu
ZCBFQ0MgYnl0ZXMgYXJlbid0IDB4ZmYuCgpGaXhlczogMDJiODhlZWE5ZjljICgibXRkOiBicmNt
bmFuZDogQWRkIGNoZWNrIGZvciBlcmFzZWQgcGFnZSBiaXRmbGlwcyIpClNpZ25lZC1vZmYtYnk6
IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+Ci0tLQogdjQ6IFVz
ZSBtdGRfb29ibGF5b3V0X2VjYyBmdW5jdGlvbiwgcmVuYW1lIG9vYiB0byBlY2NfYnl0ZXMgYW5k
IHJlbW92ZSB1bnVzZWQKICAgICBzYXMgdmFyaWFibGUuCiB2MzogRml4IGNvbW1pdCBsb2cgYW5k
IG1lcmdlIG5hbmRfY2hlY2tfZXJhc2VkX2VjY19jaHVuayBjYWxscy4KIHYyOiBBZGQgRml4ZXMg
dGFnCgogZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYyB8IDE5ICsrKysr
KysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21u
YW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCmluZGV4IGU0
ZTNjZWVhYzM4Zi4uYTAwMTQ4M2IzNjE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9icmNtbmFuZC9icmNtbmFuZC5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5k
L2JyY21uYW5kLmMKQEAgLTIwMTgsMjggKzIwMTgsMzEgQEAgc3RhdGljIGludCBicmNtbmFuZF9y
ZWFkX2J5X3BpbyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwK
IHN0YXRpYyBpbnQgYnJjbXN0Yl9uYW5kX3ZlcmlmeV9lcmFzZWRfcGFnZShzdHJ1Y3QgbXRkX2lu
Zm8gKm10ZCwKIAkJICBzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCB2b2lkICpidWYsIHU2NCBhZGRy
KQogewotCWludCBpLCBzYXM7Ci0Jdm9pZCAqb29iID0gY2hpcC0+b29iX3BvaTsKKwlzdHJ1Y3Qg
bXRkX29vYl9yZWdpb24gZWNjOworCWludCBpOwogCWludCBiaXRmbGlwcyA9IDA7CiAJaW50IHBh
Z2UgPSBhZGRyID4+IGNoaXAtPnBhZ2Vfc2hpZnQ7CiAJaW50IHJldDsKKwl2b2lkICplY2NfYnl0
ZXM7CiAJdm9pZCAqZWNjX2NodW5rOwogCiAJaWYgKCFidWYpCiAJCWJ1ZiA9IG5hbmRfZ2V0X2Rh
dGFfYnVmKGNoaXApOwogCi0Jc2FzID0gbXRkLT5vb2JzaXplIC8gY2hpcC0+ZWNjLnN0ZXBzOwot
CiAJLyogcmVhZCB3aXRob3V0IGVjYyBmb3IgdmVyaWZpY2F0aW9uICovCiAJcmV0ID0gY2hpcC0+
ZWNjLnJlYWRfcGFnZV9yYXcoY2hpcCwgYnVmLCB0cnVlLCBwYWdlKTsKIAlpZiAocmV0KQogCQly
ZXR1cm4gcmV0OwogCi0JZm9yIChpID0gMDsgaSA8IGNoaXAtPmVjYy5zdGVwczsgaSsrLCBvb2Ig
Kz0gc2FzKSB7CisJZm9yIChpID0gMDsgaSA8IGNoaXAtPmVjYy5zdGVwczsgaSsrKSB7CiAJCWVj
Y19jaHVuayA9IGJ1ZiArIGNoaXAtPmVjYy5zaXplICogaTsKLQkJcmV0ID0gbmFuZF9jaGVja19l
cmFzZWRfZWNjX2NodW5rKGVjY19jaHVuaywKLQkJCQkJCSAgY2hpcC0+ZWNjLnNpemUsCi0JCQkJ
CQkgIG9vYiwgc2FzLCBOVUxMLCAwLAorCisJCW10ZF9vb2JsYXlvdXRfZWNjKG10ZCwgaSwgJmVj
Yyk7CisJCWVjY19ieXRlcyA9IGNoaXAtPm9vYl9wb2kgKyBlY2Mub2Zmc2V0OworCisJCXJldCA9
IG5hbmRfY2hlY2tfZXJhc2VkX2VjY19jaHVuayhlY2NfY2h1bmssIGNoaXAtPmVjYy5zaXplLAor
CQkJCQkJICBlY2NfYnl0ZXMsIGVjYy5sZW5ndGgsCisJCQkJCQkgIE5VTEwsIDAsCiAJCQkJCQkg
IGNoaXAtPmVjYy5zdHJlbmd0aCk7CiAJCWlmIChyZXQgPCAwKQogCQkJcmV0dXJuIHJldDsKLS0g
CjIuMjYuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
