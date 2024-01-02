Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4231FC46CD2
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jan 2024 11:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d0igRqAwTYm+6PFwaL0fLgWMd5zV0sd1tPc/6j7scPQ=; b=QfdSiDYk+kjdJn
	tTv5NF+0E3YKNfHAKGZPmkPUkj+02OtMoRgCDlHx9e6u6Z4c4D/CcD9dLt4V/zsvuw6f2W/5vVTNH
	SdN6i4BgQqeaQj2o97FUq1sOOHjB4ykJqYkGk/Qlyf17BGPaUTE/cRl5fRtix8DB/cazDihQOTvhT
	4GbtuHO3hMhjdgx07uazKIlvAUEVxHPhZV0h50Mam2YqyWqFtDDuUa+WEIEkPqjt+9ih2fCZRB7j1
	TuFHcRATeqsDXMxhfpnxjJTW9jrfX5gCHVlbfn595Fo/TPOqMW7zkKJpH91qW4Qssvt1kTBQ+J8PO
	ZerTuNhSBwsbBti5EAUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKdLk-007uyu-14;
	Tue, 02 Jan 2024 11:54:24 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKdLh-007uyQ-18
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jan 2024 11:54:23 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5ce2aada130so1291413a12.1
        for <linux-mtd@lists.infradead.org>; Tue, 02 Jan 2024 03:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704196459; x=1704801259; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgPb7Cz2TbuxFaFU2mP4+OeNQdPaYA/BzGt3itJ7OP8=;
        b=WVRkGTWchBy+3LKo209Kv9pQr3pa9adoCMrQ5QRxtDRkMI7EvU8sbMfDKX9KQ8I4Rh
         cf4W41RPzp6Lnb+HiwkP2Zy4F8aam35bq0kRWCSOcqP58j4kfRQqIHk+HjXY2iQy8w8L
         aWak0tYhq0l7PtZ5Hi0fmG+QHuikv9i4mZ88LI1pjSBDgMM9obbrRXt8Bg6A/ppoaVsL
         8j7UUH6MNA/sl7Vmjwbtm5vXx0fUHHaWm6QBTaoutnGnUQc01Ymikavx8IQmGAlDy7oB
         KoJtnMREZ5wZeR8eIq0BiFMIbkbVxdh6CvO27hfOEh76j/mjyFhhwa7Pxku4nloUf04I
         cs8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704196459; x=1704801259;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgPb7Cz2TbuxFaFU2mP4+OeNQdPaYA/BzGt3itJ7OP8=;
        b=p2Wi6PvT/eBufnEC1IIkrtlt9giu4TMy7ZyQAdHaQ6xnYfPjxax63V1GMGc2kTotXZ
         oJHnqCcwpDK9AGE41ucdVMzC9qNFpmjsqrsl3wGOkR7arU1uAEfWB2MKkHWuDtg6t6/z
         bQjFHhnFQ1PfXQHgPEoao2gz2HE3OZRFw52Z/eqRHsAOo6nBHQ6aMDwk8Qyf0yTg9Ic/
         1uoeZmjK45BCCFAnxd/7O8jQG6LQ90PleKAzghkAApFJ35Zkvjz6LMORg8YmGhCNpvHC
         6+xtdIoDRIQ/UKoSdlZPeMd0hUbQJ74ZfATJxrHfbOINbKIjJICrnBxnzPmD1oubeQ4S
         YgTg==
X-Gm-Message-State: AOJu0YxPR5KO+vJF/b+2YfRpCkSJtJbpleK/10IKU9Wxn5gz6ceoFSG7
	SPJIWX7tKt2HQhKnLb7CB2Tpq4joH48=
X-Google-Smtp-Source: AGHT+IEKMbzRAR8nq0GdZutKyDmpwdoY6TLGu6UsbNJud1mYw6/R1PKb5QoOiUe6PY3KSXrEFS3aFA==
X-Received: by 2002:a05:6a20:3791:b0:18b:3c54:e6d8 with SMTP id q17-20020a056a20379100b0018b3c54e6d8mr5646624pze.39.1704196459159;
        Tue, 02 Jan 2024 03:54:19 -0800 (PST)
Received: from smtpclient.apple ([49.37.241.39])
        by smtp.gmail.com with ESMTPSA id v11-20020a1709028d8b00b001d47a1b59d7sm11838190plo.287.2024.01.02.03.54.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jan 2024 03:54:18 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Re: mtd0 device is missing in /sys/class/mtd
From: Manojkiran Eda <manojkiran.eda@gmail.com>
In-Reply-To: <F86A353E-FFA9-4C8A-88D4-C726029CB27B@gmail.com>
Date: Tue, 2 Jan 2024 17:24:06 +0530
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Message-Id: <E8FDBC63-F364-44EB-8B90-925A4EC2F501@gmail.com>
References: <5AF66848-442A-460B-BAD8-31818FDC9DAC@gmail.com>
 <PH0PR10MB4615E28208969294E93F10F2F463A@PH0PR10MB4615.namprd10.prod.outlook.com>
 <F86A353E-FFA9-4C8A-88D4-C726029CB27B@gmail.com>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
X-Mailer: Apple Mail (2.3774.300.61.1.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_035421_412432_2AAD5C05 
X-CRM114-Status: GOOD (  24.88  )
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

SSB0cmllZCBhZGRpbmcgTVREX1BBUlRJVElPTkVEX01BU1RFUiB0byBteSBrZXJuZWwgY29uZmln
LCBhbmQgc3RpbGwgZmFjaW5nIHRoZSBzYW1lIGlzc3VlLiBEZWJ1Z2dpbmcgYSBsaXR0bGUgbW9y
ZSAsIEkgZmlndXJlZCBvdXQgdGhhdCBteSBkcml2ZXIgaXMgYmVpbmcgcHJvYmVkIGEgbG90IGVh
cmx5IHRoYW4gdGhlIG10ZCBjbGFzcyBiZWluZyByZWdpc3RlcmVkLiBTbyB0aGUgY29kZSBpcyBi
YWlsaW5nIG91dCBsb3QgZWFybHkgc2luY2UgdGhlIGNsYXNzX3RvX3N1YnN5cygpIHJldHVybnMg
bnVsbCAoaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2
ZXJzL2Jhc2UvY29yZS5jI0wzMTgwKQoKY29uc29sZSB0cmFjZXM6ClsgICAgOS4xMjg4NjZdIEVu
dGVyZWQgdGhlIGFzcGVlZF9lc3BpX2N0cmxfcHJvYmUgZnVuY3Rpb24K4oCmLgpbICAgMTEuNTgx
MDgxXSBtdGQgY2xhc3MgaXMgcmVnaXN0ZXJpbmcgbm93CgpMb29raW5nIG1vcmUsIEkgc2VlIGEg
Y2xhc3NfaXNfcmVnaXN0ZXJlZCgpIG1ldGhvZCBhdmFpbGFibGUgYXQgKGh0dHBzOi8vZWxpeGly
LmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9iYXNlL2NsYXNzLmMjTDY0
NCkgLiBJcyB0aGF0IHNvbWV0aGluZyB0aGF0IEkgY291bGQgY2hlY2sgaW4gbXkgZHJpdmVyIGFu
ZCByZXR1cm4gYW4gRVBST0JFX0RFRkVSID8gT3Igc2hvdWxkIHRoaXMgbG9naWMgYmUgaW5jb3Jw
b3JhdGVkIGluIHRoZSBtdGRjb3JlLmMgPyBCZWNhdXNlIHRoZSBtdGRfY2xhc3MgZGVmaW5pdGlv
biBpcyBiZWVuIGRlY2xhcmVkIGluIHRoZSBtdGRjb3JlIGFuZCBpcyBub3QgcGFzc2VkIGRvd24g
ZnJvbSBteSBkcml2ZXIgY29kZS4gQWxsIEkgd2FzIGRvaW5nIGlzIGNhbGxpbmcgbXRkX2Rldmlj
ZV9yZWdpc3RlcigpIGFuZCBleHBlY3RpbmcgaXQgdG8gcmV0dXJuIEVQUk9CRV9ERUZFUiBpZiB0
aGUgbXRkIGNvcmUgc3Vic3lzdGVtL2NsYXNzIGlzIG5vdCByZWdpc3RlcmVkL3Byb2JlZCBpbiB0
aGUga2VybmVsLgoKQnV0IEkgYW0gbm90IHN1cmUgd2hhdOKAmXMgdGhlIHJpZ2h0IGRpcmVjdGlv
bi4gQ2FuIGFueSBvbmUgaGVscCBtZSBvdXQgb24gdGhpcyA/CgpUaGFua3MsCgpNYW5vagoKPj4g
T24gMzEtRGVjLTIwMjMsIGF0IDY6NDbigK9QTSwgSm9ha2ltIFRqZXJubHVuZCA8Sm9ha2ltLlRq
ZXJubHVuZEBpbmZpbmVyYS5jb20+IHdyb3RlOgo+PiAKPj4gVHJ5IGFkZGluZyBNVERfUEFSVElU
SU9ORURfTUFTVEVSIHRvIHlvdXIga2VybmVsIGNvbmZpZwo+PiAKPj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBGcm9tOiBsaW51eC1tdGQgPGxpbnV4LW10ZC1i
b3VuY2VzQGxpc3RzLmluZnJhZGVhZC5vcmc+IG9uIGJlaGFsZiBvZiBNYW5vamtpcmFuIEVkYSA8
bWFub2praXJhbi5lZGFAZ21haWwuY29tPgo+PiBTZW50OiAyOCBEZWNlbWJlciAyMDIzIDE3OjM4
Cj4+IFRvOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBTdWJqZWN0OiBtdGQwIGRl
dmljZSBpcyBtaXNzaW5nIGluIC9zeXMvY2xhc3MvbXRkCj4+IAo+PiBIaSBBbGwsCj4+IAo+PiBJ
IHdhcyBhcyBiZWdpbm5lciBpbiBsaW51eCBkZXZpY2UgZHJpdmVyIGRldmVsb3BtZW50LCBhbmQg
cmVjZW50bHkgSSB3YXMgd29ya2luZyBvbiBhIGRldmljZSBkcml2ZXIgZm9yIGVzcGkgcHJvdG9j
b2wgYW5kIHdhcyBzdHVjayB3aXRoIGEgcHJvYmxlbS4KPj4gCj4+IEkgaGF2ZSBhbiBtdGQgZGV2
aWNlIGRyaXZlciB0aHJvdWdoIHdoaWNoIG9uZSBjb3VsZCBhY2Nlc3MgdGhlIE5PUiBmbGFzaCBj
b25uZWN0ZWQgdG8gdGhlIG90aGVyIGVuZCBvZiAgZXNwaSBidXMuIFRoZSBkcml2ZXIgc2VlbXMg
dG8gaGF2ZSBwcm9iZWQgc3VjY2Vzc2Z1bGx5ICwgSSBzZWUgYW4gZW50cnkgZm9yIG15IG10ZCBk
ZXZpY2UgaW4gL3Byb2MvbXRkIGJ1dCAsIEkgZG9udCBzZWUgYW4gZW50cnkgZm9yIG15IG10ZCBk
ZXZpY2UgaW4gdGhlIC9zeXMvY2xhc3MvbXRkLgo+PiAKPj4gSGVyZSBhcmUgZmV3IGxvZ3Mgb2Yg
aW50ZXJlc3QgOgo+PiAKPj4gcm9vdEBteWJveDp+IyBjYXQgL3Byb2MvbXRkCj4+IGRldjogICAg
c2l6ZSAgIGVyYXNlc2l6ZSAgbmFtZQo+PiBtdGQwOiAwNDAwMDAwMCAwMDAwMTAwMCAiYXNwZWVk
LWVzcGktZmxhc2jigJ0gPDw8PDzigJTigJQgVGhpcyBpcyBteSBtdGQgZGV2aWNlCj4+IG10ZDE6
IDA0MDAwMDAwIDAwMDEwMDAwICJibWMiCj4+IG10ZDI6IDAwMGUwMDAwIDAwMDEwMDAwICJ1LWJv
b3QiCj4+IG10ZDM6IDAwMDIwMDAwIDAwMDEwMDAwICJ1LWJvb3QtZW52Igo+PiBtdGQ0OiAwMDkw
MDAwMCAwMDAxMDAwMCAia2VybmVsIgo+PiBtdGQ1OiAwMjAwMDAwMCAwMDAxMDAwMCAicm9mcyIK
Pj4gbXRkNjogMDE2MDAwMDAgMDAwMTAwMDAgInJ3ZnMiCj4+IG10ZDc6IDA0MDAwMDAwIDAwMDEw
MDAwICJhbHQtYm1jIgo+PiBtdGQ4OiAwMDBlMDAwMCAwMDAxMDAwMCAiYWx0LXUtYm9vdCIKPj4g
bXRkOTogMDAwMjAwMDAgMDAwMTAwMDAgImFsdC11LWJvb3QtZW52Igo+PiBtdGQxMDogMDA5MDAw
MDAgMDAwMTAwMDAgImFsdC1rZXJuZWwiCj4+IG10ZDExOiAwMjAwMDAwMCAwMDAxMDAwMCAiYWx0
LXJvZnMiCj4+IG10ZDEyOiAwMTYwMDAwMCAwMDAxMDAwMCAiYWx0LXJ3ZnPigJ0KPj4gCj4+IAo+
PiByb290QG15Ym94Oi9zeXMvY2xhc3MvbXRkIyBscwo+PiBtdGQxICAgICBtdGQxMHJvICBtdGQx
MXJvICBtdGQxMnJvICBtdGQyICAgICBtdGQzICAgICBtdGQ0ICAgICBtdGQ1ICAgICBtdGQ2ICAg
ICBtdGQ3ICAgICBtdGQ4ICAgICBtdGQ5Cj4+IG10ZDEwICAgIG10ZDExICAgIG10ZDEyICAgIG10
ZDFybyAgIG10ZDJybyAgIG10ZDNybyAgIG10ZDRybyAgIG10ZDVybyAgIG10ZDZybyAgIG10ZDdy
byAgIG10ZDhybyAgIG10ZDlybwo+PiAKPj4gSSB3YXMgZXhwZWN0aW5nIG10ZDAgdG8gYmUgcHJl
c2VudCBpbiB0aGUgL3N5cy9jbGFzcy9tdGQsIGJ1dCBpdHMgbm90IHRoZXJlLgo+PiAKPj4gTG9v
a2luZyBhdCBkbWVzZzoKPj4gCj4+IHJvb3RAbXlib3g6L3N5cy9jbGFzcy9tdGQjIGRtZXNnIHwg
Z3JlcCAtaWUgbXRkIC1BNSAtaWUgZXNwaQo+PiBbICAgIDAuNjg1MDA2XSBFbnRlcmVkIHRoZSBh
c3BlZWRfZXNwaV9jdHJsX3Byb2JlIGZ1bmN0aW9uCj4+IFsgICAgMC42OTA5OTBdIGRldmljZSBt
YXRjaGVkIDogIDEKPj4gWyAgICAwLjY5OTIyNV0gZXNwaSBhbGxvYyBzdGFydGVkCj4+IFsgICAg
MC43MDQ3MjZdIGVzcGkgcmVhZCBmcm9tIGRldmljZSB0cmVlLCBmbGFzaCBzaXplIDogIDY3MTA4
ODY0Cj4+IFsgICAgMC43MTI0MTZdIGVzcGkgZmxhc2ggZW5hYmxlZAo+PiBbICAgIDAuNzE2NTcy
XSBlc3BpIGZsYXNoIGNoYW5uZWwgaXMgcmVhZHkKPj4gWyAgICAwLjcyMDk0MF0gZXNwaSBmbGFz
aCBhbGxvY2F0aW9uIGNvbXBsZXRlZAo+PiBbICAgIDAuNzI1MjU5XSBhc3BlZWQtZXNwaS1jdHJs
IDFlNmVlMDAwLmVzcGktY3RybDogbW9kdWxlIGxvYWRlZAo+PiAtLQo+PiBbICAgIDAuOTYyNzY0
XSA1IGZpeGVkLXBhcnRpdGlvbnMgcGFydGl0aW9ucyBmb3VuZCBvbiBNVEQgZGV2aWNlIGJtYwo+
PiBbICAgIDAuOTY5Njc1XSBDcmVhdGluZyA1IE1URCBwYXJ0aXRpb25zIG9uICJibWMiOgo+PiBb
ICAgIDAuOTc0Nzc2XSAweDAwMDAwMDAwMDAwMC0weDAwMDAwMDBlMDAwMCA6ICJ1LWJvb3QiCj4+
IFsgICAgMC45ODE5ODJdIDB4MDAwMDAwMGUwMDAwLTB4MDAwMDAwMTAwMDAwIDogInUtYm9vdC1l
bnYiCj4+IFsgICAgMC45ODk1NTddIDB4MDAwMDAwMTAwMDAwLTB4MDAwMDAwYTAwMDAwIDogImtl
cm5lbCIKPj4gWyAgICAwLjk5Njc3Ml0gMHgwMDAwMDBhMDAwMDAtMHgwMDAwMDJhMDAwMDAgOiAi
cm9mcyIKPj4gWyAgICAxLjAwMzc1OV0gMHgwMDAwMDJhMDAwMDAtMHgwMDAwMDQwMDAwMDAgOiAi
cndmcyIKPj4gLS0KPj4gWyAgICAxLjA0ODMwNF0gNSBmaXhlZC1wYXJ0aXRpb25zIHBhcnRpdGlv
bnMgZm91bmQgb24gTVREIGRldmljZSBhbHQtYm1jCj4+IFsgICAgMS4wNTU1NjNdIENyZWF0aW5n
IDUgTVREIHBhcnRpdGlvbnMgb24gImFsdC1ibWMiOgo+PiBbICAgIDEuMDYxMDk2XSAweDAwMDAw
MDAwMDAwMC0weDAwMDAwMDBlMDAwMCA6ICJhbHQtdS1ib290Igo+PiBbICAgIDEuMDY4NjcyXSAw
eDAwMDAwMDBlMDAwMC0weDAwMDAwMDEwMDAwMCA6ICJhbHQtdS1ib290LWVudiIKPj4gWyAgICAx
LjA3NjYwN10gMHgwMDAwMDAxMDAwMDAtMHgwMDAwMDBhMDAwMDAgOiAiYWx0LWtlcm5lbCIKPj4g
WyAgICAxLjA4NDIxMV0gMHgwMDAwMDBhMDAwMDAtMHgwMDAwMDJhMDAwMDAgOiAiYWx0LXJvZnMi
Cj4+IFsgICAgMS4wOTE1OTRdIDB4MDAwMDAyYTAwMDAwLTB4MDAwMDA0MDAwMDAwIDogImFsdC1y
d2Zz4oCdCj4+IAo+PiBhbmQgdGhlIG10ZCBkZXZpY2VzIGxpc3RlZCBpbiAvc3lzL2NsYXNzL210
ZCBmcm9tIG10ZDEgdGhyb3VnaCBtdGQxMiBhcmUgYmFzaWNhbGx5IGZyb20gdGhlIHBhcnRpdGlv
bnMgbGlzdCBhYm92ZS4KPj4gCj4+IHJvb3RAbXlib3g6L3N5cy9jbGFzcy9tdGQjIGZvciBkaXIg
aW4gKjsgZG8gY2F0ICRkaXIvbmFtZTsgZG9uZQo+PiBibWMKPj4gYWx0LWtlcm5lbAo+PiBhbHQt
cm9mcwo+PiBhbHQtcndmcwo+PiB1LWJvb3QKPj4gdS1ib290LWVudgo+PiBrZXJuZWwKPj4gcm9m
cwo+PiByd2ZzCj4+IGFsdC1ibWMKPj4gYWx0LXUtYm9vdAo+PiBhbHQtdS1ib290LWVudgo+PiAK
Pj4gRG9lcyBhbnlvbmUga25vdyB3aGF0IGNvdWxkIGJlIHRoZSBwb3NzaWJsZSByZWFzb24gZm9y
IHRoZSBwcm9ibGVtID8gQW55IGhpbnRzL2hlbHAgd291bGQgYmUgYXBwcmVjaWF0ZWQuCj4+IAo+
PiBUaGFua3MsCj4+IE1hbm9qCj4+IAo+PiAKPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdAo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
