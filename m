Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04C0C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 09:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rH7rFef3An1lid2stGy+QFykytFe6vbk/p84ZXGRV+0=; b=JAb0dwhdMTBrru
	emfQWaklvlz67UblSJVx5ly9Zalsno64AGaCz01IruZcEa+LyApAzEPTzpaLSrqTOSwlZYilES14h
	o1B204xfL2isUvFlb0xy7nq4pIieZTgI7nVtWhnRvyG8BhMztyaBarZoeY28UrmpnnFholcrMehl0
	M8/DaF7X0SP6A9gqAiNGxQNMRk4s1DDShvTz+Rf6TLrH/B/8jWRzlmC9LLn0CVW13zCJwqllmnVDU
	3sS0T9B1VKprjID2AnQgEM7smsJ+txsGcmvMekQzgi8y/yDRzKDVB6LVeN6ZEM3SIlMS1uQdeDECp
	l46X8GKZoEvAgB1PBJ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngju3-002VlB-Ec; Tue, 19 Apr 2022 09:12:07 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngju0-002Vjr-BF
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2022 09:12:05 +0000
Received: by mail-ej1-x62e.google.com with SMTP id u15so31503119ejf.11
 for <linux-mtd@lists.infradead.org>; Tue, 19 Apr 2022 02:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kKLaYCEVMKmMlDHnrWvH5c/SXd3AF+5nvba+a6cqNOQ=;
 b=Cl4pk5aMG22Yh5DlcMaqyAc4dPj0Ncu89FKFAJozTCQiixdXpjKkbI8xYxrIqM0q3w
 8AxDff0qkFeUx2atmvSgF9JBTYQi4h6Ko7QVH6pT+1sy7nc6z+wRX52T3+4ueb+YUaAL
 quLYZmWb6vItMONHJP+rPRr/DBenUc7AyHuqW9GPae3oYG58cu6EF+xKu1sQEY5Da9HO
 D0L1C3GR3r0pn2aveOtBz1H4q69hJXDbIOSPmUGon14EjMDlGdhYphzf8yik+JykeqwO
 cEZbOmFc5iMcuU8uPKV5MMs4VdNlc9DVoPSiUqpxTJMYLpKRStJFvFpO85nyBgMfjPOR
 iQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kKLaYCEVMKmMlDHnrWvH5c/SXd3AF+5nvba+a6cqNOQ=;
 b=0v/vFHCtSmRfo7JLsBZp5+6nWJ1rGmGv7jDigSMhD8meG8GGfIULlCgdOzmNz7hA8X
 P9fxobbMIOYE9JQuaZCkNhbwx73jigrHWtgw/vTn1b7s+F4ErHQ8O9FmB/cgeYwAczsf
 JiuCnmyVS5zovIeUXp8dxo+zZQxA62doOVir7UJGO4NS3ZHnHlvh7TgNS5HkjUoGayzm
 k/jf1MMS1Z6AT6r5Q7nOrCHDw01hjHHfo5I3vEsKkfdlf1Qbs2S96nRDgU5CBaYTj+Kk
 wc8oUhrbYwnBlUIGMTYNaWFtcL2VAaOr6pvMbcLa3r3YsobAvia49Pesbkf2bRhGAG/F
 OYQw==
X-Gm-Message-State: AOAM5331v6MECUd9a33UndVF3YoqbSjHxGsJ/22ZNcyW2Kc+uWefv8Bh
 uWbP+sW9UJdP/1YgYcp64jBR0Apz85MZrhwy+xYuSI1IfPQ=
X-Google-Smtp-Source: ABdhPJzkaBu8QN2KtLC8cpEFPtK0xHLtGak6ksD14oy5wC+WIcoDtuXFdIg5j9faWMICk+1RSNSwcKW3Zo99iYboPWY=
X-Received: by 2002:a17:906:8301:b0:6e4:896d:59b1 with SMTP id
 j1-20020a170906830100b006e4896d59b1mr12029263ejx.396.1650359514317; Tue, 19
 Apr 2022 02:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <CABy3iKxexzn2TnYVV8k0=_onqdrjQGoPeLMOd2q8cqzVECvBWw@mail.gmail.com>
 <20220414192413.0db7ef46@xps13>
 <CABy3iKzERYHD8Kj+NNnPdAxTxO6ANwrUJGcJO77385RtY1ddGg@mail.gmail.com>
 <20220415102929.5c654933@xps13>
 <CABy3iKwAVYkstq4=fg6cjh4VRAzSwGa7JNy494Ag69e_t9UTjA@mail.gmail.com>
 <20220419093317.7fe2ae6c@xps13>
 <542373121.266606.1650354270993.JavaMail.zimbra@nod.at>
 <CABy3iKzeJ4CF74YjF60_F_zbZhhYq_5imuG=BU4fOBrKQ5eqaw@mail.gmail.com>
In-Reply-To: <CABy3iKzeJ4CF74YjF60_F_zbZhhYq_5imuG=BU4fOBrKQ5eqaw@mail.gmail.com>
From: Scott Zhang <macromarship@gmail.com>
Date: Tue, 19 Apr 2022 17:11:43 +0800
Message-ID: <CABy3iKxw1KV6W60-sso7RButgxSDn7WX_FQ6Pz4EVrYQMb-GKw@mail.gmail.com>
Subject: Re: ubifs_decompress: cannot decompress 2293 bytes, compressor lzo,
 error -22
To: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 Richard Weinberger <richard.weinberger@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_021204_440062_8C060E83 
X-CRM114-Status: GOOD (  27.98  )
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

dGhlIGx6byBlcnJvciBpcyBub3QgYWx3YXlzLiBJdCBkaWRuJ3QgaGFwcGVuIG9uIHJvb3QgcGFy
dGl0aW9uIHlldC4KT24gb3B0LCBvbmx5IHdoZW4gZmV3IGZpbGVzIGFyZSBiZWluZyByZWFkLCBk
bWVzZyB3b3VsZCBjb21wbGFpbiBsem8KZGVjb21wcmVzcy4gSSBkb24ndCBrbm93IGhvdyB0aGlz
IGhhcHBlbiBmb3IgZmlyc3QgdGltZS4gT25seSAgd2hlbgp0aGlzIGhhcHBlbnMsIGl0IHN0aWNr
cyB0aGVyZSwgSSBkb24ndCBzZWUgYW55IHNpZGUgZWZmZWN0LCBzZWFtcwpldmVyeXRoaW5nIGNv
bnRpbnVlcyB3b3JraW5nLgoKT24gVHVlLCBBcHIgMTksIDIwMjIgYXQgNTowMyBQTSBTY290dCBa
aGFuZyA8bWFjcm9tYXJzaGlwQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGFua3MuCj4KPiBJIHdp
bGwgZG8gbW9yZSB0ZXN0cy4KPgo+IEkgY3JlYXRlZCB1YmlmcyBieSB1c2luZyBidWlsZHJvb3Qg
d2l0aCBkZWZhdWx0IG9wdGlvbnMuCj4gTXkgbmFuZCBkcml2ZXJzIG9ubHkgcGFzcyBiaXRlcnJv
cnMgdGVzdCBhdCB0aGUgbW9tZW50Lgo+IEkgYW0gdXNpbmcgZGVmYXVsdCBidWlsZHJvb3QgdWJp
ZnMuaW1nIHNvIEkgZGlkbid0IHRlc3Qgd2l0aCBvdGhlcnMgeWV0Lgo+Cj4gSSB3aWxsIGxldCB5
b3Uga25vdyBhZnRlciBJIGZpbmlzaCB0aGUgdGVzdC4KPgo+IE9uIFR1ZSwgQXByIDE5LCAyMDIy
IGF0IDM6NDQgUE0gUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4gd3JvdGU6Cj4g
Pgo+ID4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+ID4gPiBEaWQgeW91IHJ1biB0
aGUgdmFyaW91cyBuYW5kIHRlc3RzIGJlc2lkZXMgbmFuZGJpdGVycnM/IElmIHRoZXkgYWxsCj4g
PiA+IHBhc3MgdGhlbiBtYXliZSBSaWNoYXJkIHdpbGwgYmUgbW9yZSBoZWxwZnVsIHRoYW4gSSBh
bS4uLgo+ID4KPiA+IFsuLi5dCj4gPgo+ID4gPj4KPiA+ID4+IEJ1dCBJIG5vdGljZWQgdGhlIGx6
byBkZWNvbXByZXNzIGVycm9yIGlzIHN0aWxsIHRoZXJlLgo+ID4gPj4gSSBkaWQgIGZvbGxvd2lu
ZyBhY3Rpb25zIHRvIHRlc3QuCj4gPiA+PiAvZGV2L210ZDMgaXMgbW91bnRlZCBvbiAvb3B0IHVz
aW5nIHViaWZzLgo+ID4gPj4gdGFyIHpjdmYgL3Jvb3Qvb3B0LnRhci5neiAvb3B0ICAoZG9uZSB3
aXRob3V0IGVycm9yKQo+ID4gPj4gZm9ybWF0IC9vcHQuCj4gPiA+PiB0YXIgenh2ZiAvcm9vdC9v
cHQudGFyLmd6IC1DIC8KPiA+Cj4gPiBIb3cgZGlkIHlvdSBjcmVhdGUgdWJpZnM/Cj4gPgo+ID4g
RG9lcyB5b3VyIG5hbmQgZHJpdmVyIHBhc3MgdWJpIHRlc3RzPwo+ID4KPiA+ID4+IFRoZW4gd2hl
biBJIHJ1biBwaHAgcHJvZ3JhbSB3aGljaCBpcyBpbiBvcHQuIEkgc2F3IGRtZXNnCj4gPiA+PiBb
ICAxMTguODUwMDAwXSBVQklGUyBlcnJvciAodWJpMDowIHBpZCAxNTI2KTogdWJpZnNfZGVjb21w
cmVzczogY2Fubm90Cj4gPiA+PiBkZWNvbXByZXNzIDIyOTMgYnl0ZXMsIGNvbXByZXNzb3IgbHpv
LCBlcnJvciAtMjIKPiA+ID4+IFsgIDExOC44NjAwMDBdIFVCSUZTIGVycm9yICh1YmkwOjAgcGlk
IDE1MjYpOiBkb19yZWFkcGFnZTogYmFkIGRhdGEKPiA+ID4+IG5vZGUgKGJsb2NrIDE1LCBpbm9k
ZSAzOTYpCj4gPiA+PiBbICAxMTguODcwMDAwXSBVQklGUyBlcnJvciAodWJpMDowIHBpZCAxNTI2
KTogZG9fcmVhZHBhZ2U6IGNhbm5vdCByZWFkCj4gPiA+PiBwYWdlIDE1IG9mIGlub2RlIDM5Niwg
ZXJyb3IgLTIyCj4gPiA+PiBbICAxMTguODgwMDAwXSBVQklGUyBlcnJvciAodWJpMDowIHBpZCAx
NTI2KTogdWJpZnNfZGVjb21wcmVzczogY2Fubm90Cj4gPiA+PiBkZWNvbXByZXNzIDIyOTMgYnl0
ZXMsIGNvbXByZXNzb3IgbHpvLCBlcnJvciAtMjIKPiA+ID4+IFsgIDExOC45MDAwMDBdIFVCSUZT
IGVycm9yICh1YmkwOjAgcGlkIDE1MjYpOiBkb19yZWFkcGFnZTogYmFkIGRhdGEKPiA+ID4+IG5v
ZGUgKGJsb2NrIDE1LCBpbm9kZSAzOTYpCj4gPiA+PiBbICAxMTguOTAwMDAwXSBVQklGUyBlcnJv
ciAodWJpMDowIHBpZCAxNTI2KTogZG9fcmVhZHBhZ2U6IGNhbm5vdCByZWFkCj4gPiA+PiBwYWdl
IDE1IG9mIGlub2RlIDM5NiwgZXJyb3IgLTIyCj4gPiA+PiBbICAxMTguOTIwMDAwXSBVQklGUyBl
cnJvciAodWJpMDowIHBpZCAxNTI2KTogdWJpZnNfZGVjb21wcmVzczogY2Fubm90Cj4gPiA+PiBk
ZWNvbXByZXNzIDIyOTMgYnl0ZXMsIGNvbXByZXNzb3IgbHpvLCBlcnJvciAtMjIKPiA+ID4+IFsg
IDExOC45MzAwMDBdIFVCSUZTIGVycm9yICh1YmkwOjAgcGlkIDE1MjYpOiBkb19yZWFkcGFnZTog
YmFkIGRhdGEKPiA+ID4+IG5vZGUgKGJsb2NrIDE1LCBpbm9kZSAzOTYpCj4gPiA+PiBbICAxMTgu
OTQwMDAwXSBVQklGUyBlcnJvciAodWJpMDowIHBpZCAxNTI2KTogZG9fcmVhZHBhZ2U6IGNhbm5v
dCByZWFkCj4gPiA+PiBwYWdlIDE1IG9mIGlub2RlIDM5NiwgZXJyb3IgLTIyCj4gPiA+Pgo+ID4g
Pj4gSSByZW1vdmVkIHRoZSB1Ymlmc19kdW1wX25vZGUgY2FsbCB0byBhdm9pZCBtYW55IGR1bXAg
dGV4dC4gVGhlCj4gPiA+PiBwcm9ibGVtIGlzIHdoZW4gSSBydW4gcGhwIHByb2dyYW0sIGxvdHMg
b2YgYWJvdmUgbG9ncyBkdW1wZWQuCj4gPiA+PiBCdXQgSSBkb24ndCBzZWUgYW55IGVmZmVjdCBv
ZiB0aGUgYWJvdmUgbG9ncy4gdGhlIHByb2dyYW0gc2VlbXMgcnVubmluZy4KPiA+ID4+IElzIHRo
ZXJlIGEgcG9zc2liaWxpdHkgdGhlIHVuZGVybHlpbmcgbmFuZCBkcml2ZXIgZGF0YSBpcyBvaywg
YnV0IHRoZQo+ID4gPj4gbHpvIGNvbXByZXNzL2RlY29tcHJlc3MgY29kZSBoYXMgYnVncyA/ICBJ
IGFtIHJ1bm5pbmcgbGludXgtNS40LnkKPiA+ID4+IGNsb25lZCBmcm9tIGtlcm5lbC5vcmcuCj4g
Pgo+ID4gRG9lcyB0aGUgcHJvYmxlbSBvbmx5IGhhcHBlbiB3aXRoIGx6bz8KPiA+Cj4gPiBQbGVh
c2UgcmUtdGVzdCB3aXRoIG5vIGNvbXByZXNzb3IgZW5hYmxlZCAoY29tcHI9bm9uZSkgYW5kIGFs
c28gbW91bnQgd2l0aAo+ID4gdGhlIGNoa19kYXRhX2NyYyBtb3VudCBvcHRpb24uCj4gPgo+ID4g
VGhhbmtzLAo+ID4gLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
