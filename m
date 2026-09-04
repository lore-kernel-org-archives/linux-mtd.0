Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064B3C79F80
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 07:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ghTPLHoXi4n4ukwky9zX95pE1qZO0pQgsb7xY4kPUQg=; b=em201m2/t3rDc9
	eD3BFd3D/Zu20X0GBlINQqkqZmbibtfBc8Hyrj3qZ0IqvCLIDpyrTJjddCOFI8wBbuJyhsZNrmSim
	9vIQ2oJ4I1yJXV0FkD8MLJSHByyuQSfHbm4IAAi8nofKko7ES3kxRZjsR/xROlOOyZMA7MvgwhpmY
	1kEnNhpQd0q/ZYfXOx1hkwAsccy3zl0b/EYkTw1VcJyrDmn/fOqx0oPTWt2bivliCd60VhEmBjWr9
	kZnuTcm4s/cQhyz3Zqo7ogfZo+HR2s81kGhn2NmuIBAvtAWtyYfY8SetZ6I1y3YFxk0LjxP3Q8U+5
	ChthKIfeINAZyg3I20IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Obv-00000001GC7-2Wms;
	Fri, 04 Sep 2026 07:45:19 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Obr-00000001GAI-46MH
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 07:45:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 78E994E414FF;
	Fri,  4 Sep 2026 07:45:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 452596057F;
	Fri,  4 Sep 2026 07:45:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8EE1311C7A549;
	Fri,  4 Sep 2026 09:44:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788507908; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K5bb8hjZGz+CA4fl4HfW3Nb19eVE35fDNkkqntI3KtM=;
	b=BkK5GKVgZp+ghWls98Rz86XOPcLZq9tdZ5JNqERCRh+PVnwdrY2j32Y+fnFA1cGYVSr3m/
	5Ez8DSypjPeqmU61/HJDruvMoeeumcE20Pzj756efcRVJ1sBIhBo3rkhSNup06TqRY8wcP
	uLUA4kmZjT7wxXA7e5NnNWq/6r0u1kq4fhsSalqJKrmoovEroULjoOPDtuviv5zKb36N2V
	VSHtCysQUHCn3SbC0r3afwgWHqG9uZkDrNIEaG73LMv71ddNWSvt+Gsc0IR5OFreembRhB
	I85QHSwvIrOLN8GsL8S/hcPTg9NhsPC0eQ8E0m7oCLzf9lzQQZuLEQ+hOQrfLg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
  linux-mtd@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] mtd: rawnand: lpc32xx: Remove platform data support
 from drivers
In-Reply-To: <28de391b-59ed-4495-9b16-fde7b811d6fe@kernel.org> (Vladimir
	Zapolskiy's message of "Thu, 3 Sep 2026 16:23:20 +0300")
References: <20260903112425.1904748-1-vz@kernel.org>
	<878q5i4iz9.fsf@bootlin.com>
	<28de391b-59ed-4495-9b16-fde7b811d6fe@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 04 Sep 2026 09:44:59 +0200
Message-ID: <87wlt131fo.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_004516_157715_36620A58 
X-CRM114-Status: GOOD (  12.07  )
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

SGkgVmxhZGltaXIsCgpPbiAwMy8wOS8yMDI2IGF0IDE2OjIzOjIwICswMywgVmxhZGltaXIgWmFw
b2xza2l5IDx2ekBrZXJuZWwub3JnPiB3cm90ZToKCj4gSGkgTWlxdWVsLAo+Cj4gT24gOS8zLzI2
IDE1OjI4LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBIZWxsbyBWbGFkaW1pciwKPj4gT24gMDMv
MDkvMjAyNiBhdCAxNDoyNDoyMiArMDMsIFZsYWRpbWlyIFphcG9sc2tpeSA8dnpAa2VybmVsLm9y
Zz4KPj4gd3JvdGU6Cj4+IAo+Pj4gU2luY2UgTlhQIExQQzMyeHggU29DIHN1cHBvcnQgaW4gdGhl
IExpbnV4IGtlcm5lbCBzdHJpY3RseSBkZXBlbmRzIG9uCj4+PiBkZXZpY2UgdHJlZSBzdXBwb3J0
LCB0aGUgdW51c2VkIHBsYXRmb3JtIGRhdGEgc3VwcG9ydCBjYW4gYmUgcmVtb3ZlZAo+Pj4gZnJv
bSB0aGUgTFBDMzJ4eCBOQU5EIE1MQyBhbmQgU0xDIGRyaXZlcnMuCj4+Pgo+Pj4gVmxhZGltaXIg
WmFwb2xza2l5ICgyKToKPj4+ICAgIG10ZDogcmF3bmFuZDogbHBjMzJ4eF9zbGM6IFJlbW92ZSBw
bGF0Zm9ybSBkYXRhIHN1cHBvcnQKPj4+ICAgIG10ZDogcmF3bmFuZDogbHBjMzJ4eF9tbGM6IFJl
bW92ZSBwbGF0Zm9ybSBkYXRhIHN1cHBvcnQKPj4+Cj4+PiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3
L2xwYzMyeHhfbWxjLmMgfCAyMSArKy0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+ICAgZHJpdmVycy9t
dGQvbmFuZC9yYXcvbHBjMzJ4eF9zbGMuYyB8IDIxICsrLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4g
ICBpbmNsdWRlL2xpbnV4L210ZC9scGMzMnh4X21sYy5oICAgIHwgMTcgLS0tLS0tLS0tLS0tLS0t
LS0KPj4+ICAgaW5jbHVkZS9saW51eC9tdGQvbHBjMzJ4eF9zbGMuaCAgICB8IDE3IC0tLS0tLS0t
LS0tLS0tLS0tCj4+PiAgIDQgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA3MiBkZWxl
dGlvbnMoLSkKPj4+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvbXRkL2xwYzMy
eHhfbWxjLmgKPj4+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvbXRkL2xwYzMy
eHhfc2xjLmgKPj4gU2FzaGlrbyByYWlzZXMgYSBidWlsZCBpc3N1ZSBkdWUgdG8gdGhlIGNsZWFu
dXAgbWlzc2luZyBvbmUgdXNlIG9mIGEKPj4gaGVhZGVyLiBDYW4geW91IHBsZWFzZSBjaGVjaz8K
Pj4gCj4KPiBzdXJlLCBmcm9tIGl0cyByZXBvcnQgWzFdIEkgc2VlIHRoYXQgU2FzaGlrbyBib3Qg
dmVyaWZpZXMgdGhlIGNoYW5nZXMKPiBhZ2FpbnN0IHRvZGF5J3Mgb3V0ZGF0ZWQgdjcuMiwgYW5k
IHRoZXJlZm9yZSBpdCBwcm9kdWNlZCBhIGZhbHNlIHBvc2l0aXZlCj4gZXJyb3IsIHNpbmNlIHY3
LjMtcmMxIGNvbnRhaW5zIHRoZSBjb21taXQgZDZlZjQzOTE4OTdkICgiQVJNOiBscGMzMnh4Ogo+
IHJlbW92ZSBhIGZldyBtYW51YWxseSBwb3B1bGF0ZWQgT0YgZGV2aWNlcyIpLgo+Cj4gVGhlcmUg
c2hvdWxkIGJlIG5vIGJ1aWxkIGVycm9ycyBpbnRyb2R1Y2VkIGJ5IHRoaXMgc2VyaWVzLCB0aGFu
a3MgZm9yIHJldmlldy4KPgo+IFsxXSBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAy
NjA5MDMxMTI0MjUuMTkwNDc0OC0xLXZ6JTQwa2VybmVsLm9yZwoKSW4gdGhpcyBjYXNlIHRoYXQn
cyBhbGwgZ29vZCwgdGhhbmtzIGZvciBjaGVja2luZyEKCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
