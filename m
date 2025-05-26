Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB2FC5AD49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 May 2025 20:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WbUCHGKVC3fr/9LpB05ubu95Q+QS1pIsGYyo9hqBpDM=; b=XD6VfN9gsUOu2M
	CZ8uQwSvEB2KskRr3bKn96EpdC2rJG/PG8phqd+Qa7sWYD9UqIrHLaKlZyqEUHZD5Mn3BFt3ys7SB
	+xJPSzsrOODU4bCnOymk92fpQDy+qMqW8V1UdBp6Rs8vTvMrNz9zJeYhx9zGPd0LE/ooBNv8t2Su2
	nlNie9DFbMU4IywE2p4Qg1oa2hwX0HRC1z4Srmq7SmF2H3JMjZorigcorUeaNxjRcNPmUWumD9W6C
	VJXpb6SeW6mZc8ypYGZg1jXts4O8JrZ+Hp0kc6BRfuZ4kdh1M9nyyjRP96tv5YH6N6MrsPejXw2Un
	teKmWL8NfYlzEj+1h7uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJe0r-00000009S7U-3kSS;
	Mon, 26 May 2025 20:01:33 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJe0p-00000009S73-2iq6
	for linux-mtd@lists.infradead.org;
	Mon, 26 May 2025 20:01:32 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-604bf67b515so1881034a12.0
        for <linux-mtd@lists.infradead.org>; Mon, 26 May 2025 13:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748289690; x=1748894490; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b5UZXlK7jyoyEbPjk1xDvrCMNiZh+VKlzRkBAGqXQcY=;
        b=aCt6K0Uq1EqZ7Ey1niNzlLixNZsNCMdX42evczllp4AgeK/ZtEx1WQPsSnPLQRwqT0
         6k0mq/xi3JkjivkaGUX7Z1EtiQ3ecL4f8iYeFDwHb3on7/QAm+znJgEAO0S65AI9QHBJ
         GTdKWQOj1bzKS64veCYTozu5kyrpAd52ooRR6qIZHLgzjGUClJ2R6aecnilLw6Ie3rf4
         QQVr0pYuw8dRSZdsdKZgci/bSHeCI8zWQSewGpdrE/LH4fsyAk0JbPS8yG+JoYakrUxG
         YbEmlUhmaeztbDIpMfcjZo0HS2aRcd/c3sRZb5xZLcvCq0rdG5rRafbVNvpPNWRFn1kt
         nS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748289690; x=1748894490;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b5UZXlK7jyoyEbPjk1xDvrCMNiZh+VKlzRkBAGqXQcY=;
        b=RnbcmTaGwKo9FeK9bcCiaFx/qOeh1IUJYEoieREDKnDchfCkcYWTDgX9GSdZH9D8sD
         Gntcj+HzZaB/U5TBCb1YJsm7d+UQZILVHHPUWeFAD8hWuY7Zr2r/QnudOwjg9m6bZ3N1
         MgnbcHhD5FHGPS62FarIGd+3DKd0YMgkKEoez/c/OVikNXJNfqLGAM5XhidiyImHRu+f
         VjhchHdCzIVH5C3TNOX0K2HjTaYSRIpbI/TOFUFVW+X8I/g8rlGJz8N5PM0ZEo2VksUv
         9fT+jsRraZLgCIwPG2W8GMqMUpEJ9PyHuoByohMRFfubURN2PwGlTSzNMW6lWoqPuARb
         IIXw==
X-Forwarded-Encrypted: i=1; AJvYcCVI0NGt34GbYPyw50pDYtsBNN+fl0giAj6pma8fTuQQVjjuFm45jL6diRtMxHNlmG4aQKh3hv8EV8Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YxqmmmqodMLD+AKslr/jbRpVv2fgjc4BAXwo2f21Wj3d1QDRC6x
	0+jrwRwppFeZJ6AO8702cGVk9Q9D1aYsZRkOS1qBReweVZm7SI4ayb7B
X-Gm-Gg: ASbGnctU4NirZayqlsirAWlsQO/kErR6mxdOEV+4lc8uoAMbiE1w181DpScFXWDIsIb
	ya/5M+4Tcq+nUIcng4IHOKlpzrdgrBJNr3jvf3vY1Sg2+yjXVB7tJK6vTQPFVrZy24de/NMg8jO
	mZ62vb1/bP766C94xskhIC4wHjLxryeP+ANv5AzBZrIKRPGSFEbgDeG1jUJFzDkcc3i7YX+fmY+
	EE4QxdhgwzZNWubOqVHhIgwem2Or+wO9Y2KNC78JxoWniky2ExYVRb/MUZvmVRRWntzXHmmPlsD
	auPE4BPnxSkX2orOQn+JY0Vqdp+0cXIh5ENTO4OHVYQuu3maQHtdfw1EEoDd0CtP8Y2fX0lqm8F
	GsxStfrbvReMnA1WO
X-Google-Smtp-Source: AGHT+IG11zehgCzBXjbnF2eT+TAQneLA6ATYCudw9kas/3Q4I6BaiJNJpShUkGjOy5/EEURb6r1AaA==
X-Received: by 2002:a17:907:6d0c:b0:acf:c:22ca with SMTP id a640c23a62f3a-ad85b00b7d1mr884949166b.1.1748289689706;
        Mon, 26 May 2025 13:01:29 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04e821sm1743988166b.17.2025.05.26.13.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 13:01:29 -0700 (PDT)
Message-ID: <b9134a1d-3dbc-4cd9-b22a-90b1c8934ce9@gmail.com>
Date: Mon, 26 May 2025 22:01:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mtd: nand: qpic_common: prevent out of bounds access
 of BAM arrays
Content-Language: hu
To: Md Sadre Alam <quic_mdalam@quicinc.com>, Mark Brown <broonie@kernel.org>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lakshmi Sowjanya D <quic_laksd@quicinc.com>
References: <20250525-qpic-snand-avoid-mem-corruption-v1-0-5fe528def7fb@gmail.com>
 <20250525-qpic-snand-avoid-mem-corruption-v1-2-5fe528def7fb@gmail.com>
 <8ab1e48a-f698-9859-3992-6a26f63d62f1@quicinc.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <8ab1e48a-f698-9859-3992-6a26f63d62f1@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_130131_686422_326D8F56 
X-CRM114-Status: GOOD (  22.52  )
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

MjAyNS4gMDUuIDI2LiA4OjUzIGtlbHRlesOpc3NlbCwgTWQgU2FkcmUgQWxhbSDDrXJ0YToKPiBI
aSwKPiAKPiBPbiA1LzI1LzIwMjUgMTA6MzUgUE0sIEdhYm9yIEp1aG9zIHdyb3RlOgo+PiBUaGUg
Y29tbW9uIFFQSUMgY29kZSBkb2VzIG5vdCBkbyBhbnkgYm91bmRhcnkgY2hlY2tpbmcgd2hlbiBp
dCBoYW5kbGVzCj4+IHRoZSBjb21tYW5kIGVsZW1lbnRzIGFuZCBzY2F0dGVyIGdhdGVyIGxpc3Qg
YXJyYXlzIG9mIGEgQkFNIHRyYW5zYWN0aW9uLAo+PiB0aHVzIGl0IGFsbG93cyB0byBhY2Nlc3Mg
b3V0IG9mIGJvdW5kcyBlbGVtZW50cyBpbiB0aG9zZS4KPj4KPj4gQWx0aG91Z2ggaXQgaXMgdGhl
IHJlc3BvbnNpYmlsaXR5IG9mIHRoZSBnaXZlbiBkcml2ZXIgdG8gYWxsb2NhdGUgZW5vdWdoCj4+
IHNwYWNlIGZvciBhbGwgcG9zc2libGUgQkFNIHRyYW5zYWN0aW9uIHZhcmlhdGlvbnMsIGhvd2V2
ZXIgdGhlcmUgY2FuIGJlCj4+IG1pc3Rha2VzIGluIHRoZSBkcml2ZXIgY29kZSB3aGljaCBjYW4g
bGVhZCB0byBoaWRkZW4gbWVtb3J5IGNvcnJ1cHRpb24KPj4gaXNzdWVzIHdoaWNoIGFyZSBoYXJk
IHRvIGRlYnVnLgo+Pgo+PiBUaGlzIGtpbmQgb2YgcHJvYmxlbSBoYXMgYmVlbiBvYnNlcnZlZCBk
dXJpbmcgdGVzdGluZyB0aGUgJ3NwaS1xcGljLXNuYW5kJwo+PiBkcml2ZXIuIEFsdGhvdWdoIHRo
ZSBkcml2ZXIgaGFzIGJlZW4gZml4ZWQgd2l0aCBhIHByZWNlZGluZyBwYXRjaCwgYnV0IGl0Cj4+
IHN0aWxsIG1ha2VzIHNlbnNlIHRvIHJlZHVjZSB0aGUgY2hhbmNlIG9mIGhhdmluZyBzdWNoIGVy
cm9ycyBhZ2FpbiBsYXRlci4KPj4KPj4gSW4gb3JkZXIgdG8gcHJldmVudCBzdWNoIGVycm9ycywg
Y2hhbmdlIHRoZSBxY29tX2FsbG9jX2JhbV90cmFuc2FjdGlvbigpCj4+IGZ1bmN0aW9uIHRvIHN0
b3JlIHRoZSBudW1iZXIgb2YgZWxlbWVudHMgb2YgdGhlIGFycmF5cyBpbiB0aGUKPj4gJ2JhbV90
cmFuc2FjdGlvbicgc3RydWN1dHJlIGR1cmluZyBhbGxvY2F0aW9uLiBBbHNvLCBhZGQgc2FuaXR5
IGNoZWNrcyB0bwo+PiB0aGUgcWNvbV9wcmVwX2JhbV9kbWFfZGVzY197Y21kLGRhdGF9KCkgZnVu
Y3Rpb25zIHRvIGF2b2lkIHVzaW5nIG91dCBvZgo+PiBib3VuZHMgaW5kaWNlcyBmb3IgdGhlIGFy
cmF5cy4KPj4KPj4gVGVzdGVkIHdpdGggdGhlICdzcGktcXBpYy1zbmFuZCcgZHJpdmVyIG9ubHku
Cj4gSSByZWNvbW1lbmQgdGVzdGluZyB0aGlzIHBhdGNoIG9uIGJvdGggdGhlIElQUSBhbmQgU0RY
IHBsYXRmb3JtcywKPiBhcyB0aGUgUVBJQyByYXcgTkFORCBkcml2ZXIgYXJlIHV0aWxpemVkIGFj
cm9zcyBib3RoLgo+IAo+IElmIHlvdSBoYXZlIGFjY2VzcyB0byBJUFEgYW5kIFNEWCBkZXZpY2Vz
IHdpdGggcmF3IE5BTkQsIHBsZWFzZSBwcm9jZWVkCj4gd2l0aCB0ZXN0aW5nIG9uIGJvdGguCgpT
b3JyeSwgSSBoYXZlIG5vIFNEWCBkZXZpY2VzIGF0IGFsbCwgYW5kIHVuZm9ydHVuYXRlbHkgSSBj
YW4ndCBhY2Nlc3MgbXkgb2xkZXIKSVBRIGJvYXJkcyBiZWZvcmUgbmV4dCB3ZWVrLgoKPiAKPiBP
dGhlcndpc2UsIEkgY2FuIGhhbmRsZSB0ZXN0aW5nIG9uIHRoZSBJUFEgcmF3IE5BTkQgZGV2aWNl
IGFuZCBjb29yZGluYXRlIHdpdGgKPiBMYWtzaG1pIFNvd2phbnlhIEQgKHF1aWNfbGFrc2RAcXVp
Y2luYy5jb20pCj4gZm9yIHRlc3Rpbmcgb24gdGhlIFNEWCBwbGF0Zm9ybS4KCklmIHlvdSBjb3Vs
ZCBkbyBzb21lIHRlc3RpbmcgaW4gdGhlIG1lYW50aW1lLCB0aGF0IHdvdWxkIGJlIHN1cGVyYi4K
VGhhbmtzIGZvciB0aGF0IGluIGFkdmFuY2UhCgpSZWdhcmRzLApHYWJvcgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
