Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5BEC27C4F
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jun 2024 19:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uHatl0N/bbCi6nFuQn3nQuNRoVZuHTL4bQmu8OCxfCg=; b=j6TR+rb2QdUaPg
	M+g1EhvQc8Hms4J8q/XPt9YuRb0uiFmf9dslqhKKeCsM2i0+kKEoXkJOY2I83jAmlV5hapFd4sfDU
	TKwyQnTja2tX/9bLCcNiBQmvIu8y5vVhQ76tEg6W/nGTARYXnf2LjBcuv+n+I6nE8X5ovlghtbLQB
	SwayC3sgCEu58TMwCESXNFR/+uYpHKHJ6RIjUy+M1BQvrXjREAxutLOj+eUinRPGN9WgBUGcTJVQG
	7/Mw+7zwI61N825PioPfS6KKa35SXw3y96fuwnlvApmAXY+hLkoyIPyCJSjLiR4zo76JeZ+fT3QD4
	VyY7q0SammWTlhbLy+lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMYRr-000000084RJ-2Vn6;
	Wed, 26 Jun 2024 19:36:55 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMYRo-000000084QD-3eba
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jun 2024 19:36:54 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1f6a837e9a3so44169425ad.1
        for <linux-mtd@lists.infradead.org>; Wed, 26 Jun 2024 12:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719430612; x=1720035412; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vI/G2M6/DnhclQ23YmF7z6fxJkOQgUE5s0q5OISdr3c=;
        b=UUTJlyV+zP6x/Zo4gqqwNMIB0Vn1iuEjpFNQA5OiF7ohr4bJPKOHobzuMs/0dx4tpS
         fPOnYskOAqW0cQrEjZMpD2kq88yHgwwoM7YFZ8v3dD3x3Omz3Mv8fmH7SBCeRWav53Pv
         lDYLCeugdGJkvqojxla1ksvyAg9t6DyMmZiBayaKiGZRgNkaz/vdmZ+hapK1Gbi/Mhhx
         efnv5x9elQbvWocuzMPh83ZD+ormrbMBgMiDDWaFt8uLVSas2ec7qnmXgzuk1vHc5bRt
         +8os+24MOKndrUDUz2DQyFVWcFa3+KdQQqkShcrti7x40bbaAE7wCi16JKN1V0dlC0bN
         Utrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719430612; x=1720035412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vI/G2M6/DnhclQ23YmF7z6fxJkOQgUE5s0q5OISdr3c=;
        b=w+7U8+WRJlzq9r+Mm+yQLSYyvxEqknL+qC6/GizQrVw++xfM7yIrmMeV1zSngPz30R
         HYGVJEKzCkGSH6f791xOQXghBz7tJt+U+ipRQ9CIpyvrG5s6E76H0cU3+39ctXKEooyV
         43fietmGgxBqE52fBtWNnjFfW0K6dXX0o4ZoC88OuepKc20H+qyRaWXqNirvXymVPJmx
         kNsvXfKunYA5vBgDUvm0l3qFfAEl4Xq6cXCK4tqM8yoV8oJNxs7TRPsH4dKM4foif7aV
         A1H4Pmdn1HtXQayl+rKgMWkOjFk60bX+RI51escxHOpqhOwC2oBHEYiJCeXYooG0H3IB
         Edpw==
X-Forwarded-Encrypted: i=1; AJvYcCUkm+QG9xsNic/wATZyJHgUIiFOP4kY1TN3FiNLnPFPpJFLC/UqBhVhF3JB0FHRT4/V+dFs+Rie4L6rqJkNTEQpqDPmAt7o8ATfyAYhtA==
X-Gm-Message-State: AOJu0Ywn8+no7fRuFertE7vnLbQtRbRwlcRNKN07iUEzGvzkshqVRKYf
	/Gc+Wl7+owkTLOUbpyNj9Cql1FJo1lm9nqOe+UJjdRu3UFvyFNYWzFXY9g==
X-Google-Smtp-Source: AGHT+IEqqy57kS3qvrLUYreixvBasmDit4yuFEV2ZRcy6tF0cDi2+wYviqf2XQB1DqkIJSI0UB8Jdg==
X-Received: by 2002:a17:902:c401:b0:1fa:2277:f56c with SMTP id d9443c01a7336-1fa23fbeb3fmr123243985ad.41.1719430611908;
        Wed, 26 Jun 2024 12:36:51 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:59f2:64c2:bfe2:faa2? ([2001:df0:0:200c:59f2:64c2:bfe2:faa2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3c6d47sm103475385ad.178.2024.06.26.12.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 12:36:51 -0700 (PDT)
Message-ID: <c7235957-1f00-40dd-a78a-925b0b943ec7@gmail.com>
Date: Thu, 27 Jun 2024 07:36:58 +1200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: m68k 54418 fails to execute user space
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 linux-m68k@lists.linux-m68k.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org
Cc: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Christoph Hellwig <hch@infradead.org>, wbx@openadk.org
References: <c252ab82-dc4a-4267-84c3-4a20471524c5@yoseli.org>
 <735e19b6-3747-417f-ba5b-1a7da137a3a3@yoseli.org>
 <7fb2988d-ab89-405f-8cf1-edcdd2196376@gmail.com>
 <a7084eac-b92a-4ddb-a079-f4a600b93f8e@yoseli.org>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <a7084eac-b92a-4ddb-a079-f4a600b93f8e@yoseli.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_123652_966049_D9608FC0 
X-CRM114-Status: GOOD (  26.57  )
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

SmVhbi1NaWNoZWwsCgpPbiAyNy8wNi8yNCAwMToyOCwgSmVhbi1NaWNoZWwgSGF1dGJvaXMgd3Jv
dGU6Cj4gSGkgTWljaGFlbCwKPgo+IE9uIDI2LzA2LzIwMjQgMDM6NTYsIE1pY2hhZWwgU2NobWl0
eiB3cm90ZToKPj4gSmVhbi1NaWNoZWwsCj4+Cj4+IE9uIDI0LzA2LzI0IDIwOjU2LCBKZWFuLU1p
Y2hlbCBIYXV0Ym9pcyB3cm90ZToKPj4+Cj4+PiBXaGVuIEkgcHJpbnRrIHRoZSBkb19wYWdlX2Zh
dWx0IGZpcnN0IGRlYnVnLCBJIGdldCBmb3IgdGhlIGZpcnN0IAo+Pj4gY2FsbCB0byBsczoKPj4+
IGJhc2gtNS4yIyBscwo+Pj4gW8KgwqAgMTQuNzAwMDAwXSBkbyBwYWdlIGZhdWx0Ogo+Pj4gW8Kg
wqAgMTQuNzAwMDAwXSByZWdzLT5zcj0weDAsIHJlZ3MtPnBjPTB4NzAwNjllZTYsIAo+Pj4gYWRk
cmVzcz0weDcwMDY5ZWU2LCAwLCAocHRydmFsKQo+Pgo+PiBQYWdlIG5vdCBwcmVzZW50LCByZWFk
IGZhdWx0LiBQbGVhc2UgZGlzYWJsZSBvYmZ1c2NhdGlvbiBvZiBrZXJuZWwgCj4+IHBvaW50ZXIg
YWRkcmVzc2VzIGJ5IHByaW50ay4gTWF5YmUgYWxzbyBkaXNhYmxlIGFkZHJlc3Mgc3BhY2UgCj4+
IHJhbmRvbWl6YXRpb24gd2hpbGUgZGVidWdnaW5nIHRoaXMuCj4+Cj4+PiBUaGlzIGNhbGwgd29y
a3MgYWxtb3N0IGZpbmUgKEkgc3RpbGwgaGF2ZSB0aGUgYXNzZXJ0IGZhaWxlZDogCj4+PiBmb2xp
by0+cHJpdmF0ZSAhPSBOVUxMIGlzc3VlKS4KPj4+Cj4+PiBBbmQgd2hlbiBJIGNhbGwgaXQgYSBz
ZWNvbmQgdGltZSwgSSBnZXQ6Cj4+PiBiYXNoLTUuMiMgbHMKPj4+IFvCoMKgIDE5LjgyMDAwMF0g
ZG8gcGFnZSBmYXVsdDoKPj4+IFvCoMKgIDE5LjgyMDAwMF0gcmVncy0+c3I9MHgwLCByZWdzLT5w
Yz0weDYwMTFkNjVhLCAKPj4+IGFkZHJlc3M9MHg3MDBlMjAwNCwgMiwgKHB0cnZhbCkKPj4KPj4g
UGFnZSBub3QgcHJlc2VudCwgd3JpdGUgZmF1bHQuCj4+Cj4+IEl0IHdvdWxkIGJlIGhlbHBmdWwg
aWYgeW91IGNvdWxkIGdldCBhIGR1bXAgb2YgL3Byb2MvMS9tYXBzIGJlZm9yZSAKPj4gdGhlIGV4
ZWN2ZSgpIHN5c2NhbGwgaW4geW91ciBoZWxsb3dvcmxkIGluaXQgcmVwbGFjZW1lbnQuIFRoYXQg
bWlnaHQgCj4+IGNvbmZpcm0gYWxsIHRoZXNlIGFkZHJlc3NlcyBhcmUgbGVnaXQgKGFzc3VtaW5n
IG1hcHBpbmdzIHN1cnZpdmUgCj4+IGFjcm9zcyBleGVjdmUoKSwgdGhhdCBpcyksIGFuZCB3aGF0
IHRoZXkgY29ycmVzcG9uZCB0by4KPj4KPj4+Cj4+PiBUaGUgYWRkcmVzcyBjb3JyZXNwb25kcyB0
byB0aGUgZGVmaW5lZCB6b25lIEVMRl9FVF9EWU5fQkFTRSBhcyBJIHNldCAKPj4+IGl0IHRvIDB4
NzAwMDAwMDAuCj4+Pgo+Pj4gcmVncy0+cGMgaXMgbm90IHRoZSBzYW1lIGFzIHRoZSBhZGRyZXNz
LiBJdCBtaWdodCBiZSB1bnJlbGV2YW50LCBidXQgCj4+PiBhbnkgaGVscCBpcyBhcHByZWNpYXRl
ZCB0byB1bmRlcnN0YW5kIHRoZSBwcm9jZXNzIGJlaGluZCA6LSkuCj4+Pgo+Pj4gSSBrZWVwIGRp
Z2dpbmcsIGFuZCBJIGFtIGluIHRoZSBhc20gcGFydCB3aGljaCBmZWFycyBtZSBhIGJpdCAhCj4+
Cj4+IEkgZG9uJ3Qgc2VlIHRoYXQgeW91J2QgbmVlZCB0byBsb29rIGF0IGFueSBhc20gY29kZSBo
ZXJlLgo+Cj4gSSBhZGQgYSBzbWFsbCB0ZXN0IGluIGRvX3BhZ2VfZmF1bHQsIGFuZCBpbiBjYXNl
IG9mIGFuIGVycm9yLCBpdCAKPiBwYW5pY3MuIFRoZSByZXN1bHQgZm9sbG93czoKClBsZWFzZSB0
YWtlIGEgbG9vayBhdCB0aGUgY29tbWVudHMgYXQgdGhlIHN0YXJ0IG9mIAphcmNoL202OGsvbW0v
ZmF1bHQuYzpkb19wYWdlX2ZhdWx0KCkuIFRoZSBtZWFuaW5nIG9mIHRoZSBiaXRzIGluIAplcnJv
cl9jb2RlIGFyZSBleHBsYWluZWQgdGhlcmUuCgplcnJvcl9jb2RlICE9IDAgaXMganVzdCBvbmUg
cG9zc2libGUgY2FzZSBvdXQgb2YgdGhlIGZvdXIgdGhhdCBhcmUgCmhhbmRsZWQgYnkgZG9fcGFn
ZV9mYXVsdCgpLiBJdCBkb2VzIG5vdCBzaWduaWZ5ICdubyBlcnJvcicgLSBpZiB0aGVyZSAKaGFk
bid0IGJlZW4gYSBwYWdlIGZhdWx0LCBkb19wYWdlX2ZhdWx0KCkgd291bGQgbm90IGhhdmUgYmVl
biBjYWxsZWQuCgpZb3UganVzdCBmb3JjZWQgYSBwYW5pYyBlYWNoIHRpbWUgYSB3cml0ZSBmYXVs
dCBhbmQvb3IgYSBwcm90ZWN0aW9uIApmYXVsdCBoYXBwZW5zLiBXcml0ZSBmYXVsdHMgYXJlIGFi
c29sdXRlbHkgZXhwZWN0ZWQgdG8gaGFwcGVuIHdoZW4gCmxvYWRpbmcgYSBsaWJyYXJ5IC0gbGQu
c28gbmVlZHMgdG8gcGVyZm9ybSByZWxvY2F0aW9uIGFmdGVyIGxvYWRpbmcgYSAKZHluYW1pYyBs
aWJyYXJ5LCBhbmQgdGhhdCBtZWFucyB3cml0ZXMgdG8gdGhlIEdPVCBpbiB0aGUgbGlicmFyeSdz
IGRhdGEgCnNlZ21lbnQgKFBJQyBhc3N1bWVkKS4KCgo+IMKgLi9zY3JpcHRzL2RlY29kZV9zdGFj
a3RyYWNlLnNoIHZtbGludXggPCAvdG1wL3RyYWNlLmxvZwo+IFvCoMKgwqAgMy44NTcwMDBdIFJ1
biAvYmluL2Jhc2ggYXMgaW5pdCBwcm9jZXNzCj4gW8KgwqDCoCAzLjg1ODAwMF3CoMKgIHdpdGgg
YXJndW1lbnRzOgo+IFvCoMKgwqAgMy44NjEwMDBdwqDCoMKgwqAgL2Jpbi9iYXNoCj4gW8KgwqDC
oCAzLjg2MjAwMF3CoMKgIHdpdGggZW52aXJvbm1lbnQ6Cj4gW8KgwqDCoCAzLjg2MzAwMF3CoMKg
wqDCoCBIT01FPS8KPiBbwqDCoMKgIDMuODY0MDAwXcKgwqDCoMKgIFRFUk09bGludXgKPiBbwqDC
oMKgIDQuMjQyMDAwXSBkbyBwYWdlIGZhdWx0Ogo+IFvCoMKgwqAgNC4yNDIwMDBdIHJlZ3MtPnNy
PTB4MjAwMCwgcmVncy0+cGM9MHg0MTM2NjkyNCwgCj4gYWRkcmVzcz0weDcwMGIzMzY0LCAyLCA0
MWZiMDAwMAo+IFvCoMKgwqAgNC4yNDIwMDBdIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBw
YWdlIGZhdWx0IGVycm9yCj4gW8KgwqDCoCA0LjI0MjAwMF0gQ1BVOiAwIFBJRDogMSBDb21tOiBi
YXNoIE5vdCB0YWludGVkIAo+IDYuMTAuMC1yYzUtZzkyN2RhNmNmMDFmZS1kaXJ0eSAjMjUKPiBb
wqDCoMKgIDQuMjQyMDAwXSBTdGFjayBmcm9tIDQxODZkZGE4Ogo+IFvCoMKgwqAgNC4yNDIwMDBd
wqDCoMKgwqDCoMKgwqDCoCA0MTg2ZGRhOCA0MTQyM2FhNCA0MTQyM2FhNCA3MDBiMzMwMCAwMDAw
MDAwMSAKPiAwMDAwMDAwMCA0MTM2ZWUxMCA0MTQyM2FhNAo+IFvCoMKgwqAgNC4yNDIwMDBdwqDC
oMKgwqDCoMKgwqDCoCA0MTM2NmQ3YSA3MDBiMzM2NCA3MDBiMzM2NCAwMDAwMDAwMCAwMDAwMDAw
ZCAKPiA0MTg2ZGU2MCA0MWZiMDAwMCA0MWQ1MWE2MAo+IFvCoMKgwqAgNC4yNDIwMDBdwqDCoMKg
wqDCoMKgwqDCoCA0MTAwNTY5NiA0MTQxNmE5MCA0MTQxNmE0ZCAwMDAwMjAwMCA0MTM2NjkyNCAK
PiA3MDBiMzM2NCAwMDAwMDAwMiA0MWZiMDAwMAo+IFvCoMKgwqAgNC4yNDIwMDBdwqDCoMKgwqDC
oMKgwqDCoCAwMDAwMDAwYSA3MDBiMzM2NCAwMDAwMDAwMCAwMDAwMDAwZCAwMDAwMDAxMiAKPiA0
MWQ1MWEwMCA0MTg2ZGU2MCA0MWQ1MWE2MAo+IFvCoMKgwqAgNC4yNDIwMDBdwqDCoMKgwqDCoMKg
wqDCoCA0MWZiODFjMCA0MWQ1MWE2MCA0MTAwNTJmZSA0MTAwNTI5YSA0MTg2ZGU2MCAKPiA3MDBi
MzM2NCAwMDAwMDAwMiAwMDAwMDAwMAo+IFvCoMKgwqAgNC4yNDIwMDBdwqDCoMKgwqDCoMKgwqDC
oCA3MDBiYzQxNCAwMDAwMDAwMyAwMDAwODAwMCA3MDBhYzAwMCA0MTAwMzY2MCAKPiA0MTg2ZGU2
MCAwMDAwMDAwMCAwMDAwMDAwMAo+IFvCoMKgwqAgNC4yNDIwMDBdIENhbGwgVHJhY2U6IGR1bXBf
c3RhY2sgKGxpYi9kdW1wX3N0YWNrLmM6MTI0KQo+IFvCoMKgwqAgNC4yNDIwMDBdIHBhbmljIChr
ZXJuZWwvcGFuaWMuYzoyNjYga2VybmVsL3BhbmljLmM6MzY4KQo+IFvCoMKgwqAgNC4yNDIwMDBd
IGRvX3BhZ2VfZmF1bHQgKGFyY2gvbTY4ay9tbS9mYXVsdC5jOjg4IChkaXNjcmltaW5hdG9yIDEp
KQo+IFvCoMKgwqAgNC4yNDIwMDBdIF9fY2xlYXJfdXNlciAoYXJjaC9tNjhrL2xpYi91YWNjZXNz
LmM6MTA4KQo+IFvCoMKgwqAgNC4yNDIwMDBdIGJ1c2Vycl9jIChhcmNoL202OGsva2VybmVsL3Ry
YXBzLmM6NzI1IAo+IGFyY2gvbTY4ay9rZXJuZWwvdHJhcHMuYzo3NzUpCj4gW8KgwqDCoCA0LjI0
MjAwMF0gYnVzZXJyX2MgKGFyY2gvbTY4ay9rZXJuZWwvdHJhcHMuYzo3NDggCj4gYXJjaC9tNjhr
L2tlcm5lbC90cmFwcy5jOjc3NSkKPiBbwqDCoMKgIDQuMjQyMDAwXSBidXNlcnIgKGFyY2gvbTY4
ay9rZXJuZWwvZW50cnkuUzoxMTYpCj4gW8KgwqDCoCA0LjI0MjAwMF0gbWFfc2xvdHMgKGxpYi9t
YXBsZV90cmVlLmM6NzU5KQo+IFvCoMKgwqAgNC4yNDIwMDBdIF9fY2xlYXJfdXNlciAoYXJjaC9t
NjhrL2xpYi91YWNjZXNzLmM6MTA4KQo+IFvCoMKgwqAgNC4yNDIwMDBdIGVsZl9sb2FkIChmcy9i
aW5mbXRfZWxmLmM6MTI1IChkaXNjcmltaW5hdG9yIDEpIAo+IGZzL2JpbmZtdF9lbGYuYzo0MjEg
KGRpc2NyaW1pbmF0b3IgMSkpCj4gW8KgwqDCoCA0LjI0MjAwMF0gbG9hZF9lbGZfYmluYXJ5IChm
cy9iaW5mbXRfZWxmLmM6MTEzMikKPiBbwqDCoMKgIDQuMjQyMDAwXSBtZW1zZXQgKGFyY2gvbTY4
ay9saWIvbWVtc2V0LmM6MTEpCj4gW8KgwqDCoCA0LjI0MjAwMF0gbG9hZF9taXNjX2JpbmFyeSAo
ZnMvYmluZm10X21pc2MuYzo5NyAKPiBmcy9iaW5mbXRfbWlzYy5jOjE0NiBmcy9iaW5mbXRfbWlz
Yy5jOjIxMykKPiBbwqDCoMKgIDQuMjQyMDAwXSBtZW1zZXQgKGFyY2gvbTY4ay9saWIvbWVtc2V0
LmM6MTEpCj4gW8KgwqDCoCA0LjI0MjAwMF0gYnBybV9leGVjdmUgKGZzL2V4ZWMuYzoxNzk3IGZz
L2V4ZWMuYzoxODM5IAo+IGZzL2V4ZWMuYzoxODkxIGZzL2V4ZWMuYzoxODY3KQo+IFvCoMKgwqAg
NC4yNDIwMDBdIGNvcHlfc3RyaW5nc19rZXJuZWwgKGZzL2V4ZWMuYzo2NjkpCj4gW8KgwqDCoCA0
LjI0MjAwMF0gY291bnRfc3RyaW5nc19rZXJuZWwgKGZzL2V4ZWMuYzo0NzMpCj4gW8KgwqDCoCA0
LjI0MjAwMF0ga2VybmVsX2V4ZWN2ZSAoZnMvZXhlYy5jOjIwNTgpCj4gW8KgwqDCoCA0LjI0MjAw
MF0gX19keW5hbWljX3ByX2RlYnVnIChsaWIvZHluYW1pY19kZWJ1Zy5jOjg2NSkKPiBbwqDCoMKg
IDQuMjQyMDAwXSBydW5faW5pdF9wcm9jZXNzIChpbml0L21haW4uYzoxMzg5KQo+IFvCoMKgwqAg
NC4yNDIwMDBdIF9wcmludGsgKGtlcm5lbC9wcmludGsvcHJpbnRrLmM6MjM2NSkKPiBbwqDCoMKg
IDQuMjQyMDAwXSBrZXJuZWxfaW5pdCAoaW5pdC9tYWluLmM6MTUwOCkKPiBbwqDCoMKgIDQuMjQy
MDAwXSBrZXJuZWxfaW5pdCAoaW5pdC9tYWluLmM6MTQ1OSkKPiBbwqDCoMKgIDQuMjQyMDAwXSBy
ZXRfZnJvbV9rZXJuZWxfdGhyZWFkIChhcmNoL202OGsva2VybmVsL2VudHJ5LlM6MTQyKQo+IFvC
oMKgwqAgNC4yNDIwMDBdCj4gW8KgwqDCoCA0LjI0MjAwMF0gLS0tWyBlbmQgS2VybmVsIHBhbmlj
IC0gbm90IHN5bmNpbmc6IHBhZ2UgZmF1bHQgZXJyb3IgXS0tLQo+Cj4gTG9va3MgbGlrZSBhIG1l
bW9yeSBtYXBwaW5nIGZhaWx1cmUsIGJ1dCB3aHkgPwo+IE15IEpUQUcgYXQgdGhpcyBwb2ludCBk
dW1wcyBhIGxpc3Qgb2YgMHMgYXQgMHg0MWZiMDAwMCBhbmQgbXkgU0RSQU0gCj4gc3RhcnRzIGF0
IDB4NDAwMDAwMDAgYW5kIGVuZHMgYXQgMHg1MDAwMDAwMCAoMjU2TUIpLgoweDQxZmIwMDAwIHNl
ZW1zIHRvIGJlIGluaXQncyBwYWdlIGRpcmVjdG9yeS4gVGhlIGZhdWx0IGFkZHJlc3MgaXMgaW4g
CnRoZSByYW5nZSB3aGVyZSBJJ2QgZXhwZWN0IGR5bmFtaWMgbGlicmFyaWVzIHRvIHJlc2lkZS4K
Pgo+IEl0IGxvb2tzIGxpa2UgYSBUTEIgd3JpdGUgbWlzcyB3aGljaCBpcyBvYnNjdXJlIHRvIG1l
IDotKS4KPgo+IEkgdHJpZWQgdG8gdXNlIHRoZSAvcHJvYyBidXQgYXMgZXhwZWN0ZWQgaXQgaXMg
bm90IGFsaXZlIGFmdGVyIAo+IG1vdW50aW5nIGl0LgoKVGhlIG1lbW9yeSBtYXAgb3VnaHQgdG8g
YmUgYWNjZXNzaWJsZSB0aHJvdWdoIHN5c3JxIC0gYW4gYWx0ZXJuYXRpdmUgCndvdWxkIGJlIHRv
IG1vZGlmeSB0aGUgRUxGIGJpbmZtdCBoYW5kbGVyIGFuZCBkdW1wIHRoZSBtYXAgb25jZSBsZC5z
byAKaGFzIGZpbmlzaGVkIHdpdGggcmVsb2NhdGlvbnMuCgpDaGVlcnMsCgogwqDCoMKgIE1pY2hh
ZWwKCgo+IFRoYW5rcywKPiBKTQo+Cj4KPj4gQ2hlZXJzLAo+Pgo+PiDCoMKgwqDCoCBNaWNoYWVs
Cj4+Cj4+Pgo+Pj4gVGhhbmtzICEKPj4+IEpNCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
