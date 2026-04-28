Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8027BFF885D
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2026 08:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5IkwsjaIOeWKQx3hialG/rbLiQaGRl34643R7EV/e9w=; b=heJlTxSmNDiPuN
	UYhtfA5GHkSKgzG6DhvwlXFLlC5oFba1WqG9GnqkLAFztW4t4tmuhBvWVgQUhR4smgZcjQNmqbuuM
	KXgeTmE8w2b/T4sqpHJyhN/xFWKH3YlbtXOSesG53fHr9h9bPXT5Zuig99a1LFivbtEarcI+jpMlr
	kIOibPbLcvw+3WiC+5kKGt0o+1t4LSQyLd0pV6HhGAMyKxTTFFj5REvJSSxpgNag/FSv7hRYAgvFH
	FcEBsVeXVe2+5Io3XMeU1AlhUahfv0SOEUlGLELXjQ/j7y0Os2JhNgMtzpdfDOybJUQPtt92AqipG
	LCB/Alzf5emY9gD2rYjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdg9-00000000sGH-3mGt;
	Tue, 28 Apr 2026 08:20:25 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdg6-00000000sF8-0P6m
	for linux-mtd@lists.infradead.org;
	Tue, 28 Apr 2026 08:20:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2E9AB1A3474;
	Tue, 28 Apr 2026 08:20:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EB2B4601D0;
	Tue, 28 Apr 2026 08:20:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C1F1107284EB;
	Tue, 28 Apr 2026 10:20:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777364419; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9aXcY0AV1qtSnfN/bX+A0N9tMeZsDrVOfumXOkBSD/U=;
	b=Ygwqy2Ad16PHxg6Azhkhz4AXBcHgjyHdY6MAccdU6RO9tB4gOirALtlRTrvC3peVLG+yaF
	4TO82X+auIp/OdOTI4WiiuHIyz8mMLX/sxYZnV6xMxJjVsx3ujzntXYaS1E97hstNXUZqJ
	3Y2Y8KN8LfDsC1E6aZXCqZRKDuzVn7C1Ddkl3jR6LzUS/qcnuaAItxc3wi5CFExaCVuhm/
	+UBDgggQuj4Oe6KmRByLHRmRBaB0VVN9D5umw95A9bTw9IcQALa9UuTmm93yOwMZSgwmEA
	xBvzmvc0mVaXdGbaNXXO3pvcENSBEoPkI9fbFibm17iXOM+UZvUFraul76JuWQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David Laight <david.laight.linux@gmail.com>,  Lukas Wunner
 <lukas@wunner.de>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Andrew Morton
 <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
In-Reply-To: <ae-FLk1N3wJs8sTW@ashevche-desk.local> (Andy Shevchenko's message
	of "Mon, 27 Apr 2026 18:47:58 +0300")
References: <20260408211407.2295175-1-andriy.shevchenko@linux.intel.com>
	<20260409082611.73fac9ab@pumpkin> <addcJP2erqYh8pD2@wunner.de>
	<20260409122846.7d08d2b4@pumpkin>
	<ad41TpzL4onrcKzn@ashevche-desk.local> <87ik9cfm6g.fsf@bootlin.com>
	<ae-FLk1N3wJs8sTW@ashevche-desk.local>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 28 Apr 2026 10:20:16 +0200
Message-ID: <87pl3jebsv.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_012022_265346_145B7C0E 
X-CRM114-Status: GOOD (  15.12  )
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

Cj4+ID4+ID4gU3RhY2sgdXNhZ2UgaXMgaGlnaCBoZXJlIGJlY2F1c2Ugb2YgdGhlIHRocmVlICJt
YXBfd29yZCIgdHlwZXMsCj4+ID4+ID4gd2hpY2ggY2FuIGVhY2ggYmUgdXAgdG8gMjU2IHVuc2ln
bmVkIGxvbmdzICgzMiAqIDgpLCBzZWUgdGhlCj4+ID4+ID4gZGVmaW5pdGlvbnMgb2YgTUFYX01B
UF9MT05HUywgTUFYX01BUF9CQU5LV0lEVEgsIG1hcF93b3JkIGluCj4+ID4+ID4gaW5jbHVkZS9s
aW51eC9tdGQvbWFwLmguCj4+ID4+IAo+PiA+PiBVZ2cgLSB0aGF0IGNvZGUgaXMgaG9ycmlkLgo+
PiA+PiBSZXR1cm5pbmcgc3RydWN0dXJlcyBieSB2YWx1ZSBpc24ndCByZWFsbHkgYSBnb29kIGlk
ZWEuCj4+IAo+PiBMb29rcyBsaWtlIHRoZSBwcmltYXJ5IHJlYXNvbiBmb3IgdGhlIHN0YWNrIG92
ZXIgdXNhZ2UsIG5vPyBJc24ndAo+PiBwbGF5aW5nIHdpdGggaW5saW5lIGFuZCByZWZhY3Rvcmlu
ZyBqdXN0IGEgdGlueSBmaXggdGhhdCBwcmV2ZW50cwo+PiBwcm9ibGVtIGJ5IGp1c3QgYSBjb3Vw
bGUgb2YgYnl0ZXM/Cj4+IAo+PiBJIGhhdmVuJ3QgbG9va2VkIHRvbyBjYXJlZnVsbHksIGJ1dCBj
b3VsZCB3ZSAoQW5keT8pIGhhdmUgYSBmaXggdGhhdAo+PiByZWR1Y2VzIHRoZSBudW1iZXIgb2Yg
bWFwX3dvcmQgKGFzIHN1Z2dlc3RlZCwgSUlVQykgYW5kL29yIGF2b2lkIHBhc3NpbmcKPj4gdGhl
bSBieSB2YWx1ZT8KPgo+IEkgYW0gbm90IGFuIGV4cGVydCBmb3IgdGhpcyBwYXJ0aWN1bGFyIGNo
YW5nZSwgSSBhbSBhZnJhaWQuCgpTdXJwcmlzaW5nIGZsYW5uZWwgZnJvbSBzb21lb25lIHNvcmVs
eSBpbnNpc3RpbmcgdG8gZm9yY2UgY29udHJpYnV0b3JzCmludG8gZG9pbmcgemlsbGlvbnMgbW9y
ZSBjaGFuZ2VzIHRoYW4gdGhleSBpbml0aWFsbHkgd2FudGVkLCBlYXNpbHkKdHJpZ2dlcmluZyBp
bmlxdWl0b3VzbHkgTkFDS3Mgb3RoZXJ3aXNlLgoKPiBDb25zaWRlciBteSBwYXRjaAo+IGFzIGEg
YnVnIHJlcG9ydCB0aGF0IG5lZWRzIHRvIGJlIGFkZHJlc3NlZCwgQ3VycmVudGx5IGl0IG1pZ2h0
IGJyZWFrIHNvbWUKPiBidWlsZHMgd2hlbiBgbWFrZSBXPTFgIGlzIHBhc3NlZC4KCkhvcGVmdWxs
eSB5b3Ugd2lsbCByZW1lbWJlciB0aGF0IHlvdSBoYXZlIHlvdXIgb3duIGxpbWl0cyB0b28uIE1h
eWJlCnRoYXQgd2lsbCBhbGxvdyBvdGhlcnMgdG8gYnJlZXplIG5leHQgdGltZSB0aGVyZSB3aWxs
IGJlIHNvbWV0aGluZyB0aGF0Cm1hdHRlcnMgc28gbXVjaCB0byB5b3UgdGhhdCB5b3UgcHJlZmVy
IHRvIGZ1bGx5IGJsb2NrIHRoZWlyIHdvcmsuCgo+PiBJIGNhbiBhbHNvIHRha2UgdGhpcyBjbGVh
bnVwIGlmIGVuY2xvc2VkIGluIGEgYmlnZ2VyCj4+IHNlcmllcywgSSBkb24ndCBtaW5kIGJlY2F1
c2UgaXQgbWF5IG1ha2UgdGhlIGNvZGUgZWFzaWVyIHRvIHJlYWQgYXMKPj4gd2VsbCwgYnV0IEkg
ZmVlbCBsaWtlIHRoaXMgaXMgbm90IGEgcHJvcGVyIGZpeC4gSWYgaXQgaXMsIHBsZWFzZSBleHBs
YWluCj4+IHRvIG1lIGFnYWluIDotKQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
