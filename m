Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B557E69EA6
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2024 15:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0MnxPhgtlJdOFTa9/IORrXhVPvUQYKeg2iXCoavNqZ8=; b=kwf3A1HSoyC79U
	uyjRDZji7rahtUTKMFCgwLVqSdZIv4oh55jDjdBiOI/7rVbqWRpaJz77KTqHmeIRYO6qIJ1WaTwwt
	MRFChUhB6IZN6f16sQb54lQ469b36QXOuY/EBFJinGt21iszyIWc9CPffApB+c6lCMQX7LtHqRGg2
	6715oibkv+3+5ouJU7SNSzE/56Bo+vjnIjhKsh26Ouf1+jfrt6v/Cqrc08dByb7lmwIGx0xqXM8Nf
	l4WimbpbTu/dSmZmos4RxxMM8MkbgGqrLmWVXGQJ5MNv3P8pCKc0Gwm0k6FoAos7AY8/edH9ExO9g
	o3JDERCYVZDdTPrda2kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUpZ-00000009vUP-37Jg;
	Tue, 03 Dec 2024 15:28:53 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tITiF-00000009kPy-3C8Z
	for linux-mtd@lists.infradead.org;
	Tue, 03 Dec 2024 14:17:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DBF9C60007;
	Tue,  3 Dec 2024 14:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733235428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D3vLi0BRVsOigQlpV1L6zgFgKNNRBRResXrfTlbGXDA=;
	b=Smm9gggQOgZkdaylrE1Tzj+0rQRjXrJA+Cy3RKDNf6sogA3niqhcVYD52GVdwoQb7jEfgy
	201tKO1wf6uXEndvpOyRY3esCXZVBbbPvPtgkYauR5IhNhLrqKHJhksWOriBTnrMUv4Jg9
	z7fmJKuXFrpbFBGSI4d27aloRSUxrXoQ+wjL6THdqwn/nDJ41BFSx/HiUKMDedtgz6Xzz4
	i2ljVrbcJjuda+a/ZQj5kKC4gXH1G+VdYZnuLS4AuJxfChdUtSok1jE4wIJOkARaBfMLsG
	nI62uE/2gTEz7hBPP+swCgxPCIoRJxr5ZnQJKp6Rq5oEw/wq04YS2KaEwXbHPg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pintu Agarwal <pintu.ping@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd <linux-mtd@lists.infradead.org>,
  chengzhihao1@huawei.com,  open list <linux-kernel@vger.kernel.org>
Subject: Re: Block based OTA update needs mtdblock
In-Reply-To: <CAOuPNLhhWzoBQH85zEd95LbONtrknq+b7tfcze50VPa9bEnXzw@mail.gmail.com>
	(Pintu Agarwal's message of "Wed, 20 Nov 2024 12:52:57 +0530")
References: <CAOuPNLhxBBihr38p_XMQEgkiLFc+DPxkQf4oewF8U1+ihaFn-Q@mail.gmail.com>
	<CAOuPNLhhWzoBQH85zEd95LbONtrknq+b7tfcze50VPa9bEnXzw@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 03 Dec 2024 15:17:06 +0100
Message-ID: <87ldww4zrx.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_061716_057787_56F1DB37 
X-CRM114-Status: GOOD (  17.80  )
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

SGVsbG8sCgpPbiAyMC8xMS8yMDI0IGF0IDEyOjUyOjU3ICswNTMwLCBQaW50dSBBZ2Fyd2FsIDxw
aW50dS5waW5nQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEhpLAo+Cj4gT24gTW9uLCA0IE5vdiAyMDI0
IGF0IDIxOjMxLCBQaW50dSBBZ2Fyd2FsIDxwaW50dS5waW5nQGdtYWlsLmNvbT4gd3JvdGU6Cj4+
Cj4+IEhpIEFsbCwKPj4KPj4gRm9yIG9uZSBvZiBvdXIgYXV0b21vdGl2ZSBwcm9kdWN0cyB3ZSBo
YXZlIHRoZSBmb2xsb3dpbmcgY29uZmlndXJhdGlvbjoKPj4gUUMgY2hpcHNldCwgYXJtNjQsIEtl
cm5lbC01LjE1LCBOQU5EIEZsYXNoIDFHQiwgQS9CIHN5c3RlbSwgVUJJCj4+IHZvbHVtZXMgKHNx
dWFzaGZzLCB1YmlmcyksIERNLXZlcml0eSBmb3Igcm9vdGZzIChzcXVhc2hmcyksIHNpbXBsZQo+
PiBidXN5Ym94IHBsYXRmb3JtLgo+Pgo+PiBGb3IgT1RBIHVwZGF0ZXMgd2UgaGF2ZSBhIHN0cm9u
ZyBkZXBlbmRlbmN5IHdpdGggTVREX0JMT0NLLgo+Pgo+PiBUaWxsIG5vdywgd2Ugd2VyZSB1c2lu
ZyB1YmlibG9jayBmb3IgbW91bnRpbmcgc3F1YXNoZnMgdm9sdW1lcyBhbmQKPj4gY29tcGxldGVs
eSBnb3QgcmlkIG9mIG10ZF9ibG9jayBieSBjb25maWd1cmluZyBpdCBhcyBhIGxvYWRhYmxlCj4+
IG1vZHVsZS4KPj4gQnV0LCB3ZSBhbHNvIG5lZWQgdG8gc3VwcG9ydCBPVEEgdXBkYXRlcyAoRnVs
bCwgSW5jcmVtZW50YWwpIG9uIEEvQgo+PiB2b2x1bWVzIHVzaW5nIHRoZSBzYW1lIEFuZHJvaWQg
T1RBIGZyYW1ld29yay4KPj4gaHR0cHM6Ly9zb3VyY2UuYW5kcm9pZC5jb20vZG9jcy9jb3JlL290
YS9ub25hYi9ibG9jawo+Pgo+PiBPVEEgdXBkYXRlIHdpbGwgYmUgYXBwbGllZCB0byB0aGUgQiAo
aW5hY3RpdmUpIHBhcnRpdGlvbi4KPj4gT1RBIHVwZGF0ZXMgcHJlZmVyIGJsb2NrIGJhc2VkIHVw
ZGF0ZSBvdmVyIGZpbGUgYmFzZWQgZXNwZWNpYWxseSBmb3IKPj4gZG0tdmVyaXR5IGVuYWJsZWQg
ZGV2aWNlcy4KPj4KPj4gTm93LCB0aGUgcHJvYmxlbSBpcywgb24gTVREIHdlIG9ubHkgaGF2ZSAy
IG9wdGlvbnMgZm9yIGJsb2NrIGJhc2VkCj4+IHVwZGF0ZXM7IHViaV9ibG9jayBvciBtdGRfYmxv
Y2suCj4+IFdlIGNhbm5vdCB1c2UgdWJpYmxvY2sgZm9yIE9UQSB1cGRhdGVzIGFzIGl0IGlzIHJl
YWQgb25seS4KPj4gRm9yIGZ1bGwgdXBkYXRlIHZvbHVtZSwgd2UgY2FuIHVzZSAidWJpdXBkYXRl
dm9sIiBpbnRlcmZhY2UgdG8KPj4gY29tcGxldGVseSByZXBsYWNlIHRoZSB2b2x1bWUgY29udGVu
dCwgYnV0IGZvciBwYXJ0aWFsIG9yIGluY3JlbWVudGFsCj4+IHVwZGF0ZSB3ZSBuZWVkIHRvIHVw
ZGF0ZSBvbmx5IHNwZWNpZmljIGJsb2NrcyBhbmQgbm90IGVudGlyZQo+PiBwYXJ0aXRpb25zLgo+
PiBUaHVzLCB3ZSBoYXZlIHRvIHVzZSB0aGUgTVREX0JMT0NLICgvZGV2L210ZGJsb2NrKSBpbnRl
cmZhY2UgdG8KPj4gc3VwcG9ydCBibG9jayBiYXNlZCBPVEEgdXBkYXRlcyBvbiBVQkkgdm9sdW1l
cy4KPj4gVGh1cywgZHVyaW5nIG90YSB1cGRhdGVzIChvbmx5KSB3ZSBuZWVkIHRvIGluc3RhbGwg
dGhlIG10ZGJsb2NrCj4+IG1vZHVsZSwgcGVyZm9ybSB0aGUgdXBkYXRlIGFuZCB0aGVuIHVuaW5z
dGFsbCB0aGUgbW9kdWxlLgo+Pgo+PiBUaGF0IG1lYW5zLCB3ZSBjYW5ub3QgY29tcGxldGVseSBn
ZXQgcmlkIG9mIE1URF9CTE9DSyBmcm9tIG91ciBwcm9kdWN0Cj4+IGVzcGVjaWFsbHkgZm9yIE9U
QSB1c2UgY2FzZXMuCj4+Cj4+IElzIHRoaXMgdGhlIG9ubHkgd2F5LCBvciBkbyB3ZSBoYXZlIGFu
eSBvdGhlciBvcHRpb24gdG8gc3VwcG9ydCBPVEEKPj4gdXBkYXRlcyBvdmVyIFVCSSB2b2x1bWVz
ID8KPj4KPiBSZXN0YXJ0aW5nIHRoaXMgdGhyZWFkIGFnYWluLi4uCj4gQW55IGZ1cnRoZXIgY29t
bWVudCBvbiB0aGlzID8KPgo+IERpZCBhbnlib2R5IHVzZWQgYmxvY2sgYmFzZWQgT1RBIHVwZGF0
ZSBOQU5EIEEvQiBzeXN0ZW0gd2l0aG91dCB1c2luZwo+IG10ZF9ibG9jayA/CgpOb3Qgb24gbXkg
c2lkZSwgaXQgaXMgYWN0dWFsbHkgYSBnb29kIHF1ZXN0aW9uLiBSaWNoYXJkLCBhbnkgaWRlYXM/
Cgo+IFNpbmNlIHViaWJsb2NrIGlzIHJlYWQtb25seSwgaXQgc2VlbXMgdGhlcmUgaXMgbm8gb3Ro
ZXIgd2F5IHRvIHBlcmZvcm0KPiBPVEEgdXBkYXRlLCBpZiBtdGRfYmxvY2sgaXMgZGlzYWJsZWQu
Cj4gT3IsIHdlIG5lZWQgdG8gbWFrZSB1YmlibG9jayBhbHNvIGFzIHJlYWQvd3JpdGUuCgpEb2Vz
bid0IHNvdW5kIHBvc3NpYmxlL2EgZ29vZCBpZGVhLgoKSSdtIHNvcnJ5IGZvciB0aGlzIHVuaGVs
cGZ1bCBhbnN3ZXIgOi0pCgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
