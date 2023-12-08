Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDCEC4167B
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Dec 2023 21:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4yWbSlMKOyK9MTpHC1xjsRT3TGgx6j8+8caxc0/nqc=; b=mmiXRHCu0V2hiFfTbLacDFRyn7
	XI1IXHBlLm4GixIhVntAddqIRhexEwV/AlTVMI89IU79aTx0WqdeWoZFft3ZNZYLiynQSICVse9km
	4zqnX2HHfwxRT91o+MKCHYfs2tSqX8z7f/8T1xObUWPn/UCC57Bz5oVzG3N5n4M/MYvmO66PPklG4
	REYtmZ0R6xo2C9w8iTZCZxYLPbfQZPw3BvbeDo31mdmI8vFznTLYsir1M3shizBq/mFxxXsphcsd1
	iRS3Ja9AWEkv8rQdZGshTdXb5qQ9cR9GtP76ndff7kQ16KmOv+f7RxHApMyJc3L9DLthY4UjctACK
	2tCo/nIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBiU1-00Gc4f-2D;
	Fri, 08 Dec 2023 21:34:05 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBiTz-00Gc4K-0Y
	for linux-mtd@lists.infradead.org;
	Fri, 08 Dec 2023 21:34:04 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-77f320ca2d5so172482285a.1
        for <linux-mtd@lists.infradead.org>; Fri, 08 Dec 2023 13:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702071241; x=1702676041; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DlpMJnC1BZplmAVvRMVXpE3FTrC7KjURJMZxwM6AkRc=;
        b=CHzKLZZ8wsTETE002lgEFRklJFoeknglAJa5DCNP51B97KPtRxNBS00qlyVCNEHpYR
         2m2fhWglvbRH52YDgUznMVC2DaSapmvvzBwPS7O+KNq3RuBRC8LWTn5Np6EL0Yd70+D8
         5u8zrOqwqv9jXzqN99+0Y3DhytkCprJByf+b407I0aw5WYRcUkZz5rL2TRw48rI2oKgo
         j1OsyAcdJ9nWLHFCDn1N5gPv9UTh+/et97DmoJYqktZxaF0IQCRFa+CEci14wIUX5wRS
         1ONTEzQD9ZkJCF2nr09H2rQ1q6+WHSYsDJMcioAKJNyz53TkqSYMyJyZbRW3EbqCKhqk
         Ejqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702071241; x=1702676041;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DlpMJnC1BZplmAVvRMVXpE3FTrC7KjURJMZxwM6AkRc=;
        b=m3nAOeqLGI4vtu27NJYHhENLbIOKMDnyqUCwzGdh/QnDmD40a8i1j9W5B/HsolqfaC
         lkdScUoLgf1CKsSPn/mUbVOguCs5wX2GZvs6/zD9khnOoSYlTWMrNdbhsSGRVeUcy4WT
         yu9qJ89OlHoDKxnoKgtwY0Y8r9bWSGkLMvqIB74yJs3wzeD7J6VHMgOM1GJDP0+lRy7I
         pyDrPMvhx02JBsMECa7THoZFz+C5gX+hG0NiEdEHAXrqn2F7afTu3/dG9Mzukxzwzz2M
         kBuIWRd3MOZffrotHztYIHJSp5cWbswWXfukGXO074yI1OX9DQEhlFesKW2/BArtu2RB
         isrw==
X-Gm-Message-State: AOJu0YyzsxWBbtjQyexUksjULQvLWWRCtROMKO+hUEBqKMMb9ocNx4YQ
	psy9kCrr+DAWVbh0tDHSl6o=
X-Google-Smtp-Source: AGHT+IGHRS4xnzBNC4xFmeQTszG5t1gjwpDaXdEuRRhWHRvFocvTHezXeHMNduBd4PSbEhh6uFrFpQ==
X-Received: by 2002:a05:620a:19a7:b0:77d:7d70:d1f5 with SMTP id bm39-20020a05620a19a700b0077d7d70d1f5mr2532793qkb.37.1702071241414;
        Fri, 08 Dec 2023 13:34:01 -0800 (PST)
Received: from [192.168.1.14] (pool-173-66-156-160.washdc.fios.verizon.net. [173.66.156.160])
        by smtp.gmail.com with ESMTPSA id rr23-20020a05620a679700b0077edde498d3sm969009qkn.89.2023.12.08.13.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Dec 2023 13:34:00 -0800 (PST)
Message-ID: <8ed37a2b-fd03-4bc6-8b74-73f570b50094@gmail.com>
Date: Fri, 8 Dec 2023 16:33:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: UBI scrubbing behavior when readonly
Content-Language: en-US
To: Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org
References: <cbff425d-0196-4124-99a0-f7ea8d6e6ab6@gmail.com>
 <414d3586-0882-5bf9-a257-f819932ceae7@huawei.com>
From: Chuck Meade <chuckmeade@gmail.com>
In-Reply-To: <414d3586-0882-5bf9-a257-f819932ceae7@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_133403_207968_12BCBF2C 
X-CRM114-Status: GOOD (  17.42  )
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

T24gMTIvNy8yMyAyMTowMCwgWmhpaGFvIENoZW5nIHdyb3RlOgo+IOWcqCAyMDIzLzEyLzggMTo1
NiwgQ2h1Y2sgTWVhZGUg5YaZ6YGTOgo+PiBIZWxsbywKPj4KPj4gRG9lcyBVQkkgc2NydWJiaW5n
IChtb3ZpbmcgZGF0YSB0byBuZXcgUEVCIHdoZW4gcmVhZCBvcGVyYXRpb25zIHJlcG9ydCBFQ0MK
Pj4gYml0ZmxpcHMpIHN0aWxsIG9jY3VyIHdoZW4gYSBVQklGUyBtb3VudGVkIG9uIHRoZSBVQkkg
dm9sdW1lIGlzIHJlYWRvbmx5LCBpbgo+PiB0ZXJtcyBvZiBMaW51eCBmaWxlc3lzdGVtIHBlcm1p
c3Npb25zPwo+Pgo+PiBJIGhhdmUgbG9va2VkIGF0IHRoZSBVQkkgc291cmNlIGZvciBzY3J1YmJp
bmcsIGFuZCBpdCBhcHBlYXJzIHRoYXQgaXQgd2lsbCBub3QKPj4gb2NjdXIgd2hlbiB0aGUgVUJJ
IGRldmljZSAob3IgTVREIHBhcnRpdGlvbiB0byB3aGljaCB0aGUgZGV2aWNlIGlzIGF0dGFjaGVk
KQo+PiBpcyBpbiByZWFkb25seSBtb2RlLiBCdXQgd2hhdCBpZiB0aGUgVUJJIGRldmljZSBpcyBp
biByZWFkL3dyaXRlIG1vZGUsIGJ1dCB0aGUKPj4gVUJJRlMgbW91bnRlZCBvbiB0aGUgZGV2aWNl
IGlzIGluIHJlYWRvbmx5IG1vZGU/Cj4+Cj4gRG9lcyAnVUJJIHNjcnViYmluZycgbWVhbiB0aGUg
d2Vhcl9sZXZlbGluZ193b3JrZXIoZTEgY29tZXMgZnJvbSB1YmktPnNjcnViKT8gSWYgc28sIEkg
dGhpbmsgaXQgc3RpbGwgd29yayB3aGVuIFVCSSBpcyBydyBtb2RlIGFuZCB1YmlmcyBpcyByZWFk
b25seS4gRm9yIGV4YW1wbGU6IHViaWZzX2xlYl9yZWFkIC0+IHViaV9sZWJfcmVhZCAtPiAKPiB1
YmlfZWJhX3JlYWRfbGViIC0+IHViaV93bF9zY3J1Yl9wZWI6IHdsX3RyZWVfYWRkKGUsICZ1Ymkt
PnNjcnViKcKgICYmIGVuc3VyZV93ZWFyX2xldmVsaW5nCgpVQkkgc2NydWJiaW5nIGlzIHBlcmZv
cm1lZCB3aGVuIGEgcmVhZCBvcGVyYXRpb24gcmVwb3J0cyBFQ0MgYml0ZmxpcHMuICBVQkkgbW92
ZXMKZGF0YSB0byBhIG5ldyBQRUIgYW5kIGVyYXNlcyB0aGUgb2xkIFBFQiB0aGF0IGhhZCB0b28g
bWFueSBFQ0MgYml0ZmxpcHMuICBJJ20KanVzdCB0cnlpbmcgdG8gZGV0ZXJtaW5lIGlmIGl0IGNh
biB3b3JrIHVuZGVyIGEgcmVhZG9ubHkgVUJJRlMgaWYgdGhlIFVCSSBkZXZpY2UvCnZvbHVtZSBp
cyByZWFkL3dyaXRlLgoKVGhhbmtzIGZvciB5b3VyIHJlcGx5LiAgSXQgc291bmRzIGxpa2UgeW91
IHRoaW5rIHRoaXMgd2lsbCB3b3JrIGFzIGRlc2lyZWQuCgo+PiBJIGFtIHRyeWluZyB0byBjcmVh
dGUgYSBjb25maWd1cmF0aW9uIHdoZXJlIHRoZSBVQklGUyBpcyByZWFkb25seSBhdCB0aGUgTGlu
dXgKPj4gZmlsZXN5c3RlbSBwZXJtaXNzaW9ucyBsZXZlbCwgYnV0IFVCSSBzY3J1YmJpbmcgc3Rp
bGwgb2NjdXJzIHdoZW4gcmVhZAo+PiBvcGVyYXRpb25zIHJlcG9ydCBlbm91Z2ggRUNDIGJpdGZs
aXBzLsKgIFNvIG5vIExpbnV4IHVzZXJzcGFjZSBwcm9ncmFtcyBtYXkKPj4gbW9kaWZ5IHRoZSBm
aWxlc3lzdGVtIGR1ZSB0byBwZXJtaXNzaW9ucywgYnV0IFVCSSBzY3J1YmJpbmcgc3RpbGwgd291
bGQgb2NjdXIuCj4+Cj4+IElzIHRoaXMgcG9zc2libGUsIG9yIGFtIEkgbWlzc2luZyBzb21ldGhp
bmcgaW4gdGhlIFVCSSBzb3VyY2UgY29kZT8KPj4KPj4gVGhhbmtzLAo+PiBDaHVjawo+Pgo+Pgo+
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Pj4gTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cj4+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo+IAo+IAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
