Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D22D1CDC8
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2024 09:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ifRCK2MaKgyYJdh0ljec3GhGtu+2IBUryCOTyzgo66E=; b=E/rlIQJxfE4M5/
	SgN4NxWa+lQbk/FPEiSXmszTN71sUn1xf7ESB++TCcvYmc0Otkxbny7FCBWm7jM75mW6WNulTPXeF
	QB4bXNGr8cbXeOW+aUwbUf07FbzjwyBunRWTNfjIM1q7wuQXMoUQT/BHW0QGUGlU3tPiGbnR2j/xT
	H9HaX0SGrMXRajNPaIPNlzatRN5EbcVtV8K2/rhDfwQxksamSwK4fbHbvN0nh1gw2FMMkxvOmOR05
	t9OEFckJ9llBERm+ZqNNdYyeDfCgxHOvTooXmisORZL/iKItcFHnx1RQTgnHiXJPc9Sret23VEu/P
	cDu3FSZTIGyL8js2VvuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3B21-0000000AJhF-3Z9w;
	Tue, 22 Oct 2024 09:18:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3AyR-0000000AIfu-2XBr;
	Tue, 22 Oct 2024 09:14:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=K51whSOoccfWJ1oT5QsGS1IjvPrInQRVrtM/UwrHahw=; b=g+VCpVlYxX1Sj8Ti8vI92swsSp
	JF8RArNqBCqCW0WiaCYXKKzelMuSmtcY+D0htMS66EPPVz5ziPlCa5xkS0LKgk+R6bP5IJbZsy+yD
	F9QwVJhYOFtQoL1kR39gkc8HZzLEL/D6ZPjXOOb1h3HQQcnPXK/JTJJCoBScRyqD/idGJYk0MvAuu
	PDYVg28X2880xU7eQV9PSqCWBH6Jnris/lnddkhz5jA3PGoXpTvY9+U53luYY68QN67vPft7Fh6wx
	DycXstlfZndEU+lZShjvWPg2vcj4+36+KSojlZXsnmwI6Rmk3aWidR4jejLS5sqbhIbWMaHqqbwvt
	tWE392Ow==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3AyO-00000008AXF-1pxy;
	Tue, 22 Oct 2024 09:14:42 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20cbcd71012so48372705ad.3;
        Tue, 22 Oct 2024 02:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729588477; x=1730193277; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K51whSOoccfWJ1oT5QsGS1IjvPrInQRVrtM/UwrHahw=;
        b=nHuvm3eETa2K+iLXI3huA+/5u6yixmuKlZiqv1kvrvyY08FzcJWQZ9yk1bxA6YmcwZ
         HLW5dW55ymr9t0q+BB2EhqOOAQt6OqfsnvPPVbsQNTr3qyKnPLoOA7aiLpigQ6xz/dDF
         FUXrqkLnr7l+VizXMqInrHg5u1OYCkqGpdC8/Kpg1Uf0T8sRS5/AsLzlJX42256meYxd
         i5+Cu+Q6tumO5qjmfUzQgPOJ9216H0f8dozOS6olOPfY0U3Qr26e7m3MESq1q+hz87tP
         WWp6nq3UOzoWXksLjtjQmklwEL0oNMIK+C7zn3cPEnPqjC0ILKwQa2aFWwN/TEL0Wl04
         4I/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729588477; x=1730193277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K51whSOoccfWJ1oT5QsGS1IjvPrInQRVrtM/UwrHahw=;
        b=AmK/2k2f6BxVEriD2I1hEJ0Nm83073GFHxvCWp9STDYpNHbMH+nn9oTCFtO12ba+C0
         0dTtxsG4dSbjxLdhsBc82fYHYF5wkLlHb4XfHu9buTGsixdj7Om8sLPmiCoCsWs7f1ND
         y1PORvFOCxJp/SYb87EMttotu8dUvv25rqdU3fzFKzwwlYeI25jxCp8hInT7z8BLlCv7
         LPMDXRUKNIZPG/rC9uozdise4E6SsCaLC1oEPGyWa2Sm+qcGiPsO3feiY1jv+EZ9EMvT
         /GKYifR4M/Z1+1r0rvPBEKLTOPbYL/GjzgVXA//48TnjxW8yn2dfnJ77pzrZ4A5b0irv
         DapA==
X-Forwarded-Encrypted: i=1; AJvYcCVSp9/PEdQVKvFSiRVeoc1f4rDPPujtnwXJ46Dv2ot+F/+8pC9qp0VWw9xd7lT3zIkOdiZf/FvBCzdm2P5VhNS8@lists.infradead.org, AJvYcCXv9FYHBE1NIwL8VxIciwk1HkqghQhJf3A6bhWskMysYcBswVFhdXWd8h0I5J0QDGMCz6z4fiPYheLb@lists.infradead.org
X-Gm-Message-State: AOJu0YxBTc6MWiHeae8sYnVhFop003W/L0NGDP3pRr4TjBqBhDzVeM6p
	vw/k+SgLdX0UFua3kiiJ6Fb86mCfTYdwX+fbKpDo6bcRcti8GbBE
X-Google-Smtp-Source: AGHT+IHH9sYrSSvfbEf+31ytxi3WDRRewNjbMkhS8kbu4X5qoBQrSZpw/oFE2eqC02U58aD5xBFgQQ==
X-Received: by 2002:a17:902:d2ce:b0:20b:6a57:bf25 with SMTP id d9443c01a7336-20e5a7749damr228551665ad.20.1729588476937;
        Tue, 22 Oct 2024 02:14:36 -0700 (PDT)
Received: from [172.19.1.53] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0bd48fsm38623195ad.129.2024.10.22.02.14.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 02:14:36 -0700 (PDT)
Message-ID: <38aba46a-c5e5-4832-8a73-4260d5a94b68@gmail.com>
Date: Tue, 22 Oct 2024 17:14:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nikita.shubin@maquefel.me, arnd@arndb.de,
 vkoul@kernel.org, esben@geanix.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241018022519.721914-1-hpchen0nvt@gmail.com>
 <20241018022519.721914-3-hpchen0nvt@gmail.com>
 <20241021103254.1f31205b@xps-13>
 <9cfd923a-4bc8-4a6c-986d-8d0c6fd6d9bb@gmail.com>
 <20241022105109.1906f524@xps-13>
Content-Language: en-US
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
In-Reply-To: <20241022105109.1906f524@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_101440_646740_7465026B 
X-CRM114-Status: GOOD (  10.82  )
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

RGVhciBNaXF1ZWwsCgpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCgoKT24gMjAyNC8xMC8yMiDk
uIvljYggMDQ6NTEsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgSHVpLVBpbmcsCj4KPj4+PiAr
Cj4+Pj4gK3N0YXRpYyBpbnQgbWEzNV9uYW5kX3dyaXRlX3BhZ2VfaHdlY2Moc3RydWN0IG5hbmRf
Y2hpcCAqY2hpcCwgY29uc3QgdTggKmJ1ZiwKPj4+PiArCQkJCSAgICAgIGludCBvb2JfcmVxdWly
ZWQsIGludCBwYWdlKQo+Pj4+ICt7Cj4+PiBUaGUgaGFyZHdhcmUgRUNDIGVuZ2luZSBzaG91bGQg
YWx3YXlzIGJlIGRpc2FibGVkIGJ5IGRlZmF1bHQuCj4+Pgo+Pj4gVGhlbiwgaW4gdGhlc2UgaGVs
cGVycyB5b3Ugc2hvdWxkOgo+Pj4gKiBlbmFibGUgdGhlIEVDQyBlbmdpbmUKPj4+ICogZG8geW91
ciB0aGluZ3MKPj4+ICogZGlzYWJsZSB0aGUgRUNDIGVuZ2luZQo+PiBUaGUgRUNDIGVuZ2luZSBv
ZiB0aGUgTUEzNSBOQU5EIGNvbnRyb2xsZXIgY2Fubm90IGJlIHR1cm5lZCBvbiBvciBvZmYgc2Vw
YXJhdGVseS4KPj4KPj4gVGhlIEVDQyBlbmdpbmUgaXMgYWN0aXZhdGVkIHdpdGggdGhlIERNQSwK
Pj4KPj4gYW5kIGl0IGNhbGN1bGF0ZXMgYW5kIHdyaXRlcyB0byB0aGUgT09CIGR1cmluZyB0aGUg
dHJhbnNmZXIuCj4gV2hhdCBhYm91dDoKPgo+IEVDQyBBbGdvcml0aG0gRW5hYmxlIEJpdCBbMjNd
IEVDQ0VOCj4KPiAJVGhpcyBmaWVsZCBpcyB1c2VkIHRvIHNlbGVjdCB0aGUgRUNDIGFsZ29yaXRo
bSBmb3IgZGF0YQo+IAlwcm90ZWN0aW5nLiBUaGUgQkNIIGFsZ29yaXRobSBjYW4gY29ycmVjdCA4
IG9yIDEyIG9yIDI0IGJpdHMuCj4gCTAgPSBCQ0ggY29kZSBlbmNvZGUvZGVjb2RlIERpc2FibGVk
Lgo+IAkxID0gQkNIIGNvZGUgZW5jb2RlL2RlY29kZSBFbmFibGVkLgo+Cj4gPwoKVGhhdCdzIHJp
Z2h0LCB0aGlzIGJpdCByZXByZXNlbnRzIHRoaXMgbWVhbmluZywgYnV0IEVDQyBvcGVyYXRpb25z
IHdpbGwgCm9ubHkgb2NjdXIgd2hlbiBETUEgaXMgYWN0aXZhdGVkLgoKSSB3aWxsIGFkZCBlbmFi
bGUvZGlzYWJsZSBFQ0MgZW5naW5lIGJlZm9yZSBhbmQgYWZ0ZXIgcmVhZGluZy93cml0aW5nIAp0
aGUgcGFnZS4KCgo+IFRoYW5rcywKPiBNaXF1w6hsCgoKQmVzdCByZWdhcmRzLAoKSHVpLVBpbmcg
Q2hlbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
