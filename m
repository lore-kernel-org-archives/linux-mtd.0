Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E25CC433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 09:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5opF9Fz1OuwXlLVnoC+lGsb/78j5gprAW2RABFoo2LI=; b=TQh6RGGC0zt9bh
	6HqciNYDf+TgvjkkV2UJabS5aIdzs4kFI7XNyI7W0BHZ61yPFDEnR7dITRLWHwIlbzPWjKUK2Jl4y
	GiQELMWdY1YA8PAghIOtG8vbh0zH/Wm4cJ3jOvm71Aa9UlUYCBAjU43NFgD/wmiUDrksA7YQuy/LM
	mX2EmsitdtIeKT3dZE4Nkqtj4ppRF4UdHX2ScmCHIovHWdo9Np+Y+hMgdTT19mKZ0wtx2FUD+VqSA
	AnApPg2EB5oWJeoKvLszBlfLypwgTHU+YAHF40LWGQzeJD6HqdLIPAh7dV/kmrjFIcqG9ZTYmrlBs
	uLOUR4w5S2Fgkd2rvuUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oryD7-00D9zV-I1; Mon, 07 Nov 2022 09:14:29 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oryBh-00D95R-T2
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2022 09:13:03 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id AF06B5C00C1;
	Mon,  7 Nov 2022 04:12:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 07 Nov 2022 04:12:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1667812353; x=
	1667898753; bh=TRtlv9pGdSEUDOrOSLRLRfxV4uO+MIHMFeZ5pMG+o0Y=; b=v
	2TOdj0KeVZEGPbt5nSEnZXvAX9S0Iuyfx35d4EY5k7lcUdeJK0tg4MfHHwNLRCMB
	lBU1NSSXrQV9/HiibYTgLSHySopouXG2md3H2GYoi8+g0/kqFnInXb6J5CZW85pP
	B56hYHMyST5JByPMg5lVxiKko+Zz6rdPS3F4blDqR/extAl5tKVneh0+12ZRzhON
	GFznrDYd7efTJk3RWXqu+WN/79NQ8jJJ8ET7Tup8I63dhRbwRCWlofTgWjd+ffJa
	F+1tB/GZNYF7HKlQGxaaIONenSHqMlrCkdERe5A4xcTnBudhZ5g2EdX095Qqqleg
	dXx/WUzPL8WV89zQwPf+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667812353; x=
	1667898753; bh=TRtlv9pGdSEUDOrOSLRLRfxV4uO+MIHMFeZ5pMG+o0Y=; b=H
	qUDR7God0UUmalquFDPVlA7SKl7VM9wOg5KvgGd2r5/0cAyhMOpdCDV43ZSoAuCi
	2nuJwRLmGWbEYqQV5EqUyWXGktPEIYqwEIV3DMFZF/JHQJIXqnyEf+C22tInCSH9
	82f8ewTRCbX3qNbfhZzTqWhe9vmDkzU66eMk1iTf3N4lR5/7A2soOLcPOtkHmf8s
	L5inbXz9TJZVKapb0sH4FcyovOparneuzPF8UFoxonS5PlNetHpnSWqI5VANTC+v
	Yl77VZqina3wdAE9451T+0hznJRy5S8hekWeRo0r7hxpifVgv9LIcrPA6xBYD2RX
	0qhInXoBv1/WXb9Oe+w/Q==
X-ME-Sender: <xms:AMxoY-tDCsjOaccP1GzuWPp1Yx48JIzmT5CtKTXFiXBI0KefsysAHw>
    <xme:AMxoYzcp_hOr1oGHRZN5UG5kLN8YAmiDmKiJEOiIYTbz3wqq2lSVvYM5J0T1P00EY
    NaL4Mlv2vO6Hw>
X-ME-Received: <xmr:AMxoY5xOU4SbdZAWKA-YCq2jwhKRz1AXxPHlNAGzpoU73xTFUJJouDqtnEwx7BAlTg41qXe_2gb-ymGNIXmMbRiZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekucetufdoteggodetrfdotffvucfrrh
    hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefirhgvghcumffj
    uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpefgkeffieefie
    evkeelteejvdetvddtledugfdvhfetjeejieduledtfefffedvieenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtg
    homh
X-ME-Proxy: <xmx:AMxoY5MMzDTdpCAuElm_I8W948N9wy4slYXJGGcKDSYm4X0JmCRUdQ>
    <xmx:AMxoY-8w9Ru4zbk0zamBIpM3Z9nEUQ4cMENUZEMp-_25LgEvsOvXJg>
    <xmx:AMxoYxUslxDjWutFr59Q4grSaoknZ9fJqOIiLg17JOH5D2smmAgIgg>
    <xmx:AcxoYx2RqDP6v8_mdC0q4d_sxYkWwb48CCDBGPGH5KzujTjJR3Eahw>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 04:12:32 -0500 (EST)
Date: Mon, 7 Nov 2022 10:12:31 +0100
From: Greg KH <greg@kroah.com>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Tomasz =?utf-8?Q?Mo=C5=84?= <tomasz.mon@camlingroup.com>,
	Richard Weinberger <richard@nod.at>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Sasha Levin <sashal@kernel.org>, Han Xu <han.xu@nxp.com>,
	kernel <kernel@pengutronix.de>, stable <stable@vger.kernel.org>
Subject: Re: [PATCH v2 stable 5.10] mtd: rawnand: gpmi: Set WAIT_FOR_READY
 timeout based on program/erase times
Message-ID: <Y2jL/8zu90UizMGF@kroah.com>
References: <20221103153341.2600899-1-tharvey@gateworks.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221103153341.2600899-1-tharvey@gateworks.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_011302_154946_1C7B4330 
X-CRM114-Status: GOOD (  18.28  )
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

T24gVGh1LCBOb3YgMDMsIDIwMjIgYXQgMDg6MzM6NDFBTSAtMDcwMCwgVGltIEhhcnZleSB3cm90
ZToKPiBGcm9tOiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+Cj4gCj4gY29t
bWl0IDBmZGRmOWFkMDZmZDlmNDM5ZjEzNzEzOTg2MTU1NjY3MTY3M2UzMWMgdXBzdHJlYW0uCj4g
Cj4gMDY3ODFhNTAyNjM1MCBGaXhlcyB0aGUgY2FsY3VsYXRpb24gb2YgdGhlIERFVklDRV9CVVNZ
X1RJTUVPVVQgcmVnaXN0ZXIKPiB2YWx1ZSBmcm9tIGJ1c3lfdGltZW91dF9jeWNsZXMuIGJ1c3lf
dGltZW91dF9jeWNsZXMgaXMgY2FsY3VsYXRlZCB3cm9uZwo+IHRob3VnaDogSXQgaXMgY2FsY3Vs
YXRlZCBiYXNlZCBvbiB0aGUgbWF4aW11bSBwYWdlIHJlYWQgdGltZSwgYnV0IHRoZQo+IHRpbWVv
dXQgaXMgYWxzbyB1c2VkIGZvciBwYWdlIHdyaXRlIGFuZCBibG9jayBlcmFzZSBvcGVyYXRpb25z
IHdoaWNoCj4gcmVxdWlyZSBvcmRlcnMgb2YgbWFnbml0dWRlIGJpZ2dlciB0aW1lb3V0cy4KPiAK
PiBGaXggdGhpcyBieSBjYWxjdWxhdGluZyBidXN5X3RpbWVvdXRfY3ljbGVzIGZyb20gdGhlIG1h
eGltdW0gb2YKPiB0QkVSU19tYXggYW5kIHRQUk9HX21heC4KPiAKPiBUaGlzIGlzIGZvciBub3cg
dGhlIGVhc2llc3QgYW5kIG1vc3Qgb2J2aW91cyB3YXkgdG8gZml4IHRoZSBkcml2ZXIuCj4gVGhl
cmUncyByb29tIGZvciBpbXByb3ZlbWVudHMgdGhvdWdoOiBUaGUgTkFORF9PUF9XQUlUUkRZX0lO
U1RSIHRlbGxzIHVzCj4gdGhlIGRlc2lyZWQgdGltZW91dCBmb3IgdGhlIGN1cnJlbnQgb3BlcmF0
aW9uLCBzbyB3ZSBjb3VsZCBwcm9ncmFtIHRoZQo+IHRpbWVvdXQgZHluYW1pY2FsbHkgZm9yIGVh
Y2ggb3BlcmF0aW9uIGluc3RlYWQgb2Ygc2V0dGluZyBhIGZpeGVkCj4gdGltZW91dC4gQWxzbyB3
ZSBjb3VsZCB3aXJlIHVwIHRoZSBpbnRlcnJ1cHQgaGFuZGxlciB0byBhY3R1YWxseSBkZXRlY3QK
PiBhbmQgZm9yd2FyZCB0aW1lb3V0cyBvY2N1cnJlZCB3aGVuIHdhaXRpbmcgZm9yIHRoZSBjaGlw
IGJlaW5nIHJlYWR5Lgo+IAo+IEFzIGEgc2lkZW5vdGUgSSB2ZXJpZmllZCB0aGF0IHRoZSBjaGFu
Z2UgaW4gMDY3ODFhNTAyNjM1MCBpcyByZWFsbHkKPiBjb3JyZWN0LiBJIHdpcmVkIHVwIHRoZSBp
bnRlcnJ1cHQgaGFuZGxlciBpbiBteSB0cmVlIGFuZCBtZWFzdXJlZCB0aGUKPiB0aW1lIGJldHdl
ZW4gc3RhcnRpbmcgdGhlIG9wZXJhdGlvbiBhbmQgdGhlIHRpbWVvdXQgaW50ZXJydXB0IGhhbmRs
ZXIKPiBjb21pbmcgaW4uIFRoZSB0aW1lIGluY3JlYXNlcyA0MXVzIHdpdGggZWFjaCBzdGVwIGlu
IHRoZSB0aW1lb3V0Cj4gcmVnaXN0ZXIgd2hpY2ggY29ycmVzcG9uZHMgdG8gNDA5NiBjbG9jayBj
eWNsZXMgd2l0aCB0aGUgOTlNSHogY2xvY2sKPiB0aGF0IEkgaGF2ZS4KPiAKPiBGaXhlczogMDY3
ODFhNTAyNjM1MCAoIm10ZDogcmF3bmFuZDogZ3BtaTogRml4IHNldHRpbmcgYnVzeSB0aW1lb3V0
IHNldHRpbmciKQo+IEZpeGVzOiBiMTIwNjEyMjA2OWFhICgibXRkOiByYXduaWFuZDogZ3BtaTog
dXNlIGNvcmUgdGltaW5ncyBpbnN0ZWFkIG9mIGFuIGVtcGlyaWNhbCBkZXJpdmF0aW9uIikKPiBD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IFNhc2NoYSBIYXVlciA8
cy5oYXVlckBwZW5ndXRyb25peC5kZT4KPiBBY2tlZC1ieTogSGFuIFh1IDxoYW4ueHVAbnhwLmNv
bT4KPiBUZXN0ZWQtYnk6IFRvbWFzeiBNb8WEIDx0b21hc3oubW9uQGNhbWxpbmdyb3VwLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0Pgo+IFNp
Z25lZC1vZmYtYnk6IFRpbSBIYXJ2ZXkgPHRoYXJ2ZXlAZ2F0ZXdvcmtzLmNvbT4KPiAtLS0KPiB2
MjogYWRkIHNiIHRhZyBhbmQgYWRkIHVwc3RyZWFtIGNvbW1pdCBpZAoKTm93IHF1ZXVlZCB1cCwg
dGhhbmtzLgoKZ3JlZyBrLWgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
