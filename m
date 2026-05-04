Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2127FF885A
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2026 13:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ktPifTi9DLNjjXVFe+3bhq8GpeZy6rIKrFzctuXgsdw=; b=3EJgqUGo8BVbQ4
	onLKm5fIIruesVUeFoupxVoN8CcQIiiOnoCBswO/RZPyM35T+65eRB0C8Vvw6pLK5wO3I0CQ3m9iG
	pCFcy7yxRTCBYW3NpiA11aAW5mgv7B4kMSYwV+W9WBT80iK2j21QmPGxhCE3O6s/MhByfCRjrJihg
	Bb0TfHm4WreGVIIkJ2k6msMI+QQHzvzuwhqNIvTwn0wpK/bxdSilojaA8usLneGzL+835wtW0xVR8
	b4aTeaHPs0RJPxEASd8jeJJw39rc+KDkIR/gIaWHM1ebgJwclhJiACb1Sjre6rgayxE383hiTqN7S
	zr+YihhSQxIgYg5fjung==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJtpC-0000000DN4t-1Kry;
	Mon, 04 May 2026 13:59:06 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJtp8-0000000DN44-3n3V
	for linux-mtd@lists.infradead.org;
	Mon, 04 May 2026 13:59:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9A7974E42BB8;
	Mon,  4 May 2026 13:58:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69A915FD5F;
	Mon,  4 May 2026 13:58:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B737E11AD2449;
	Mon,  4 May 2026 15:58:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777903138; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LVrH+hRa8k60712RPQs7XAU8jqIwLgDkBraOs0In2Cc=;
	b=KOoBPuZ8iPsqVJviZXRPur58W4+JFX2f+4e1Yw2f62tBEjd3M/aDEw1paPJy7ALa2H3qiA
	DGBZfFGDu+PCKMTqLGRCgqsBPtOg1zI1apECUFvNwyW230zpPrzczAmwnBusuwnnuy013J
	DEqVNFYwkAK1wsTRcLzbxR8X1ApVq6zAPansft6cn28IfpDvJAssHkX1K4JAI8Q1rJyH43
	/dQjB7cGMcrekjEwPSLABk+OXXQrbsvrkLjNMzgcHmqj5o+bwQZl9MFV8+Lyy/P48PmpzD
	eQFYHcXKEOasY8/e7LJtXeMmbBDmJxda19p/PwuSTJtn6SjuYp6cKX9CtVUGxg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vastargazing <vebohr@gmail.com>
Cc: linux-kernel@vger.kernel.org,  stable@vger.kernel.org,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  David Woodhouse <dwmw2@infradead.org>,  Lennert Buytenhek
 <buytenh@wantstofly.org>,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/5] mtd: maps: physmap: fix reference leak on failed
 device registration
In-Reply-To: <6717e0b2a6244ee4e691dba03eb8c790c202e89e.1777889235.git.vebohr@gmail.com>
	(Vastargazing's message of "Mon, 4 May 2026 13:08:45 +0300")
References: <cover.1777889235.git.vebohr@gmail.com>
	<6717e0b2a6244ee4e691dba03eb8c790c202e89e.1777889235.git.vebohr@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 04 May 2026 15:58:56 +0200
Message-ID: <87a4ufs2cf.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_065903_080909_C9A9171D 
X-CRM114-Status: GOOD (  11.97  )
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

T24gMDQvMDUvMjAyNiBhdCAxMzowODo0NSArMDMsIFZhc3RhcmdhemluZyA8dmVib2hyQGdtYWls
LmNvbT4gd3JvdGU6Cgo+IFdoZW4gcGxhdGZvcm1fZGV2aWNlX3JlZ2lzdGVyKCkgZmFpbHMgaW4g
cGh5c21hcF9pbml0KCksIHRoZSBlbWJlZGRlZAo+IHN0cnVjdCBkZXZpY2UgaGFzIGFscmVhZHkg
YmVlbiBpbml0aWFsaXplZCBieSBkZXZpY2VfaW5pdGlhbGl6ZSgpIGluc2lkZQo+IHBsYXRmb3Jt
X2RldmljZV9yZWdpc3RlcigpLiBUaGUgZXJyb3IgcGF0aCB1bnJlZ2lzdGVycyB0aGUgZHJpdmVy
IGJ1dAo+IHJldHVybnMgd2l0aG91dCBkcm9wcGluZyB0aGUgZGV2aWNlIHJlZmVyZW5jZToKPgo+
ICAgcGh5c21hcF9pbml0KCkKPiAgICAgLT4gcGxhdGZvcm1fZGV2aWNlX3JlZ2lzdGVyKCZwaHlz
bWFwX2ZsYXNoKQo+ICAgICAgICAtPiBkZXZpY2VfaW5pdGlhbGl6ZSgmcGh5c21hcF9mbGFzaC5k
ZXYpICAgLyoga3JlZiA9IDEgKi8KPiAgICAgICAgLT4gcGxhdGZvcm1fZGV2aWNlX2FkZCgmcGh5
c21hcF9mbGFzaCkgICAgIC8qIGZhaWxzICovCj4gICAgIDwtIHBsYXRmb3JtX2RyaXZlcl91bnJl
Z2lzdGVyKCkgY2FsbGVkLCBidXQga3JlZiBzdGlsbCAxCj4KPiBQZXIgcGxhdGZvcm1fZGV2aWNl
X3JlZ2lzdGVyKCkga2VybmVsLWRvYzoKPgo+ICAgTk9URTogX05ldmVyXyBkaXJlY3RseSBmcmVl
IEBwZGV2IGFmdGVyIGNhbGxpbmcgdGhpcyBmdW5jdGlvbiwgZXZlbiBpZgo+ICAgaXQgcmV0dXJu
ZWQgYW4gZXJyb3IhIEFsd2F5cyB1c2UgcGxhdGZvcm1fZGV2aWNlX3B1dCgpIHRvIGdpdmUgdXAg
dGhlCj4gICByZWZlcmVuY2UgaW5pdGlhbGlzZWQgaW4gdGhpcyBmdW5jdGlvbiBpbnN0ZWFkLgo+
Cj4gRml4IHRoaXMgYnkgY2FsbGluZyBwbGF0Zm9ybV9kZXZpY2VfcHV0KCkgYmVmb3JlIHVucmVn
aXN0ZXJpbmcgdGhlIGRyaXZlci4KPgo+IEZpeGVzOiA3MzU2NmVkZjliOTEgKCJbTVREXSBDb252
ZXJ0IHBoeXNtYXAgdG8gcGxhdGZvcm0gZHJpdmVyIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVs
Lm9yZwo+IEFzc2lzdGVkLWJ5OiBHaXRIdWIgQ29waWxvdCAoQ2xhdWRlIFNvbm5ldCA0LjUpCj4g
U2lnbmVkLW9mZi1ieTogVmFzdGFyZ2F6aW5nIDx2ZWJvaHJAZ21haWwuY29tPgoKU29tZWhvdyBi
NCBhcHBsaWVkIGFub3RoZXIgcGF0Y2ggZnJvbSB0aGF0IHNlcmllcywgSSdtIG5vdCBzdXJlIHdo
eS4gSQpqdXN0IGRyb3BwZWQgaXQuIFBsZWFzZSByZXNlbmQgdGhpcyBwYXRjaCBhbG9uZS4KCkFs
c28sIHlvdXIgU29CIGxpbmUgc2VlbXMgdG8gYmUgaW5jb3JyZWN0LCB3ZSBuZWVkIGEgcHJvcGVy
IG5hbWUsIHBsZWFzZQpoYXZlIGEgbG9vdCBhdCB0aGUgRENPLgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
