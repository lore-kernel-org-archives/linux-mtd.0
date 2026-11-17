Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BFB606A88A
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 08:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D88ddJqp;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=AsU506er
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y9TgVeianu2PmzhpUK78VVwmR9TxbAejRmylFzApGgw=; b=D88ddJqp15j6PCzEYO7/y0KJtX
	NhRgxKDw5VAb+C1AWkW+nyI+TxziloDlSBkl8/YI1/Tn1X027D24E+oxNgIMIKltc5PzZzdMCQiB3
	L/pIxUdV9LhK+VOC7aanXfpACO4KitByrYTpulbPHJY/uIMgbUJcG89nrh/FwQcEacg1ArI0zEB3C
	BM4AmWjMX7S2hQ0FNIWM9RaFYWqFftH7xhOajzKpVfPS8fACEGMn1sHcM1Xavc2FGUD45dYkHRwt6
	bnooDpIei8HQSYDhna8vJHUOF7XhZ2sMPb+oeLy4hUTSUQI5Ctt4cjMoY+0vQe3jQeFjyMgy4fM7r
	wECf4tcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEgQ-00000004uvO-1m3e;
	Tue, 17 Nov 2026 08:36:54 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEgM-00000004ut2-0Zs8
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 08:36:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F03841A0645;
	Tue, 17 Nov 2026 08:36:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C4E1B5FC81;
	Tue, 17 Nov 2026 08:36:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 184B511BC0882;
	Tue, 17 Nov 2026 09:36:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794904605; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+rt8l0v/At6PFtno2muHKdqjj7JcDP6NxMEHwxMuVS8=;
	b=AsU506erBJz6PaUNjlCbNZ6is140A1yJYcYh+Ej33Jgz5Y0NRubqdeDngpxA3sGmNqnLTn
	l/JmLBaoOkwMe5Fdoac8UOXtjovT0bLbdsNSwlIqJlhuhba0TgwR564du7cMGobW8Bv8LR
	IH8kE/Rw/1A0QvZDLHiCdP9VB96GbaQTVu24cQppJ9hPn4xiBio/fwVr0EUDSoB6DZ2KtU
	BQFqZUrM5Au2V3of0egoKYgZILCFP1KJh53MVuTWwqYuUOHKsSqRcLGPUbloWZjtwkClq9
	7y3xyQXUH3AKcLZymUPby8zjt2Rv3ljv2WFgj5n1jBBwuYglgtiTvOlntApu3Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vitaliy Sochnev <sochnev.v.74@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Mikhail Zhilkin <csharper2005@gmail.com>
Subject: Re: [PATCH] mtd: spinand: confirm ready state on SkyHigh S35ML chips
In-Reply-To: <20261116192714.320454-1-sochnev.v.74@gmail.com> (Vitaliy
	Sochnev's message of "Mon, 16 Nov 2026 21:27:14 +0200")
References: <20261030203342.91172-1-sochnev.v.74@gmail.com>
	<87eccksvwn.fsf@bootlin.com>
	<20261116192714.320454-1-sochnev.v.74@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 09:36:42 +0100
Message-ID: <87tslfonvp.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_003650_485589_1892CF7B 
X-CRM114-Status: GOOD (  18.54  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVml0YWx5LAoKT24gMTYvMTEvMjAyNiBhdCAyMToyNzoxNCArMDIsIFZpdGFsaXkgU29jaG5l
diA8c29jaG5ldi52Ljc0QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEhpIE1pcXXDqGwsCj4KPiBJIGlu
c3RydW1lbnRlZCB0aGUgU2t5SGlnaCBTUEktTkFORCBwYXRoIG9uIGEgTm9raWEgWEctMDQwRy1N
RCB3aXRoCj4ga3RpbWVfZ2V0X25zKCkgYW5kIGJvdW5kZWQga2VybmVsIGxvZyBtZXNzYWdlcywg
d2l0aG91dCB0cmFjaW5nLiBXaXRoCj4gSU5GTyBtZXNzYWdlcyBzdXBwcmVzc2VkIG9uIHRoZSBz
ZXJpYWwgY29uc29sZSwgNTEyIHBhZ2UtbG9hZCB3YWl0cywgNTEwCj4gcHJvZ3JhbSB3YWl0cyBh
bmQgOCBlcmFzZSB3YWl0cyByZXR1cm5lZCBSRUFEWSBvbiBib3RoIHRoZSBwb2xsZWQgcmVzdWx0
Cj4gYW5kIHRoZSBzdWJzZXF1ZW50IHN0YXR1cyByZWFkLiBUaGUgcGFpcnMgd2VyZSAweDAwLzB4
MDAsIGV4Y2VwdCBmb3IKPiBuaW5lIDB4MTAvMHgxMCByZWFkIHBhaXJzICgx4oCTMiBjb3JyZWN0
ZWQgYml0LWZsaXBzIGFjY29yZGluZyB0byB0aGUKPiBTa3lIaWdoIGRyaXZlcjsgU1RBVFVTX0JV
U1kgY2xlYXIpLiBJIGRpZCBub3QgY2FwdHVyZSBhIFJFQURZLXRvLUJVU1kKPiB0cmFuc2l0aW9u
IGluIHRoZXNlIGF0dGVtcHRzLgo+Cj4gRm9yIDEyOCByZWFkIHdhaXRzLCBJIGFsc28gcmVjb3Jk
ZWQgdGhlIGluZGl2aWR1YWwgR0VUX0ZFQVRVUkUKPiB0cmFuc2FjdGlvbnM6IGVhY2ggaGFkIEJV
U1kgKDB4MDEgb3IgMHgxMSksIHRoZW4gUkVBRFkgKDB4MDAgb3IgMHgxMCksCj4gZm9sbG93ZWQg
YnkgYSBSRUFEWSBjb25maXJtYXRpb24uIFRoZSBwb2xsIHRyYW5zYWN0aW9ucyB0b29rIDEwLjgw
4oCTMTcuMDgKPiB1cy4gVGhlIGludGVydmFsIGZyb20gY29tcGxldGlvbiBvZiB0aGUgUkVBRFkg
cG9sbCB0byB0aGUgc3RhcnQgb2YKPiBjb25maXJtYXRpb24gd2FzIDYuODTigJMxMS41MiB1cyAo
bWVkaWFuIDcuMjIgdXMpOyBjb25maXJtYXRpb24gdG9vawo+IDExLjEy4oCTMTUuMjQgdXMuIE9u
ZSBzZXF1ZW5jZSBvZiBrdGltZV9nZXRfbnMoKSBzdGFydC9lbmQgdGltZXN0YW1wcyBpbgo+IG5z
IHdhcyBCVVNZIDB4MDEgYXQgMzg4MTAwOTYxMjAvMzg4MTAxMDc4NDAsIFJFQURZIDB4MDAgYXQK
PiAzODgxMDE1ODY0MC8zODgxMDE3MDUyMCwgYW5kIGNvbmZpcm1hdGlvbiAweDAwIGF0Cj4gMzg4
MTAxNzgzMjAvMzg4MTAxODk4NDAuIExvZ2dpbmcgaW4gdGhlIHBvbGwgcGF0aCBhZGRzIGxhdGVu
Y3ksIHNvIHRoZXNlCj4gaW50ZXJ2YWxzIGRvIG5vdCByZXByZXNlbnQgdW5pbnN0cnVtZW50ZWQg
dGltaW5ncyBvciBleGNsdWRlIGEgc2hvcnRlcgo+IHRyYW5zaWVudC4KPgo+IEZvciBTUElOQU5E
X1JFU0VUX0lOSVRJQUxfREVMQVlfVVMsIEkgbWVhc3VyZWQgdGhyZWUgYm9vdHMgZWFjaCBhdCA1
LCA5Cj4gYW5kIDIwIHVzLiBUaGUgcmVzZXQgd2FpdCByZXR1cm5lZCBSRUFEWSAxOS42OOKAkzE5
LjgwLCAyMy41NuKAkzI0LjEyIGFuZAo+IDEwNS43NuKAkzM1OC42OCB1cyBhZnRlciB0aGUgcmVz
ZXQgY29tbWFuZCwgcmVzcGVjdGl2ZWx5OyBhbiBhZGRpdGlvbmFsCj4gc3RhdHVzIHJlYWQgcmV0
dXJuZWQgMHgwMCBlYWNoIHRpbWUuIEF0IGJvb3QsIHJlc2V0IHJ1bnMgYmVmb3JlIHRoZQo+IGNo
aXAncyBxdWlyayBmbGFnIGlzIGFzc2lnbmVkLiBzcGlfbWVtX3BvbGxfc3RhdHVzKCkgdXNlcyB1
ZGVsYXkoKSBiZWxvdwo+IDEwIHVzIGFuZCB1c2xlZXBfcmFuZ2UoKSBhdCAxMCB1cyBhbmQgYWJv
dmUsIGFjY291bnRpbmcgZm9yIHRoZSBsYXJnZXIKPiBhbmQgbW9yZSB2YXJpYWJsZSAyMCB1cyBy
ZXN1bHQuIEluY3JlYXNpbmcgdGhlIFJFU0VUIGRlbGF5IGNoYW5nZXMgdGhpcwo+IHdhaXQsIGJ1
dCBkb2VzIG5vdCBhZGQgYSBzZWNvbmQgc3RhdHVzIHNhbXBsZSB0byB0aGUgcGFnZS1yZWFkLCBw
cm9ncmFtCj4gb3IgZXJhc2Ugd2FpdHMuIFdoZXRoZXIgaXQgYWRkcmVzc2VzIHRoZSByZXBvcnRl
ZCBldmVudHMgcmVtYWlucwo+IHVudmVyaWZpZWQuCgpUaGFua3MgYSBsb3QgZm9yIHRoZXNlIG51
bWJlcnMuIEJhc2VkIG9uIHRob3NlIHJlc3VsdHMsIGFuZCBiYXNlZCBvbiB0aGUKZmFjdCB0aGF0
IHlvdSBuZXZlciBleHBlcmllbmNlZCBhIFJEWSAtPiBCVVNZIC0+IFJEWSBzaXR1YXRpb24gYXMK
Y2xhaW1lZCBpbiB0aGUgb3JpZ2luYWwgY29tbWl0IGxvZywgaG93IGRvIHlvdSBleHBsYWluIHRo
ZSBwcm9wb3NlZApkaWZmPyBJIGFsc28gZGlkIG5vdCBmdWxseSB1bmRlcnN0YW5kIGlmIGFsbCB0
aGUgY29tbWFuZHMgY291bGQKcG90ZW50aWFsbHkgcmVwb3J0IGZhdWx0eSBzdGF0dXNlcyBvciBv
bmx5IG9uZT8KCkRvIHlvdSBoYXZlIHNldmVyYWwgZGllcyBvbiB0aGlzIGNoaXBzPyBDb3VsZCBp
dCBiZSBhIHByb2JsZW0gd2l0aCB0aGUKc3RhdHVzIGJpdCBzeW5jaHJvbml6YXRpb24/CgpNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
