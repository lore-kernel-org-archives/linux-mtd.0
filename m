Return-Path: <SRS0=Yh92=UI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF7FC28EBD
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Jun 2019 08:18:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15E112089E
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Jun 2019 08:18:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rqYkqogW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15E112089E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emcraft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3iPteMIhCiy9Usza9xPTe/S47YZjtdLaQ+Yo6trgB7o=; b=rqYkqogWCGNIDL
	4xBajBJXOicOTzYD3HnLyjIp6YSHKtLB2a8QrACTwxV9emyJdpIVXTqhONu85HTwkxu/r3bs3UJ1P
	1harKBfzmdPEOPAbFszR3JfewoxxtXkJLT2oroF7QO/oLhqpDQKbr7MSw1poWSjUWjZWpJV65mSyw
	dle1PcXeMC0cmy/FmpGP+boy3XT3lF4Bcv656TZ5sQ+L/k6Ir11VTZtXPgK2D35mDtcD6S5tQDz1m
	//LexpozAWD3X4OFI9nvfy/unrXy7HK+PDIxvxb/ntAf1cLXVuTVX96MOwFKGfarVraq8qQOAI28+
	jjrBpbtFzkJ1LdrGhCJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZt1r-000868-Mx; Sun, 09 Jun 2019 08:18:15 +0000
Received: from [176.110.122.116] (helo=ocean.emcraft.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZt1o-00085O-GL
 for linux-mtd@lists.infradead.org; Sun, 09 Jun 2019 08:18:14 +0000
Received: from [10.8.0.10] (helo=mehome.localdomain)
 by ocean.emcraft.com with esmtps (TLSv1:AES256-SHA:256) (Exim 4.76)
 (envelope-from <sposelenov@emcraft.com>)
 id 1hZt1f-0005rM-Vx; Sun, 09 Jun 2019 11:18:04 +0300
Message-ID: <a43eb232a51b7d0c95623de9403158c290163237.camel@emcraft.com>
Subject: Re: UBIFS: file data corruption during the power cut-off test
From: Sergei Poselenov <sposelenov@emcraft.com>
To: Richard Weinberger <richard@nod.at>
Date: Sun, 09 Jun 2019 11:18:03 +0300
In-Reply-To: <766367078.85018.1559983598342.JavaMail.zimbra@nod.at>
References: <20190606121037.40a1cc5e@sergmir.emcraft.com>
 <CAFLxGvx4iqpU8pq8CPwah9M+Qa2YkpXEiSmndeVy2mLadNQn_g@mail.gmail.com>
 <20190606210803.481cbc5d@sergmir.emcraft.com>
 <CAFLxGvy1BTuLkcn=7N=FG_q5cBgj5L1YzyhiakVFewYPyr6dzA@mail.gmail.com>
 <20190607172355.6541fa51@sergmir.emcraft.com>
 <1299833819.84614.1559923336123.JavaMail.zimbra@nod.at>
 <08a796c9a296245c372511c683adb80913d14553.camel@emcraft.com>
 <766367078.85018.1559983598342.JavaMail.zimbra@nod.at>
Organization: Emcraft Systems
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190609_011812_918973_0C2950FE 
X-CRM114-Status: GOOD (  13.48  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gUmljaGFyZCwKClRoYW5rIHlvdSBmb3IgeW91ciBwYXRpZW5jZS4gT0ssIEknbGwgdHJ5
IHRvIGRlc2NyaWJlIG15IHJlYWwgdGVzdCBjYXNlCm9uY2UgYWdhaW4sIGJlbG93LgoKMS4gT24g
bXkgc3lzdGVtLCAvbW50L2RhdGExIGlzIGEgVUJJIHBhcnRpdGlvbiBtb3VudGVkIHdpdGggdGhl
ICJzeW5jIgpvcHRpb24gb24gTkFORCBkZXZpY2UuCjIuIEluaXRpYWxseSwgdGhlIHBhcnRpdGlv
biBpcyBlbXB0eS4KMy4gSSBkbzoKL21udC9kYXRhMSAjIGZvciBpIGluIGBzZXEgMCA5OWA7IGRv
Cj4gZGQgaWY9L2Jpbi9idXN5Ym94IG9mPXRlc3Qke2l9OyBkb25lCjQuIEkgZG8gYSBwb3dlciBj
dXQtb2ZmIGR1cmluZyB0aGUgbG9vcCBhYm92ZS4KNS4gQWZ0ZXIgcmVzdG9yaW5nIHRoZSBwb3dl
ciwgdGhlIHN5c3RlbSByZWJvb3RzIGFuZCByZWNvdmVycyB0aGUgVUJJCnBhcnRpdGlvbiBzdWNj
ZXNzZnVsbHkuIEhlcmUgaXMgd2hhdCBJIGhhdmUgdGhlcmUgbm93Ogp+ICMgbHMgLWwgL21udC9k
YXRhMQotcnctci0tci0tICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICAgNDMwNTE5IEphbiAgMSAw
MDowMCB0ZXN0MAotcnctci0tci0tICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICAgNDMwNTE5IEph
biAgMSAwMDowNCB0ZXN0MQotcnctci0tci0tICAgIDEgcm9vdCAgICAgcm9vdCAgICAgICAgNDMw
NTE5IEphbiAgMSAwMDowNCB0ZXN0Mgotcnctci0tci0tICAgIDEgcm9vdCAgICAgcm9vdCAgICAg
ICAgNDMwNTE5IEphbiAgMSAwMDowNCB0ZXN0Mwotcnctci0tci0tICAgIDEgcm9vdCAgICAgcm9v
dCAgICAgICAgMjg2NzIwIEphbiAgMSAwMDowNCB0ZXN0NAo2LiBUaGUgdGVzdDAtdGVzdDMgZmls
ZXMgYWJvdmUgYXJlIGV4YWN0IHJlcGxpY2FzIG9mIHRoZSBpbml0aWFsIGltYWdlCi9iaW4vYnVz
eWJveC4gInRlc3Q0IiBpcyBpbmNvbXBsZXRlbHkgd3JpdHRlbiwgYXMgZXhwZWN0ZWQuCjcuIExl
dCdzIGNoZWNrIHRoZSBkYXRhIGF0IHRoZSBlbmQgb2YgdGhlIGxhc3QgcGFydGlhbGx5IHdyaXR0
ZW4gZmlsZQp0ZXN0NDoKIyBoZXhkdW1wIHRlc3Q0LmhleAouLi4KMDA0NWRkMCAwMDA0IGUxYTAg
ODFmMCBlOGJkIDliYTAgMDAwNyAzMDE0IGU1OWYKMDA0NWRlMCA0MDEwIGU5MmQgNDAwMCBlNTkz
IDAwMDggZTU5NCBmZmE5IGViZmYKMDA0NWRmMCAwMDA4IGU1ODQgODAxMCBlOGJkIDliYTAgMDAw
NyAwMDAwIGUxNTEKMDA0NWUwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAwMDAgMDAwMCAwMDAwIDAw
MDAKKgowMDQ2MDAwCiMgCkFzIHlvdSBjYW4gc2VlLCB0aGUgbGFzdCA1MTIgYnl0ZXMgc3RhcnRp
bmcgZnJvbSAweDAwNDVlMDAgYXJlIHplcm9lcy4KCkxldCdzIGNoZWNrIHRoZSBkYXRhIGJ5IHRo
aXMgb2Zmc2V0IGluIHRoZSBvcmlnaW5hbCBmaWxlIC9iaW4vYnVzeWJveDoKICAgMDA0NWRkMCAw
MDA0IGUxYTAgODFmMCBlOGJkIDliYTAgMDAwNyAzMDE0IGU1OWYKICAgMDA0NWRlMCA0MDEwIGU5
MmQgNDAwMCBlNTkzIDAwMDggZTU5NCBmZmE5IGViZmYKICAgMDA0NWRmMCAwMDA4IGU1ODQgODAx
MCBlOGJkIDliYTAgMDAwNyAwMDAwIGUxNTEKLT4gMDA0NWUwMCA0MGY4IGU5MmQgMzAwMCAzMWEw
IDQwMDAgZTFhMCA0MDAxIDMxYTAKICAgMDA0NWUxMCAxMDAzIDMxYTAgMDAwMSBlMWEwIGZmOGQg
ZWJmZiAzMDQ0IGU1OWYKICAgMDA0NWUyMCA1MDAwIGUzYTAgNjAwMCBlNTkzIDcwMDAgZTFhMCAw
MDA3IGUxNTQKICAgMDA0NWUzMCAwMDBhIDhhMDAgMzAwNCBlNTk2IDMwMDEgZTI0MyAwMDAzIGUx
NTQKICAgMDA0NWU0MCAwMDA2IDhhMDAgMDAwNCBlMWEwIGZmODEgZWJmZiAzMDAwIGU1ZDAKICAg
MDA0NWU1MCA0MDAxIGUyODAgMDAwYSBlMzUzIDUwMDEgMDI4NSBmZmYyIGVhZmYKICAgMDA0NWU2
MCAwMDA1IGUxYTAgODBmOCBlOGJkIDliYTAgMDAwNyAzMDAwIGUzZTAKICAgMDA0NWU3MCA0MGY3
IGU5MmQgNTAwMSBlMWEwIDMwMDAgZTU4MSAxMDAwIGU1ZDAKICAgMDA0NWU4MCA0MDAwIGUxYTAg
MDAyZSBlMzUxIDMxMzAgMDU5ZiA0MDAxIDAyODAKLi4uCgoKTm93LCB0aGUgcXVlc3Rpb246IHdo
eSBhcmUgdGhlc2UgNTEyIGJ5dGVzIG9mIHplcm9zIGluIHRlc3Q0PwoKRXh0cmFwb2xhdGluZyB0
byBhIHJlYWwgdXNlIGNhc2UsIGNvbnNpZGVyIGEgc3lzdGVtIHdyaXRpbmcgYSBsb2cgZmlsZQp0
byB0aGUgVUJJIHBhcnRpdGlvbi4gUG93ZXIgY3V0b2ZmLCByZWNvdmVyeSwgYW5kIHdlIGhhdmUg
YSBnYXJiYWdlIGF0CnRoZSBlbmQgb2YgdGhlIGxvZyBmaWxlLiBJcyB0aGlzIGV4cGVjdGVkPwoK
VGhhbmtzIQoKUmVnYXJkcywKU2VyZ2VpCk9uIFNhdCwgMjAxOS0wNi0wOCBhdCAxMDo0NiArMDIw
MCwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOgo+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwg
LS0tLS0KPiA+IE5vdCBhY3R1YWxseSwgSSdtIGFmcmFpZC4gSSBkb24ndCBzZWUgaG93IG92ZXJ3
cml0aW5nIGEgZmlsZSBpcwo+ID4gcmVsZXZhbnQgaGVyZS4gRGVmaW5pdGVseSwgSSBkb24ndCBk
byBwb3dlciBjdXQgZHVyaW5nICJkZCBpZj10ZXN0Mgo+ID4gb2Y9dGVzdDAgY29udj1ub3RydW5j
Ii4gQXQgdGhlIG1vbWVudCBvZiBwb3dlciBjdXQtb2ZmLCB0ZXN0MiBoYXMKPiA+IGJlZW4KPiA+
IGNyZWF0ZWQgZnJvbSBzY3JhdGNoIGFuZCBoYXMgc29tZSBkYXRhIHdyaXR0ZW4gdG8gaXQsIHdp
dGggbW9yZQo+ID4gd3JpdGVzIGluCj4gPiBwcm9ncmVzcy4KPiAKPiBJJ20gc29ycnksIGJ1dCBJ
J20gcmVhbGx5IGNvbmZ1c2VkIG5vdy4KPiAKPiBQbGVhc2Ugc2hhcmUgeW91ciByZWFsIHRlc3Qg
Y2FzZSwgd2l0aCByZWFsIHJlc3VsdHMgYW5kIHdoYXQgeW91Cj4gZXhwZWN0Lgo+IE5vIGd1ZXNz
d29yaywgbm8gc2ltcGxpZmllZCBwc2V1ZG8gY29kZS4gOi0pCj4gCj4gT3RoZXJ3aXNlIHdlIGhh
dmUgbGl0dGxlIGNoYW5jZSB0byBzb3J0IHRoaXMgb3V0Lgo+IEFsc28gcmVhZCB3aGF0IFN0ZXZl
IHdyb3RlLgo+IAo+IFRoYW5rcywKPiAvL3JpY2hhcmQKPiAKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
