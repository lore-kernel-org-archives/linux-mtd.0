Return-Path: <SRS0=x3fM=EE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E818CC2D0A3
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 08:39:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5790020780
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 08:39:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3dj/AJfJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5790020780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YwBAyb19FWbvAUOYkYkj6Q53XNJHaobkq9WdkCGlRRg=; b=3dj/AJfJJpz2YdC4+fD+hW8dL
	Pq0hQ5+HUPVAPxXkje/5Vz59RYW38uUiCDb6ONj03yIAexIlp3ipa79Z/E9fOtu7vAgGNdolEtp+l
	JQntJFLWW+5h7uPxAF8Iy4WhnXM9BAxR28Raf2Dv5mzlXmbMrVHv44EV3UXN0gVJXeZtDq9ihiQHa
	G6mO6EyIuZFrZk1EdbMDAPHyKXZvfn+g2YKrdI79RsDUv/tv9i5i0+YJjgIrDCvuju1aEUbaMX7aU
	0qNG8LWcqxtALtGVd628yNhZieggKJqsPXz/KzFi994vymMV5cQ0li6iUbKhffGYld30y7WmPKxXa
	ItzKiz7Ow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY3S4-00017O-1g; Thu, 29 Oct 2020 08:38:32 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY3S1-00016U-00
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2020 08:38:30 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9CEF41F45880;
 Thu, 29 Oct 2020 08:38:24 +0000 (GMT)
Date: Thu, 29 Oct 2020 09:38:16 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 0/5] mtd: rawnand: qcom: Add support for QSPI nand
Message-ID: <20201029093816.7dab154a@collabora.com>
In-Reply-To: <20201029085344.5b2a4b51@xps13>
References: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
 <20201028104835.3dc31745@xps13>
 <10db598eed716d7759bc0125b6977cf1@codeaurora.org>
 <20201029085344.5b2a4b51@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_043829_157022_B5FB9192 
X-CRM114-Status: GOOD (  29.86  )
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
Cc: mdalam@codeaurora.org, devicetree@vger.kernel.org, vigneshr@ti.com,
 richard@nod.at, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, sricharan@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyOSBPY3QgMjAyMCAwODo1Mzo0NCArMDEwMApNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSGVsbG8sCj4gCj4gbWRhbGFtQGNvZGVhdXJv
cmEub3JnIHdyb3RlIG9uIFdlZCwgMjggT2N0IDIwMjAgMjM6NTQ6MjMgKzA1MzA6Cj4gCj4gPiBP
biAyMDIwLTEwLTI4IDE1OjE4LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPiA+IEhlbGxvLAo+
ID4gPiAKPiA+ID4gTWQgU2FkcmUgQWxhbSA8bWRhbGFtQGNvZGVhdXJvcmEub3JnPiB3cm90ZSBv
biBTYXQsIDEwIE9jdCAyMDIwCj4gPiA+IDExOjAxOjM3ICswNTMwOgo+ID4gPiAgICAgCj4gPiA+
PiBRUElDIDIuMCBzdXBwb3J0cyBTZXJpYWwgTkFORCBzdXBwb3J0IGluIGFkZGl0aW9uIHRvIGFs
bCBmZWF0dXJlcyBhbmQKPiA+ID4+IGNvbW1hbmRzIGluIFFQSUMgMS4wIGZvciBwYXJhbGxlbCBO
QU5ELiBQYXJhbGxlbCBhbmQgU2VyaWFsIE5BTkQgPj4gY2Fubm90Cj4gPiA+PiBvcGVyYXRlIHNp
bXVsdGFuZW91c2x5LiBRU1BJIG5hbmQgZGV2aWNlcyB3aWxsIGNvbm5lY3QgdG8gUVBJQyA+PiBJ
T19NQUNSTwo+ID4gPj4gYmxvY2sgb2YgUVBJQyBjb250cm9sbGVyLiBUaGVyZSBpcyBhIHNlcGFy
YXRlIElPX01BQ1JPIGNsb2NrIGZvciA+PiBJT19NQUNSTwo+ID4gPj4gYmxvY2suIERlZmF1bHQg
SU9fTUFDUk8gYmxvY2sgZGl2aWRlIHRoZSBpbnB1dCBjbG9jayBieSA0LiBzbyBpZiA+PiBJT19N
QUNSTwo+ID4gPj4gaW5wdXQgY2xvY2sgaXMgMzIwTUh6IHRoZW4gb24gYnVzIGl0IHdpbGwgYmUg
ODBNSHosIHNvIFFTUEkgbmFuZCA+PiBkZXZpY2UKPiA+ID4+IHNob3VsZCBhbHNvIHN1cHBvcnQg
dGhpcyBmcmVxdWVuY3kuICAgIAo+ID4gPj4gPj4gUVBJQyBwcm92aWRlcyA0IGRhdGEgcGlucyB0
byBRU1BJIG5hbmQuIEluIHN0YW5kYXJkIFNQSSBtb2RlICh4MSBtb2RlKSA+PiBkYXRhICAgIAo+
ID4gPj4gdHJhbnNmZXIgd2lsbCBvY2N1ciBvbiBvbmx5IDIgcGlucyBvbmUgcGluIGZvciBTZXJp
YWwgZGF0YSBpbiBhbmQgb25lID4+IGZvcgo+ID4gPj4gc2VyaWFsIGRhdGEgb3V0LiBJbiBRVUFE
IFNQSSBtb2RlICh4NCBtb2RlKSBkYXRhIHRyYW5zZmVyIHdpbGwgb2NjdXIgPj4gYXQgYWxsCj4g
PiA+PiB0aGUgZm91ciBkYXRhIGxpbmVzLiBRUElDIGNvbnRyb2xsZXIgc3VwcG9ydHMgY29tbWFu
ZCBmb3IgeDEgbW9kZSBhbmQgPj4geDQgbW9kZS4gICAgCj4gPiA+PiA+PiBNZCBTYWRyZSBBbGFt
ICg1KTogICAgCj4gPiA+PiAgIGR0LWJpbmRpbmdzOiBxY29tX25hbmRjOiBJUFE1MDE4IFFQSUMg
TkFORCBkb2N1bWVudGF0aW9uCj4gPiA+PiAgIG10ZDogcmF3bmFuZDogcWNvbTogQWRkIGluaXRp
YWwgc3VwcG9ydCBmb3IgcXNwaSBuYW5kCj4gPiA+PiAgIG10ZDogcmF3bmFuZDogcWNvbTogUmVh
ZCBRUElDIHZlcnNpb24KPiA+ID4+ICAgbXRkOiByYXduYW5kOiBxY29tOiBFbmFibGUgc3VwcG9y
dCBmb3IgZXJhc2UscmVhZCAmIHdyaXRlIGZvciBzZXJpYWwKPiA+ID4+ICAgICBuYW5kLgo+ID4g
Pj4gICBtdGQ6IHJhd25hbmQ6IHFjb206IEFkZCBzdXBwb3J0IGZvciBzZXJpYWwgdHJhaW5pbmcu
ICAgIAo+ID4gPj4gPj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9xY29tX25hbmRjLnR4
dCAgICAgICAgIHwgICAzICsgICAgCj4gPiA+PiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9p
ZHMuYyAgICAgICAgICAgICAgICAgICAgfCAgMTMgKwo+ID4gPj4gIGRyaXZlcnMvbXRkL25hbmQv
cmF3L3Fjb21fbmFuZGMuYyAgICAgICAgICAgICAgICAgIHwgNTAyID4+ICsrKysrKysrKysrKysr
KysrKysrLQo+ID4gPj4gIDMgZmlsZXMgY2hhbmdlZCwgNDk0IGluc2VydGlvbnMoKyksIDI0IGRl
bGV0aW9ucygtKSAgICAKPiA+ID4+ID4gPiBJJ20gc29ycnkgYnV0IHRoaXMgc2VyaWVzIGNsZWFy
bHkgYnJlYWtzIHRoZSBjdXJyZW50IGxheWVyaW5nLiBJIGNhbm5vdCAgICAKPiA+ID4gYXV0aG9y
aXplIFNQSS1OQU5EIGNvZGUgdG8gZmFsbCBpbnRvIHRoZSByYXcgTkFORCBzdWJzeXN0ZW0uCj4g
PiA+ICAgICAKPiA+IAo+ID4gSSBhbSBhZ3JlZSB3aXRoIHlvdSwgd2Ugc2hvdWxkIG5vdCBhZGQg
U1BJLU5BTkQgY2hhbmdlcyBpbnNpZGUKPiA+IHJhdyBOQU5EIHN1YnN5c3RlbS4KPiA+ICAgCj4g
PiA+IEFzIGJvdGggdHlwb2xvZ2llcyBjYW5ub3QgYmUgdXNlZCBhdCB0aGUgc2FtZSB0aW1lLCBJ
IGd1ZXNzIHlvdSBzaG91bGQKPiA+ID4gaGF2ZSBhbm90aGVyIGRyaXZlciBoYW5kbGluZyB0aGlz
IGZlYXR1cmUgdW5kZXIgdGhlIHNwaS8gc3Vic3lzdGVtICsKPiA+ID4gYSBmZXcgZGVjbGFyYXRp
b25zIGluIHRoZSBTUEktTkFORCBkZXZpY2VzIGxpc3QuCj4gPiA+ICAgICAKPiA+IAo+ID4gSW5p
dGlhbGx5IEkgd2FzIHN0YXJ0ZWQgd3JpdGluZyBzZXBhcmF0ZSBkcml2ZXIgdW5kZXIgU1BJLU5B
TkQgc3Vic3lzdGVtIHRoZW4gSQo+ID4gcmVhbGl6ZWQgdGhhdCBtb3JlIHRoYW4gODUlIG9mIHJh
dy9xY29tX25hbmQuYyBjb2RlIGdldHRpbmcgZHVwbGljYXRlZC4KPiA+IAo+ID4gVGhhdCdzIHdo
eSBJIGhhdmUgYWRkZWQgdGhpcyBTUEktTkFORCBjaGFuZ2UgaW4gcmF3L3Fjb21fbmFuZC5jIHNp
bmNlCj4gPiBtb3JlIHRoYW4gODUlIG9mIGNvZGUgd2lsbCBiZSByZXVzZWQuCj4gPiAKPiA+IElm
IEkgd2lsbCBhZGQgdGhpcyBjaGFuZ2UgaW5zaWRlIFNQSS1OQU5EIHN1YnN5c3RlbSB0aGVuIG11
Y2ggb2YKPiA+IHJhdy9xY29tX25hbmQuYyBjb2RlIHdpbGwgZ2V0IGR1cGxpY2F0ZWQuIFdvdWxk
IGl0IGJlIG9rID8gIAo+IAo+IFdoYXQgYWJvdXQgbW92aW5nIHRoZSBnZW5lcmljIGNvZGUgdG8g
ZHJpdmVycy9tdGQvbmFuZC9jb21tb24vIGFuZAoKWWVhaCwgSSBkb24ndCB0aGluayBkcml2ZXJz
L210ZC9uYW5kL2NvbW1vbi8gaXMgdGhlIHJpZ2h0IHBsYWNlIHRvIHB1dAp0aGlzIGNvbW1vbiBj
b2RlIFRCSCwgYW5kIEkgZG9uJ3QgcmVhbGx5IHNlZSB3aGF0J3MgdG8gYmUgc2hhcmVkIGJldHdl
ZW4KdGhlIE5BTkQgY29udHJvbGxlciBhbmQgU1BJIGNvbnRyb2xsZXIgZHJpdmVycy4gSWYgaXQn
cyBqdXN0IGhlbHBlcnMgdG8KYWNjZXNzIHRoZSByZWdpc3RlcnMsIHRob3NlIGNhbiBwcm9iYWJs
eSBsaXZlIGluCmRyaXZlcnMvc29jL3Fjb20vcWNvbV9xcGljMi5jLgoKPiByZWZlcnJpbmcgdG8g
aXQgZnJvbSBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmQuYyBhbmQKPiBkcml2ZXJzL3Nw
aS9zcGktcWNvbS5jIChvciBzdWNoKT8KPiAKPiBUaGFua3MsCj4gTWlxdcOobAo+IAo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdAo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
