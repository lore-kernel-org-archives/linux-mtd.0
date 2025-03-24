Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CBFC36002
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Mar 2025 23:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:To:References:
	Date:Subject:Mime-Version:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/GRT7AUnx5DdFLZybB2OM9DlR6xmhM4KM0pBW09GlXY=; b=fUAj+2M2YJepwZ
	IkICwM64iZyfDuIXrTqfSffbmchkUn0X9nOpc9HJQ8IBV/37TlIHaIyLHMDYfEcNdwF/5RDQFkLKC
	zvuhmw6QqPn3uqfXjXyRorBqjkgARjQxtDnXQ5aZ4aaI5+lKbxN+vfKAw/0gLH0s316B9CzrWCfe6
	rKFRlml/RQuJ+8G0q1CqT8oOdtMP6v5Jpzvn8w6lssnXZ/ylAc/3gd4VVKHMMXhTDPASXdUWrECD6
	jO33Jnwk096S8sIcXYXsV8dY+0D1G0og251U6/I58yIdMMhW8rFsnB2m5YdVmwsikroNgnJZ7BhkW
	xK60be5H7ypkdCcwQ+AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twraP-00000004Vl4-3mu0;
	Mon, 24 Mar 2025 23:52:05 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twraL-00000004Vkb-3qSm
	for linux-mtd@lists.infradead.org;
	Mon, 24 Mar 2025 23:52:04 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ac25313ea37so662697466b.1
        for <linux-mtd@lists.infradead.org>; Mon, 24 Mar 2025 16:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kohlschuetter-com.20230601.gappssmtp.com; s=20230601; t=1742860320; x=1743465120; darn=lists.infradead.org;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5mOBb8uqQJ84BM8+jnpxPD5oC9JDr5/CbCLdycFhOc=;
        b=fRyogr4Q60cGRfSuH8hXzChFbPYwwRL4Xv4lL6eqad3CLScqqZDpBASWEr2s1PiVQw
         1+Lfwie4oGquVmgf+KOL+f8SmiGd8fsXGnaX3sFGQHKMaF0NkWZ4+ElfXDAO0F9toG3W
         Q0Klg5ZmzJ+n6iEiOQ2fm+SjmsrwI/R55c2vfPOR0WgaTKAcc8QaXF0Kh6QTMySlEdKB
         YKPSaooXg3YTCxteV+5hH1+K7F9V/nWwdGgv7Ja2QIvR+Xguv2dpYFMa7BZ5P1wl+izC
         +sSsHdbbBoPvcf9Jl9Q2fbdJE7hWYzG9G7m6issnlOFNHWjJ/6xhVpURATyl2FeEpTnI
         FxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742860320; x=1743465120;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5mOBb8uqQJ84BM8+jnpxPD5oC9JDr5/CbCLdycFhOc=;
        b=rvbxER7mKBY/jrTvOdO8LHqdJQE066J+4tSTloUojQimBzHQO69LHRPTQqs7Zopsr1
         AZ79fQBABibbF/0pMi6olgLm6BlWLEmlB4syWxOZDDlWY4z/SRbgkRa94Fv3jFpWXKnE
         gHA6nlK1oqBBxsuQZ22vZEJ39/pKaWV4OnXdOnF4QVhwMI6TS0xYoaNAFMdH2TBRCJOZ
         jDRBmUQsgXiMovu04Cqp1xACI3+IaKR+Z9x9vZizkS41YRjgiVRuxDlItSGe5bg73uCQ
         lgC770zYs4MhGkwJ1zqIZfiIYsBQSTbUT/qYZUykTpzoDSSh4DGsDtt0ZiMcS4+8QPyd
         HOpA==
X-Gm-Message-State: AOJu0YxsQ5r855fMIR0RT1yKzrCFzyNmTk8LJC69O2pW0MFBWLNCBAvw
	kEtCXiSJw75MfPse/q0aUIVG6AxrIqbaOAx8Mj3G85sqdzhDnwICH+iN50XAyMb6taw+kYJcaIP
	y
X-Gm-Gg: ASbGncv+REDqsUPIASY7dLFZQv1vfp9AlM2ca5X+U2s2w/DfQOATpzgm6Ud1xIRocZS
	/h8fC01Eriio4BeL9Lhlu8oxTBatw/z6BdJBLBD8VMue8QifPicnUfJ3pkrkJejcqYjGLIEw/x2
	jY5W2LLRoJNteRv2MkSPGs+bVBWtgru2a/LaMN/WcRPtADB1RW1TgMunxgVQhNu0RFKhqCRLa4h
	afbmnadtpAlntMMUXtZirLQ9dbkI6WajppipBD6dyO1lSgu16hFuMkJCGUR0b9RsEAsD643MBlJ
	9odPowlysQVm1M+4nkR81RBCxevsxrvwb5IjJxWUcLidD7nWHRNTEJ0P+I1T2g8gYJjH
X-Google-Smtp-Source: AGHT+IFdgnOIkpnkbgBcU0R1bPdMbr38o0KeE1Tqpg57vJJhyEvCe6vgv3f1cVWYjgljKOJKlAiTHQ==
X-Received: by 2002:a17:907:3da9:b0:ac2:29c7:8622 with SMTP id a640c23a62f3a-ac3f252f862mr1429522266b.54.1742860319115;
        Mon, 24 Mar 2025 16:51:59 -0700 (PDT)
Received: from smtpclient.apple ([91.64.76.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efb64b06sm759391866b.94.2025.03.24.16.51.58
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Mar 2025 16:51:58 -0700 (PDT)
From: =?utf-8?Q?Christian_Kohlsch=C3=BCtter?= <christian@kohlschutter.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: Cannot flash SPI-NOR MX25U6435F on Odroid N2+
Date: Tue, 25 Mar 2025 00:51:58 +0100
References: <8D10D785-2C5A-4695-8BC1-C7F54050211A@kohlschutter.com>
 <9E576118-44E4-481C-9F68-6CFEDD456578@kohlschutter.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <9E576118-44E4-481C-9F68-6CFEDD456578@kohlschutter.com>
Message-Id: <15DC1FBE-E5E9-4271-9EEF-9228309DBCF4@kohlschutter.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_165203_015035_36745907 
X-CRM114-Status: GOOD (  16.83  )
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

U29tZSBtb3JlIGluZm9ybWF0aW9uOgoKQXBwYXJlbnRseSwgc29tZSBPRFJPSUQtTjIrIHNoaXAg
d2l0aCBNWDI1VTY0MzVGLCBzb21lIHNoaXAgd2l0aCBYVDI1UTY0RCBTUEktTk9SIGNoaXBzLgoK
VGhlIG9uZXMgd2l0aCBYVDI1UTY0RCBoYXZlIG5vIHByb2JsZW1zIGZsYXNoaW5nIHRoZSBmaXJz
dCB0aW1lICh1c2luZyB0aGUgc2FtZSBrZXJuZWwgLyB1c2VybGFuZCkuIEZvciB0aG9zZSBjaGlw
cyBJIHNlZSB0aGUga2VybmVsIG1lc3NhZ2UgInNwaS1ub3Igc3BpMC4wOiBmb3VuZCBzcGktbm9y
LWdlbmVyaWMsIGV4cGVjdGVkIG14MjV1NjQzNWYiCgpJJ3ZlIG5vdyB0cmllZCB0d28gYm9hcmRz
IHdpdGggTVgyNVU2NDM1RiwgYW5kIHRoZXkgYm90aCBleHBvc2UgdGhpcyBpc3N1ZS4KKEd1ZXNz
aW5nIGZyb20gdGhlIE1BQyBhZGRyZXNzZXMgb2YgdGhlc2UgYm9hcmRzICgwMDoxZTowNjo0Mjpi
MzogdnMgMDA6MWU6MDY6NDI6ZmE6IGluIG15IGNhc2UpLCBIYXJka2VybmVsIG11c3QgaGF2ZSBj
aGFuZ2VkIHRoZSBNWDI1VTY0MzVGIGZvciBYVDI1UTY0RCBpbiBsYXRlciBydW5zLi4uKQoKQWxz
bywgbm90YWJseSwgY2FsbGluZyBmbGFzaF9lcmFzZSBwcmlvciB0byBmbGFzaGNwIGRvZXNuJ3Qg
bWFrZSBhIGRpZmZlcmVuY2UgLS0gZmxhc2hjcCByZWFsbHkgd2FudHMgdG8gYmUgY2FsbGVkIHR3
aWNlIGZvciB0aGUgTVgyNVU2NDM1RiBjaGlwcyAuLi4KCj4gT24gMjQuIE1hciAyMDI1LCBhdCAy
Mzo1MiwgQ2hyaXN0aWFuIEtvaGxzY2jDvHR0ZXIgPGNocmlzdGlhbkBrb2hsc2NodXR0ZXIuY29t
PiB3cm90ZToKPiAKPiBQUzogSXQgc2VlbXMgdG8gd29yayB3aGVuIGZsYXNoaW5nIGEgc2Vjb25k
IHRpbWUgKGkuZS4sIGNhbGxpbmcgZmxhc2hjcCB3aXRoIHRoZSBzYW1lIGFyZ3VtZW50cyBvbmNl
IG1vcmUpLgo+IAo+IElzIHRoZXJlIGEgdGltaW5nIHJlcXVpcmVtZW50IGJldHdlZW4gZXJhc2Ug
YW5kIHdyaXRlPyBJcyBpdCBhIGJ1ZyBpbiBtdGQtdXRpbHMgdGhhdCB3ZSBqdXN0IGRvbid0IGhp
dCB3aXRoIHRoZSBjdXN0b20gNC45IE9kcm9pZCBrZXJuZWw/Cj4gCj4+IE9uIDI0LiBNYXIgMjAy
NSwgYXQgMjM6MDksIENocmlzdGlhbiBLb2hsc2Now7x0dGVyIDxjaHJpc3RpYW5Aa29obHNjaHV0
dGVyLmNvbT4gd3JvdGU6Cj4+IAo+PiBIaSBhbGwsCj4+IAo+PiBJJ20gdHJ5aW5nIHRvIGZsYXNo
IHRoZSBNWDI1VTY0MzVGIDhNQiBTUEktUk9NIGludGVncmF0ZWQgaW4gT0RST0lEIE4yKyBib2Fy
ZHMuCj4+IAo+PiBVc2luZyBMaW51eCA2LjE0IChvciBhbnkgb3RoZXIgcmVjZW50IG1haW5saW5l
IGtlcm5lbCksIEkgY2FuJ3Qgc2VlbSB0byBnZXQgYW55IGNoYW5nZXMgcGVyc2lzdGVkOgo+PiAK
Pj4gc3VkbyBmbGFzaGNwIC12IHUtYm9vdC5zcGkuYmluIC9kZXYvbXRkMAo+PiBFcmFzaW5nIGJs
b2NrczogMjg5LzI4OSAoMTAwJSkKPj4gV3JpdGluZyBkYXRhOiAxMTU1ay8xMTU1ayAoMTAwJSkK
Pj4gVmVyaWZ5aW5nIGRhdGE6IDEway8xMTU1ayAoMCUpRmlsZSBkb2VzIG5vdCBzZWVtIHRvIG1h
dGNoIGZsYXNoIGRhdGEuIEZpcnN0IG1pc21hdGNoIGF0IDB4MDAwMDAwMDAtMHgwMDAwMjgwMAo+
PiAKPj4gUmVsZXZhbnQga2VybmVsIGNvbmZpZ3M6Cj4+IENPTkZJR19NVERfU1BJX05PUj1tCj4+
IENPTkZJR19NVERfU1BJX05PUl9TV1BfRElTQUJMRT15ICAjIGRvZXMgbm90IG1ha2UgYSBkaWZm
ZXJlbmNlCj4+IAo+PiBXaXRoIHRoZSBzYW1lIHVzZXJsYW5kIHRvb2xzIChtdGQtdXRpbHMgMi4y
LjEtcjAgcnVubmluZyBvbiBBbHBpbmUgTGludXgpLCBmbGFzaGluZyBzdWNjZWVkcyB3aGVuIHVz
aW5nIHRoZWlyIGN1c3RvbSBrZXJuZWwgKGJhc2VkIHVwb24gNC45LjMzNzsgb2Ryb2lkZzEyLTQu
OS55IGJyYW5jaCBmcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9oYXJka2VybmVsL2xpbnV4KQo+PiAK
Pj4gTm90ZSB0aGF0IGJvdGgga2VybmVscyBuZWVkIGEgY3VzdG9tIERUQiB0byBlbmFibGUgU1BJ
IChzZWUgaWMvbWVzb24tZzEyYi1vZHJvaWQtbjIuZHRzaSkuCj4+IAo+PiBMaW51eCA2LjE0IG5l
ZWRzIHRoZXNlIGFkZGl0aW9uYWwgZW50cmllcyB0byBtZXNvbi1nMTJiLW9kcm9pZC1uMi1wbHVz
LmR0cyAob2Ryb2lkJ3MgNC45LjMzNyBuZWVkcyBzaW1pbGFyIGNoYW5nZXMpCj4+IAo+PiAmc3Bp
ZmMgewo+PiAgICAgICBzdGF0dXMgPSAib2theSI7Cj4+ICAgICAgIHBpbmN0cmwtMCA9IDwmbm9y
X3BpbnM+OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPj4gICAg
ICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIAo+PiAKPj4gICAgICAgbXgyNXU2NDogZmxhc2hAMCB7ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIAo+PiAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0g
PDE+Owo+PiAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDE+OyAgICAgICAgICAgICAKPj4g
ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm14aWN5LG14MjV1NjQzNWYiLCAiamVkZWMsc3Bp
LW5vciI7Cj4+ICAgICAgICAgICAgICAgcmVnID0gPDA+OyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIAo+PiAgICAgICAgICAgICAgIHNwaS1tYXgtZnJlcXVlbmN5ID0gPDEw
NDAwMDAwMD47ICAgICAgICAgICAgICAgICAKPj4gICAgICAgfTsKPj4gfTsKPj4gCj4+ICZzZF9l
bW1jX2Mgewo+PiAgICAgICBwaW5jdHJsLTAgPSA8JmVtbWNfY3RybF9waW5zPiwgPCZlbW1jX2Rh
dGFfNGJfcGlucz4sIDwmZW1tY19kc19waW5zPjsKPj4gICAgICAgYnVzLXdpZHRoID0gPDQ+Owo+
PiB9Owo+PiAKPj4gQW55IGhlbHAgcG9pbnRpbmcgbWUgaW4gdGhlIHJpZ2h0IGRpcmVjdGlvbiBp
cyBncmVhdGx5IGFwcHJlY2lhdGVkLgo+PiAKPj4gVGhhbmtzLAo+PiBDaHJpc3RpYW4KPj4gCj4g
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
