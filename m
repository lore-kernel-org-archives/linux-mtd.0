Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2F1C83F1A
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jul 2025 13:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RFYtdBljuQVZyBD7Jgi5kh+i3G1PECjh06HsKnB0XUU=; b=ssqK4mLdH4DYc/
	UzTyLA4PtTYcnebe37jPZBfn8ZH01G+0TqdooDKlVoz/OLRoJdSnHQuu5w94ffXYge9Un/ZJvyS4/
	9r6XFpOdSlfLQBJndCkspQKJKFRvaQRAlnXqOgDpwcx3Mwdu2E3ylhuTh5f96bKfNG+OvlICwkb9D
	VntIvLD4kDDPAe2HLf0B6iBGrQyd/xOMX0HaSTs3DeOajQ/xMzh93EESlpmQEULhCMwmAiwh6wV1a
	pouSyoAK6HOz3yLioEjoqZNO2HZyGThuzY0sTbHYMuA8NYOqxsU4yL4t+MB4D3Z3aT2vtOZF8QHRf
	rkB4u+dmIRsdWc1Cc++Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqVw-0000000HNeY-0vbu;
	Mon, 21 Jul 2025 13:25:08 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udp4W-0000000HBwS-2fBk
	for linux-mtd@lists.infradead.org;
	Mon, 21 Jul 2025 11:52:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1753098762; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=xn+hlC0ADjp0KbawmAyVX05nJJetj+qoWgSmW+bOOXA=;
	b=okMnN41HP5taCoXf1kbwUjIL3RJaMTGT0sxm9zAdfpRQfDlcz8KmbyRg51Kx9Ub4jXm0EbA3/4Cag9yTKGqpWol3Np7Oqo/SmmeZ9zjhb54Lcli6EcLl+n425ovo+/Bl+T9RWjeW5B4L8KmDDvMqlMjkmLJKzvxSKqZHG/gMQao=
Received: from 30.170.233.0(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WjOEOJD_1753098756 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 21 Jul 2025 19:52:39 +0800
Message-ID: <5b01d35c-b73b-4c04-906d-6abc0c9e37ce@linux.alibaba.com>
Date: Mon, 21 Jul 2025 19:52:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Compressed files & the page cache
To: Qu Wenruo <quwenruo.btrfs@gmx.com>, Jan Kara <jack@suse.cz>
Cc: Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org,
 Nicolas Pitre <nico@fluxnic.net>, Gao Xiang <xiang@kernel.org>,
 Chao Yu <chao@kernel.org>, linux-erofs@lists.ozlabs.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Howells <dhowells@redhat.com>, netfs@lists.linux.dev,
 Paulo Alcantara <pc@manguebit.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, Steve French <sfrench@samba.org>,
 linux-cifs@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
 Hailong Liu <hailong.liu@oppo.com>
References: <aHa8ylTh0DGEQklt@casper.infradead.org>
 <e5165052-ead3-47f4-88f6-84eb23dc34df@linux.alibaba.com>
 <b61c4b7f-4bb1-4551-91ba-a0e0ffd19e75@linux.alibaba.com>
 <CAGsJ_4xJjwsvMpeBV-QZFoSznqhiNSFtJu9k6da_T-T-a6VwNw@mail.gmail.com>
 <7ea73f49-df4b-4f88-8b23-c917b4a9bd8a@linux.alibaba.com>
 <z2ule3ilnnpoevo5mvt3intvjtuyud7vg3pbfauon47fhr4owa@giaehpbie4a5>
 <85946346-8bfd-4164-a49d-594b4a158588@gmx.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <85946346-8bfd-4164-a49d-594b4a158588@gmx.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_045244_938499_6F5F6BF4 
X-CRM114-Status: GOOD (  15.49  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAyMDI1LzcvMjEgMTk6MzYsIFF1IFdlbnJ1byB3cm90ZToKPiAKPiAKPiDlnKggMjAyNS83
LzIxIDE5OjU1LCBKYW4gS2FyYSDlhpnpgZM6Cj4+IE9uIE1vbiAyMS0wNy0yNSAxMToxNDowMiwg
R2FvIFhpYW5nIHdyb3RlOgo+Pj4gSGkgQmFycnksCj4+Pgo+Pj4gT24gMjAyNS83LzIxIDA5OjAy
LCBCYXJyeSBTb25nIHdyb3RlOgo+Pj4+IE9uIFdlZCwgSnVsIDE2LCAyMDI1IGF0IDg6MjjigK9B
TSBHYW8gWGlhbmcgPGhzaWFuZ2thb0BsaW51eC5hbGliYWJhLmNvbT4gd3JvdGU6Cj4gWy4uLl0K
Pj4+PiBHaXZlbiB0aGUgZGlmZmljdWx0eSBvZiBhbGxvY2F0aW5nIGxhcmdlIGZvbGlvcywgaXQn
cyBhbHdheXMgYSBnb29kCj4+Pj4gaWRlYSB0byBoYXZlIG9yZGVyLTAgYXMgYSBmYWxsYmFjay4g
V2hpbGUgSSBhZ3JlZSB3aXRoIHlvdXIgcG9pbnQsCj4+Pj4gSSBoYXZlIGEgc2xpZ2h0bHkgZGlm
ZmVyZW50IHBlcnNwZWN0aXZlIOKAlCBlbmFibGluZyBsYXJnZSBmb2xpb3MgZm9yCj4+Pj4gdGhv
c2UgZGV2aWNlcyBtaWdodCBiZSBiZW5lZmljaWFsLCBidXQgdGhlIG1heGltdW0gb3JkZXIgc2hv
dWxkCj4+Pj4gcmVtYWluIHNtYWxsLiBJJ20gcmVmZXJyaW5nIHRvICJzbWFsbCIgbGFyZ2UgZm9s
aW9zLgo+Pj4KPj4+IFllYWgsIGFncmVlZC4gSGF2aW5nIGEgd2F5IHRvIGxpbWl0IHRoZSBtYXhp
bXVtIG9yZGVyIGZvciB0aG9zZSBzbWFsbAo+Pj4gZGV2aWNlcyAocmF0aGVyIHRoYW4gZGlzYWJs
aW5nIGl0IGNvbXBsZXRlbHkpIHdvdWxkIGJlIGhlbHBmdWwuwqAgQXQKPj4+IGxlYXN0ICJzbWFs
bCIgbGFyZ2UgZm9saW9zIGNvdWxkIHN0aWxsIHByb3ZpZGUgYmVuZWZpdHMgd2hlbiBtZW1vcnkK
Pj4+IHByZXNzdXJlIGlzIGxpZ2h0Lgo+Pgo+PiBXZWxsLCBpbiB0aGUgcGFnZSBjYWNoZSB5b3Ug
Y2FuIHR1bmUgbm90IG9ubHkgdGhlIG1pbmltdW0gYnV0IGFsc28gdGhlCj4+IG1heGltdW0gb3Jk
ZXIgb2YgYSBmb2xpbyBiZWluZyBhbGxvY2F0ZWQgZm9yIGVhY2ggaW5vZGUuIEJ0cmZzIGFuZCBl
eHQ0Cj4+IGFscmVhZHkgdXNlIHRoaXMgZnVuY3Rpb25hbGl0eS4gU28gaW4gcHJpbmNpcGxlIHRo
ZSBmdW5jdGlvbmFsaXR5IGlzIHRoZXJlLAo+PiBpdCBpcyAianVzdCIgYSBxdWVzdGlvbiBvZiBw
cm9wZXIgdXNlciBpbnRlcmZhY2VzIG9yIGF1dG9tYXRpYyBsb2dpYyB0bwo+PiB0dW5lIHRoaXMg
bGltaXQuCj4+Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIEhvbnphCj4gCj4gQW5kIGVuYWJsaW5nIGxhcmdlIGZvbGlvcyBk
b2Vzbid0IG1lYW4gYWxsIGZzIG9wZXJhdGlvbnMgd2lsbCBncmFiIGFuIHVubmVjZXNzYXJpbHkg
bGFyZ2UgZm9saW8uCj4gCj4gRm9yIGJ1ZmZlcmVkIHdyaXRlLCBhbGwgdGhvc2UgZmlsZXN5c3Rl
bSB3aWxsIG9ubHkgdHJ5IHRvIGdldCBmb2xpb3MgYXMgbGFyZ2UgYXMgbmVjZXNzYXJ5LCBub3Qg
b3Zlcmx5IGxhcmdlLgo+IAo+IFRoaXMgbWVhbnMgaWYgdGhlIHVzZXIgc3BhY2UgcHJvZ3JhbSBp
cyBhbHdheXMgZG9pbmcgYnVmZmVyZWQgSU8gaW4gYSBwb3dlci1vZi10d28gdW5pdCAoYW5kIGFs
aWduZWQgb2Zmc2V0IG9mIGNvdXJzZSksIHRoZSBmb2xpbyBzaXplIHdpbGwgbWF0Y2ggdGhlIGJ1
ZmZlciBzaXplIHBlcmZlY3RseSAoaWYgd2UgaGF2ZSBlbm91Z2ggbWVtb3J5KS4KPiAKPiBTbyBm
b3IgcHJvcGVybHkgYWxpZ25lZCBidWZmZXJlZCB3cml0ZXMsIGxhcmdlIGZvbGlvcyB3b24ndCBy
ZWFsbHkgY2F1c2UgwqB1bm5lY2Vzc2FyaWx5IGxhcmdlIGZvbGlvcywgbWVhbndoaWxlIGJyaW5n
cyBhbGwgdGhlIGJlbmVmaXRzLgoKVGhhdCByZWFsbHkgZGVwZW5kcyBvbiB0aGUgdXNlciBiZWhh
dmlvciAmIEkvTyBwYXR0ZXJuIGFuZApjb3VsZCBjYXVzZSB1bmV4cGVjdGVkIHNwaWtlLgoKQW55
d2F5LCBJTUhPLCBob3cgdG8gbGltaXQgdGhlIG1heGltdW0gb3JkZXIgbWF5IGJlIHVzZWZ1bApm
b3Igc21hbGwgZGV2aWNlcyBpZiBsYXJnZSBmb2xpb3MgaXMgZW5hYmxlZC4gIFdoZW4gZGlyZWN0
CnJlY2xhaW0gaXMgdGhlIGNvbW1vbiBjYXNlLCBpdCBtaWdodCBiZSB0b28gbGF0ZS4KClRoYW5r
cywKR2FvIFhpYW5nCgo+IAo+IAo+IEFsdGhvdWdoIEknbSBub3QgZmFtaWxpYXIgZW5vdWdoIHdp
dGggZmlsZW1hcCB0byBjb21tZW50IG9uIGZvbGlvIHJlYWQgYW5kIHJlYWRhaGVhZC4uLgo+IAo+
IFRoYW5rcywKPiBRdQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
