Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33331C87FDA
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Aug 2025 07:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MoGFhjf5N4M8utUOUlcFObWEdGsQWTMTiJgxZd+Kb6k=; b=UpbiA8cj1a/lFz
	9TwM1VnZu6fvaPkMmbcxoOJcW7vLc5VmJVzwFeFArowicp66a0aX1N/0yaLKrg6QCWEnUDNOqMVcn
	qfxu4xJNLLAhuJEgQB2kEQXct9dOL422vV4BuEpUIOXgUiicQKC9vGjJe/Tug1vvohaXK2oORISJ5
	f5TQrgGQ9en8y4zGmU7wetLTkSpswbP23yI4BVJXjWBeWvhG7BnmZ/GTOucNNvBmnjnk67MtcUdR2
	NAOzo48mEfPGE0rm40FNTTbk/4zwbF2SkGBElYEw2rZqar9WY/f/QbZ/yPYOiKU4e0QFAeG7+cHn6
	9wrAKVrDSmumM3aLDrcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uipWP-00000009oRr-2yZm;
	Mon, 04 Aug 2025 07:22:13 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uipWM-00000009oRQ-3FGR
	for linux-mtd@lists.infradead.org;
	Mon, 04 Aug 2025 07:22:11 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3b78d337dd9so1775219f8f.3
        for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2025 00:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754292129; x=1754896929; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ToWpAUJRSlOUvTwmpX08BwtyoGhLc81qka+ZxJutB6A=;
        b=c7j/5J93f1Bq5yoGJTVzh/Jxn/lGSWMsVNm57UCxjmbNlkX6JEwrz9mZdyrxY1U3V+
         OI37Ct+gV3wCUHwac62Pwvv1EhX/x3lpFd0vXNUXuELf3GcWRVRfu1VJgZmBh0npb/Ru
         K1bDjHJ+WmLDQGkbwk9mbxGnd+k1tmUaMa3mK0nxq7dE8TUe2d3gzixLoBCKMoqqp7B/
         XNwlh0UYfzAtEMZu2ajh0ldK1CzkNDt11skNocpO+x2s7YtaTqycV+z/WsiaEevxLv7t
         s/w4nDxzE4JHkL0fmm2h+xT/YP2HjZn+m7ok9iTfeBZTsnP8Xcq7TpqTT++8rbUxlKKv
         QfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754292129; x=1754896929;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ToWpAUJRSlOUvTwmpX08BwtyoGhLc81qka+ZxJutB6A=;
        b=k/ppJ8RFf54yF8GJ2F7uR3+krVYN4B2QqBZxGB3hhz5W/t3F/FVamw3i3JJb/yF9aJ
         Xa3AMhZDld5FVC76/qcOpKzTY8TzsMdIKMl9hDym7GAm8TBlUTTl+m9RqfG9ISfUAjZm
         aBnrx0piCwGWYYtY8KOWvkIrIdh0za/gl8WqSha3RjH7uN8nFmNDf+c7nzHG8grqv9uu
         AYCqNWyCFOnQ7lqS/bcHLjKIHysPxv8s74AWuh4qhtgnNlk6eT/sM/3B/YY8LgkKLRXu
         JvbZrafM8Y+AOwTxKSlqsPah7a6RzVscGj63O1BNZ/OXwD9WHCI4VBtlQSuGmt67PvZd
         z+Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWoOj4GizisAUkJ1DV/I3CbdYzTidT1EZ7YHR7uSLqmYnOnc/incFg1U0eYv7tIAY9KoPHgpoGhJ08=@lists.infradead.org
X-Gm-Message-State: AOJu0YwiMrEXeiH3tapfsTfcxDqiOmhEUT+tqa0Ujg6jXyX+h2U2Tydk
	aZ9TkjFzXkFE+nUyTptYVk+/ystKdMlPXjs5tRVaPMeb4JU92wGQd5f6
X-Gm-Gg: ASbGncuDJe+aylKXmYvbPi1XSnZTOfu9TYHwYzfcnWEr9CcGcDE1VpK+lX79IAK7yXD
	j0WonTamt69CZW85MfPrrC/nZNmTwv8dJcWgiZXJpEdPfUNMhNQu24vDTzYUAzI4fXzyAg1JWGl
	3kPC38R3zpzEiIdVuVJXJkG3VAD003P+TC4MiD5Ww/Xj90nZp7K/2zRhh/ZbYfMA3/HBIeg0bJB
	YRIC1wfUjfBPC5/fQ98XZl0OQwY4htndweIyQulLS4YMBbg0/bANzIx1DDugCrPpFWFDmio1bqh
	w7pSeO4q24PmMfzlEZJzeU7LE8FLdGfkiDs7Njo6/ZGS/ZBiUwFim2cop0y/DDCXimmPcFa20ol
	L8tluM8hNL7eAVBrG0hdoGyb+gja3W1OfopLE6wRKFdC96YYt3QmA1D/lib/w4yA=
X-Google-Smtp-Source: AGHT+IGN+j/w75NGzay/OrfSDwoiaEeGnTdHqWBDbn2s7sF60e0yl2YtMKOnY01wt8RaPjdWxl/lOA==
X-Received: by 2002:a05:6000:438a:b0:3b7:926f:894c with SMTP id ffacd0b85a97d-3b8d9470d35mr5987067f8f.23.1754292128660;
        Mon, 04 Aug 2025 00:22:08 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee4f089sm164855595e9.20.2025.08.04.00.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 00:22:08 -0700 (PDT)
Message-ID: <8883471e-57b9-4492-8d4a-aca3b4538682@gmail.com>
Date: Mon, 4 Aug 2025 09:22:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: spi-qpic-snand: fix calculating of ECC OOB regions'
 properties
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Mark Brown <broonie@kernel.org>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>,
 Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250731-qpic-snand-oob-ecc-fix-v1-1-29ba1c6f94e5@gmail.com>
 <72d5f805-1637-4c82-af25-e78b978c5799@oss.qualcomm.com>
Content-Language: hu
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <72d5f805-1637-4c82-af25-e78b978c5799@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_002210_809544_D878B2A5 
X-CRM114-Status: GOOD (  14.73  )
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

SGkgS29ucmFkLAoKMjAyNS4gMDguIDAxLiAxMzo1NiBrZWx0ZXrDqXNzZWwsIEtvbnJhZCBEeWJj
aW8gw61ydGE6Cj4gT24gNy8zMS8yNSA4OjExIFBNLCBHYWJvciBKdWhvcyB3cm90ZToKCi4uLgoK
Pj4gLS0tIGEvZHJpdmVycy9zcGkvc3BpLXFwaWMtc25hbmQuYwo+PiArKysgYi9kcml2ZXJzL3Nw
aS9zcGktcXBpYy1zbmFuZC5jCj4+IEBAIC0yMTMsOCArMjEzLDE2IEBAIHN0YXRpYyBpbnQgcWNv
bV9zcGlfb29ibGF5b3V0X2VjYyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IHNlY3Rpb24sCj4+
ICAJaWYgKHNlY3Rpb24gPiAxKQo+PiAgCQlyZXR1cm4gLUVSQU5HRTsKPj4gIAo+PiAtCW9vYnJl
Z2lvbi0+bGVuZ3RoID0gcWVjYy0+ZWNjX2J5dGVzX2h3ICsgcWVjYy0+c3BhcmVfYnl0ZXM7Cj4+
IC0Jb29icmVnaW9uLT5vZmZzZXQgPSBtdGQtPm9vYnNpemUgLSBvb2JyZWdpb24tPmxlbmd0aDsK
Pj4gKwlpZiAoIXNlY3Rpb24pIHsKPj4gKwkJb29icmVnaW9uLT5vZmZzZXQgPSAwOwo+PiArCQlv
b2JyZWdpb24tPmxlbmd0aCA9IHFlY2MtPmJ5dGVzICogKHFlY2MtPnN0ZXBzIC0gMSkgKwo+PiAr
CQkJCSAgICBxZWNjLT5iYm1fc2l6ZTsKPj4gKwl9IGVsc2Ugewo+PiArCQlvb2JyZWdpb24tPm9m
ZnNldCA9IHFlY2MtPmJ5dGVzICogKHFlY2MtPnN0ZXBzIC0gMSkgKwo+PiArCQkJCSAgICBxZWNj
LT5iYm1fc2l6ZSArCj4+ICsJCQkJICAgIHFlY2MtPnN0ZXBzICogNDsKPj4gKwkJb29icmVnaW9u
LT5sZW5ndGggPSBtdGQtPm9vYnNpemUgLSBvb2JyZWdpb24tPm9mZnNldDsKPj4gKwl9Cj4gCj4g
SG93IGFib3V0Cj4gCj4gaWYgKHNlY3Rpb24gPT0gMCkgewo+IH0gZWxzZSBpZiAoc2VjdGlvbiA9
PSAxKSB7Cj4gfSBlbHNlIHsgcmV0dXJuIC1FUkFOR0UgfQo+IAo+ID8KClRoZSBjdXJyZW50IHdh
eSBmb2xsb3dzIHRoZSBpbXBsZW1lbnRhdGlvbiBpbiB0aGUgcWNvbV9uYW5kYyBkcml2ZXIsIHNv
IGl0IG1ha2VzCml0IGVhc2llciB0byBjb21wYXJlIHRoZSB0d28sIGJ1dCBpdCBjYW4gYmUgY2hh
bmdlZCBvZiBjb3Vyc2UuCgpIb3dldmVyLCBzaW5jZSB0aGUgJ3NlY3Rpb24nIHBhcmFtZXRlciBp
cyBhbiBpbnRlZ2VyIGNhbiB3ZSBhZ3JlZSB1cCBvbiB1c2luZyBhCnN3aXRjaCBzdGF0ZW1lbnQg
aW5zdGVhZCBvZiBtdWx0aXBsZSBpZnM/CgpSZWdhcmRzLApHYWJvcgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
