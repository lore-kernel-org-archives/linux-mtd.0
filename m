Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DFCCD128A
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Apr 2024 18:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ns7LKIS2nfriWZ3kSCJEsoq1QzCc9Y9dLgU0kbL/Dro=; b=AvXZJr5g4fBckm
	+u8WB4c5mPEg7oziCUXq5Ff9X3sSrfVR9bXlHGsfWqOu4Wt90c0ffsjjUNiZ9vWWhBUSrkalwgDWU
	gTm6mUfd8H1HVdyWlblnH/Z/7xetcFlFRq/lR3jQzEGej77dcFzlCtVswWqvanm/x8MvBHALrwkmG
	UGhsrebdc2HYoOSCp3Be7zdFwmKjzNJO0j5T8Yurg0HOP79wVTDwOyfeAifHAFURZhqkNjY5GqtAp
	O+JdtYbnFAt4uGetoDXM0XLy6ojafiUHA67MchdY17fCY3jpuMEqDamoJl+uRIofAX4mYdpBJDFXF
	fCLxevkYDv0rfkyWQDug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtXg2-0000000DJQN-0QmC;
	Sun, 07 Apr 2024 18:55:38 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtXfy-0000000DJPZ-1k4L
	for linux-mtd@lists.infradead.org;
	Sun, 07 Apr 2024 18:55:36 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-516c403cc46so6697164e87.3
        for <linux-mtd@lists.infradead.org>; Sun, 07 Apr 2024 11:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712516132; x=1713120932; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OU07XWrH7QrRx8z6lpwbyNFVehByy6iiEfzZuuvlVDc=;
        b=Pu3Pyu6bud4hiN+BGM44J5HSlCWNePeNC0AdDaR2bI1CKiZIy81zGAErbiJCD5NsBc
         JxblVRNHoKPOKnTm1jw0KjDo6aKZk61rbyzcRAvpPiZzh5GzgrI/XIS7PkehTsmwsvjS
         04inRPQu7vpBeVbu41DPWPECs0okVbIGPMON78R+yxrZvXeJB3OtiElsuWxLllIRseGl
         Y6ksUIDitVeQWE1tqSsz3n0RTLOxxaTNHl0qV6UpLEdbyxHTjhjQPV5HAvaJ13nkto1Z
         vPQBhWCXyGnDgV48hZ39iWFcnw6LDXAB+DuOjbhD5+733SNzKng9Exc5hyab0rmEvWU7
         FQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712516132; x=1713120932;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OU07XWrH7QrRx8z6lpwbyNFVehByy6iiEfzZuuvlVDc=;
        b=s8OF8HUjLheJLjatz2zASjhV+nbBavo6OsrgTTLrTHbS9mtm3pz7GfmTVDM0oLDIE1
         k1gzRwHhxkHbLlPbW6HTzF+hbAxjgUvH31WVcUl82lY4nQhkBzAdVS8OGOe2lEpyDrC9
         jA1K5vPnvKUp3mHP++0KMlOP0X0SJENT8w15pXCUQIGYRgWNEQaxrSjYpQGvVhVCWr5J
         d8ydZ3zR3qh5bX9EshwHaOHQZvGFFdw9UXdBzrhlkG8abV7W85IJPU1X9Fr6/qCe5W1U
         kipW+lFR6r48VEDHgJXD3w/sFqXT1stf4Tu/dhuDNjOZev7XQMCtLA8vihjiRH++z3/w
         8lJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ1tAMNC1n6Y34k4UomFOp0GkRTudTcPk+A8zKHhCjZXFHIvHdvg6raXeydY0xWkI5n1PRe/ZRpXKM5HQUab+YotD4tLXmzCADItpcIA==
X-Gm-Message-State: AOJu0YzwsYE/vSD67RqAmXSixUN3JLRoFzZ9KnLxUgPS5+VnnWOK0rXc
	pnci/x1V/0nZfjqRsqdoktp8fByvPgcDsMNa/iAx8Q+MvO5u/NlFl0osDE7Bjk0=
X-Google-Smtp-Source: AGHT+IE1bcgFsTWpWkUF7p2n+cWGRC6JhLC677ZsCW3QO9jXpGb+GKMv8gNPyxkV1COnJrWbN+ubFg==
X-Received: by 2002:ac2:4c01:0:b0:516:d0c2:3ff9 with SMTP id t1-20020ac24c01000000b00516d0c23ff9mr5845387lfq.67.1712516132325;
        Sun, 07 Apr 2024 11:55:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id jz13-20020a17090775ed00b00a51a1d1a3d4sm3457158ejc.47.2024.04.07.11.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Apr 2024 11:55:31 -0700 (PDT)
Message-ID: <46ee8ac3-b868-431e-b3cc-78fd33e9dfb1@linaro.org>
Date: Sun, 7 Apr 2024 20:55:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] spi: spi-qpic: Add qpic spi nand driver support
To: "Alex G." <mr.nuke.me@gmail.com>, Md Sadre Alam
 <quic_mdalam@quicinc.com>, andersson@kernel.org, konrad.dybcio@linaro.org,
 broonie@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, manivannan.sadhasivam@linaro.org,
 neil.armstrong@linaro.org, daniel@makrotopia.org, arnd@arndb.de,
 chris.packham@alliedtelesis.co.nz, christophe.kerello@foss.st.com,
 linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20240308091752.16136-1-quic_mdalam@quicinc.com>
 <20240308091752.16136-4-quic_mdalam@quicinc.com>
 <1c803d8c-80b2-47a9-bc8c-8b13cbfc6841@gmail.com>
 <4f72048a-a764-43de-846c-3b4edc1232e3@gmail.com>
 <0c0487cb-c73d-42dd-94f8-499c29009730@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <0c0487cb-c73d-42dd-94f8-499c29009730@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_115534_480332_A76DC441 
X-CRM114-Status: GOOD (  10.31  )
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

T24gMDcvMDQvMjAyNCAyMDo0NSwgQWxleCBHLiB3cm90ZToKPiAKPiAKPiBPbiA0LzcvMjQgMTM6
NDAsIEFsZXggRy4gd3JvdGU6Cj4+Cj4+Cj4+IE9uIDQvNy8yNCAxMjo0OCwgQWxleCBHLiB3cm90
ZToKPj4+IE9uIDMvOC8yNCAwMzoxNywgTWQgU2FkcmUgQWxhbSB3cm90ZToKPj4+PiBBZGQgcXBp
YyBzcGkgbmFuZCBkcml2ZXIgc3VwcG9ydC4gVGhlIHNwaSBuYW5kCj4+Pj4gZHJpdmVyIGN1cnJl
bnRseSBzdXBwb3J0ZWQgdGhlIGJlbG93IGNvbW1hbmRzLgo+Pj4+Cj4+Pj4gLS0gUkVTRVQKPj4+
PiAtLSBSRUFEIElECj4+Pj4gLS0gU0VUIEZFQVRVUkUKPj4+PiAtLSBHRVQgRkVBVFVSRQo+Pj4+
IC0tIFJFQUQgUEFHRQo+Pj4+IC0tIFdSSVRFIFBBR0UKPj4+PiAtLSBFUkFTRSBQQUdFCj4+Pj4K
Pj4+PiBDby1kZXZlbG9wZWQtYnk6IFNyaWNoYXJhbiBSYW1hYmFkaHJhbiA8cXVpY19zcmljaGFy
YUBxdWljaW5jLmNvbT4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBTcmljaGFyYW4gUmFtYWJhZGhyYW4g
PHF1aWNfc3JpY2hhcmFAcXVpY2luYy5jb20+Cj4+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBWYXJhZGFy
YWphbiBOYXJheWFuYW4gPHF1aWNfdmFyYWRhQHF1aWNpbmMuY29tPgo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IFZhcmFkYXJhamFuIE5hcmF5YW5hbiA8cXVpY192YXJhZGFAcXVpY2luYy5jb20+Cj4+Pj4g
U2lnbmVkLW9mZi1ieTogTWQgU2FkcmUgQWxhbSA8cXVpY19tZGFsYW1AcXVpY2luYy5jb20+Cj4+
Pj4gLS0tCj4+Pgo+Pj4gRm9yIHRoZSBlbnRpcmUgc2VyaWVzOgo+Pj4KPj4+IFRlc3RlZC1ieTog
QWxleGFuZHJ1IEdhZ25pdWMgPG1yLm51a2UubWVAZ21haWwuY29tPgo+Pj4KPj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zcGkvS2NvbmZpZyBiL2RyaXZlcnMvc3BpL0tjb25maWcKPj4+PiBpbmRl
eCBiYzcwMjFkYTJmZTkuLjYzNzY0ZTk0M2Q4MiAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL3Nw
aS9LY29uZmlnCj4+Pj4gKysrIGIvZHJpdmVycy9zcGkvS2NvbmZpZwo+Pj4+IEBAIC04ODIsNiAr
ODgyLDE0IEBAIGNvbmZpZyBTUElfUUNPTV9RU1BJCj4+Pj4gwqDCoMKgwqDCoCBoZWxwCj4+Pj4g
wqDCoMKgwqDCoMKgwqAgUVNQSShRdWFkIFNQSSkgZHJpdmVyIGZvciBRdWFsY29tbSBRU1BJIGNv
bnRyb2xsZXIuCj4+Pj4gK2NvbmZpZyBTUElfUVBJQ19TTkFORAo+Pj4+ICvCoMKgwqAgdHJpc3Rh
dGUgIlFQSUMgU05BTkQgY29udHJvbGxlciIKPj4KPj4gQWxzbywgZG9uJ3QgdHJpc3RhdGUgdGhp
cy4gSXQgY2FuIGJlIHNldCBhcyBDT05GSUdfUVBJQ19DT01NT049bSwgd2hpY2ggCj4+IHdpbGwg
Y2F1c2UgdGhlIGJ1aWxkIHRvIGZhaWwgYmVjYXVzZSB5b3UgZG9uJ3QgaGF2ZSBhIE1PRFVMRV9M
SUNFTlNFKCkuCj4gCj4gUGxlYXNlIGRpc3JlZ2FyZCBteSBpZGlvdGljIHN1Z2dlc3Rpb24gaGVy
ZS4gSSBtZWFudCB0byBtYWtlIHRoaXMgCj4gY29tbWVudCBvbiB0aGUgcHJldmlvdXMgcGF0Y2gu
Cj4gCgpBbHNvIG5vdC4gQWxsIG9mIHRoZXNlIG11c3QgYmUgYWxsb3dlZCB0byBiZSBhIG1vZHVs
ZS4gSWYgeW91IG5lZWQKZGVwZW5kZW5jeSBiZXR3ZWVuIG1vZHVsZXMsIHRoZW4gdXNlIGRvY3Vt
ZW50ZWQgc3ludGF4IGluIHRoZSBrZXJuZWwKKGZvbyB8fCAhZm9vKS4KCkJlc3QgcmVnYXJkcywK
S3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
