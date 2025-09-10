Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742C4CA101F
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 11:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mx/pnMDF7N3T9H4LNPPCMgpezbN1hEIunf8dODZU3l4=; b=oGHWQ7+VNt5sPD
	Sem+fMdYnL7TUmUZqQG+hM3nNwSGs1pQF9gV3T1QZ8+skuVG7O3OYPzkE4GGVO1G4GvSI+dyc8vKX
	eyK59oEMH3Nhy2o52+HCGxKbXUxIqm1TtA7CmisCRPvcNZHaW4AmYIC0/CvuMbdPuRvOeMBojXV4B
	7AbC0S69m8C/65EuEnkY+n/bwL6RmUjWBhbcotpWU8/egxmF0K1O1RStIILtNHs4lvf+my0FYFx/g
	ZHp9GANk2ctAhNuhDnTrTj81W6g5dMp3wmpdpzmiPwrQOnfbEwCXUfYuwxs1kI5emNul9L0YZOeoP
	Zo0Na0QVb/NclNXevqSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwItN-0000000DmlC-31Cf;
	Wed, 10 Sep 2025 11:21:37 +0000
Received: from smtp15.bhosted.nl ([2a02:9e0:8000::26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwItL-0000000Dmim-1DZf
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 11:21:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=zanders.be; s=202002;
	h=content-transfer-encoding:content-type:cc:to:subject:message-id:date:from:
	 in-reply-to:references:mime-version:from;
	bh=bJ8NnaxBGqI9c1HcK5edrUGgvU48WVycNBWqh4THYMI=;
	b=br3JbL9ww7cM1g9uyHARZrYdwXFb9qIw67df8edwB2VeQZvycF+ywUtazwATIP/ZvwqLBnmd6aO2w
	 hBynkL8dPvEyOw7TAK4IyFx1bo3hoeSa/gwPJG7EGpo70WlsreY2eKrVXbe/bCys6jRbiXTkud0V/k
	 THzCB+YrCg4DVawYDpJyyVVKcmbEtWfMAZX3tomznIImmi+ah87Pp4w0sr7kDtx8yARGHGD43r/WoS
	 JPiRbOItXdX63ESjfhqzFeYEN9Dk2G2be1GOTTPBbKr5cB0tD6nWfOo/ssQBJuEUCmXt1fHBlA4PgE
	 IvX1sEz0ZeVP2NpCCUGioLHGTquAKyg==
X-MSG-ID: 4c3463d4-8e38-11f0-9d60-00505681446f
X-Forwarded-Encrypted: i=1; AJvYcCVexT2CD7RooeWjbahuNGfsB09KJkjUdzKYcVp/py2wJIPpjfWWo4K90B5+c1XoNW6QQIxYbeC5J5o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq19X6m06x3x+mXAesKG7xnqjXUduPuK7zsegmp6OyPKUMhsK9
	GW4+r+6yXZMq1F+zl1EHUDdgNR9YDTFyVck8IyLCBGPkhXzXrrdwHIgWkwPG5PCWuA/KD3yaaAb
	lzEnrPFpK35pdh2bVsruUmOTf6jNmSRE=
X-Google-Smtp-Source: AGHT+IF+/7oWjJ9B8kZ16OEC1FrQiGh3WnQxJhPdnxaZvtVUrvpQSj1YRZu91Dm5WtLwb/Eu90kiK3wShPIRZkVh4iM=
X-Received: by 2002:a05:6902:2304:b0:e9d:b34d:fe8 with SMTP id
 3f1490d57ef6-e9f6789807emr13538401276.28.1757503289235; Wed, 10 Sep 2025
 04:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAPB_pELpdie+=VB3h3tqZCkdTd9cKyhnYNmXjeP1vYODDricLw@mail.gmail.com>
 <mafs0plcaw7rp.fsf@kernel.org> <CAPB_pEK=rSg77V7jrzx7mfrc3n0EwWZL7Ew=uNnocg6A+jN5Zw@mail.gmail.com>
 <mafs0plbzk5jf.fsf@yadavpratyush.com>
In-Reply-To: <mafs0plbzk5jf.fsf@yadavpratyush.com>
From: Maarten Zanders <maarten@zanders.be>
Date: Wed, 10 Sep 2025 13:21:17 +0200
X-Gmail-Original-Message-ID: <CAPB_pE+551RqarWAz-amWUQc3nHjMQV0=pDOcvuFzu6nHfaSzw@mail.gmail.com>
X-Gm-Features: AS18NWB9SzGu4IjyRVFRwRuWgsNi7VQg6qPQ_hXJicOZz3qucqC1KJICdAblceY
Message-ID: <CAPB_pE+551RqarWAz-amWUQc3nHjMQV0=pDOcvuFzu6nHfaSzw@mail.gmail.com>
Subject: Re: [spi-nor] Macronix MX25L requires CR read opcode 0x15 (not 0x35)
To: Pratyush Yadav <me@yadavpratyush.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, 
	linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_042135_741834_9AAA3F31 
X-CRM114-Status: GOOD (  27.54  )
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

SGksCgpPbiBUdWUsIFNlcCA5LCAyMDI1IGF0IDU6MjnigK9QTSBQcmF0eXVzaCBZYWRhdiA8bWVA
eWFkYXZwcmF0eXVzaC5jb20+IHdyb3RlOgo+IEhvdyBkbyBhbnkgb2YgdGhlIGZsYXNoZXMgZXZl
biB3b3JrIG9uIG1haW5saW5lIHRoZW4/IFdvbid0IHRoZXkgYWxsCj4gaGF2ZSB0aGUgc2FtZSBw
cm9ibGVtPyBEb2VzIGl0IG9ubHkgZW5kIHVwIHRvdWNoaW5nIHRoZSBPVFAgYml0cywgYW5kCj4g
dGhvc2UgZG9uJ3QgZ2V0IG5vdGljZWQ/CgpGb3IgdGhlIHBhcnQgSSBtZW50aW9uZWQsIHRoZSBv
dGhlciBmaWVsZHMgaW4gdGhlIENSIGNvbmNlcm46Ci0gb3V0cHV0IGRyaXZlciBzdHJlbmd0aCwg
dGhpcyBjYW4gZ28gZWFzaWx5IHVubm90ZWQgKGRlZmF1bHQgMSkKLSBkdW1teSBjbG9jayBjeWNs
ZXMsIG9ubHkgZm9yIGZhc3QgcmVhZCBtb2RlLCBub3Qgc3VyZSBpZiB0aGlzIGlzIHVzZWQKRmxp
cHBpbmcgdGhlIE9UUCB0b3AvYm90dG9tIGJpdCBvbmx5IGdldHMgbm90ZWQgd2hlbiB5b3UgdXNl
IChhbmQKdGVzdC4uKSBsb2NraW5nIGZvciB0aGUgbGFzdCBwb3J0aW9uIG9mIHRoZSBkZXZpY2Ug
YXMgdGhhdCdzIHRoZSBvbmx5CnRoaW5nIHdoaWNoIGlzIHN1cHBvcnRlZCBieSB0aGUgZHJpdmVy
IC0gdGhlIEJQIG1lY2hhbmlzbSBhdCB0b3Agb2YKZmxhc2guCkFsc28gd2hlbiBjb21iaW5lZCB3
aXRoIChkZWZhdWx0KSBVLUJvb3QgZm9yIGluc3RhbmNlLCBhbGwgbG9ja2luZyBpcwpkaXNhYmxl
ZCBpbiBTUiBhdCBib290IHdoaWNoIGhpZGVzIHRoZSBpc3N1ZSBhZ2Fpbi4uLgpTbyBmb3IgdGhl
IG1vc3QgcGFydCwgdGhlIGRyaXZlciBhbmQgZGV2aWNlcyBhcmUgd29ya2luZyBhbmQgeW91IG5l
ZWQKcXVpdGUgc29tZSBiYWQgbHVjayB0byBoaXQgdGhpcyBidWcuCgo+ID4gPiBTTk9SX0ZfTk9f
UkVBRF9DUgo+ID4gVGhhdCBmbGFnIHdpbGwgaGF2ZSBzaW1pbGFyIHJlc3VsdHMgYXMgcmVhZGlu
ZyBnYXJiYWdlIHRvZGF5LiBJdCB3aWxsCj4gPiBpZ25vcmUgdGhlIGFjdHVhbCBjb250ZW50cyBv
ZiBDUiB3aGVuIHdlJ3JlIGFjdHVhbGx5IHRyeWluZyB0byBkbyBhCj4gPiByZWFkLWRvbid0LW1v
ZGlmeS13cml0ZS4gSW4gdGhlIGNhc2Ugb2YgdGhpcyBwYXJ0LCBpdCB3aWxsIGNsZWFyIHNvbWUK
PiA+IGJpdHMgd2hpY2ggd2VyZSAxIGJ5IGRlZmF1bHQsIGNoYW5naW5nIG91dHB1dCBkcml2ZXIg
c3RyZW5ndGguCj4KPiBIbW0sIG1ha2VzIHNlbnNlLiBJIHdhcyBob3BpbmcgdGhlIGJpdHMgd291
bGQgYWxzbyBkZWZhdWx0IHRvIDAgc28gdGhlcmUKPiB3b24ndCBiZSBhIHByb2JsZW0uCgpBbHNv
IHRlc3RlZCB3aXRoIGEgZGlmZmVyZW50ICgmIGxhcmdlcikgZmxhc2ggZGV2aWNlLCBNWDI1TDI1
NjQ1RywKd2hlcmUgYWxsIHRoZSBDUiBiaXRzIGRvIGRlZmF1bHQgdG8gMC4gQ29pbmNpZGVudGFs
bHksIHRoZSBmbGFnClNOT1JfRl9OT19SRUFEX0NSIGlzIHRoZW4gYWxzbyBzZXQgc28gd2UncmUg
YWx3YXlzIHdyaXRpbmcgMCdzIHRvIENSCndoZW4gdXBkYXRpbmcgU1IuClRoaXMgaXMgYmVjYXVz
ZSBpbiBTRlBEICBCRlBUX0RXT1JEMTVfUUVSX1NSMl9CSVQxX05PX1JEIGlzIHNldCwgYXMKb3Bw
b3NlZCB0byBCRlBUX0RXT1JEMTVfUUVSX1NSMV9CSVQ2IG9uIHRoZSBmYWlsaW5nIHBhcnQuClNv
IGZvciB0aGlzIGtpbmQgb2YgZGV2aWNlcyAod2hpY2ggZG9uJ3QgcmVhZCBDUikgd2UncmUgZ29v
ZC4gQnV0IGl0J3MKaGFyZCB0byBnZXQgYW4gb3ZlcnZpZXcgZm9yIGFsbCBkZXZpY2VzIGFzIHRo
YXQgcmVxdWlyZXMgdGhlIFNGRFAgZGF0YQp3aGljaCBpcyBvbmx5IGF2YWlsYWJsZSBvbiByZXF1
ZXN0LgoKVGhpcyBTRkRQIHBhcnNpbmcgb2YgUUVSIGlzIHVuY2xlYXIvbWVzc3kgdG8gbWUuIEkn
ZCBsb3ZlIHRvIGhhdmUgYQpsb29rIGluIHRoZSBKRURFQyBzcGVjaWZpY2F0aW9uIGJ1dCBkb24n
dCBoYXZlIGFjY2Vzcy4gQ2xlYXJseSwKc29tZXdoZXJlIHNvbWV0aGluZyB3ZW50IHdyb25nIHdp
dGggdGhlIGltcGxlbWVudGF0aW9uIG9mIHRoZXNlCnBhcmFtZXRlcnMuIFNvbWUgdmFyaWFibGUg
cmVuYW1lcyBpbiB0aGUgcGFzdCBvYmZ1c2NhdGUgaGlzdG9yeSBhIGJpdAp0b28uIEkgZmVlbCB0
aGF0IFNOT1JfRl9OT19SRUFEX0NSIHdhcyBpbnRyb2R1Y2VkIGFzIGEgZml4IHdoaWxlIHRoZQph
Y3R1YWwgaXNzdWUgd2FzIGEgd3Jvbmcgb3Bjb2RlLi4uCkkgd2FzIHRvbGQgdGhhdCBNYWNyb25p
eCBlbmdpbmVlcnMgYXJlIGFsc28gbG9va2luZyBpbnRvIHRoaXMgc28gSQpob3BlIHRoZXkgY2Fu
IGNoaXAgaW4gaGVyZSBpbiBkdWUgdGltZS4KCj4gPiBBIGNsZWFuZXIvbW9kZXJuIGFwcHJvYWNo
IHdvdWxkIGJlIHRvIGFkZCBhIHBhcmFtZXRlciBpbiBzdHJ1Y3QKPiA+IHNwaV9ub3JfZmxhc2hf
cGFyYW1ldGVyIHdoaWNoIGdldHMgZGVmYXVsdGVkIHRvIFNQSU5PUl9PUF9SRENSICgweDM1KQo+
ID4gYW5kIGZpeGVkIHVwIHVzaW5nIG1hbnVmYWN0dXJlciBsYXRlX2luaXQoKSBmb3IgTWFjcm9u
aXg/Cj4KPiBZZWFoLCBvciBtYXliZSBhIGNhbGxiYWNrIGxpa2UgZm9yIHJlYWR5Pwo+CgpJIGhh
dmUgYSB3b3JraW5nIHBhdGNoIGZvciA2LjEgd2hpY2ggbXkgcHJvamVjdCB1c2VzIHRvZGF5LCB3
aWxsIHNlZQp0byBnZXQgdGhpcyB0byB0aGUgY3VycmVudCBzdGF0ZSAmIGhhdmUgaXQgdGVzdGVk
LgoKSSBhbHNvIG5vdGVkIG9uIHRoZSBaZXBoeXIgUHJvamVjdCB0aGF0IHRoZSBvcGNvZGUgZm9y
IFJEQ1IgaXMgdXNpbmcKMHgxNSBmb3IgYWxsIG1mZydzLi4uCgpCZXN0IHJlZ2FyZHMsCk1hYXJ0
ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
