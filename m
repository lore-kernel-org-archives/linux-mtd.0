Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30F3E7849A
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Oct 2023 10:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZWN0um53HDs7p+Gef/bNKqJgJ47oWsZL4H7C4s75Mno=; b=JBFXqUrhYilOR1
	kIqrJZm2xKPrnZ2uyw0GWuiVO8W+Ol2aORmOEMVHkRn5B5EH2OmvS1LNHSvFBnn6+ZwWTRxGyvFGe
	cvxMR5IB3oxdsMTrlrQu8JclGpM6fKSpUFZvhiRGiD1Q+KFeNWHugcFQp7EZPo51Bm8495/ENild/
	PY50GAaji6Br+0ZRyowj/Ufieprx5yTV8KD1gEPH3CGoGPpoMLJTA0lOFB3kVszTLRwS3t5oWNagg
	aubJsNrKxbnu4VTUe2R+bzGKg1JPLJDefS91kpLX7C2GXcQwxc9ZsWLAsTjtgE7x7dzws3hTMniQS
	zFS38OB6n46G+Eh+VcHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnFti-00CI7w-1J;
	Mon, 02 Oct 2023 10:11:30 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnFtf-00CI6u-0C
	for linux-mtd@lists.infradead.org;
	Mon, 02 Oct 2023 10:11:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 30CB0CE0F08;
	Mon,  2 Oct 2023 10:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595CFC433C8;
	Mon,  2 Oct 2023 10:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696241483;
	bh=6/GELyyqIkbot26vZx4tB+2IWue2NOsDgFUms0fr5iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oKIdOPt7lYVpPTPAJIl23+JG/EbWgzXMgmer3+6sJ/u2D1qmsWL6meBQLK57IKt/D
	 UrZWTNiMAFETg+FsfHHxAg/2rpamQ2LJ/df5i4ane3s1vCXbir9GPLcewgz8HhxB0O
	 s5o7Oi7hxqhONR8ls4LF+bBJMFS2+dtQebWOg8+5DDh/uaRk+Vx+D7QqwMHKI0s8xV
	 /w1PUNN1she/cnaqzRiRIxepZHy0EfNN6uJE1nJBEl23SbKkMmclyYg1b4+kBhbQMa
	 E+ujjAO8POp5/DTetRgpbpKO010y5mFjUu6HpGsDTL+D4wqYoZ748zKylN7p4fCA7f
	 s+J/fUjb6T5Lg==
Date: Mon, 2 Oct 2023 11:11:17 +0100
From: Lee Jones <lee@kernel.org>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Richard Weinberger <richard@nod.at>, Yu Hao <yhao016@ucr.edu>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: BUG: divide error in ubi_attach_mtd_dev
Message-ID: <20231002101117.GA175828@google.com>
References: <CA+UBctD_w=75wChmePZHp7KsBSNPWYGDBtzHPRPPtaFoqhGvXA@mail.gmail.com>
 <687864524.118195.1681799447034.JavaMail.zimbra@nod.at>
 <ff419c45-7d76-0219-a598-f6f4d081e29c@huawei.com>
 <CA+UBctBVHouL-3rM3zKYLpk01fXFvCpBnU7EpSRVdGW7cEjcJQ@mail.gmail.com>
 <977347543.226888.1682011999468.JavaMail.zimbra@nod.at>
 <CA+UBctA4fSbSdooQ9q9fwNuaHb_PnkfFuqJ7Q5vii-3-uCiUjw@mail.gmail.com>
 <412779912.228444.1682023015809.JavaMail.zimbra@nod.at>
 <ed510d18-47f1-7f46-03dd-84e043cab6d9@huawei.com>
 <1366603418.245114.1682236940160.JavaMail.zimbra@nod.at>
 <951e4cf7-a0ea-b3ec-931d-e6a394ddc2ab@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <951e4cf7-a0ea-b3ec-931d-e6a394ddc2ab@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_031127_287945_5B7B443B 
X-CRM114-Status: GOOD (  20.37  )
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

T24gU3VuLCAyMyBBcHIgMjAyMywgWmhpaGFvIENoZW5nIHdyb3RlOgoKPiDlnKggMjAyMy80LzIz
IDE2OjAyLCBSaWNoYXJkIFdlaW5iZXJnZXIg5YaZ6YGTOgo+ID4gLS0tLS0gVXJzcHLDvG5nbGlj
aGUgTWFpbCAtLS0tLQo+ID4gPiBWb246ICJjaGVuZ3poaWhhbzEiIDxjaGVuZ3poaWhhbzFAaHVh
d2VpLmNvbT4KPiA+ID4gPiA+IHJvb3RAc3l6a2FsbGVyOn4jIGNhdCAvcHJvYy9tdGQKPiA+ID4g
PiA+IGRldjogICAgc2l6ZSAgIGVyYXNlc2l6ZSAgbmFtZQo+ID4gPiA+ID4gbXRkMDogMDAwMjAw
MDAgMDAwMDEwMDAg4oCcbXRkcmFtIHRlc3QgZGV2aWNl4oCdCj4gPiA+ID4gCj4gPiA+ID4gSG1t
LCBtdGRyYW0gc2hvdWxkIGJlIGZpbmUsIGVyYXNlc2l6ZSBpcyBub3QgemVyby4KPiA+ID4gPiAK
PiA+ID4gCj4gPiA+IEkgZ3Vlc3MgdGhlIHplcm8tZXJhc2VzaXplIG10ZCBkZXZpY2UgaXMgZHlu
YW1pY2FsbHkgZ2VuZXJhdGVkIGluCj4gPiA+IHJ1bnRpbWUsIGFmdGVyIGxvb2tpbmcgdGhyb3Vn
aCB0aGUgY29kZSwgSSBmaW5kIGVyYXNlc2l6ZSBpcwo+ID4gPiBpbml0aWFsbGl6ZWQgaW4gc3Bl
Y2lmaWMgZmxhc2ggZHJpdmVyIGFuZCBpdCB3b24ndCBiZSB1cGRhdGVkIGxhdGVyKGVnLgo+ID4g
PiBpb2N0bFxzeXNjdGwpLiBBbmQgc29tZSBtdGQgZGV2aWNlcyBtYXkgaGF2ZSB6ZXJvIGVyYXNl
c2l6ZSwgZWcuCj4gPiA+IGRyaXZlcnMvbXRkL2RldmljZXMvbWNocDIzazI1Ni5jWzFdLiBVbmZv
cnR1bmF0ZWx5LCBJIGRvbid0IGtub3cgaG93IHRvCj4gPiA+IGxvYWQvc2ltdWxhdGUgdGhpcyBt
dGQsIG1heWJlIGl0IHJlcXVpcmVzIGEgcmVhbCBkZXZpY2U/IElmIHdlIGxvYWQgdGhpcwo+ID4g
PiBtdGQgZGV2aWNlIGFzIHViaSwgaXQgd2lsbCB0cmlnZ2VyIHRoZSBwcm9ibGVtPwo+ID4gCj4g
PiBJbmRlZWQuIEkgZ3Vlc3MgcWVtdSBjYW4gZW11bGF0ZSBzdWNoIGNoaXBzLgo+ID4gU28gYmV0
dGVyIGZpeCBVQkkgdG8gcmVqZWN0IGF0dGFjaGluZyBvZiBtdGQncyB3aXRoIGVyYXNlc2l6ZSBi
ZWluZyAwLgo+ID4gKFBsZWFzZSBub3RlLCB3ZSBjYW5ub3QgdGVzdCBmb3IgTVREX05PX0VSQVNF
LCB0aGlzIG9uZSBtZWFucyB0aGVyZSBpcyBubwo+ID4gZXJhc2UgbWV0aG9kKS4KPiAKPiBQaHJh
bSBpcyBhbiBleGNlcHRpb24sIGl0IGhhcyBlcmFzZSBmdW5jdGlvbiBidXQgaXMgc2V0IGZsYWcg
J01URF9DQVBfUkFNJy4KPiBNYXkgSSBpbnRlcnByZXQgJ01URF9OT19FUkFTRScgYXMgZXJhc2Ug
ZnVuY3Rpb24gaXMgbm90IG5lY2Vzc2FyeT8KCkZvciBiZXR0ZXIgb3Igd29yc2UsIHNvbWVvbmUg
aGFzIGFwcGxpZWQgdG8gaGF2ZSB0aGlzIHJlcG9ydCBhc3NvY2lhdGVkCndpdGggYSBDVkUgd2hp
Y2ggbWVhbnMgYSBidW5jaCBvZiBjb21wYW5pZXMgYW5kIGluZGl2aWR1YWxzIGFyZSBnb2luZyB0
bwpiZSB0cmFja2luZyBpdC4KCldoYXQgaXMgdGhlIGN1cnJlbnQgc3RhdHVzIHBsZWFzZT8KCklz
IHRoaXMgZGVlbWVkIHRvIGJlIGEgcmVhbCBpc3N1ZT8KCkRpZCB0aGUgcmVwb3J0IGN1bG1pbmF0
ZSBpbiBhIHBvc3RlZCBwYXRjaD8KCkFueSBoZWxwIHdvdWxkIGJlIGdyYXRlZnVsbHkgcmVjZWl2
ZWQuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
