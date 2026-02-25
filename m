Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFC7FD3764
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Feb 2026 15:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tzt+bbGqkg8oZDXC9mAOPAybXjdBPY6yK4oKUM/OHjg=; b=RVFBtuFdGRJ9s8
	KW8tOCU1wwubSDVACuK3tyYOMRLBRK4tMocx3YzU+X4a/GYJGIgISbqm38YkUDxhrRpOq+dFPzlem
	ENWntCfuatwkiDSZpdtH3pAHtb0Ky23nU4cw3nZK0SdE9KeqgokPmZ2hGgGhypWpCtL5IzoloHGUQ
	/3yvntu+ADx69v2sJDkpShABswDlOEctCKcmQ5qSsuqDIRVWMXO4I9zCTK1qok3qDHO+p8dQeVl4Y
	NjXSzO2WjZLfTpS3qnOY05J8DA+BnOAIdzCRxVTAI48Yb+CPTG37K7FzP521LRFFwagMzDAcS55kw
	hYz3DagKfUZiJ8npI3xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvGPS-00000004F0m-1Jou;
	Wed, 25 Feb 2026 15:02:42 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvGPO-00000004F0R-3GOu
	for linux-mtd@lists.infradead.org;
	Wed, 25 Feb 2026 15:02:41 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8249fc726e9so3497326b3a.2
        for <linux-mtd@lists.infradead.org>; Wed, 25 Feb 2026 07:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772031757; x=1772636557; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=39IJkvk2kX49TPaa7PDmuI2YnzriAyXRaiBPlWFy4J0=;
        b=a35elL9NHKKm4w6Gr+6h70P3Aq2eFGODQUqFVkiJ15gG4wF05QH02O4ihpCGx0arx7
         vRlJIoH5mEqJKo4ReGu7L087GItTz1qNIt00L4bMhaumVsjpkOSCOG3bKajEhtLDvlX4
         0MwMFAKbNOt0ZAld2ZJH3HbhEtFVPkoIcxW8vah1kUR7MdZ7TXsUQ0uHKVqWaEj9tLsy
         RUD4QahlENy8JxpRDDOhBWWXO/OnxPhd6oHULa+yMJIURy27j6B8eUAlwlqvhNkscwZX
         H3IdUtia2Nxl9NghAwRp7+NJAE5VvdD8gNZeaIzXsTI6nPLUluLyQpkK+/Sw2V9RKwVi
         W40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772031757; x=1772636557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=39IJkvk2kX49TPaa7PDmuI2YnzriAyXRaiBPlWFy4J0=;
        b=LwcyeP2mxUWXygVE5ePl+AwX1X9C7hyjD+EN1lkfpqTl0TK+qzu2GFy7xpVdWhQHJk
         cZUP3Cg6rfV68cavvbc6Z/mzEjlrAILaM7GIuXgrNd8rL+ygJ32BDVdOWghsRwwlxSCK
         OKg+6/Q8w/irsFIJ+Km6ChkgRF1F8h6EYgJuFRgZYBM6hUTg5WtXVHu8vb66aDotBn9+
         zyBPdbH4f2jT4suJu223E6UMkjgZElr2KZjZ3fXWNoEmHNVy/VKsExiFEZwLTg0JIOE5
         jV1JnuVll9j/vGVRyaoekU6jkhSl0D0edxfKnLqCZ34tYdJ9sc1B0PEmlXo2nK9ONL66
         WZ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTyS06LbB4uAaRQbEQ5uFUDroHDjw+ja5mT92Xl6F4d6tz7cbrxx6oip6ey2Vi0cxfcp+w8H3VSo0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyO6v4JzcT3+HKO5J+CjdL7H9RKaV0EgvOOm/vKMnid9P7dlQWY
	r83BKMij07OR+jwH9QA8dxdEbEtkbxPzUKYZuQ+z8NjXRHG563/VxJJC
X-Gm-Gg: ATEYQzy14yryPjPFuKsqjd/3QlIlZ8feT19+cMAmGtBLu8xTSFv8LUxwQa85J0FViUy
	5mf/GH7SaR2pddVaarF59dhjljXWwlB4kUWtbZGVL8ulB2hBuo2l4eL1eLBaz2ficJHv8VQ/2qw
	SPSKn1XG7SpnV1Nfdz+XjajuSzgQlXrWNwniKXMgcjAKH+v+pKj5ID7Q4+FM1Bn2u3xNhXLtBxC
	/PkG+9NcaXu9+PUMuUqMcdiRdPDuBtmnVNZuw6HT3j8wohpBBd6+LcJNJX1lgZKV5HqeTC3dy2M
	/o4Ge8I+Y166jg2Si/UZpV2N2lN1tCJ1dGD/44PWKciWr2ONuWNY/yvggYAT16HuK/cynreAnoK
	XaM1pwUSBUiptwgWmhXVltY1rNhvqXemWAE61rzMxEHFfZ/7pnJkunTDsHVXqzXjNCWKJNx09VG
	YJkGbGroqd+u9Tq0RG+oxbIqoRQeyYaqwLnwnJ07wBkcnuHe8POtTdckNeVZGrNrj3z/qoMXxhf
	vcTTkJi9ZYdJBsZqvivyg==
X-Received: by 2002:a05:6a00:301f:b0:822:bd7:e949 with SMTP id d2e1a72fcca58-827338ebb77mr601498b3a.57.1772031756996;
        Wed, 25 Feb 2026 07:02:36 -0800 (PST)
Received: from ?IPV6:2401:4900:892f:f52a:c575:426a:cd40:5f5d? ([2401:4900:892f:f52a:c575:426a:cd40:5f5d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd688aa7sm14631808b3a.14.2026.02.25.07.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 07:02:36 -0800 (PST)
Message-ID: <4f9f988a-5f3a-463f-aabe-aac1b018bd93@gmail.com>
Date: Wed, 25 Feb 2026 20:32:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mtd: st,spear600-smi: convert to DT schema
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260122-spear-v1-1-fd44bc79695b@gmail.com>
 <CAL_JsqJhnuWzPxUWywZkjt=zc0nSFKP7hM_ekmKKr7p_jXaaag@mail.gmail.com>
Content-Language: en-US
From: Akhila YS <akhilayalmati@gmail.com>
In-Reply-To: <CAL_JsqJhnuWzPxUWywZkjt=zc0nSFKP7hM_ekmKKr7p_jXaaag@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_070238_857893_728DF1BE 
X-CRM114-Status: GOOD (  19.59  )
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

Ck9uIDEwLTAyLTIwMjYgMTk6MTcsIFJvYiBIZXJyaW5nIHdyb3RlOgo+IE9uIFRodSwgSmFuIDIy
LCAyMDI2IGF0IDEwOjIz4oCvQU0gQWtoaWxhIFlTIDxha2hpbGF5YWxtYXRpQGdtYWlsLmNvbT4g
d3JvdGU6Cj4+IENvbnZlcnQgU1RNaWNyb2VsZWN0cm9uaWNzIFNQRUFyNjAwIFNlcmlhbCBNZW1v
cnkgSW50ZXJmYWNlIChTTUkpCj4+IENvbnRyb2xsZXIgYmluZGluZyB0byBZQU1MIGZvcm1hdC4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogQWtoaWxhIFlTIDxha2hpbGF5YWxtYXRpQGdtYWlsLmNvbT4K
Pj4gLS0tCj4+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvc3BlYXJfc21pLnR4dCAgICAg
ICAgICB8IDI5IC0tLS0tLS0tLQo+PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3N0LHNw
ZWFyNjAwLXNtaS55YW1sICAgfCA3MiArKysrKysrKysrKysrKysrKysrKysrCj4+ICAyIGZpbGVz
IGNoYW5nZWQsIDcyIGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9zcGVhcl9zbWkudHh0
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9zcGVhcl9zbWkudHh0Cj4+
IGRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCBjNDE4NzNlOTJkMjYuLjAwMDAwMDAw
MDAwMAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3NwZWFy
X3NtaS50eHQKPj4gKysrIC9kZXYvbnVsbAo+PiBAQCAtMSwyOSArMCwwIEBACj4+IC0qIFNQRUFy
IFNNSQo+PiAtCj4+IC1SZXF1aXJlZCBwcm9wZXJ0aWVzOgo+PiAtLSBjb21wYXRpYmxlIDogInN0
LHNwZWFyNjAwLXNtaSIKPj4gLS0gcmVnIDogQWRkcmVzcyByYW5nZSBvZiB0aGUgbXRkIGNoaXAK
Pj4gLS0gI2FkZHJlc3MtY2VsbHMsICNzaXplLWNlbGxzIDogTXVzdCBiZSBwcmVzZW50IGlmIHRo
ZSBkZXZpY2UgaGFzIHN1Yi1ub2Rlcwo+PiAtICByZXByZXNlbnRpbmcgcGFydGl0aW9ucy4KPj4g
LS0gaW50ZXJydXB0czogU2hvdWxkIGNvbnRhaW4gdGhlIFNUTU1BQyBpbnRlcnJ1cHRzCj4+IC0t
IGNsb2NrLXJhdGUgOiBGdW5jdGlvbmFsIGNsb2NrIHJhdGUgb2YgU01JIGluIEh6Cj4+IC0KPj4g
LU9wdGlvbmFsIHByb3BlcnRpZXM6Cj4+IC0tIHN0LHNtaS1mYXN0LW1vZGUgOiBGbGFzaCBzdXBw
b3J0cyByZWFkIGluIGZhc3QgbW9kZQo+PiAtCj4+IC1FeGFtcGxlOgo+PiAtCj4+IC0gICAgICAg
c21pOiBmbGFzaEBmYzAwMDAwMCB7Cj4+IC0gICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInN0
LHNwZWFyNjAwLXNtaSI7Cj4+IC0gICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsK
Pj4gLSAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDE+Owo+PiAtICAgICAgICAgICAgICAg
cmVnID0gPDB4ZmMwMDAwMDAgMHgxMDAwPjsKPj4gLSAgICAgICAgICAgICAgIGludGVycnVwdC1w
YXJlbnQgPSA8JnZpYzE+Owo+PiAtICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwxMj47Cj4+
IC0gICAgICAgICAgICAgICBjbG9jay1yYXRlID0gPDUwMDAwMDAwPjsgICAgICAgIC8qIDUwTUh6
ICovCj4+IC0KPj4gLSAgICAgICAgICAgICAgIGZsYXNoQGY4MDAwMDAwIHsKPj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgc3Qsc21pLWZhc3QtbW9kZTsKPj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgLi4uCj4+IC0gICAgICAgICAgICAgICB9Owo+PiAtICAgICAgIH07Cj4+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3N0LHNwZWFyNjAwLXNtaS55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9zdCxzcGVhcjYwMC1z
bWkueWFtbAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjhm
ZTI3YWFlNzUyNwo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tdGQvc3Qsc3BlYXI2MDAtc21pLnlhbWwKPj4gQEAgLTAsMCArMSw3MiBA
QAo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNl
KQo+PiArJVlBTUwgMS4yCj4+ICstLS0KPj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3Nj
aGVtYXMvbXRkL3N0LHNwZWFyNjAwLXNtaS55YW1sIwo+PiArJHNjaGVtYTogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4+ICsKPj4gK3RpdGxlOiBTVE1pY3Jv
ZWxlY3Ryb25pY3MgU1BFQXI2MDAgU2VyaWFsIE1lbW9yeSBJbnRlcmZhY2UgKFNNSSkgQ29udHJv
bGxlcgo+PiArCj4+ICttYWludGFpbmVyczoKPj4gKyAgLSBSaWNoYXJkIFdlaW5iZXJnZXIgPHJp
Y2hhcmRAbm9kLmF0Pgo+PiArCj4+ICtkZXNjcmlwdGlvbjoKPj4gKyAgVGhlIFNQRUFyNjAwIFNl
cmlhbCBNZW1vcnkgSW50ZXJmYWNlIChTTUkpIGlzIGEgZGVkaWNhdGVkIHNlcmlhbCBmbGFzaAo+
PiArICBjb250cm9sbGVyIHN1cHBvcnRpbmcgdXAgdG8gZm91ciBjaGlwIHNlbGVjdHMgZm9yIHNl
cmlhbCBOT1IgZmxhc2hlcwo+PiArICBjb25uZWN0ZWQgaW4gcGFyYWxsZWwuIFRoZSBjb250cm9s
bGVyIGlzIG1lbW9yeS1tYXBwZWQgYW5kIHRoZSBhdHRhY2hlZAo+PiArICBmbGFzaCBkZXZpY2Vz
IGFwcGVhciBpbiB0aGUgQ1BVIGFkZHJlc3Mgc3BhY2UuVGhlIGRyaXZlcgo+PiArICAoZHJpdmVy
cy9tdGQvZGV2aWNlcy9zcGVhcl9zbWkuYykgcHJvYmVzIHRoZSBhdHRhY2hlZCBmbGFzaGVzCj4+
ICsgIGR5bmFtaWNhbGx5IGJ5IHNlbmRpbmcgY29tbWFuZHMgKGUuZy4sIFJESUQpIHRvIGVhY2gg
YmFuay4KPj4gKyAgRmxhc2ggc3ViIG5vZGVzIGRlc2NyaWJlIHRoZSBtZW1vcnkgcmFuZ2UgYW5k
IG9wdGlvbmFsIHBlci1mbGFzaAo+PiArICBwcm9wZXJ0aWVzLgo+PiArCj4+ICthbGxPZjoKPj4g
KyAgLSAkcmVmOiBtdGQueWFtbCMKPj4gKwo+PiArcHJvcGVydGllczoKPj4gKyAgY29tcGF0aWJs
ZToKPj4gKyAgICBjb25zdDogc3Qsc3BlYXI2MDAtc21pCj4+ICsKPj4gKyAgcmVnOgo+PiArICAg
IG1heEl0ZW1zOiAxCj4+ICsKPj4gKyAgaW50ZXJydXB0czoKPj4gKyAgICBtYXhJdGVtczogMQo+
PiArCj4+ICsgICIjYWRkcmVzcy1jZWxscyI6Cj4+ICsgICAgY29uc3Q6IDEKPj4gKwo+PiArICAi
I3NpemUtY2VsbHMiOgo+PiArICAgIGNvbnN0OiAxCj4+ICsKPj4gKyAgY2xvY2stcmF0ZToKPj4g
KyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKPj4gKyAg
ICBkZXNjcmlwdGlvbjogRnVuY3Rpb25hbCBjbG9jayByYXRlIG9mIHRoZSBTTUkgY29udHJvbGxl
ciBpbiBIei4KPj4gKwo+PiArICBzdCxzbWktZmFzdC1tb2RlOgo+PiArICAgIHR5cGU6IGJvb2xl
YW4KPj4gKyAgICBkZXNjcmlwdGlvbjogSW5kaWNhdGVzIHRoYXQgdGhlIGF0dGFjaGVkIGZsYXNo
IHN1cHBvcnRzIGZhc3QgcmVhZCBtb2RlLgo+PiArCj4+ICtyZXF1aXJlZDoKPj4gKyAgLSBjb21w
YXRpYmxlCj4+ICsgIC0gcmVnCj4+ICsgIC0gY2xvY2stcmF0ZQo+PiArCj4+ICt1bmV2YWx1YXRl
ZFByb3BlcnRpZXM6IGZhbHNlCj4+ICsKPj4gK2V4YW1wbGVzOgo+PiArICAtIHwKPj4gKyAgICBm
bGFzaEBmYzAwMDAwMCB7Cj4+ICsgICAgICAgIGNvbXBhdGlibGUgPSAic3Qsc3BlYXI2MDAtc21p
IjsKPj4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4+ICsgICAgICAgICNzaXplLWNl
bGxzID0gPDE+Owo+PiArICAgICAgICByZWcgPSA8MHhmYzAwMDAwMCAweDEwMDA+Owo+PiArICAg
ICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZ2aWMxPjsKPj4gKyAgICAgICAgaW50ZXJydXB0cyA9
IDwxMj47Cj4+ICsgICAgICAgIGNsb2NrLXJhdGUgPSA8NTAwMDAwMDA+OyAgLyogNTAgTUh6ICov
Cj4+ICsKPj4gKyAgICAgICAgZmxhc2hAZjgwMDAwMDAgewo+IFRoaXMgaXMgbm93IGEgd2Fybmlu
ZyBpbiBsaW51eC1uZXh0Ogo+Cj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9zdCxzcGVhcjYwMC1zbWkuZXhhbXBsZS5kdGI6Cj4gZmxhc2hAZmMwMDAwMDAgKHN0LHNwZWFy
NjAwLXNtaSk6IFVuZXZhbHVhdGVkIHByb3BlcnRpZXMgYXJlIG5vdAo+IGFsbG93ZWQgKCdmbGFz
aEBmODAwMDAwMCcgd2FzIHVuZXhwZWN0ZWQpCj4gICAgICAgICBmcm9tIHNjaGVtYSAkaWQ6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL210ZC9zdCxzcGVhcjYwMC1zbWkueWFtbAo+Cj4g
UGxlYXNlIHNlbmQgYSBmaXggKGFuZCB0ZXN0IHlvdXIgc2NoZW1hcyBiZWZvcmUgc2VuZGluZyku
CgoKU3VyZSwgaSB3aWxsIHJlc29sdmUgdGhhdCBpc3N1ZSBhbmQgc2VuZCBhIG5leHQgdmVyc2lv
bi4KCj4KPiBSb2IKCi0tIApCZXN0IFJlZ2FyZHMsCkFraGlsYS4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
