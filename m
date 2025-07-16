Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5FAC83F27
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jul 2025 01:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCgr0JzFwHahf37WK5Vroj2gvnc8FKOxoZu68Qo7Iuo=; b=zeDOeICD9eEWslrYoLYGy6IiKr
	yzLt3skQtvKxjoQMf4VK92APG5YctS79KNE23e2jEoRhrMwSfh/qGg8tJyvMia/RTQ3Ob/m65PJeX
	ccUZoa7BEEefjXGD8ernHCI96y1iV3GtHSM7kMyz92D0AuDYlFDy+KF6Oz71yDrLHjoDqAogKThsP
	r8PZMBzZx1rZCO2oGkmBUFUcfRIiX/Uea9wwhnZuSgU+enBeSDNJGDCfcfDTkOnJtSX4SgSfod+DN
	KqgWdSIk0/E0gxmH445yGA9w8bWyqBoSgcrr95R1xW1dOx0aDoSyLecmBRbRmAj4iAv5ZuASuFYzY
	aoMwELpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubqnZ-00000006X63-09rC;
	Wed, 16 Jul 2025 01:19:05 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubqkx-00000006Ww9-3b06
	for linux-mtd@lists.infradead.org;
	Wed, 16 Jul 2025 01:16:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1752628580; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=kNCZo6e03bIhaM3yJ6Z7GsBUCWM2xE3LHwyTmkn0gfM=;
	b=acbvHpOL7HEbf80uUb28q8mwKL5uxdiMiBdQ6ty+Ccehr4k20uPRCcQXPdSmF1Cjv+oQSH6VkVUJr3ej7MoYxnir6/YHTo8zZatisHdTF7l+FjNewWv9u7cPaOk2W77ey2E4sBKI7hsOk/s21V/Dy4UPP0+04/TBjLF90R3vF6Q=
Received: from 30.170.233.0(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0Wj1sJXu_1752628575 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 16 Jul 2025 09:16:17 +0800
Message-ID: <eeee0704-9e76-4152-bb8e-b5a0e096ec18@linux.alibaba.com>
Date: Wed, 16 Jul 2025 09:16:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Compressed files & the page cache
To: Qu Wenruo <wqu@suse.com>, Matthew Wilcox <willy@infradead.org>,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org,
 Nicolas Pitre <nico@fluxnic.net>, Gao Xiang <xiang@kernel.org>,
 Chao Yu <chao@kernel.org>, linux-erofs@lists.ozlabs.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, David Howells <dhowells@redhat.com>,
 netfs@lists.linux.dev, Paulo Alcantara <pc@manguebit.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, Steve French <sfrench@samba.org>,
 linux-cifs@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>
References: <aHa8ylTh0DGEQklt@casper.infradead.org>
 <2806a1f3-3861-49df-afd4-f7ac0beae43c@suse.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <2806a1f3-3861-49df-afd4-f7ac0beae43c@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_181624_680110_CB8C2CAA 
X-CRM114-Status: GOOD (  17.14  )
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

Li4uCgo+IAo+Pgo+PiBUaGVyZSdzIHNvbWUgZGlzY3JlcGFuY3kgYmV0d2VlbiBmaWxlc3lzdGVt
cyB3aGV0aGVyIHlvdSBuZWVkIHNjcmF0Y2gKPj4gc3BhY2UgZm9yIGRlY29tcHJlc3Npb24uwqAg
U29tZSBmaWxlc3lzdGVtcyByZWFkIHRoZSBjb21wcmVzc2VkIGRhdGEgaW50bwo+PiB0aGUgcGFn
ZWNhY2hlIGFuZCBkZWNvbXByZXNzIGluLXBsYWNlLCB3aGlsZSBvdGhlciBmaWxlc3lzdGVtcyBy
ZWFkIHRoZQo+PiBjb21wcmVzc2VkIGRhdGEgaW50byBzY3JhdGNoIHBhZ2VzIGFuZCBkZWNvbXBy
ZXNzIGludG8gdGhlIHBhZ2UgY2FjaGUuCj4gCj4gQnRyZnMgZ29lcyB0aGUgc2NyYXRjaCBwYWdl
cyB3YXkuIERlY29tcHJlc3Npb24gaW4tcGxhY2UgbG9va3MgYSBsaXR0bGUgdHJpY2t5IHRvIG1l
LiBFLmcuIHdoYXQgaWYgdGhlcmUgaXMgb25seSBvbmUgY29tcHJlc3NlZCBwYWdlLCBhbmQgaXQg
ZGVjb21wcmVzc2VkIHRvIDQgcGFnZXMuCgpEZWNvbXByZXNzaW9uIGluLXBsYWNlIG1haW5seSBv
cHRpbWl6ZXMgZnVsbCBkZWNvbXByZXNzaW9uIChzbyB0aGF0IENQVQpjYWNoZSBsaW5lIHdvbid0
IGJlIHBvbGx1dGVkIGJ5IHRlbXBvcmFyeSBidWZmZXJzIGVpdGhlciksIGluIGZhY3QsCkVST0ZT
IHN1cHBvcnRzIHRoZSBoeWJpcmQgd2F5LgoKPiAKPiBXb24ndCB0aGUgcGxhaW50ZXh0IG92ZXIt
d3JpdGUgdGhlIGNvbXByZXNzZWQgZGF0YSBoYWxmd2F5PwoKUGVyc29uYWxseSBJJ20gdmVyeSBm
YW1pbGlhciB3aXRoIExaNCwgTFpNQSwgYW5kIERFRkxBVEUKYWxnb3JpdGhtIGludGVybmFscywg
YW5kIEkgYWxzbyBoYXZlIGV4cGVyaWVuY2UgdG8gYnVpbGQgTFpNQSwKREVGTEFURSBjb21wcmVz
c29ycy4KCkl0J3MgdG90YWxseSB3b3JrYWJsZSBmb3IgTFo0LCBpbiBzaG9ydCBpdCB3aWxsIHJl
YWQgdGhlIGNvbXByZXNzZWQKZGF0YSBhdCB0aGUgZW5kIG9mIHRoZSBkZWNvbXByZXNzZWQgYnVm
ZmVycywgYW5kIHRoZSBwcm9wZXIgbWFyZ2luCmNhbiBtYWtlIHRoaXMgYWxtb3N0IGFsd2F5cyBz
dWNjZWVkLiAgSW4gcHJhY3RpY2UsIG1hbnkgQW5kcm9pZApkZXZpY2VzIGFscmVhZHkgdXNlIEVS
T0ZTIGZvciBhbG1vc3QgNyB5ZWFycyBhbmQgaXQgd29ya3MgdmVyeSB3ZWxsCnRvIHJlZHVjZSBl
eHRyYSBtZW1vcnkgb3ZlcmhlYWQgYW5kIGhlbHAgb3ZlcmFsbCBydW50aW1lIHBlcmZvcm1hbmNl
LgoKSW4gc2hvcnQsIEkgZG9uJ3QgdGhpbmsgRVJPRlMgd2lsbCBjaGFuZ2Ugc2luY2UgaXQncyBh
bHJlYWR5Cm9wdGltYWwgYW5kIGdhaW5pbmcgbW9yZSBhbmQgbW9yZSB1c2Vycy4KCj4gCj4+Cj4+
IFRoZXJlIGFsc28gc2VlbXMgdG8gYmUgc29tZSBkaXNjcmVwYW5jeSBiZXR3ZWVuIGZpbGVzeXN0
ZW1zIHdoZXRoZXIgdGhlCj4+IGRlY29tcHJlc3Npb24gaW52b2x2ZXMgdm1hcCgpIG9mIGFsbCB0
aGUgbWVtb3J5IGFsbG9jYXRlZCBvciB3aGV0aGVyIHRoZQo+PiBkZWNvbXByZXNzaW9uIHJvdXRp
bmVzIGNhbiBoYW5kbGUgZG9pbmcga21hcF9sb2NhbCgpIG9uIGluZGl2aWR1YWwgcGFnZXMuCj4g
Cj4gQnRyZnMgaXMgdGhlIGxhdGVyIGNhc2UuCj4gCj4gQWxsIHRoZSBkZWNvbXByZXNzaW9uL2Nv
bXByZXNzaW9uIHJvdXRpbmVzIGFsbCBzdXBwb3J0IHN3YXBwaW5nIGlucHV0L291dHB1dCBidWZm
ZXIgd2hlbiBvbmUgb2YgdGhlbSBpcyBmdWxsLgo+IFNvIGttYXBfbG9jYWwoKSBpcyBjb21wbGV0
ZWx5IGZlYXNpYmxlLgoKSSB0aGluayBvbmUgb2YgdGhlIGJ0cmZzIHN1cHBvcnRlZCBhbGdvcml0
aG0gTFpPIGlzIG5vdCwgYmVjYXVzZSB0aGUKZmFzdGVzdCBMWjc3LWZhbWlseSBhbGdvcml0aG1z
IGxpa2UgTFo0LCBMWk8ganVzdCBvcGVyYXRlcyBvbiB2aXJ0dWFsCmNvbnNlY3V0aXZlIGJ1ZmZl
cnMgYW5kIHRyZWF0IHRoZSBkZWNvbXByZXNzZWQgYnVmZmVyIGFzIExaNzcgc2xpZGluZwp3aW5k
b3cuCgpTbyB0aGF0IGVpdGhlciB5b3UgbmVlZCB0byBhbGxvY2F0ZSBhbm90aGVyIHRlbXBvcmFy
eSBjb25zZWN1dGl2ZQpidWZmZXIgKEkgYmVsaWV2ZSB0aGF0IGlzIHdoYXQgYnRyZnMgZG9lcykg
b3IgdXNlIHZtYXAoKSBhcHByb2FjaCwKRVJPRlMgaXMgaW50ZXJlc3RlZCBpbiB0aGUgdm1hcCgp
IG9uZS4KClRoYW5rcywKR2FvIFhpYW5nCgo+IAo+IFRoYW5rcywKPiBRdQo+IAo+Pgo+PiBTbywg
bXkgcHJvcG9zYWwgaXMgdGhhdCBmaWxlc3lzdGVtcyB0ZWxsIHRoZSBwYWdlIGNhY2hlIHRoYXQg
dGhlaXIgbWluaW11bQo+PiBmb2xpbyBzaXplIGlzIHRoZSBjb21wcmVzc2lvbiBibG9jayBzaXpl
LsKgIFRoYXQgc2VlbXMgdG8gYmUgYXJvdW5kIDY0aywKPj4gc28gbm90IGFuIHVucmVhc29uYWJs
ZSBtaW5pbXVtIGFsbG9jYXRpb24gc2l6ZS7CoCBUaGF0IHJlbW92ZXMgYWxsIHRoZQo+PiBleHRy
YSBjb2RlIGluIGZpbGVzeXN0ZW1zIHRvIGFsbG9jYXRlIGV4dHJhIG1lbW9yeSBpbiB0aGUgcGFn
ZSBjYWNoZS4KPj4gSXQgbWVhbnMgd2UgZG9uJ3QgYXR0ZW1wdCB0byB0cmFjayBkaXJ0aW5lc3Mg
YXQgYSBzdWItZm9saW8gZ3JhbnVsYXJpdHkKPj4gKHRoZXJlJ3Mgbm8gcG9pbnQsIHdlIGhhdmUg
dG8gd3JpdGUgYmFjayB0aGUgZW50aXJlIGNvbXByZXNzZWQgYm9jawo+PiBhdCBvbmNlKS7CoCBX
ZSBhbHNvIGdldCBhIHNpbmdsZSB2aXJ0dWFsbHkgY29udGlndW91cyBibG9jayAuLi4gaWYgeW91
J3JlCj4+IHdpbGxpbmcgdG8gZGl0Y2ggSElHSE1FTSBzdXBwb3J0LsKgIE9yIHRoZXJlJ3MgYSBw
cm9wb3NhbCB0byBpbnRyb2R1Y2UgYQo+PiB2bWFwX2ZpbGUoKSB3aGljaCB3b3VsZCBnaXZlIHVz
IGEgdmlydHVhbGx5IGNvbnRpZ3VvdXMgY2h1bmsgb2YgbWVtb3J5Cj4+IChhbmQgY291bGQgYmUg
dHJpdmlhbGx5IHR1cm5lZCBpbnRvIGEgbm9vcCBmb3IgdGhlIGNhc2Ugb2YgdHJ5aW5nIHRvCj4+
IHZtYXAgYSBzaW5nbGUgbGFyZ2UgZm9saW8pLgo+Pgo+PgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
