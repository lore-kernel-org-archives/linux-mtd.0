Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765F3CA1005
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Sep 2025 12:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R5O5WVxs1WQ+VRHH9Bkzx/fObVy77iAwq/dsz+rTM4c=; b=abL/f/zexNytTw
	X9BfiCIOppBCM+KgsSP6Lstq1XmWKhaMVag5NPXZJOx1DTA+wcGEEOzOX8TxfMKJFvhaVTWyuiSRZ
	upZhzehRrQMBnXsLk+sDri4KIzF+oPSjM3oHSwfpt3GjumPyKP3J9gW7waLwDhvd7RmmXmtphXohK
	D56Gt2aV5ylRA6TI9zuWl85oIGk25iYsYLF9L+HH0FLAuGjRrGuIuLngllCLykoeg+k5WA/C2a1oy
	4Pa1hhn50ZKtXJfmDsfCaPAsC6OdJ5Blb17U3zN9Tn7bkNqAWsofCKE/ZD6w16uSwFOaKWAPNe2ox
	Je/5ZV+zSLJp32yq9Rhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQIH-0000000HNOa-2aUD;
	Tue, 02 Sep 2025 12:39:25 +0000
Received: from smtp16.bhosted.nl ([2a02:9e0:8000::27])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utP22-0000000GsiO-1Y1E
	for linux-mtd@lists.infradead.org;
	Tue, 02 Sep 2025 11:18:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=zanders.be; s=202002;
	h=content-transfer-encoding:content-type:cc:to:subject:message-id:date:from:
	 in-reply-to:references:mime-version:from;
	bh=8DPApMx/D4WMaM3AuyzOzYc33yvFzERnr2VJVcGTCeo=;
	b=k2kqAxeXlGsEahHjInggDMV5SXLiLL5oV3ukevosQHR0rWFjFSR9jF0UpHtSHkxuL1OfACnb+zSRh
	 sQEfxVz8rAnRyWVfYZcKxbcuL2gtokCzXPrLipyANusMBg8L4lZrTyE6Qz+XKpOnV4Rqlgps0kw2S4
	 jHYMXtG02NNJbZRyue6E096bg8NkqEGhVA00XYa+bnQz2PwYPezGh37hSilCiOqP/ZoHeBEYBzpmSe
	 9tmsXYBKojFxeS1WOgEDfE7mnJXyUQQZpwUidjxUWQgcMEN07ABrNwTioj8An0ENHVVGplKSRcn5gN
	 UbagGqXBBkDSUaC2ZFsOYtJjH3L2eig==
X-MSG-ID: 8cf502d2-87ee-11f0-8571-005056817704
X-Forwarded-Encrypted: i=1; AJvYcCWR+wh5dvo4UXYxqCF437FdYtvNqkQsbf1PhfJthjvMiRskB9abCZKirMW3+R64cODV9084UEJAM5s=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZHKbxoQ9gzFO+hXLswfNg0FXxhs0Wft1/axTOq5DF5VF5F52h
	XwosC1J2Fnomw36KC/qRY+81zmrj0zjfWclNyqNJi8pva3QjO+E3oou8K4+08pweVZKDUf9FZ+v
	B01hAa6St4K8nbi8Hbx4Ogc2lCCB8KoM=
X-Google-Smtp-Source: AGHT+IEYub5bQtTyaSjNfvprMVDvS6vtuQKnWZocLwJHRQ6z5MNnmk6dzzD+No+ztJ0Ad39a/tdholEjob34druYekQ=
X-Received: by 2002:a05:690c:4911:b0:71f:e430:666b with SMTP id
 00721157ae682-722764acba5mr109893077b3.32.1756811908121; Tue, 02 Sep 2025
 04:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAPB_pELpdie+=VB3h3tqZCkdTd9cKyhnYNmXjeP1vYODDricLw@mail.gmail.com>
 <mafs0plcaw7rp.fsf@kernel.org>
In-Reply-To: <mafs0plcaw7rp.fsf@kernel.org>
From: Maarten Zanders <maarten@zanders.be>
Date: Tue, 2 Sep 2025 13:18:16 +0200
X-Gmail-Original-Message-ID: <CAPB_pEK=rSg77V7jrzx7mfrc3n0EwWZL7Ew=uNnocg6A+jN5Zw@mail.gmail.com>
X-Gm-Features: Ac12FXzXAIASQcwe0PFfJJpZ9m3Y2RaASLrbj5ReFgd9EdVNN0wgF25TuY2iS6Q
Message-ID: <CAPB_pEK=rSg77V7jrzx7mfrc3n0EwWZL7Ew=uNnocg6A+jN5Zw@mail.gmail.com>
Subject: Re: [spi-nor] Macronix MX25L requires CR read opcode 0x15 (not 0x35)
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_041834_820235_5BF96102 
X-CRM114-Status: GOOD (  21.44  )
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

SGksCgpPbiBNb24sIFNlcCAxLCAyMDI1IGF0IDQ6NDbigK9QTSBQcmF0eXVzaCBZYWRhdiA8cHJh
dHl1c2hAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBPbiB0aGUgTWFjcm9uaXggTVgyNUwxMjgzM0Yg
KElEIDB4QzIyMDE4KSAmIG90aGVycyBvZiB0aGlzIGZhbWlseS9tZmcsCj4gPiB0aGUgQ1IgKGNv
bmRpdGlvbiByZWdpc3RlcikgbXVzdCBiZSByZWFkIHdpdGggb3Bjb2RlIDB4MTUuIFRoZSBkcml2
ZXIKPiA+IGN1cnJlbnRseSB1c2VzIDB4MzUsIHdoaWNoIHRoZSBjaGlwIGRvZXMgbm90IHJlY29n
bml6ZS4KPgo+IElzIGl0IG9uZSBvZiB0aG9zZSBkZXZpY2VzIGZvciB3aGljaCBNYWNyb25peCBo
YXMgcmUtdXNlZCB0aGUgZmxhc2ggSURzPwo+IEkgdmFndWVseSByZWNhbGwgcmVhZGluZyB0aGF0
IHNvbWV3aGVyZS4gSWYgc28sIHRoZW4gd2UgYWxzbyBuZWVkIHRvIGJlCj4gY2FyZWZ1bCBvZiBi
cmVha2luZyB0aGUgb2xkZXIgdmFyaWFudHMgb2YgdGhlIGZsYXNoLgoKWWVzLCB0aGVyZSBpcyBx
dWl0ZSBzb21lIGZsYXNoIElEIHJldXNlLiBUaGlzIGlzIGluZGVlZCBvbmUgb2YgdGhlbS4KSSBq
dXN0IHdlbnQgdGhyb3VnaCBhIGxvdCBvZiBkYXRhc2hlZXRzIGZyb20gTWFjcm9uaXggYW5kIGZv
ciB0aG9zZQpzdXBwb3J0aW5nIFJEQ1IsIHRoZXkgYXJlIGFsd2F5cyB1c2luZyBvcGNvZGUgMHgx
NS4KQWxzbywgd2hlbiBpbnNwZWN0aW5nIHBhdGNoZXMgKGZvciBvbGRlciBrZXJuZWwsIHVib290
LC4uKSB3aGljaCBhZGQKTVggc3BpLW5vciBzdXBwb3J0IGZyb20gdGhlIE1hY3Jvbml4IHdlYnNp
dGUsIHRoZXkgZG8gc29tZXRoaW5nIGxpa2UKdGhpczoKCiNkZWZpbmUgU1BJTk9SX09QX1JEQ1Jf
TVggMHgxNSAvKiBSZWFkIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXIgZm9yIE1hY3Jvbml4Ki8KLi4u
Cm9wY29kZSA9IChub3ItPmplZGVjX2lkID09IENGSV9NRlJfTUFDUk9OSVgpID8gU1BJTk9SX09Q
X1JEQ1JfTVggOgpTUElOT1JfT1BfUkRDUjsKCkEgY2xlYW5lci9tb2Rlcm4gYXBwcm9hY2ggd291
bGQgYmUgdG8gYWRkIGEgcGFyYW1ldGVyIGluIHN0cnVjdApzcGlfbm9yX2ZsYXNoX3BhcmFtZXRl
ciB3aGljaCBnZXRzIGRlZmF1bHRlZCB0byBTUElOT1JfT1BfUkRDUiAoMHgzNSkKYW5kIGZpeGVk
IHVwIHVzaW5nIG1hbnVmYWN0dXJlciBsYXRlX2luaXQoKSBmb3IgTWFjcm9uaXg/Cgo+IElzIGl0
IGF0IGFsbCBwb3NzaWJsZSB0byBkaXNjb3ZlciB0aGUgb3Bjb2RlIGZyb20gdGhlIGZsYXNoIFNG
RFAgdGFibGUKPiAoU0NDUiBtYXAgcGVyaGFwcyk/IElmIHNvLCBJIHRoaW5rIHRoYXQgd291bGQg
YmUgdGhlIGJlc3Qgd2F5IGZvcndhcmQKPiBzaW5jZSBpdCB3b3VsZCBiZSBnZW5lcmljLgoKVW5m
b3J0dW5hdGVseSwgbm8uIEkgcmVjZWl2ZWQgdGhlIFNGRFAgZGF0YSBmb3IgdGhpcyBwYXJ0IGFu
ZCB0aGVyZSdzCm5vIFNDQ1IgbWFwIG9yIG90aGVyIG1lYW5zIHRvIGRpc3Rpbmd1aXNoIG9wY29k
ZXMuIEkgYmVsaWV2ZSBvbmx5IHRoZQptb3JlIHJlY2VudCBwYXJ0cyBpbmNsdWRlIHRoaXMgKFND
Q1Igd2FzIGRlZmluZWQgaW4gMjAxOSkuCgo+IFRoZXJlIGlzIHRoZSBTTk9SX0ZfTk9fUkVBRF9D
UiBmbGFnIHRoYXQgc2VlbXMgdG8gZG8gd2hhdCB5b3Ugd2FudC4gSW4KPiBzcGlfbm9yX3dyaXRl
XzE2Yml0X3NyX2FuZF9jaGVjaygpLCBpZiB0aGUgZmxhZyBpcyBzZXQgaXQgZG9lcyBub3QgaXNz
dWUKPiB0aGUgcmVhZCBDUiBjb21tYW5kIGFuZCBlaXRoZXIgc2V0cyB0aGUgc2Vjb25kIGJ5dGUg
dG8gMCBvciB0bwo+IFNSMl9RVUFEX0VOX0JJVDEuIFRoZSBmbGFnIGNhbiBiZSBkaXNjb3ZlcmVk
IHZpYSBCRlBUIChzZWUKPiBzcGlfbm9yX3BhcnNlX2JmcHQoKSkuIElzIHRoZSBCRlBUIHRhYmxl
IG9uIHRoZSBmbGFzaCBpbmNvcnJlY3Q/IEluIHRoYXQKPiBjYXNlLCBwZXJoYXBzIHdlIHNob3Vs
ZCBhZGQgYSBwb3N0LUJGUFQgZml4dXA/CgpUaGF0IGZsYWcgd2lsbCBoYXZlIHNpbWlsYXIgcmVz
dWx0cyBhcyByZWFkaW5nIGdhcmJhZ2UgdG9kYXkuIEl0IHdpbGwKaWdub3JlIHRoZSBhY3R1YWwg
Y29udGVudHMgb2YgQ1Igd2hlbiB3ZSdyZSBhY3R1YWxseSB0cnlpbmcgdG8gZG8gYQpyZWFkLWRv
bid0LW1vZGlmeS13cml0ZS4gSW4gdGhlIGNhc2Ugb2YgdGhpcyBwYXJ0LCBpdCB3aWxsIGNsZWFy
IHNvbWUKYml0cyB3aGljaCB3ZXJlIDEgYnkgZGVmYXVsdCwgY2hhbmdpbmcgb3V0cHV0IGRyaXZl
ciBzdHJlbmd0aC4KClRoYW5rcyBmb3IgeW91ciBmZWVkYmFjaywKTWFhcnRlbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
