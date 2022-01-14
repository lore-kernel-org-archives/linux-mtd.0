Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2C7C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jan 2022 18:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=aYU2DwfUM2P8cUCiH02/JmjNWt+eMNTErpcIs0yupZo=; b=f67hiBHsrsqzlQrKnMEH1GkQu3
	tyNN5Y1f0tf/wKE9o5LM5aCeV/wXsgrm+FTA5N/hPRhfS08+PIeQFcgbceqyED8+Gz9W665TXLXnK
	HO//IiSEyh4MN52zwPcoZhdfmHMFa8uD2PT0LPB7iL1NN7Jmmg3dHQJoJW9VYaVJ+UW/Qj6xa4l7w
	Tnw7gI+91yBAaLK6AVKEVRkr3ymTBWSvzGqrIGQcT/CHeVbbrU36cQNpAiWQsvyKXC4/Dk04eYmuj
	13tIHHtrykWpJ38Zs2B4T1XnVUcwOX/vxfw6mpRgz4DEiiPeuTiD7fmk1YCVvyWsl98h+SRPqu4VD
	i7j6pWuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8RaJ-00A2sv-Dt; Fri, 14 Jan 2022 18:45:59 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8RaF-00A2s6-CD
 for linux-mtd@lists.infradead.org; Fri, 14 Jan 2022 18:45:57 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8538062DA5EE;
 Fri, 14 Jan 2022 19:45:40 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 2yi8__Y-zI1Z; Fri, 14 Jan 2022 19:45:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B1DCB62DA5F5;
 Fri, 14 Jan 2022 19:45:39 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id NHvsiMO3jAHb; Fri, 14 Jan 2022 19:45:39 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 850F462DA5EE;
 Fri, 14 Jan 2022 19:45:39 +0100 (CET)
Date: Fri, 14 Jan 2022 19:45:39 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 mcoquelin stm32 <mcoquelin.stm32@gmail.com>, 
 kirill shutemov <kirill.shutemov@linux.intel.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <23886736.260777.1642185939371.JavaMail.zimbra@nod.at>
In-Reply-To: <6815e4af-9b5b-313f-5828-644722dd4d1f@huawei.com>
References: <20211227032246.2886878-1-chengzhihao1@huawei.com>
 <6f7df7ba-9557-58a3-7978-e5d14a72f234@huawei.com>
 <244238061.248369.1641886066066.JavaMail.zimbra@nod.at>
 <420c7567-8926-2e8b-4da0-a9bfc8379642@huawei.com>
 <11976804.249069.1641902225370.JavaMail.zimbra@nod.at>
 <0a7a5cce-1ee1-70b6-d368-615dfa0a617a@huawei.com>
 <1492514284.249466.1641909382867.JavaMail.zimbra@nod.at>
 <6815e4af-9b5b-313f-5828-644722dd4d1f@huawei.com>
Subject: Re: [PATCH v6 12/15] ubi: fastmap: Add all fastmap pebs into
 'ai->fastmap' when fm->used_blocks>=2
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF96 (Linux)/8.8.12_GA_3809)
Thread-Topic: fastmap: Add all fastmap pebs into 'ai->fastmap' when
 fm->used_blocks>=2
Thread-Index: qjDxBwu4U/Pr6n7nEomfbCBiAoFFQQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_104555_795442_C56A33D5 
X-CRM114-Status: GOOD (  10.46  )
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
dXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4KPiBHZXNlbmRldDogTWl0
dHdvY2gsIDEyLiBKYW51YXIgMjAyMiAwNDo0NjoyOAo+IEJldHJlZmY6IFJlOiBbUEFUQ0ggdjYg
MTIvMTVdIHViaTogZmFzdG1hcDogQWRkIGFsbCBmYXN0bWFwIHBlYnMgaW50byAnYWktPmZhc3Rt
YXAnIHdoZW4gZm0tPnVzZWRfYmxvY2tzPj0yCgo+Pj4+IHViaV93bF9pbml0KCkgaXMgY2FsbGVk
IGluIGJvdGggY2FzZXMsIHdpdGggYW5kIHdpdGhvdXQgZmFzdG1hcC4KPj4+IEkgYWdyZWUuCj4+
Pgo+Pj4+IEFuZCBhaS0+ZmFzdG1hcCBjb250YWlucyBhbGwgYW5jaG9yIFBFQnMgdGhhdCBzY2Fu
X2Zhc3QoKSBmb3VuZC4KPj4+PiBUaGlzIGNhbiBiZSB0aGUgbW9zdCByZWNlbnQgYnV0IGFsc28g
b3V0ZGF0ZWQgYW5jaG9yIFBFQnMuCj4+PiBJcyBpdCBleGlzdHMgYSBjYXNlIHRoYXQgb3V0ZGF0
ZWQgZmFzdG1hcCBQRUJzIGFyZSBuZWl0aGVyIGNvdW50ZWQgaW50bwo+Pj4gJ2ZtaGRyLT5lcmFz
ZV9wZWJfY291bnQnIG5vciBzY2FubmVkIGludG8gJ2FpLT5mYXN0bWFwJyBhZnRlciBhdHRhY2hp
bmcKPj4+IGJ5IGZhc3RtYXAuCj4+Pgo+PiAKPj4gWy4uLl0KPj4gICAKPj4+IEkgdGhpbmsgVUJJ
IGF0dGFjaGVzIGZhaWxlZCBieSBmYXN0bWFwIGlmIGtlcm5lbCBnb2VzIGhlcmUuCj4+PiAxODcw
ICAgICAgICAgICAgICAgICAgICAgICAgIGVyciA9IGVyYXNlX2FlYih1YmksIGFlYiwgc3luYyk7
Cj4+IAo+PiBIbW0sIEkgdGhpbmsgdGhlIHBhcmFub2lhIGNoZWNrIGluIGZhc3RtYXAuYyBpcyB0
b28gc3RyaWN0IHRoZXNlIGRheXMuCj4+ICAgICAgICAgIGlmIChXQVJOX09OKGNvdW50X2Zhc3Rt
YXBfcGVicyhhaSkgIT0gdWJpLT5wZWJfY291bnQgLQo+PiAgICAgICAgICAgICAgICAgICAgICBh
aS0+YmFkX3BlYl9jb3VudCAtIGZtLT51c2VkX2Jsb2NrcykpCj4+ICAgICAgICAgICAgICAgICAg
Z290byBmYWlsX2JhZDsKPj4gCj4+IEl0IGRvZXMgbm90IGFjY291bnQgYWktPmZhc3RtYXAuIFNv
IGlmIGFpLT5mYXN0bWFwIGNvbnRhaW5zIG9sZCBhbmNob3IgUEVCcwo+PiB0aGlzIGNoZWNrIHdp
bGwgdHJpZ2dlciBhbmQgZm9yY2UgZmFsbGluZyBiYWNrIHRvIHNjYW5uaW5nIG1vZGUuCj4+IFdp
dGggdGhpcyBjaGVjayBmaXhlZCwgdWJpX3dsX2luaXQoKSB3aWxsIGVyYXNlIGFsbCBvbGQgUEVC
cyBmcm9tIGFpLT5mYXN0bWFwLgo+IEZvcmdpdmUgbXkgc3R1YmJvcm5uZXNzLCBJIHRoaW5rIHRo
aXMgc3RyaWN0IGNoZWNrIGlzIGdvb2QsIGNvdWxkIHlvdQo+IHNob3cgbWUgYSBwcm9jZXNzIHRv
IHRyaWdnZXIgdGhpcyBXQVJOX09OLCBpdCB3b3VsZCBiZSBuaWNlIHRvIHByb3ZpZGUgYQo+IHJl
cHJvZHVjZXIuCgpZb3UgY2FuIHRyaWdnZXIgdGhpcyBieSBpbnRlcnJ1cHRpbmcgVUJJLgplLmcu
IFdoZW4gVUJJIHdyaXRlcyBhIG5ldyBmYXN0bWFwIHRvIHRoZSBOQU5ELCBpdCBzY2hlZHVsZXMg
dGhlIG9sZCBmYXN0bWFwClBFQnMgZm9yIGVyYXN1cmUuIFBFQiBlcmFzdXJlIGlzIGFzeW5jaHJv
bm91cyBpbiBVQkkuIFNvIHRoaXMgY2FuIGJlIGRlbGF5ZWQKZm9yIGEgdmVyeSBsb25nIHRpbWUu
CldoaWxlIGRldmVsb3BpbmcgVUJJIGZhc3RtYXAgYW5kIHBlcmZvcm1pbmcgcG93ZXJjdXQgdGVz
dHMgSSBzYXcgdGhpcyBvZnRlbgpvbiB0YXJnZXRzLgoKPiBJIHN0aWxsIGluc2lzdCB0aGUgcG9p
bnQoYWZ0ZXIgbXkgZml4IHBhdGNoIGFwcGxpZWQpOiBBbGwgb3V0ZGF0ZWQKPiBmYXN0bWFwIFBF
QnMgYXJlIGFkZGVkIGludG8gJ2FpLT5mYXN0bWFwJyhmdWxsIHNjYW5uaW5nIGNhc2UpIG9yIGNv
dW50ZWQKPiBpbnRvICdmbWhkci0+ZXJhc2VfcGViX2NvdW50JyhmYXN0IGF0dGFjaGVkIGNhc2Up
LgoKWWVzLiBCdXQgaWYgeW91IGxvb2sgaW50byB1Ymlfd2xfaW5pdCgpIHlvdSBzZWUgdGhhdCBm
YXN0bWFwIGFuY2hvciBQRUJzCmdldCBlcmFzZXMgc3luY2hyb25vdXNseSghKS4gVGhlIGNvbW1l
bnQgYmVmb3JlIHRoZSBlcmFzdXJlIGV4cGxhaW5zIHdoeS4KVG8gY29tcGxpY2F0ZSB0aGluZ3Ms
IHRoaXMgY29kZSBpcyBjdXJyZW50bHkgdW5yZWFjaGFibGUgYmVjYXVzZSB0aGUgV0FSTl9PTigp
CmlzIG5vdCByaWdodC4gSSBtaXNzZXMgdG8gY291bnQgYWktPmZhc3RtYXAuClNvLCB3aGVuIHRo
ZXJlIGFyZSBvbGQgZmFzdG1hcCBQRUJzIGZvdW5kLCB0aGUgY291bnRlciBkb2VzIG5vdCBtYXRj
aAphbmQgVUJJIGZhbGxzIGJhY2sgdG8gZnVsbCBzY2FubmluZyB3aGlsZSBpdCBjb3VsZCB0byBh
biBhdHRhY2ggYnkgZmFzdG1hcC4KCkZhc3RtYXAgaXMgZnVsbCB3aXRoIGNvcm5lciBjYXNlcyB0
aGF0IGhhdmUgYmVlbiBmb3VuZCBieSBtYXNzaXZlIGFtb3VudCBvZiB0ZXN0aW5nLCBzYWRseS4K
ClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
