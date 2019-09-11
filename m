Return-Path: <SRS0=ZCmB=XG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE460C5ACAE
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Sep 2019 12:29:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C07212075C
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Sep 2019 12:29:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gnBlgJAX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C07212075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xG5y2bt+JqodcS2/pUfiQIMphGqdJxI98nxSq7NfLMk=; b=gnBlgJAXwK+dy8
	IahvAP4h/yFvwveSDLRZdcZPE8VQKHKajD7dwIUtIC5l0t8QNN0jDjR42RkKDKqEkaAzh5c6TjcYv
	5OykqXJEyvWDc/nPEoYr3rlMp28aVns49CyyQCqfSS3cGt04mQ0hyLCwqh+pJU7/RvdNAJfxz2QhE
	CRGM3vBEpkMf8YgGe4skMr29+t/wHBxpoWyTPAnLDubAhtX4BlrzRadFiw76ru6i3uw4CarC2cZFB
	eY+wG/5xT5Xdd4PdGgUbiL7pZMTKyLz6lKFMGbbBICi2C98bFWMvI1WhSubFc2NKvqEx8ujA+OLLE
	gMFB0eAuWmK90ky/qnuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i81kM-0002SH-PC; Wed, 11 Sep 2019 12:29:18 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i81kH-0002R9-Kj
 for linux-mtd@lists.infradead.org; Wed, 11 Sep 2019 12:29:16 +0000
X-Originating-IP: 148.69.85.38
Received: from xps13 (unknown [148.69.85.38])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 43624FF812;
 Wed, 11 Sep 2019 12:29:03 +0000 (UTC)
Date: Wed, 11 Sep 2019 14:29:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Piotr Sroka <piotrs@cadence.com>
Subject: Re: [v5 1/2] mtd: nand: Add new Cadence NAND driver to MTD subsystem
Message-ID: <20190911142901.317f8f8e@xps13>
In-Reply-To: <20190911094354.GA14863@global.cadence.com>
References: <20190725145804.8886-1-piotrs@cadence.com>
 <20190725150012.14416-1-piotrs@cadence.com>
 <20190830114645.59898cfe@xps13>
 <20190911094354.GA14863@global.cadence.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190911_052914_119815_2ADCEA41 
X-CRM114-Status: GOOD (  26.52  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Boris Brezillon <bbrezillon@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>, Marek Vasut <marek.vasut@gmail.com>,
 Paul Burton <paul.burton@mips.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-mtd@lists.infradead.org, Dmitry Osipenko <digetx@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Kazuhiro Kasai <kasai.kazuhiro@socionext.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUGlvdHIsCgpQaW90ciBTcm9rYSA8cGlvdHJzQGNhZGVuY2UuY29tPiB3cm90ZSBvbiBXZWQs
IDExIFNlcCAyMDE5IDEwOjQzOjU2CiswMTAwOgoKPiBUaGUgMDgvMzAvMjAxOSAxMTo0NiwgTWlx
dWVsIFJheW5hbCB3cm90ZToKPiA+RVhURVJOQUwgTUFJTAo+ID4KPiA+Cj4gPkhpIFBpb3RyLAo+
ID4KPiA+UGlvdHIgU3Jva2EgPHBpb3Ryc0BjYWRlbmNlLmNvbT4gd3JvdGUgb24gVGh1LCAyNSBK
dWwgMjAxOSAxNjowMDoxMgo+ID4rMDEwMDoKPiA+Cj4gPlN1YmplY3Qgc2hvdWxkIGJlOiBtdGQ6
IHJhd25hbmQ6Cj4gPgo+ID5MYXN0IGZldyBuaXRzIGluIHlvdXIgZHJpdmVyIHdoaWNoIG92ZXJh
bGwgbG9va3MgZ29vZCAoc2VlIGJlbG93KS4KPiA+Cj4gPk5vdyBJJ20gd2FpdGluZyBmb3IgUm9i
J3MgYWNrIG9uIHRoZSBiaW5kaW5ncy4gVGhpcyBkcml2ZXIgc2hvdWxkIGJlIGEKPiA+Z29vZCBj
YW5kaWRhdGUgZm9yIDUuNS4gIAo+IAo+IEkgdGhpbmsgdGhhdCBSb2IgYWxyZWR5IHJldmlldyBp
dC4gWW91IGNhbiBmaW5kIGhpc3QgcmV2aWV3IG9uCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wYXRjaC8xMTM2OTMyLwo+IExldCBtZSBrbm93IGlmIHNvbWV0aGluZyBlbHNlIHNob3Vs
ZCBiZSBpbXByb3ZlZCBvciBmaXhlZC4KCk9oIHJpZ2h0IEkgbWlzc2VkIGl0LiBUaGVuIGp1c3Qg
ZG9uJ3QgZm9yZ2V0IHRvIGNhcnJ5IHRoZSB0YWcgaW4geW91cgpuZXh0IGl0ZXJhdGlvbiBhbmQg
d2UnbGwgYmUgZmluZSEKCgpbLi4uXQoKPiA+PiArc3RhdGljIGlycXJldHVybl90IGNhZGVuY2Vf
bmFuZF9pc3IoaW50IGlycSwgdm9pZCAqZGV2X2lkKQo+ID4+ICt7Cj4gPj4gKwlzdHJ1Y3QgY2Ru
c19uYW5kX2N0cmwgKmNkbnNfY3RybCA9IGRldl9pZDsKPiA+PiArCXN0cnVjdCBjYWRlbmNlX25h
bmRfaXJxX3N0YXR1cyBpcnFfc3RhdHVzOwo+ID4+ICsJaXJxcmV0dXJuX3QgcmVzdWx0ID0gSVJR
X05PTkU7Cj4gPj4gKwo+ID4+ICsJc3Bpbl9sb2NrKCZjZG5zX2N0cmwtPmlycV9sb2NrKTsKPiA+
PiArCj4gPj4gKwlpZiAoaXJxX2RldGVjdGVkKGNkbnNfY3RybCwgJmlycV9zdGF0dXMpKSB7Cj4g
Pj4gKwkJLyogSGFuZGxlIGludGVycnVwdC4gKi8KPiA+PiArCQkvKiBGaXJzdCBhY2tub3dsZWRn
ZSBpdC4gKi8KPiA+PiArCQljYWRlbmNlX25hbmRfY2xlYXJfaW50ZXJydXB0KGNkbnNfY3RybCwg
JmlycV9zdGF0dXMpOwo+ID4+ICsJCS8qIFN0YXR1cyBpbiB0aGUgZGV2aWNlIGNvbnRleHQgZm9y
IHNvbWVvbmUgdG8gcmVhZC4gKi8KPiA+PiArCQljZG5zX2N0cmwtPmlycV9zdGF0dXMuc3RhdHVz
IHw9IGlycV9zdGF0dXMuc3RhdHVzOwo+ID4+ICsJCWNkbnNfY3RybC0+aXJxX3N0YXR1cy50cmRf
c3RhdHVzIHw9IGlycV9zdGF0dXMudHJkX3N0YXR1czsKPiA+PiArCQljZG5zX2N0cmwtPmlycV9z
dGF0dXMudHJkX2Vycm9yIHw9IGlycV9zdGF0dXMudHJkX2Vycm9yOwo+ID4+ICsJCS8qIE5vdGlm
eSBhbnlvbmUgd2hvIGNhcmVzIHRoYXQgaXQgaGFwcGVuZWQuICovCj4gPj4gKwkJY29tcGxldGUo
JmNkbnNfY3RybC0+Y29tcGxldGUpOwo+ID4+ICsJCS8qIFRlbGwgdGhlIE9TIHRoYXQgd2UndmUg
aGFuZGxlZCB0aGlzLiAqLwo+ID4+ICsJCXJlc3VsdCA9IElSUV9IQU5ETEVEOwo+ID4+ICsJfQo+
ID4+ICsJc3Bpbl91bmxvY2soJmNkbnNfY3RybC0+aXJxX2xvY2spOyAgCj4gPgo+ID5Zb3VyIGxv
Y2tpbmcgc2NoZW1lIHNlZW1zIHdyb25nIChtYXliZSBJJ20gbm90IGdvaW5nIGRlZXAgZW5vdWdo
IGluIHRoZQo+ID5jb2RlKSwgY2FuIHlvdSBwbGVhc2UgdHJ5IHdpdGggTE9DS0RFUCBlbmFibGVk
Pwo+ID4gIAo+IEkgd2lsbCBjaGVjayBpdC4KPiBBdCB0aGUgdGltZSBJIGNhbiBzZWUgb25seSBv
bmUgcHJvYmxlbTogdGhlIGNhZGVuY2VfbmFuZF9yZXNldF9pcnEgZnVuY3Rpb24gc2hvdWxkIHVz
ZSBzcGluX2xvY2tfaXJxc2F2ZSBpbnN0ZWFkIG9mIHNwaW5fbG9jay4KPiBDYW4geW91IHNlZSBh
bnkgb3RoZXIgcHJvYmxlbXM/CgpJdCBqdXN0IGZlbHQgYml6YXJyZS4gSnVzdCBydW4gd2l0aCBM
T0NLREVQIGVuYWJsZWQgYW5kIHdlJ2xsIGJlIGZpeGVkLgoKClsuLi5dCgo+ID4+ICsvKiBIYXJk
d2FyZSBpbml0aWFsaXphdGlvbi4gKi8KPiA+PiArc3RhdGljIGludCBjYWRlbmNlX25hbmRfaHdf
aW5pdChzdHJ1Y3QgY2Ruc19uYW5kX2N0cmwgKmNkbnNfY3RybCkKPiA+PiArewo+ID4+ICsJaW50
IHN0YXR1czsKPiA+PiArCXUzMiByZWc7Cj4gPj4gKwo+ID4+ICsJc3RhdHVzID0gY2FkZW5jZV9u
YW5kX3dhaXRfZm9yX3ZhbHVlKGNkbnNfY3RybCwgQ1RSTF9TVEFUVVMsCj4gPj4gKwkJCQkJICAg
ICAxMDAwMDAwLAo+ID4+ICsJCQkJCSAgICAgQ1RSTF9TVEFUVVNfSU5JVF9DT01QLCBmYWxzZSk7
Cj4gPj4gKwlpZiAoc3RhdHVzKQo+ID4+ICsJCXJldHVybiBzdGF0dXM7Cj4gPj4gKwo+ID4+ICsJ
cmVnID0gcmVhZGxfcmVsYXhlZChjZG5zX2N0cmwtPnJlZyArIENUUkxfVkVSU0lPTik7Cj4gPj4g
Kwo+ID4+ICsJZGV2X2luZm8oY2Ruc19jdHJsLT5kZXYsCj4gPj4gKwkJICIlczogY2FkZW5jZSBu
YW5kIGNvbnRyb2xsZXIgdmVyc2lvbiByZWcgJXhcbiIsCj4gPj4gKwkJIF9fZnVuY19fLCByZWcp
Owo+ID4+ICsKPiA+PiArCS8qIERpc2FibGUgY2FjaGUgYW5kIG11bHRpcGxhbmUuICovCj4gPj4g
Kwl3cml0ZWxfcmVsYXhlZCgwLCBjZG5zX2N0cmwtPnJlZyArIE1VTFRJUExBTkVfQ0ZHKTsKPiA+
PiArCXdyaXRlbF9yZWxheGVkKDAsIGNkbnNfY3RybC0+cmVnICsgQ0FDSEVfQ0ZHKTsgIAo+ID4K
PiA+Q2FjaGU/Cj4gPiAgCj4gSWYgIGZlYXR1cmUgaXMgZW5hYmxlZCB0aGVuIFRoZSBOQU5EIEZs
YXNoIENvbnRyb2xsZXIgd2lsbCBzZXF1ZW5jZSB0aGUgbXVsdGktcGFnZSByZWFkIGNvbW1hbmRz
IGFzIGNhY2hlIHJlYWQgb3IgY2FjaGUgcHJvZ3JhbSBzZXF1ZW5jZS4gTm90IHVzZWQgYnkgTGlu
dXggZHJpdmVyIGJlY2F1c2UgZHJpdmVyIGhhcyBwb3NzaWJpbGl0eSB0byBwcm9ncmFtL3JlYWQg
b25seSBhIHNpbmdsZSBwYWdlLgoKSW5kZWVkLCB0aGF0J3MgZmluZSB0aGVuLgoKCgpbLi4uXQoK
PiA+PiArCj4gPj4gKwlzd2l0Y2ggKHN0YXR1cykgewo+ID4+ICsJY2FzZSBTVEFUX0VDQ19VTkNP
UlI6Cj4gPj4gKwkJbXRkLT5lY2Nfc3RhdHMuZmFpbGVkKys7Cj4gPj4gKwkJZWNjX2Vycl9jb3Vu
dCsrOwo+ID4+ICsJCWJyZWFrOwo+ID4+ICsJY2FzZSBTVEFUX0VDQ19DT1JSOgo+ID4+ICsJCWVj
Y19lcnJfY291bnQgPSBGSUVMRF9HRVQoQ0RNQV9DU19NQVhFUlIsCj4gPj4gKwkJCQkJICBjZG5z
X2N0cmwtPmNkbWFfZGVzYy0+c3RhdHVzKTsKPiA+PiArCQltdGQtPmVjY19zdGF0cy5jb3JyZWN0
ZWQgKz0gZWNjX2Vycl9jb3VudDsgIAo+ID4KPiA+SXMgdGhpcyB2YWx1ZSB0aGUgbWF4aW11bSBu
dW1iZXIgb2YgYml0ZmxpcHMgaW4gZWFjaCBjaHVuayBvZiB0aGUgcGFnZT8KPiA+SWYgaXQgcmV0
dXJucyB0aGUgdG90YWwgbnVtYmVyIG9mIGJpdGZsaXBzIGNvcnJlY3RlZCBpbiB0aGUgZW50aXJl
IHBhZ2UKPiA+d2UgaGF2ZSBhIHByb2JsZW0uCj4gPiAgCj4gSXQgaXMgYSBtYXhpbXVtIG51bWJl
ciBvZiBjb3JyZWN0aW9ucyBhcHBsaWVkIHRvIGFueSBFQ0Mgc2VjdG9yIGluIHRoZQo+IHRyYW5z
YWN0aW9uLgo+IGl0IGxvb2tzIGxpa2UgZm9sb3dpbmcuCj4gbXRkLT5lY2Nfc3RhdHMuY29ycmVj
dGVkICs9IG1heChiaXRmbGlwc19jaHVuazEsIGJpdGZsaXBzX2NodW5rMiwgLi4uLikKPiAKPiBU
cmFuc2FjdGlvbiB3aWxsIGJlIG1hcmtlZCB1bmNvcnJlY3RhYmxlIGlmIGFueSBvbmUgb2YgdGhl
IHNlY3RvcnMgaXMKPiB1bmNvcnJlY3RhYmxlLgo+IEl0IGxvb2tzIGxpa2UgZm9sbG93aW5nLgo+
IGlmIChpc19jaHVuazFfZmFpbCB8fCBpc19jaHVuazJfZmFpbCAuLi4uLikKPiAgICAgIG10ZC0+
ZWNjX3N0YXRzLmZhaWxlZCsrOwoKRmluZQoKPiAKPiA+PiArCQlicmVhazsKPiA+PiArCWNhc2Ug
U1RBVF9FUkFTRUQ6Cj4gPj4gKwljYXNlIFNUQVRfT0s6Cj4gPj4gKwkJYnJlYWs7Cj4gPj4gKwlk
ZWZhdWx0Ogo+ID4+ICsJCWRldl9lcnIoY2Ruc19jdHJsLT5kZXYsICJyZWFkIHBhZ2UgZmFpbGVk
XG4iKTsKPiA+PiArCQlyZXR1cm4gLUVJTzsKPiA+PiArCX0KPiA+PiArCj4gPj4gKwlpZiAob29i
X3JlcXVpcmVkKQo+ID4+ICsJCWlmIChjYWRlbmNlX25hbmRfcmVhZF9iYm0oY2hpcCwgcGFnZSwg
Y2hpcC0+b29iX3BvaSkpCj4gPj4gKwkJCXJldHVybiAtRUlPOyAgCj4gPgo+ID5EbyB3ZSByZWFs
bHkgY2FyZSBhYm91dCB0aGUgQkJNIGF0IHRoaXMgbGV2ZWw/IElmIHdlIGFyZSByZXF1ZXN0ZWQg
dG8KPiA+cmVhZCB0aGUgcGFnZSwgSSBzdXBwb3NlIHdlIG11c3QgZG8gd2hhdCBpcyBpbiBvdXIg
aGFuZHMgdG8gcmV0dXJuIHRoZQo+ID5kYXRhPyBOb3JtYWxseSB0aGlzIGlzIGhhbmRsZWQgaW4g
dXNlcnNwYWNlIGRpcmVjdGx5LiAgCj4gSXQgaXMgYmVjYXVzZSB3aGVuIEVDQyBpcyBlbmFibGVk
IHRoZW4gcG9zaXRpb24gb2YgImxvZ2ljIiBzcGFyZSBhcmVhIGlzCj4gbW92ZWQuCgpUaGF0J3Mg
c2FkLgoKPiBMZXRzIHNheSB3ZSBoYXZlIHBhZ2Ugc2l6ZSA0MDk2IGFuZCBzZWN0b3Igc2l6ZSBp
cyAxMDI0Lgo+IE1hbnVmYWN0dXJlciB1c2UgYmVnaW5pbmcgb2Ygc3BhcmUgYXJlYSBhcyBCQk0u
IFNwYXJlIGFyZWEgc3RhcnRlZCBhdAo+IDQwOTYuCj4gSW4gY2FzZSBFQ0MgaXMgZW5hYmxlZC4g
NDA5NiBvZmZzZXQgaXMgc29tZXdoZXJlIGluIHNlY3RvciA0LiBTdGFydCBvZiBzcGFyZSBhcmUg
aXMgNDA5NiArIDMgKiBlY2Nfc2l6ZS4gU28gQkJNIGlzIHRha2VuIGZyb20gYmFkCj4gcGxhY2Uu
Cj4gPHBhZ2UgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID48c3BhcmUgICAgICAg
ICAgICAgICAgID4KPiA8c2VjICAgID48ZWNjPjxzZWMgID48ZWNjPjxzZWMgID48ZWNjPjxzZWMg
K3NwYXJlIGRhdCAgPjxlY2M+Cj4gVGhlcmVmb3JlIHdlIG5lZWQgdG8gcmVhZCBCQk0gZnJvbSBw
cm9wZXIgcGxhY2UuCj4gVGhlcmUgYXJlIHR3byAicHJvYmxlbXMiIHdoaWNoIG1ha2UgdXMgdG8g
cmVhZCBCQk0gc2VwYXJhdGVsbHkuCj4gCj4gMS4gRHVyaW5nIGJ1aWxkIEJCVCB0aGUgQkJNIGlz
IHJlYWQgYnkgZnVuY3Rpb25zIHdoaWNoIGFyZSBleHBlY3RlZCAgICAgdG8gdXNlIEVDQy4gMi4g
Q29udHJvbGxlciBpbnRlcmxlYXZlcyB0aGUgZGF0YSB3aXRoIEVDQy4KPiAKClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
