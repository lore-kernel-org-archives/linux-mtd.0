Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1675CAC58D
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Sep 2025 08:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BUrMc9xJZjfNAV/LZrMBAVhjQValu8HHr/h3n1hqcTE=; b=dfEJTzH/6iK5xk
	iWydU6Y3Sdkvsom30bTVFk8CDyPUTYreyTM5Ocd5wYLuQFuBFNUuKg6Ljhb/Ku6k6orfKwrsvm6NR
	6DPGHovpbslS5KGuxJhHgCYvJ1xSVrmRhJZ4CF4oCmkxFU1z4EDJ2PDvHlL1FpT+R8IQazaTXdNuD
	ZAawZQ2d9yg+obiMLdNXQTNc1iwmW0xwTDSjDJMr5YkQxpe76U0FbzhVBL3BZ25z8TVMNYckMu7Te
	W0MZSoBxJ3vRsURprOC0rka6mnoARMuBZEZ7vU2d0EGLp+SkofQreMGseNbZsEuQfqDsKnKf6Poje
	9kBxPeW5cdtYasGZLB/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwckg-00000001qTO-1Nur;
	Thu, 11 Sep 2025 08:33:58 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwckd-00000001qS3-46uz
	for linux-mtd@lists.infradead.org;
	Thu, 11 Sep 2025 08:33:57 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b042cc3954fso79188666b.0
        for <linux-mtd@lists.infradead.org>; Thu, 11 Sep 2025 01:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757579634; x=1758184434; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jXNsoVwloZuRCuyn1AI31nY1y36rlJK9l0CGgUq9a2g=;
        b=IubgAcQLgCi/uya9t3j0PgPk3XgTs6y9rOcX2AQEYcQbJVpsPKN9jtt1ZAaNc/g5BV
         /8zyM1oRBmhwEZ0SPR8OeYTCpmuoZ0Jhs/HkHQgXJQwtXhgJjOhElKFcVJBMchNmDfn1
         aLxTQbz0+5fogFpXTYxf7GwmbJlYxJj9WN8MZ4mEMZranYEsA+LxKta31DoBTHYV5wDu
         vvfSW2FeZSMUBFm5N7MGQt3dCXK6Bf89X+vwb5QBQfGzSwtg/Z4+b0ba0w0C79S2rafC
         khmojo9Fi/eflFf0JNLmf9p/k7i5PyQZa9iosqaUSIPOwjVLSDrpyiBAGT1s6GGJREQN
         DCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757579634; x=1758184434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jXNsoVwloZuRCuyn1AI31nY1y36rlJK9l0CGgUq9a2g=;
        b=NEnEVxtRowVcqJrztjAxStaBsDnSXmh19vTzJ5D6qtK48L/ix3gd40WRH3H+lxCavv
         8dGiJUJiEsAANc3SEPW7dIDF6/x2W8KDh5Op0RlUNP5ha1VhXZ9m0Ns3sYB2Mp+1B0LO
         d8v5u1jQvr60SnPP4oX/fwQSvkdI/HeNpu9kp6lDb/f9kfctypGupszAj3bcDd6aOTlt
         wU4fHvKcZDJuMqC1b/hJG7AON5dmKg+s+QKD7u1ZnZOi6T5hy62lqQLKgI6dlN1vAaKN
         vb4nN7glvfBqLHYYBKDibQWeLMcV3CG0Sp2L75DuBp5XZvTCL23oZG0cqEJoYdU6dzj0
         BHwg==
X-Forwarded-Encrypted: i=1; AJvYcCU0RIYRNp23yrBDuScR8YI2xkLa0nPZuaRVRVLD694jBWXJC+uXdsFKWzIlvmFRn6MBWrWvI+uE3Ko=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRQkXHO+AcLXVHXl1Ubxg+YDb3dDUZAJKQl5qa04Cb54lyL9S6
	mMb1oiMz+fPk1JmPKMy307HWRvtQrakTHGgwpSECJIheN03jhL0A4ZmA
X-Gm-Gg: ASbGncuatsnb42dmjXkTC6Ow8OVdLnCdG9M1GPNb4pY7D9LPHfFw18DGvZ0SUsUxGEF
	+OKfbJ6jcP3jHYr9QLvWj8JuGN9sD6aoixHTErPM8DlywabEbfxUBhT2nMr4m3oD6iYTGGFCR4u
	4mNht5M7DLkoqxUIsY8UispNiRXc8t8KVgoNT7UUzoeBXivoUDGUFnlUTw7g2CGsvw7eJs04coY
	IZBlPx2+d2HHn5T0WSd1knVLo/WIMSCXWPXweB7LshWWNmKABQZlSLkzK8pYn+8bICaT52sGOdJ
	e5DqxEYm0eP1DxgPWJ7hNJ2nXNks1aKcIk6x1FxsBSTN0FMgUuKn1wyF+2nLpHEb6FXPq7a2oN+
	qbL3sRZ+qiy/clsegp0FC47HFMklkZcWQTyUWaSd9SvUFYoD+6SHmPw9gls/uwvo=
X-Google-Smtp-Source: AGHT+IHUYAyMQxWcpnLNiuq6zNTJE+tEXDXpQeiPVv3fwWkOG53PV0tw2n6UBH0oKTKseQSWUZISug==
X-Received: by 2002:a17:907:3f18:b0:b04:7f7e:6d5e with SMTP id a640c23a62f3a-b04b1445bfbmr1497718566b.15.1757579633372;
        Thu, 11 Sep 2025 01:33:53 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dd5b4sm84832366b.70.2025.09.11.01.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 01:33:52 -0700 (PDT)
Message-ID: <a208824c-acf6-4a48-8fde-f9926a6e4db5@gmail.com>
Date: Thu, 11 Sep 2025 10:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: core: always verify OOB offset in
 mtd_check_oob_ops()
To: Miquel Raynal <miquel.raynal@bootlin.com>, Santhosh Kumar K <s-k6@ti.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Daniel Golle <daniel@makrotopia.org>
References: <20250901-mtd-validate-ooboffs-v2-1-c1df86a16743@gmail.com>
 <175708415877.334139.11409801733118104229.b4-ty@bootlin.com>
 <454e092d-5b75-4758-a0e9-dfbb7bf271d7@ti.com> <87348tbeqg.fsf@bootlin.com>
Content-Language: hu
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <87348tbeqg.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_013356_038649_6F6EAD82 
X-CRM114-Status: GOOD (  15.42  )
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

SGkgTWlxdWVsLCBTYW50aG9zaCwKCjIwMjUuIDA5LiAxMS4gMTA6MDAga2VsdGV6w6lzc2VsLCBN
aXF1ZWwgUmF5bmFsIMOtcnRhOgo+IEhlbGxvLAo+IAo+IE9uIDExLzA5LzIwMjUgYXQgMTE6NTI6
MjcgKzA1MzAsIFNhbnRob3NoIEt1bWFyIEsgPHMtazZAdGkuY29tPiB3cm90ZToKPiAKPj4gSGVs
bG8sCj4+Cj4+IE9uIDA1LzA5LzI1IDIwOjI1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+Pj4gT24g
TW9uLCAwMSBTZXAgMjAyNSAxNjoyNDozNSArMDIwMCwgR2Fib3IgSnVob3Mgd3JvdGU6Cj4+Pj4g
VXNpbmcgYW4gT09CIG9mZnNldCBwYXN0IGVuZCBvZiB0aGUgYXZhaWxhYmxlIE9PQiBkYXRhIGlz
IGludmFsaWQsCj4+Pj4gaXJyZWdhcmRsZXNzIG9mIHdoZXRoZXIgdGhlICdvb2JsZW4nIGlzIHNl
dCBpbiB0aGUgb3BzIG9yIG5vdC4gTW92ZQo+Pj4+IHRoZSByZWxldmFudCBjaGVjayBvdXQgZnJv
bSB0aGUgaWYgc3RhdGVtZW50IHRvIGFsd2F5cyB2ZXJpZnkgdGhhdC4KPj4+Pgo+Pj4+IFRoZSAn
b29idGVzdCcgbW9kdWxlIGV4ZWN1dGVzIGZvdXIgdGVzdHMgdG8gdmVyaWZ5IGhvdyByZWFkaW5n
L3dyaXRpbmcKPj4+PiBPT0IgZGF0YSBwYXN0IGVuZCBvZiB0aGUgZGV2aWNlcyBpcyBoYW5kbGVk
LiBJdCBleHBlY3RzIGVycm9ycyBpbiBjYXNlCj4+Pj4gb2YgdGhlc2UgdGVzdHMsIGJ1dCB0aGlz
IGV4cGVjdGF0aW9uIGZhaWxzIGluIHRoZSBsYXN0IHR3byB0ZXN0cyBvbgo+Pj4+IE1URCBkZXZp
Y2VzLCB3aGljaCBoYXZlIG5vIE9PQiBieXRlcyBhdmFpbGFibGUuCj4+Pj4KPj4+PiBbLi4uXQo+
Pj4gQXBwbGllZCB0byBtdGQvbmV4dCwgdGhhbmtzIQo+Pj4gWzEvMV0gbXRkOiBjb3JlOiBhbHdh
eXMgdmVyaWZ5IE9PQiBvZmZzZXQgaW4gbXRkX2NoZWNrX29vYl9vcHMoKQo+Pj4gICAgICAgIGNv
bW1pdDogYmY3ZDA1NDNiMjYwMmJlNWNiNDUwZDhlYzVhODcxMDc4NzgwNmY4OAo+Pgo+PiBJJ20g
c2VlaW5nIGEgZmFpbHVyZSBpbiBTUEkgTk9SIGZsYXNoZXMgZHVlIHRvIHRoaXMgcGF0Y2g6Cj4+
IChUZXN0ZWQgb24gQU02MnggU0sgd2l0aCBTMjhIUzUxMlQgT1NQSSBOT1IgZmxhc2gpCgpTb3Jy
eSBmb3IgdGhlIGluY29udmVuaWVuY2UuCgo+IEdhYm9yLCBjYW4geW91IGNoZWNrIHdoYXQgaGFw
cGVucyB3aXRoIG10ZGJsb2NrPwoKVGhlIHN0cmFuZ2UgdGhpbmcgaXMgdGhhdCBpdCB3b3JrcyB3
aXRoIChTUEkpIE5BTkQgZmxhc2hlczoKCiMgY2F0IC9zeXMvY2xhc3MvbXRkL210ZDAvdHlwZQpu
YW5kCiMgY2F0IC9zeXMvY2xhc3MvbXRkL210ZDAvb29iYXZhaWwKMAojCiMgaGV4ZHVtcCAtbiAy
MDQ4IC9kZXYvbXRkMAowMDAwMDAwIDBmMGYgMGYwZiAwZjBmIDBmMGYgMGYwZiAwZjBmIDBmMGYg
MGYwZgoqCjAwMDA4MDAKIwoKSSB3aWxsIGNoZWNrIHdoeSBpdCBmYWlscyB3aXRoIE5PUiBkZXZp
Y2VzLgoKPiBPdGhlcndpc2UgdGhpcyB3aWxsIG5lZWQgdG8gYmUgcmV2ZXJ0ZWQuCgpQbGVhc2Ug
ZHJvcCB0aGUgcGF0Y2ggZm9yIG5vdywgb3IgcmV2ZXJ0IGl0IGlmIGRyb3BwaW5nIG5vdCBwb3Nz
aWJsZS4KCkVpdGhlciBJIHdpbGwgc2VuZCBhIGZpeGVkIHZlcnNpb24sIG9yIHdlIHdpbGwgaGF2
ZSB0byBsaXZlIHdpdGhvdXQgdGhlIGNoYW5nZS4KCgpSZWdhcmRzLApHYWJvcgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
