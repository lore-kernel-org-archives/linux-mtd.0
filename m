Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9ED606A31C
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 11:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=259O1uwH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=e4vM6Ui/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jv0mnMLn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Tt/sDLQ6BNAMU/5+h4hVx2nU1l6v5KHKidRMSQf/9LI=; b=259O1uwHR+ZEp7RJf5nt4cMSNW
	RtZUjqPOG1lDLopl7BBzxTFaeFclHNrq0nZv5jw4K9yw26rmBv/6g6x1Vx9RF57zYGU4iOmVY+pgP
	0HG3BeE067PFaSYu/dKDMn0nM8HXN8e9iHDBkSl24gRB9hzyZ1bMgS5po5pZm3BAISkP++ixnJ5ip
	AKnc66LYw9hIqqRh3nPKa+RcVZ8Onm7AP0NzW7CqGBFBSHk0Cn3BRqYCBqX764ZEgh5nno5VKegSh
	ZukuG/XtHH14dYs/vGCM+VzTfgrs2aAVs5LxTE+uiY7aI//N74yFj3WXJpxdvQe6J8CmYbaMcPZMC
	AbKwTzgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXVQ-0000000CuP6-3W9u;
	Thu, 26 Nov 2026 11:19:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXUr-0000000Ctcm-1HB7
	for linux-mtd@bombadil.infradead.org;
	Thu, 26 Nov 2026 11:18:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Qn2DiAIad0hOk/kwAWOWeWyYdFwm1kSBArGgHjC7hKo=; b=e4vM6Ui/ZH2pFVUoap58QATfJi
	JQJh11e3L8U0WgXl+kKUXQdJ4XO6iH5wK15miUQJ06qkCyj0r9rzoKKgzyzRIeUt3L1l17Kaloylk
	NSWovkgPWFEV0nT2p91KqLaibVbriRErF3Stqd+ZM6qjrMa6XBprO170q0KqQH/DUP6dHKhmsjcIy
	FNvpVhJeDJz7iB3pwvqKc4Af4uWMRN0OtZ/X6OrOFoFu77/o++/7linB6Zyyx7Kh/u8QUyxU63gpg
	dtc6i36FGSbch4/dlTaXWqdhktkbOWOJltVP8SgkHghLgGSvNId2cJAOUMpPgPZPtqlsHGZj9b/sy
	0Nbdd7Ww==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXUo-00000006NI4-3IOg
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 11:18:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1757CC2B9C7;
	Thu, 26 Nov 2026 11:18:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C7B7960237;
	Thu, 26 Nov 2026 11:18:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 737AA11E6B35B;
	Thu, 26 Nov 2026 12:18:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795691911; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Qn2DiAIad0hOk/kwAWOWeWyYdFwm1kSBArGgHjC7hKo=;
	b=jv0mnMLnp4qe7lG5xMPkCwFTido0fVstnYEsnsRAkYtKgt6LqjL3BFwR8OrmT6nmojPbdz
	quKsHJoB4gwl9GvnuBMKGHlJwI/O7hZ5H/QGMild7hmq1JMCFlbe7QhTIV6NOuY5arOh8N
	dxUKoRYWxhnQtlNbDPSudAV2Z7M1c+jrntQA8YaiEK/uVNh3MxtWsfYGh07XLLm+9qNOBJ
	w3K4wTpqrWjRVuaOUg2Ux5jXEimouWZa8pOm3DurReGVO3Fd9F1J/5jf6/9RmDk+XcOLc4
	090E8yHPLRS0lFDm3REnwXsFWptb55JEei9QHdLvtWOOes9JPDzbyJxdYkpgtg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Alvin Zhou <alvinzhou@mxic.com.tw>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] mtd: spi-nor: macronix: Clear the RDCR opcode on
 MX25L3255E
In-Reply-To: <20261126052524.1816136-1-chengminglin@mxic.com.tw> (Cheng Ming
	Lin's message of "Thu, 26 Nov 2026 13:25:24 +0800")
References: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-0-0d1ab783fd8b@bootlin.com>
	<20261125-macronix-upstreaming-spi-nor-cleanup-v1-2-0d1ab783fd8b@bootlin.com>
	<20261126052524.1816136-1-chengminglin@mxic.com.tw>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 26 Nov 2026 12:18:26 +0100
Message-ID: <87qzg7x2m5.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_111834_791266_C7870E8E 
X-CRM114-Status: GOOD (  19.51  )
X-Spam-Score: -0.2 (/)
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

T24gMjYvMTEvMjAyNiBhdCAxMzoyNToyNCArMDgsIENoZW5nIE1pbmcgTGluIDxsaW5jaGVuZ21p
bmc4ODRAZ21haWwuY29tPiB3cm90ZToKCj4gSGkgTWlxdWVsLAo+Cj4gT24gV2VkLCBOb3YgMjUs
IDIwMjYgYXQgMDc6MDE6MzVQTSArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4gVGhlIE1Y
MjVMMzI1NUUgQkZQVCB0YWJsZSBpcyBpbmNvcnJlY3Qgd2hpY2ggbGVhZHMgdG8gdGhlIFJEQ1Ig
b3Bjb2RlIHRvCj4+IGJlIHJlc2V0LiBNYWtlIHN1cmUgdGhlIGNvbmZpZ3VyYXRpb24gZm9yIHRo
aXMgY2hpcCByZW1haW5zIGNvcnJlY3QuCj4KPiBJIHRoaW5rIHRoaXMgcGF0Y2ggaXMgbm90IG5l
ZWRlZC4KPgo+IFRoZSBNWDI1TDMyNTVFIEJGUFQgaXMgSkVTRDIxNiByZXYgMCwgaXRzIHBhcmFt
ZXRlciB0YWJsZSBsZW5ndGggaXMKPiAweDA5IERXT1JEcyAoc2VlIFRhYmxlIDksIG9mZnNldCAw
QmgsIG9uIHBhZ2UgNjQgb2YgdGhlIGRhdGFzaGVldCBbMV0pLgo+IHNwaV9ub3JfcGFyc2VfYmZw
dCgpIHJldHVybnMgYmVmb3JlIHRvdWNoaW5nIHRoZSBTUiBvcGNvZGVzIGFuZCB0aGUKPiBRRSBt
YXNrIGluIHRoaXMgY2FzZToKPgo+IAkvKiBTdG9wIGhlcmUgaWYgbm90IEpFU0QyMTYgcmV2IEEg
b3IgbGF0ZXIuICovCj4gCWlmIChiZnB0X2hlYWRlci0+bGVuZ3RoID09IEJGUFRfRFdPUkRfTUFY
X0pFU0QyMTYpCj4gCQlyZXR1cm4gc3BpX25vcl9wb3N0X2JmcHRfZml4dXBzKG5vciwgYmZwdF9o
ZWFkZXIsICZiZnB0KTsKPgo+IFNpbmNlIG1hY3Jvbml4X25vcl9kZWZhdWx0X2luaXQoKSBub3cg
YWx3YXlzIHJ1bnMgYmVmb3JlCj4gc3BpX25vcl9wYXJzZV9zZmRwKCksIHRoZSByZWFkX3NyMiA9
IDAgc2V0IGluIHBhdGNoIDEgaXMga2VwdCBmb3IKPiB0aGlzIHBhcnQuIFNvIHRoZSBCRlBUIGlz
IG5vdCBpbmNvcnJlY3QsIGl0IGp1c3QgcHJlZGF0ZXMgdGhlIFFFUgo+IGZpZWxkLgo+Cj4+ICAJ
cGFyYW1zLT5xZV9tYXNrWzBdID0gQklUKDYpOwo+PiAgCXBhcmFtcy0+cWVfbWFza1sxXSA9IDA7
Cj4+ICsJcGFyYW1zLT5vcGNvZGVzLnJlYWRfc3IyID0gMDsKPgo+IFRoZSBzYW1lIGlzIHRydWUg
Zm9yIHRoZSBxZV9tYXNrIGxpbmVzIGFib3ZlLiBUaGV5IHdlcmUgb25seSBuZWVkZWQKPiBiZWNh
dXNlIHRoZSBvbGQgc3BpX25vcl9pbml0X3BhcmFtcygpIGRpZCBub3QgY2FsbCB0aGUgbWFudWZh
Y3R1cmVyCj4gZGVmYXVsdF9pbml0KCkgd2hlbiBTRkRQIHdhcyByZXF1aXJlZC4gV2l0aCB0aGUg
cmV3b3JrZWQgaW5pdCBmbG93Cj4gdGhleSBjYW4gYmUgZHJvcHBlZCB0b28sIGFuZCBvbmx5IHRo
ZSAxLTQtNCBQUCBwYXJ0IG5lZWRzIHRvIHN0YXkuCgpBaCwgZ3JlYXQsIEkgdGhvdWdodCBpdCB3
YXMgc3RpbGwgdGhlIGNhc2UsIGJ1dCB0aGF0J3MgZ29vZCBuZXdzLgoKSSdsbCBpbnN0ZWFkIGRy
b3AgdGhlIFFFIG1hc2sgdGhlbi4KClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrIQpNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
