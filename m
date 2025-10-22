Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F123CCCD195
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Oct 2025 09:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/jZhw8DsHUW1XHSt3XLMi1X9aZZcP4oqTzAqX9wjD2c=; b=hoOlpjeggTvdMZ
	q8hKxXkOkAiLUwi5GQxqZFHSDWBN9rodMVbEsc45DQsYwUxiCC2kdufkJLXNKZ5HipRCeaCLXmaRX
	Vw1AW8Mm3ovmTPMGIDhK1orASUWlzAKXdCQ9cLTO9ADb9kM2s2tI/mNC14wzwq6cy2EtlOjom/dTM
	iO9eS4YzQhA/08EddR0pyh9OvxSRQnKhv5vS2Dka6+ANa1zZLVaW/cP77y5yRHDZkZ8yBCdXRHsVI
	/BxsnstFVp6jPVUmhIMY2dL8Y7ARwUsKtH7nFxfbBtDTTRgO/MR5ExwWEiaVynOED/CYaTy+EfwzM
	9CofnbbgaA5HKMnHbRTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUzC-00000002Ev5-3Lxe;
	Wed, 22 Oct 2025 09:18:26 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUz8-00000002Er5-0CEH
	for linux-mtd@lists.infradead.org;
	Wed, 22 Oct 2025 09:18:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 565301A15CD;
	Wed, 22 Oct 2025 09:18:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1FD07606DC;
	Wed, 22 Oct 2025 09:18:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB8D8102F2424;
	Wed, 22 Oct 2025 11:18:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761124698; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LNEtH9lG/yvOebKMsji3DJq4oD0CU5SvCjoqyEyuZJY=;
	b=OF2J3E5AqsRwJZUe/GRi6I4GRKXFbvqbO/tcH7qL3QxWQQyacXCI2N81rs8SHmBRk42pei
	mDcgLvkOpYtZ128tfw0QgBcbY/E2k4MUV7t/gHmWJHKhdVhNl+2JV4byn2kuJ3Fb38Zsif
	wpRUDMbFz+ApprQLi2TiA/7Lx9AvfUPkrFwOFsBlUEtUARyAwZIjKZ2yNUEO0IVZruZaFf
	6hL7qd09YkaJz04E2Nuj0oSbPtlR8xHZsN9HavVDoyhWhsS2LPUifxn/pvZzIR5unzRj2j
	YtuqYc8IuOEKk7cQUYupHAyPUGw8jaHFhFGi667+wSvG5a5gvBhR5n9ZA2yHfw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@csie.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>,  Wentao Liang <vulab@iscas.ac.cn>,  Johan
 Hovold <johan@kernel.org>,  Maxime Ripard <mripard@kernel.org>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 13/15] mtd: rawnand: sunxi: Add support for H616 nand
 controller
In-Reply-To: <20251020101311.256819-14-richard.genoud@bootlin.com> (Richard
	Genoud's message of "Mon, 20 Oct 2025 12:13:09 +0200")
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
	<20251020101311.256819-14-richard.genoud@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Oct 2025 11:18:07 +0200
Message-ID: <87ecqvthv4.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_021822_616600_42F5C6DF 
X-CRM114-Status: GOOD (  20.45  )
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

SGVsbG8gUmljaGFyZCwKCk9uIDIwLzEwLzIwMjUgYXQgMTI6MTM6MDkgKzAyLCBSaWNoYXJkIEdl
bm91ZCA8cmljaGFyZC5nZW5vdWRAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBUaGUgSDYxNiBuYW5k
IGNvbnRyb2xsZXIgaGFzIHRoZSBzYW1lIGJhc2UgYXMgQTEwL0EyMywgd2l0aCBzb21lCj4gZGlm
ZmVyZW5jZXM6Cj4gLSBtZG1hIGlzIGJhc2VkIG9uIGNoYWluZWQgYnVmZmVycwo+IC0gaXRzIEVD
QyBzdXBwb3J0cyB1cCB0byA4MGJpdCBwZXIgMTAyNGJ5dGVzCj4gLSBzb21lIHJlZ2lzdGVycyBs
YXlvdXRzIGFyZSBhIGJpdCBkaWZmZXJlbnQsIG1haW5seSBkdWUgZG8gdGhlIHN0cm9uZ2VyCj4g
ICBFQ0MuCj4gLSBpdCB1c2VzIFVTRVJfREFUQV9MRU4gcmVnaXN0ZXJzIGFsb25nIFVTRVJfREFU
QSByZWdpc3RlcnMuCj4gLSBpdCBuZWVkcyBhIHNwZWNpZmljIGNsb2NrIGZvciBFQ0MgYW5kIE1C
VVMuCj4KPiBJbnRyb2R1Y2UgdGhlIGJhc2ljIHN1cHBvcnQsIHdpdGggRUNDIGFuZCBzY3JhbWJs
aW5nLCBidXQgd2l0aG91dAo+IERNQS9NRE1BLgo+Cj4gVGVzdGVkIG9uIFdoYXRzbWluZXIgSDYx
NiBib2FyZCAod2l0aCBhbmQgd2l0aG91dCBzY3JhbWJsaW5nLCBFQ0MpCj4KPiBTaWduZWQtb2Zm
LWJ5OiBSaWNoYXJkIEdlbm91ZCA8cmljaGFyZC5nZW5vdWRAYm9vdGxpbi5jb20+CgouLi4KCj4g
IAo+ICsjZGVmaW5lIE5GQ19USU1JTkdfQ0ZHMih0Q0RRU1MsIHRTQywgdENMSFosIHRDU1MsIHRX
QykJCVwKPiArCSgoKCh0Q0RRU1MpICYgMHgxKSA8PCAxMSkgfCAoKCh0U0MpICYgMHgzKSA8PCAx
MikgfAlcCj4gKwkgKCgodENMSFopICYgMHgzKSA8PCAxNCkgfCAoKCh0Q1NTKSAmIDB4MykgPDwg
MTYpIHwJXAo+ICsJICgoKHRXQykgJiAweDMpIDw8IDE4KSkKPiArCj4gIC8qIGRlZmluZSBiaXQg
dXNlIGluIE5GQ19DTUQgKi8KPiAgI2RlZmluZSBORkNfQ01EX0xPV19CWVRFX01TSwlHRU5NQVNL
KDcsIDApCj4gLSNkZWZpbmUgTkZDX0NNRF9ISUdIX0JZVEVfTVNLCUdFTk1BU0soMTUsIDgpCj4g
KyNkZWZpbmUgTkZDX0NNRF9ISUdIX0JZVEVfTVNLCUdFTk1BU0soMTUsIDgpICAvLyAxNS0xMCBy
ZXNlcnZlZCBvbiBINgoKV3JvbmcgY29tbWVudCB0eXBlIDotKQoKPiArI2RlZmluZSBORkNfQ01E
X0FEUl9OVU1fTVNLCUdFTk1BU0soOSwgOCkKPiAgI2RlZmluZSBORkNfQ01EKHgpCQkoeCkKPiAg
I2RlZmluZSBORkNfQURSX05VTV9NU0sJCUdFTk1BU0soMTgsIDE2KQo+ICAjZGVmaW5lIE5GQ19B
RFJfTlVNKHgpCQkoKCh4KSAtIDEpIDw8IDE2KQo+IEBAIC0xMjIsNiArMTU2LDcgQEAKPiAgI2Rl
ZmluZSBORkNfU0VRCQkJQklUKDI1KQo+ICAjZGVmaW5lIE5GQ19EQVRBX1NXQVBfTUVUSE9ECUJJ
VCgyNikKPiAgI2RlZmluZSBORkNfUk9XX0FVVE9fSU5DCUJJVCgyNykKPiArI2RlZmluZSBORkNf
SDZfU0VORF9STkRfQ01EMglCSVQoMjcpCj4gICNkZWZpbmUgTkZDX1NFTkRfQ01EMwkJQklUKDI4
KQo+ICAjZGVmaW5lIE5GQ19TRU5EX0NNRDQJCUJJVCgyOSkKPiAgI2RlZmluZSBORkNfQ01EX1RZ
UEVfTVNLCUdFTk1BU0soMzEsIDMwKQo+IEBAIC0xMzMsNiArMTY4LDcgQEAKPiAgI2RlZmluZSBO
RkNfUkVBRF9DTURfTVNLCUdFTk1BU0soNywgMCkKPiAgI2RlZmluZSBORkNfUk5EX1JFQURfQ01E
MF9NU0sJR0VOTUFTSygxNSwgOCkKPiAgI2RlZmluZSBORkNfUk5EX1JFQURfQ01EMV9NU0sJR0VO
TUFTSygyMywgMTYpCj4gKyNkZWZpbmUgTkZDX1JORF9SRUFEX0NNRDJfTVNLCUdFTk1BU0soMzEs
IDI0KQoKLi4uCgo+IEBAIC04NTgsNiArOTY3LDggQEAgc3RhdGljIGludCBzdW54aV9uZmNfaHdf
ZWNjX3JlYWRfY2h1bmsoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwKPiAgCWlmIChyZXQpCj4gIAkJ
cmV0dXJuIHJldDsKPiAgCj4gKwlzdW54aV9uZmNfcmVzZXRfdXNlcl9kYXRhX2xlbihuZmMpOwo+
ICsJc3VueGlfbmZjX3NldF91c2VyX2RhdGFfbGVuKG5mYywgNCwgMCk7CgpJJ20gbm90IHN1cmUg
SSB1bmRlcnN0YW5kIHRoaXMgcHJvcGVybHkuIFdoeSBpc24ndCB0aGlzIGEgZml4ZWQgc2V0dGlu
Zz8KQWxzbywgd2hhdCBpcyA0PyBJdCBpcyBub3Qgb2J2aW91cyB0byBtZSBhbmQgbXkgcmVxdWly
ZSBlaXRoZXIgYSBjb21tZW50Cm9yIGEgZGVmaW5lIChvciBtYXliZSBhIHNpemVvZigpKS4KCj4g
IAlzdW54aV9uZmNfcmFuZG9taXplcl9jb25maWcobmFuZCwgcGFnZSwgZmFsc2UpOwo+ICAJc3Vu
eGlfbmZjX3JhbmRvbWl6ZXJfZW5hYmxlKG5hbmQpOwo+ICAJd3JpdGVsKE5GQ19EQVRBX1RSQU5T
IHwgTkZDX0RBVEFfU1dBUF9NRVRIT0QgfCBORkNfRUNDX09QLAo+IEBAIC05NjgsNiArMTA3OSw4
IEBAIHN0YXRpYyBpbnQgc3VueGlfbmZjX2h3X2VjY19yZWFkX2NodW5rc19kbWEoc3RydWN0IG5h
bmRfY2hpcCAqbmFuZCwgdWludDhfdCAqYnVmCj4gIAkJcmV0dXJuIHJldDsKPiAgCj4gIAlzdW54
aV9uZmNfaHdfZWNjX2VuYWJsZShuYW5kKTsKPiArCXN1bnhpX25mY19yZXNldF91c2VyX2RhdGFf
bGVuKG5mYyk7Cj4gKwlzdW54aV9uZmNfc2V0X3VzZXJfZGF0YV9sZW4obmZjLCA0LCAwKTsKPiAg
CXN1bnhpX25mY19yYW5kb21pemVyX2NvbmZpZyhuYW5kLCBwYWdlLCBmYWxzZSk7Cj4gIAlzdW54
aV9uZmNfcmFuZG9taXplcl9lbmFibGUobmFuZCk7Cj4gIAo+IEBAIC0xMTAwLDYgKzEyMTMsOCBA
QCBzdGF0aWMgaW50IHN1bnhpX25mY19od19lY2Nfd3JpdGVfY2h1bmsoc3RydWN0IG5hbmRfY2hp
cCAqbmFuZCwKPiAgCj4gIAlzdW54aV9uZmNfcmFuZG9taXplcl9jb25maWcobmFuZCwgcGFnZSwg
ZmFsc2UpOwo+ICAJc3VueGlfbmZjX3JhbmRvbWl6ZXJfZW5hYmxlKG5hbmQpOwo+ICsJc3VueGlf
bmZjX3Jlc2V0X3VzZXJfZGF0YV9sZW4obmZjKTsKPiArCXN1bnhpX25mY19zZXRfdXNlcl9kYXRh
X2xlbihuZmMsIDQsIDApOwo+ICAJc3VueGlfbmZjX2h3X2VjY19zZXRfcHJvdF9vb2JfYnl0ZXMo
bmFuZCwgb29iLCAwLCBiYm0sIHBhZ2UpOwo+ICAKPiAgCXdyaXRlbChORkNfREFUQV9UUkFOUyB8
IE5GQ19EQVRBX1NXQVBfTUVUSE9EIHwKPiBAQCAtMTM0NCwxMCArMTQ1OSwxMiBAQCBzdGF0aWMg
aW50IHN1bnhpX25mY19od19lY2Nfd3JpdGVfcGFnZV9kbWEoc3RydWN0IG5hbmRfY2hpcCAqbmFu
ZCwKPiAgCWlmIChyZXQpCj4gIAkJZ290byBwaW9fZmFsbGJhY2s7Cj4gIAo+ICsJc3VueGlfbmZj
X3Jlc2V0X3VzZXJfZGF0YV9sZW4obmZjKTsKPiAgCWZvciAoaSA9IDA7IGkgPCBlY2MtPnN0ZXBz
OyBpKyspIHsKPiAgCQljb25zdCB1OCAqb29iID0gbmFuZC0+b29iX3BvaSArIChpICogKGVjYy0+
Ynl0ZXMgKyA0KSk7Cj4gIAo+ICAJCXN1bnhpX25mY19od19lY2Nfc2V0X3Byb3Rfb29iX2J5dGVz
KG5hbmQsIG9vYiwgaSwgIWksIHBhZ2UpOwo+ICsJCXN1bnhpX25mY19zZXRfdXNlcl9kYXRhX2xl
bihuZmMsIDQsIGkpOwoKSGVyZSB5b3UgdXNlIGl0IGRpZmZlcmVudGx5LCBtYXliZSBhIGJpdCBv
ZiBleHBsYW5hdGlvbiBpbiBhIGNvbW1lbnQKY291bGQgaGVscC4KCj4gIAl9Cj4gIAo+ICAJbmFu
ZF9wcm9nX3BhZ2VfYmVnaW5fb3AobmFuZCwgcGFnZSwgMCwgTlVMTCwgMCk7Cj4gQEAgLTIxNDgs
NiArMjI2NSwxMCBAQCBzdGF0aWMgaW50IHN1bnhpX25mY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQo+ICAJaWYgKGlycSA8IDApCj4gIAkJcmV0dXJuIGlycTsKPiAgCj4gKwlu
ZmMtPmNhcHMgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsKPiArCWlmICghbmZjLT5j
YXBzKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiAgCW5mYy0+YWhiX2NsayA9IGRldm1fY2xr
X2dldF9lbmFibGVkKGRldiwgImFoYiIpOwo+ICAJaWYgKElTX0VSUihuZmMtPmFoYl9jbGspKSB7
Cj4gIAkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gcmV0cmlldmUgYWhiIGNsa1xuIik7Cj4gQEAg
LTIxNjAsNiArMjI4MSwyMiBAQCBzdGF0aWMgaW50IHN1bnhpX25mY19wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJCXJldHVybiBQVFJfRVJSKG5mYy0+bW9kX2Nsayk7Cj4g
IAl9Cj4gIAoKLi4uCgo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHN1bnhpX25mY19jYXBzIHN1bnhp
X25mY19hMTBfY2FwcyA9IHsKPiAgCS5oYXNfZWNjX2Jsb2NrXzUxMiA9IHRydWUsCj4gKwkuaGFz
X2VjY19jbGsgPSBmYWxzZSwKPiArCS5oYXNfbWJ1c19jbGsgPSBmYWxzZSwKCkFzIHlvdSB3YW50
LCBidXQgc2V0dGluZyB0aGVzZSBmaWVsZHMgKGFuZCBiZWxvdykgdG8gZmFsc2UgaXMgbm90CnN0
cmljdGx5IHJlcXVpcmVkIGFzIHRoZXkgd2lsbCBiZSBzZXQgdG8gMCAod2hpY2ggbWVhbnMgZmFs
c2UsCmF1dG9tYXRpY2FsbHkpLgoKPiAgCS5yZWdfaW9fZGF0YSA9IE5GQ19SRUdfQTEwX0lPX0RB
VEEsCj4gIAkucmVnX2VjY19lcnJfY250ID0gTkZDX1JFR19BMTBfRUNDX0VSUl9DTlQsCj4gIAku
cmVnX3VzZXJfZGF0YSA9IE5GQ19SRUdfQTEwX1VTRVJfREFUQSwKPiBAQCAtMjI0MiwxMSArMjM4
MywxNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHN1bnhpX25mY19jYXBzIHN1bnhpX25mY19hMTBf
Y2FwcyA9IHsKPiAgCS5kbWFfbWF4YnVyc3QgPSA0LAo+ICAJLmVjY19zdHJlbmd0aHMgPSBzdW54
aV9lY2Nfc3RyZW5ndGhzX2ExMCwKPiAgCS5uc3RyZW5ndGhzID0gQVJSQVlfU0laRShzdW54aV9l
Y2Nfc3RyZW5ndGhzX2ExMCksCj4gKwkubWF4X2VjY19zdGVwcyA9IDE2LAo+ICAJLnNyYW1fc2l6
ZSA9IDEwMjQsCj4gIH07Cj4gIAoKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBzdW54aV9uZmNfY2Fw
cyBzdW54aV9uZmNfaDYxNl9jYXBzID0gewo+ICsJLmhhc19tZG1hID0gZmFsc2UsIC8vIEg2MTYg
c3VwcG9ydHMgb25seSBjaGFpbmVkIGRlc2NyaXB0b3JzCgpXcm9uZyBjb21tZW50IHR5cGUgOi0p
CgpMR1RNIG90aGVyd2lzZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
