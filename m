Return-Path: <SRS0=7oHA=YE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B72ECE58C
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2019 14:04:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 254AE20640
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2019 14:04:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uxtJWGiH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 254AE20640
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kaod.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:MIME-Version:
	Date:From:References:To:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BK2FSe7njbeah6fB936+uBC/gVmkX/UtKOB6hhzXxro=; b=uxtJWGiHp5SyBT
	da6P2NORge0lD1qEeNxaIVUYum36RpNEdHrQXGKVqDvxHr7LL20fcqEF9GYcQEK6UEQptOTz5aDET
	zNauvP4rq0pmbISbTJRNRuUemsGjWRcHi4AURw3kg84uN1uN5e/Ow4u4u4bR2ljjiR1wlRXkW+Civ
	u74U/z0ySBHMyshrPqh65CZHBf8v42Y5vLoNLHAFoC0Wh7SCnO1T6Ymd13K9jHK6njWAg5tWE1818
	hG5snerEMOEhHg4oGS0Doe2JYBcIZsopaja0VoFCLyEm21P3vEJEhQtQywOhKkzbUJ/aRlMZ/h5ZR
	6EXziwhhZ4UvS2l7LLIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iIvWS-00017K-1N; Fri, 11 Oct 2019 14:04:00 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iIvWP-00016i-Cx
 for linux-mtd@lists.infradead.org; Fri, 11 Oct 2019 14:03:59 +0000
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9BE2t0w125095
 for <linux-mtd@lists.infradead.org>; Fri, 11 Oct 2019 10:03:57 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vjtj7srw1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Fri, 11 Oct 2019 10:03:56 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <clg@kaod.org>;
 Fri, 11 Oct 2019 15:03:52 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 11 Oct 2019 15:03:48 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9BE3l7c47710380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Oct 2019 14:03:47 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DB794204B;
 Fri, 11 Oct 2019 14:03:47 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B22642042;
 Fri, 11 Oct 2019 14:03:47 +0000 (GMT)
Received: from smtp.tls.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 11 Oct 2019 14:03:47 +0000 (GMT)
Received: from yukon.kaod.org (sig-9-145-63-191.uk.ibm.com [9.145.63.191])
 by smtp.tls.ibm.com (Postfix) with ESMTP id 08DF52201CE;
 Fri, 11 Oct 2019 16:03:45 +0200 (CEST)
Subject: Re: [PATCH 04/16] mtd: spi-nor: aspeed: Add read training
To: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20191004115919.20788-1-clg@kaod.org>
 <20191004115919.20788-5-clg@kaod.org>
 <20191011142805.6cc3905c@dhcp-172-31-174-146.wireless.concordia.ca>
 <a933999d-cb3d-ef3c-8a0d-a1f022817543@ti.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Date: Fri, 11 Oct 2019 16:03:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <a933999d-cb3d-ef3c-8a0d-a1f022817543@ti.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19101114-0008-0000-0000-00000321325F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101114-0009-0000-0000-00004A403F54
Message-Id: <b52ea3a3-11c3-212b-7e02-44c76427bb46@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-11_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=898 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910110132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191011_070357_656456_5E045565 
X-CRM114-Status: GOOD (  33.47  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-aspeed@lists.ozlabs.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Andrew Jeffery <andrew@aj.id.au>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Joel Stanley <joel@jms.id.au>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTEvMTAvMjAxOSAxNToxMywgVmlnbmVzaCBSYWdoYXZlbmRyYSB3cm90ZToKPiBIaSBDZWRy
aWMsCj4gCj4gT24gMTEvMTAvMTkgNTo1OCBQTSwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+PiBP
biBGcmksICA0IE9jdCAyMDE5IDEzOjU5OjA3ICswMjAwCj4+IEPDqWRyaWMgTGUgR29hdGVyIDxj
bGdAa2FvZC5vcmc+IHdyb3RlOgo+Pgo+Pj4gKyNkZWZpbmUgQVNQRUVEX1NNQ19IQ0xLX0RJVihp
KSBcCj4+PiArCShhc3BlZWRfc21jX2hjbGtfZGl2c1soaSkgLSAxXSA8PCBDT05UUk9MX0NMT0NL
X0ZSRVFfU0VMX1NISUZUKQo+Pj4gKwo+Pj4gK3N0YXRpYyB1MzIgYXNwZWVkX3NtY19kZWZhdWx0
X3JlYWQoc3RydWN0IGFzcGVlZF9zbWNfY2hpcCAqY2hpcCkKPj4+ICt7Cj4+PiArCS8qCj4+PiAr
CSAqIEtlZXAgdGhlIDRCeXRlIGFkZHJlc3MgbW9kZSBvbiB0aGUgQVNUMjQwMCBTUEkgY29udHJv
bGxlci4KPj4+ICsJICogT3RoZXIgY29udHJvbGxlcnMgc2V0IHRoZSA0Qnl0ZSBtb2RlIGluIHRo
ZSBDRSBDb250cm9sCj4+PiArCSAqIFJlZ2lzdGVyCj4+PiArCSAqLwo+Pj4gKwl1MzIgY3RsX21h
c2sgPSBjaGlwLT5jb250cm9sbGVyLT5pbmZvID09ICZzcGlfMjQwMF9pbmZvID8KPj4+ICsJCSBD
T05UUk9MX0lPX0FERFJFU1NfNEIgOiAwOwo+Pj4gKwo+Pj4gKwlyZXR1cm4gKGNoaXAtPmN0bF92
YWxbc21jX3JlYWRdICYgY3RsX21hc2spIHwKPj4+ICsJCSgweDAwIDw8IDI4KSB8IC8qIFNpbmds
ZSBiaXQgKi8KPj4+ICsJCSgweDAwIDw8IDI0KSB8IC8qIENFIyBtYXggKi8KPj4+ICsJCSgweDAz
IDw8IDE2KSB8IC8qIHVzZSBub3JtYWwgcmVhZHMgKi8KPj4+ICsJCSgweDAwIDw8ICA4KSB8IC8q
IEhDTEsvMTYgKi8KPj4+ICsJCSgweDAwIDw8ICA2KSB8IC8qIG5vIGR1bW15IGN5Y2xlICovCj4+
PiArCQkoMHgwMCk7ICAgICAgICAvKiBub3JtYWwgbW9kZSAqLwo+Pgo+PiBJSVVDLCB5b3UncmUg
dXNpbmcgYSBTUElOT1JfT1BfUkVBRCBvcGVyYXRpb24gdG8gcmVhZCB0aGUgZ29sZGVuCj4+IGJ1
ZmZlciwgYW5kIGlmIEknbSByaWdodCwgeW91IHN0YXJ0IHJlYWRpbmcgYXQgb2Zmc2V0IDAgb2Yg
dGhlIGRpcm1hcAo+PiB3aW5kb3cgKG9mZnNldCAwIGluIHRoZSBmbGFzaCksIHNvIGJhc2ljYWxs
eSB0aGUgZmlyc3QgYmxvY2sgaW4gdGhlIE5PUi4KPj4gV2hhdCBoYXBwZW5zIGlmIHRoaXMgYmxv
Y2sgaXMgZXJhc2VkPyBJbiB0aGF0IGNhc2UgeW91ciBnb2xkZW4gYnVmIHdpbGwKPj4gY29udGFp
biBvbmx5IDB4ZmYgdmFsdWVzLCBhbmQgdGhlIHJlYWQgY2FsaWJyYXRpb24gaXMgbGlrZWx5IHRv
IGJlCj4+IHVzZWxlc3MgKGhvdyBjYW4geW91IGRldGVybWluZSBpZiB0aW1pbmdzIGFyZSBnb29k
IHdoZW4gSU8gcGlucyBhbHdheXMKPj4gc3RheSBoaWdoKS4gRG9uJ3Qgd2UgaGF2ZSBhIGNvbW1h
bmQgdGhhdCByZXR1cm4gbm9uLWZmL25vbi0wIGRhdGEgd2hpbGUKPj4gc3RpbGwgYmVpbmcgcHJl
ZGljdGFibGUgYW5kIGltbXV0YWJsZT8gRG8geW91IGV4cGVjdCB1c2VycyB0byBhbHdheXMKPj4g
Zmxhc2ggYSBwYXR0ZXJuIHRoYXQgaGVscHMgY2FsaWJyYXRpbmcgdGhvc2UgZGVsYXlzPwo+Pgo+
IAo+IFllcywgdGhpcyBpcyBwcmVjaXNlbHkgbXkgY29uY2VybiBhcyB3ZWxsLiBJIGhhdmUgYmVl
biBkZXZlbG9waW5nCj4gdHJhaW5pbmcgc2VxdWVuY2UgZm9yIGNhZGVuY2UtcXVhZHNwaSBjb250
cm9sbGVyIChyZXF1aXJlbWVudHMgYXJlCj4gc2ltaWxhciB0byB3aGF0IHlvdSBoYXZlIGhlcmUp
IGFuZCBmb3VuZCB0aGF0IGl0cyBiZXR0ZXIgdG8gdXNlIHJlYWQKPiBvbmx5IGRhdGEgc3VjaCBh
cyBTRkRQIHRhYmxlIGRhdGEgdG8gY2FsaWJyYXRlLiBDYWRlbmNlLXF1YWRzcGkgcmVxdWlyZXMK
PiB0cmFpbmluZyBvbmx5IGluIGhpZ2hlciBwZXJmb3JtYW5jZSBtb2RlcyBsaWtlIFF1YWQvT2N0
YWwgRFRSIG1vZGUgYW5kCj4gbmVlZHMgMTYgYnl0ZXMgb2Yga25vd24gZGF0YSBmb3IgY2FsaWJy
YXRpb24uIEhlbmNlIFNGRFAgd29ya3Mgd2VsbCBmb3IKPiBteSBjYXNlLgoKT0suIEdvb2QgdG8g
a25vdy4KCj4gQnV0IHRoZSBwcm9ibGVtIGhlcmUgaXMgdGhhdCwgYXNwZWVkIGNvbnRyb2xsZXIg
bmVlZHMgMTZLIG9mIGtub3duIGRhdGEuCgpJdCdzIGEgY2hvaWNlIHdlIG1hZGUgb24gdGhlIGZp
cnN0IFA4IHN5c3RlbXMgd2UgaGFkLgoKPiBTRkRQIHRhYmxlIGlzIG5vdCB0aGF0IGJpZyBhbmQg
cmVhZCBiZXlvbmQgYWRkcmVzcyBzcGFjZSBpcyBub3QgcmVxdWlyZWQKPiB0byB3cmFwIGFyb3Vu
ZC4KPiBXb25kZXJpbmcgaWYgeW91IHJlYWxseSBuZWVkIHRvIHJlYWQgMTZLIGFtb3VudCBvZiBk
YXRhIGZvciBjYWxpYnJhdGlvbj8KCk1heSBiZSBub3QuIEkgYWdyZWUgdGhpcyBpcyB0YWtpbmcg
YSBiaXQgb2YgdGltZSBhcyB3ZSByZWFkIDEwIHRpbWVzCmFuZCBjb21wYXJlczogM3Mgb24gYm9v
dCB0aW1lIG9uIGFuIGFzdDI0MDAgSSB0aGluay4gSm9lbCBjb3VsZCB0ZWxsCmJldHRlci4gV2Ug
Y291bGQgcmVkdWNlIHRoZSBhbW91bnQgb2YgZGF0YSByZWFkIGFuZCB0aGUgbnVtYmVyIG9mIAps
b29wcyBzdXJlbHkuICAKCkFzIGZvciB0aGUgdmFsaWRpdHkgb2YgdGhlIGRhdGEsIHdlIGNoZWNr
IHdpdGggdGhlIGdvbGRlbiBidWZmZXIgd2l0aAphc3BlZWRfc21jX2NoZWNrX2NhbGliX2RhdGEo
KS4KCklmIGl0J3MgdG9vIHVuaWZvcm0sIGxpa2Ugb24gYSBmbGFzaCBuZXZlciB3cml0dGVuIHRv
bywgd2Ugd2lsbCBuZWVkCmEgZmlyc3Qgd3JpdGUgYW5kIGEgcmVib290IHRvIGhhdmUgZmFzdGVy
IHJlYWQgc3BlZWQuCgpUaGFua3MsCgpDLiAKCj4gCj4gUmVnYXJkcwo+IFZpZ25lc2gKPiAKPj4+
ICt9Cj4+PiArCj4+PiArc3RhdGljIGludCBhc3BlZWRfc21jX29wdGltaXplX3JlYWQoc3RydWN0
IGFzcGVlZF9zbWNfY2hpcCAqY2hpcCwKPj4+ICsJCQkJICAgIHUzMiBtYXhfZnJlcSkKPj4+ICt7
Cj4+PiArCXU4ICpnb2xkZW5fYnVmLCAqdGVzdF9idWY7Cj4+PiArCWludCBpLCByYywgYmVzdF9k
aXYgPSAtMTsKPj4+ICsJdTMyIHNhdmVfcmVhZF92YWwgPSBjaGlwLT5jdGxfdmFsW3NtY19yZWFk
XTsKPj4+ICsJdTMyIGFoYl9mcmVxID0gY2hpcC0+Y29udHJvbGxlci0+Y2xrX2ZyZXF1ZW5jeTsK
Pj4+ICsKPj4+ICsJZGV2X2RiZyhjaGlwLT5ub3IuZGV2LCAiQUhCIGZyZXF1ZW5jeTogJWQgTUh6
IiwgYWhiX2ZyZXEgLyAxMDAwMDAwKTsKPj4+ICsKPj4+ICsJdGVzdF9idWYgPSBrbWFsbG9jKENB
TElCUkFURV9CVUZfU0laRSAqIDIsIEdGUF9LRVJORUwpOwo+Pj4gKwlnb2xkZW5fYnVmID0gdGVz
dF9idWYgKyBDQUxJQlJBVEVfQlVGX1NJWkU7Cj4+PiArCj4+PiArCS8qIFdlIHN0YXJ0IHdpdGgg
dGhlIGR1bWJlc3Qgc2V0dGluZyAoa2VlcCA0Qnl0ZSBiaXQpIGFuZCByZWFkCj4+PiArCSAqIHNv
bWUgZGF0YQo+Pj4gKwkgKi8KPj4+ICsJY2hpcC0+Y3RsX3ZhbFtzbWNfcmVhZF0gPSBhc3BlZWRf
c21jX2RlZmF1bHRfcmVhZChjaGlwKTsKPj4+ICsKPj4+ICsJd3JpdGVsKGNoaXAtPmN0bF92YWxb
c21jX3JlYWRdLCBjaGlwLT5jdGwpOwo+Pj4gKwo+Pj4gKwltZW1jcHlfZnJvbWlvKGdvbGRlbl9i
dWYsIGNoaXAtPmFoYl9iYXNlLCBDQUxJQlJBVEVfQlVGX1NJWkUpOwo+Pj4gKwo+Pj4gKwkvKiBF
c3RhYmxpc2ggb3VyIHJlYWQgbW9kZSB3aXRoIGZyZXEgZmllbGQgc2V0IHRvIDAgKEhDTEsvMTYp
ICovCj4+PiArCWNoaXAtPmN0bF92YWxbc21jX3JlYWRdID0gc2F2ZV9yZWFkX3ZhbCAmIDB4ZmZm
ZmYwZmY7Cj4+PiArCj4+PiArCS8qIENoZWNrIGlmIGNhbGlicmF0aW9uIGRhdGEgaXMgc3VpdGFi
bGUgKi8KPj4+ICsJaWYgKCFhc3BlZWRfc21jX2NoZWNrX2NhbGliX2RhdGEoZ29sZGVuX2J1Ziwg
Q0FMSUJSQVRFX0JVRl9TSVpFKSkgewo+Pj4gKwkJZGV2X2luZm8oY2hpcC0+bm9yLmRldiwKPj4+
ICsJCQkgIkNhbGlicmF0aW9uIGFyZWEgdG9vIHVuaWZvcm0sIHVzaW5nIGxvdyBzcGVlZCIpOwo+
Pj4gKwkJd3JpdGVsKGNoaXAtPmN0bF92YWxbc21jX3JlYWRdLCBjaGlwLT5jdGwpOwo+Pj4gKwkJ
a2ZyZWUodGVzdF9idWYpOwo+Pj4gKwkJcmV0dXJuIDA7Cj4+PiArCX0KPj4+ICsKPj4+ICsJLyog
Tm93IHdlIGl0ZXJhdGUgdGhlIEhDTEsgZGl2aWRlcnMgdW50aWwgd2UgZmluZCBvdXIgYnJlYWtp
bmcgcG9pbnQgKi8KPj4+ICsJZm9yIChpID0gQVJSQVlfU0laRShhc3BlZWRfc21jX2hjbGtfZGl2
cyk7IGkgPiAwOyBpLS0pIHsKPj4+ICsJCXUzMiB0diwgZnJlcTsKPj4+ICsKPj4+ICsJCS8qIENv
bXBhcmUgdGltaW5nIHRvIG1heCAqLwo+Pj4gKwkJZnJlcSA9IGFoYl9mcmVxIC8gaTsKPj4+ICsJ
CWlmIChmcmVxID4gbWF4X2ZyZXEpCj4+PiArCQkJY29udGludWU7Cj4+PiArCj4+PiArCQkvKiBT
ZXQgdGhlIHRpbWluZyAqLwo+Pj4gKwkJdHYgPSBjaGlwLT5jdGxfdmFsW3NtY19yZWFkXSB8IEFT
UEVFRF9TTUNfSENMS19ESVYoaSk7Cj4+PiArCQl3cml0ZWwodHYsIGNoaXAtPmN0bCk7Cj4+PiAr
CQlkZXZfZGJnKGNoaXAtPm5vci5kZXYsICJUcnlpbmcgSENMSy8lZC4uLiIsIGkpOwo+Pj4gKwkJ
cmMgPSBhc3BlZWRfc21jX2NhbGlicmF0ZV9yZWFkcyhjaGlwLCBpLCBnb2xkZW5fYnVmLCB0ZXN0
X2J1Zik7Cj4+PiArCQlpZiAocmMgPT0gMCkKPj4+ICsJCQliZXN0X2RpdiA9IGk7Cj4+PiArCX0K
Pj4+ICsJa2ZyZWUodGVzdF9idWYpOwo+Pj4gKwo+Pj4gKwkvKiBOb3RoaW5nIGZvdW5kID8gKi8K
Pj4+ICsJaWYgKGJlc3RfZGl2IDwgMCkgewo+Pj4gKwkJZGV2X3dhcm4oY2hpcC0+bm9yLmRldiwg
Ik5vIGdvb2QgZnJlcXVlbmN5LCB1c2luZyBkdW1iIHNsb3ciKTsKPj4+ICsJfSBlbHNlIHsKPj4+
ICsJCWRldl9kYmcoY2hpcC0+bm9yLmRldiwgIkZvdW5kIGdvb2QgcmVhZCB0aW1pbmdzIGF0IEhD
TEsvJWQiLAo+Pj4gKwkJCWJlc3RfZGl2KTsKPj4+ICsJCWNoaXAtPmN0bF92YWxbc21jX3JlYWRd
IHw9IEFTUEVFRF9TTUNfSENMS19ESVYoYmVzdF9kaXYpOwo+Pj4gKwl9Cj4+PiArCj4+PiArCXdy
aXRlbChjaGlwLT5jdGxfdmFsW3NtY19yZWFkXSwgY2hpcC0+Y3RsKTsKPj4+ICsJcmV0dXJuIDA7
Cj4+PiArfQo+Pgo+Pgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
