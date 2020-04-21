Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E67BC2BA19
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 07:08:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10286206A5
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 07:08:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IP+6xxoK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kalray.eu header.i=@kalray.eu header.b="ejnAZ/px"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10286206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kalray.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rh+AoXP1VXeyE258m/wqu/mw48+xpKHShVsSjC4u3tE=; b=IP+6xxoKfmR/Kh
	W/L8lmfZ+abw/4X6HxG+Y5puRKoT8NyECXrq9C2Vvv9Z1vVcjtmQmKKMPbGcXLSxObQEp56imt7ci
	A3tPKJ5k/+rwnI/IgzARa1YyykNyc0wza+98ckB4z/pfdPTnTtLgSBGoytIY+268zkLAfC3lMFtLW
	iyyXpkCZi/OgVzO+IW8N6M0yo0zp/A0VzL5cv9kX5yaLSCVtkuIBZiCeV6RAdwHM7GSaUkKklMglw
	uB/0GTgyErwkAvqfEZ38xdbco9XSfE/DH2rHh5xg6vGNIHU4FuNz/VnLuG1iGeeMysFfTQ47WKDCq
	1TnlPM8B5+cfrG7aTGug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQn0l-0001OI-FH; Tue, 21 Apr 2020 07:08:03 +0000
Received: from zimbra2.kalray.eu ([92.103.151.219])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQn0i-0001M8-7c
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 07:08:01 +0000
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id A6CDF27E039A;
 Tue, 21 Apr 2020 09:07:57 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id VnFh86lcJuca; Tue, 21 Apr 2020 09:07:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id DFC6727E06C1;
 Tue, 21 Apr 2020 09:07:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu DFC6727E06C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1587452876;
 bh=ufm9yZSRtYmx3MHRNMrA5MNRiT5MrRD1Yhw3IeM6pZA=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=ejnAZ/pxGLDwi3zSwxLtUnKn7C6TI+a20eVd1LlWQ+Kz1237P+LBdvKlCqvCZ9+hs
 L3WOOs0581spu9PyXfeEXsksUlddUiisiv0qdHmHjeVPCnch3f8fsv/T3Igo/3XSWw
 PBzfe2iIs2Gcv2wWkN0AoEkI2QtSkadvffddzL4I=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id QoHi6CGZQf_D; Tue, 21 Apr 2020 09:07:56 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id C98EC27E039A;
 Tue, 21 Apr 2020 09:07:56 +0200 (CEST)
Date: Tue, 21 Apr 2020 09:07:56 +0200 (CEST)
From: =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalray.eu>
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>
Message-ID: <1220480151.16477138.1587452876610.JavaMail.zimbra@kalray.eu>
In-Reply-To: <2185268.xDFeLDFsC1@192.168.0.120>
References: <20200417160839.25880-1-cleger@kalray.eu>
 <1950407.5XCTmqoEVg@192.168.0.120>
 <1734428336.16421904.1587394202163.JavaMail.zimbra@kalray.eu>
 <2185268.xDFeLDFsC1@192.168.0.120>
Subject: Re: [PATCH] mtd: spi-nor: Add support for is25lp01g
MIME-Version: 1.0
X-Originating-IP: [192.168.40.202]
X-Mailer: Zimbra 8.8.15_GA_3895 (ZimbraWebClient - GC81 (Linux)/8.8.15_GA_3895)
Thread-Topic: spi-nor: Add support for is25lp01g
Thread-Index: AQHWFw0/tWJ4ISRUwk6rGADNBybaDFUftyjv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_000800_623825_ED9CA602 
X-CRM114-Status: GOOD (  14.63  )
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
Cc: richard <richard@nod.at>, linux-mtd <linux-mtd@lists.infradead.org>,
 vigneshr <vigneshr@ti.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVHVkb3IsCgotLS0tLSBPbiAyMSBBcHIsIDIwMjAsIGF0IDA2OjQwLCBUdWRvciBBbWJhcnVz
IFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbSB3cm90ZToKCj4gT24gTW9uZGF5LCBBcHJpbCAy
MCwgMjAyMCA1OjUwOjAyIFBNIEVFU1QgQ2zDqW1lbnQgTGVnZXIgd3JvdGU6Cj4+IEVYVEVSTkFM
IEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGtub3cgdGhlCj4+IGNvbnRlbnQgaXMgc2FmZQo+PiAKPj4gSGkgVHVkb3IsCj4gCj4gSGksIENs
ZW1lbnQsCj4gCj4+IAo+PiAtLS0tLSBPbiAyMCBBcHIsIDIwMjAsIGF0IDE0OjE0LCBUdWRvciBB
bWJhcnVzIFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbQo+IHdyb3RlOgo+PiA+IEhpLCBDbGVt
ZW50LAo+PiA+IAo+PiA+IE9uIEZyaWRheSwgQXByaWwgMTcsIDIwMjAgNzowODozOSBQTSBFRVNU
IENsZW1lbnQgTGVnZXIgd3JvdGU6Cj4+ID4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sg
bGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cKPj4gPj4gdGhlCj4+ID4+
IGNvbnRlbnQgaXMgc2FmZQo+PiA+PiAKPj4gPj4gVXBkYXRlIHRoZSBpc3NpX3BhcnRzIHRhYmxl
IGZvciBpczI1bHAwMWcgKDEyOE1CKSBkZXZpY2UgZnJvbSBJU1NJLgo+PiA+PiBUZXN0ZWQgb24g
S2FscmF5IEsyMDAgYm9hcmQuCj4+ID4+IAo+PiA+PiBTaWduZWQtb2ZmLWJ5OiBDbGVtZW50IExl
Z2VyIDxjbGVnZXJAa2FscmF5LmV1Pgo+PiA+PiAtLS0KPj4gPj4gCj4+ID4+ICBkcml2ZXJzL210
ZC9zcGktbm9yL2lzc2kuYyB8IDIgKysKPj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKPj4gPj4gCj4+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2lzc2ku
YyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvaXNzaS5jCj4+ID4+IGluZGV4IGZmY2I2MGU1NGE4MC4u
YzNjMzQzOGUzZDA4IDEwMDY0NAo+PiA+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2lzc2ku
Ywo+PiA+PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2lzc2kuYwo+PiA+PiBAQCAtNDksNiAr
NDksOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8gaXNzaV9wYXJ0c1tdID0gewo+
PiA+PiAKPj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTRUNUXzRLIHwgU1BJX05P
Ul9EVUFMX1JFQUQgfAo+PiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNQSV9OT1Jf
UVVBRF9SRUFECj4+ID4+IHwgCj4+ID4+IHwgU1BJX05PUl80Ql9PUENPREVTKQo+PiA+PiB8IAo+
PiA+PiAgICAgICAgICAgICAgICAgLmZpeHVwcyA9ICZpczI1bHAyNTZfZml4dXBzIH0sCj4+ID4+
IAo+PiA+PiArICAgICAgIHsgImlzMjVscDAxZyIsICBJTkZPKDB4OWQ2MDFiLCAwLCA2NCAqIDEw
MjQsIDIwNDgsCj4+ID4gCj4+ID4gVGhlcmUgaXMgYSAiSyIgZmxhdm9yIG9mIHRoaXMgZmxhc2gg
d2hpY2ggaGFzIDUxMiBCeXRlIFBhZ2Ugc2l6ZSB3aXRoIDI1Ngo+PiA+IEtCIEJsb2NrIHNpemUu
IFdoaWxlIHRoZSBwYWdlIHNpemUgY2FuIGJlIGRldGVybWluZWQgYnkgcGFyc2luZyBTRkRQLCBJ
Cj4+ID4gdGhpbmsgd2Ugd2lsbCBoYXZlIHNvbWUgcHJvYmxlbXMgd2l0aCBzZWN0b3Jfc2l6ZSBi
ZWNhdXNlIGFzIG9mIG5vdywgdGhlCj4+ID4gc2VjdG9yX3NpemUgaXMgYWx3YXlzIHNldCB0byA2
NEtCLiBBbiBpbmNvcnJlY3Qgc2VjdG9yX3NpemUgd2lsbCBhZmZlY3QKPj4gPiBlcmFzZXMgYW5k
IGxvY2tpbmcuCj4+IFRoYW5rcywgSSBkaWQgbm90IG5vdGljZWQgdGhhdCAhIElmIEkgdW5kZXJz
dGFuZCwgdGhpcyB3aWxsIHJlcXVpcmUgdG8KPj4gbW9kaWZ5IHRoZSBjb3JlIHRvIGhhbmRsZSBz
ZWN0b3Igc2l6ZSB0aGUgc2FtZSB3YXkgYXMgcGFnZV9zaXplIGFuZAo+PiBwcm9iYWJseSBhZGQg
YSBmaXh1cCB0byBkZXRlY3QgdGhlICJLIiBvcHRpb25zIGZyb20gU0ZEUCA/Cj4gCj4gUmlnaHQu
IFlvdSBjYW4gYWRkIGEgcG9zdF9iZnB0IGZpeHVwIGhvb2sgZm9yIHRoaXMgZmxhc2guIFlvdSBj
YW4KPiBkaWZmZXJlbnRpYXRlIGJldHdlZW4gdGhlICJLIiB2ZXJzaW9uIGFuZCB0aGUgcmVzdCBi
eSB0aGUgcGFnZSBzaXplLiBTaW5jZSB0aGUKPiBwYWdlIHNpemUgaXMgdGlnaHRseSBjb3VwbGVk
IHdpdGggdGhlIHNlY3RvciBzaXplLCB5b3UgY2FuIGFtZW5kIGJvdGggaW4gdGhlCj4gcG9zdF9i
ZnB0IGhvb2suCgpPaywgdGhpcyBzZWVtcyBjbGVhciAhIEknbGwgZ2l2ZSBpdCBhIHRyeS4gQnkg
bG9va2luZyBxdWlja2x5IGF0IHRoZSBjb2RlIEkKdGhpbmsgdGhhdCBuX3NlY3RvcnMgd2lsbCBh
bHNvIGhhdmUgdG8gYmUgdXBkYXRlZCBhZnRlciBkaXNjb3ZlcmluZyB0aGUKc2VjdG9yX3NpemUg
ZnJvbSBCRlBUIChmb3IgZmxhc2ggc2l6ZSBjb21wdXRhdGlvbikuIFNpbmNlIHNvbWUgcGFyYW1l
dGVycwpvZiB0aGUgbm9yIGFyZSBpbml0aWFsaXplZCBlYXJseSBpbiBzcGlfbm9yX2luZm9faW5p
dF9wYXJhbXMgdXNpbmcKc2VjdG9yX3NpemUsIHNob3VsZCBJIG1vdmUgdGhlIGNhbGwgbWFraW5n
IHVzZSBvZiBzZWN0b3Jfc2l6ZSBsYXRlciBpbiB0aGUKaW5pdCAoaW4gc3BpX25vcl9sYXRlX2lu
aXRfcGFyYW1zIGZvciBpbnN0YW5jZSkgPwoKPiAKPj4gVGhpcyBpcyBwcm9iYWJseSBtb3JlIGNo
YW5nZXMgdGhhbiBJIGNhbiBoYW5kbGUsIGFuZCB5b3UgY2FuIHByb2JhYmx5IGRyb3AKPj4gdGhp
cyBwYXRjaCBzaW5jZSBub3QgcmVhbGx5IGZ1bmN0aW9uYWwgZm9yICJLIiB0eXBlIGZsYXNoLgo+
IAo+IEkgZHJvcHBlZCBpdC4gWW91IHNob3VsZCB0cnkgdG8gZml4IGl0LCBJIGNhbiBndWlkZSB5
b3UgaWYgbmVlZGVkLiBPciBJIGNhbiBkbwo+IGl0IG15c2VsZiwgYnV0IEknbGwgbmVlZCBzb21l
IGhlbHAgZnJvbSB5b3UgYXQgdGVzdGluZy4KCkkgd2lsbCB0cnkgdG8gZG8gaXQgYnV0IEkgd2ls
bCBwcm9iYWJseSBvbmx5IGJlIGFibGUgdG8gdGVzdCB0aGUgcGF0Y2hlcyBpbiBhIApjb3VwbGUg
b2Ygd2Vla3MgZHVlIHRvIG91ciBhcmNoaXRlY3R1cmUgbm90IGJlaW5nIHJlYmFzZWQgb24gNS43
IHlldC4KClRoYW5rcywKCkNsw6ltZW50Cgo+IAo+IENoZWVycywKPiB0YQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
