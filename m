Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E079C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 11 May 2022 20:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3lz92JKU/iDNXkiLxRHTIcx2p0sApVYuhlKzD0NM+S4=; b=Z3rLcWTwlzbmJb
	g7H539GKn1vN7AtlMjZuEpi5frHs4enpFvWi0+f6wsbq5yaqfvrbjwSvTy+tMjekwWaPT73ISBy8N
	HhWnstvozh+Z9WPkcTwXtgtqh5sNaemtfFoAfo5h9rlCiO4TjKdVnZBDlpgVaBC7BHbjXOn6eMiL1
	eJl8De1MFmYmc1hUOeomvpX6mSxC94SxqaRKWXn+kpSwhjJUJXuENv/ayuXaO5RlQ9MvMzCaROKkv
	jF/JARF9JufBnkcoeRI0EY8JT3d/A322dGwn2wlRf4lgD/wsau12Man8gAYVM3A4YG7khOwpAAIVr
	1/aSTM0IPQyemMwF23Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1not4Q-008X5B-2c; Wed, 11 May 2022 20:36:30 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1not4L-008X3W-9I
 for linux-mtd@lists.infradead.org; Wed, 11 May 2022 20:36:26 +0000
Received: by mail-lf1-x136.google.com with SMTP id b18so5549814lfv.9
 for <linux-mtd@lists.infradead.org>; Wed, 11 May 2022 13:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6ojZI9/OD16y8IIbbbbr20+lgWh1L2wXNhWVUJLRxZA=;
 b=EXDJT9RrmxRequBVKMI7c6eOe90w7mVQaqq4QiDNmHUqbqJ8VnPNCzYocIDEiqf3/C
 Yf80YZ9W9hPqsX7fWgRmV7KwAunrRz/hz7YfIgERq2aM0h8I2TYShHCYOvVg6kcIlPrD
 KOmV9Pvobe353TII5xEo8Kbpk2gM6czUyRIyaXZor+6gavWJqF2G4sGSDyHJA4IQPZaS
 AsxhVWCeyLDokKPOj/XcpUF6w2SPhaO5UD1xLpsoIXjO43pU129wiSWKjA3ZncH0T9YX
 71yHCV6ff2DlMkfkMy3lUu+0FJ/RpBjYOMq9nYERvOF1V9sSlmmUtxVVICkxS1nkr8Xb
 /CXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6ojZI9/OD16y8IIbbbbr20+lgWh1L2wXNhWVUJLRxZA=;
 b=VnZTRxdkPeW1bfJ9nvCTWGZt2G+lxDUkKiXNB7bGiGlEcswFx2j0diGuPzfQa4v3xC
 zAs8QUb1hpHdG9aRprLgaNWfNIS0GVs+3XuwxaF6+T0bHHgQSGvWFmtX3AyO/mF5Dna8
 vbuNzlbNu/1m+hpXjQX2RMkHJq8jpjGmv1MxWS8DPr/9gzLksnehJpcKa8E59lkBzMmB
 mpLfptBhJyy1kdmnA+rePResM5IgRu1Sap/I7BSrdXZg/vBEjoK+rsd98IOq3yvqwxJ5
 KK6nXAzeEkaikZQY/A3umsl9yB8kKix2BMhxLjKC0zKDz4LnHW4xu/A9bsQYkK5pN4ax
 YM1g==
X-Gm-Message-State: AOAM532N8bK5mc1E6ceEK7Hq4/U2/7opAgYG4eKFf86eII6JUxQwzh4P
 WK5u+C33TQJ3izH6PTOesZU=
X-Google-Smtp-Source: ABdhPJylh9Qce9//Ii3Y9f5x7e7hu+2iWH/wCpknzcJjYjhpdWbDHI2uHBQqfLXBAAteolHXjubtTw==
X-Received: by 2002:a19:7114:0:b0:473:e3f5:c7ba with SMTP id
 m20-20020a197114000000b00473e3f5c7bamr21761571lfc.9.1652301380651; 
 Wed, 11 May 2022 13:36:20 -0700 (PDT)
Received: from [172.22.204.227] ([104.28.230.247])
 by smtp.gmail.com with ESMTPSA id
 k42-20020a0565123daa00b0047255d2116csm436333lfv.155.2022.05.11.13.36.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 13:36:20 -0700 (PDT)
Message-ID: <10ce5bf1-bf12-b028-49cb-a3f1999f9a07@gmail.com>
Date: Wed, 11 May 2022 23:36:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] mtd: parsers: add support for Sercomm partitions
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 NOGUCHI Hiroshi <drvlabo@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Karim <Karimdplay@gmail.com>, M <x1@disroot.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20220329122016.4122899-1-csharper2005@gmail.com>
 <20220330100958.57dc4d61@xps13>
 <ede9e050-3b60-ba0e-c626-044f7825adb7@gmail.com>
 <20220511091643.064f9d13@xps13>
From: Mikhail Zhilkin <csharper2005@gmail.com>
In-Reply-To: <20220511091643.064f9d13@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_133625_367322_B13BCF39 
X-CRM114-Status: GOOD (  14.59  )
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

T24gNS8xMS8yMDIyIDEwOjE2IEFNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgoKPj4+PiBUaGlzIGlz
IGVzc2VudGlhbGx5IHRoZSBzYW1lIGNvZGUgYXMgcHJvcG9zZWQgYnkgTk9HVUNISSBIaXJvc2hp
Cj4+Pj4gPGRydmxhYm9AZ21haWwuY29tPiBoZXJlOiAgCj4+PiBJIHdvdWxkIGNyZWRpdCBIaXJv
c2hpIHdpdGggYSBTdWdnZXN0ZWQtYnkgYXQgbGVhc3QgIAo+PiBJIHJlYWQgc3VibWl0dGluZyBw
YXRjaGVzIHJ1bGVzIGFnYWluIGFuZCB0aG91Z2h0IHRoYXQgU2lnbmVkLW9mZi1ieSBpcwo+PiBz
dWl0YWJsZSBmb3IgdGhpcyBjYXNlLiBJcyB0aGlzIG9rPwo+IEVpdGhlciB5b3UgdGFrZSBoaXMg
d29yayBhbG1vc3QgbGlrZSBpdCBpcyBhbmQgaGUgbXVzdCBiZSB0aGUgYXV0aG9yCj4gKmFuZCog
dGhlIGZpcnN0IHNpZ25lZC1vZmYtYnkgbGluZSwgb3IgeW91IHRha2UgdGhlIGF1dGhvcnNoaXAg
aWYgeW91Cj4gdGhpbmsgeW91IGRpZCBlbm91Z2ggbW9kaWZpY2F0aW9ucyB0byB0aGUgY29kZSBh
bmQgaW4gdGhpcyBjYXNlIHlvdSBjYW4KPiBlaXRoZXIgY3JlZGl0IGhpbSB3aXRoIGEgc3VnZ2Vz
dGVkLWJ5IGJlZm9yZSB5b3VyIHNpZ25lZC1vZmYsIG9yIHlvdQo+IGNhbiBjcmVkaXQgaGltIHdp
dGggYSBjby1kZXZlbG9wZWQtYnkgKyBoaXMgc2lnbmVkLW9mZiBhbmQgdGhlbiB5b3Vycy4KClRo
YW5rIHlvdSBmb3IgY2xhcmlmaWNhdGlvbiEgTXkgbW9kaWZpY2F0aW9ucyB3ZXJlIHF1aXRlIHNt
YWxsOgogLSBSZW1vdmUgcmVkdW5kYW50IGJyYWNlcyBhbmQgbG9naWNhbCBOT1Qgb3BlcmF0b3IK
IC0gRGVmaW5lIHByX2ZtdAogLSBSZXBsYWNlIGtjYWxsb2MgYnkga3phbGxvYwogLSBVc2Ugb2Zf
Z2V0X2NoaWxkX2NvdW50KCkgYW5kIGFsbG9jIGJpZyBlbm91Z2ggYXJyYXkgYmVmb3JlIHRoZQog
ICBmb3JfZWFjaF9jaGlsZF9vZl9ub2RlKCkKClRoZXJlZm9yZSwgSSBwcmVmZXIgdG8ga2VlcCB0
aGUgYXV0aG9yc2hpcCBvZiB0aGUgb3JpZ2luYWwgYXV0aG9yIChOT0dVQ0hJIEhpcm9zaGkpLiAK
ClBhdGNoIGlzIHJlYWxseSBnb29kIGFuZCB3YXMgc3VjY2Vzc2Z1bGx5IHRlc3RlZCBvbiB0aGUg
aHVuZHJlZHMgb2YgU2VyY29tbSBkZXZpY2VzICg1LjQsIDUuMTAsIDUuMTUgS2VybmVsKS4gTXkg
bW90aXZhdGlvbiBmb3IgdXBzdHJlYW1pbmcgaXMgd29yayB1bmRlciBvZmZpY2lhbCBzdXBwb3J0
IGZvciB0aGVzZSBkZXZpY2VzIGluIE9wZW5XcnQuCgpXaGF0IGFyZSB0aGUgbmV4dCBzdGVwcyBm
cm9tIG15IHNpZGUgaW4gdGhpcyBjYXNlPyBTaG91bGQgSSB3YWl0IGZvciByZXZpZXcgb2YgdGhp
cyBwYXRjaCBoZXJlIChMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAy
MjA1MTAxNjI2NTUuMjEwMTEtMS1jc2hhcnBlcjIwMDVAZ21haWwuY29tL1QvI3UKKSBvciBkbyBJ
IG5lZWQgdG8gZG8gc29tZXRoaW5nIGFkZGl0aW9uYWxseSAoZm9yIGV4YW1wbGUsIHNlbmQgdXBk
YXRlZCBzZXQgdjUgd2l0aCBBY2tlZC1ieSBmcm9tIEtyenlzenRvZiBpbiB0aGUgZmlyc3QgcGF0
Y2gpPyAKCkFuZCBzb3JyeSBmb3IgdGhlIG1hbnkgcXVlc3Rpb25zLi4uIEkgaGF2ZW4ndCBmdWxs
eSBtYXN0ZXJlZCB0aGUgTGludXggY2hhbmdlIG1hbmFnZW1lbnQgcHJvY2VzcyBhbmQgYmVzdCBw
cmFjdGljZXMgeWV0LgoKPiBUaGFua3MsCj4gTWlxdcOobAoKLS0gCkJlc3QgcmVnYXJkcywKTWlr
aGFpbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
