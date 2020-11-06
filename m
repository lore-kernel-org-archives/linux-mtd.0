Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A544C2D0A3
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:39:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7967208C7
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:39:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f2rpVO6O";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YuusY46l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7967208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n/DTXePThcgrH6HMtQaU/usSvTmxDbR/cIp+unxHlng=; b=f2rpVO6Orfg6S4g0xIEjxpTMF
	YK9GSvT5jKoCu/ZKU00CXmo45PWOR7dOqSVudaofQCtlBuDToolwsBLnoakbPZ24CxObq6BWIwgpC
	sIHph3/nb2nqv73KWv+E7jPwvyGuOTCXr0DAgkgIzIyoVtwqB8yP4DxykAwwgG6z8pRWzepNR8Jwu
	gdbP2YnC9FpbtXfO1QR5XApcKfO81QdAYe9H/NM4SlKB6QJK2aYRjnyfoahvAuVCRhn94oQT1K7ye
	z5jsDWWuI5pJrcIfB+ObwCYcpGFA2yi92CCuI6bDzJeNxVZQxyXOTaBaqWKYcMo7Nhr+SZKVH+lmd
	AAsvLdJZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb9Rr-0003Zh-39; Fri, 06 Nov 2020 21:39:07 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb9Q8-0002eE-KW
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 21:37:24 +0000
Received: by mail-wr1-x444.google.com with SMTP id n15so2765925wrq.2
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2020 13:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zU6AEe7QJ86BUUdNT9vgeNl78+UInfUWOmxhJubmBR0=;
 b=YuusY46lidvYZNZcyIlP029LugBzFM5/o75ceo7IvkH//GmrbJTHOAsMyoRKekOXtQ
 TMitq0JQgNzh3BTtq1WMw7iHMlVscy6Pm0oe+l3nNt7n3n58MDHtM1EgF5zfaxwvzpej
 TrplfRFEutXmar5oP3bwEM/W2dm2yvMrpuTx2ZmGIUVIQ1qysS9V7ChRifCaiMV2VLli
 Z6eIumohXtw/X03cudUHrEE4fE8PNkpyvpHPyHsyDCwlxgc1xtzbCYB6P2eQTjFfiaDI
 PkJJ9KI6WIdnWirDj9iQCXiQ8OV6wQLGf1xhikpyTW4Lge5bH3lIbJzAe3MfnGOBtvBX
 gCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zU6AEe7QJ86BUUdNT9vgeNl78+UInfUWOmxhJubmBR0=;
 b=nZTk+i1mCPgH8TZ9FRKYIP7fsglyA13/7nrHeRiF6o5pElnyIQ+kxiBWrAKtso+FDt
 Y7IibMDcDDNuUiopnINlPWwdMOrEaROpNCrVUiusIYJdPam9Ku6gvCsSNLv+Ecl5Z+Qm
 0kTjvis8foeStro5IW12zz+fMG5mnzxtPobkRzb0NqoVAAZGGd1NfMT3QhuSDLGi5gA6
 eEW9GIijxabCRIq6QW1/MGqitmAuzaOWZStoh+Fh6cbXjKue1hoW7IHGKmKxaIU31DiV
 9ayoUV5SaOmvY7mIaZcn4uK1gl7ds89TOI+Ktmnn8ntqsv5U2Af8RhHoEUrJ+kWh/0Hb
 IB6Q==
X-Gm-Message-State: AOAM531SkC5fKIHGak4Qu4O2MwPShQP5GWr3rvnaMIwcwnbqZHP2jNeQ
 0352BDuiWS0rEiw1wYj9cqgndw==
X-Google-Smtp-Source: ABdhPJy0Ln9YOb1EajhIy7Mo7bt888ijqJbJAEpFYJf3GJYPpvuee8zVbgMhCF7sJ2CcQerM5hcZHQ==
X-Received: by 2002:adf:fd06:: with SMTP id e6mr4794908wrr.206.1604698639476; 
 Fri, 06 Nov 2020 13:37:19 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id d16sm3984942wrw.17.2020.11.06.13.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:37:18 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v2 15/23] mtd: nand: raw: diskonchip: Marking unused variables
 as __always_unused
Date: Fri,  6 Nov 2020 21:36:47 +0000
Message-Id: <20201106213655.1838861-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_163720_805141_186B04CE 
X-CRM114-Status: GOOD (  19.82  )
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
Cc: Dan Brown <dan_brown@ieee.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
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
Q2M6IERhdmlkIFdvb2Rob3VzZSA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4KQ2M6IFRob21hcyBHbGVp
eG5lciA8dGdseEBsaW51dHJvbml4LmRlPgpDYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5v
cmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9kaXNrb25jaGlwLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvZGlza29uY2hpcC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZGlza29uY2hp
cC5jCmluZGV4IDk0NDMyYTQ1M2U1ZWUuLmQ1MDUwZTMyY2M0MjEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvbXRkL25hbmQvcmF3L2Rpc2tvbmNoaXAuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9k
aXNrb25jaGlwLmMKQEAgLTIxNiw3ICsyMTYsNyBAQCBzdGF0aWMgaW50IGRvY19lY2NfZGVjb2Rl
KHN0cnVjdCByc19jb250cm9sICpycywgdWludDhfdCAqZGF0YSwgdWludDhfdCAqZWNjKQogCiBz
dGF0aWMgdm9pZCBEb0NfRGVsYXkoc3RydWN0IGRvY19wcml2ICpkb2MsIHVuc2lnbmVkIHNob3J0
IGN5Y2xlcykKIHsKLQl2b2xhdGlsZSBjaGFyIGR1bW15OworCXZvbGF0aWxlIGNoYXIgX19hbHdh
eXNfdW51c2VkIGR1bW15OwogCWludCBpOwogCiAJZm9yIChpID0gMDsgaSA8IGN5Y2xlczsgaSsr
KSB7CkBAIC03MDMsNyArNzAzLDcgQEAgc3RhdGljIGludCBkb2MyMDB4X2NhbGN1bGF0ZV9lY2Mo
c3RydWN0IG5hbmRfY2hpcCAqdGhpcywgY29uc3QgdV9jaGFyICpkYXQsCiAJc3RydWN0IGRvY19w
cml2ICpkb2MgPSBuYW5kX2dldF9jb250cm9sbGVyX2RhdGEodGhpcyk7CiAJdm9pZCBfX2lvbWVt
ICpkb2NwdHIgPSBkb2MtPnZpcnRhZHI7CiAJaW50IGk7Ci0JaW50IGVtcHR5bWF0Y2ggPSAxOwor
CWludCBfX2Fsd2F5c191bnVzZWQgZW1wdHltYXRjaCA9IDE7CiAKIAkvKiBmbHVzaCB0aGUgcGlw
ZWxpbmUgKi8KIAlpZiAoRG9DX2lzXzIwMDAoZG9jKSkgewotLSAKMi4yNS4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
