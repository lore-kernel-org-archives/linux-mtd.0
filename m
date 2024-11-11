Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C80CD3ABE9
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 18:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xx0tZyRWuLs7H1Y2JWBoWPIsP9ID079Om7n+x704INQ=; b=vVDlGoRv0IUwTE
	psKepc1Repo38bTLCvzVr50NJ+C9Kl8IuEAsKXt6FRfh/OFFTsu5BwnDH0C0bmBGY/WNETzjcDlEZ
	ohr8rCB9LY8SJ1GC6mtP97eEvGzoegRDhy1H9lhrLt3cZbmwDCv5UvILJaSGIlUjhuws/vE+sdcvz
	CwLfgLzG3yVJwaDetWWIaDsO8o9OStD5obbRVaXfGCZwDtSYnX1mJfWgqjb9kTwwgpfz7X1cCYo9/
	ngN2o8IDNzJ17PenxKoFyXYEvo9t7x8XeYSQQDdJAwvdyMrnkJfcMzTcmiDhVX/dlEuE4DNkijcgO
	OOf2BSbz/srcPFAI/iZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZ8l-00000000uUr-1b7n;
	Mon, 11 Nov 2024 18:27:55 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZ3B-00000000tX4-0MGd;
	Mon, 11 Nov 2024 18:22:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49EFE1C0005;
	Mon, 11 Nov 2024 18:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731349324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m5qBMJyupmVmP3WenwgqG6fxdPxLJkkXl5JQ5DHXwD0=;
	b=P+dWOpS4lvwV7ml2Qfzzvid2JahTF5umrRz6pPlZxfoDSVN7P7RBPC5/L1AoCYDmEGs0z6
	GdDwxm/e9vaPg8V5YM6NfeSx4yMOUgh42kO+kgWriWfrwiFd8aP0fwgcKoIOcEyJxICjcT
	cZdji2E5SwsT6f8SzmW7zJzfOPv0P2496z5WA7e+5h4ZOpCkf1LCJdaCVT24l8Wngjqc2Y
	mYK/iiOEOP4qlB4TdWuml/EGZm+obhm5ZNr5y9qhERlkvscEShimeq1nJc5xtuWmMyZEUI
	BoLHmgJDkaqq/JTSpjMR3HbpocvPW8UvZmSp4xJEkexDK7lIJ+dgKPl/tg/hnw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hui-Ping Chen <hpchen0nvt@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  robh@kernel.org,  krzk+dt@kernel.org,
  conor+dt@kernel.org,  nikita.shubin@maquefel.me,  arnd@arndb.de,
  vkoul@kernel.org,  esben@geanix.com,
  linux-arm-kernel@lists.infradead.org,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
In-Reply-To: <20241023092617.108021-3-hpchen0nvt@gmail.com> (Hui-Ping Chen's
	message of "Wed, 23 Oct 2024 09:26:17 +0000")
References: <20241023092617.108021-1-hpchen0nvt@gmail.com>
	<20241023092617.108021-3-hpchen0nvt@gmail.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 11 Nov 2024 19:22:02 +0100
Message-ID: <87y11p1vhx.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_102209_474850_01FF2AEF 
X-CRM114-Status: GOOD (  15.67  )
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

SGVsbG8sCgo+ICtzdGF0aWMgaW50IG1hMzVfbmFuZF9hdHRhY2hfY2hpcChzdHJ1Y3QgbmFuZF9j
aGlwICpjaGlwKQo+ICt7Cj4gKwlzdHJ1Y3QgbWEzNV9uYW5kX2luZm8gKm5hbmQgPSBuYW5kX2dl
dF9jb250cm9sbGVyX2RhdGEoY2hpcCk7Cj4gKwlzdHJ1Y3QgbWEzNV9uYW5kX2NoaXAgKm52dG5h
bmQgPSB0b19tYTM1X25hbmQoY2hpcCk7Cj4gKwlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRf
dG9fbXRkKGNoaXApOwo+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gbXRkLT5kZXYucGFyZW50Owo+
ICsJdTMyIHJlZzsKPiArCj4gKwlpZiAoY2hpcC0+b3B0aW9ucyAmIE5BTkRfQlVTV0lEVEhfMTYp
IHsKPiArCQlkZXZfZXJyKGRldiwgIjE2IGJpdHMgYnVzIHdpZHRoIG5vdCBzdXBwb3J0ZWQiKTsK
PiArCQlyZXR1cm4gLUVJTlZBTDsKPiArCX0KPiArCj4gKwludnRuYW5kLT5uY2h1bmtzID0gbXRk
LT53cml0ZXNpemUgLyBjaGlwLT5lY2Muc3RlcHM7Cj4gKwludnRuYW5kLT5uY2h1bmtzID0gKG52
dG5hbmQtPm5jaHVua3MgPCA0KSA/IDEgOiBudnRuYW5kLT5uY2h1bmtzIC8gNDsKClRoaXMgc2Vj
b25kIGRpdmlzaW9uIGxvb2tzIGJyb2tlbi4gQWxzbywgeW91IHByb2JhYmx5IGRvbid0IHdhbnQg
dG8gZG8KdGhhdCBvdXRzaWRlIG9mIHRoZSBPTl9IT1NUIHNpdHVhdGlvbi4gRmluYWxseSwgeW91
IHNob3VsZCBwcm9iYWJseQp1cGRhdGUgY2hpcC0+ZWNjLnN0ZXBzIGFuZCBjaGlwLT5lY2Muc2l6
ZSB0byB5b3VyIGZpbmFsIGNob2ljZS4KCj4gKwo+ICsJcmVnID0gcmVhZGwobmFuZC0+cmVncyAr
IE1BMzVfTkZJX1JFR19OQU5EQ1RMKSAmICh+UFNJWkVfTUFTSyk7Cj4gKwlpZiAobXRkLT53cml0
ZXNpemUgPT0gMjA0OCkKPiArCQl3cml0ZWwocmVnIHwgUFNJWkVfMkssIG5hbmQtPnJlZ3MgKyBN
QTM1X05GSV9SRUdfTkFORENUTCk7Cj4gKwllbHNlIGlmIChtdGQtPndyaXRlc2l6ZSA9PSA0MDk2
KQo+ICsJCXdyaXRlbChyZWcgfCBQU0laRV80SywgbmFuZC0+cmVncyArIE1BMzVfTkZJX1JFR19O
QU5EQ1RMKTsKPiArCWVsc2UgaWYgKG10ZC0+d3JpdGVzaXplID09IDgxOTIpCj4gKwkJd3JpdGVs
KHJlZyB8IFBTSVpFXzhLLCBuYW5kLT5yZWdzICsgTUEzNV9ORklfUkVHX05BTkRDVEwpOwo+ICsK
PiArCXN3aXRjaCAoY2hpcC0+ZWNjLmVuZ2luZV90eXBlKSB7Cj4gKwljYXNlIE5BTkRfRUNDX0VO
R0lORV9UWVBFX09OX0hPU1Q6Cj4gKwkJY2hpcC0+b3B0aW9ucyB8PSBOQU5EX05PX1NVQlBBR0Vf
V1JJVEUgfCBOQU5EX1VTRVNfRE1BOwoKV2hhdCBpcyB0aGUgcmVhc29uIGZvciByZWZ1c2luZyBz
dWJwYWdlIHdyaXRlcz8gVGhpcyBpcyBub3Qgc29tZXRoaW5nCnlvdSBjYW4gZG8gbGF0ZXIsIHNv
IHVubGVzcyB0aGVyZSBpcyBhIGdvb2QgcmVhc29uLCBwbGVhc2UgZG8gbm90IHNldAp0aGlzIGZs
YWcuCgo+ICsJCWNoaXAtPmVjYy53cml0ZV9wYWdlID0gbWEzNV9uYW5kX3dyaXRlX3BhZ2VfaHdl
Y2M7Cj4gKwkJY2hpcC0+ZWNjLnJlYWRfcGFnZSAgPSBtYTM1X25hbmRfcmVhZF9wYWdlX2h3ZWNj
Owo+ICsJCWNoaXAtPmVjYy5yZWFkX29vYiAgID0gbWEzNV9uYW5kX3JlYWRfb29iX2h3ZWNjOwo+
ICsJCXJldHVybiBtYTM1X25hbmRfaHdlY2NfaW5pdChjaGlwLCBuYW5kKTsKPiArCWNhc2UgTkFO
RF9FQ0NfRU5HSU5FX1RZUEVfTk9ORToKPiArCWNhc2UgTkFORF9FQ0NfRU5HSU5FX1RZUEVfU09G
VDoKPiArCWNhc2UgTkFORF9FQ0NfRU5HSU5FX1RZUEVfT05fRElFOgo+ICsJCWJyZWFrOwo+ICsJ
ZGVmYXVsdDoKPiArCQlyZXR1cm4gLUVJTlZBTDsKPiArCX0KPiArCj4gKwlyZXR1cm4gMDsKPiAr
fQo+ICsKCi4uLgoKPiArc3RhdGljIGludCBtYTM1X25hbmRfY2hpcF9pbml0KHN0cnVjdCBkZXZp
Y2UgKmRldiwgc3RydWN0IG1hMzVfbmFuZF9pbmZvICpuYW5kLAo+ICsJCQkJIHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbnApCj4gK3sKPiArCXN0cnVjdCBtYTM1X25hbmRfY2hpcCAqbnZ0bmFuZDsKPiAr
CXN0cnVjdCBuYW5kX2NoaXAgKmNoaXA7Cj4gKwlzdHJ1Y3QgbXRkX2luZm8gKm10ZDsKPiArCWlu
dCBuc2VsczsKPiArCXUzMiB0bXA7Cj4gKwlpbnQgcmV0Owo+ICsJaW50IGk7Cj4gKwo+ICsJaWYg
KCFvZl9nZXRfcHJvcGVydHkobnAsICJyZWciLCAmbnNlbHMpKQoKUGxlYXNlIGNvbnZlcnQgdG8g
ZGV2aWNlX3Byb3BlcnR5XyBoZWxwZXJzLiBBbmQgcmVtb3ZlIHRoZSBvZiBpbmNsdWRlCm9uY2Ug
eW91IG5vIGxvbmdlciBuZWVkIGl0LgoKPiArCQlyZXR1cm4gLUVOT0RFVjsKPiArCj4gKwluc2Vs
cyAvPSBzaXplb2YodTMyKTsKPiArCWlmICghbnNlbHMgfHwgbnNlbHMgPiBNQTM1X01BWF9OU0VM
Uykgewo+ICsJCWRldl9lcnIoZGV2LCAiaW52YWxpZCByZWcgcHJvcGVydHkgc2l6ZSAlZFxuIiwg
bnNlbHMpOwo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsJfQo+ICsKPiArCW52dG5hbmQgPSBkZXZt
X2t6YWxsb2MoZGV2LCBzdHJ1Y3Rfc2l6ZShudnRuYW5kLCBzZWxzLCBuc2VscyksCj4gKwkJCSAg
ICAgIEdGUF9LRVJORUwpOwo+ICsJaWYgKCFudnRuYW5kKQo+ICsJCXJldHVybiAtRU5PTUVNOwo+
ICsKPiArCW52dG5hbmQtPm5zZWxzID0gbnNlbHM7Cj4gKwlmb3IgKGkgPSAwOyBpIDwgbnNlbHM7
IGkrKykgewo+ICsJCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyX2luZGV4KG5wLCAicmVnIiwg
aSwgJnRtcCk7Cj4gKwkJaWYgKHJldCkgewo+ICsJCQlkZXZfZXJyKGRldiwgInJlZyBwcm9wZXJ0
eSBmYWlsdXJlIDogJWRcbiIsIHJldCk7Cj4gKwkJCXJldHVybiByZXQ7Cj4gKwkJfQo+ICsKPiAr
CQlpZiAodG1wID49IE1BMzVfTUFYX05TRUxTKSB7Cj4gKwkJCWRldl9lcnIoZGV2LCAiaW52YWxp
ZCBDUzogJXVcbiIsIHRtcCk7Cj4gKwkJCXJldHVybiAtRUlOVkFMOwo+ICsJCX0KPiArCj4gKwkJ
aWYgKHRlc3RfYW5kX3NldF9iaXQodG1wLCAmbmFuZC0+YXNzaWduZWRfY3MpKSB7Cj4gKwkJCWRl
dl9lcnIoZGV2LCAiQ1MgJXUgYWxyZWFkeSBhc3NpZ25lZFxuIiwgdG1wKTsKPiArCQkJcmV0dXJu
IC1FSU5WQUw7Cj4gKwkJfQo+ICsKPiArCQludnRuYW5kLT5zZWxzW2ldID0gdG1wOwo+ICsJfQo+
ICsKCi4uLgoKPiArCj4gKwlyZXQgPSBtdGRfZGV2aWNlX3JlZ2lzdGVyKG10ZCwgTlVMTCwgMCk7
Cj4gKwlpZiAocmV0KSB7Cj4gKwkJZGV2X2VycihkZXYsICJNVEQgcGFyc2UgcGFydGl0aW9uIGVy
cm9yXG4iKTsKCnByb2JhYmx5IHVzZWxlc3MgZXJyb3IgbWVzc2FnZT8KCj4gKwkJbmFuZF9jbGVh
bnVwKGNoaXApOwo+ICsJCXJldHVybiByZXQ7Cj4gKwl9Cj4gKwo+ICsJbGlzdF9hZGRfdGFpbCgm
bnZ0bmFuZC0+bm9kZSwgJm5hbmQtPmNoaXBzKTsKPiArCj4gKwlyZXR1cm4gMDsKPiArfQoKSSBi
ZWxpZXZlIG5leHQgaXRlcmF0aW9uIHNob3VsZCBiZSB0aGUgb25lLCBJJ20gcmF0aGVyIGhhcHB5
IHdpdGggdGhlCm92ZXJhbGwgbG9vay4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
