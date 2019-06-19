Return-Path: <SRS0=hJJw=US=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A58C31E5B
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 18:51:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D0CF208CA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 18:51:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LOl1icrh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D0CF208CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TybYgfSx01YQf8pF44cdh0PvnFc6nnLVbOqcBTGLaCU=; b=LOl1icrhDdP6l4
	DYuoLlRxOSVK4DYGKEQH1EAbzgQv7d+BIDYrAAax+GvTLaJCm5PiW6v4UvH+0oNg3UaSMq866rKK2
	m5SzsCbL66kOpXyFcgyUZketRoT1GOUTOnIfH94gKBtMJ805ugquU9j9vZ0WvzbMbPJdCYnQeCfnT
	5IcoRJtdYkJgkyrHkQl0Yozc9+9cqL/RSVq329FKDY+wCoBGKkimypTOgE1RE1X7qh3LsRhySqgRj
	C/v840ehvrwG+BA1MibZtzjOZg8BHqNTQ7RwlPuiutQalGXcU72xTDd1rsRfAs3kbdTkl8y6kmyG8
	M8hDT1YdfR2ySojAMOkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdfgU-0003FJ-Mo; Wed, 19 Jun 2019 18:51:50 +0000
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdfgR-0003Er-IW
 for linux-mtd@lists.infradead.org; Wed, 19 Jun 2019 18:51:49 +0000
Received: by mail-lj1-f195.google.com with SMTP id s21so220030lji.8
 for <linux-mtd@lists.infradead.org>; Wed, 19 Jun 2019 11:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7ya7a7DboiXIT6zCKu4epQy9R8h+sqP7HJzHJQtqZNU=;
 b=VF0UHvPyKNWp8PCjNlp2I6FSVxCmIET4p8lhCu6xlTY6arWFn8WYn0CDmVBmpscNt5
 11t98aAIdxroIJkmJbsk7py5zrIhGKmNQKvfkIq7lLTwT4jocRAVUIM7czC9Z3HZW5iP
 ElnZKu4eQSlvrFhGjVdgST/k204hzKGImZbZI0lexxjiDUP26pvTuylZofUKl+k1ONb0
 M8QHg0zFAzSptWaeK4mvknSLXvYQIFO7SB8vJFybtZvDuFQlQKgfztwmu2lBkwAmbGVO
 zSKfoqlssSLgTpH3VqY36n8sJJ75pOGZNc3KKkcK6EPNCNpfcebj+EKNKWkSfsA8nP84
 l4IA==
X-Gm-Message-State: APjAAAVaJSKuJOQ8RIIumVolxGGnVZ7njfJ1S+Jha4e1F+eRXLDcyC1R
 7m5ZA3SVqKvAAmXuu0yeRtCypTd5zNPSphULQN8=
X-Google-Smtp-Source: APXvYqwHsmNBGQcwjUpM9diIc7ODooJrd9PMVkfDhLSl7CsKfIuFjHsj8ZcODmGk8/umDC2vZ9olN/utvcqOFuavtkg=
X-Received: by 2002:a2e:9685:: with SMTP id q5mr18634627lji.227.1560970305391; 
 Wed, 19 Jun 2019 11:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <c57fe97b-ad4a-874e-663f-7f3a737824c9@microchip.com>
 <20190610062351.24405-1-tudor.ambarus@microchip.com>
 <CAMuHMdW3=fzFvt+ZmC2B6qf0zEwfvV--HVEoxa06Tk=a=Q1cWA@mail.gmail.com>
 <02babf5a-2a50-848c-27d9-9f810078cbcf@microchip.com>
In-Reply-To: <02babf5a-2a50-848c-27d9-9f810078cbcf@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Jun 2019 20:51:30 +0200
Message-ID: <CAMuHMdXi1W1RU8obRUVr=tgsytb=rCV1T+pA=pBxykxHv_WW+A@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: use 16-bit WRR command when QE is set on
 spansion flashes
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_115147_615045_22D779A8 
X-CRM114-Status: GOOD (  23.11  )
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
Cc: "R, Vignesh" <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Jonas Bonn <jonas@norrbonn.se>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVHVkb3IsCgpPbiBXZWQsIEp1biAxOSwgMjAxOSBhdCA1OjQ3IFBNIDxUdWRvci5BbWJhcnVz
QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+IE9uIDA2LzExLzIwMTkgMTE6MzUgQU0sIEdlZXJ0IFV5
dHRlcmhvZXZlbiB3cm90ZToKPiA+IE9uIE1vbiwgSnVuIDEwLCAyMDE5IGF0IDg6MjQgQU0gPFR1
ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4gPj4gRnJvbTogVHVkb3IgQW1iYXJ1
cyA8dHVkb3IuYW1iYXJ1c0BtaWNyb2NoaXAuY29tPgo+ID4+Cj4gPj4gU1BJIG1lbW9yeSBkZXZp
Y2VzIGZyb20gZGlmZmVyZW50IG1hbnVmYWN0dXJlcnMgaGF2ZSB3aWRlbHkKPiA+PiBkaWZmZXJl
bnQgY29uZmlndXJhdGlvbnMgZm9yIFN0YXR1cywgQ29udHJvbCBhbmQgQ29uZmlndXJhdGlvbgo+
ID4+IHJlZ2lzdGVycy4gSkVERUMgMjE2QyBkZWZpbmVzIGEgbmV3IG1hcCBmb3IgdGhlc2UgY29t
bW9uIHJlZ2lzdGVyCj4gPj4gYml0cyBhbmQgdGhlaXIgZnVuY3Rpb25zLCBhbmQgZGVzY3JpYmVz
IGhvdyB0aGUgaW5kaXZpZHVhbCBiaXRzIG1heQo+ID4+IGJlIGFjY2Vzc2VkIGZvciBhIHNwZWNp
ZmljIGRldmljZS4gRm9yIHRoZSBKRURFQyAyMTZCIGNvbXBsaWFudAo+ID4+IGZsYXNoZXMsIHdl
IGNhbiBwYXJ0aWFsbHkgZGVkdWNlIFN0YXR1cyBhbmQgQ29uZmlndXJhdGlvbiByZWdpc3RlcnMK
PiA+PiBmdW5jdGlvbnMgYnkgaW5zcGVjdGluZyB0aGUgMTZ0aCBEV09SRCBvZiBCRlBULiBPbGRl
ciBmbGFzaGVzIHRoYXQKPiA+PiBkb24ndCBkZWNsYXJlIHRoZSBTRkRQIHRhYmxlcyAoU1BBTlNJ
T04gRkw1MTJTQUlGRzEgMzExUVEwNjMgQSDCqTExCj4gPj4gU1BBTlNJT04pIGxldCB0aGUgc29m
dHdhcmUgZGVjaWRlIGhvdyB0byBpbnRlcmFjdCB3aXRoIHRoZXNlIHJlZ2lzdGVycy4KPiA+Pgo+
ID4+IFRoZSBjb21taXQgZGNiNGIyMmVlYWY0ICgic3BpLW5vcjogczI1Zmw1MTJzIHN1cHBvcnRz
IHJlZ2lvbiBsb2NraW5nIikKPiA+PiB1bmNvdmVyZWQgYSBwcm9iZSBlcnJvciBmb3IgczI1Zmw1
MTJzLCB3aGVuIHRoZSBRVUFEIGJpdCBDUlsxXSB3YXMgc2V0Cj4gPj4gaW4gdGhlIGJvb3Rsb2Fk
ZXIuIFdoZW4gdGhpcyBiaXQgaXMgc2V0LCBvbmx5IHRoZSBXcml0ZSBSZWdpc3Rlcgo+ID4+IFdS
UiBjb21tYW5kIGZvcm1hdCB3aXRoIDE2IGRhdGEgYml0cyBtYXkgYmUgdXNlZCwgV1JSIHdpdGgg
OCBiaXRzCj4gPj4gaXMgbm90IHJlY29nbml6ZWQgYW5kIGhlbmNlIHRoZSBlcnJvciB3aGVuIHRy
eWluZyB0byBjbGVhciB0aGUgYmxvY2sKPiA+PiBwcm90ZWN0aW9uIGJpdHMuCj4gPj4KPiA+PiBG
aXggdGhlIGFib3ZlIGJ5IHVzaW5nIDE2LWJpdHMgV1JSIGNvbW1hbmQgd2hlbiBRdWFkIGJpdCBp
cyBzZXQuCj4gPj4KPiA+PiBCYWNrd2FyZCBjb21wYXRpYmlsaXR5IHNob3VsZCBiZSBmaW5lLiBU
aGUgbmV3bHkgaW50cm9kdWNlZAo+ID4+IHNwaV9ub3Jfc3BhbnNpb25fY2xlYXJfc3JfYnAoKSBp
cyB0aWdodGx5IGNvdXBsZWQgd2l0aCB0aGUKPiA+PiBzcGFuc2lvbl9xdWFkX2VuYWJsZSgpIGZ1
bmN0aW9uLiBCb3RoIGFzc3VtZSB0aGF0IHRoZSBXcml0ZSBSZWdpc3Rlcgo+ID4+IHdpdGggMTYg
Yml0cywgdG9nZXRoZXIgd2l0aCB0aGUgUmVhZCBDb25maWd1cmF0aW9uIFJlZ2lzdGVyICgzNWgp
Cj4gPj4gaW5zdHJ1Y3Rpb25zIGFyZSBzdXBwb3J0ZWQuCj4gPj4KPiA+PiBSZXBvcnRlZC1ieTog
R2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KPiA+PiBTaWduZWQtb2Zm
LWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQG1pY3JvY2hpcC5jb20+Cj4gPj4gLS0t
Cj4gPj4gR2VlcnQsIEpvbmFzLAo+ID4+Cj4gPj4gVGhpcyBwYXRjaCBpcyBjb21waWxlLXRlc3Rl
ZCBvbmx5LiBJIGRvbid0IGhhdmUgdGhlIGZsYXNoLCBJIG5lZWQgeW91cgo+ID4+IGhlbHAgZm9y
IHRlc3RpbmcgdGhpcy4KPiA+Cj4gPiBUaGFua3MsIHRoaXMgcmV2aXZlcyBhY2Nlc3MgdG8gdGhl
IHMyNWZsNTEycyBvbiBLb2Vsc2NoLgo+ID4KPiA+IEZpeGVzOiBkY2I0YjIyZWVhZjQ0ZjkxICgi
c3BpLW5vcjogczI1Zmw1MTJzIHN1cHBvcnRzIHJlZ2lvbiBsb2NraW5nIikKPgo+IEkgZGlkbid0
IGFkZCB0aGUgRml4ZXMgdGFnIGJlY2F1c2UgdGhpcyBjb21taXQgaGVscGVkIHVzIGRpc2NvdmVy
IGEgY2FzZSB0aGF0Cj4gaGFzIG5vdCBiZWVuIHRha2VuIGludG8gY29uc2lkZXJhdGlvbiBiZWZv
cmUuIEl0IGRpZG4ndCBpbnRyb2R1Y2UgYSBidWcsIGJ1dAo+IHJhdGhlciByZXZlYWxlZCBvbmUu
IEhvd2V2ZXIsIGl0J3Mgbm90IHRoZSB0aW1lIHRvIHdhbGsgb3ZlciB0aGlzIHRoaW4gbGluZSwg
c28KPiBJJ2xsIGFkZCBpdCwgdGhhbmtzIQoKR29vZC4gRml4ZXMgYWxzbyBzZXJ2ZXMgYXMgYW4g
aW5kaWNhdG9yIHRoYXQgaWYgZGNiNGIyMmVlYWY0NGY5MSBpcwpiYWNrcG9ydGVkIHRvIHN0YWJs
ZSwgdGhlICJmaXgiIG11c3QgYmUgYmFja3BvcnRlZCwgdG9vLgoKPiA+IFRlc3RlZC1ieTogR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT5IaSBUdWRvciwKPiA+Cj4g
PiBUd28gcXVlc3Rpb25zIGJlbG93Li4uCj4gPgo+ID4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1u
b3Ivc3BpLW5vci5jCj4gPj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMKPiA+
Cj4gPj4gK3N0YXRpYyBpbnQgc3BpX25vcl9zcGFuc2lvbl9jbGVhcl9zcl9icChzdHJ1Y3Qgc3Bp
X25vciAqbm9yKQo+ID4+ICt7Cj4gPgo+ID4gWy4uLl0KPiA+Cj4gPj4gKyAgICAgICAgKiBXaGVu
IHRoZSBjb25maWd1cmF0aW9uIHJlZ2lzdGVyIFFVQUQgYml0IENSWzFdIGlzIDEsIG9ubHkKPiA+
PiArICAgICAgICAqIHRoZSBXUlIgY29tbWFuZCBmb3JtYXQgd2l0aCAxNiBkYXRhIGJpdHMgbWF5
IGJlIHVzZWQuCj4gPgo+ID4gcy9XUlIvV1JTUi8/Cj4KPiBTMjVGTDUxMlMgbmFtZWQgaXQgIldy
aXRlIFJlZ2lzdGVycyIgY29tbWFuZCBhbmQgY2hvc2UgdGhlICJXUlIiIGFjcm9ueW0uCj4gSkVT
RDIxNkQgbmFtZXMgaXQgIldyaXRlIFJlZ2lzdGVyIiBjb21tYW5kIGFuZCBkb2Vzbid0IHN1Z2dl
c3QgYW4gYWNyb255bS4gSSdsbAo+IHMvIldSUiIvIldyaXRlIFJlZ2lzdGVyIGNvbW1hbmQiLCB0
byB1c2UgdGhlIEpFU0QyMTZEIG5hbWluZyBhbmQgYXZvaWQgY29uZnVzaW9uLgo+Cj4gSSBhbHNv
IGZvcmdvdCB0byBkZXNjcmliZSBpbnQgKCpjbGVhcl9zcl9icCksIHYyIHdpbGwgZm9sbG93LiBX
aWxsIGtlZXAgdGhlIFItYgo+IGFuZCBULWIgdGFncyBzaW5jZSBJJ2xsIGp1c3QgdXBkYXRlIGNv
bW1lbnRzLgoKT0suIFRoYW5rcyEKCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAg
ICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9m
IExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBj
b252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tl
ci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3Jh
bW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
