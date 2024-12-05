Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F33CE7717F
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Dec 2024 15:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JOjP1ylMM9slLuoHplbXvJ/sxbWz54gO1zn0grwrMXk=; b=gThSMvH5zdo7Ag
	Wb6aPCx1Uc+1cfaocav8cU3GfUb28MSPvQdEucCtGrMf81whXbXKYNwPE46t6CaH3+7l3OtFD59+e
	O6iIRRRQ5FNpewU8qKWEEBbXHrXwQ2l3gvpFnorOCQZWdGgEipZWZGhkzqoTn1pLlAOCELt8ddx1Q
	aYrQBAfU/EoBqcTdVgDFlCbSsoZeEQfiIbWAql9s1wGFr2wpGQuCXJ6trPvihFIOJz2itcg84FmTz
	EFgt65HNSWDS4vrgXP4lurpO0TBiDrcgBmQFXJdLPPSGSEq7KLeEGizMNXJRiKw8ysNcy3kPrKTRA
	4KqufjbeafliZ5OBLEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDsr-0000000GYvv-0Pzh;
	Thu, 05 Dec 2024 15:35:17 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDqG-0000000GYD0-42v8;
	Thu, 05 Dec 2024 15:32:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DEFFAE0007;
	Thu,  5 Dec 2024 15:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733412754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sReBoPT1JSJ1DA3ZC1WbbChZ9fR0cPQ03s/2GbhiFr4=;
	b=BxWdMtw3m+YnkiJOTIyp6NWDPWfOSmQBU/jDdKrUhI55GR1DYIc1Y8A2X3REOlx+dEWSCD
	wnK/fWZGVJjO6vz3W2BWQUgp2ktCB9cvIkO0PzNzDPYA4k9aDMD6Q+0ld5bw531AQ5iSQ1
	Ix5riO1K25mRWOu8wCmomoNmD5pFWZ/reWDzycTd9b3M6oXnN7T2Tifhs+sEX1zCuaF5UD
	Ed3g5vJYFRQQkLXoj+QXOm1Xypddh3dqjYXaXprEu4YD8g4JT7wAKEm5gPT0LeQzx7bPGN
	LEgglkTdIpLES2SmsVdk9aBeDQTuoIgsQllstJIqD7pJ0MSYy+rd08wN6eFn+w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Daniel Golle
 <daniel@makrotopia.org>,  Chia-Lin Kao <acelan.kao@canonical.com>,  "Cheng
 Ming Lin" <chengminglin@mxic.com.tw>,  Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>,  Pratyush Yadav <pratyush@kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <linux-arm-kernel@lists.infradead.org>,
  <linux-mediatek@lists.infradead.org>,  Steven Liu
 <Steven.Liu@mediatek.com>
Subject: Re: [PATCH nand/next] mtd: nand: spi: Use write_cache first and
 then update_cache in write operation
In-Reply-To: <20241119093949.3014-1-SkyLake.Huang@mediatek.com> (Sky Huang's
	message of "Tue, 19 Nov 2024 17:39:49 +0800")
References: <20241119093949.3014-1-SkyLake.Huang@mediatek.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 05 Dec 2024 16:32:32 +0100
Message-ID: <871pymtab3.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_073237_311777_B18F4969 
X-CRM114-Status: GOOD (  18.42  )
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

SGVsbG8sCgpPbiAxOS8xMS8yMDI0IGF0IDE3OjM5OjQ5ICswOCwgU2t5IEh1YW5nIDxTa3lMYWtl
Lkh1YW5nQG1lZGlhdGVrLmNvbT4gd3JvdGU6Cgo+IEZyb206IFNreSBIdWFuZyA8c2t5bGFrZS5o
dWFuZ0BtZWRpYXRlay5jb20+Cj4KPiBBY2NvcmRpbmcgdG8gZGlzY3Vzc2lvbiB3aXRoIE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gYW5kIENodWFuaG9uZyBHdW8g
PGdjaDk4MTIxM0BnbWFpbC5jb20+IG9uIEZPUkVTRUUgRjM1U1FBMDAyRyBwYXRjaCwKPiBDaHVh
bmhvbmcgcmVjb21tbWVuZHMgdGhhdCB3ZSBjYW4gdXNlIHRoZSBmb2xsb3dpbmcgc2VxdWVuY2Ug
aW4KPiBzcGluYW5kX3dyaXRlX3RvX2NhY2hlX29wKCk6Cj4KPiB4MSBtb2RlOgo+IDAySChwcm9n
cmFtIGRhdGEgbG9hZCkgLT4gODRIKHJhbmRvbSBwcm9ncmFtIGRhdGEgbG9hZCkgLT4gODRIIC4u
Lgo+Cj4geDQgbW9kZToKPiAzMkgocHJvZ3JhbSBkYXRhIGxvYWQgeDQpIC0+IDM0SChyYW5kb20g
cHJvZ3JhbSBkYXRhIGxvYWQgeDQpIC0+IDM0SCAuLi4KPgo+IDAySCBvciAzMkggY29tbWFuZHMg
d2lsbCBjbGVhciBjYWNoZSBidWZmZXIgb24gU1BJLU5BTkQgYW5kIGxvYWQKPiBkYXRhIHRvIGl0
LiBGb3IgdGhvc2UgU1BJIGNvbnRyb2xsZXJzIHdoaWNoIGNhbid0IGZpbmlzaCB0cmFuc21pc3Np
b24KPiBpbiBzaW5nbGUgc3RlcCwgODRIIG9yIDM0SCB3aWxsIGJlIHRyaWdnZXJlZCBmb3IgdGhl
IHJlc3QgZGF0YS4KPgo+IFdlIG9ic2VydmUgdGhhdCBzb21lIGN1cnJlbnQgU1BJLU5BTkRzLCBp
bmNsdWRpbmcgRk9SRVNFRSBGMzVTUUEwMDFHIGFuZAo+IEYzNVNRQTAwMkcsIG11c3QgdXNlIDAy
SCBvciAzMkggdG8gcmVzZXQgY2FjaGUgYnVmZmVyIGluIGZsYXNoIGJlZm9yZQo+IHVzaW5nIDg0
SCBvciAzNEguIE9yIHVzZXJzIG1heSBlbmNvdW50ZXIgcHJvZ3JhbSBmYWlsdXJlIGlzc3VlLiBU
aGlzIGlzc3VlCj4gaXMgbm90IGFsd2F5cyByZXByb2R1Y2libGUsIGJ1dCBpdCBtYXkgb2NjdXIg
YW5kIGNhdXNlIHN5c3RlbSBpbnN0YWJpbGl0eS4KPgo+IFRoaXMgc2VxdWVuY2Ugc2hvdWxkIHdv
cmsgb24gYWxsIFNQSS1OQU5EcyBub3dhZGF5cy4gSSBhbHNvIGNoZWNrIHdpdGgKPiBGb3Jlc2Vl
IHRoYXQgdGhlIHNlcXVlbmNlIGNhbiBzb2x2ZSB0aGUgYWJvdmUgcHJvZ3JhbSBmYWlsdXJlIGlz
c3VlLgo+Cj4gT24gbXkgdGVzdCBwbGF0Zm9ybSAoTVQ3OTg4KSwgU1BJIGRyaXZlciBpcyBkcml2
ZXJzL3NwaS9zcGktbXQ2NXh4LmMuCj4gQW5kIEkgbGltaXQgTVRLX1NQSV9JUE1fUEFDS0VUX1NJ
WkUgdG8gU1pfMUsgdG8gc2ltdWxhdGUgbGlnaHR3ZWlnaHQgU1BJCj4gY29udHJvbGxlciB3aGlj
aCBjYW4gb25seSB0cmFuc21pdCAxMDI0IGJ5dGVzLgo+Cj4gVGhlIHRlc3Qgc3RlcCBpcyB0aGUg
Zm9sbG93aW5nOgo+IC0gbXRkIGVyYXNlIC9kZXYvbXRkMgo+IC0gZGQgaWY9L2Rldi96ZXJvIGJz
PTIwNDggY291bnQ9MSB8IHRyICdcMCcgJ1x4QTUnID4gb3V0cHV0LmJpbgo+IC0gbXRkIHdyaXRl
IG91dHB1dC5iaW4gL2Rldi9tdGQyCj4KPiBCZWZvcmUgYXBwbHlpbmcgdGhpcyBwYXRjaCwgd3Jp
dGUgb3BlcmF0aW9uIHVzZXMgb25seSAzNEgodXBkYXRlX2NhY2hlKToKPiBbNzguOTM3NzIwXSBP
UCBjb2RlOiAweDM0LCBhZGRyIHZhbDogMHgwLCBkYXRhIG5ieXRlczogMTAyMCwgZGF0YSAxc3Qg
Ynl0ZTogMHhhNQo+IFs3OC45NDUyOTddIE9QIGNvZGU6IDB4MzQsIGFkZHIgdmFsOiAweDNmYywg
ZGF0YSBuYnl0ZXM6IDEwMjAsIGRhdGEgMXN0IGJ5dGU6IDB4YTUKPiBbNzguOTU0MjUxXSBPUCBj
b2RlOiAweDM0LCBhZGRyIHZhbDogMHg3ZjgsIGRhdGEgbmJ5dGVzOiA3MiwgZGF0YSAxc3QgYnl0
ZTogMHhhNQo+IFs3OC45NjI5NjZdIE9QIGNvZGU6IDB4MTAsIGFkZHIgdmFsOiAweDMwMAo+IFs3
OC45Njg4MTZdIE9QIGNvZGU6IDB4MzQsIGFkZHIgdmFsOiAweDAsIGRhdGEgbmJ5dGVzOiAxMDIw
LCBkYXRhIDFzdCBieXRlOiAweGZmCj4gWzc4Ljk3NzIzM10gT1AgY29kZTogMHgzNCwgYWRkciB2
YWw6IDB4M2ZjLCBkYXRhIG5ieXRlczogMTAyMCwgZGF0YSAxc3QgYnl0ZTogMHhmZgo+IFs3OC45
ODUxMjRdIE9QIGNvZGU6IDB4MzQsIGFkZHIgdmFsOiAweDdmOCwgZGF0YSBuYnl0ZXM6IDcyLCBk
YXRhIDFzdCBieXRlOiAweGZmCj4gWzc4Ljk5MjUyN10gT1AgY29kZTogMHgxMCwgYWRkciB2YWw6
IDB4MzAxCj4gWzc4Ljk5Njk4MV0gT1AgY29kZTogMHgzNCwgYWRkciB2YWw6IDB4MCwgZGF0YSBu
Ynl0ZXM6IDEwMjAsIGRhdGEgMXN0IGJ5dGU6IDB4ZmYKPiBbNzkuMDA0NDE2XSBPUCBjb2RlOiAw
eDM0LCBhZGRyIHZhbDogMHgzZmMsIGRhdGEgbmJ5dGVzOiAxMDIwLCBkYXRhIDFzdCBieXRlOiAw
eGZmCj4gWzc5LjAxMjAzMV0gT1AgY29kZTogMHgzNCwgYWRkciB2YWw6IDB4N2Y4LCBkYXRhIG5i
eXRlczogNzIsIGRhdGEgMXN0IGJ5dGU6IDB4ZmYKPiBbNzkuMDE5NDM1XSBPUCBjb2RlOiAweDEw
LCBhZGRyIHZhbDogMHgzMDIKCkkgYW0gc29ycnkgYnV0IGFib3ZlIHlvdSBzYWlkIHRoYXQgd2Ug
c2hvdWxkIG5vdCBwZXJmb3JtOgoKICAgIDB4MzIsIDB4MzIsIDB4MzIuLi4KCmJlY2F1c2UgdGhl
IHNlY29uZCB0aW1lIGl0IHdvdWxkIGNsZWFyIHRoZSBjYWNoZSBhZ2Fpbi4gQW5kIGhlcmUKeW91
IHRlbGwgdXMgdGhhdCBhY3R1YWxseSB0aGUgY29yZSBhbHJlYWR5IGhhbmRsZXMgdGhhdCBieSBw
ZXJmb3JtaW5nCmluc3RlYWQ6CgogICAgMHgzNCwgMHgzNCwgMHgzNC4uLgoKU28gd2hhdCBpcyB0
aGUgcHJvYmxlbT8KCk9yIG1heWJlIEkgbWlzdW5kZXJzdG9vZCB0aGUgaXNzdWUsIGJ1dCBJIHRo
aW5rIENodWFuaG9uZyByYWlzZWQgYW4KaXNzdWUgdGhhdCBpcyBhbHJlYWR5IHNvbHZlZD8gSXNu
J3QgaXQ/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
