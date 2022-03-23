Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E49C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Mar 2022 16:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p8g43RFedJ8c3c8Zew7pOX2rqYu4Lw4AznEITmbXVNo=; b=NeOFvuuCHjWfMu
	TLR9xMS0TascOmYcfCsmJq1TkZWou7stg8Wfo947icNcit/PO1AyfH1J22p7blmMjHwF7yrMg2Tnq
	nHwv/z1ohfWc4BDhkgndkiZFXF+TzF3Byuh+66OTXxEmR/sFEP6dxkoUqfS2fjebgzymMZnBKGlK/
	GD3WBntrU4PcEaduZXtqDoMlJUWhEYfKuAdsFZQC/FOlEbsekzL9oyoC0vHVKVQ86htam8Wd8K4kh
	N/cfIPyHwNrMNpXCQJyFDgXaS1LLcQzh2gTJcB0FDbEplygmFw8XOweXo7NJS23O2Mi7wZ6uXkqzS
	+6w6hPRGcLfAPSfjwuTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX47g-00EI4H-E9; Wed, 23 Mar 2022 16:46:12 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX47a-00EI2D-Qo
 for linux-mtd@lists.infradead.org; Wed, 23 Mar 2022 16:46:11 +0000
Received: by mail-pg1-x52e.google.com with SMTP id c2so1572119pga.10
 for <linux-mtd@lists.infradead.org>; Wed, 23 Mar 2022 09:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hHo3mWg/SUHOC3nqhHEfvtAzVJvhJvcGTJJTokvqAjg=;
 b=fZfSPl+t1YDe90ELS1zNGafsCk5jCmuK5x8k8R+FORoV8KDvnZLkMGiV6z6rmHuVS5
 5LgkASAsNy2C4h1wdvykNRuAwg4hS9pTbj54Gq6KZ9BHz5D0fU/WfhuF9uQX3Uo+VaI0
 CVEynGBPwC441mLfIad08XROaGXGm5eh/Jij9R9BdARccrqj89G1XeWQIa4wtGCQPN0G
 fb+02bnbnd/XSGU9vR/g6M0PSaKK2mzqJsCm8t0U8xMQogZwgO8I0WDug0ZSHHjV0URR
 WZUWNgVC8Aad32FsImGZ4dl2Jiya0iDcix8ZeO6CqYVfblTHDTR1lXl7OmG2MIt1ZFGF
 ceow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hHo3mWg/SUHOC3nqhHEfvtAzVJvhJvcGTJJTokvqAjg=;
 b=tRUSCxmmS0MOQ1nnQ5EzYxrrZJkrMWdhomYDrfEbp9JjEovN5aIMkvPlM2uLYeoGh0
 zGIcSembGrcxJRdQcX5z2i3Osl1AOhBhtYWCmyGBnYrqnVS+0k/PaaDJlh5rbAjvftic
 2c7j7be8B6zPninz9a44MekhkNqbvPtz1bfm4yvkezpEWOt3wgYBCaywynClbYxurOev
 SDzT+Y62bYjDzGFuz707UmRTRA83B/+gEPOwHwIIRcPTitQSKuyBfTgq0zhFCVDpA/wX
 7Po3xbEcpuqhzjGvQ0dOcu/YYcJc4PO8hd0I6fZ2v2SCo/c5QfzRVw9wGwy/TQdtqxrU
 hH5Q==
X-Gm-Message-State: AOAM532tDR2udFEqm5LY3Eb7KVWMqmk/x/aS4pP95HkCkET7cHozuFQM
 PQGEjT4OB5XSP5D1jvJMvJ4=
X-Google-Smtp-Source: ABdhPJyRHNQUTvp6iwchcrCWaNgj8AFnAQTSWoAx/UTBREsmYGqxHP3rXjkAnJ6VjCJiAJCcd5VrEQ==
X-Received: by 2002:a63:1847:0:b0:381:8214:3a7d with SMTP id
 7-20020a631847000000b0038182143a7dmr615585pgy.134.1648053964009; 
 Wed, 23 Mar 2022 09:46:04 -0700 (PDT)
Received: from ?IPV6:240b:10:2720:5500:98c:eff5:b721:5f7b?
 ([240b:10:2720:5500:98c:eff5:b721:5f7b])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a056a00150f00b004fac01c0198sm431291pfu.40.2022.03.23.09.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 09:46:03 -0700 (PDT)
Message-ID: <48459921-b3a4-a399-3a8a-86bd2695a601@gmail.com>
Date: Thu, 24 Mar 2022 01:46:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 3/3] mtd: cfi_cmdset_0002: Rename chip_ready variables
 and add ID definition
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20220322234952.25520-1-ikegami.t@gmail.com>
 <20220323090257.298130d3@xps13>
From: Tokunori Ikegami <ikegami.t@gmail.com>
In-Reply-To: <20220323090257.298130d3@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_094606_904384_F8E0BFD8 
X-CRM114-Status: GOOD (  28.00  )
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

SGkgTWlxdWVsLXNhbiwKCk9uIDIwMjIvMDMvMjMgMTc6MDIsIE1pcXVlbCBSYXluYWwgd3JvdGU6
Cj4gSGkgVG9rdW5vcmksCj4KPiBpa2VnYW1pLnRAZ21haWwuY29tIHdyb3RlIG9uIFdlZCwgMjMg
TWFyIDIwMjIgMDg6NDk6NTIgKzA5MDA6Cj4KPj4gVGhlIGRlZmluaXRpb24gaXMgZm9yIHRoZSBT
MjlHTDA2NE4gbW9kZWwgbnVtYmVyIDAxLCAwMiwgVjEgYW5kIFYyLgo+IFBsZWFzZSBrZWVwIHJl
c2VuZGluZyB0aGUgZW50aXJlIHNlcmllcy4KSSBzZWUuIChJbiB0aGUgcGFzdCBpdCB3YXMgbWVu
dGlvbmVkIGFzIG5vdCBuZWNlc3NhcnkgdG8gc2VuZCBhbGwgCnBhdGNoZXMgaWYgYSBwYXRjaCBm
aXhlZCBvZiBzZXJpZXMuKQo+Cj4+IFNpZ25lZC1vZmYtYnk6IFRva3Vub3JpIElrZWdhbWkgPGlr
ZWdhbWkudEBnbWFpbC5jb20+Cj4+IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPgo+PiBDYzogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KPj4g
Q2M6IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KPj4gQ2M6IGxpbnV4LW10
ZEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gWW91IGRvbid0IG5lZWQgYWxsIHRoZXNlIENjIHRoZXJl
LCBqdXN0IGFkZCB0aGVtIHdoZW4gc2VuZGluZwo+IGV2ZXJ5dGhpbmcgd2l0aCBnaXQtZm9ybWF0
LXBhdGNoLiBJIGJlbGlldmUgeW91IGNhbiB1c2UgdGhlc2UgZmllbGRzCj4ganVzdCBmb3IgImV4
dHJhIiBwZW9wbGUgd2hpY2ggYXJlIG5vdCBub3RhYmx5IGV4cGVjdGVkLgoKV2lsbCBkbyBhcyBz
by4gQnkgdGhlIHdheSBpdCB3YXMgY29tbWVudGVkIG9uIHRoZSB2ZXJzaW9uIDEgcGF0Y2ggYnkg
ClZpZ25lc2gtc2FuIGFzIGJlbG93IHNvIGFkZGVkIENDIG1haW50YWluZXJzIGJ5IHZlcnNpb24g
MiBwYXRjaC4KIMKgPiBQbGVhc2UgQ0MgbWFpbnRhaW5lcnMgZnJvbQogwqA+CiDCoD4gLi9zY3Jp
cHRzL2dldF9tYWludGFpbmVyLnBsIC1mIGRyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAw
Mi5jCiDCoD4KIMKgPiBFbHNlLCBwYXRjaCB3b3VsZCBub3QgZ2V0IGF0dGVudGlvbiBpbiB0aW1l
LgoKPgo+PiAtLS0KPj4gICBkcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYyB8IDE5
ICsrKysrKysrKystLS0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KSwgOSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2NoaXBzL2Nm
aV9jbWRzZXRfMDAwMi5jIGIvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMKPj4g
aW5kZXggNTkzMzQ1MzBkZDQ2Li42NzQ1M2Y1OWM2OWMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
bXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL2NoaXBzL2Nm
aV9jbWRzZXRfMDAwMi5jCj4+IEBAIC00OCw2ICs0OCw3IEBACj4+ICAgI2RlZmluZSBTU1Q0OUxG
MDQwQgkJMHgwMDUwCj4+ICAgI2RlZmluZSBTU1Q0OUxGMDA4QQkJMHgwMDVhCj4+ICAgI2RlZmlu
ZSBBVDQ5QlY2NDE2CQkweDAwZDYKPj4gKyNkZWZpbmUgUzI5R0wwNjROX01OMTIJCTB4MGMwMQo+
PiAgIAo+PiAgIC8qCj4+ICAgICogU3RhdHVzIFJlZ2lzdGVyIGJpdCBkZXNjcmlwdGlvbi4gVXNl
ZCBieSBmbGFzaCBkZXZpY2VzIHRoYXQgZG9uJ3QKPj4gQEAgLTQ0NSw3ICs0NDYsNyBAQCBzdGF0
aWMgdm9pZCBmaXh1cF9xdWlya3Moc3RydWN0IG10ZF9pbmZvICptdGQpCj4+ICAgCXN0cnVjdCBt
YXBfaW5mbyAqbWFwID0gbXRkLT5wcml2Owo+PiAgIAlzdHJ1Y3QgY2ZpX3ByaXZhdGUgKmNmaSA9
IG1hcC0+ZmxkcnZfcHJpdjsKPj4gICAKPj4gLQlpZiAoY2ZpLT5tZnIgPT0gQ0ZJX01GUl9BTUQg
JiYgY2ZpLT5pZCA9PSAweDBjMDEpCj4+ICsJaWYgKGNmaS0+bWZyID09IENGSV9NRlJfQU1EICYm
IGNmaS0+aWQgPT0gUzI5R0wwNjROX01OMTIpCj4+ICAgCQljZmktPnF1aXJrcyB8PSBDRklfUVVJ
UktfRFFfVFJVRV9EQVRBOwo+PiAgIH0KPj4gICAKPj4gQEAgLTQ3NSw3ICs0NzYsNyBAQCBzdGF0
aWMgc3RydWN0IGNmaV9maXh1cCBjZmlfZml4dXBfdGFibGVbXSA9IHsKPj4gICAJeyBDRklfTUZS
X0FNRCwgMHgwMDU2LCBmaXh1cF91c2Vfc2Vjc2kgfSwKPj4gICAJeyBDRklfTUZSX0FNRCwgMHgw
MDVDLCBmaXh1cF91c2Vfc2Vjc2kgfSwKPj4gICAJeyBDRklfTUZSX0FNRCwgMHgwMDVGLCBmaXh1
cF91c2Vfc2Vjc2kgfSwKPj4gLQl7IENGSV9NRlJfQU1ELCAweDBjMDEsIGZpeHVwX3MyOWdsMDY0
bl9zZWN0b3JzIH0sCj4+ICsJeyBDRklfTUZSX0FNRCwgUzI5R0wwNjROX01OMTIsIGZpeHVwX3My
OWdsMDY0bl9zZWN0b3JzIH0sCj4+ICAgCXsgQ0ZJX01GUl9BTUQsIDB4MTMwMSwgZml4dXBfczI5
Z2wwNjRuX3NlY3RvcnMgfSwKPj4gICAJeyBDRklfTUZSX0FNRCwgMHgxYTAwLCBmaXh1cF9zMjln
bDAzMm5fc2VjdG9ycyB9LAo+PiAgIAl7IENGSV9NRlJfQU1ELCAweDFhMDEsIGZpeHVwX3MyOWds
MDMybl9zZWN0b3JzIH0sCj4+IEBAIC04MzMsNyArODM0LDcgQEAgc3RhdGljIGludCBfX3hpcHJh
bSBjaGlwX3JlYWR5KHN0cnVjdCBtYXBfaW5mbyAqbWFwLCBzdHJ1Y3QgZmxjaGlwICpjaGlwLAo+
PiAgIAkJCSAgICAgICB1bnNpZ25lZCBsb25nIGFkZHIsIG1hcF93b3JkICpleHBlY3RlZCkKPj4g
ICB7Cj4+ICAgCXN0cnVjdCBjZmlfcHJpdmF0ZSAqY2ZpID0gbWFwLT5mbGRydl9wcml2Owo+PiAt
CW1hcF93b3JkIGQsIHQ7Cj4+ICsJbWFwX3dvcmQgb2xkZCwgY3VyZDsKPiBBbGwgdGhlIGNoYW5n
ZXMgaGVyZSBhbmQgYmVsb3cgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggdGhpcyBjb21taXQuIFlv
dQo+IGNhbiByZW5hbWUgdmFyaWFibGVzIGlmIHlvdSB3aXNoLCBidXQgdGhhdCBpcyBhIHNlcGFy
YXRlIGNvbW1pdC4KT2theS4gKEkgdGhvdWdodCB0aGUgdmVyc2lvbiA2IDMvMyBwYXRjaCBmb2xs
b3dlZCB0aGUgY29tbWVudCBiZWxvdy4pCiDCoD4gQSBsb3Qgb2YgdGhlIGRpZmYgaXMganVzdCBh
IHJlbmFtZS4gSSBhbSBub3QgYWdhaW5zdCBhIHJlbmFtZSBpZiB5b3UKIMKgPiBmZWVsIGl0J3Mg
YmV0dGVyLCBidXQgaW4gdGhpcyBvcmRlcjoKIMKgPiAxOiBwcmVwYXJlIHRoZSBmaXgKIMKgPiAy
OiBmaXgKCiDCoD4gMzogcmVuYW1lL2RlZmluZSBpZCdzLCB3aGF0ZXZlcgoKUmVnYXJkcywKSWtl
Z2FtaQoKPgo+PiAgIAlpbnQgcmV0Owo+PiAgIAo+PiAgIAlpZiAoY2ZpX3VzZV9zdGF0dXNfcmVn
KGNmaSkpIHsKPj4gQEAgLTg0NCwyMCArODQ1LDIwIEBAIHN0YXRpYyBpbnQgX194aXByYW0gY2hp
cF9yZWFkeShzdHJ1Y3QgbWFwX2luZm8gKm1hcCwgc3RydWN0IGZsY2hpcCAqY2hpcCwKPj4gICAJ
CSAqLwo+PiAgIAkJY2ZpX3NlbmRfZ2VuX2NtZCgweDcwLCBjZmktPmFkZHJfdW5sb2NrMSwgY2hp
cC0+c3RhcnQsIG1hcCwgY2ZpLAo+PiAgIAkJCQkgY2ZpLT5kZXZpY2VfdHlwZSwgTlVMTCk7Cj4+
IC0JCXQgPSBtYXBfcmVhZChtYXAsIGFkZHIpOwo+PiArCQljdXJkID0gbWFwX3JlYWQobWFwLCBh
ZGRyKTsKPj4gICAKPj4gLQkJcmV0dXJuIG1hcF93b3JkX2FuZGVxdWFsKG1hcCwgdCwgcmVhZHks
IHJlYWR5KTsKPj4gKwkJcmV0dXJuIG1hcF93b3JkX2FuZGVxdWFsKG1hcCwgY3VyZCwgcmVhZHks
IHJlYWR5KTsKPj4gICAJfQo+PiAgIAo+PiAtCWQgPSBtYXBfcmVhZChtYXAsIGFkZHIpOwo+PiAt
CXQgPSBtYXBfcmVhZChtYXAsIGFkZHIpOwo+PiArCW9sZGQgPSBtYXBfcmVhZChtYXAsIGFkZHIp
Owo+PiArCWN1cmQgPSBtYXBfcmVhZChtYXAsIGFkZHIpOwo+PiAgIAo+PiAtCXJldCA9IG1hcF93
b3JkX2VxdWFsKG1hcCwgZCwgdCk7Cj4+ICsJcmV0ID0gbWFwX3dvcmRfZXF1YWwobWFwLCBvbGRk
LCBjdXJkKTsKPj4gICAKPj4gICAJaWYgKCFyZXQgfHwgIWV4cGVjdGVkKQo+PiAgIAkJcmV0dXJu
IHJldDsKPj4gICAKPj4gLQlyZXR1cm4gbWFwX3dvcmRfZXF1YWwobWFwLCB0LCAqZXhwZWN0ZWQp
Owo+PiArCXJldHVybiBtYXBfd29yZF9lcXVhbChtYXAsIGN1cmQsICpleHBlY3RlZCk7Cj4+ICAg
fQo+PiAgIAo+PiAgIHN0YXRpYyBpbnQgX194aXByYW0gY2hpcF9nb29kKHN0cnVjdCBtYXBfaW5m
byAqbWFwLCBzdHJ1Y3QgZmxjaGlwICpjaGlwLAo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
