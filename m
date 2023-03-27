Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDAFC761AF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Mar 2023 11:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wrFkCZ3qUHlPozOTf6VACPkCeo/nDv72DDneJbhFPns=; b=Q07uMW+XVjzNVx
	6LvMufcKFWyUxf11Rr+VQGReWjvt2KLkb4TKhfishLdhLsIfvX+fsdcjIz3oE2njcCIxNcLIdaUV9
	mvDjZ+iFMiW7SZQB82Yj4SluOAT/l7gdpm67eEbu/cJs/P3DD05zDrySp+/4djOSmHursT3zbDJ/y
	yF7/yWEadH03XgI6EbiPG00+30fRVPVVObI7EkQtBsvQgeMiuKF3DgWf4/c/X+u9r3XGmkxVqLdot
	YGeRUjAoq0/JCAfUsBeTELa0gbI119eAUEgXcTxMZXBAjg6/WyOgNCOSX9nLX5ynJkn32tYVrmR37
	P4liM1tjlzxGU+baR8Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgkgt-00AiIv-0w;
	Mon, 27 Mar 2023 11:07:07 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgkgq-00AiHh-0i
	for linux-mtd@lists.infradead.org;
	Mon, 27 Mar 2023 11:07:05 +0000
Received: by mail-wr1-x42e.google.com with SMTP id m2so8316821wrh.6
        for <linux-mtd@lists.infradead.org>; Mon, 27 Mar 2023 04:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679915220;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qitJTqC1V5NX4sqdWfyfOSl5R7cjvJjk8ZEy1hQzGYw=;
        b=uZKetoWJiYs++Fgjpf9n+9rMID4at3FHq8zR9UT1O/0uo5hUok59vw/gaUyKRIF9lh
         eZ+W/gt0HbWb5I+4PoOaU9DSMdUhmndm2Ou669CxfJ3AfCzZ/tUYxzZuwZgQdKjet0z5
         aMWIXxPMmPGhfnPrCx+kFJ/zcZZvn2MLkD+jfzbCw6J0SefC9ForEtNmAn4LfUsA/JUt
         FdZ6kDn3PvmE3GsEyBw4xW3MaG15fka/zB7iP+q4VN8KJbOoaS8JhYkUJBHIj4McJTQ+
         nft4zMNSISkqF6667a6kUzxfz3JKI7HBEWDiL46dHbaNKPTGPJa1GdL53w5ZX6WT+7Xb
         ofxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679915220;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qitJTqC1V5NX4sqdWfyfOSl5R7cjvJjk8ZEy1hQzGYw=;
        b=Lxti1VGwcoCKDYH2W+Oj5DTBskV33Ackwu3eyrnkcamtbgu9bbuu3IEsGjSA0j4ID+
         Xhc9y3s9x8o1TqyFgr47pBhnAJ7xHYZWIFDIzUQPrES3ymV5hqEALwtGZrNBRyEQF8Vq
         tzmP+J61QFuFLIdinVAlkaUZBcP2OYV/cyNzQRAXYgUsot4vPLq8HusupoC1vJvxmm5D
         pEwquAQR64pNc482r/n8wld2BOjqWZOU2G7pDFcIPklqcnF8e0r4qhWJh3MshE5R13mk
         3cqaTogUppfFfJyC6vDWiMrVFdbNXyy5jOb89eswjg783rt8GtMPq6MzzqITP+tAIh38
         RuNA==
X-Gm-Message-State: AAQBX9cMKZ6FelNQkj/GPissub1RYVqfSqm017wapJpzQO8Dvpo6V7Ky
	WqaBxHMkqeTCss69GkuPTLkjKJuIwKyE/zTq5u8=
X-Google-Smtp-Source: AKy350YWw4DxoHkP05YdbwUNjWA9N5HHoPz6vmYEJISihg2trk7/De13x7ewKuibreEd0BHOEXJ70A==
X-Received: by 2002:adf:fe08:0:b0:2d6:a357:f138 with SMTP id n8-20020adffe08000000b002d6a357f138mr9284325wrr.18.1679915220550;
        Mon, 27 Mar 2023 04:07:00 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id f9-20020adff989000000b002cea392f000sm24774833wrr.69.2023.03.27.04.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 04:07:00 -0700 (PDT)
Message-ID: <70d0a8b6-62c2-fa3e-df5c-f86ba75484d0@linaro.org>
Date: Mon, 27 Mar 2023 12:06:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/2] mtd: rawnand: stm32_fmc2: use timings.mode instead
 of checking tRC_min
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Christophe Kerello <christophe.kerello@foss.st.com>, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20230327094742.38856-1-christophe.kerello@foss.st.com>
 <20230327094742.38856-3-christophe.kerello@foss.st.com>
 <75dcd205-5432-7103-370c-d65d792631ea@linaro.org>
 <20230327124313.1ccd3d66@xps-13>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230327124313.1ccd3d66@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_040704_262143_8240FA0B 
X-CRM114-Status: GOOD (  21.82  )
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

CgpPbiAzLzI3LzIzIDExOjQzLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIFR1ZG9yLAo+IAo+
IHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZyB3cm90ZSBvbiBNb24sIDI3IE1hciAyMDIzIDExOjMw
OjUxICswMTAwOgo+IAo+PiBPbiAzLzI3LzIzIDEwOjQ3LCBDaHJpc3RvcGhlIEtlcmVsbG8gd3Jv
dGU6Cj4+PiBUaGlzIHBhdGNoIGlzIHVzaW5nIHRpbWluZ3MubW9kZSB2YWx1ZSBpbnN0ZWFkIG9m
IGNoZWNraW5nIHRSQ19taW4gdGltaW5nCj4+PiBmb3IgRURPIG1vZGUgc3VwcG9ydC4KPj4+ICAg
Cj4+Cj4+IEZpeGVzIGFuZCBDYyB0byBzdGFibGUgaGVyZSB0b28sIGFzIHlvdSdkIGxpa2UgdG8g
aGF2ZSB0aGlzIGJhY2twb3J0ZWQKPj4gYXMgd2VsbCwgZG9uJ3QgeW91Pwo+IAo+IEFjdHVhbGx5
IHRoZSByZWFzb24gd2h5IENocmlzdG9waGUgc3BsaXQgdGhpcyBpbnRvIHR3byBwYXRjaGVzIGlz
Cj4gYmVjYXVzZSB0aW1pbmdzLm1vZGUgd2FzIGludHJvZHVjZWQgcmF0aGVyIGxhdGVseSwgaGUg
d2FudGVkIHRoZSBzYW1lCj4gcGF0Y2ggdG8gYXBwbHkgb24gYWxsIHN0YWJsZSBrZXJuZWxzLCBo
ZSBhY3R1YWxseSBhc2tlZCBmb3IgdGhhdCBzcGxpdAo+IGFuZCBJIGFncmVlZCAoYW5vdGhlciBz
b2x1dGlvbiB3b3VsZCBoYXZlIGJlZW4gdG8gc2VuZCB0aGlzIGN1cnJlbnQKPiBwYXRjaCB0byBM
aW51cyBhbmQgaGF2ZSB0aGUgb3RoZXIgdmVyc2lvbiBzZW50IHRvIHN0YWJsZSwgYnV0IGl0Cj4g
cmVxdWlyZXMgYSBiaXQgb2Ygc2NoZWR1bGluZyBvbiBib3RoIGVuZHMpLgo+IAo+IExpbms6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIzMDMyNzEwMTE1Ni4wZWMyODE2YUB4
cHMtMTMvVC8jdAoKUmlnaHQsIEkgdW5kZXJzdG9vZCB0aGF0IGZyb20gdGhlIGJlZ2lubmluZy4g
SWYgaXQgd2VyZSB0byBtZSwgSSB3b3VsZApDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAjdjUu
NCsgZm9yIHRoZSBmaXJzdCBwYXRjaCBhbmQKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgI3Y1
LjEwKyBmb3IgdGhlIHNlY29uZC4KClNvIGZpcnN0IHdvdWxkIGJlIGFsb25lIGp1c3QgaW4gdjUu
NCwgYW5kIHN0YXJ0aW5nIHdpdGggdjUuMTAgd2UnbGwgaGF2ZQpib3RoIGFuZCB3ZSdsbCBtaW1p
YyB3aGF0IHdlIGN1cnJlbnRseSBoYXZlIGluIHVwc3RyZWFtIG1haW5saW5lLgoKPiAKPj4KPj4+
IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQGZv
c3Muc3QuY29tPiAgCj4+Cj4+IFJldmlld2VkLWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJh
cnVzQGxpbmFyby5vcmc+Cj4+Cj4+PiAtLS0KPj4+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0z
Ml9mbWMyX25hbmQuYyB8IDIgKy0KPj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
c3RtMzJfZm1jMl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQu
Ywo+Pj4gaW5kZXggM2FiYjYzZDAwYTBiLi45ZTc0YmNkOTBhYWEgMTAwNjQ0Cj4+PiAtLS0gYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+Pj4gKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMKPj4+IEBAIC0xNTMxLDcgKzE1MzEsNyBAQCBz
dGF0aWMgaW50IHN0bTMyX2ZtYzJfbmZjX3NldHVwX2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9jaGlw
ICpjaGlwLCBpbnQgY2hpcG5yLAo+Pj4gIAlpZiAoSVNfRVJSKHNkcnQpKQo+Pj4gIAkJcmV0dXJu
IFBUUl9FUlIoc2RydCk7Cj4+PiAgCj4+PiAtCWlmIChzZHJ0LT50UkNfbWluIDwgMzAwMDApCj4+
PiArCWlmIChjb25mLT50aW1pbmdzLm1vZGUgPiAzKQo+Pj4gIAkJcmV0dXJuIC1FT1BOT1RTVVBQ
Owo+Pj4gIAo+Pj4gIAlpZiAoY2hpcG5yID09IE5BTkRfREFUQV9JRkFDRV9DSEVDS19PTkxZKSAg
Cj4gCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
