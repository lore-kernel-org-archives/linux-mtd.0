Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DEEC28B30
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Mar 2025 23:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LO+fW8UAzL3StiQw6fGkc6qXVrAT3m706a6TwSZW2ng=; b=A6BHq62r7bZVkg
	Pm1PPfTGBGLxY9wNrasEY3ZPpNOtg43qce8l3BOUKxQugw+MgD6SpNT+YvASjKXYqj2VjZhjhPNjk
	2xhaF7cmtFz8e+P3n3gCKGKSPIqELUUTMOfowUMV8ypy7OvLCvCxBIOE9UTdUxXO8YwBsQ5qVLhZy
	WlhRpIuHsqXOprkJjxhBbBztikxXYRv7Dgtvms+/C4XQm9O8o9jDlFIvBOSb7HJcREBMEvOwAigzi
	5tdNLGAyxUk6zrat5J3qjxcjTXuhasxJ4V+KlV9nHHfaS/bYAUxZgCpbaXcoDeUT7Gfgvj9ysNK49
	SyrC0IYMjqIK2w7pYy3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twUte-00000001v5s-0P3a;
	Sun, 23 Mar 2025 23:38:26 +0000
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twU0y-00000001pgu-239Z
	for linux-mtd@lists.infradead.org;
	Sun, 23 Mar 2025 22:41:58 +0000
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52NMeKdo3968387
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sun, 23 Mar 2025 15:40:20 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52NMeKdo3968387
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1742769629;
	bh=jX8qvOcg5sHOYMzS8O1ZeFoLDzr4b9fAXnawD1sDsAQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=gpzvbk1/xbueYaRDkNUQItniaCPabNWQpBYkbzyWYtmr70CkFDr1QjiA+EEsvKZvw
	 x+NlI2wYpRq9XIxDM3W6qyI4muMLrm74m6hk9SQZhj6u/678GeAxC2aHNwRAd8Fz02
	 eaUD2juyAsarROcyXcOXSBJeY7WSazHhunwmvS0uaYtHesKXlr5cVrOSTOXia+d9ur
	 x0GW78E2/YRSCfLq+CgCW5Ss3gdvaEyZxBcb+3QJlbHUizJ8HRUBm+f0VKsMTTNTOb
	 biBm8UgyfdkV3Cldwh9ks4o9ztz33Hpie/nEjLEaxfg2nLmHMgLWNzA/75tuDFoxiX
	 JvvTdqoR1VRZA==
Date: Sun, 23 Mar 2025 15:40:20 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>, Yury Norov <yury.norov@gmail.com>
CC: David Laight <david.laight.linux@gmail.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
        akpm@linux-foundation.org, alistair@popple.id.au,
        andrew+netdev@lunn.ch, andrzej.hajda@intel.com,
        arend.vanspriel@broadcom.com, awalls@md.metrocast.net, bp@alien8.de,
        bpf@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
        brcm80211@lists.linux.dev, dave.hansen@linux.intel.com,
        davem@davemloft.net, dmitry.torokhov@gmail.com,
        dri-devel@lists.freedesktop.org, eajames@linux.ibm.com,
        edumazet@google.com, eleanor15x@gmail.com, gregkh@linuxfoundation.org,
        hverkuil@xs4all.nl, jernej.skrabec@gmail.com, jirislaby@kernel.org,
        jk@ozlabs.org, joel@jms.id.au, johannes@sipsolutions.net,
        jonas@kwiboo.se, jserv@ccns.ncku.edu.tw, kuba@kernel.org,
        linux-fsi@lists.ozlabs.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-serial@vger.kernel.org,
        linux-wireless@vger.kernel.org, linux@rasmusvillemoes.dk,
        louis.peens@corigine.com, maarten.lankhorst@linux.intel.com,
        mchehab@kernel.org, mingo@redhat.com, miquel.raynal@bootlin.com,
        mripard@kernel.org, neil.armstrong@linaro.org, netdev@vger.kernel.org,
        oss-drivers@corigine.com, pabeni@redhat.com,
        parthiban.veerasooran@microchip.com, rfoss@kernel.org, richard@nod.at,
        simona@ffwll.ch, tglx@linutronix.de, tzimmermann@suse.de,
        vigneshr@ti.com, x86@kernel.org
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
User-Agent: K-9 Mail for Android
In-Reply-To: <Z+AlyB461xwMxMtG@visitorckw-System-Product-Name>
References: <efc2ee9d-5382-457f-b471-f3c44b81a190@citrix.com> <5A790652-1B22-4D13-AAC5-5D9931E90903@zytor.com> <20250307195310.58abff8c@pumpkin> <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com> <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name> <Z9CyuowYsZyez36c@thinkpad> <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com> <Z9GtcNJie8TRKywZ@thinkpad> <Z9G2Tyypb3iLoBjn@visitorckw-System-Product-Name> <Z9KMKwnZXA2mkD2s@visitorckw-System-Product-Name> <Z+AlyB461xwMxMtG@visitorckw-System-Product-Name>
Message-ID: <05F7AC70-E8E7-4D14-A4EB-880D92A96534@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_154156_532320_353DD0A3 
X-CRM114-Status: GOOD (  48.74  )
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

T24gTWFyY2ggMjMsIDIwMjUgODoxNjoyNCBBTSBQRFQsIEt1YW4tV2VpIENoaXUgPHZpc2l0b3Jj
a3dAZ21haWwuY29tPiB3cm90ZToKPk9uIFRodSwgTWFyIDEzLCAyMDI1IGF0IDAzOjQxOjQ5UE0g
KzA4MDAsIEt1YW4tV2VpIENoaXUgd3JvdGU6Cj4+IE9uIFRodSwgTWFyIDEzLCAyMDI1IGF0IDEy
OjI5OjEzQU0gKzA4MDAsIEt1YW4tV2VpIENoaXUgd3JvdGU6Cj4+ID4gT24gV2VkLCBNYXIgMTIs
IDIwMjUgYXQgMTE6NTE6MTJBTSAtMDQwMCwgWXVyeSBOb3JvdiB3cm90ZToKPj4gPiA+IE9uIFR1
ZSwgTWFyIDExLCAyMDI1IGF0IDAzOjI0OjE0UE0gLTA3MDAsIEguIFBldGVyIEFudmluIHdyb3Rl
Ogo+PiA+ID4gPiBPbiBNYXJjaCAxMSwgMjAyNSAzOjAxOjMwIFBNIFBEVCwgWXVyeSBOb3JvdiA8
eXVyeS5ub3JvdkBnbWFpbC5jb20+IHdyb3RlOgo+PiA+ID4gPiA+T24gU3VuLCBNYXIgMDksIDIw
MjUgYXQgMTE6NDg6MjZQTSArMDgwMCwgS3Vhbi1XZWkgQ2hpdSB3cm90ZToKPj4gPiA+ID4gPj4g
T24gRnJpLCBNYXIgMDcsIDIwMjUgYXQgMTI6MDc6MDJQTSAtMDgwMCwgSC4gUGV0ZXIgQW52aW4g
d3JvdGU6Cj4+ID4gPiA+ID4+ID4gT24gTWFyY2ggNywgMjAyNSAxMTo1MzoxMCBBTSBQU1QsIERh
dmlkIExhaWdodCA8ZGF2aWQubGFpZ2h0LmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4+ID4gPiA+
ID4+ID4gPk9uIEZyaSwgMDcgTWFyIDIwMjUgMTE6MzA6MzUgLTA4MDAKPj4gPiA+ID4gPj4gPiA+
IkguIFBldGVyIEFudmluIiA8aHBhQHp5dG9yLmNvbT4gd3JvdGU6Cj4+ID4gPiA+ID4+ID4gPgo+
PiA+ID4gPiA+PiA+ID4+IE9uIE1hcmNoIDcsIDIwMjUgMTA6NDk6NTYgQU0gUFNULCBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gPiA+ID4gPj4gPiA+
PiA+PiAoaW50KXRydWUgbW9zdCBkZWZpbml0ZWx5IGlzIGd1YXJhbnRlZWQgdG8gYmUgMS4gIAo+
PiA+ID4gPiA+PiA+ID4+ID4KPj4gPiA+ID4gPj4gPiA+PiA+VGhhdCdzIG5vdCB0ZWNobmljYWxs
eSBjb3JyZWN0IGFueSBtb3JlLgo+PiA+ID4gPiA+PiA+ID4+ID4KPj4gPiA+ID4gPj4gPiA+PiA+
R0NDIGhhcyBpbnRyb2R1Y2VkIGhhcmRlbmVkIGJvb2xzIHRoYXQgaW50ZW50aW9uYWxseSBoYXZl
IGJpdCBwYXR0ZXJucwo+PiA+ID4gPiA+PiA+ID4+ID5vdGhlciB0aGFuIDAgYW5kIDEuCj4+ID4g
PiA+ID4+ID4gPj4gPgo+PiA+ID4gPiA+PiA+ID4+ID5odHRwczovL2djYy5nbnUub3JnL2djYy0x
NC9jaGFuZ2VzLmh0bWwKPj4gPiA+ID4gPj4gPiA+PiA+Cj4+ID4gPiA+ID4+ID4gPj4gPn5BbmRy
ZXcgIAo+PiA+ID4gPiA+PiA+ID4+IAo+PiA+ID4gPiA+PiA+ID4+IEJpdCBwYXR0ZXJucyBpbiBt
ZW1vcnkgbWF5YmUgKG5vdCB0aGF0IEkgY2FuIHNlZSB0aGUgTGludXgga2VybmVsIHVzaW5nIHRo
ZW0pIGJ1dAo+PiA+ID4gPiA+PiA+ID4+IGZvciBjb21waWxlci1nZW5lcmF0ZWQgY29udmVyc2F0
aW9ucyB0aGF0J3Mgc3RpbGwgYSBnaXZlbiwgb3IgdGhlIG1hbmFnZXIgaXNuJ3QgQwo+PiA+ID4g
PiA+PiA+ID4+IG9yIGFueXRoaW5nIGV2ZW4gcmVtb3RlbHkgbGlrZSBpdC4KPj4gPiA+ID4gPj4g
PiA+PiAKPj4gPiA+ID4gPj4gPiA+Cj4+ID4gPiA+ID4+ID4gPlRoZSB3aG9sZSBpZGVhIG9mICdi
b29sJyBpcyBwcmV0dHkgbXVjaCBicm9rZW4gYnkgZGVzaWduLgo+PiA+ID4gPiA+PiA+ID5UaGUg
dW5kZXJseWluZyBwcm9ibGVtIGlzIHRoYXQgdmFsdWVzIG90aGVyIHRoYW4gJ3RydWUnIGFuZCAn
ZmFsc2UnIGNhbgo+PiA+ID4gPiA+PiA+ID5hbHdheXMgZ2V0IGludG8gJ2Jvb2wnIHZhcmlhYmxl
cy4KPj4gPiA+ID4gPj4gPiA+Cj4+ID4gPiA+ID4+ID4gPk9uY2UgdGhhdCBoYXMgaGFwcGVuZWQg
aXQgaXMgYWxsIGZ1YmFyLgo+PiA+ID4gPiA+PiA+ID4KPj4gPiA+ID4gPj4gPiA+VHJ5aW5nIHRv
IHNhbml0aXNlIGEgdmFsdWUgd2l0aCAoc2F5KToKPj4gPiA+ID4gPj4gPiA+aW50IGYoYm9vbCB2
KQo+PiA+ID4gPiA+PiA+ID57Cj4+ID4gPiA+ID4+ID4gPglyZXR1cm4gKGludCl2ICYgMTsKPj4g
PiA+ID4gPj4gPiA+fSAgICAKPj4gPiA+ID4gPj4gPiA+anVzdCBkb2Vzbid0IHdvcmsgKHNlZSBo
dHRwczovL3d3dy5nb2Rib2x0Lm9yZy96L01FbmRQM3E5aikKPj4gPiA+ID4gPj4gPiA+Cj4+ID4g
PiA+ID4+ID4gPkkgcmVhbGx5IGRvbid0IHNlZSBob3cgdXNpbmcgKHNheSkgMHhhYSBhbmQgMHg1
NSBoZWxwcy4KPj4gPiA+ID4gPj4gPiA+V2hhdCBoYXBwZW5zIGlmIHRoZSB2YWx1ZSBpcyB3cm9u
Zz8gYSB0cmFwIG9yIGV4Y2VwdGlvbj8sIGdvb2QgbHVjayByZWNvdmVyaW5nCj4+ID4gPiA+ID4+
ID4gPmZyb20gdGhhdC4KPj4gPiA+ID4gPj4gPiA+Cj4+ID4gPiA+ID4+ID4gPglEYXZpZAo+PiA+
ID4gPiA+PiA+IAo+PiA+ID4gPiA+PiA+IERpZCB5b3UganVzdCBkaXNjb3ZlciBHSUdPPwo+PiA+
ID4gPiA+PiAKPj4gPiA+ID4gPj4gVGhhbmtzIGZvciBhbGwgdGhlIHN1Z2dlc3Rpb25zLgo+PiA+
ID4gPiA+PiAKPj4gPiA+ID4gPj4gSSBkb24ndCBoYXZlIGEgc3Ryb25nIG9waW5pb24gb24gdGhl
IG5hbWluZyBvciByZXR1cm4gdHlwZS4gSSdtIHN0aWxsIGEKPj4gPiA+ID4gPj4gYml0IGNvbmZ1
c2VkIGFib3V0IHdoZXRoZXIgSSBjYW4gYXNzdW1lIHRoYXQgY2FzdGluZyBib29sIHRvIGludCBh
bHdheXMKPj4gPiA+ID4gPj4gcmVzdWx0cyBpbiAwIG9yIDEuCj4+ID4gPiA+ID4+IAo+PiA+ID4g
PiA+PiBJZiB0aGF0J3MgdGhlIGNhc2UsIHNpbmNlIG1vc3QgcGVvcGxlIHByZWZlciBib29sIG92
ZXIgaW50IGFzIHRoZQo+PiA+ID4gPiA+PiByZXR1cm4gdHlwZSBhbmQgc29tZSBhcmUgYWdhaW5z
dCBpbnRyb2R1Y2luZyB1MSwgbXkgY3VycmVudCBwbGFuIGlzIHRvCj4+ID4gPiA+ID4+IHVzZSB0
aGUgZm9sbG93aW5nIGluIHRoZSBuZXh0IHZlcnNpb246Cj4+ID4gPiA+ID4+IAo+PiA+ID4gPiA+
PiBib29sIHBhcml0eV9vZGQodTY0IHZhbCk7Cj4+ID4gPiA+ID4+IAo+PiA+ID4gPiA+PiBUaGlz
IGtlZXBzIHRoZSBib29sIHJldHVybiB0eXBlLCByZW5hbWVzIHRoZSBmdW5jdGlvbiBmb3IgYmV0
dGVyCj4+ID4gPiA+ID4+IGNsYXJpdHksIGFuZCBhdm9pZHMgZXh0cmEgbWFpbnRlbmFuY2UgYnVy
ZGVuIGJ5IGhhdmluZyBqdXN0IG9uZQo+PiA+ID4gPiA+PiBmdW5jdGlvbi4KPj4gPiA+ID4gPj4g
Cj4+ID4gPiA+ID4+IElmIEkgY2FuJ3QgYXNzdW1lIHRoYXQgY2FzdGluZyBib29sIHRvIGludCBh
bHdheXMgcmVzdWx0cyBpbiAwIG9yIDEsCj4+ID4gPiA+ID4+IHdvdWxkIGl0IGJlIGFjY2VwdGFi
bGUgdG8ga2VlcCB0aGUgcmV0dXJuIHR5cGUgYXMgaW50Pwo+PiA+ID4gPiA+PiAKPj4gPiA+ID4g
Pj4gV291bGQgdGhpcyB3b3JrIGZvciBldmVyeW9uZT8KPj4gPiA+ID4gPgo+PiA+ID4gPiA+QWxy
aWdodCwgaXQncyBjbGVhcmx5IGEgc3BsaXQgb3Bpbmlvbi4gU28gd2hhdCBJIHdvdWxkIGRvIG15
c2VsZiBpbgo+PiA+ID4gPiA+c3VjaCBjYXNlIGlzIHRvIGxvb2sgYXQgZXhpc3RpbmcgY29kZSBh
bmQgc2VlIHdoYXQgcGVvcGxlIHdobyByZWFsbHkKPj4gPiA+ID4gPm5lZWQgcGFyaXR5IGludmVu
dCBpbiB0aGVpciBkcml2ZXJzOgo+PiA+ID4gPiA+Cj4+ID4gPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYm9vbCAgICAgIHBhcml0eV9vZGQKPj4gPiA+ID4gPnN0YXRp
YyBpbmxpbmUgaW50IHBhcml0eTgodTggdmFsKSAgICAgICAtICAgICAgICAgICAgICAgLQo+PiA+
ID4gPiA+c3RhdGljIHU4IGNhbGNfcGFyaXR5KHU4IHZhbCkgICAgICAgICAgIC0gICAgICAgICAg
ICAgICAtCj4+ID4gPiA+ID5zdGF0aWMgaW50IG9kZF9wYXJpdHkodTggYykgICAgICAgICAgICAg
LSAgICAgICAgICAgICAgICsKPj4gPiA+ID4gPnN0YXRpYyBpbnQgc2FhNzExeF9vZGRfcGFyaXR5
ICAgICAgICAgICAtICAgICAgICAgICAgICAgKwo+PiA+ID4gPiA+c3RhdGljIGludCBtYXgzMTAw
X2RvX3Bhcml0eSAgICAgICAgICAgIC0gICAgICAgICAgICAgICAtCj4+ID4gPiA+ID5zdGF0aWMg
aW5saW5lIGludCBwYXJpdHkodW5zaWduZWQgeCkgICAgLSAgICAgICAgICAgICAgIC0KPj4gPiA+
ID4gPnN0YXRpYyBpbnQgYml0X3Bhcml0eSh1MzIgcGt0KSAgICAgICAgICAtICAgICAgICAgICAg
ICAgLQo+PiA+ID4gPiA+c3RhdGljIGludCBvYV90YzZfZ2V0X3Bhcml0eSh1MzIgcCkgICAgIC0g
ICAgICAgICAgICAgICAtCj4+ID4gPiA+ID5zdGF0aWMgdTMyIHBhcml0eTMyKF9fbGUzMiBkYXRh
KSAgICAgICAgLSAgICAgICAgICAgICAgIC0KPj4gPiA+ID4gPnN0YXRpYyB1MzIgcGFyaXR5KHUz
MiBzYW1wbGUpICAgICAgICAgICAtICAgICAgICAgICAgICAgLQo+PiA+ID4gPiA+c3RhdGljIGlu
dCBnZXRfcGFyaXR5KGludCBudW1iZXIsICAgICAgIC0gICAgICAgICAgICAgICAtCj4+ID4gPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgaW50IHNpemUpCj4+ID4gPiA+ID5zdGF0aWMgYm9vbCBp
MmNyX2NoZWNrX3Bhcml0eTMyKHUzMiB2LCAgKyAgICAgICAgICAgICAgIC0KPj4gPiA+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgIGJvb2wgcGFyaXR5KQo+PiA+ID4gPiA+c3RhdGljIGJvb2wg
aTJjcl9jaGVja19wYXJpdHk2NCh1NjQgdikgICsgICAgICAgICAgICAgICAtCj4+ID4gPiA+ID5z
dGF0aWMgaW50IHN3X3Bhcml0eShfX3U2NCB0KSAgICAgICAgICAgLSAgICAgICAgICAgICAgIC0K
Pj4gPiA+ID4gPnN0YXRpYyBib29sIHBhcml0eSh1NjQgdmFsdWUpICAgICAgICAgICArICAgICAg
ICAgICAgICAgLQo+PiA+ID4gPiA+Cj4+ID4gPiA+ID5Ob3cgeW91IGNhbiByZWZlciB0byB0aGF0
IHRhYmxlIHNheSB0aGF0IGludCBwYXJpdHkodVhYKSBpcyB3aGF0Cj4+ID4gPiA+ID5wZW9wbGUg
d2FudCB0byBzZWUgaW4gdGhlaXIgZHJpdmVycy4KPj4gPiA+ID4gPgo+PiA+ID4gPiA+V2hpY2hl
dmVyIGludGVyZmFjZSB5b3UgY2hvb3NlLCBwbGVhc2UgZGlzY3VzcyBpdCdzIHByb3MgYW5kIGNv
bnMuCj4+ID4gPiA+ID5XaGF0IGJsb2F0LW8tbWV0ZXIgc2F5cyBmb3IgZWFjaCBvcHRpb24/IFdo
YXQncyBtYWludGVuYW5jZSBidXJkZW4/Cj4+ID4gPiA+ID5QZXJmIHRlc3Q/IExvb2sgYXQgZ2Vu
ZXJhdGVkIGNvZGU/Cj4+ID4gPiA+ID4KPj4gPiA+ID4gPkkgcGVyc29uYWxseSBmb3IgYSBtYWNy
byByZXR1cm5pbmcgYm9vbGVhbiwgc29tZXRoaW5nIGxpa2UgSQo+PiA+ID4gPiA+cHJvcG9zZWQg
YXQgdGhlIHZlcnkgYmVnaW5uaW5nLgo+PiA+ID4gPiA+Cj4+ID4gPiA+ID5UaGFua3MsCj4+ID4g
PiA+ID5ZdXJ5Cj4+ID4gPiA+IAo+PiA+ID4gPiBBbHNvLCBwbGVhc2UgYXQgbGVhc3QgcHJvdmlk
ZSBhIHdheSBmb3IgYW4gYXJjaCB0byBvcHQgaW4gdG8gdXNpbmcgdGhlIGJ1aWx0aW5zLCB3aGlj
aCBzZWVtIHRvIHByb2R1Y2UgYXMgZ29vZCByZXN1bHRzIG9yIGJldHRlciBhdCBsZWFzdCBvbiBz
b21lIGFyY2hpdGVjdHVyZXMgbGlrZSB4ODYgYW5kIHByb2JhYmx5IHdpdGggQ1BVIG9wdGlvbnMg
dGhhdCBpbXBseSBmYXN0IHBvcGNudCBpcyBhdmFpbGFibGUuCj4+ID4gPiAKPj4gPiA+IFllYWgu
IEFuZCBiZWNhdXNlIGxpbnV4L2JpdG9wcy5oIGFscmVhZHkgaW5jbHVkZXMgYXNtL2JpdG9wcy5o
Cj4+ID4gPiB0aGUgc2ltcGxlc3Qgd2F5IHdvdWxkIGJlIHdyYXBwaW5nIGdlbmVyaWMgaW1wbGVt
ZW50YXRpb24gd2l0aAo+PiA+ID4gdGhlICNpZm5kZWYgcGFyaXR5LCBzaW1pbGFybHkgdG8gaG93
IHdlIGhhbmRsZSBmaW5kX25leHRfYml0IGNhc2UuCj4+ID4gPiAKPj4gPiA+IFNvOgo+PiA+ID4g
MS4gS3Vhbi1XZWksIHBsZWFzZSBkb24ndCBpbnZlbnQgc29tZXRoaW5nIGxpa2UgQVJDSF9IQVNf
UEFSSVRZOwo+PiA+ID4gMi4gVGhpcyBtYXksIGFuZCBwcm9iYWJseSBzaG91bGQsIGJlIGEgc2Vw
YXJhdGUgZm9sbG93LXVwIHNlcmllcywKPj4gPiA+ICAgIGxpa2VseSBjcmVhdGVkIGJ5IGNvcnJl
c3BvbmRpbmcgYXJjaCBleHBlcnRzLgo+PiA+ID4gCj4+ID4gSSBzYXcgZGlzY3Vzc2lvbnMgaW4g
dGhlIHByZXZpb3VzIGVtYWlsIHRocmVhZCBhYm91dCBib3RoCj4+ID4gX19idWlsdGluX3Bhcml0
eSBhbmQgeDg2LXNwZWNpZmljIGltcGxlbWVudGF0aW9ucy4gSG93ZXZlciwgZnJvbSB0aGUKPj4g
PiBkaXNjdXNzaW9uLCBJIGxlYXJuZWQgdGhhdCBiZWZvcmUgY29uc2lkZXJpbmcgYW55IG9wdGlt
aXphdGlvbiwgd2UKPj4gPiBzaG91bGQgZmlyc3QgYXNrOiB3aGljaCBkcml2ZXIgb3Igc3Vic3lz
dGVtIGFjdHVhbGx5IGNhcmVzIGFib3V0IHBhcml0eQo+PiA+IGVmZmljaWVuY3k/IElmIHNvbWVv
bmUgZG9lcywgSSBjYW4gaGVscCB3aXRoIGEgbWljcm8tYmVuY2htYXJrIHRvCj4+ID4gcHJvdmlk
ZSBwZXJmb3JtYW5jZSBudW1iZXJzLCBidXQgSSBkb24ndCBoYXZlIGVub3VnaCBkb21haW4ga25v
d2xlZGdlCj4+ID4gdG8gaWRlbnRpZnkgaG90IHBhdGhzIHdoZXJlIHBhcml0eSBlZmZpY2llbmN5
IG1hdHRlcnMuCj4+ID4gCj4+IElNSE8sCj4+IAo+PiBJZiBwYXJpdHkgaXMgbmV2ZXIgdXNlZCBp
biBhbnkgaG90IHBhdGggYW5kIHdlIGRvbid0IGNhcmUgYWJvdXQgcGFyaXR5Ogo+PiAKPj4gVGhl
biBiZW5jaG1hcmtpbmcgaXRzIHBlcmZvcm1hbmNlIHNlZW1zIG1lYW5pbmdsZXNzLiBJbiB0aGlz
IGNhc2UsIGEKPj4gZnVuY3Rpb24gd2l0aCBhIHU2NCBhcmd1bWVudCB3b3VsZCBzdWZmaWNlLCBh
bmQgd2UgbWlnaHQgbm90IGV2ZW4gbmVlZAo+PiBhIG1hY3JvIHRvIG9wdGltaXplIGZvciBkaWZm
ZXJlbnQgdHlwZXPigJRlc3BlY2lhbGx5IHNpbmNlIHRoZSBtYWNybwo+PiByZXF1aXJlcyBzcGVj
aWFsIGhhY2tzIHRvIGF2b2lkIGNvbXBpbGVyIHdhcm5pbmdzLiBBbHNvLCBJIGRvbid0IHRoaW5r
Cj4+IGNvZGUgc2l6ZSBtYXR0ZXJzIGhlcmUuIElmIGl0IGRvZXMsIHdlIHNob3VsZCBmaXJzdCBj
b25zaWRlciBtYWtpbmcKPj4gcGFyaXR5IGEgbm9uLWlubGluZSBmdW5jdGlvbiBpbiBhIC5jIGZp
bGUgcmF0aGVyIHRoYW4gYW4gaW5saW5lCj4+IGZ1bmN0aW9uL21hY3JvIGluIGEgaGVhZGVyLgo+
PiAKPj4gSWYgcGFyaXR5IGlzIHVzZWQgaW4gYSBob3QgcGF0aDoKPj4gCj4+IFdlIG5lZWQgZGlm
ZmVyZW50IGhhbmRsaW5nIGZvciBkaWZmZXJlbnQgdHlwZSBzaXplcy4gQXMgcHJldmlvdXNseQo+
PiBkaXNjdXNzZWQsIHg4NiBhc3NlbWJseSBtaWdodCB1c2UgZGlmZmVyZW50IGluc3RydWN0aW9u
cyBmb3IgdTggYW5kCj4+IHUxNi4gVGhpcyBtYXkgc291bmQgc3R1YmJvcm4sIGJ1dCBJIHdhbnQg
dG8gYXNrIGFnYWluOiBzaG91bGQgd2UKPj4gY29uc2lkZXIgdXNpbmcgcGFyaXR5OC8xNi8zMi82
NCBpbnRlcmZhY2VzPyBMaWtlIGluIHRoZSBpM2MgZHJpdmVyCj4+IGV4YW1wbGUsIGlmIHdlIG9u
bHkgaGF2ZSBhIHNpbmdsZSBwYXJpdHkgbWFjcm8gdGhhdCBzZWxlY3RzIGFuCj4+IGltcGxlbWVu
dGF0aW9uIGJhc2VkIG9uIHR5cGUgc2l6ZSwgdXNlcnMgbXVzdCBleHBsaWNpdGx5IGNhc3QgdHlw
ZXMuCj4+IElmIGZ1dHVyZSB1c2VycyBhbHNvIG5lZWQgcGFyaXR5IGluIGEgaG90IHBhdGgsIHRo
ZXkgbWlnaHQgbm90IGJlIGF3YXJlCj4+IG9mIHRoaXMgcmVxdWlyZW1lbnQgYW5kIGVuZCB1cCBn
ZW5lcmF0aW5nIHN1Ym9wdGltYWwgY29kZS4gU2luY2Ugd2UKPj4gY2FyZSBhYm91dCBlZmZpY2ll
bmN5IGFuZCBnZW5lcmF0ZWQgY29kZSwgd2h5IG5vdCBmb2xsb3cgaHdlaWdodCgpIGFuZAo+PiBw
cm92aWRlIHNlcGFyYXRlIGltcGxlbWVudGF0aW9ucyBmb3IgZGlmZmVyZW50IHNpemVzPwo+PiAK
Pkl0IHNlZW1zIG5vIG9uZSB3aWxsIHJlcGx5IHRvIG15IHR3byBlbWFpbHMuIFNvLCBJIGhhdmUg
c3VtbWFyaXplZAo+ZGlmZmVyZW50IGludGVyZmFjZSBhcHByb2FjaGVzLiBJZiB0aGVyZSBpcyBh
IG5leHQgdmVyc2lvbiwgSSB3aWxsIHNlbmQKPml0IGFmdGVyIHRoZSBtZXJnZSB3aW5kb3cgY2xv
c2VzLgo+Cj5JbnRlcmZhY2UgMTogU2luZ2xlIEZ1bmN0aW9uCj5EZXNjcmlwdGlvbjogYm9vbCBw
YXJpdHlfb2RkKHU2NCkKPlByb3M6IE1pbmltYWwgbWFpbnRlbmFuY2UgY29zdAo+Q29uczogRGlm
ZmljdWx0IHRvIGludGVncmF0ZSB3aXRoIGFyY2hpdGVjdHVyZS1zcGVjaWZpYyBpbXBsZW1lbnRh
dGlvbnMKPiAgICAgIGR1ZSB0byB0aGUgaW5hYmlsaXR5IHRvIG9wdGltaXplIGZvciBkaWZmZXJl
bnQgYXJndW1lbnQgc2l6ZXMKPk9waW5pb25zOiBKaXJpIHN1cHBvcnRzIHRoaXMgYXBwcm9hY2gK
Pgo+SW50ZXJmYWNlIDI6IFNpbmdsZSBNYWNybwo+RGVzY3JpcHRpb246IHBhcml0eV9vZGQoKSBt
YWNybwo+UHJvczogQWxsb3dzIHR5cGUtc3BlY2lmaWMgaW1wbGVtZW50YXRpb24KPkNvbnM6IFJl
cXVpcmVzIGhhY2tzIHRvIGF2b2lkIHdhcm5pbmdzOyB1c2VycyBtYXkgbmVlZCBleHBsaWNpdAo+
ICAgICAgY2FzdGluZzsgcG90ZW50aWFsIHN1Yi1vcHRpbWFsIGNvZGUgb24gMzItYml0IHg4Ngo+
T3BpbmlvbnM6IFl1cnkgc3VwcG9ydHMgdGhpcyBhcHByb2FjaAo+Cj5JbnRlcmZhY2UgMzogTXVs
dGlwbGUgRnVuY3Rpb25zCj5EZXNjcmlwdGlvbjogYm9vbCBwYXJpdHlfb2RkOC8xNi8zMi82NCgp
Cj5Qcm9zOiBObyBuZWVkIGZvciBleHBsaWNpdCBjYXN0aW5nOyBlYXN5IHRvIGludGVncmF0ZQo+
ICAgICAgYXJjaGl0ZWN0dXJlLXNwZWNpZmljIG9wdGltaXphdGlvbnM7IGV4Y2VwdCBmb3IgcGFy
aXR5OCgpLCBhbGwKPiAgICAgIGZ1bmN0aW9ucyBhcmUgb25lLWxpbmVycyB3aXRoIG5vIHNpZ25p
ZmljYW50IGNvZGUgZHVwbGljYXRpb24KPkNvbnM6IE1vcmUgZnVuY3Rpb25zIG1heSBpbmNyZWFz
ZSBtYWludGVuYW5jZSBidXJkZW4KPk9waW5pb25zOiBPbmx5IEkgc3VwcG9ydCB0aGlzIGFwcHJv
YWNoCj4KPlJlZ2FyZHMsCj5LdWFuLVdlaQoKWW91IGNhbiBhZGQgbWUgdG8gdGhlIGZpbmFsIG9w
dGlvbi4gSSB0aGluayBpdCBtYWtlcyBtb3N0IHNlbnNlIAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
