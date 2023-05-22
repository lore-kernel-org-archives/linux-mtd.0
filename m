Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99836C77B73
	for <linux-mtd@archiver.kernel.org>; Mon, 22 May 2023 08:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j66hzj2+jj7t5H2PgQ1TiTpi/mv6QunB5Z4pgWNlDh4=; b=UW1S6VNDM6xm76
	rsn858fgftZxeFWbn8hUYzt2uFCeCbkVsLHbrGgU9GBxBuJUxKGd8vObm7szTSWF+Mntw6TNHuhK2
	MXbzzZcAYhaGWRz44ibyDJlmeDq9HHElDK9FmSl6iSDEthtjOe/COQg4snKijLGUVpF1jy+0AWAd+
	K/9TKqnoFKzMHVmdgRIQbJ7yTNZg+5wns1vk0mPe7LN/5kKH/hFXtjENDDPavCNgjCKo828Pg1zGj
	vq3FkvBw+L3CbFzgqgN8gITlbSaFHTwEqvvvREWng4L0v09BlLylN7NGIRoFkWEFpaG9lr04puURv
	hnEwd7jmyWIFXV0eP9Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q11JJ-005o8Z-08;
	Mon, 22 May 2023 08:54:33 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q11JF-005o7e-1I
	for linux-mtd@lists.infradead.org;
	Mon, 22 May 2023 08:54:31 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 876461BF208;
	Mon, 22 May 2023 08:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684745665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uHK3C0C9AUOwNQWyX63XZc6cyaepXro+wC3B3TZT6F4=;
	b=L00HJpwUIjO81e/BD8sM711lE8ChvdDMcLZWW92fiqHumqUXk8mVf49Ou+6E0w4b7IJB1V
	pUrNt5OoWXakElRQBB7M2M6QP2r1DOf+lo16Mzmb7PmKIxSod1ndf9UEyhFuBvSpFy3pCr
	MJWRus7S1D0y+77b1ELNfT3XUOZaIjjpsAcRC2nyWNFdcNPGurn7i0TxgYS3UDRkvVToFL
	mACvZuhBq65WyOMHr8XVkpoFmkkGIYAap6KcEPhmjTxR6Js5Vr0qiSHRrrgVYbj72siPym
	JRPJ5njwX75w+cjm5yCKajNbAV0SotCoBQNHVnkuO8BGbEt+HqpuCgmPPlkaLA==
Date: Mon, 22 May 2023 10:54:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: Marvell NFC timings on CN9130
Message-ID: <20230522105424.6e86b135@xps-13>
In-Reply-To: <82b16918-8930-80ab-a87f-a5eefbff2a70@alliedtelesis.co.nz>
References: <17a9eee2-d84f-549d-a5ff-da88d43393c1@alliedtelesis.co.nz>
	<20230516192538.45b35b6b@xps-13>
	<40c38662-221f-b9bb-9699-625dd788defd@alliedtelesis.co.nz>
	<82b16918-8930-80ab-a87f-a5eefbff2a70@alliedtelesis.co.nz>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_015429_744409_F979C0B4 
X-CRM114-Status: GOOD (  31.58  )
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

SGkgQ2hyaXMsCgpDaHJpcy5QYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubnogd3JvdGUgb24gU3Vu
LCAyMSBNYXkgMjAyMyAyMjo1MzozNQorMDAwMDoKCj4gT24gMTcvMDUvMjMgMTQ6MjIsIENocmlz
IFBhY2toYW0gd3JvdGU6Cj4gPgo+ID4gT24gMTcvMDUvMjMgMDU6MjUsIE1pcXVlbCBSYXluYWwg
d3JvdGU6ICAKPiA+PiBIaSBDaHJpcyEKPiA+Pgo+ID4+IENocmlzLlBhY2toYW1AYWxsaWVkdGVs
ZXNpcy5jby5ueiB3cm90ZSBvbiBUdWUsIDE2IE1heSAyMDIzIDA0OjQ2OjM4Cj4gPj4gKzAwMDA6
Cj4gPj4gIAo+ID4+PiBIaSBNaXF1ZWwsIFRob21hcywKPiA+Pj4KPiA+Pj4gQSBoYXJkd2FyZSBj
b2xsZWFndWUgcmVwb3J0ZWQgYSBjb25jZXJuIHRvIG1lIGFib3V0IGEgbmV3IGRlc2lnbiB3ZSAK
PiA+Pj4gaGF2ZQo+ID4+PiB1c2luZyB0aGUgTWFydmVsbCBDTjkxMzAgU29DICh3aGljaCBJIHRo
aW5rIHdhcyBjYWxsZWQgQXJtYWRhLThLIGJlZm9yZQo+ID4+PiB0aGV5IHJlYnJhbmRlZCkuCj4g
Pj4+Cj4gPj4+IEJhc2ljYWxseSB0aGVpciBjb25jZXJuIGlzIHRoYXQgdGhlIHRXQyB0aW1pbmcg
dGhleSBvYnNlcnZlIGlzIGZhc3Rlcgo+ID4+PiAofjE4bnMpIHRoYW4gdGhlIGRvY3VtZW50ZWQg
bWluaW11bSBpbiB0aGUgaGFyZHdhcmUgZGF0YXNoZWV0IGZvciB0aGUKPiA+Pj4gQ045MTMwICgy
NW5zKS4gQXNpZGUgZnJvbSBub3QgbWVldGluZyB0aGUgZGF0YXNoZWV0IHNwZWMgd2UndmUgbm90
Cj4gPj4+IG9ic2VydmVkIGFueSBvdGhlciBpc3N1ZSAoeWV0KS4gIAo+ID4+IEkgd291bGQgaGF2
ZSBleHBlY3RlZCB0aGUgY29udHJvbGxlciB0byBzdXBwb3J0IGFsbW9zdCBhbnkga2luZCBvZgo+
ID4+IHRpbWluZ3MsIGluY2x1ZGluZyBTRFIgRURPIG1vZGUgNS4gdFdDIGlzIDI1bnMgd2l0aCBt
b2RlIDQsIGJ1dCAyMCBvbgo+ID4+IG1vZGUgNSAoT05GSSkuIFNvIEkgYmVsaWV2ZSB5b3UncmUg
cnVubmluZyBhIHN5c3RlbSB3aXRoIGEgY2hpcCB0aGF0IGlzCj4gPj4gbm90IGNvbXBhdGlibGUg
d2l0aCB0aGUgZmFzdGVzdCBtb2RlLiBJZiB0aGF0IGlzIHRoZSBjYXNlLCBpdCBtYXkKPiA+PiBl
eHBsYWluIHdoeSB5b3UgZG9uJ3Qgc2VlIGVycm9ycyB3aXRoIHRoaXMgY2hpcDogaXQgbWF5IHN1
cHBvcnQKPiA+PiBzbGlnaHRseSBmYXN0ZXIgdGltaW5ncyB0aGFuIGl0IGFkdmVydGlzZXMuCj4g
Pj4KPiA+PiBBbnl3YXksIGlmIHlvdXIgZmluZGluZ3MgYXJlIHRydWUsIGl0IG1lYW5zIHRoZSBj
dXJyZW50IGltcGxlbWVudGF0aW9uCj4gPj4gaXMgc2xpZ2h0bHkgb3V0IG9mIHNwZWMgYW5kIHRo
ZSB0aW1pbmcgY2FsY3VsYXRpb24gbWlnaHQgcmVxdWlyZSB0byBiZQo+ID4+IHR3ZWFrZWQgYSBs
aXR0bGUgYml0IHRvIHJlZHVjZSB0V0MuCj4gPj4gIAo+ID4+PiBJIG5vdGljZSBpbiB0aGUgbWFy
dmVsbF9uYW5kLmMgZHJpdmVyIHRoYXQgbWFydmVsbF9uZmNfaW5pdCgpIHNldHMgdGhlCj4gPj4+
IE5BTkQgQ2xvY2sgRnJlcXVlbmN5IFNlbGVjdCBiaXQgKDB4RjI0NDA3MDA6MCkgdG8gMSB3aGlj
aCBydW5zIAo+ID4+PiBhY2NvcmRpbmcKPiA+Pj4gdG8gdGhlIGRhdGFzaGVldCB0aGUgTkFORCBm
bGFzaCBhdCA0MDBNSHogLiBCdXQgdGhlIGNhbGN1bGF0aW9ucyBpbgo+ID4+PiBtYXJ2ZWxsX25m
Y19zZXR1cF9pbnRlcmZhY2UoKSB1c2UgdGhlIHZhbHVlIGZyb20KPiA+Pj4gY2xrX2dldF9yYXRl
KG5mYy0+Y29yZV9jbGspIHdoaWNoIGlzIHN0aWxsIDI1ME1IeiBzbyBJJ20gd29uZGVyaW5nIGlm
Cj4gPj4+IG1heWJlIHRoZSBmYWN0IHRoYXQgdGhlIE5BTkQgZmxhc2ggaXMgYmVpbmcgcnVuIGZh
c3RlciBpcyBoYXZpbmcgYW4KPiA+Pj4gaW1wYWN0IG9uIHRpbWluZ3MgdGhhdCBhcmUgY2FsY3Vs
YXRlZCBhcm91bmQgdGhlIGNvcmVfY2xrIGZyZXF1ZW5jeS4gIAo+ID4+IFdoYXQgaWYgeW91IHJl
c2V0IHRoaXMgYml0PyBEbyB5b3Ugb2JzZXJ2ZSBkaWZmZXJlbnQgdGltaW5ncz8gSSBob3BlCj4g
Pj4geW91IGRvLCBvdGhlcndpc2UgdGhpcyBpcyBhIGRlYWQtZW5kLiAgCj4gPiBZZXMgaWYgd2Ug
Y2xlYXIgdGhlIGJpdCB0aGUgdGltaW5ncyBnbyBmcm9tIH4xOG5zIHRvIGFib3V0IDMwbnMuICAK
PiA+PiBUaGUgdGltaW5ncyBhcmUgZGVyaXZlZCBmcm9tIHRoaXMgY2xvY2sgYnV0IEkgcmVtZW1i
ZXIgc2VlaW5nIGRpZmZlcmVudAo+ID4+IHJhdGVzIHRoYW4gdGhlIG9uZXMgSSBleHBlY3RlZCB3
aXRoIG5vIG9idmlvdXMgZXhwbGFuYXRpb24gKHNlZSB0aGUgIioKPiA+PiAyIiBpbiB0aGUgY2Fs
Y3VsYXRpb24gb2YgcGVyaW9kX25zIGFuZCB0aGUgY29tbWVudCByaWdodCBiZWxvdykuIFNvCj4g
Pj4gbWF5YmUgdGhpcyBpcyBkdWUgdG8gdGhlIDQwME1IeiB2cy4gMjUwTUh6IGlzc3VlIHlvdSBh
cmUgcmVwb3J0aW5nLCBvcgo+ID4+IHRoZXJlIGlzIGFuIHVuZG9jdW1lbnRlZCBwcmUtc2NhbGVy
IGluLWJldHdlZW4gKHRoaXMgaXMgbXkgb3JpZ2luYWwKPiA+PiBndWVzcykuICAKPiA+Cj4gPiBJ
IHdvbmRlcmVkIGlmIHRoZSAqIDIgd2FzIGJlY2F1c2Ugb2YgdGhpcyBvciBiZWNhdXNlIG9mIHRo
ZSBjb21tZW50IAo+ID4gdGhhdCB0aGUgRUNDX0NMSyBpcyAyKk5GX0NMSy4gVGhhdCBwcm9iYWJs
eSBhbHNvIG1lYW5zIHRoYXQgYSBudW1iZXIgCj4gPiBvZiBTb0NzIGFyZSBydW5uaW5nIHdpdGgg
YW4gZXh0cmEgKjIgdGhhdCBkb24ndCBuZWVkIHRvIGJlIChlLmcuIAo+ID4gQXJtYWRhLTM4NSku
ICAKPiBJbnRlcmVzdGluZ2x5IGNwMTEwLXN5c3RlbS1jb250cm9sbGVyLmMgaXMgYXdhcmUgb2Yg
dGhlIDQwME1IeiBvcHRpb24gCj4gYnV0IHRoYXQncyBvbmx5IGVmZmVjdGl2ZSBpZiBpdCdzIGJl
ZW4gc2V0IHByaW9yIHRvIHRoZSBrZXJuZWwgYm9vdGluZy4gCj4gSSdtIG5vdCByZWFsbHkgZmFt
aWxpYXIgd2l0aCBjbGsgZHJpdmVycyBidXQgSSBhc3N1bWUgaXQgbXVzdCBiZSAKPiBwb3NzaWJs
ZSB0byBtYWtlIGl0IGxvb2sgdXAgdGhlIGZyZXF1ZW5jeSBkeW5hbWljYWxseSBpbnN0ZWFkIG9m
IHVzaW5nIGEgCj4gc2luZ2xlIGZpeGVkIHZhbHVlLgoKV2UgYXJlIGFjY2Vzc2luZyB0aGUgYml0
IGRpcmVjdGx5IGluIHRoZSBOQU5EIGNvbnRyb2xsZXIgZHJpdmVyLApwZXJoYXBzIHRoZXJlIHNo
b3VsZCBiZSBzb21lIG9wcyBleHBvc2VkIGFuZCB1c2VkIGluIG9yZGVyIHRvIHBpY2sgb25lCm9y
IHRoZSBvdGhlciBvZiB0aGUgdHdvIGNsb2NrIHNvdXJjZXMuCgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
