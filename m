Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E0CC77B73
	for <linux-mtd@archiver.kernel.org>; Tue, 30 May 2023 08:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gpNEkV0it6uWda1b71kBJiFA58ic53/epehyLYDJmN0=; b=LCFZdQpPmXuPtA
	UKgJXiGoCgesyixuq7bY6K7iQc8XLjIGLcR1bqD9vko0EbMEyDITA1BkyffcljdLUaNNt4XHoksMI
	ANTMdxiESclDk+Ezx5pd13DfULY2CApM3Ps0BO/AmsY+XmD7T3MTnpnIijshkt/6sCx03KxnWvHu8
	aR2gNeLCxypO+7UXtCLrYJ64WuIKJ4lZT+7Jqei0QkpACdVI5Mg4z+eJK5I4gwZ/BNB5oIF0eGTP9
	cJMLFSU9uzzquxkV+pmrs5GUs2mku7tUeDOnSxFu0F/TbbWJ/9BjWDPTx3aFmJbjMUn1uZ518+2Vw
	v0vK0FGxMNBpPHvDi8mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uUR-00CsYR-2Q;
	Tue, 30 May 2023 08:13:59 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uUM-00CsWQ-2l;
	Tue, 30 May 2023 08:13:57 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id AFA065FD1D;
	Tue, 30 May 2023 11:13:48 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685434428;
	bh=MFEWIxYnC181XBgiG50LZAhwCaHLPl/kqKrPyecHE1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=JEk6ebn38b9Q6RBpaFJWRp8oVsTENXxa1tDoQOHw+ZB0gnaYBivfELHFolDn1OU8W
	 7/DK9/PnEwMtf5TPeIAZUHsyYDfVQe4SNAztgcPSmU+/MyiZmpbOiBHuMyHE3TTn9n
	 zh0CjeXvKAb+3lto2GLi2+2FtFPWS+YGShPjyQ8yMby8y7KRwYbydnWzg5kKiWy7Fg
	 wlYqs868xlWRjfc8T4E+FyHelt0ZZH0OpTUdWY1xy+Md2NhzVbhkAcDAubwFIwPs6L
	 t3RHc5mwcLMcFDru2ULNtaFP1q96eh6IxRsVLd20dZmFCY/MhbHnChgYpR5NG7K0rl
	 +jUcDXzx3YlVA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue, 30 May 2023 11:13:46 +0300 (MSK)
Message-ID: <1f4c90c4-e436-c53f-bb6f-416db374ae52@sberdevices.ru>
Date: Tue, 30 May 2023 11:09:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 2/5] mtd: rawnand: meson: move OOB to non-protected ECC
 area
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Yixun Lan <yixun.lan@amlogic.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20230515094440.3552094-1-AVKrasnov@sberdevices.ru>
 <20230515094440.3552094-3-AVKrasnov@sberdevices.ru>
 <20230522173334.7aa6f917@xps-13>
 <ebbc26e3-6a1c-eead-051c-8f93beba41f3@sberdevices.ru>
 <20230526190347.6e34a2be@xps-13>
 <b9f0a38a-0d50-23f0-4509-c38362d05f12@sberdevices.ru>
 <20230530094420.06281ab5@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230530094420.06281ab5@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/30 04:52:00 #21374971
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_011355_565565_9CFE0124 
X-CRM114-Status: GOOD (  19.03  )
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

SGkgTWlxdWVsLAoKT24gMzAuMDUuMjAyMyAxMDo0NCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBI
aSBBcnNlbml5LAo+IAo+Pj4+Pj4gLXN0YXRpYyB2b2lkIG1lc29uX25mY19nZXRfdXNlcl9ieXRl
KHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsIHU4ICpvb2JfYnVmKQo+Pj4+Pj4gLXsKPj4+Pj4+IC0J
c3RydWN0IG1lc29uX25mY19uYW5kX2NoaXAgKm1lc29uX2NoaXAgPSB0b19tZXNvbl9uYW5kKG5h
bmQpOwo+Pj4+Pj4gLQlfX2xlNjQgKmluZm87Cj4+Pj4+PiAtCWludCBpLCBjb3VudDsKPj4+Pj4+
ICsJaW50IGk7Cj4+Pj4+PiAgCj4+Pj4+PiAtCWZvciAoaSA9IDAsIGNvdW50ID0gMDsgaSA8IG5h
bmQtPmVjYy5zdGVwczsgaSsrLCBjb3VudCArPSAyKSB7Cj4+Pj4+PiArCWZvciAoaSA9IDA7IGkg
PCBuYW5kLT5lY2Muc3RlcHM7IGkrKykgewo+Pj4+Pj4gIAkJaW5mbyA9ICZtZXNvbl9jaGlwLT5p
bmZvX2J1ZltpXTsKPj4+Pj4+IC0JCW9vYl9idWZbY291bnRdID0gKmluZm87Cj4+Pj4+PiAtCQlv
b2JfYnVmW2NvdW50ICsgMV0gPSAqaW5mbyA+PiA4Owo+Pj4+Pj4gKwkJLyogQWx3YXlzIGlnbm9y
ZSB1c2VyIGJ5dGVzIHByb2dyYW1taW5nLiAqLyAgICAKPj4+Pj4KPj4+Pj4gV2h5PyAgICAKPj4+
Pgo+Pj4+IEkgdGhpbmsgY29tbWVudCBtZXNzYWdlIGlzIHdyb25nIGEgbGl0dGxlIGJpdC4gSGVy
ZSAidXNlciBieXRlcyIgYXJlCj4+Pj4gdXNlciBieXRlcyBwcm90ZWN0ZWQgYnkgRUNDIChlLmcu
IGxvY2F0aW9uIG9mIHRoZXNlIGJ5dGVzIGRpZmZlcnMgZnJvbSBuZXcKPj4+PiBPT0IgbGF5b3V0
IGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaCkuIER1cmluZyBwYWdlIHdyaXRlIHRoaXMgaGFyZHdh
cmUKPj4+PiBhbHdheXMgd3JpdGVzIHRoZXNlIGJ5dGVzIGFsb25nIHdpdGggZGF0YS4gQnV0LCBu
ZXcgT09CIGxheW91dCBhbHdheXMgaWdub3Jlcwo+Pj4+IHRoZXNlIDQgYnl0ZXMsIHNvIHNldCB0
aGVtIHRvIDB4RkYgYWx3YXlzLiAgCj4+Pgo+Pj4gV2hlbiBwZXJmb3JtaW5nIHBhZ2UgcmVhZHMv
d3JpdGVzLCB5b3UgbmVlZCB0byB0YWtlIHRoZSBkYXRhIGFzIGl0J3MKPj4+IGJlZW4gcHJvdmlk
ZWQuIFlvdSBtYXkgbW92ZSB0aGUgZGF0YSBhcm91bmQgaW4gdGhlIGJ1ZmZlciBwcm92aWRlZCB0
bwo+Pj4gdGhlIGNvbnRyb2xsZXIsIHNvIHRoYXQgaXQgZ2V0IHRoZSBFQ0MgZGF0YSBhdCB0aGUg
cmlnaHQgbG9jYXRpb24sIGFuZAo+Pj4geW91IG5lZWQgb2YgY291cnNlIHRvIHJlb3JnYW5pemUg
dGhlIGRhdGEgd2hlbiByZWFkaW5nIGFzIHdlbGwsIHNvIHRoYXQKPj4+IHRoZSB1c2VyIHNlZXMg
WGtpQiBvZiBkYXRhICsgWUIgb2YgT09CLiBUaGF0J3MgYWxsIHlvdSBuZWVkIHRvIGRvIGluCj4+
PiB0aGVzZSBoZWxwZXJzLgo+Pj4gICAKPj4KPj4gSSB0aGluayB0aGVyZSBpcyBzb21lIG1pc3Vu
ZGVyc3RhbmRpbmcgYWJvdXQgdGhlc2UgInVzZXIgYnl0ZXMiIGFib3ZlOiB0aGVyZSBhcmUgNAo+
PiBieXRlcyB3aGljaCB0aGlzIE5BTkQgY29udHJvbGxlciBhbHdheXMgd3JpdGVzIHRvIHBhZ2Ug
aW4gRUNDIG1vZGUgLSBpdCB3YXMgZnJlZSBPT0IKPj4gYnl0ZXMgY292ZXJlZCBieSBFQ0MuIENv
bnRyb2xsZXIgZ3JhYnMgdmFsdWVzIGZyb20gRE1BIGJ1ZmZlciAoc2Vjb25kIERNQSBidWZmZXIg
d2hpY2gKPj4gZG9lc24ndCBjb250YWlucyBwYWdlIGRhdGEpIGFuZCB3cml0ZXMgaXQgYWxvbmcg
d2l0aCBkYXRhIGFuZCBFQ0MgY29kZXMuIElkZWEgb2YgdGhpcwo+PiBjaGFuZ2UgaXMgdG8gYWx3
YXlzIHN1cHByZXNzIHRoaXMgd3JpdGUgYnkgc2V0dGluZyB0aGVtIHRvIDB4RkYgKG1heSBiZSB0
aGVyZSBpcyBzb21lCj4+IGNvbW1hbmQgb3B0aW9uIHRvIG5vdCB3cml0ZSBpdCwgYnV0IEkgZG9u
J3QgaGF2ZSBkb2MpLCBiZWNhdXNlIGFsbCBvZiB0aGVtICg0IGJ5dGVzKQo+PiBiZWNvbWUgdW5h
dmFpbGFibGUgdG8gcmVhZGVyL3dyaXRlci4KPiAKPiBBdCB0aGUgTkFORCBjb250cm9sbGVyIGxl
dmVsLCBJIHdvdWxkIHJhdGhlciBhdm9pZCBkb2luZyB0aGluZ3MgbGlrZQo+IHRoYXQuCj4gCj4g
SSBiZWxpZXZlIHlvdSBjYW4ganVzdCB1cGRhdGUgdGhlIG9vYmxheW91dCBzbyB0aGF0IHByb3Rl
Y3RlZCBPT0IgYnl0ZXMKPiBhcmUgbm90IGV4cG9zZWQgdG8gdGhlIHVzZXIgYXMgZnJlZSBieXRl
cy4gVGhlbiB5b3VyIGJ1ZmZlcnMgc2hvdWxkCj4gYWxyZWFkeSBjb250YWluIDB4ZmZmZmZmIGF0
IHRoZSBwcm9ibGVtYXRpYyBsb2NhdGlvbi4KClNvIFlvdXIgaWRlYSBpcyB0byBjb250aW51ZSBm
aWxsIERNQSBidWZmZXIgKGZvciB0aGVzZSA0IGJ5dGVzKSBmcm9tIHByb3ZpZGVkIE9PQiBidWZm
ZXIsCnJlbHlpbmcgb24gdGhhdCBhcyB0aGVzZSBieXRlcyBhcmUgdW51c2VkLCB0aGV5IHdpbGwg
YmUgMHhGRiBpbiBPT0IgYnVmZmVyIHNvIHdlIGdldCB0aGUgc2FtZSByZXN1bHQ/CgpUaGFua3Ms
IEFyc2VuaXkKCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
