Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2D6C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 28 May 2022 10:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gn3I7/LVpFaEiKCnsGtJQcV0APAl+g6mIFdmDAEAOfU=; b=WuS9EmF0Iuq/pM
	O2r9mg0x8YVwCTT1KDtdo0K89iPyVgyl8m4ULvLKiZRELxWmQsSpAOwvWmzT/C5qHPdIY+25Ql5Tk
	3liG3lT43JgwxG7KqD7trR8wsbjhXxnt2qqef/K7OhSQ1ELw07Yr322pZFq/Z1d185ivKwgdgOu+T
	kZxpkDV1bVsU3EKU/slA6uv8oHx+SngxxrY1u4fEmrfzC6hX4TyaLbeefnCdqm1c0yLkFUcWZwhqG
	92fuDq1HGX9Gu5cNw09k8fW/rtWWrL058S0CnAgtKv6+5ggIhpxX5WT1npUpLy5tgUk1nyvSwpgA7
	pphEQCal8gMTOAhSnCWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuu0t-001wKJ-Uo; Sat, 28 May 2022 10:49:43 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuu0q-001wJf-14
	for linux-mtd@lists.infradead.org; Sat, 28 May 2022 10:49:41 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 7so2745548wmz.3
        for <linux-mtd@lists.infradead.org>; Sat, 28 May 2022 03:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=R+NWM2yBw19wQ87u9PhNSpVpDoWCOtafO7VOBGSCtF0=;
        b=ofBl6XXQH3XQVRXhtQJOOLq2b+K3nM17z4AgF9rSo7zvJeXYC+h/agrOTW5d5Rn4H9
         znqIHycyjRAZjWPPKwRguRbVLlaZEh4Vz5bZZfniCFcE2fgyqOKiQzelK8KB40mXQjsO
         LC0zdfI+TrQ5B/AF7EnnJWT6c+Lnnm5XvsKjg+QIOvOIxmuN9/gmHGq8uj0XClA38NZF
         x4W7WO/LVqdD+a0KitZYlkBxN5pFI26UxZkqxpddobra2dO6dUKIZG7cSPzAOpYeaYcS
         ofOrJlBTGycP3nTiJ6Z9Vvh996QBGa6PUP8pJseda2v0O0uR1HVrXnF7XSAPpBV57X78
         9SJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=R+NWM2yBw19wQ87u9PhNSpVpDoWCOtafO7VOBGSCtF0=;
        b=v3qFxrUW2bPH6xw8uXlEGqLlkKfl3PuQfgwrPZtPfGgrXevi+bmO0jHALEUeWvwI+G
         vJzg4sKG7/7mwv03VZgs5FZbrQX241gpK7bkitp3GBLeHaXTW2FGSJIsVSursUPRcKvu
         GNHnO0AXcNdViFnk0LCE3dV+bx4EGTdyAW6VeplxKI91JRSV0ZHoxLaXQhImiuDs8gA0
         iisvad5JTkwl2Louu6yv+MFhOkV0Zo5rTK++uE9CVxvltlnv1hDW4RELbnleavt0LpEX
         bipoFqDQB4UjX2gnCu8zMro1ZGIj2/WA0jgAfBk5VnmO5OxxGztfI9QA+tO6hKIy3Chg
         GapQ==
X-Gm-Message-State: AOAM5316FQfcR+KqYX+ej605DECzffIWHOK/b7lp8GBm3cteTVGI7B8v
	q/scTmhQp/XS6VcxfR0uq4jHxMV7yxMG/PRT
X-Google-Smtp-Source: ABdhPJwm3tpd07PhvSh0bD8Kq4hSyiooSbWI4RT47TzMQusnVeO48u1wU+jGhuSTyb7ZMnuYtTjsog==
X-Received: by 2002:a05:600c:1e1d:b0:397:5496:4435 with SMTP id ay29-20020a05600c1e1d00b0039754964435mr10930732wmb.28.1653734977000;
        Sat, 28 May 2022 03:49:37 -0700 (PDT)
Received: from ?IPV6:2a06:a003:501a:a7ce:ed28:8b82:a351:8973? ([2a06:a003:501a:a7ce:ed28:8b82:a351:8973])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c358c00b003973ea7e725sm5975339wmq.0.2022.05.28.03.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 May 2022 03:49:36 -0700 (PDT)
Message-ID: <376d33eb-011a-af91-a6cc-bfa92268a500@gmail.com>
Date: Sat, 28 May 2022 13:49:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [bug report] mtd: parsers: add support for Sercomm partitions
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-mtd@lists.infradead.org
References: <YoUtzUMdJOihZv2L@kili>
From: Mikhail Zhilkin <csharper2005@gmail.com>
In-Reply-To: <YoUtzUMdJOihZv2L@kili>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220528_034940_136358_6A7E53B7 
X-CRM114-Status: GOOD (  14.38  )
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

SGkgRGFuLAoKT24gNS8xOC8yMDIyIDg6MzMgUE0sIERhbiBDYXJwZW50ZXIgd3JvdGU6Cj4gSGVs
bG8gTWlraGFpbCBaaGlsa2luLAo+Cj4gVGhlIHBhdGNoIDQyMTNlNTU2ZmUyYTogIm10ZDogcGFy
c2VyczogYWRkIHN1cHBvcnQgZm9yIFNlcmNvbW0KPiBwYXJ0aXRpb25zIiBmcm9tIE1heSAzLCAy
MDIyLCBsZWFkcyB0byB0aGUgZm9sbG93aW5nIFNtYXRjaCBzdGF0aWMKPiBjaGVja2VyIHdhcm5p
bmc6Cj4KPiAJZHJpdmVycy9tdGQvcGFyc2Vycy9zY3BhcnQuYzoxNTUgc2NwYXJ0X3BhcnNlKCkK
PiAJd2FybjogbWlzc2luZyBlcnJvciBjb2RlIGhlcmU/ICdtdGRfZ2V0X29mX25vZGUoKScgZmFp
bGVkLiAncmVzJyA9ICcwJwoKVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrISBXaGljaCBrZXkg
ZG8geW91IHVzZSBmb3IgY2hlY2tpbmc/IEkgY2FuJ3QKZ2V0IHRoZXNlIHdhcm5pbmcuCgp+L191
dGlscy9zbWF0Y2gvc21hdGNoX3NjcmlwdHMva2NoZWNrZXIgLS1wZWRhbnRpYwpkcml2ZXJzL210
ZC9wYXJzZXJzL3NjcGFydC5jCsKgIENIRUNLwqDCoCBzY3JpcHRzL21vZC9lbXB0eS5jCsKgIENB
TEzCoMKgwqAgc2NyaXB0cy9jaGVja3N5c2NhbGxzLnNoCsKgIENBTEzCoMKgwqAgc2NyaXB0cy9h
dG9taWMvY2hlY2stYXRvbWljcy5zaArCoCBDQyBbTV3CoCBkcml2ZXJzL210ZC9wYXJzZXJzL3Nj
cGFydC5vCsKgIENIRUNLwqDCoCBkcml2ZXJzL210ZC9wYXJzZXJzL3NjcGFydC5jCgo+IGRyaXZl
cnMvbXRkL3BhcnNlcnMvc2NwYXJ0LmMKPiAgICAgMTM4IHN0YXRpYyBpbnQgc2NwYXJ0X3BhcnNl
KHN0cnVjdCBtdGRfaW5mbyAqbWFzdGVyLAo+ICAgICAxMzkgICAgICAgICAgICAgICAgICAgICAg
ICAgY29uc3Qgc3RydWN0IG10ZF9wYXJ0aXRpb24gKipwcGFydHMsCj4gICAgIDE0MCAgICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgbXRkX3BhcnRfcGFyc2VyX2RhdGEgKmRhdGEpCj4gICAg
IDE0MSB7Cj4gICAgIDE0MiAgICAgICAgIHN0cnVjdCBzY19wYXJ0X2Rlc2MgKnNjcGFydF9tYXAg
PSBOVUxMOwo+ICAgICAxNDMgICAgICAgICBzdHJ1Y3QgbXRkX3BhcnRpdGlvbiAqcGFydHMgPSBO
VUxMOwo+ICAgICAxNDQgICAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm10ZF9ub2RlOwo+ICAg
ICAxNDUgICAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm9mcGFydF9ub2RlOwo+ICAgICAxNDYg
ICAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKnBwOwo+ICAgICAxNDcgICAgICAgICBjb25zdCBj
aGFyICpwYXJ0bmFtZTsKPiAgICAgMTQ4ICAgICAgICAgaW50IG5yX3NjcGFydHM7Cj4gICAgIDE0
OSAgICAgICAgIGludCBucl9wYXJ0cyA9IDA7Cj4gICAgIDE1MCAgICAgICAgIGludCBuOwo+ICAg
ICAxNTEgICAgICAgICBpbnQgcmVzID0gMDsKPiAgICAgMTUyIAo+ICAgICAxNTMgICAgICAgICBt
dGRfbm9kZSA9IG10ZF9nZXRfb2Zfbm9kZShtYXN0ZXIpOwo+ICAgICAxNTQgICAgICAgICBpZiAo
IW10ZF9ub2RlKQo+IC0tPiAxNTUgICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIF5eXl5eXl5eCj4KPiAgICAgMTU2IAo+ICAgICAxNTcgICAgICAgICBv
ZnBhcnRfbm9kZSA9IG9mX2dldF9jaGlsZF9ieV9uYW1lKG10ZF9ub2RlLCAicGFydGl0aW9ucyIp
Owo+ICAgICAxNTggICAgICAgICBpZiAoIW9mcGFydF9ub2RlKQo+ICAgICAxNTkgICAgICAgICAg
ICAgICAgIGdvdG8gb3V0Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eCj4gQXJl
IHRoZXNlIHN1cHBvc2VkIHRvIGJlIHN1Y2Nlc3MgcGF0aHM/CgpSZWFsbHksIEkgdGhpbmsgLUVO
T0VOVCBpcyBtb3JlIHN1aXRhYmxlIGhlcmUuCgrCoMKgwqAgb2ZwYXJ0X25vZGUgPSBvZl9nZXRf
Y2hpbGRfYnlfbmFtZShtdGRfbm9kZSwgInBhcnRpdGlvbnMiKTsKwqDCoCDCoGlmICghb2ZwYXJ0
X25vZGUpCsKgwqAgwqDCoMKgwqAgcHJfaW5mbygiJXM6ICdwYXJ0aXRpb25zJyBzdWJub2RlIG5v
dCBmb3VuZCBvbiAlcE9GLlxuIiwKwqDCoCDCoMKgwqDCoCDCoMKgwqAgwqDCoMKgIG1hc3Rlci0+
bmFtZSwgbXRkX25vZGUpOwrCoMKgIMKgwqDCoMKgIHJlcyA9IC1FTk9FTlQ7CsKgwqAgwqDCoMKg
wqAgZ290byBvdXQ7CgrCoMKgIMKgbnJfc2NwYXJ0cyA9IHNjcGFydF9maW5kX3BhcnRtYXAobWFz
dGVyLCAmc2NwYXJ0X21hcCk7CsKgwqAgwqBpZiAobnJfc2NwYXJ0cyA8PSAwKSB7CsKgwqAgwqDC
oMKgwqAgcHJfaW5mbygiTm8gYW55IHBhcnRpdGlvbnMgd2FzIGZvdW5kIGluICdTQyBQQVJUIE1B
UCcuXG4iKTsKwqDCoCDCoMKgwqDCoCByZXMgPSAtRU5PRU5UOwrCoMKgIMKgwqDCoMKgIGdvdG8g
ZnJlZTsKwqDCoCDCoH0KCgo+ICAgICAxNjAgCj4gICAgIDE2MSAgICAgICAgIG5yX3NjcGFydHMg
PSBzY3BhcnRfZmluZF9wYXJ0bWFwKG1hc3RlciwgJnNjcGFydF9tYXApOwo+ICAgICAxNjIgICAg
ICAgICBpZiAobnJfc2NwYXJ0cyA8PSAwKSB7Cj4KPiBJcyBucl9zY3BhcnRzID09IDAgYSBzdWNj
ZXNzIHBhdGg/Cj4KPiAgICAgMTYzICAgICAgICAgICAgICAgICByZXMgPSBucl9zY3BhcnRzOwo+
ICAgICAxNjQgICAgICAgICAgICAgICAgIGdvdG8gZnJlZTsKPiAgICAgMTY1ICAgICAgICAgfQo+
ICAgICAxNjYgCj4gICAgIDE2NyAgICAgICAgIHBhcnRzID0ga2NhbGxvYyhvZl9nZXRfY2hpbGRf
Y291bnQob2ZwYXJ0X25vZGUpLCBzaXplb2YoKnBhcnRzKSwKPiAgICAgMTY4ICAgICAgICAgICAg
ICAgICBHRlBfS0VSTkVMKTsKPiAgICAgMTY5ICAgICAgICAgaWYgKCFwYXJ0cykgewo+ICAgICAx
NzAgICAgICAgICAgICAgICAgIHJlcyA9IC1FTk9NRU07Cj4gICAgIDE3MSAgICAgICAgICAgICAg
ICAgZ290byBvdXQ7Cj4gICAgIDE3MiAgICAgICAgIH0KPiAgICAgMTczIAo+ICAgICAxNzQgICAg
ICAgICBmb3JfZWFjaF9jaGlsZF9vZl9ub2RlKG9mcGFydF9ub2RlLCBwcCkgewo+ICAgICAxNzUg
ICAgICAgICAgICAgICAgIHUzMiBzY3BhcnRfaWQ7Cj4gICAgIDE3NiAKPiAgICAgMTc3ICAgICAg
ICAgICAgICAgICBpZiAob2ZfcHJvcGVydHlfcmVhZF91MzIocHAsICJzZXJjb21tLHNjcGFydC1p
ZCIsICZzY3BhcnRfaWQpKQo+ICAgICAxNzggICAgICAgICAgICAgICAgICAgICAgICAgY29udGlu
dWU7Cj4gICAgIDE3OSAKPiAgICAgMTgwICAgICAgICAgICAgICAgICBmb3IgKG4gPSAwIDsgbiA8
IG5yX3NjcGFydHMgOyBuKyspCj4gICAgIDE4MSAgICAgICAgICAgICAgICAgICAgICAgICBpZiAo
KHNjcGFydF9tYXBbbl0ucGFydF9pZCAhPSBJRF9BTFJFQURZX0ZPVU5EKSAmJgo+ICAgICAxODIg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChzY3BhcnRfaWQgPT0gc2Nw
YXJ0X21hcFtuXS5wYXJ0X2lkKSkKPiAgICAgMTgzICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgYnJlYWs7Cj4gICAgIDE4NCAgICAgICAgICAgICAgICAgaWYgKG4gPj0gbnJfc2NwYXJ0
cykKPiAgICAgMTg1ICAgICAgICAgICAgICAgICAgICAgICAgIC8qIG5vdCBtYXRjaCAqLwo+ICAg
ICAxODYgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gICAgIDE4NyAKPiAgICAg
MTg4ICAgICAgICAgICAgICAgICAvKiBhZGQgdGhlIHBhcnRpdGlvbiBmb3VuZCBpbiBPRiBpbnRv
IE1URCBwYXJ0aXRpb24gYXJyYXkgKi8KPiAgICAgMTg5ICAgICAgICAgICAgICAgICBwYXJ0c1tu
cl9wYXJ0c10ub2Zmc2V0ID0gc2NwYXJ0X21hcFtuXS5wYXJ0X29mZnM7Cj4gICAgIDE5MCAgICAg
ICAgICAgICAgICAgcGFydHNbbnJfcGFydHNdLnNpemUgPSBzY3BhcnRfbWFwW25dLnBhcnRfYnl0
ZXM7Cj4gICAgIDE5MSAgICAgICAgICAgICAgICAgcGFydHNbbnJfcGFydHNdLm9mX25vZGUgPSBw
cDsKPiAgICAgMTkyIAo+ICAgICAxOTMgICAgICAgICAgICAgICAgIGlmICghb2ZfcHJvcGVydHlf
cmVhZF9zdHJpbmcocHAsICJsYWJlbCIsICZwYXJ0bmFtZSkpCj4gICAgIDE5NCAgICAgICAgICAg
ICAgICAgICAgICAgICBwYXJ0c1tucl9wYXJ0c10ubmFtZSA9IHBhcnRuYW1lOwo+ICAgICAxOTUg
ICAgICAgICAgICAgICAgIGlmIChvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wocHAsICJyZWFkLW9ubHki
KSkKPiAgICAgMTk2ICAgICAgICAgICAgICAgICAgICAgICAgIHBhcnRzW25yX3BhcnRzXS5tYXNr
X2ZsYWdzIHw9IE1URF9XUklURUFCTEU7Cj4gICAgIDE5NyAgICAgICAgICAgICAgICAgaWYgKG9m
X3Byb3BlcnR5X3JlYWRfYm9vbChwcCwgImxvY2siKSkKPiAgICAgMTk4ICAgICAgICAgICAgICAg
ICAgICAgICAgIHBhcnRzW25yX3BhcnRzXS5tYXNrX2ZsYWdzIHw9IE1URF9QT1dFUlVQX0xPQ0s7
Cj4gICAgIDE5OSAKPiAgICAgMjAwICAgICAgICAgICAgICAgICAvKiBtYXJrIGFzICdkb25lJyAq
Lwo+ICAgICAyMDEgICAgICAgICAgICAgICAgIHNjcGFydF9tYXBbbl0ucGFydF9pZCA9IElEX0FM
UkVBRFlfRk9VTkQ7Cj4gICAgIDIwMiAKPiAgICAgMjAzICAgICAgICAgICAgICAgICBucl9wYXJ0
cysrOwo+ICAgICAyMDQgICAgICAgICB9Cj4gICAgIDIwNSAKPiAgICAgMjA2ICAgICAgICAgaWYg
KG5yX3BhcnRzID4gMCkgewo+ICAgICAyMDcgICAgICAgICAgICAgICAgICpwcGFydHMgPSBwYXJ0
czsKPiAgICAgMjA4ICAgICAgICAgICAgICAgICByZXMgPSBucl9wYXJ0czsKPiAgICAgMjA5ICAg
ICAgICAgfSBlbHNlCj4gICAgIDIxMCAgICAgICAgICAgICAgICAgcHJfaW5mbygiTm8gcGFydGl0
aW9uIGluIE9GIG1hdGNoZXMgcGFydGl0aW9uIElEIHdpdGggJ1NDIFBBUlQgTUFQJy5cbiIpOwo+
ICAgICAyMTEgCj4gICAgIDIxMiAgICAgICAgIG9mX25vZGVfcHV0KHBwKTsKPiAgICAgMjEzIAo+
ICAgICAyMTQgZnJlZToKPiAgICAgMjE1ICAgICAgICAga2ZyZWUoc2NwYXJ0X21hcCk7Cj4gICAg
IDIxNiAgICAgICAgIGlmIChyZXMgPD0gMCkKPiAgICAgMjE3ICAgICAgICAgICAgICAgICBrZnJl
ZShwYXJ0cyk7Cj4gICAgIDIxOCAKPiAgICAgMjE5IG91dDoKPiAgICAgMjIwICAgICAgICAgcmV0
dXJuIHJlczsKPiAgICAgMjIxIH0KPgo+IHJlZ2FyZHMsCj4gZGFuIGNhcnBlbnRlcgoKLS0gCkJl
c3QgcmVnYXJkcywKTWlraGFpbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
