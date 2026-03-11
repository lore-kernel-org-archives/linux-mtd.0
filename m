Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D67112584D
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 15:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KhI0+JeJyT8USJeWFpnV0LlYvQ1RLm0Yss1iJFpCC68=; b=V+8VeIpR3/pVfp
	ZCQSPzNIbbJl2fEy2obqIIlevSxlIg7gSVKX71Rz16HZ1RB2j57Nr5V/rGIiekx8iNcixiIK19tPA
	igkWr+3GotRIEPk6ZmZtsE3B0dI5x5yDldk9S0grGGKSTJQOTESEEUhd4gJ2fHMXFRV1lLwNtSVfu
	ZmSpBgjkpxqAvmqAWCuES19HEJ5CTnSC8r2KrcqGtP2+h8Lg40HMh9nJb3nyn1vV3/4C64k+kafiC
	82HJghkfaZTQAD0CCLPB4EDQ4/QHR+/FALr3v3JEqNv4npfgK9i+r0Ii+ERZ762PgPDj7wFFln06D
	CCLpNBZ24HKG3p07JLlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LZU-0000000BpU2-44ls;
	Wed, 11 Mar 2026 15:34:04 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LZR-0000000BpSq-13WR
	for linux-mtd@lists.infradead.org;
	Wed, 11 Mar 2026 15:34:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0CA214E4261B;
	Wed, 11 Mar 2026 15:33:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6FC460004;
	Wed, 11 Mar 2026 15:33:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F00610369D15;
	Wed, 11 Mar 2026 16:33:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773243238; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pTy3DqqPpSFrmPsZQ15NgsEtRD3wzrKWACFXiU+5GoQ=;
	b=w8Vatxjj1oqUKCK+SOIUrVKGQizHJwCgXVpt6lnk/i6yd2pVthUiKdqkZIsW7eMCAEv9VF
	y8ChuT1AGIwsYHCrwwMCljimiE9Mczbqyrsbbtvo7tSVhA463Mj0cFIJZFwnUxKwfAvF5v
	w9oH6xey5OTM8yIrIpFpXv40+P/YJYZBOscPBPTz+pZzm6c55Z8sdBP+kw4tNznXSUIYfz
	3pINhmS0+YCKmnD4xjhSYHrM9MrouKpItsr/dQ65AnTjvkLiptCFNHWNjy0y7ICWMsPkBd
	47olyQDZRUfhLO8yL4p8EeFioSS/HKkwKVecKYNiaqSA/yI2A6v/hkYX1FHmUA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, Kamal Dasu <kamal.dasu@broadcom.com>
Cc: masonccyang@mxic.com.tw, florian.fainelli@broadcom.com, 
 william.zhang@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260305194906.3007131-1-kamal.dasu@broadcom.com>
References: <20260305194906.3007131-1-kamal.dasu@broadcom.com>
Subject: Re: [PATCH] mtd: rawnand: serialize lock/unlock against other NAND
 operations
Message-Id: <177324323420.694817.17695802037153304830.b4-ty@bootlin.com>
Date: Wed, 11 Mar 2026 16:33:54 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_083401_425071_F2AB5C76 
X-CRM114-Status: UNSURE (   7.11  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAwNSBNYXIgMjAyNiAxNDo0OTowNiAtMDUwMCwgS2FtYWwgRGFzdSB3cm90ZToKPiBu
YW5kX2xvY2soKSBhbmQgbmFuZF91bmxvY2soKSBjYWxsIGludG8gY2hpcC0+b3BzLmxvY2tfYXJl
YS91bmxvY2tfYXJlYQo+IHdpdGhvdXQgaG9sZGluZyB0aGUgTkFORCBkZXZpY2UgbG9jay4gT24g
Y29udHJvbGxlcnMgdGhhdCBpbXBsZW1lbnQKPiBTRVRfRkVBVFVSRVMgdmlhIG11bHRpcGxlIGxv
dy1sZXZlbCBQSU8gY29tbWFuZHMsIHRoZXNlIGNhbiByYWNlIHdpdGgKPiBjb25jdXJyZW50IFVC
SS9VQklGUyBiYWNrZ3JvdW5kIGVyYXNlL3dyaXRlIG9wZXJhdGlvbnMgdGhhdCBob2xkIHRoZQo+
IGRldmljZSBsb2NrLCByZXN1bHRpbmcgaW4gY21kX3BlbmRpbmcgY29uZmxpY3RzIG9uIHRoZSBO
QU5EIGNvbnRyb2xsZXIuCj4gCj4gQWRkIG5hbmRfZ2V0X2RldmljZSgpL25hbmRfcmVsZWFzZV9k
ZXZpY2UoKSBhcm91bmQgdGhlIGxvY2svdW5sb2NrCj4gb3BlcmF0aW9ucyB0byBzZXJpYWxpemUg
dGhlbSBhZ2FpbnN0IGFsbCBvdGhlciBOQU5EIGNvbnRyb2xsZXIgYWNjZXNzLgo+IAo+IFsuLi5d
CgpBcHBsaWVkIHRvIG10ZC9maXhlcywgdGhhbmtzIQoKWzEvMV0gbXRkOiByYXduYW5kOiBzZXJp
YWxpemUgbG9jay91bmxvY2sgYWdhaW5zdCBvdGhlciBOQU5EIG9wZXJhdGlvbnMKICAgICAgY29t
bWl0OiBiYWIyYmM2ZTg1MGE2OTdhMjNiOWU1ZjBlMjFiYjhjMTg3NjE1ZTk1CgpQYXRjaGUocykg
c2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2Yg
dGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoK
S2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
