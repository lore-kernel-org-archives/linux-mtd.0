Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE8DD41D5F
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Nov 2024 06:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AOZnNr+rxprf+K+qM05S/ZCvSqmqG9/RdUUc0wdFjCE=; b=OpQz58k9dz2tCy
	Wsk3MWo1i9Nd6XFahB65quxl1iKGjbNDe7vrHKVtogedgeAicHGzRZ3GqjnQwLD4OJfColSkKGiik
	g2goFAVYkdKaog7lpHtu3thaL761BzAbGkRtPbZuoWl/hWrVZ+wUU9rIn9zzFE24N2NnOy090EDhJ
	A11bECK/Y5+dceREQeANDK9xuTsliYN/Q4UIV7A2BFJH2OtFs9e4LTo2tvVuMpy18DcNp1NPDxzDu
	rQ9aXJ39sPo8RiyxSXTmAG3lI4W9WXICw1J5Zri0iQy6TcZP8VtImC0ZtnURfYjCMZJnrP3RYgGb7
	P4Pa8o7z7WpVGn2tF0/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAkjk-00000002NAY-3vnY;
	Tue, 12 Nov 2024 06:50:52 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAkeE-00000002MVh-3YxA
	for linux-mtd@lists.infradead.org;
	Tue, 12 Nov 2024 06:45:12 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aa1e633b829so13568766b.3
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 22:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731393909; x=1731998709; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bk/qTs7SYONfqNiwKQpCo1FnKOOwDZ+GgHR/cbq4CIo=;
        b=c1GW1BvaUuNt6bhaekqgT0KwrtKcbrdnNjxtfLl1YSoGWechrbJeqrhWriU1hRT/Az
         /162xduzYV79aE6BUBW1z9UKjmkLgR5Mcc8soRFo0zQ68I4JOw5gGVtzsO3XqLVTfUz2
         i4rwrtbDKVZOiRYmdXIH9olPc/LjjUiCeFat6RhvwIMk1h9r95eseIbZjnsCihNgez1r
         Y561odxbxhiDzseIQG3p81LXJjuY3I123gnmNR/gJjP8OQSfWL4do9/rR+VP6Im/TWjy
         1bYJEYlWJ/moccQ5VujcIwXsX/cxGqSbd3bL47rvjq25RnX82MnpZV/e3ZQJx8nyOOFx
         Xxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731393909; x=1731998709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bk/qTs7SYONfqNiwKQpCo1FnKOOwDZ+GgHR/cbq4CIo=;
        b=QPPWOOtjLzZnUOLOm2lbKG0huUfRnYNo+yzWKOhSTlG4x0maU7ifBtjUQURgK6fw8B
         cgRk+M8tdzQeGUJFrSBRZBb510dvplY96AIQ+z2QdfjQyOyOz63A9PVuqGLmCf+nYcs/
         7XGbU/agX5W6DsxMbKrYXRDe7qPnQkqN9cTDn8j6j6R/yCgMoqhFsaDkS6ruUdkj9/1O
         JFnUPa7VMa81FAcOji0a9xyQiqjyfnZgM3huvDUHSkIsPiLXxUhasivEA6mxUYQS1nXB
         HsKzi/rVM1J3tDaMG4VzjswfrYB5t/AVHeNVKhsH/jmqUoRfABne5lJE5Mls6/BQN0DM
         KMZw==
X-Forwarded-Encrypted: i=1; AJvYcCWTa+mJF8iDgPELJXgtNB3dg/qHk0cJHjx3zOFIGj7OBGTRyZNIKBHqRkLY6XRHjny0Nu/vLi/9pZg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzbaQ6KA+QAjzt9sTqyUxxV1jpPTkfmEILJb+iUZPWp+NkCXiOr
	dl7UB/ogrI1sGufk2udXU8fZNOynEkUis0CtMaM5aDFVothS/4YCbL5f62BUxMM=
X-Google-Smtp-Source: AGHT+IHcjt49YmGjuMTP6l84E4tCJkuOLW8/54vo4S7Nxntsh06kftkO0W8XYBJzpKPMB1h8yxM1vQ==
X-Received: by 2002:a17:907:94c4:b0:a9e:8522:1bd8 with SMTP id a640c23a62f3a-a9eefebd13bmr1574005566b.6.1731393908945;
        Mon, 11 Nov 2024 22:45:08 -0800 (PST)
Received: from [192.168.0.157] ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0defbdcsm676752366b.159.2024.11.11.22.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 22:45:08 -0800 (PST)
Message-ID: <01160386-a65f-44b0-ac57-ad77754f01cc@linaro.org>
Date: Tue, 12 Nov 2024 06:45:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: core: replace dummy buswidth from addr to
 data
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20241107093016.151448-1-linchengming884@gmail.com>
 <437e9c87-fbae-4402-858c-ce6de0a992c7@linaro.org>
 <CAAyq3Sb-dmmF8YsOdTYxZqX8Wn4d=WiAXkS4bHp5FLn3S+ouXg@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAAyq3Sb-dmmF8YsOdTYxZqX8Wn4d=WiAXkS4bHp5FLn3S+ouXg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_224510_913557_D86F12FB 
X-CRM114-Status: GOOD (  13.46  )
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

CgpPbiAxMS8xMi8yNCAyOjQyIEFNLCBDaGVuZyBNaW5nIExpbiB3cm90ZToKPiBIaSBUdWRvciwK
PiAKPiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+IOaWvCAyMDI05bm0
MTHmnIgxMeaXpSDpgLHkuIAg5LiL5Y2INjoxOOWvq+mBk++8mgo+Pgo+Pgo+Pgo+PiBPbiAxMS83
LzI0IDk6MzAgQU0sIENoZW5nIE1pbmcgTGluIHdyb3RlOgo+Pj4gRnJvbTogQ2hlbmcgTWluZyBM
aW4gPGNoZW5nbWluZ2xpbkBteGljLmNvbS50dz4KPj4+Cj4+PiBUaGUgZGVmYXVsdCBkdW1teSBj
eWNsZSBmb3IgTWFjcm9uaXggU1BJIE5PUiBmbGFzaCBpbiBPY3RhbCBPdXRwdXQKPj4+IFJlYWQg
TW9kZSgxLTEtOCkgaXMgMjAuCj4+Pgo+Pj4gQ3VycmVudGx5LCB0aGUgZHVtbXkgYnVzd2lkdGgg
aXMgc2V0IGFjY29yZGluZyB0byB0aGUgYWRkcmVzcyBidXMgd2lkdGguCj4+PiBJbiB0aGUgMS0x
LTggbW9kZSwgdGhpcyBtZWFucyB0aGUgZHVtbXkgYnVzd2lkdGggaXMgMS4gV2hlbiBjb252ZXJ0
aW5nCj4+PiBkdW1teSBjeWNsZXMgdG8gYnl0ZXMsIHRoaXMgcmVzdWx0cyBpbiAyMCB4IDEgLyA4
ID0gMiBieXRlcywgY2F1c2luZyB0aGUKPj4+IGhvc3QgdG8gcmVhZCBkYXRhIDQgY3ljbGVzIHRv
byBlYXJseS4KPj4+Cj4+PiBTaW5jZSB0aGUgcHJvdG9jb2wgZGF0YSBidXN3aWR0aCBpcyBhbHdh
eXMgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvIHRoZQo+Pj4gYWRkcmVzcyBidXN3aWR0aC4gU2V0
dGluZyB0aGUgZHVtbXkgYnVzd2lkdGggdG8gbWF0Y2ggdGhlIGRhdGEgYnVzd2lkdGgKPj4+IGlu
Y3JlYXNlcyB0aGUgbGlrZWxpaG9vZCB0aGF0IHRoZSBkdW1teSBjeWNsZS10by1ieXRlIGNvbnZl
cnNpb24gd2lsbCBiZQo+Pj4gZGl2aXNpYmxlLCBwcmV2ZW50aW5nIHRoZSBob3N0IGZyb20gcmVh
ZGluZyBkYXRhIHByZW1hdHVyZWx5Lgo+Pgo+PiBUaGlzIGlzIHN0aWxsIHZlcnkgd3JvbmcgYW5k
IHRoZSBgZml4YCBpcyB3b3JraW5nIGp1c3QgYnkgY2hhbmNlLgo+PiBDb25zaWRlciB3aGF0IGhh
cHBlbnMgd2hlbiBvbmUgcmVxdWlyZXMgMTAgZHVtbXkgY3ljbGVzLiBCVFcsIGRvZXMgdGhpcwo+
PiBmaXggYSByZWFsIHByb2JsZW0sIG9yIGl0J3MganVzdCBhIHRoZW9yZXRpY2FsIGZpeD8KPiAK
PiBJbiAxLTEtOCBtb2RlLCBzZXR0aW5nIHRoZSBkdW1teSBidXN3aWR0aCB0byBtYXRjaCB0aGUg
ZGF0YQo+IGJ1c3dpZHRoIGVuc3VyZXMgYSBkdW1teSBidXN3aWR0aCBvZiA4LCB3aGljaCBjYW4g
YWNjb21tb2RhdGUKPiBhbGwgdHlwZXMgb2YgZHVtbXkgY3ljbGVzLgo+IAo+IFRoaXMgcGF0Y2gg
cmVzb2x2ZXMgYSBzaWduaWZpY2FudCBpc3N1ZSBpbiAxLTEtOCBtb2RlLCBhcyBkZXNjcmliZWQg
YWJvdmUuCj4gCgpzaGFsbCB3ZSBhZGQgYSBmaXhlcyB0YWcgdGhlbiwgYW5kIGEgY2MgdG8gc3Rh
YmxlPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
