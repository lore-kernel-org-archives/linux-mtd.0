Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394B3CEACFB
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Oct 2024 20:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2oqC7Sf5ovY1nl5OzHdLU2yzXfNTPlBZiEnQhqzAVA=; b=WSovQE1sKH/m1I
	x/hL1bUC3Qck6OoC7jtMv6Na8aHWqhIFEkjMNxHkbEQe5RBIgRvr3wsUYx/XARGAy8oocYSy9HD8b
	RcLKHjHQ2oU5WBaRJcckDh1ySfaWKB4sMm3Wl08LXqm4DWAiCwsPe7YXqhMJ63+oFbOOhS1LuVril
	akAu6n0Pl0M0FbxlzNumD+va7PVjZ/hkapFu2Lv7W3GtXGC0e5WHhXHJw6XsaSzdY87EdoPQLdKGl
	UmUjIlBIUvgWDzxOGBtB/VCcx0vqm0RhrqPnin9xsZYo2PiVYcwIkAZJ5oYSoBIW5fpyOj5H5+IuO
	fPZkHj8gNRq/lXXWykPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svjMD-00000003ylY-0AW0;
	Tue, 01 Oct 2024 20:20:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svjM9-00000003yl4-1RQz
	for linux-mtd@lists.infradead.org;
	Tue, 01 Oct 2024 20:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727814022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ALY0SjNPxJnXncSMgq9IGbqGLUER7OyySKCevQTcVBw=;
	b=YVogmhs2zn5C9jZvfUMaXwKi76r+redhybgk81Hnlp/GrC9jUDcf8evztPW4orlZAeJ7zd
	zx5l+RxQKeQQpwAb/ThAngtF8eB1JhMday2TI3dXTo+eSddasiKYwarLzmwym9KoaGWnYU
	4lOW4I0XvCBbbwykEBBOmLh//EhaLUA=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-z2xZgpWCP1KsS31dTMaLsQ-1; Tue, 01 Oct 2024 16:20:21 -0400
X-MC-Unique: z2xZgpWCP1KsS31dTMaLsQ-1
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-82d0daa1b09so782321239f.3
        for <linux-mtd@lists.infradead.org>; Tue, 01 Oct 2024 13:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727814020; x=1728418820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ALY0SjNPxJnXncSMgq9IGbqGLUER7OyySKCevQTcVBw=;
        b=e1U7+q6miI2+yK22V9reobWt09TvCLuoR16esfvWxIj6Uvqs/9hAu0eH9YtW+cMwCc
         HEii5Mro56Rg9oONGc+za+lT3kXuy+1I6A+hCHBg+4uT2JdePJB2LhhMsVbmegPnRtms
         xFfTgrpvZH+QJ0r84XR6/bR3N29ynoaTnK8II1LzhdepFr4YGtdMJIbX0ET97tcVToz3
         aa36JApgv5gRl3HbwtUn2OowULHRWHFIB2IKA+l6Ak1/hCo7IPJZmq2vW8sOGI6A1uN7
         98UsUxG3XcCpUAizL01izjqSLjlHx2BKqdWSniX0Q89Eokcv6kBLbcMePE5i4tz2RE1W
         KxhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZN7ozkSQqqR3O/awx0LBynSUYVBHldmyVUqGWwMW/P6CbgSxiUll9uP+87CY+XchFIk60xZh7Tq8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwUmhkugfFdw5kCSja91CU5j2dNdNlH2eGNd+KjybqLmUhTzAbZ
	KqkcUB3cumADCVJFYeJBCqqF+/ou7VuwVcFSnHuB2yBhjw2uyrM2U2H0mZ4LOsYEbvX5uc/suO9
	ZnasDyMkLzpy4s50TZ9sHCRILJGOfiqNpQbCcSSi6hkGVBxuMELPU7xQqG7hrpcg=
X-Received: by 2002:a05:6602:6b0c:b0:82c:5c76:bd48 with SMTP id ca18e2360f4ac-834d8561808mr128666939f.16.1727814020663;
        Tue, 01 Oct 2024 13:20:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/tYoHNviyB1iScNVoA9rlxm3khK6mE7BcmQG59SnrAi7NBOKYbMz7b26pCQ3fvf1uJcwukQ==
X-Received: by 2002:a05:6602:6b0c:b0:82c:5c76:bd48 with SMTP id ca18e2360f4ac-834d8561808mr128664839f.16.1727814020292;
        Tue, 01 Oct 2024 13:20:20 -0700 (PDT)
Received: from [10.0.0.71] (67-4-202-127.mpls.qwest.net. [67.4.202.127])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-834936c8597sm295178239f.16.2024.10.01.13.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 13:20:19 -0700 (PDT)
Message-ID: <21f78d99-ba6f-41da-9c09-7f420570b644@redhat.com>
Date: Tue, 1 Oct 2024 15:20:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ubifs: Convert ubifs to use the new mount API
To: Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org
Cc: brauner@kernel.org, David Howells <dhowells@redhat.com>,
 Richard Weinberger <richard@nod.at>
References: <20240926203604.23622-1-sandeen@redhat.com>
 <6081021a-be81-7877-8c1d-5311d9968124@huawei.com>
 <a2ff7d9b-799c-46e3-bd43-1b34bf8fdc66@redhat.com>
 <1075eb6d-9de8-8dcb-cd26-b548e6477206@huawei.com>
 <fde1e3c9-f3ba-450c-ae5d-83abb912d2fe@redhat.com>
 <3418947d-36ad-0fe9-e27c-0fd0540f0918@huawei.com>
From: Eric Sandeen <sandeen@redhat.com>
In-Reply-To: <3418947d-36ad-0fe9-e27c-0fd0540f0918@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_132025_484099_4D794322 
X-CRM114-Status: GOOD (  14.02  )
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

T24gOS8yOS8yNCA4OjIyIFBNLCBaaGloYW8gQ2hlbmcgd3JvdGU6Cj4g5ZyoIDIwMjQvOS8zMCAw
OjQ2LCBFcmljIFNhbmRlZW4g5YaZ6YGTOgo+PiBPbiA5LzI4LzI0IDg6NTcgUE0sIFpoaWhhbyBD
aGVuZyB3cm90ZToKPj4+IEFib3ZlIG1vZGlmaWNhdGlvbiBjYW4gZml4IHRoZSBwcm9ibGVtLCBi
dXQgaXQgbG9va3Mgbm90IHNvIGNsZWFuLgo+Pj4gVGhlcmUgYXJlIHR3byBtYWluIHN0ZXBzIGZv
ciBtb3VudC9yZW1vdW50IGluIHRoZSBuZXcgQVBJIGZyYW1ld29yazoKPj4+IDEuIEdldCBmaWxl
c3lzdGVtIGNvbmZpZ3VyYXRpb25zIGJ5IHBhcnNpbmcgdGhlIHBhcmFtYXRlcnMgZnJvbSB0aGUg
dXNlciBkYXRhLgo+Pj4gMi4gQXBwbHkgdGhlIGZpbGVzeXN0ZW0gY29uZmlndXJhdGlvbnMgdG8g
c3VwZXJibG9jayhGb3IgbW91bnQsIGEgc3VwZXJibG9jayBzaG91bGQgYmUgYWxsb2NhdGVkIGZp
cnN0LikuCj4+Pgo+Pj4gU28sIGhvdyBhYm91dCBkb2luZyB0aGF0IGxpa2UgZXh0NCBkb2VzOgo+
Pj4gMSkgdGhlIGZpbGVzeXN0ZW0gc3BlY2lmaWVkIHN1cGVyYmxvY2sgaXMgYWxsb2NhdGVkIGlu
IGZpbGxfc3VwZXIoKSwgbm90IGluIGluaXRfZnNfY29udGV4dCgpLCBpdCBsb29rcyBtb3JlIHJl
YXNvbmFibGUsIGJlY2F1c2UgZmlsZXN5c3RlbSBkb2Vzbid0IG5lZWQgYSBuZXcgcHJpdmF0ZSBz
dXBlcmJsb2NrIGluIHJlbW91bnRpbmcgcHJvY2Vzcy4gQnV0LCBVQklGUyBoYXMgb25ldGhpbmcg
ZGlmZmVyZW50LCBzYl90ZXN0KCkgbmVlZHMgdm9sdW1lIGluZm9ybWF0aW9uIHdoaWNoIGNvbWVz
IGZyb20gcHJpdmF0ZSBzdXBlcmJsb2NrLCBzbyBVQkZJUyBwcml2YXRlIHN1cGVyYmxvY2soc3Ry
dWN0IHViaWZzX2luZm8pIGlzIGFsbG9jYXRlZCBpbiB1Ymlmc19tb3VudCgpLiBIZXJlLCBJIHBy
ZWZlciB0byBrZWVwIHByaXZhdGUgc3VwZXJibG9jayBhbGxvY2F0aW9uIHN0aWxsIGluIHViaWZz
X21vdW50KGZvciBuZXcgbW91bnQgQVBJLCBpdCBpcyBjYWxsZWQgdWJpZnNfZ2V0X3RyZWUpLgo+
Pj4gMikgdGhlIGZpbGVzeXN0ZW0gY29uZmlndXJhdGlvbnMoY29udGFpbnMgbW91bnQgb3B0aW9u
cykgYXJlIHN0b3JlZCBpbiBhIHNlcGFyYXRlZCBzdHJ1Y3R1cmUoaW4gZXh0NCwgaXQgaXMgY2Fs
bGVkIGV4dDRfZnNfY29udGV4dCksIHdoaWNoIGlzIGFsbG9jYXRlZCBpbiBpbml0X2ZzX2NvbnRl
eHQoKS4gRm9yIFVCSUZTLCB3ZSBjYW4gZGVmaW5lIGEgc2ltaWxhciBzdHJ1Y3R1cmUgdG8gc3Rv
cmUgdGhlIGZpbGVzeXN0ZW0gY29uZmlndXJhdGlvbnMuCj4+Cj4+IFllcywgdGhpcyBpcyB3aGF0
IEkgaGFkIG1lbnRpb25lZCBhYm92ZSwgaS5lLiBoYXZpbmcgYSBzZXBhcmF0ZSBtb3VudAo+PiBj
b250ZXh0IGluIC0+ZnNfcHJpdmF0ZSByYWF0aGVyIHRoYW4gdXNpbmcgLT5mc19pbmZvLCBJIGNh
biBkbyBpdCB0aGlzCj4+IHdheSBpZiB5b3UgcHJlZmVyLiBJIGhhZCBqdXN0IHN0YXJ0ZWQgd2l0
aCBkaG93ZWxsJ3Mgb3JpZ2luYWwKPj4gaW1wbGVtZW50YXRpb24gZm9yIHNwZWVkLiA6KQo+IAo+
IEZpbmUsIHdlJ3ZlIGNvbWUgdG8gYW4gYWdyZWVtZW50Lgo+IAoKT2sgLSBJJ20gd29ya2luZyBv
biB0aGlzLCBhbmQgSSdsbCBzZXQgdXAgYSB2aXJ0dWFsIG10ZCBkZXZpY2Ugc28gSQpjYW4gZG8g
c29tZSBwcm9wZXIgaW5pdGlhbCB0ZXN0aW5nLCBnaXZlbiB0aGUgY2hhbmdlcyBmcm9tIHRoZSBv
cmlnaW5hbC4KClRoYW5rcywKLUVyaWMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
