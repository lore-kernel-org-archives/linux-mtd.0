Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C70FAC00A89
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:12:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4430B206DD
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 12:12:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K6V2y1fT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uZKVbPP0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ps+goPOu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4430B206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=edRb0ZWAir2+5l4JLx8maPEkWca3tyZ2+vUupR3jyBA=; b=K6V2y1fTeDyJtz+9Y2qFQNlKx
	kHNwa9HQ9oEA5mYRbR3JR9tN2jjHVPUcuvMR28ZqlNqYkf+pyoI2wcfiHTLitpbKLqUDKGG1Vfo/L
	yjcizqQKWN++cPjW98I+jV9eaUU5q1jrGPBwQepAYlyaYGxkeMs1qgFnd3Pu6bQWuxVwLocoyn4t0
	CtWHksMZHf8ZSf/16KnAVEXZOkib6lRpQ3X1VExprDyLCYfla2CeI286EbWzDHXLOVlbSRFZHln+n
	WNy+YgOUqT3D6iCV8y8naU+ZoM5L68yTLmDvfEmQZnYPBVQJWBKFR3BtMy+NVx9mIyHcbMNrMUhLu
	5o0cawIpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZYgr-0003xO-Vd; Mon, 02 Nov 2020 12:12:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYgo-0003p2-1u
 for linux-mtd@merlin.infradead.org; Mon, 02 Nov 2020 12:11:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=TGKp9BcrRvWbGFJ8nJFrwV99IT3tH0nAgbqx1me4UIc=; b=uZKVbPP0Mp0elmX3BLG56JDqVb
 EoEsZ0FdNEHFMwrrjD3BpJjdZbjGVo/SdtHI6PdjBk9rCbwtwtEopbg89GnijbeuXaNkojhImY4Sn
 3au70qHoR05HkuLimcjW6jC/tZj/+kezfolffF45m38IzlUd8DmiO07oCVqFKsGDaICjd5gqfDvm9
 JT+QtKqNJsdJdiBXxKkVCTOg5QRBMND5wV32cc0u4RcWft4Qq9U0h6RdyhI9/V6cjGy49ODtQqleK
 TYEBHmnsbQBAJKzu1sAOreTQPBfOhlZ+W1C0c4CjARuxKBYD4h5BMqKn6GOeDkA5/OwwWI3tMfsnm
 faTXq9hQ==;
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYPy-0004t4-F8
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 11:54:49 +0000
Received: by mail-wr1-x442.google.com with SMTP id a9so14219957wrg.12
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 03:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TGKp9BcrRvWbGFJ8nJFrwV99IT3tH0nAgbqx1me4UIc=;
 b=Ps+goPOuM+t0f/WlfFZJVo78ITTY00f5bitMKqOsoWammNIcgHwveDbWPtJrWxn3CA
 /C1xHAxMEnQNkGB0blsWANw8bvBY1hzTMg1o0li6opngvZP7JgNhbBcCJo7ZPPM9K/SR
 AL1uFPtXD7bNCl2f6vSoA79GiV8d+OiAlL1MIg3wA51gWFV9zJsO6ZlJOnOyVJwf6fzr
 k7oYoPxGyQs7Xyd5iT9XHCbPspf/uJ40ir9lKEve74yHqx/HTc6rfSa/VB0Nf4VE4kDk
 6F8QQmKRT3tWThuOYOxlfh2PxNDagAQHy9n7SUUMbvcrRllTOLSGnV6Z58/L+FXQcufc
 R1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TGKp9BcrRvWbGFJ8nJFrwV99IT3tH0nAgbqx1me4UIc=;
 b=eMTeee/nr2KPAo5EURQiBUzCAATNrINyzGHnWYq5aDdBXjaDwKjP2jioiJr+suEGyG
 iSYONQA8c8G1CdfsRpyOEtCP3gyFNDRrmoqcdEp9BPuyhn2gX9zN+hdzxci0km2RrXwa
 q2KgQFvbdAmGK/Uzh+jECI5SGALMYXcnp+JTLDAXPc30nQejvseI1upgDoVHbiOjcPgA
 M5sGXWKxPh0imVze5e0FL0JBaB6WKGpj0vB9GTTq+fiXOsUevCYXGr6V2she/BnW1o6h
 lHFqHnOK3FTFU6jljObAc4FvCedJNHSIX915rC7Bq00QwK+jhe3xEtri+XY5TzTxrOd5
 VpXA==
X-Gm-Message-State: AOAM5306qew4fl6X1eZahf+aONTIy8Wz5sAPXVfsHGm07trf5LFwtFXW
 gx9fpSoV4OChWrvOAAnFXPplFQ==
X-Google-Smtp-Source: ABdhPJx8dr9zZZzDtiWfkhNT+ZvBeH8jDPzmE9Oh4H52mODH7lx/pWbnvgHt1iT5t9BMiZpIL92TvA==
X-Received: by 2002:adf:f286:: with SMTP id k6mr19922306wro.34.1604318072455; 
 Mon, 02 Nov 2020 03:54:32 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id t23sm14284010wmn.13.2020.11.02.03.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 03:54:31 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: vigneshr@ti.com
Subject: [PATCH 15/23] mtd: nand: raw: diskonchip: Marking unused variables as
 __always_unused
Date: Mon,  2 Nov 2020 11:53:58 +0000
Message-Id: <20201102115406.1074327-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_115436_071919_16D24CAB 
X-CRM114-Status: GOOD (  18.70  )
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
Cc: Dan Brown <dan_brown@ieee.org>, Kalev Lember <kalev@smartlink.ee>,
 Fabrice Bellard <fabrice.bellard@netgem.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Gleixner <tglx@linutronix.de>, Lee Jones <lee.jones@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

J2R1bW15JyBpcyBuZXZlciBjaGVja2VkIChhcyBwZXIgdGhlIG5vbWVuY2xhdHVyZSkgYW5kIHRo
ZSB1c2Ugb2YKJ2VtdHB5bWF0Y2gnIGlzIGN1cnJlbnRseSAjaWYgMCdlZCBvdXQuICBXZSBjb3Vs
ZCBhbHNvICNpZiAwIHRoZQpkZWNsYXJhdGlvbiwgYnV0ICNpZmVyeSBpcyBwcmV0dHkgdWdseSwg
c28gSSBsaWtlIHRvIGtlZXAgaXQgdG8gYQptaW5pbXVtLgoKRml4ZXMgdGhlIGZvbGxvd2luZyBX
PTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVycy9tdGQvbmFuZC9yYXcvZGlza29u
Y2hpcC5jOiBJbiBmdW5jdGlvbiDigJhEb0NfRGVsYXnigJk6CiBkcml2ZXJzL210ZC9uYW5kL3Jh
dy9kaXNrb25jaGlwLmM6MjE5OjE2OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhkdW1teeKAmSBzZXQg
YnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQogZHJpdmVycy9tdGQvbmFu
ZC9yYXcvZGlza29uY2hpcC5jOiBJbiBmdW5jdGlvbiDigJhkb2MyMDB4X2NhbGN1bGF0ZV9lY2Pi
gJk6CiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9kaXNrb25jaGlwLmM6NzA2OjY6IHdhcm5pbmc6IHZh
cmlhYmxlIOKAmGVtcHR5bWF0Y2jigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNl
dC12YXJpYWJsZV0KCkNjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29t
PgpDYzogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KQ2M6IFZpZ25lc2ggUmFn
aGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KQ2M6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJl
emlsbG9uQGNvbGxhYm9yYS5jb20+CkNjOiBEYW4gQnJvd24gPGRhbl9icm93bkBpZWVlLm9yZz4K
Q2M6IEthbGV2IExlbWJlciA8a2FsZXZAc21hcnRsaW5rLmVlPgpDYzogRGF2aWQgV29vZGhvdXNl
IDxkd213MkBpbmZyYWRlYWQub3JnPgpDYzogRmFicmljZSBCZWxsYXJkIDxmYWJyaWNlLmJlbGxh
cmRAbmV0Z2VtLmNvbT4KQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgpD
YzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVz
IDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9kaXNrb25j
aGlwLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZGlza29uY2hpcC5jIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvZGlza29uY2hpcC5jCmluZGV4IDk0NDMyYTQ1M2U1ZWUuLmQ1
MDUwZTMyY2M0MjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Rpc2tvbmNoaXAu
YworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9kaXNrb25jaGlwLmMKQEAgLTIxNiw3ICsyMTYs
NyBAQCBzdGF0aWMgaW50IGRvY19lY2NfZGVjb2RlKHN0cnVjdCByc19jb250cm9sICpycywgdWlu
dDhfdCAqZGF0YSwgdWludDhfdCAqZWNjKQogCiBzdGF0aWMgdm9pZCBEb0NfRGVsYXkoc3RydWN0
IGRvY19wcml2ICpkb2MsIHVuc2lnbmVkIHNob3J0IGN5Y2xlcykKIHsKLQl2b2xhdGlsZSBjaGFy
IGR1bW15OworCXZvbGF0aWxlIGNoYXIgX19hbHdheXNfdW51c2VkIGR1bW15OwogCWludCBpOwog
CiAJZm9yIChpID0gMDsgaSA8IGN5Y2xlczsgaSsrKSB7CkBAIC03MDMsNyArNzAzLDcgQEAgc3Rh
dGljIGludCBkb2MyMDB4X2NhbGN1bGF0ZV9lY2Moc3RydWN0IG5hbmRfY2hpcCAqdGhpcywgY29u
c3QgdV9jaGFyICpkYXQsCiAJc3RydWN0IGRvY19wcml2ICpkb2MgPSBuYW5kX2dldF9jb250cm9s
bGVyX2RhdGEodGhpcyk7CiAJdm9pZCBfX2lvbWVtICpkb2NwdHIgPSBkb2MtPnZpcnRhZHI7CiAJ
aW50IGk7Ci0JaW50IGVtcHR5bWF0Y2ggPSAxOworCWludCBfX2Fsd2F5c191bnVzZWQgZW1wdHlt
YXRjaCA9IDE7CiAKIAkvKiBmbHVzaCB0aGUgcGlwZWxpbmUgKi8KIAlpZiAoRG9DX2lzXzIwMDAo
ZG9jKSkgewotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
