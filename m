Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A592C7EE26
	for <linux-mtd@archiver.kernel.org>; Mon, 22 May 2023 09:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PXcXRMczvgj0pAlJ/BNsdmaHjxaCcgFDgPul22RF8Zk=; b=pbFGagpc6gcE09
	HRLR+cA4oD3Cosi7fQanI6O7g522KRygGtzD1cbj/W6ItqqofZY7ru5fPJ69z3MLsFOu+xRZd7YsV
	N7rfWDDIvF2ZZVyFAqnQUI/ngJImToqIKlQ2pDUsB3FfB8pXkm0T86WzQIxJAaHis9bGFcso3xCZc
	gGRhFicJEr3gMs3h+AjWFjXxHF2gtXFOFUOcPtTKFkwlHc24eoWbeQIxZ0Fbx9zGNdzFia3Lha+ln
	ulDWyoZmOl+eBCkWfWq5Qyg3LMhwAB84g0ksQH8U1mNoRYyROZ0fdPdQNMq1JKztAuYmstynxCMoI
	8xxCqAHFrJLq8c1wktYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q11wZ-005t6N-1y;
	Mon, 22 May 2023 09:35:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q11wU-005t5c-1g
	for linux-mtd@lists.infradead.org;
	Mon, 22 May 2023 09:35:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684748099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s0HWbIz79jqstRiiPOG36SG7ZPFhmVB7Gw9iEKt9R5M=;
	b=gJCblsum5JrPO77P+NOUHW964CO6PhsfUq/b3HS3tehrSJs6H+opmSzvL16bVSchxG//G4
	uK744ePA6RaOmlQuEXYZ+z4iPkZdTJorfI3Hgs4QvN38v9kFnqoxSLcVShWROb9k7Dvig5
	i0Ai5UPV1dp9mX1aH7rHIcL4TOiWiKw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-Wrq7rjlXObGBtpbXKYxIeg-1; Mon, 22 May 2023 05:34:58 -0400
X-MC-Unique: Wrq7rjlXObGBtpbXKYxIeg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9662ead7bf8so572061966b.0
        for <linux-mtd@lists.infradead.org>; Mon, 22 May 2023 02:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684748097; x=1687340097;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s0HWbIz79jqstRiiPOG36SG7ZPFhmVB7Gw9iEKt9R5M=;
        b=UBQz2fbMmWU7Km28HFpsRck/rmleDw/jH84uUpJco0Xh2Y7ubWPrXrZ9UFUd1/4W5g
         kfORaQjExHz7KetCvZcJsVNZiUUjC6LsSuATLh346wejsUFUKi8o5ACNcNoSITikfgLZ
         hnku+YAzaESz1IjsTi5muAkRbGPkxqT/XlRn3qtvPPcOLOwucfvKFUr0hjYUUwm4kz47
         ap4YU3YN/Ua26Llrw9hZMIBi+/UY/sOP+hPYHFPQ3yIa8WmRlXxoZvHO1LCBEOrQuGwJ
         0gdUQuHWa8qNHV30Db/nR3YO6eq0sKgpp/sOi+CPTGynAvHJHK6rAS4hmFY+Mj8mM4Jd
         1c0w==
X-Gm-Message-State: AC+VfDxDCWiGVkqJ8Xb0qOmMDtpQrmJXAUNGjMtZyFfLPeFGKfRlJXzq
	PWK9Dy4gnV3ynPOu4bFkbv9FuvvtRUx9ZWDp08lBCIlxCzr6sNkA0s/KbzpnuXT1ywp+JeJyJho
	w2elnOYZ3G8ckBdCeDY1VGLYGmA==
X-Received: by 2002:a17:907:7d91:b0:960:c5fe:a36a with SMTP id oz17-20020a1709077d9100b00960c5fea36amr9989517ejc.61.1684748097142;
        Mon, 22 May 2023 02:34:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7G4Aabt20UoUt7U2d6KfSkBhUKt1mY2DF39rXsEP+ph95Qg6sN5V8w3ZfmrgnR/H/Dk6NszA==
X-Received: by 2002:a17:907:7d91:b0:960:c5fe:a36a with SMTP id oz17-20020a1709077d9100b00960c5fea36amr9989503ejc.61.1684748096739;
        Mon, 22 May 2023 02:34:56 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id j27-20020a170906535b00b0096f4c9ce526sm2950604ejo.225.2023.05.22.02.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 02:34:56 -0700 (PDT)
Message-ID: <e7d682f3-c1a3-6ddb-5854-8e814dd66333@redhat.com>
Date: Mon, 22 May 2023 11:34:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] mtd: spi-nor: Fix divide by zero for spi-nor-generic
 flashes
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, todd.e.brandt@intel.com, vigneshr@ti.com,
 pratyush@kernel.org, michael@walle.cc, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, regressions@leemhuis.info,
 bagasdotme@gmail.com, regressions@lists.linux.dev, joneslee@google.com,
 Todd Brandt <todd.e.brandt@linux.intel.com>
References: <20230518085440.2363676-1-tudor.ambarus@linaro.org>
 <20230522102953.2fdf2b02@xps-13>
 <0c8a54ae-7f32-2614-9717-a00fe561513e@linaro.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <0c8a54ae-7f32-2614-9717-a00fe561513e@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_023502_662018_34FF568B 
X-CRM114-Status: GOOD (  33.16  )
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

SGksCgpPbiA1LzIyLzIzIDExOjIyLCBUdWRvciBBbWJhcnVzIHdyb3RlOgo+IAo+IAo+IE9uIDUv
MjIvMjMgMDk6MjksIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+IEhpIFR1ZG9yLAo+IAo+IEhpLCBN
aXF1ZWwsCj4gCj4+Cj4+IHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZyB3cm90ZSBvbiBUaHUsIDE4
IE1heSAyMDIzIDA4OjU0OjQwICswMDAwOgo+Pgo+Pj4gV2UgZmFpbGVkIHRvIGluaXRpYWxpemUg
bl9iYW5rcyBmb3Igc3BpLW5vci1nZW5lcmljIGZsYXNoZXMsIHdoaWNoCj4+PiBjYXVzZWQgYSBk
ZXZpZGUgYnkgemVybyB3aGVuIGNvbXB1dGluZyB0aGUgYmFua19zaXplLgo+Pj4KPj4+IEJ5IGRl
ZmF1bHQgd2UgY29uc2lkZXIgdGhhdCBhbGwgY2hpcHMgaGF2ZSBhIHNpbmdsZSBiYW5rLiBJbml0
aWFsaXplCj4+PiB0aGUgZGVmYXVsdCBudW1iZXIgb2YgYmFua3MgZm9yIHNwaS1ub3ItZ2VuZXJp
YyBmbGFzaGVzLiBFdmVuIGlmIHRoZQo+Pj4gYnVnIGlzIGZpeGVkIHdpdGggdGhpcyBzaW1wbGUg
aW5pdGlhbGl6YXRpb24sIGNoZWNrIHRoZSBuX2JhbmtzIHZhbHVlCj4+PiBiZWZvcmUgZGl2aWRp
bmcgc28gdGhhdCB3ZSBtYWtlIHN1cmUgdGhpcyBraW5kIG9mIGJ1ZyB3b24ndCBvY2N1ciBhZ2Fp
bgo+Pj4gaWYgc29tZSBvdGhlciBzdHJ1Y3QgaW5zdGFuY2UgaXMgY3JlYXRlZCB1bmluaXRpYWxp
emVkLgo+Pj4KPj4+IFN1Z2dlc3RlZC1ieTogVG9kZCBCcmFuZHQgPHRvZGQuZS5icmFuZHRAbGlu
dXguaW50ZWwuY29tPgo+Pj4gUmVwb3J0ZWQtYnk6IFRvZGQgQnJhbmR0IDx0b2RkLmUuYnJhbmR0
QGxpbnV4LmludGVsLmNvbT4KPj4+IENsb3NlczogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3Jn
L3Nob3dfYnVnLmNnaT9pZD0yMTc0NDgKPj4+IEZpeGVzOiA5ZDZjNWQ2NGYwMjggKCJtdGQ6IHNw
aS1ub3I6IEludHJvZHVjZSB0aGUgY29uY2VwdCBvZiBiYW5rIikKPj4+IExpbms6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDUxNjIyNTEwOC4yOTE5NC0xLXRvZGQuZS5icmFuZHRA
aW50ZWwuY29tLwo+Pj4gU2lnbmVkLW9mZi1ieTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1
c0BsaW5hcm8ub3JnPgo+Pj4gLS0tCj4+PiAgZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgfCA1
ICsrKystCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyBiL2RyaXZl
cnMvbXRkL3NwaS1ub3IvY29yZS5jCj4+PiBpbmRleCAwYmIwYWQxNGEyZmMuLjVmMjlmYWM4NjY5
YSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4+PiArKysgYi9k
cml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+Pj4gQEAgLTIwMTgsNiArMjAxOCw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qgc3BpX25vcl9tYW51ZmFjdHVyZXIgKm1hbnVmYWN0dXJlcnNbXSA9IHsK
Pj4+ICAKPj4+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8gc3BpX25vcl9nZW5lcmlj
X2ZsYXNoID0gewo+Pj4gIAkubmFtZSA9ICJzcGktbm9yLWdlbmVyaWMiLAo+Pj4gKwkubl9iYW5r
cyA9IDEsCj4+Cj4+IEkgZGVmaW5pdGVseSBtaXNzZWQgdGhhdCBzdHJ1Y3R1cmUuCj4+Cj4+PiAg
CS8qCj4+PiAgCSAqIEpFU0QyMTYgcmV2IEEgZG9lc24ndCBzcGVjaWZ5IHRoZSBwYWdlIHNpemUs
IHRoZXJlZm9yZSB3ZSBuZWVkIGEKPj4+ICAJICogc2FuZSBkZWZhdWx0Lgo+Pj4gQEAgLTI5MjEs
NyArMjkyMiw4IEBAIHN0YXRpYyB2b2lkIHNwaV9ub3JfbGF0ZV9pbml0X3BhcmFtcyhzdHJ1Y3Qg
c3BpX25vciAqbm9yKQo+Pj4gIAlpZiAobm9yLT5mbGFncyAmIFNOT1JfRl9IQVNfTE9DSyAmJiAh
bm9yLT5wYXJhbXMtPmxvY2tpbmdfb3BzKQo+Pj4gIAkJc3BpX25vcl9pbml0X2RlZmF1bHRfbG9j
a2luZ19vcHMobm9yKTsKPj4+ICAKPj4+IC0Jbm9yLT5wYXJhbXMtPmJhbmtfc2l6ZSA9IGRpdjY0
X3U2NChub3ItPnBhcmFtcy0+c2l6ZSwgbm9yLT5pbmZvLT5uX2JhbmtzKTsKPj4+ICsJaWYgKG5v
ci0+aW5mby0+bl9iYW5rcyA+IDEpCj4+PiArCQlwYXJhbXMtPmJhbmtfc2l6ZSA9IGRpdjY0X3U2
NChwYXJhbXMtPnNpemUsIG5vci0+aW5mby0+bl9iYW5rcyk7Cj4+Cj4+IEknbSBmaW5lIHdpdGgg
dGhlIGNoZWNrIGFzIGl0IGlzIHdyaXR0ZW4gYmVjYXVzZSBpdCBhbHNvIGxvb2sgbGlrZSBhbgo+
PiBvcHRpbWl6YXRpb24sIGJ1dCBiYW5rX3NpemUgc2hvdWxkIG5ldmVyIGJlIDAgb3RoZXJ3aXNl
IGl0J3MgYSByZWFsIGJ1Zwo+IAo+IGJhbmtfc2l6ZSB3YXMgaW50cm9kdWNlZCBqdXN0IGZvciBj
aGlwcyBmZWF0dXJpbmcgc2V2ZXJhbCBiYW5rcywgYnV0IHdlCj4gbWFkZSB0aGlzIGZpZWxkIG1h
bmRhdG9yeSBmb3IgYWxsIGZsYXNoZXMsIHJlZ2FyZGxlc3Mgb2YgdGhlaXIgdHlwZS4gSQo+IGZp
bmQgdGhpcyByZXN0cmljdGlvbiB1bm5lY2Vzc2FyeSwgYmVjYXVzZSB3ZSBjYW4gZGlmZmVyZW50
aWF0ZSB0aGUgUldXCj4gZmxhc2hlcyBieSBjaGVja2luZyB0aGUgU05PUl9GX1JXVyBmbGFnLiBT
byB0aGUgYWx0ZXJuYXRpdmUgdG8gdGhpcwo+IHBhdGNoIGlzIHRvIHJlbW92ZSB0aGUgbl9iYW5r
cyByZXN0cmljdGlvbiBhbmQgc2V0IGl0IGp1c3QgZm9yIHRoZSBSV1cKPiBmbGFzaGVzLiBJIHRo
aW5rIEkgcHJlZmVyIHRoaXMsIGJ1dCBrZWVwIGluIG1pbmQgdGhhdCBJIG5ldmVyIHJlYWQgYSBS
V1cKPiBmbGFzaCdzIGRhdGFzaGVldCwgbm90IHB1YmxpY2x5IGF2YWlsYWJsZSwgc28gdGhlIGRl
Y2lzaW9uIGlzIGluIHlvdXIKPiBjb3VydC4gSGFwcHkgdG8gbWFrZSBhIHBhdGNoLgoKU2luY2Ug
dGhpcyBpcyBjYXVzaW5nIGEgc2VyaW91cyByZWdyZXNzaW9uIGNhdXNpbmcgcGVvcGxlJ3MgbGFw
dG9wcyB0byBoYW5nCm9uIHN1c3BlbmQgSSBiZWxpZXZlIGl0IHdvdWxkIGJlIGJlc3QgdG8gcXVl
dWUgdXAgdGhlIHNpbXBsZXN0IGZpeCBmb3IKdGhpcyAod2hpY2ggc2VlbXMgdG8gYmUgdGhpcyBw
YXRjaCBhcyBpcykgZm9yIDYuNCBhc2FwLgoKQW55IG1vcmUgaW52b2x2ZWQgY2hhbmdlcyB0byBm
aXggdGhpcyBpbiBhIGJldHRlciB3YXkgY2FuIHRoZW4gYmUgYWRkZWQKb24gdG9wIGZvciB0aGUg
Ni41IGN5Y2xlLgoKUmVnYXJkcywKCkhhbnMKCgoKPiAKPj4gdGhhdCBtdXN0IGJlIGNhdGNoIGFu
ZCBmaXhlZC4gV2UgZG8gbm90IHdhbnQgdW5pbml0aWFsaXplZCBiYW5rX3NpemUncy4+Cj4+PiAg
fQo+Pj4gIAo+Pj4gIC8qKgo+Pj4gQEAgLTI5ODcsNiArMjk4OSw3IEBAIHN0YXRpYyB2b2lkIHNw
aV9ub3JfaW5pdF9kZWZhdWx0X3BhcmFtcyhzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+Pj4gIAkvKiBT
ZXQgU1BJIE5PUiBzaXplcy4gKi8KPj4+ICAJcGFyYW1zLT53cml0ZXNpemUgPSAxOwo+Pj4gIAlw
YXJhbXMtPnNpemUgPSAodTY0KWluZm8tPnNlY3Rvcl9zaXplICogaW5mby0+bl9zZWN0b3JzOwo+
Pj4gKwlwYXJhbXMtPmJhbmtfc2l6ZSA9IHBhcmFtcy0+c2l6ZTsKPj4+ICAJcGFyYW1zLT5wYWdl
X3NpemUgPSBpbmZvLT5wYWdlX3NpemU7Cj4+Cj4+IFdlIGFjdHVhbGx5IGRpc2NhcmRlZCB0aGF0
IGxpbmUgaW4gYSBwcmV2aW91cyBkaXNjdXNzaW9uOgo+PiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1tdGQvMjAyMzAzMzExOTQ2MjAuODM5ODk5LTEtbWlxdWVsLnJheW5hbEBib290bGlu
LmNvbS9ULyNtY2I0ZjkwZjdjYTQ4ZmZlM2Q5ODM4YjJhYzZmNzRlNDQ0NjBjNTFiZAo+Pgo+PiBJ
J20gZmluZSB0byByZS1hZGQgaXQgdGhvdWdoLCBpdCBkb2VzIG5vdCBodXJ0Lgo+IAo+IHdlIHdv
dWxkIGdldCByaWQgb2YgdGhpcyBpbml0IGFzIHdlbGwgd2l0aCBteSBzdWdnZXN0aW9uLgo+IAo+
IEtlZXAgaW4gbWluZCB0aGF0IHRoZSBidWcgd2FzIGludHJvZHVjZWQgaW4gNi40LCBzbyB3ZSds
bCBoYXZlIHRvIGZpeAo+IHRoaXMgZmFzdCwgbGV0J3MgY29tZSB0byBhbiBhZ3JlZW1lbnQuCj4g
Cj4gQ2hlZXJzLAo+IHRhCj4+Cj4+PiAgCj4+PiAgCWlmICghKGluZm8tPmZsYWdzICYgU1BJX05P
Ul9OT19GUikpIHsKPj4KPj4gUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+Cj4+Cj4+IFRoYW5rcywKPj4gTWlxdcOobAo+IAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
