Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C80210775EA
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2026 17:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cq66uYGD2lxD8YJaSzQohoFwhAhzRutKnowIJ9dk470=; b=BLRyIBGV5pnMg4
	Y0S1UlJ3m5bJqCLVCYDmoRp6UNYSuvM0x6Yl/7RjGzslXloiHJwbZimjLFhDCkewmjjsJT7EwhowS
	CWB1gTAHc7U3wgYEl1/wRFYUhObPbw5tJA2DrloQa4iCJ22fUuNbndH6SxPTMb4gwNQWifpOc3LZ2
	pbg55TNesmyiR1o5dulJcVG3a4zwgxshqgDy8ovlDlcduXdDXrWSNj2WAo3m6XA6VbYr+beTIyEHK
	r/R2hYnY38fpNIa6VNfu7fREuzd4E+mynuT5RghE0CmEWECdOOYLwyB9f3J6vRTruFf+E8UnnRA9S
	IQw61/QqypcTUpJ+a/yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uXB-000000092vy-35Ej;
	Wed, 18 Mar 2026 17:18:17 +0000
Received: from mo6-p01-ob.smtp.rzone.de ([2a01:238:400:200::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uX8-000000092u3-2hQP
	for linux-mtd@lists.infradead.org;
	Wed, 18 Mar 2026 17:18:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1773854279; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=fdWgoq00iYlVwG8KDGC7mViZDq8QSDGdVUpNQmzWDOKDAFXr+iQstbpoYOzgDJuVvl
    LErcN/2+X0z40c64OVDFSkvVjUSgQUpHpLP0RreqtNZ5qBqMk7rI6a6UztkaSAKjYTRL
    g/U1q8lkkhY4KM5t0Gr7IWOm4CHrwPIoIjlQ6OiRjVhqiEvDkBD13SzexznQphMKHvHZ
    86j3o2TykBsubI3tFMErSVLOvtIOGmXQd5XGDaLG/lN/1BnRSk8fgEecdEg9Txll8B08
    yQEW296P9JHLpdpg244O8JdXV4h+EAuBoVnAkudBiIqWurv4YVigXhg5vxnM5bo90f6d
    zGFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1773854279;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=eJG9igU4GgFHQQXkfYhJX4fK62Mj6n93ilY2UUcXHSk=;
    b=XGfV0thahFhnOdgXc4xQ3MfvhIAdSptnCf1Mh0+glBNmSJh9W7pPqzwLHAiMX2UMSI
    eT+WrJAPDpZKiHtyhVrl1Mj/+CeF5xMJZ++T/G1bf4RgtXmfW099lMao9/3+hbZTi2Md
    hMkb1+bOufl7HVSBNYxFSxp/BztVyHvpmwUcwkMpdE7K2ny2noo8pcWzubpjcSFlbpWz
    tKFDI5fk6/Zue2dwqQqu9/C/reeETQB2D9pvvOUXe47y9B1DY3TtJB1qMD33Qskaa2Oj
    sQnWCFo3xExNB+atrM2+V23Lfsb/zKN6n8XY+NMCuVVfhRDOWSFpW0h2nPhWitZZsmcf
    mjCA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1773854279;
    s=strato-dkim-0002; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=eJG9igU4GgFHQQXkfYhJX4fK62Mj6n93ilY2UUcXHSk=;
    b=brSCnAKoN8pM7b0ykmTIVIY6AICsnLc54uXtNtl26lmIObXWbI05tM6xvQ/rcPd41E
    gyBpBILacN3d4ud8puvJQPat9Y+EM49HzyWdl1/5eJpzgtZCrmRphze0aCkr6MF5Y19D
    CVIwaI1FIKqpu7F+F23MgD9095XZApfZulFqYvAunoeKFiDd0uImIzhFA9ZW5iWFVNWX
    TzVXt0UNpTmyhwGh7nLBl1OdYChumyljgjRJNdVlEyKBCPKTH4zfT83GphH4RYjEnuoJ
    aHIrdKZqgUdoIw49YuY3O0dI9T5LJHA1GvfMG6QETWmw30cUDZxHdskb7xvFudZZK3GJ
    XsKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1773854279;
    s=strato-dkim-0003; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=eJG9igU4GgFHQQXkfYhJX4fK62Mj6n93ilY2UUcXHSk=;
    b=SZJj+Gcu19rztr9SrjZcHMUn/THEBLUgHlVs8bBchPOsRZ7xpO/PrieR71A0QI2x4h
    KiIC7Ge9nUqoBpKVOSBg==
X-RZG-AUTH: ":LmkFe0i9dN8c2t4QQyGBB/NDXvjDB6pBSe9tgBDSDt0V0DBslXBtZUxPOub3IZqk"
Received: from [10.176.235.211]
    by smtp.strato.de (RZmta 55.0.1 AUTH)
    with ESMTPSA id z7934522IHHwARL
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 18 Mar 2026 18:17:58 +0100 (CET)
Message-ID: <4223576d9f55b2a3ae18cf148765a1a5487367df.camel@iokpp.de>
Subject: Re: [PATCH] mtd: spi-nor: micron-st: fix FSR read fallback for
 controllers returning -ENOTSUPP
From: Bean Huo <beanhuo@iokpp.de>
To: "Zailiang Zhang (zaizhang)" <zaizhang@cisco.com>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, "pratyush@kernel.org" <pratyush@kernel.org>, 
	"mwalle@kernel.org"
	 <mwalle@kernel.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, Bean Huo <beanhuo@micron.com>
Date: Wed, 18 Mar 2026 18:17:58 +0100
In-Reply-To: <DS0PR11MB8668FC8E62236D0893A8CEFFC84EA@DS0PR11MB8668.namprd11.prod.outlook.com>
References: <20260318131857.2685004-1-beanhuo@iokpp.de>
	 <639bd964-b499-4e9f-9035-0010fecfb17c@linaro.org>
	 <3c94f0e1c5a8bf184d7a81f49b7beb999355dcd3.camel@iokpp.de>
	 <DS0PR11MB8668FC8E62236D0893A8CEFFC84EA@DS0PR11MB8668.namprd11.prod.outlook.com>
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_101815_604599_180860AD 
X-CRM114-Status: GOOD (  29.35  )
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

CgoKCk9uIFdlZCwgMjAyNi0wMy0xOCBhdCAxNzowNCArMDAwMCwgWmFpbGlhbmcgWmhhbmcgKHph
aXpoYW5nKSB3cm90ZToKPiBIaSwKPiAKPiBPdXIgcGxhdGZvcm0gaXMgdXNpbmcgSW50ZWwgUmFw
dG9ybGFrZSBDUFUsIHNvIGl04oCZcyBub3Qgb3VyIG93biBzcGkgbWFzdGVyCj4gZHJpdmVyLgo+
IFRoZSBrZXJuZWwgdmVyc2lvbiB3ZSBhcmUgdXNpbmcgaXMgNi42LjIxLgo+IEkgdGhpbmsgd2hl
biBtaWNyb24gcmVhZCBmc3IgZnVuY3Rpb24gY2FsbHMgc3BpX21lbV9leGVjX29wKCksIGl0IGhh
cwo+IGZvbGxvd2luZyByZXR1cm46Cj4gPiBpZsKgKCFzcGlfbWVtX2ludGVybmFsX3N1cHBvcnRz
X29wKG1lbSzCoG9wKSkKPiA+IMKgIMKgIHJldHVybsKgLUVOT1RTVVBQOwo+IFBsZWFzZSBjb3Jy
ZWN0IG1lIGlmIEkgYW0gd3JvbmcgaGVyZS4gQWxzbyB0aGUgbGF0ZXN0IHVwc3RyZWFtIGtlcm5l
bCBtYXkgbm90Cj4gdXNlIHRoZSBzYW1lIGhhbmRsaW5nIGNvZGUuCgoKSGkgWmFpbGlhbmcsICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCllvdSBhcmUgY29ycmVjdC4gdGhlIGNvbW1pdCBjZmY0OWQ1OGY1N2UgKCJz
cGk6IFVuaWZ5IGVycm9yIGNvZGVzIGJ5IHJlcGxhY2luZyAtCkVOT1RTVVBQIHdpdGggLUVPUE5P
VFNVUFAiKSwgbWVyZ2VkIHVwc3RyZWFtIG9uIE5vdmVtYmVyIDI5LCAyMDIzLCB3aGljaCBjaGFu
Z2VkCnNwaV9tZW1fZXhlY19vcCgpIHRvIHJldHVybiAtRU9QTk9UU1VQUCBpbnN0ZWFkIG9mIC1F
Tk9UU1VQUCB3aGVuIGFuIG9wZXJhdGlvbgppcyBub3Qgc3VwcG9ydGVkLiBLZXJuZWwgNi42LjIx
IHByZWRhdGVzIHRoaXMgZml4LCB3aGljaCBpcyB3aHkgeW91IHNlZSAtTk9UU1VQUApvbiB5b3Vy
IHBsYXRmb3JtIHdpdGggSW50ZWwgUmFwdG9yIExha2UuICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAKSGkgVHVkb3IsICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIArCoApUaGlzIGNoYW5nZXMgdGhlIHBpY3R1cmUuIFRoZSAtRU5PVFNVUFAgWmFp
bGlhbmcgb2JzZXJ2ZWQgaXMgY29taW5nIGRpcmVjdGx5CmZyb20gc3BpX21lbV9leGVjX29wKCkg
aW4ga2VybmVsIDYuNi4yMSwgYmVmb3JlIGNvbW1pdCBjZmY0OWQ1OGY1N2Ugd2FzIGluCnBsYWNl
LiBUaGF0IGNvbW1pdCBmaXhlZCB0aGUgU1BJIG1lbSBmcmFtZXdvcmsgaXRzZWxmLCBidXQgaXQg
bWF5IG5vdCBoYXZlIGJlZW4KYmFja3BvcnRlZCB0byBhbGwgc3RhYmxlIHRyZWVzLiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAg
ICAKSSB3b3VsZCB0aGVyZWZvcmUgYXJndWUgdGhhdCBvdXIgbWljcm9uLXN0LmMgZml4IGlzIHN0
aWxsIHdvcnRoIGtlZXBpbmcgZm9yIHRoZQp0aGUgcmVhc29uIHRoYXQgaXQgcHJvdmlkZXMgYSBz
YWZldHkgbmV0IGZvciBzdGFibGUga2VybmVscyB0aGF0IGRpZCBub3QgcmVjZWl2ZQpjZmY0OWQ1
OGY1N2UgYXMgYSBiYWNrcG9ydC4gICAgICAgICAgICAgICAgICAgICAKClRoYXQgc2FpZCwgSSBh
bSBoYXBweSB0byBmb2xsb3cgeW91ciBndWlkYW5jZSBvbiBob3cgdG8gcHJvY2VlZC7CoAogICAg
ICAgICAgICAgCktpbmQgcmVnYXJkcywgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKQmVhbgoKPiAKPiBQbGVhc2UgZGVjaWRl
IHRoZSBmaXh1cCBhY2NvcmRpbmdseS4KPiAKPiBUaGFua3MsCj4gWmFpbGlhbmcKPiAKPiBGcm9t
OiBCZWFuIEh1byA8YmVhbmh1b0Bpb2twcC5kZT4KPiBEYXRlOiBXZWRuZXNkYXksIE1hcmNoIDE4
LCAyMDI2IGF0IDY6NDXigK9BTQo+IFRvOiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxp
bmFyby5vcmc+LCBwcmF0eXVzaEBrZXJuZWwub3JnCj4gPHByYXR5dXNoQGtlcm5lbC5vcmc+LCBt
d2FsbGVAa2VybmVsLm9yZyA8bXdhbGxlQGtlcm5lbC5vcmc+Cj4gQ2M6IGxpbnV4LW10ZEBsaXN0
cy5pbmZyYWRlYWQub3JnIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sCj4gbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZyA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4sIFph
aWxpYW5nIFpoYW5nCj4gKHphaXpoYW5nKSA8emFpemhhbmdAY2lzY28uY29tPiwgQmVhbiBIdW8g
PGJlYW5odW9AbWljcm9uLmNvbT4KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBtdGQ6IHNwaS1ub3I6
IG1pY3Jvbi1zdDogZml4IEZTUiByZWFkIGZhbGxiYWNrIGZvcgo+IGNvbnRyb2xsZXJzIHJldHVy
bmluZyAtRU5PVFNVUFAKPiAKPiBPbiBXZWQsIDIwMjYtMDMtMTggYXQgMTU6MjYgKzAyMDAsIFR1
ZG9yIEFtYmFydXMgd3JvdGU6Cj4gPiBIaSwgQmVhbiEKPiA+IAo+ID4gT24gMy8xOC8yNiAzOjE4
IFBNLCBCZWFuIEh1byB3cm90ZToKPiA+ID4gRnJvbTogQmVhbiBIdW8gPGJlYW5odW9AbWljcm9u
LmNvbT4KPiA+ID4gCj4gPiA+IG1pY3Jvbl9zdF9ub3JfcmVhZHkoKSBmYWxscyBiYWNrIHRvIFNS
LW9ubHkgcG9sbGluZyB3aGVuIHRoZSBTUEkKPiA+ID4gY29udHJvbGxlciBkb2VzIG5vdCBzdXBw
b3J0IGxvdy1sZXZlbCBGU1IgcmVhZHMsIGJ1dCBvbmx5IGNoZWNrcyBmb3IKPiA+ID4gLUVPUE5P
VFNVUFAgKDk1KS7CoCBTb21lIFNQSSBtYXN0ZXIgZHJpdmVycyByZXR1cm4gdGhlIGtlcm5lbC1p
bnRlcm5hbAo+ID4gPiAtRU5PVFNVUFAgKDUyNCkgZm9yIHRoZSBzYW1lIGNvbmRpdGlvbi7CoCBU
aGUgdHdvIGNvZGVzIGNhcnJ5IGlkZW50aWNhbAo+ID4gCj4gPiBJc24ndCBpdCBhIGJldHRlciBm
aXggdG8gdXBkYXRlIHRoZSBzcGkgY29udHJvbGxlcnMgdG8gdXNlIEVPUE5PVFNVUFA/Cj4gCj4g
Cj4gSGkgWmFpbGlhbmcgWmhhbmcsCj4gCj4gQ2FuIHlvdSBmb3J3YXJkIHRoaXMgdG8geW91ciBj
b2xsZWFndWVzIGFuZCBjaGVjayBpZiB0aGUgU1BJIG1hc3RlciBkcml2ZXIgY2FuCj4gYmUgZml4
ZWQgdG8gcmV0dXJuIC1FT1BOT1RTVVBQIGluc3RlYWQgb2YgLUVOT1RTVVBQPwo+IAo+IAo+IEhp
IFR1ZG9yLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoAo+IFRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4KPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAKPiBZb3UgYXJlIHJpZ2h0IHRoYXQgZml4aW5nIHRoZSBzcGkgY29udHJvbGxlciB0byByZXR1
cm4gLUVPUE5PVFNVUFAgaXMgdGhlCj4gaWRlYWwKPiBzb2x1dGlvbiwgYW5kIEkgaGF2ZSByZWFj
aGVkIG91dCB0byB0aGUgcmVwb3J0ZXIgdG8gaW52ZXN0aWdhdGUgb24gdGhlaXIgZW5kLsKgCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgCj4gSG93ZXZlciwgSSB3b3VsZCBzdWdnZXN0IGtlZXBpbmcgdGhpcyBmaXggaW4g
bWljcm9uLXN0LmMgZm9yIHRoZSBmb2xsb3dpbmcKPiByZWFzb25zOsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiDCoMKgCj4gMSwgVGhlIG9mZmVu
ZGluZyBTUEkgbWFzdGVyIGRyaXZlciBhcHBlYXJzIHRvIGJlIG91dC1vZi10cmVlL2Rvd25zdHJl
YW0sIHNvIHdlCj4gY2Fubm90IGd1YXJhbnRlZSBhbiB1cHN0cmVhbSBmaXggd2lsbCByZWFjaCBh
bGwgYWZmZWN0ZWQgcGxhdGZvcm1zLgo+IDIsIHNwaS1tZW0uYyBhbHJlYWR5IHRyZWF0cyBib3Ro
IC1FTk9UU1VQUCBhbmQgLUVPUE5PVFNVUFAgYXMgZXF1aXZhbGVudCBpbgo+IHNwaV9tZW1fZXhl
Y19vcCgpIHNvIHRoaXMgb25lLWxpbmVyIGFsaWducyBtaWNyb25fc3Rfbm9yX3JlYWR5KCkgd2l0
aCB0aGUKPiBjb252ZW50aW9uIGFscmVhZHkgZXN0YWJsaXNoZWQgaW4gdGhlIFNQSSBtZW0gZnJh
bWV3b3JrLgo+IDMsIHRoZXJlIG1heSBiZSBvdGhlciBTUEkgY29udHJvbGxlcnMgaW4gdGhlIGZp
ZWxkIHdpdGggdGhlIHNhbWUgYmVoYXZpb3IgdGhhdAo+IHdlIGFyZSBub3QgYXdhcmUgb2YuIEEg
ZGVmZW5zaXZlIGZpeCBoZXJlIGNvc3RzIG5vdGhpbmcgYW5kIHByZXZlbnRzIGZ1dHVyZQo+IHJl
cG9ydHMuCj4gCj4gSSBhbSBoYXBweSB0byBkcm9wIHRoaXMgcGF0Y2ggaWYgeW91IGZlZWwgc3Ry
b25nbHkgdGhhdCB0aGUgZml4IGJlbG9uZ3Mgb25seQo+IGluCj4gdGhlIGNvbnRyb2xsZXIgZHJp
dmVyIGFuZCB0aGUgcmVwb3J0ZXIgY29uZmlybXMgdGhleSBjYW4gZml4IGl0IG9uIHRoZWlyIHNw
aQo+IG5vcgo+IG1hc3RlciBkcml2ZXIuCj4gCj4gS2luZCByZWdhcmRzLAo+IEJlYW4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
