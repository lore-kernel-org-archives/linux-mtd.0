Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75913CD342F
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2026 11:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=II9+aK2eCdrNaebCp3B8bU8vIqgMnc/tarK1zKnZfU8=; b=nj2RACEcEceAIY
	UU1Fn2Ru0QoRZIeIFwvoisJf2IWymzd/FcnUw0cx/o/WK5vl0Ibd4nnGFlsES8SVBwjei3osjSGcx
	OUdmxRkVJ8LJPRZdRJS45y9rv9cgqXakGs1E8vnITdliIBEgdryHV81O6UDMDaq6HOdz3gS2qQxxF
	5mNE4K0y0WnGjE0Rsm9ZhZfpkTonjEYRRv6wP9y8Ol0PzpMRQdYW8+r04rV5wTKwjXW07yJnuAaBF
	K54L4Hq6WDXlOSma7PdAAdalCVbUGdkLchhhnm3KZ8I+NLbnE0/eKN8HdPoguj7Yr0tdk1p5A7gzx
	LQWsDUuzVTeKB25+TX+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEEd-0000000G5a2-08wp;
	Tue, 05 May 2026 11:46:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEEb-0000000G5Zg-18r7
	for linux-mtd@bombadil.infradead.org;
	Tue, 05 May 2026 11:46:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ipTVLyFau41mgVvOQSWKGbXVWkfz3iY5wGZ2cVJPYA0=; b=By95Y7jazjwRFtu6CQQ2JANPLl
	4WsQ5E9dRVyLPt7lnoJ0uvfI9WRgI4MM9MY3McGyOks9IlJzTPJdYS1VHAEsHNGBFNLMNHPvjC7xC
	GmP4GVsTKsjpGoURFOlZSGGmpXfNxLm/XxEMUMXVtCoMe95f29adCdwJt5A5BOoaXUiwu1Lmi0t1t
	bmU/Msq0wrUeDzcM61gBx+2B7Wx100+hDAQF1jzLhjeZsLlOYY6TThCRuITF0VK7DRWyWyZFwXgrk
	tIu+rnu9fJsYkI/CLX30YY7ZmiqyHl8sDf8zqnT3ubQDIpzVZZEbKmNXdSNnpEhrQKA8T5ZMC+Ohs
	PP/c5xUQ==;
Received: from mail.rulkc.org ([155.212.184.193])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEEX-0000000DPz5-3ka8
	for linux-mtd@lists.infradead.org;
	Tue, 05 May 2026 11:46:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62CC9100349;
	Tue,  5 May 2026 14:46:23 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rulkc.org; s=dkim;
	t=1777981589; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ipTVLyFau41mgVvOQSWKGbXVWkfz3iY5wGZ2cVJPYA0=;
	b=C7gmUYduUnjG57CZowZ1NJDX/SVA6X6BhFhcsPOf48/f6WIJbUWSgtjSZ3ucpRQ73R5X6X
	34qlEGAaRHKTmN6oEad0XE1tktu5XKoR1fvpailDlDPuCGvvjEzPSTL24AzjoE+VTwcmQy
	q3xaqWGqJMqJvxyGbUBKBuKpgT9JPrpXy7fIYF0lhF0JlbZLnv0DkjPBQmvUlI8EnzcGBC
	diyd4jWaFq6GnLbWrx7HdG2WKARm3hOg7jIv0HzRr+JKRNUP9Co5cYgZE0+AiZ9JpcwyK0
	FKvpmCFuPfaUllRcjO5i0JTp/YlKgEiyozmWTxIfCRoxHpd8QBaPnZ2W9mu//w==
Message-ID: <e7e7b46c-70a1-48b9-a2be-57080556fb65@rulkc.org>
Date: Tue, 5 May 2026 14:46:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mtd: rawnand: fix condition in 'nand_select_target()'
Content-Language: ru
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, rulkc@linuxtesting.org, oxffffaa@gmail.com,
 stable@vger.kernel.org
References: <20260504221012.1310605-1-avkrasnov@rulkc.org>
 <87mryeqoqs.fsf@bootlin.com> <57b0cc2a-6d62-405c-bfa5-68d1c46dbad9@rulkc.org>
 <87h5omqntt.fsf@bootlin.com> <335fad03-6113-4508-b28d-b21c7efcffe6@rulkc.org>
 <87bjeuqn6s.fsf@bootlin.com>
From: Arseniy Krasnov <avkrasnov@rulkc.org>
In-Reply-To: <87bjeuqn6s.fsf@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_124638_171963_C0EE713B 
X-CRM114-Status: UNSURE (   9.42  )
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

CjA1LjA1LjIwMjYgMTE6MjMsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gT24gMDUvMDUvMjAyNiBh
dCAxMToxNDoyNSArMDMsIEFyc2VuaXkgS3Jhc25vdiA8YXZrcmFzbm92QHJ1bGtjLm9yZz4gd3Jv
dGU6Cj4KPj4gMDUuMDUuMjAyNiAxMToxMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+IE9uIDA1
LzA1LzIwMjYgYXQgMTA6NTk6MTYgKzAzLCBBcnNlbml5IEtyYXNub3YgPGF2a3Jhc25vdkBydWxr
Yy5vcmc+IHdyb3RlOgo+Pj4KPj4+PiAwNS4wNS4yMDI2IDEwOjUwLCBNaXF1ZWwgUmF5bmFsIHdy
b3RlOgo+Pj4+PiBIaSwKPj4+Pj4KPj4+Pj4gT24gMDUvMDUvMjAyNiBhdCAwMToxMDoxMiArMDMs
IEFyc2VuaXkgS3Jhc25vdiA8YXZrcmFzbm92QHJ1bGtjLm9yZz4gd3JvdGU6Cj4+Pj4+Cj4+Pj4+
IFR3byBpbXBvcnRhbnQgdHlwb3MgaW4gdGhlIGNvbW1pdCBsb2cgOi0pCj4+Pj4+Cj4+Pj4+PiAn
Y3MnIGhlcmUgbXVzdCBpbiByYW5nZSBbMDpuYW5kZGV2X250YXJnZXRzKS4KPj4+Pj4gICAgICAg
ICAgICAgICAgIGJlICAgICAgICAgICAgICAgICAgICAgICAgICAgWwo+Pj4+IEhpLCBzb3JyeSwg
WW91IG1lYW4/Cj4+Pj4KPj4+Pgo+Pj4+ICdjcycgaGVyZSBtdXN0IGJlIGluIHJhbmdlIFswOm5h
bmRkZXZfbnRhcmdldHNdLsKgCj4+PiBJIG1lYW50IFswOm5hbmRkZXZfbnRhcmdldHNbIHdoaWNo
IGlzIHRoZSBtYXRoZW1hdGljYWwgd2F5LCBJSVJDLCB0bwo+Pj4gaW5kaWNhdGUgdGhhdCB0aGUg
bGFzdCB2YWx1ZSBpcyBvdXQgb2Ygc2NvcGUvZXhjbHVkZWQuCj4+Pgo+Pj4gWzA6bmFuZGRldl9u
dGFyZ2V0c10gbWVhbnMgdGhhdCBuYW5kZGV2X250YXJnZXRzIGlzIGluY2x1ZGVkIGluIHRoZQo+
Pj4gc2NvcGUgb2YgdmFsdWVzIGFuZCBoZXJlIHNpbmNlIHlvdSBhcmUgZXhwbGljaXRseSBzaG93
aW5nIHRoYXQgaXQgaXMKPj4+IG5vdCwgaXQgZmVlbHMgd3JvbmcgdG8gdXNlIHRoYXQgY29udmVu
dGlvbi4KPj4KPj4gQWhoLCBZZXMgSSBzZWUsIGp1c3Qgc21hbGwgbWlzdW5kZXJzdG9vZCBpbiBt
YXRoIHN5bWJvbHM6Cj4+Cj4+IEkgbWVhbjogW0E6QikgPT0gW0E6QlsKPj4KPj4gaHR0cHM6Ly93
aWtpbWVkaWEub3JnL2FwaS9yZXN0X3YxL21lZGlhL21hdGgvcmVuZGVyL3N2Zy8wNzE5YjFiMDhj
ZGY2NDllNzM1ZTZkYWI2ZGM3MzU1ZmEzN2E5YjIxCj4gQWggb2ssIGRpZG4ndCBrbm93IHRoYXQg
b3RoZXIgY29udmVudGlvbiwgZmluZSB0aGVuLCB0YWtlIHRoZSBvbmUgeW91IHByZWZlciBpZgo+
IGJvdGggYXJlIGlkZW50aWNhbC4gSnVzdCBhZGQgdGhlIG1pc3NpbmcgImJlIiBwbGVhc2UhCgpT
dXJlIQoKVGhhbmtzLCBBcnNlbml5CgoKPgo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
