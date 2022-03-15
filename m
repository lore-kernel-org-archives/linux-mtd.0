Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D8DC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Mar 2022 17:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TQzG98YooC5GvKCZpQqCjleBmCQctXLQ5LxjTmqgv4A=; b=4PLXkwDnRoVLel
	uIfXgiI0ygqXRr4+MjQ1KMGrejRvu9NcHdlYYpuhjN9E+Rvn/Ezea9Ej1UhofhpKJcOHmhDOHMYPV
	QbuQVR5lMlB7p3Y9OKPAwllZCZTgu8DEJgawFtRUKq2LkDSpzIpqLGpeYv6cWFxQxLf8Clr5jZoS4
	zDi19kQG2HxvjoRFrn0lc20Kk4yicaxAw1lcAz7FB574SibA/P/RYb3U2pCNhqmAZKhmgTamWxqh0
	9xWGn8znayQLiyZ/9deMjDh23J/eE1Bq4CRkv8QNOci/hru7D3b0+yYny11UroWYqvp5oQNmwRtR/
	/oG9oiiNwzLDtaih+R1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUAeZ-00A0O8-UE; Tue, 15 Mar 2022 17:08:12 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUAeV-00A0MT-Po
 for linux-mtd@lists.infradead.org; Tue, 15 Mar 2022 17:08:09 +0000
Received: by mail-pl1-x635.google.com with SMTP id w8so840058pll.10
 for <linux-mtd@lists.infradead.org>; Tue, 15 Mar 2022 10:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FXgbh91mofT6ueYfIYvHiSyrLyBtsVrdJ7zy/si9CWc=;
 b=BPJIUtmONNvoXLyizoNdt7q1zwlZDi+bckcMBZVDGgI9J9cRge7qOxl/2bS8f2syTp
 gs8MwLxS2flJwXWp2tsu2uV0S786moUZMhuV0R2PRcFjzGPqpTbOvm3sEaqQ2Ubl288X
 mDL8lFxZleETHd65MAr+gGSQ3sCuyqP9aso5C2hH4g2dk0zoEsJpTbC4O+tzK3NhmWG5
 bQ44b3it3aknDfj/yF+JnKYLfsPKFEp8PzlxUTv129rj3gdYtm6Ghg79nwR4Q8KbWHF2
 DXwJp1jpLopXUpsFlJDp10Sx+X2NDhG/2OOGvxSQe6wgkzUS8hlsqE1spn/SjPPTgQpp
 tiyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FXgbh91mofT6ueYfIYvHiSyrLyBtsVrdJ7zy/si9CWc=;
 b=UuwO5mi5hwsGvlE2ieHrSux5lmjeMSAdLKcfx/FhGmwqDyazys0MIAkHoc6wVwlXah
 sRYC75tBaq6UtDGuGg35rcjPic8khffn5yaoHyAV0Q//Qy0SmejiB0HAomWNyxGJIEh2
 Sl6hCiFV7VpHS8hfvRPIcOvVRk3/naMCCNDn9UWwTr3av4m6HQo7u/yI7ZcxIf4/8eUA
 pqBFBaZwsYaYp3VDUp6N9+L3ZCeTmYKGUM8NpMD7Oxf1FeZznTqZyJdQv2XMHHZRGI0w
 c7EWpYdpYCxpPnEZsJ3rM4CM07t6D+5aOLUTHuCO3pztWSH/6znAcp601EdufZDE0Wns
 bDtA==
X-Gm-Message-State: AOAM530yiMW0kUVniLm9VHhKDS5cLWyQsAbayXHLYCyJ7VOMrHXIdDCq
 xwltE56QWXUmw0wx15X/Md4=
X-Google-Smtp-Source: ABdhPJzfs60WSGQoHkjaE+OLWvC/tgpviHXr4F8WXGL2J5ZJYhNdlddrY5WSflqZ9oGLRlLSd5GhZg==
X-Received: by 2002:a17:90b:4b8d:b0:1bf:923e:a522 with SMTP id
 lr13-20020a17090b4b8d00b001bf923ea522mr5666110pjb.71.1647364086454; 
 Tue, 15 Mar 2022 10:08:06 -0700 (PDT)
Received: from [192.168.122.100] (133-175-21-116.tokyo.ap.gmo-isp.jp.
 [133.175.21.116]) by smtp.gmail.com with ESMTPSA id
 r1-20020a63b101000000b00380989bcb1bsm21475143pgf.5.2022.03.15.10.08.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 10:08:06 -0700 (PDT)
Message-ID: <d9903772-14ac-7ee2-487a-a858dc65d564@gmail.com>
Date: Wed, 16 Mar 2022 02:08:03 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] mtd: cfi_cmdset_0002: Use chip_ready() for write on
 S29GL064N
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
References: <20220306153213.411425-1-ikegami.t@gmail.com>
 <983a44fb-2f79-57b5-c161-2684feb2a0dc@ti.com> <20220315105008.7cca3e2e@xps13>
From: Tokunori Ikegami <ikegami.t@gmail.com>
In-Reply-To: <20220315105008.7cca3e2e@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_100807_894749_F0B9F78E 
X-CRM114-Status: GOOD (  26.41  )
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

SGksCgpPbiAyMDIyLzAzLzE1IDE4OjUwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhlbGxvLAo+
Cj4gdmlnbmVzaHJAdGkuY29tIHdyb3RlIG9uIFR1ZSwgMTUgTWFyIDIwMjIgMTE6NDE6NTIgKzA1
MzA6Cj4KPj4gSGkgTWlxdWVsLAo+Pgo+PiBPbiAwNi8wMy8yMiA5OjAyIHBtLCBUb2t1bm9yaSBJ
a2VnYW1pIHdyb3RlOgo+Pj4gVGhlIHJlZ3Jlc3Npb24gaXNzdWUgaGFzIGJlZW4gY2F1c2VkIG9u
IFMyOUdMMDY0TiBhbmQgcmVwb3J0ZWQgaXQuCj4+PiBBbHNvIHRoZSBjaGFuZ2UgbWVudGlvbmVk
IGlzIHRvIHVzZSBjaGlwX2dvb2QoKSBmb3IgYnVmZmVyZWQgd3JpdGUuCj4+PiBTbyBkaXNhYmxl
IHRoZSBjaGFuZ2Ugb24gUzI5R0wwNjROIGFuZCB1c2UgY2hpcF9yZWFkeSgpIGFzIGJlZm9yZS4K
Pj4+Cj4+PiBGaXhlczogZGZlYWUxMDczNTgzKCJtdGQ6IGNmaV9jbWRzZXRfMDAwMjogQ2hhbmdl
IHdyaXRlIGJ1ZmZlciB0byBjaGVjayBjb3JyZWN0IHZhbHVlIikKPj4+IFNpZ25lZC1vZmYtYnk6
IFRva3Vub3JpIElrZWdhbWkgPGlrZWdhbWkudEBnbWFpbC5jb20+Cj4+PiBDYzogTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPj4+IENjOiBSaWNoYXJkIFdlaW5iZXJn
ZXIgPHJpY2hhcmRAbm9kLmF0Pgo+Pj4gQ2M6IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hy
QHRpLmNvbT4KPj4+IENjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4gQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPj4+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Iv
YjY4N2MyNTktNjQxMy0yNmM5LWQ0YzktYjNhZmE2OWVhMTI0QHBlbmd1dHJvbml4LmRlLwo+PiBD
b3VsZCB5b3UgcGxlYXNlIHB1bGwgdGhpcyBpbiBmb3IgdjUuMTgtcmMxIGFzIHRoaXMgaXMgYSBy
ZWdyZXNzaW9uCj4+IGJlaW5nIHRyYWNrZWQgZm9yIGEgd2hpbGU/Cj4gSSB3YXMgYWJvdXQgdG8g
YXBwbHkgdGhlIHBhdGNoIGJ1dCByZXZpZXdpbmcgaXQgcXVpY2tseSBzaG93biBhIG51bWJlcgo+
IG9mIGlzc3Vlcy4gSSBjYW4gc3RpbGwgcHVsbCB0aGUgcGF0Y2ggZm9yIC1yYzEgaWYgYWxsIHRo
aXMgaXMKPiBjb3JyZWN0ZWQgcmF0aGVyIHF1aWNrbHkgYnV0IG90aGVyd2lzZSBpdCB3aWxsIGdv
IHRocm91Z2ggRml4ZXMgbGF0ZXIKPiBvbi4KPgo+IC0gSSBqdXN0IGRvbid0IHVuZGVyc3RhbmQg
dGhlIGNvbW1pdCBsb2csIHBsZWFzZSByZXBocmFzZSBpdCBlbnRpcmVseS4KPiAgICBZb3UgY2Fu
IGluY2x1ZGUgdGhlIGxpbmsgdG8gdGhlIGJ1ZyByZXBvcnQgYXMgd2VsbCBpbnNpZGUgdGhlIGNv
bW1pdAo+ICAgIHRleHQsIG5vdCBhcyBwYXJ0IG9mIGEgTGluayB0YWcsIGJlY2F1c2UgdGhlIExp
bmsgdGFnIGlzIGhlcmUgdG8KPiAgICByZWZlciB0byB0aGUgbWFpbGluZyBsaXN0IGRpc2N1c3Np
b24gYW5kIGlzIGFkZGVkIGF1dG9tYXRpY2FsbHkuCj4gICAgU29tZXRoaW5nIGxpa2U6Cj4KPiAJ
QXMgcG9pbnRlZCBvdXQgYnkgdGhpcyBidWcgcmVwb3J0IFsxXSwgPHdoYXQ+IGlzIG5vdyBicm9r
ZW4gb24KPiAJUzI5R0wwNjROLiBUaGUgcmVhc29uIGlzIHRoYXQgPGV4cGxhaW4gdGhlIHByb2Js
ZW0+LiBPbmUgd2F5IHRvCj4gCXNvbHZlIHRoZSBpc3N1ZSBpcyB0byA8ZXhwbGFpbiB3aHkgSSBz
aG91bGQgY2hvb3NlIHRoaXMKPiAJc29sdXRpb24+Lgo+Cj4gCVsxXSA8dGhlIGxpbmsgaGVyZT4K
VGhhbmtzLiBKdXN0IGZpeGVkIGJ5IHRoZSB2ZXJzaW9uIDMgcGF0Y2hlcyBhbmQgc2VudCB0aGVt
Lgo+IC0gVGhlIHBhdGNoIGl0c2VsZiBzaG91bGQgYmUgc3BsaXQgaW50byBhdCBsZWFzdCB0aHJl
ZSBwYXJ0czoKPiAgICAqIFRoZSBJRCBkZWZpbml0aW9uIChzaG91bGQgbm90IGJlIHBhcnQgb2Yg
dGhlIGZpeCkuCj4gICAgKiBUaGUgY2hpcF9jaGVjay9jaGlwX3JlYWR5L2NoaXBfZ29vZF9mb3Jf
d3JpdGUgY29kZSBtb3Zlcy9yZW5hbWluZwo+ICAgICAgaW5kZXBlbmRlbnRseSBvZiBhbnkgZnVu
Y3RpbmFsIGNoYW5nZSBhcyBhIHByZXBhcmF0aW9uIHBhdGNoLgo+ICAgICogVGhlIGFjdHVhbCBm
aXggd2l0aGluIG9uZSBvZiB0aGUgYWJvdmUgZnVuY3Rpb25zLgpUaGlzIGlzIGFsc28gZml4ZWQg
YnkgdGhlIHZlcnNpb24gcGF0Y2hlcy4KPgo+IEFzaWRlIGZyb20gdGhlc2UsIEkgZG9uJ3QgcXVp
dGUgZ2V0IHdoYXQgdGhlIF9feGlwcmFtIGtleXdvcmQgaXMKPiBzdXBwb3NlZCB0byBjYXJyeS4g
V2UgcmV0dXJuIGEgYm9vbGVhbiBleHByZXNzaW9uIHN0b3JlZCBpbiBhbiBpbnQKPiBwcm92aWRl
ZCBieSB0aGUgbWFwX3dvcmRfZXF1YWwoKSBtYWNybyB3aGljaCBkb2VzIHJldHVybiBhIHNpbXBs
ZSBpbnQKPiBkZWNsYXJlZCBvbiB0aGUgc3RhY2suIEl0J3Mgbm90IHN0b3JlZCBhbnl3aGVyZSBl
bHNlIHRoYW4gcmVndWxhciBSQU0sCj4gb3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KClRoZSBf
X3hpcHJhbSBrZXl3b3JkIHdhcyBpbXBsZW1lbnRlZCBieSB0aGUgY29tbWl0IDAyYjE1ZTM0M2Fl
ZSBmb3IgdGhlIApjaGlwX3JlYWR5IGFuZCBjaGlwX2dvb2QsIGV0Yy4KQWxzbyB0aGUgZGVmaW5p
c2lvbiBpcyBpbXBsZW1uZXRlZCBpbiBpbmNsdWRlL2xpbnV4L210ZC94aXAuaCBhcyBiZWxvdy4K
Ci8qCiDCoCogRnVuY3Rpb24gdGhhdCBhcmUgbW9kaWZ5aW5nIHRoZSBmbGFzaCBzdGF0ZSBhd2F5
IGZyb20gYXJyYXkgbW9kZSBtdXN0CiDCoCogb2J2aW91c2x5IG5vdCBiZSBydW5uaW5nIGZyb20g
Zmxhc2guwqAgVGhlIF9feGlwcmFtIGlzIHRoZXJlZm9yZSBtYXJraW5nCiDCoCogdGhvc2UgZnVu
Y3Rpb25zIHNvIHRoZXkgZ2V0IHJlbG9jYXRlZCB0byByYW0uCiDCoCovCiNpZmRlZiBDT05GSUdf
WElQX0tFUk5FTAojZGVmaW5lIF9feGlwcmFtIG5vaW5saW5lIF9fc2VjdGlvbigiLnhpcHRleHQi
KQojZW5kaWYKClRoZSBjaGFuZ2VzIGZvciB0aGUgZml4IGp1c3QgZm9sbG93cyB0aGUgaW1wbGVt
ZW50YXRpb24gYXMgc2FtZSBJIHRoaW5rLgpCeSB0aGUgd2F5IGl0IHdhcyBhZGRlZCB0byB1c2Ug
dGhlIF9feGlwcmFtIGtleXdvcmQgZm9yIApjZmlfdXNlX2NoaXBfcmVhZHlfZm9yX3dyaXRlKCkg
YWxzby4KClJlZ2FyZHMsCklrZWdhbWkKCj4KPj4gQWNrZWQtYnk6IFZpZ25lc2ggUmFnaGF2ZW5k
cmEgPHZpZ25lc2hyQHRpLmNvbT4KPj4KPj4gWy4uLl0KPj4KPj4gUmVnYXJkcwo+PiBWaWduZXNo
Cj4+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
