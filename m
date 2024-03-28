Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFBEC54E64
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2024 03:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Jp8nVEC+opM6xlSGNdMBqIcMVNvafOBaWBx/MMBlzY=; b=CCwRJhoZnlrw2d
	5purjAw5V8CLfUXCTFw5PH1FbRwvn7Hb61TUvKpbcKzqWf8J3F/eGfLTK3Ebcqyp2UJ+mC0GFVoLK
	6PRopcybGbe7yh2bGH+RmKDCwV+p19ZBbhwKytim8w991TBfOD3r5TsW5jamTWaaOPK/o/vilTXy7
	Ku+C2/laXZcvxFt0OivMJ2kI0gYGA1adGEw3VmvZGajkQ1uOYCGPO+XQY/Hr0X0AGJJgItkW8kOFX
	oBzkoONqG0Zk51zg8SjF51RRETzucdLkwcNZgmnICEp/Du5WaaqbFNJyKRoSrWeO2X31ec+s2STJZ
	g3CDe2FUeWYWv3GxUPhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpgk0-0000000CJ8f-30Fb;
	Thu, 28 Mar 2024 03:47:48 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpgjw-0000000CJ7b-3n5u
	for linux-mtd@lists.infradead.org;
	Thu, 28 Mar 2024 03:47:47 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6e6a9fafacdso448655b3a.2
        for <linux-mtd@lists.infradead.org>; Wed, 27 Mar 2024 20:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711597658; x=1712202458; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z/WHCgPvut6hI6qyx5z8tojeBqigzDZUqYNvjOT4a48=;
        b=OvOMeKC/W1bCPE6iC1ZtwaRK7TvGmOrgaz6c87QkWYKIZXgYux/bu+3MuwRqKTKE4B
         CQKR8KSTrVB8WEdh7fBj188K9Xkw4dSqMEDmfV58kxwrmXix36Q9oN+V7FYWO62nLlK2
         tHG9qvI5P+uq4937GcApfHf3XLES5hGvj/mYzkF8JZR29KGrhBnlXK68FT9K3pcYp38s
         dFqj1TvGCoKgTKMYjP2igCL6aC9evVghhd1/I+7FZFAOmamZ/vy1wgW6eZXyFMaLoMUI
         7eiSR9KCdyLwSOt831caPjNHPMrTzFN9hPE6Apr4D0jzcF9oc4V+Q5dsHQRwHehXysyF
         MJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711597658; x=1712202458;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z/WHCgPvut6hI6qyx5z8tojeBqigzDZUqYNvjOT4a48=;
        b=T5rC4HZ1+OihArV0xc5stgxzhMC0b4FwoLo8g/BrNqXjgV5+Sm/DWhkms1qLhKPfro
         hjxftbIpNZOF+y+bjZgfThf8aKvkPDFB3oXM2I1NtGfDKXN6FbEuB0jQF4XWM0HjfKQE
         gnzbAmpTaR9PinvCcH6tQPEVNLETCoMz/m0005+p+m3jMShRN+ppQHwcxSbCT1pZp4wK
         tofd4y1dItFRN3EgYP6L4CO0GeBVSOFITx5EuozyrsmvbPAjehocTSHtdFgkDJVrj5In
         VIWNGzM9JAUBwq8/cZKuecJCf6rj/eLm63SvcOJtq/iwKawV+0Wmh5oTGiaCM0OFsPuP
         b/dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWGFH8yNgDt66gMpxGzoMn/v/jUXtrn5NdNCNbhDwTB2UTB7JoRbnVyT7evOUczKCjnsrDZXb16lmBAb1iA37Wv0N5SotuAfpFfkgvHg==
X-Gm-Message-State: AOJu0YychDa2in1JjSm8vV+lKOfBqLMa5WUoc7N1E6NKbzQzl+hQb72T
	elEaQ2N0HSIRNFegCOoABknVcIVnDwOQM3Yj/Scwfi4X1UYhyEeGkR8Xqf9uuw==
X-Google-Smtp-Source: AGHT+IFW8Ftt5Bl/FbK/TnyOqAWEKoBzX1S89JTvlxTfnXlgLZ1WsKpzD4IlN1QhZseJ6ZbHIVvikg==
X-Received: by 2002:a05:6a00:182a:b0:6ea:c2a2:5637 with SMTP id y42-20020a056a00182a00b006eac2a25637mr2027249pfa.12.1711597657716;
        Wed, 27 Mar 2024 20:47:37 -0700 (PDT)
Received: from thinkpad ([2409:40f2:201b:315f:8cec:6523:95f2:3f93])
        by smtp.gmail.com with ESMTPSA id p6-20020a056a000b4600b006ea7b343877sm325711pfo.9.2024.03.27.20.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 20:47:37 -0700 (PDT)
Date: Thu, 28 Mar 2024 09:17:32 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mtd: rawnand: qcom: Fix broken erase in
 misc_cmd_type in exec_op
Message-ID: <20240328034732.GA3212@thinkpad>
References: <20240325103053.24408-1-ansuelsmth@gmail.com>
 <20240326072512.GA8436@thinkpad>
 <66044bea.050a0220.dee16.c250@mx.google.com>
 <20240327175131.3c0100c3@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240327175131.3c0100c3@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_204744_978447_F1EBF7E0 
X-CRM114-Status: GOOD (  34.98  )
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

T24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgMDU6NTE6MzFQTSArMDEwMCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBIaSwKPiAKPiBhbnN1ZWxzbXRoQGdtYWlsLmNvbSB3cm90ZSBvbiBXZWQsIDI3IE1h
ciAyMDI0IDE2OjIwOjU4ICswMTAwOgo+IAo+ID4gT24gVHVlLCBNYXIgMjYsIDIwMjQgYXQgMTI6
NTU6MTJQTSArMDUzMCwgTWFuaXZhbm5hbiBTYWRoYXNpdmFtIHdyb3RlOgo+ID4gPiBPbiBNb24s
IE1hciAyNSwgMjAyNCBhdCAxMTozMDo0N0FNICswMTAwLCBDaHJpc3RpYW4gTWFyYW5naSB3cm90
ZTogIAo+ID4gPiA+IG1pc2NfY21kX3R5cGUgaW4gZXhlY19vcCBoYXZlIG11bHRpcGxlIHByb2Js
ZW1zLiBXaXRoIGNvbW1pdCBhODI5OTBjOGE0MDkKPiA+ID4gPiAoIm10ZDogcmF3bmFuZDogcWNv
bTogQWRkIHJlYWQvcmVhZF9zdGFydCBvcHMgaW4gZXhlY19vcCBwYXRoIikgaXQgd2FzCj4gPiA+
ID4gcmV3b3JrZWQgYW5kIGdlbmVyYWxpemVkIGJ1dCBhY3R1YWxseSBicm9rZSB0aGUgaGFuZGxp
bmcgb2YgdGhlCj4gPiA+ID4gRVJBU0VfQkxPQ0sgY29tbWFuZC4KPiA+ID4gPiAKPiA+ID4gPiBB
ZGRpdGlvbmFsIGxvZ2ljIHdhcyBhZGRlZCB0byB0aGUgZXJhc2UgY29tbWFuZCBjeWNsZSB3aXRo
b3V0IGNsZWFyCj4gPiA+ID4gZXhwbGFpbmF0aW9uIGNhdXNpbmcgdGhlIGVyYXNlIGNvbW1hbmQg
dG8gYmUgYnJva2VuIG9uIHRlc3RpbmcgaXQgb24KPiA+ID4gPiBhIGlwcTgwNnggbmFuZGMuCj4g
PiA+ID4gCj4gPiA+ID4gRml4IHRoZSBlcmFzZSBjb21tYW5kIGJ5IHJldmVydGluZyB0aGUgYWRk
aXRpb25hbCBsb2dpYyBhbmQgb25seSBhZGRpbmcKPiA+ID4gPiB0aGUgTkFORF9ERVYwX0NGRzAg
YWRkaXRpb25hbCBjYWxsIChyZXF1aXJlZCBmb3IgZXJhc2UgY29tbWFuZCkuCj4gPiA+ID4gCj4g
PiA+ID4gRml4ZXM6IGE4Mjk5MGM4YTQwOSAoIm10ZDogcmF3bmFuZDogcWNvbTogQWRkIHJlYWQv
cmVhZF9zdGFydCBvcHMgaW4gZXhlY19vcCBwYXRoIikKPiA+ID4gPiBDYzogc3RhYmxlQHZnZXIu
a2VybmVsLm9yZwo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBNYXJhbmdpIDxhbnN1
ZWxzbXRoQGdtYWlsLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiBDaGFuZ2VzIHYyOgo+ID4gPiA+
IC0gU3BsaXQgdGhpcyBhbmQgcmV3b3JrIGNvbW1pdCBkZXNjcmlwdGlvbiBhbmQgdGl0bGUKPiA+
ID4gPiAKPiA+ID4gPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIHwgNSArKy0t
LQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+ID4gPiA+IAo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29t
X25hbmRjLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiA+ID4gPiBpbmRl
eCBiMDc5NjA1Yzg0ZDMuLjE5ZDc2ZTM0NWE0OSAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9xY29tX25hbmRjLmMKPiA+ID4gPiBAQCAtMjgzMCw5ICsyODMwLDggQEAgc3RhdGljIGlu
dCBxY29tX21pc2NfY21kX3R5cGVfZXhlYyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBjb25zdCBz
dHJ1Y3QgbmFuZF9zdWIKPiA+ID4gPiAgCW5hbmRjX3NldF9yZWcoY2hpcCwgTkFORF9FWEVDX0NN
RCwgMSk7Cj4gPiA+ID4gIAo+ID4gPiA+ICAJd3JpdGVfcmVnX2RtYShuYW5kYywgTkFORF9GTEFT
SF9DTUQsIGluc3RycywgTkFORF9CQU1fTkVYVF9TR0wpOwo+ID4gPiA+IC0JKHFfb3AuY21kX3Jl
ZyA9PSBPUF9CTE9DS19FUkFTRSkgPyB3cml0ZV9yZWdfZG1hKG5hbmRjLCBOQU5EX0RFVjBfQ0ZH
MCwKPiA+ID4gPiAtCTIsIE5BTkRfQkFNX05FWFRfU0dMKSA6IHJlYWRfcmVnX2RtYShuYW5kYywK
PiA+ID4gPiAtCU5BTkRfRkxBU0hfU1RBVFVTLCAxLCBOQU5EX0JBTV9ORVhUX1NHTCk7Cj4gPiA+
ID4gKwlpZiAocV9vcC5jbWRfcmVnID09IE9QX0JMT0NLX0VSQVNFKQo+ID4gPiA+ICsJCXdyaXRl
X3JlZ19kbWEobmFuZGMsIE5BTkRfREVWMF9DRkcwLCAyLCBOQU5EX0JBTV9ORVhUX1NHTCk7ICAK
PiA+ID4gCj4gPiA+IFNvIHRoaXMgb25seSBhdm9pZHMgdGhlIGNhbGwgdG8sICdyZWFkX3JlZ19k
bWEobmFuZGMsIE5BTkRfRkxBU0hfU1RBVFVTLCAxLAo+ID4gPiBOQU5EX0JBTV9ORVhUX1NHTCkn
IGlmIHFfb3AuY21kX3JlZyAhPSBPUF9CTE9DS19FUkFTRS4gQnV0IGZvciBxX29wLmNtZF9yZWcg
PT0KPiA+ID4gT1BfQkxPQ0tfRVJBU0UsIHRoZSByZXN1bHQgaXMgdGhlIHNhbWUuCj4gPiA+IAo+
ID4gPiBJJ20gd29uZGVyaW5nIGhvdyBpdCByZXN1bHRzIGluIGZpeGluZyB0aGUgT1BfQkxPQ0tf
RVJBU0UgY29tbWFuZC4KPiA+ID4gCj4gPiA+IENhbiB5b3Ugc2hhcmUgdGhlIGFjdHVhbCBpc3N1
ZSB0aGF0IHlvdSBhcmUgc2VlaW5nPyBMaWtlIGVycm9yIGxvZ3MgZXRjLi4uCj4gPiA+ICAKPiA+
IAo+ID4gSXNzdWUgaXMgdGhhdCBuYW5kYyBnb2VzIHRvIEFETSB0aW1lb3V0IGFzIHNvb24gYXMg
YSBCTE9DS19FUkFTRSBpcwo+ID4gY2FsbGVkLiBCTE9DS19FUkFTRSBvcGVyYXRpb24gbWF0Y2gg
YWxzbyBhbm90aGVyIG9wZXJhdGlvbiBmcm9tIE1URAo+ID4gcmVhZC4gKHBhcnNlciBhbHNvIG1h
cHMgdG8gb3RoZXIgc3R1ZmYpCj4gPiAKPiA+IEkgd2lsbCBiZSBhd2F5IGZyb20gdGhlIHRlc3Rp
bmcgYm9hcmQgZm9yIDctMTAgZGF5cyBzbyBJIGNhbid0IHByb3ZpZGUKPiA+IGxvZ3MgY3VycmVu
dGx5Lgo+IAo+IFNvLCBzaGFsbCB3ZSB3YWl0IGZvciBhZGRpdGlvbmFsIGxvZ3MgZnJvbSBDaHJp
c3RpYW4gb3Igc2hhbGwgSSBtZXJnZQo+IHRoZSB0d28tcGF0Y2hlcyBzZXJpZXM/IEknbSBub3Qg
c3VyZSB3aGF0J3MgdGhlIHN0YXR1cyBhbnltb3JlLgo+IAoKVEJILCBJIGRvbid0IGtub3cgaG93
IE9QX0JMT0NLX0VSQVNFIGNhbiBmYWlsIHdpdGhvdXQgdGhpcyBjaGFuZ2UuIEJ1dCBJIGNhbgpj
bGVhcmx5IHNlZSB0aGUgMiBwYXRjaGVzIHJlcXVpcmVkIGZvciBPUF9SRVNFVF9ERVZJQ0UgY29t
bWFuZC4gQnV0IG1lcmdpbmcgdGhlCnBhdGNoZXMgYXMgaXQgaXMgZG9lc24ndCBsb29rIGdvb2Qg
dG8gbWUuCgpTbyBJIHRoaW5rIGlmIENocmlzdGlhbiBjYW4gY2x1YiB0aGUgdHdvIHBhdGNoZXMg
aW50byAxIGFzIGxpa2UgdjEgYW5kIHJld29yZAp0aGUgY29tbWl0IG1lc3NhZ2UgYW5kIHN1Ympl
Y3QgdG8gcmVmbGVjdCB0aGUgZmFjdCB0aGF0IE9QX1JFU0VUX0RFVklDRSBjb21tYW5kCmlzIGJl
aW5nIGZpeGVkIHdvdWxkIHdvcmsgZm9yIG1lLgoKLSBNYW5pCgotLSAK4K6u4K6j4K6/4K614K6j
4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
