Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D460C3064D
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jun 2024 01:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ih/GSkCDoLDI5tFTMkGCTdjYBbyKIvD7EAupcd0PH10=; b=hnpwqvJlWGNQD1
	rFs2Aay1ZgqQmVfo5+3tFL6HMZINhJmpekiQ87Eximr6FD+z7R8lFRfgqHkkvmNXdZFNBX2drU3KT
	r91sBMfudH/jYXChCNzdiMBHrsnRGq3vIPQ5oMslKG4fteWc0nSIFyYtqk7Bg+GnBDpGXnwiR72we
	HsVTLxrxtDvOxX3mEXnvR3vH1bvpFFQHDaT0D0ajOybsue4QbUNsHDcK+07AI+wDEVYbAvsx3sDpm
	SmWoqP6kSdca/ZWC4d7JX6TWDy9KF2Dqa/oCRWJnauzbdQvV919CTS4fu+OAeFe4BEB3oHL8jN8K9
	zRBHxOK6OLh4Lymlw9WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMHtN-000000053mN-3F8d;
	Wed, 26 Jun 2024 01:56:13 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMHtH-000000053kW-1dYF
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jun 2024 01:56:12 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-70665289275so50541b3a.0
        for <linux-mtd@lists.infradead.org>; Tue, 25 Jun 2024 18:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719366965; x=1719971765; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rbul1fR3L9u5waML0BaNr19XP8U9Sm981YRGSDMC6ws=;
        b=Dnp64kytwA0tQH73TmgT8B9G8WMBN5KXr3m0NuQaW0aw24DCbCJhfQmEz/kjM7xOZJ
         W6w+YvSQEbGsleA1rk6Sd3HikMKVH4oEQyJAIt9DiwWtOdN318Smk5VnCIa+ZeBzebFB
         aUdo5ZRHYSvlFuD7cgJAA3TRqLbggJByn5GjTQ1u34GLgXCoD6j7NBQnAYUNRzBpLdSv
         VxICtYmhh4zE+nkqYEBrzIjxPu4JW9NnqZwuJwIaoeB3dcyRa9ca5cyhc8shFBM0KJ5k
         nkDe/7r9Hi+0sHixyswbp7gdbi8CbVkeF8PHliQ0XBRMml5w82XE0YpNUSf/ys2L9hEb
         0DMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719366965; x=1719971765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rbul1fR3L9u5waML0BaNr19XP8U9Sm981YRGSDMC6ws=;
        b=xDlZ4bcm4j9mvQ9Mb/CKgrEeJE2qZiaigeaUjoe6ydFuzai9vRbFaO08dRfV4v98ii
         cP2yFj5YEcCwQMx28AGW4Dsfa2EG9FGWMY4i3J+OqcDdcSC+tuO7Lnc/eGF9qylQocjE
         5uFYj83Ey2+eK3KhOeCwWN25rVxI3d+Qr9Ib5B0zTEeeuNUzf4Vcvqfk+CnW+hFlq5Uw
         FUaHSfwKB9bpYKY35VX8dZUrcPjUQP4kNCM5vbRQXQRG0CZ/5S6ec67xGfRQHIyQMYeY
         dFir1brnJtIRrnhaLGWbkjvElgwzxVKICTE0oGTstG2UDZKoXqrzP0RBAyQwjE5kHRhQ
         lubw==
X-Forwarded-Encrypted: i=1; AJvYcCUFAjRR5v6TYB4cFpSjxsaQTA1Xq+1KMgOgX7EmlKTmmiwGKe7ZJyuBs1wKJi3htOwIGWwpjFTDuYiNVXfO6SJIyVtREthGq3OusJlVXg==
X-Gm-Message-State: AOJu0YzlL07EgasWKfvQlmYZeChsRhg7cEV+vQ1ASuMEZQlnvHzCdwn+
	4IG+9RIQdH5L4WslL4lLPtP9qFapd+FAzAFS2mALG7xb/mNCQ26iV5XtEA==
X-Google-Smtp-Source: AGHT+IFIcdxLk083jRZ/4PdrczkMPVC9KQrKPQLOfWqwCJrZa6lA8bz/dBQ1GMss9TVp5xyclZQTew==
X-Received: by 2002:a05:6a20:bca7:b0:1be:6390:33ee with SMTP id adf61e73a8af0-1be63903715mr354342637.0.1719366965334;
        Tue, 25 Jun 2024 18:56:05 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:59f2:64c2:bfe2:faa2? ([2001:df0:0:200c:59f2:64c2:bfe2:faa2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-71aa50d2809sm4712144a12.11.2024.06.25.18.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 18:56:04 -0700 (PDT)
Message-ID: <7fb2988d-ab89-405f-8cf1-edcdd2196376@gmail.com>
Date: Wed, 26 Jun 2024 13:56:11 +1200
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
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <735e19b6-3747-417f-ba5b-1a7da137a3a3@yoseli.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_185607_462500_E1D81B05 
X-CRM114-Status: GOOD (  15.56  )
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

SmVhbi1NaWNoZWwsCgpPbiAyNC8wNi8yNCAyMDo1NiwgSmVhbi1NaWNoZWwgSGF1dGJvaXMgd3Jv
dGU6Cj4KPiBXaGVuIEkgcHJpbnRrIHRoZSBkb19wYWdlX2ZhdWx0IGZpcnN0IGRlYnVnLCBJIGdl
dCBmb3IgdGhlIGZpcnN0IGNhbGwgCj4gdG8gbHM6Cj4gYmFzaC01LjIjIGxzCj4gW8KgwqAgMTQu
NzAwMDAwXSBkbyBwYWdlIGZhdWx0Ogo+IFvCoMKgIDE0LjcwMDAwMF0gcmVncy0+c3I9MHgwLCBy
ZWdzLT5wYz0weDcwMDY5ZWU2LCBhZGRyZXNzPTB4NzAwNjllZTYsIAo+IDAsIChwdHJ2YWwpCgpQ
YWdlIG5vdCBwcmVzZW50LCByZWFkIGZhdWx0LiBQbGVhc2UgZGlzYWJsZSBvYmZ1c2NhdGlvbiBv
ZiBrZXJuZWwgCnBvaW50ZXIgYWRkcmVzc2VzIGJ5IHByaW50ay4gTWF5YmUgYWxzbyBkaXNhYmxl
IGFkZHJlc3Mgc3BhY2UgCnJhbmRvbWl6YXRpb24gd2hpbGUgZGVidWdnaW5nIHRoaXMuCgo+IFRo
aXMgY2FsbCB3b3JrcyBhbG1vc3QgZmluZSAoSSBzdGlsbCBoYXZlIHRoZSBhc3NlcnQgZmFpbGVk
OiAKPiBmb2xpby0+cHJpdmF0ZSAhPSBOVUxMIGlzc3VlKS4KPgo+IEFuZCB3aGVuIEkgY2FsbCBp
dCBhIHNlY29uZCB0aW1lLCBJIGdldDoKPiBiYXNoLTUuMiMgbHMKPiBbwqDCoCAxOS44MjAwMDBd
IGRvIHBhZ2UgZmF1bHQ6Cj4gW8KgwqAgMTkuODIwMDAwXSByZWdzLT5zcj0weDAsIHJlZ3MtPnBj
PTB4NjAxMWQ2NWEsIGFkZHJlc3M9MHg3MDBlMjAwNCwgCj4gMiwgKHB0cnZhbCkKClBhZ2Ugbm90
IHByZXNlbnQsIHdyaXRlIGZhdWx0LgoKSXQgd291bGQgYmUgaGVscGZ1bCBpZiB5b3UgY291bGQg
Z2V0IGEgZHVtcCBvZiAvcHJvYy8xL21hcHMgYmVmb3JlIHRoZSAKZXhlY3ZlKCkgc3lzY2FsbCBp
biB5b3VyIGhlbGxvd29ybGQgaW5pdCByZXBsYWNlbWVudC4gVGhhdCBtaWdodCBjb25maXJtIAph
bGwgdGhlc2UgYWRkcmVzc2VzIGFyZSBsZWdpdCAoYXNzdW1pbmcgbWFwcGluZ3Mgc3Vydml2ZSBh
Y3Jvc3MgCmV4ZWN2ZSgpLCB0aGF0IGlzKSwgYW5kIHdoYXQgdGhleSBjb3JyZXNwb25kIHRvLgoK
Pgo+IFRoZSBhZGRyZXNzIGNvcnJlc3BvbmRzIHRvIHRoZSBkZWZpbmVkIHpvbmUgRUxGX0VUX0RZ
Tl9CQVNFIGFzIEkgc2V0IAo+IGl0IHRvIDB4NzAwMDAwMDAuCj4KPiByZWdzLT5wYyBpcyBub3Qg
dGhlIHNhbWUgYXMgdGhlIGFkZHJlc3MuIEl0IG1pZ2h0IGJlIHVucmVsZXZhbnQsIGJ1dCAKPiBh
bnkgaGVscCBpcyBhcHByZWNpYXRlZCB0byB1bmRlcnN0YW5kIHRoZSBwcm9jZXNzIGJlaGluZCA6
LSkuCj4KPiBJIGtlZXAgZGlnZ2luZywgYW5kIEkgYW0gaW4gdGhlIGFzbSBwYXJ0IHdoaWNoIGZl
YXJzIG1lIGEgYml0ICEKCkkgZG9uJ3Qgc2VlIHRoYXQgeW91J2QgbmVlZCB0byBsb29rIGF0IGFu
eSBhc20gY29kZSBoZXJlLgoKQ2hlZXJzLAoKIMKgwqDCoCBNaWNoYWVsCgo+Cj4gVGhhbmtzICEK
PiBKTQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
