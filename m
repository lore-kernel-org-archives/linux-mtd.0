Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB5D606A32E
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Oct 2026 10:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bsfz/SYO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=AQxVeyyb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=j2UIhZmbgqdvG0DbAXFV6cbEa726x+FOp87ljyNZQ3U=; b=bsfz/SYOyPjlh+td6U8vV5ZtZ0
	JcovnSgiJDN9IzwpKYzP8ihlJ+7JURtSlJ8N15tw5pZgh5r0TRTxmGWsDofaprrlLuaVKreLOJlxZ
	NXNvNVK7mjfZyNsEjIuuo0mC81kWSgUIQ1Xc/i71T+JA/pdhpbBGVC/tGqYFDBxP+BrGM/SmxYVYb
	8Y5TGbnnm6Gy127ZvnQvKvLrDKcYxQpGDSlS381sv59L2tzSyP7azvUN8c7SsF96U3zyd4BF9lDyK
	L5MK4tM5EKDItdmADAMwpNC8zaWZcgUX7sW2yeifydTBsDbDdR5a+Btrae1ZfvSLMCzHtKT4A88Bm
	/mo3NPrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqOY-0000000Dy4q-273p;
	Thu, 22 Oct 2026 10:51:38 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqOV-0000000Dy48-2uJd
	for linux-mtd@lists.infradead.org;
	Thu, 22 Oct 2026 10:51:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 937621A12C1
	for <linux-mtd@lists.infradead.org>; Thu, 22 Oct 2026 10:51:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A92C60360;
	Thu, 22 Oct 2026 10:51:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4ACD310328D6E;
	Thu, 22 Oct 2026 12:51:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792666292; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=b7ihbGSWVLPuUe+7XubAjvHWls5cuf5rKU39/PaWcuw=;
	b=AQxVeyybWvNhpYdzlh8vAq4aInIZo7CBTAdsck0AVY3jEC1K75GkphIP4SVc8imY93RBR2
	l8+P0nokuVroD4uwhJnKWHztaqo2GE1PzxkRbKMzSrpetwopybBppJOUdsnzfoAE8KedcJ
	PjjLBUHd/h4hflbypURLAOeAm8Cu8CGbTqEdS0DLDv0wvQDFSEwdSWBUJs1dVt9OYiRsRp
	ZzNXb1tY9RWuIWPsrMlfh1Us37b5z3SlaKJT4WpOkFIczRuwRTN56eZeylh8VDYKWlzrQR
	lVPWtf945X2Tw+OhODpl4sW56m+gHkjKxK53C8QSNtcjrR7Kp9dYbS99xo7s4A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: haibo.chen@oss.nxp.com
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  imx@lists.linux.dev,  michael@walle.cc,
  Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v4] mtd: spi-nor: clear the default read_sr2 opcode for
 Octal DTR flashes
In-Reply-To: <20261022-spi-nor-fix-v4-1-fba3ec3d2b5e@nxp.com> (haibo chen's
	message of "Thu, 22 Oct 2026 18:45:16 +0800")
References: <20261022-spi-nor-fix-v4-1-fba3ec3d2b5e@nxp.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 22 Oct 2026 12:51:29 +0200
Message-ID: <87o6cmovny.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_035135_869327_98D0D49B 
X-CRM114-Status: GOOD (  18.38  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMjIvMTAvMjAyNiBhdCAxODo0NToxNiArMDgsIGhhaWJvLmNoZW5Ab3NzLm54cC5jb20gd3Jv
dGU6Cgo+IEZyb206IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4KPgo+IFRoZSBjb3Jl
IGRlZmF1bHRzIG9wY29kZXMucmVhZF9zcjIgdG8gdGhlIGxlZ2FjeSBSRENSIG9wY29kZSAoMHgz
NSksIGFuZAo+IHNwaV9ub3JfY2FjaGVfc3JfbG9ja19iaXRzKCkgcmVhZHMgU1IyIGR1cmluZyBz
cGlfbm9yX2luaXQoKSwgaS5lLiBhZnRlcgo+IHRoZSBmbGFzaCBoYXMgYmVlbiBzd2l0Y2hlZCB0
byBpdHMgcnVudGltZSBwcm90b2NvbC4gT24gYW4gb2N0YWwgZmxhc2gKPiBydW5uaW5nIGluIDhE
LThELThEIG1vZGUgdGhlIG9wY29kZSBpcyBleHRlbmRlZCBwZXIgY21kX2V4dF90eXBlIChlLmcu
Cj4gMHgzNTM1KSwgYnV0IFJEQ1IgaXMgbm90IGEgdmFsaWQgcmVnaXN0ZXIgcmVhZCB0aGVyZTog
dGhlc2UgcGFydHMgYWNjZXNzCj4gdGhlaXIgc3RhdHVzL2NvbmZpZ3VyYXRpb24gcmVnaXN0ZXJz
IHRocm91Z2ggYSB2ZW5kb3Itc3BlY2lmaWMgaW5kaXJlY3QKPiBzcGFjZSwgaWYgYXQgYWxsLiBU
aGUgZmxhc2ggZG9lcyBub3QgYW5zd2VyLCB0aGUgcmVnaXN0ZXIgcmVhZCB0aW1lcyBvdXQKPiBh
bmQgcHJvYmUgKG9yIHJlc3VtZSkgZmFpbHMgKG9uIGkuTVggRmxleFNQSTogLUVUSU1FRE9VVCBh
bmQgYSBjb250cm9sbGVyCj4gV0FSTigpLCBzZWVuIHdpdGggYSBNaWNyb24gTVQzNVhVMDFHIGFu
ZCBhIE1hY3Jvbml4IE1YMjVVVzUxMzQ1RykuCj4KPiBDbGVhciByZWFkX3NyMiBvbiBldmVyeSBw
YXRoIHRoYXQgZW5hYmxlcyA4RC04RC04RCwgc28gdGhhdAo+IHNwaV9ub3JfcmVhZF9zcjFfYW5k
X3NyMigpIGRlZ3JhZGVzIHRvIGFuIFNSMS1vbmx5IHJlYWQgYW5kIG5vCj4gdW5zdXBwb3J0ZWQg
Y29tbWFuZCBpcyBpc3N1ZWQuIEEgbWFudWZhY3R1cmVyIGRyaXZlciB0aGF0IGdlbnVpbmVseQo+
IG5lZWRzIGFuIFNSMiByZWFkIGluIHRoaXMgbW9kZSBjYW4gc3RpbGwgaW5zdGFsbCBpdHMgb3du
IG9wY29kZSBpbiBhCj4gbGF0ZXIgZml4dXAuCj4KPiAtIHNwaV9ub3JfcGFyc2VfcHJvZmlsZTEo
KTogdGhlIGNvbW1vbiBjYXNlLiBUaGUgeFNQSSBQcm9maWxlIDEuMCB0YWJsZQo+ICAgZG9lcyBu
b3QgZGVzY3JpYmUgYW55IFNSMi9SRENSIHJlYWQsIGFuZCBpdCBydW5zIGJlZm9yZSB0aGUKPiAg
IG1hbnVmYWN0dXJlciBsYXRlX2luaXQuCj4gLSBtdDM1eHU1MTJhYmFfcG9zdF9zZmRwX2ZpeHVw
KCk6IHNvbWUgbXQzNXh1NTEyYWJhIGJhdGNoZXMgbGFjayB0aGUKPiAgIFByb2ZpbGUgMS4wIHRh
YmxlIGFuZCBlbmFibGUgOEQgaGVyZSBpbnN0ZWFkLCB3aXRoIHRoZSBCRlBUIFFFUiBmaWVsZAo+
ICAgbGVmdCBhdCBhIHJlc2VydmVkIHZhbHVlIHNvIHJlYWRfc3IyIGtlZXBzIGl0cyBSRENSIGRl
ZmF1bHQuCj4gLSBzcGlfbm9yX25vX3NmZHBfaW5pdF9wYXJhbXMoKTogbm9uLVNGRFAgcGFydHMg
dGhhdCBlbmFibGUgOEQgdmlhCj4gICBTUElfTk9SX09DVEFMX0RUUl9SRUFEIGtlZXAgdGhlIFJE
Q1IgZGVmYXVsdCB0b28uCj4KPiBDTVAgKHRoZSBvbmx5IHVzZXIgb2YgU1IyIGJleW9uZCBxdWFk
LWVuYWJsZSBpbiB0aGUgbG9ja2luZyBjb2RlKSBpcwo+IFdpbmJvbmQtc3BlY2lmaWMgYW5kIGlz
IG5vdCBwbGFjZWQgaW4gU1IyIG9uIHRoZWlyIDhELWNhcGFibGUgcGFydHMsIHNvCj4gbm8gb2N0
YWwgZmxhc2ggbG9zZXMgYSB1c2FibGUgU1IyIHJlYWQgYmVjYXVzZSBvZiB0aGlzIGNoYW5nZS4K
Pgo+IEZpeGVzOiBiN2I2MzQ3NTkwM2MgKCJtdGQ6IHNwaS1ub3I6IENyZWF0ZSBhIGxvY2FsIFNS
IGNhY2hlIikKCklzIHRoaXMgc3RpbGwgcmVsZXZhbnQ/Cgo+IEZpeGVzOiA2MzQ4OTAwMmQzOTcg
KCJtdGQ6IHNwaS1ub3I6IFJlZmFjdG9yIFJlYWQgU3RhdHVzL1dyaXRlIFN0YXR1cwo+IHN1cHBv
cnQiKQoKV2lsbCBiZSBtZXJnZWQgaW4gdGhlIG5leHQgY3ljbGUsIHNvIENjOiBzdGFibGUgaXMg
cHJvYmFibHkgcmVxdWlyZWQuCgo+IFNpZ25lZC1vZmYtYnk6IEhhaWJvIENoZW4gPGhhaWJvLmNo
ZW5AbnhwLmNvbT4KPiAtLS0KClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPgoKPiBDaGFuZ2VzIGluIHY0Ogo+IC0gRm9sbG93aW5nIHRoZSBTYXNo
aWtvIHJldmlldyBhbmQgTWlxdWVsJ3MgcHJlZmVyZW5jZSwga2VlcCB0aGUKPiAgIGNhcGFiaWxp
dHktYmFzZWQgY2xlYXIgYnV0IGNvdmVyIGV2ZXJ5IHBhdGggdGhhdCBlbmFibGVzIDhELThELThE
LCBub3QKPiAgIG9ubHkgdGhlIHhTUEkgUHJvZmlsZSAxLjAgb25lOgo+ICAgICAtIHNwaV9ub3Jf
cGFyc2VfcHJvZmlsZTEoKSAodGhlIGNvbW1vbiBjYXNlLCBhbHJlYWR5IGluIHYzKSwKPiAgICAg
LSBtdDM1eHU1MTJhYmFfcG9zdF9zZmRwX2ZpeHVwKCk6IHNvbWUgYmF0Y2hlcyBsYWNrIHRoZSA4
RCBjb21tYW5kCj4gICAgICAgaW5mbyBpbiBTRkRQIHNvIFByb2ZpbGUgMS4wIHBhcnNpbmcgbWF5
IG5vdCBjbGVhciBpdCwKPiAgICAgLSBzcGlfbm9yX25vX3NmZHBfaW5pdF9wYXJhbXMoKTogbm9u
LVNGRFAgcGFydHMgdXNpbmcKPiAgICAgICBTUElfTk9SX09DVEFMX0RUUl9SRUFELgo+IC0gQ2hl
Y2tlZCBhbGwgdmVuZG9yIGRyaXZlcnM7IE1pY3JvbiBpcyB0aGUgb25seSBvbmUgdGhhdCBlbmFi
bGVzIDhECj4gICBvdXRzaWRlIFByb2ZpbGUgMS4wIHBhcnNpbmcuIE1hY3Jvbml4IGFuZCBDeXBy
ZXNzIHJlbHkgb24gUHJvZmlsZQo+IDEuMC4KCldpbmJvbmQgYXMgd2VsbCAoc2VlIG15IFcyNVF4
eFBXIHNlcmllcykuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
