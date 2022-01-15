Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9877DC433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Jan 2022 10:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tbsvt/P6gKhMzHNYaMZApChhToh9K52sLVVb/I/tlNQ=; b=mqXDDbDNqPqWbmM7A5tDZ2AyPX
	Jhft3pgv5pxVQ449ARyGoml20rxLB+dBAkk5lWFrW+1lNXZMZ8T6eb4Z41oLqh6KDFBvfTBuL14ki
	+C9oBr0fqXQhFjZ339zSMHMzaEW06oZQrYMLbffRkVGKojV64TmTxR9w4NYOPsaddLKJTfNnQDiIy
	7KnoQC9CJTa7ksDn5Ev2EvFMzTkRvpMiFgYnKyWvQKM+vsUBXnB+z0Bk40PLE4TxdEj95MQ7yXEP2
	kGlu+s2VRTjWdVqAPcLWUruONtn9ep6IyCkZvFXjJ7E8gJ/PieGemTBkvyiQN4s3Hvq1c/BZEY6hS
	B/LuxcMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8fsr-00AsTK-J8; Sat, 15 Jan 2022 10:02:05 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8fsn-00AsSD-GB
 for linux-mtd@lists.infradead.org; Sat, 15 Jan 2022 10:02:03 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B9B6D614E2CD;
 Sat, 15 Jan 2022 11:01:53 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id P38YeyIdWJ2O; Sat, 15 Jan 2022 11:01:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8C229614E2D5;
 Sat, 15 Jan 2022 11:01:52 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id JOwiyE1gdgNZ; Sat, 15 Jan 2022 11:01:52 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 62EB3614E2CD;
 Sat, 15 Jan 2022 11:01:52 +0100 (CET)
Date: Sat, 15 Jan 2022 11:01:52 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 mcoquelin stm32 <mcoquelin.stm32@gmail.com>, 
 kirill shutemov <kirill.shutemov@linux.intel.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <626252388.262848.1642240912242.JavaMail.zimbra@nod.at>
In-Reply-To: <face6dce-d860-a7e6-fe9c-39f59cef22c5@huawei.com>
References: <20211227032246.2886878-1-chengzhihao1@huawei.com>
 <11976804.249069.1641902225370.JavaMail.zimbra@nod.at>
 <0a7a5cce-1ee1-70b6-d368-615dfa0a617a@huawei.com>
 <1492514284.249466.1641909382867.JavaMail.zimbra@nod.at>
 <6815e4af-9b5b-313f-5828-644722dd4d1f@huawei.com>
 <23886736.260777.1642185939371.JavaMail.zimbra@nod.at>
 <88df000c-97a6-ff3f-a1e2-10fa4da8c604@huawei.com>
 <face6dce-d860-a7e6-fe9c-39f59cef22c5@huawei.com>
Subject: Re: [PATCH v6 12/15] ubi: fastmap: Add all fastmap pebs into
 'ai->fastmap' when fm->used_blocks>=2
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF96 (Linux)/8.8.12_GA_3809)
Thread-Topic: fastmap: Add all fastmap pebs into 'ai->fastmap' when
 fm->used_blocks>=2
Thread-Index: UBVQ5o9CerPStr2kIoVVEmrYehXG8Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_020201_870849_0FCD11B0 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0Pgo+
IENDOiAiTWlxdWVsIFJheW5hbCIgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+LCAiVmlnbmVz
aCBSYWdoYXZlbmRyYSIgPHZpZ25lc2hyQHRpLmNvbT4sICJtY29xdWVsaW4gc3RtMzIiCj4gPG1j
b3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+LCAia2lyaWxsIHNodXRlbW92IiA8a2lyaWxsLnNodXRl
bW92QGxpbnV4LmludGVsLmNvbT4sICJTYXNjaGEgSGF1ZXIiCj4gPHMuaGF1ZXJAcGVuZ3V0cm9u
aXguZGU+LCAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAibGlu
dXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4KPiBHZXNlbmRldDogU2Ft
c3RhZywgMTUuIEphbnVhciAyMDIyIDA5OjQ2OjA3Cj4gQmV0cmVmZjogUmU6IFtQQVRDSCB2NiAx
Mi8xNV0gdWJpOiBmYXN0bWFwOiBBZGQgYWxsIGZhc3RtYXAgcGVicyBpbnRvICdhaS0+ZmFzdG1h
cCcgd2hlbiBmbS0+dXNlZF9ibG9ja3M+PTIKCj4+PiBZZXMuIEJ1dCBpZiB5b3UgbG9vayBpbnRv
IHViaV93bF9pbml0KCkgeW91IHNlZSB0aGF0IGZhc3RtYXAgYW5jaG9yIFBFQnMKPj4+IGdldCBl
cmFzZXMgc3luY2hyb25vdXNseSghKS4gVGhlIGNvbW1lbnQgYmVmb3JlIHRoZSBlcmFzdXJlIGV4
cGxhaW5zIHdoeS4KPj4gQWJvdXQgZXJhc2luZyBmYXN0bWFwIGFuY2hvciBQRUIgc3luY2hyb25v
dXNseSwgSSBhZG1pdCBjdXJyZXVudCBVQkkKPj4gaW1wbGVtZW50YXRpb24gY2Fubm90IHNhdGlz
ZnkgaXQsIGV2ZW4gd2l0aCBteSBmaXggYXBwbGllZC4gV2FpdCwgaXQKPj4gc2VlbXMgdGhhdCBV
QkkgaGFzIG5ldmVyIG1hZGUgaXQgc3VyZS4gT2xkIGZhc3RtYXAgUEVCcyBjb3VsZCBiZSBlcmFz
ZWQKPj4gYXN5bmNocm9ub3VzbHksIHRoZXkgY291bGQgYmUgY291bnRlZCBpbnRvICdmbWgtPmVy
YXNlX3BlYl9jb3VudCcgZXZlbgo+PiBpbiBlYXJseSBVQkkgaW1wbGVtZW50YXRpb24gY29kZSwg
c28gb2xkIGZhc3RtYXAgYW5jaG9yIFBFQiB3aWxsIGJlCj4+IGFkZGVkIGludG8gJ2FpLT5lcmFz
ZScgYW5kIGJlIGVyYXNlZCBhc3luY2hyb25vdXNseSBpbiBuZXh0IGF0dGFjaGluZy4KPiBJbiBu
ZXh0IGF0dGFjaGluZyBvbGQgZmFzdG1hcCBQRUJzIHdpbGwgYmUgcHJvY2Vzc2VkIGFzIGZvbGxv
d2luZzoKPiB1YmlfYXR0YWNoX2Zhc3RtYXAgLT4gYWRkX2FlYihhaSwgJmFpLT5lcmFzZS4uLikK
PiB1Ymlfd2xfaW5pdAo+ICAgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGFlYiwgdG1wLCAmYWkt
PmVyYXNlKQo+ICAgICBlcmFzZV9hZWIgICAgICAgLy8gZXJhc2UgYXN5bmNocm9ub3VzbHkKPiAg
ICAgICB1YmktPmxvb2t1cHRibFtlLT5wbnVtXSA9IGUKPiAgIGxpc3RfZm9yX2VhY2hfZW50cnko
YWViLCAmYWktPmZhc3RtYXAsIHUubGlzdCkKPiAgICAgZSA9IHViaV9maW5kX2ZtX2Jsb2NrKHVi
aSwgYWViLT5wbnVtKQo+ICAgICBpZiAoZSkgewo+ICAgICAgICAuLi4KPiAgICAgfSBlbHNlIHsK
PiAgICAgICBpZiAodWJpLT5sb29rdXB0YmxbYWViLT5wbnVtXSkgICAgIC8vIG9sZCBmYXN0bWFw
IFBFQnMgYXJlCj4gYXNzaWduZWQgdG8gJ3ViaS0+bG9va3VwdGJsJwo+ICAgICAgICAgY29udGlu
dWU7Cj4gICAgIH0KPj4gQnV0LCBJIGZlZWwgaXQgaXMgbm90IGEgcHJvYmxlbSwgZmluZF9mbV9h
bmNob3IoKSBjYW4gaGVscCB1cyBmaW5kIG91dAo+ID4gdGhlIHJpZ2h0IGZhc3RtYXAgYW5jaG9y
IFBFQiBhY2NvcmRpbmcgc2VxbnVtLgoKRllJLCBJIHRoaW5rIEkgdW5kZXJzdGFuZCBub3cgb3Vy
IGRpc2FncmVlbWVudC4KWW91IGFzc3VtZSB0aGF0IG9sZCBGYXN0bWFwIFBFQnMgYXJlICpndWFy
YW50ZWVkKiB0byBiZSBwYXJ0IG9mIEZhc3RtYXAncyBlcmFzZSBsaXN0LgpUaGF0J3Mgb2theSBh
bmQgdGhpcyBpcyB3aGF0IExpbnV4IGFzIG9mIHRvZGF5IGRvZXMuCgpNeSBwb2ludCBpcyB0aGF0
IHdlIG5lZWQgdG8gYmUgcGFyYW5vaWQgYW5kIGNoZWNrIGNhcmVmdWxseSBmb3Igb2xkIEZhc3Rt
YXAgUEVCcwp3aGljaCBtaWdodCBiZSAqbm90KiBvbiB0aGUgZXJhc2UgbGlzdC4KSSBzYXcgc3Vj
aCBpc3N1ZXMgaW4gdGhlIHdpbGQuIFRoZXNlIHdlcmUgY2F1c2VzIGJ5IG9sZCBhbmQvb3IgYnVn
Z3kgRmFzdG1hcAppbXBsZW1lbnRhdGlvbnMuCktlZXAgaW4gbWluZCB0aGF0IExpbnV4IGlzIG5v
dCB0aGUgb25seSBzeXN0ZW0gdGhhdCBpbXBsZW1lbnRzIFVCSSAoYW5kIGZhc3RtYXApLgoKU28g
bGV0IG1lIGdpdmUgdGhlIHdob2xlIHNpdHVhdGlvbiBhbm90aGVyIHRob3VnaHQgb24gaG93IHRv
IGltcHJvdmUgaXQuCkkgdG90YWxseSBhZ3JlZSB3aXRoIHlvdSB0aGF0IGN1cnJlbnRseSB0aGVy
ZSBpcyBhIHByb2JsZW0gd2l0aCBmbS0+dXNlZF9ibG9ja3MgPiAxLgpJJ20ganVzdCBjYXJlZnVs
IChtYXliZSB0b28gY2FyZWZ1bCkgYWJvdXQgY2hhbmdpbmcgRmFzdG1hcCBjb2RlLgoKVGhhbmtz
LAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
