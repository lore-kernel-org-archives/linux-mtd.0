Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748A2D78337
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Dec 2024 17:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lvATNtNKKsyMYpTf8xMG3+nluVAb5BG7Snp8LVEc4oo=; b=hs19kREpyHu8Kz
	bPeW52z/7Xmb81iPFGh4ici7HXjkKQdZEGM7/H+05UzcvtLje8rF0s5HN5sPpLam8V/xuXTkMCvSr
	/VBkH+JBLWG5ZZGj+WWY3xKaaxZE/zQCcWigijLTmWPnn5sTD0GE/9GbuM6L+W1FI9dRtN5MClY3w
	pSwnlwqk8HMZfjIEuqri296fWA7XSLC1TRWvEFbxDeCFwJxOFDTTb2OEz7+yMoG5hd9jNKbj/fV/p
	+1E4t2BEWy7gcKpVslNLbeWN0Isvo5D+3/1Q5Hg7K+tZEjIwUS0hyo9iNzwAGaZabrASqF+D7KVxA
	GMD4ojwB/E+I8FF6Jrsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9u7-00000006yB7-0WH8;
	Mon, 02 Dec 2024 17:08:11 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9u5-00000006yAT-0mSt
	for linux-mtd@lists.infradead.org;
	Mon, 02 Dec 2024 17:08:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDE901BF20E;
	Mon,  2 Dec 2024 17:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733159287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rNd5aKQClIHYISNmwV1vYL7M4nNiHcKhFqz3F/ZOVBw=;
	b=NFg7XJfNY1AmTmYX/pLcww+MFw/ohHUHuzu3GFF7FraTjhWVQ0txu6f5GhcJCSCbOcWy4L
	AuAK7HdXiKWCJEkf5wwIUlu1ud11sOnjDqKSV9qHbeEKES6nwp7/9BZsmZCEtZbuz8Au5+
	tKOnFJF40J0Fwb3dph5lKziNwBXJGN2Uo9z4ucXN++oUdQnMPgo+pnXq6RuDqvTiHh2sGE
	fQPzwOiUPQqvo6hSDGXq9rutwwOBBgfCgvG/I/M4JMCYTZRIqYFIbjuifqTS3Ilp0IQ5Pw
	3/xJSuDsjrbEJhVqYf9EkhCtNQgoIz/7HntVN14fgPhu50WVv54xehOBvVD+/w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: tkuw584924@gmail.com,  linux-mtd@lists.infradead.org,  richard@nod.at,
  vigneshr@ti.com,  pratyush@kernel.org,  mwalle@kernel.org,
  kr.kim@skyhighmemory.com,  zhi.feng@skyhighmemory.com,
  Bacem.Daassi@infineon.com,  Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v2 1/3] mtd: spinand: Remove write_enable_op() in markbad()
In-Reply-To: <a5c09a0a-7d63-4029-abb2-597ade1da74a@linaro.org> (Tudor
	Ambarus's message of "Fri, 22 Nov 2024 09:37:45 +0000")
References: <cover.1732152768.git.Takahiro.Kuwano@infineon.com>
	<8be5cb694a763d3a74d9c3c7e76dd98b7b1333f6.1732152768.git.Takahiro.Kuwano@infineon.com>
	<a5c09a0a-7d63-4029-abb2-597ade1da74a@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 02 Dec 2024 18:08:06 +0100
Message-ID: <87ed2q57yh.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_090809_350225_55C0F0A1 
X-CRM114-Status: GOOD (  12.67  )
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

SGVsbG8sCgpPbiAyMi8xMS8yMDI0IGF0IDA5OjM3OjQ1IEdNVCwgVHVkb3IgQW1iYXJ1cyA8dHVk
b3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiB3cm90ZToKCj4gT24gMTEvMjEvMjQgMjowOCBBTSwgdGt1
dzU4NDkyNEBnbWFpbC5jb20gd3JvdGU6Cj4+IEZyb206IFRha2FoaXJvIEt1d2FubyA8VGFrYWhp
cm8uS3V3YW5vQGluZmluZW9uLmNvbT4KPj4gCj4+IFdlIGRvbid0IGhhdmUgdG8gY2FsbCBzcGlu
YW5kX3dyaXRlX2VuYWJsZV9vcCgpIGluIHNwaW5hbmRfbWFya2JhZCgpIGFzCj4+IGl0IGlzIGNh
bGxlZCBpbiBzcGluYW5kX3dyaXRlX3BhZ2UoKS4KPgo+IEluZGVlZC4gVGhlIHBhdGNoIGlzIGEg
Zm9sbG93IHVwIGZvcjoKPiBGaXhlczogYjY0NWFkMzlkNTY4ICgibXRkOiBzcGluYW5kOiBEbyBu
b3QgZXJhc2UgdGhlIGJsb2NrIGJlZm9yZQo+IHdyaXRpbmcgYSBiYWQgYmxvY2sgbWFya2VyIikK
CkNvcnJlY3QuCgpUYWthaGlybywgd291bGQgeW91IG1pbmQgdXBkYXRpbmcgdGhlIGNvbW1pdCBs
b2cgdG8gbWVudGlvbiB0aGF0IGNvbW1pdCwKcGxlYXNlPyBJdCBtYWtlcyBzZW5zZSB0byBoYXZl
IGl0IG1lbnRpb25lZC4gT3RoZXJ3aXNlIHRoZSBzZXJpZXMgbG9va3MKZ29vZCwgSSdsbCBhcHBs
eSBpdCBvbmNlIHlvdSBzZW5kIGEgdjMuCgo+IFRoYXQgY29tbWl0IHJlbW92ZWQgc3BpbmFuZF9l
cmFzZV9vcCgpLCBidXQgZmFpbGVkIHRvIHJlbW92ZQo+IHNwaW5hbmRfd3JpdGVfZW5hYmxlX29w
KCkgd2l0aCBpdC4KPgo+IFJldmlld2VkLWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVz
QGxpbmFyby5vcmc+Cj4KPiBNaXF1ZWwsIHNoYWxsIHRoZSBzcGluYW5kX3dyaXRlX2VuYWJsZV9v
cCgpIGNhbGwgYmUgbW92ZWQgaW50bwo+IHNwaW5hbmRfZXJhc2Vfb3AoKT8KClRoYW5rcyBhIGxv
dCBmb3IgdGhlIHJldmlldyEKCnNwaW5hbmRfZXJhc2Vfb3AoKSBpcyBqdXN0IGFib3V0IHRoZSAi
b3AiLCBub3QgYWJvdXQgaGFuZGxpbmcgYW4gIm10ZCIKZXJhc2UuIEl0IGlzIGNhbGxlZCBmcm9t
IHNwaW5hbmRfZXJhc2UoKSB3aGljaCBhbHJlYWR5IGRvZXMgdGhlCnNwaW5hbmRfd3JpdGVfZW5h
YmxlX29wKCkgYW5kIEkgYmVsaWV2ZSBpdCBtYWtlcyBtb3JlIHNlbnNlIHRvIGtlZXAgaXQKdGhl
cmUsIHNvIHdoZW4gd2UgYnJvd3NlIHRoZSBjb2RlIHdlIGRvbid0IG5lZWQgdG8gZW50ZXIgdGhl
IGxvdy1sZXZlbApmdW5jdGlvbnMgYW5kIGltbWVkaWF0ZWx5IGlkZW50aWZ5IHdoYXQgb3BlcmF0
aW9ucyB3ZSBzZW5kIHRvIHRoZSBjaGlwCndpdGhvdXQgc3VycHJpc2VzLgoKQ2hlZXJzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
