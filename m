Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5293AC43334
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jun 2022 19:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e+Z3LG7SNODRMQTs/YPRgyZu0WEHJZC8EhImqM/8iLo=; b=BuTNyVhfXBSDMC
	32qa/FXGJs03ntYGXM5/Xgo6zgveXghJgwUgXZZH3buYiLux7dKOjoPYkw4nttoc7bNbCIoWU82uo
	AS+k1dGqO2zL7RUn0W/BMXrhwSdYkGvIkvHnqRy7EbvSrDwca0dXv36f5Pb7qjOJTBQljpGpyK3Xm
	4cpRWYsEdZwULNr6f40Dug/2KxvbWiW7IWoo8UtAt9HGOSR4EDeUtVPKhJlB6/qPbwv1YZhrKvKFb
	fItBKIOyb3ZaXmD5Jo9Fo+3F+FRMcjOlZWDPnFz1w/Rafua8jTW07RptnCdEj9Z84ehV4ycWLzUAG
	0C86J/2HjU/q7PDC0ZlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyIYI-002Udi-RL; Mon, 06 Jun 2022 19:38:14 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyIYG-002Uc4-Lv
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2022 19:38:14 +0000
Received: by mail-ej1-x629.google.com with SMTP id gl15so17061854ejb.4
        for <linux-mtd@lists.infradead.org>; Mon, 06 Jun 2022 12:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wewyUGB+MJ5gdkpntOxz6kYdJxFvnOUj7HOagZs9XQM=;
        b=elE/+CPaZABsWl1U3cjNPi+bQkhyTqILk+3H/um8P9I0w/jjn5w4MtSauBtYWI2Dyl
         LciKnQjyd58tprO5GkjCzcxrazetIztdDrJ9UzZLRjgcyfL2hvKlDgJWy3SkU0KBpXcE
         JzezjzVjbnZLHITYmtVJpJC88iuPm1/WQTxhHKEZGWQH4lmB59dBEuszhijdIoqMrMuC
         vXfSsdnLALSvgjqiZsaL2HQfKaWqY/zM4q4fDFFiTpv6RoNbHGLA9xtWPmWiN+QJQE45
         aWxoeDC6EH0Qt8INsBxHvfVVGz4uylPfsJdFBfIBiYB/GjwAgQaGYjOVlO54unzIHkkw
         ZvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wewyUGB+MJ5gdkpntOxz6kYdJxFvnOUj7HOagZs9XQM=;
        b=YoS4URIePd4Pnp3m5hLWZSxKXFL4B2H4+/xkizvX3/heKexbCASnM4pcDfMW92YiyE
         YmknKrxPem6NsGeWQLH3/4Q0LIoovmJU8x9O5IoQWxMs+uIqUUHsOqRv380BqMt6lRSA
         qESV7vlnIJGOdj7Tyr5u3uf7zuhWDoqFsdK/U/i7c+ydVTo3br6pRwipECk1rhgrUDmn
         98Jlrdb2njZwkrAv7sI6drkRBf7ilHXPNmjqdoLfGiQAnnC0EjiMAMR/0LytSWoN51Sd
         UcBGcmD6EuKVHyTS8ftLe/2h4Q+RrRG2PjsRG9UfJaK4+B+XMwK4/l1tquoMtMrnAkYU
         wl3Q==
X-Gm-Message-State: AOAM531FSMOeGf0CRdPkoyGEhyL/vrF8F2yAF8SEdwgbOJ8svN++IJZ3
	qK9KJYRy0+5oQTpjnbfArPMbX/yK5Ws=
X-Google-Smtp-Source: ABdhPJy/giT/dLTQIdQ/VQ6siJQXwh/tJgFH4YQ4wgrkwwVo69GW97hSRAgOAB8p+yTnUbHodchecw==
X-Received: by 2002:a17:907:9712:b0:6ff:c09:33a2 with SMTP id jg18-20020a170907971200b006ff0c0933a2mr22137298ejc.50.1654544277879;
        Mon, 06 Jun 2022 12:37:57 -0700 (PDT)
Received: from debian64.daheim (p5b0d7c1c.dip0.t-ipconnect.de. [91.13.124.28])
        by smtp.gmail.com with ESMTPSA id n24-20020aa7c698000000b0042bb229e81esm9032106edq.15.2022.06.06.12.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 12:37:57 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1])
	by debian64.daheim with esmtp (Exim 4.95)
	(envelope-from <chunkeey@gmail.com>)
	id 1nyGfi-00099V-Co;
	Mon, 06 Jun 2022 21:37:57 +0200
Message-ID: <588e42b7-b28b-15c3-4f24-297c27fb4676@gmail.com>
Date: Mon, 6 Jun 2022 21:37:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] mtd: rawnand: add support for Toshiba TC58NVG0S3HTA00
 NAND flash
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, =?UTF-8?Q?Andreas_B=c3=b6hler?=
 <dev@aboehler.at>
References: <20220420104034.6333-1-dev@aboehler.at>
 <bdd78c78-be40-1c31-f46e-41ed2a0cbd04@isd.uni-stuttgart.de>
 <20220606155919.23001410@xps-13>
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <20220606155919.23001410@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_123812_764861_A1614DCD 
X-CRM114-Status: GOOD (  25.82  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdcOobCwKCk9uIDA2LzA2LzIwMjIgMTU6NTksIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4g
Y2hyaXN0aWFuLmxhbXBhcnRlckBpc2QudW5pLXN0dXR0Z2FydC5kZSB3cm90ZSBvbiBTdW4sIDUg
SnVuIDIwMjIKPj4gV2hhdCB0byBkbyBpbiB0aGlzIHNpdHVhdGlvbj8gQmVjYXVzZSB0aGUgcGF0
Y2ggYXMgaXMgaXMgY2F1c2luZyBib290IGZhaWx1cmVzCj4+IGZvciBkZXZpY2VzIHdpdGggb3Ro
ZXIgS2lveGlhL1Rvc2hpYmEgY2hpcHMuIFRoaXMgaXMgYmVjYXVzZSB0aGV5IGFsc28KPj4gbWF0
Y2ggdGhlIGZpcnN0IGZvdXIgYnl0ZXMgYnV0IGhhdmUgZGlmZmVyZW50IE9PQiBzaXplcyAoNjQs
IGluc3RlYWQgb2YgMTI4KS4KPj4KPj4gQW5kcmVhcyBoYXMgcHJvcG9zZWQgdGhlIGZvbGxvd2lu
ZzogdXBkYXRlIHRoZSBpZF9sZW4gdG8gOCwgdGhpcyB3aWxsIGhlbHAKPj4gZml4IHRoZSBib290
IGZhaWx1cmVzIHdpdGggb3RoZXIgY2hpcHMgbGlrZSB0aGUgVEM1OEJWRzBTM0hUQTAwLCBzaW5j
ZSBpdAo+PiBoYXMgZGlmZmVyZW50IHZhbHVlcyBmb3IgdGhlIGNoaXAtaWQgYWZ0ZXIgdGhlIDR0
aCBieXRlLnwKPj4gfAo+Pgo+PiB8eyJUQzU4TlZHMFMzSFRBMDAgMUcgMy4zViA4LWJpdCIsIHsg
LmlkID0gezB4OTgsIDB4ZjEsIDB4ODAsIDB4MTV9IH0sIFNaXzJLLCBTWl8xMjgsIFNaXzEyOEss
IDAsIDgsIDEyOCwgTkFORF9FQ0NfSU5GTyg4LCBTWl81MTIpLCB9LHwKPj4KPj4gfHxSZXZlcnRp
bmcgd291bGQgYmUgYW4gb3B0aW9uLCBidXQgaWYgdGhpcyBpcyBhIGNvdW50ZXJmZWl0IHNpdHVh
dGlvbiB0aGVuCj4+IHNpbWlsYXIgImNoaXBzIiBjb3VsZCBlbmQgdXAgaW4gb3RoZXIgZGV2aWNl
cyBhbmQgd2UgYXJlIGp1c3QgdW5sdWNreQo+PiBvbmVzIHRoYXQgYXJlIHRoZSBmaXJzdCB0byBy
ZXBvcnQgaXQgOi0oIC4KPiAKPiBEbyB5b3UgaGF2ZSBhIHdheSB0byBwcm9iZSB0aGUgYW1vdW50
IG9mIGFmZmVjdGVkIGRldmljZXMgYW1vbmcgdGhlCj4gY29tbXVuaXR5IG9yIHBlcmhhcHMgYnkg
dGFsa2luZyB0byB0aGUgdmVuZG9yPwoKU28gZmFyIG5vLiBJIGp1c3QgaGVhcmQgYWJvdXQgdGhl
IChuZXc/KSBBVk0gRnJpdHpCb3ggNzUzMCByZXZpc2lvbnMuIFRoZXNlCndlcmUgcHJvYmFibHkg
Y3JlYXRlZCBiZWNhdXNlIG9mIHNob3J0YWdlcy9wcmljZSBoaWtlcz8gRnJvbSB3aGF0IEkgY2Fu
CnRlbGwgKGJlaW5nIHNvbWV3aGF0IGJpYXNlZCB0aGVyZSkgdGhlIEZyaXR6IUJveCA3NTMwIGFu
ZCB0aGVpciB2YXJpYW50cwoodGhlcmUgYXJlIGN1dC1kb3duIDc1MjAgYW5kIDc1MTAgbW9kZWxz
KSBhcyB3ZWxsIGFzIHJlYnJhbmRlZCBtb2RlbHMKZnJvbSB2YXJpb3VzIElTUHMgaW4gR2VybWFu
eS4KCk9uZSB0aGluZyBJIHdhbnQgdG8gcG9pbnQgb3V0IGlzIHRoYXQgQW5kcmVhcyBtZW50aW9u
ZWQgaW4gdGhlIGdpdGh1YiBpc3N1ZToKIkkgYWxzbyBmb3VuZCBvdXQgdGhhdCBBVk0gbWF0Y2hl
cyBqdXN0IHRoZSBmb3VyLWJ5dGUgSUQgaW4gaXRzIEdQTCBzb3VyY2UgY29kZS4iCgpObyBpZGVh
IHdoYXQgdG8gdGhpbmsgYWJvdXQgdGhpcz8gQ291bGQgQVZNIGtub3cgYWJvdXQgdGhpcwp0byBz
b21lIGRlZ3JlZT8KCklzIHRoZXJlIGEgd2F5IHRvIGNvbnRhY3QgVG9zaGliYS9LaW94aWE/IFRo
ZSBlLW1haWwgYWRkcmVzcyBJIGZvdW5kIGluCmEgcHJldmlvdXMgcGF0Y2ggc2VlbXMgdG8gYmUg
ZGVhZCA6KC4gQW55b25lPwoKKEtpb3hpYSBzZWVtcyB0byBoYXZlIGEgQjJCIHdlYnNpdGUgYWJv
dXQgdGhpcyB0b3BpYzoKaHR0cHM6Ly9wZXJzb25hbC5raW94aWEuY29tL2VuLWVtZWEvc3VwcG9y
dC9wYXJhbGxlbC1pbXBvcnQuaHRtbAoKVGhvdWdoLCBJIGRvbid0IHRoaW5rIHRoaXMgaXMgZ2Vh
cmVkIHRvd2FyZHMgdXMsIHRoZSBlbmQtdXNlcnMuLi4pCgo+IFJldmVydGluZyBzZWVtcyB0aGUg
c2FmZXN0IG9wdGlvbiBoZXJlLCBub3Qga25vd2luZyBob3cgbWFueSBkZXZpY2VzCj4gaGF2ZSB0
aGVzZSBkYW1hZ2VkL2NvdW50ZXJmZWl0IGNoaXBzLiBJZiBpdCBpcyBqdXN0IGEgY291cGxlIGFu
ZCBvbmx5IG9uCj4gRnJpdHpib3hlcywgYXMgc3VnZ2VzdGVkIGluIHRoZSBHaXRodWIgaXNzdWUg
dGhpcyBwYXRjaCBjb3VsZCBiZQo+IGNhcnJpZWQgdGhyb3VnaCBPcGVuV1JUIGFuZCB0aGF0IHdv
dWxkIHNlZW0gbW9yZSBmdXR1cmUgcHJvb2YgSU1ITy4KCk9rLCBJJ2xsIG1vdmUgQW5kcmVhcyBt
b2RpZmllZCBwYXRjaCBhcm91bmQgYW5kIGFkZCBpdCB0byB0aGUKaXBxNDB4eCcgZGV2aWNlLXN1
cHBvcnQgcGF0Y2ggaGVhcC4KCj4gVGhlIHNlY29uZCBzb2x1dGlvbiAoZW5sYXJnaW5nIHRoZSBJ
RCBsZW5ndGgpIG1pZ2h0IHdvcmssIGJ1dCBmZWVscwo+IGRpcnR5LCB0aGF0J3Mgd2h5IEkgd291
bGQgZ28gZm9yIHJldmVydGluZyB0aGlzIGltbWVkaWF0ZWx5IChJIHdpbGwKPiBzZW5kIGl0IHRo
cm91Z2ggZml4ZXMpLCBzbyB0aGF0IHRoZSBzdXBwb3J0IGZvciB0aGlzIGNoaXAgbWlnaHQganVz
dAo+IGRpc2FwcGVhciAic2lsZW50bHkiLiBUaGVuIHdlIGhhdmUgYW5vdGhlciByZWxlYXNlIHRv
IGRlY2lkZSB3aGV0aGVyCj4gaXQgaXMgYXBwcm9wcmlhdGUgdG8gdXNlIHRoZSA4LWJ5dGUgSUQg
aGFjayBpbiB0aGUgbWFpbmxpbmUga2VybmVsLgo+IAo+IENhbiB5b3UgcGxlYXNlIHNlbmQgYSBw
YXRjaD8KClllcywgc2hvdWxkIGJlIGluIHlvdXIgaW5ib3guCgpSZWdhcmRzLApDaHJpc3RpYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
