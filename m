Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36454C83F2D
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jul 2025 05:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HjHt+5Jc5E+X3/5JvvDIOjL8Sn4H0blHK+PYoovOKGE=; b=VNKa7p4g/Ct0rqgtKzEV2DeULf
	mmKioUQt8AcLvAAQkig1H29F111VVizHSbQOFqr3QIYbUwyhtFuVc02kT08Fu4yFuuKOBKTQqkS9s
	HKIjO0cd9eIyhFqClWbjGms8pG/PQ08H0Cy9j9NVqNqmHfmfN9+kcF0MA5NyMn/fgnMkh63E1OX4d
	ySakKG4dOLldGgq88fvBSirazrZgxgho7WnpGDlkmBinWir9fauBK1uO7rSKMfybiRGSqoerHmKp9
	XtVR7eEJAFFpSEbPnlYp4oCWfx13sg4KTxBPZl/OXgPb8EzzQVmflthslR+70NQX2Ex3Gj59l0bWt
	q/CfYPFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubusH-00000006o0j-0dgF;
	Wed, 16 Jul 2025 05:40:13 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubusD-00000006o01-3aI8
	for linux-mtd@lists.infradead.org;
	Wed, 16 Jul 2025 05:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1752644407; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=/qADFoeOXBnAEHP6o81g96cI4IF1HJRJHWKwBGouJpA=;
	b=iyB6gzwJ/02bjO5SomNOiefGOqH9+iwpb/siPspUy+p7u6p22QtvFFyOYIWT1sObd3STIzRnkndk8G+8rQJbFBPSAi/2rEXDZ30s/gn3lfNZ6bYHlgy/SC3jA1U4pfPB7J3l5OHlcuDNF/c6OSsinGr7TmlvY6+xkZYxUi60qb8=
Received: from 30.221.131.131(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0Wj2mLXU_1752644403 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 16 Jul 2025 13:40:04 +0800
Message-ID: <e143f730-6ae7-491e-985e-cc021411edd8@linux.alibaba.com>
Date: Wed, 16 Jul 2025 13:40:02 +0800
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
 <eeee0704-9e76-4152-bb8e-b5a0e096ec18@linux.alibaba.com>
 <b43fe06d-204b-4f47-a7ff-0c405365bc48@suse.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <b43fe06d-204b-4f47-a7ff-0c405365bc48@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_224010_387768_9D873A8A 
X-CRM114-Status: GOOD (  20.92  )
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

CgpPbiAyMDI1LzcvMTYgMTI6NTQsIFF1IFdlbnJ1byB3cm90ZToKPiAKPiAKPiDlnKggMjAyNS83
LzE2IDEwOjQ2LCBHYW8gWGlhbmcg5YaZ6YGTOgo+PiAuLi4KPj4KPj4+Cj4+Pj4KPj4+PiBUaGVy
ZSdzIHNvbWUgZGlzY3JlcGFuY3kgYmV0d2VlbiBmaWxlc3lzdGVtcyB3aGV0aGVyIHlvdSBuZWVk
IHNjcmF0Y2gKPj4+PiBzcGFjZSBmb3IgZGVjb21wcmVzc2lvbi7CoCBTb21lIGZpbGVzeXN0ZW1z
IHJlYWQgdGhlIGNvbXByZXNzZWQgZGF0YSBpbnRvCj4+Pj4gdGhlIHBhZ2VjYWNoZSBhbmQgZGVj
b21wcmVzcyBpbi1wbGFjZSwgd2hpbGUgb3RoZXIgZmlsZXN5c3RlbXMgcmVhZCB0aGUKPj4+PiBj
b21wcmVzc2VkIGRhdGEgaW50byBzY3JhdGNoIHBhZ2VzIGFuZCBkZWNvbXByZXNzIGludG8gdGhl
IHBhZ2UgY2FjaGUuCj4+Pgo+Pj4gQnRyZnMgZ29lcyB0aGUgc2NyYXRjaCBwYWdlcyB3YXkuIERl
Y29tcHJlc3Npb24gaW4tcGxhY2UgbG9va3MgYSBsaXR0bGUgdHJpY2t5IHRvIG1lLiBFLmcuIHdo
YXQgaWYgdGhlcmUgaXMgb25seSBvbmUgY29tcHJlc3NlZCBwYWdlLCBhbmQgaXQgZGVjb21wcmVz
c2VkIHRvIDQgcGFnZXMuCj4+Cj4+IERlY29tcHJlc3Npb24gaW4tcGxhY2UgbWFpbmx5IG9wdGlt
aXplcyBmdWxsIGRlY29tcHJlc3Npb24gKHNvIHRoYXQgQ1BVCj4+IGNhY2hlIGxpbmUgd29uJ3Qg
YmUgcG9sbHV0ZWQgYnkgdGVtcG9yYXJ5IGJ1ZmZlcnMgZWl0aGVyKSwgaW4gZmFjdCwKPj4gRVJP
RlMgc3VwcG9ydHMgdGhlIGh5YmlyZCB3YXkuCj4+Cj4+Pgo+Pj4gV29uJ3QgdGhlIHBsYWludGV4
dCBvdmVyLXdyaXRlIHRoZSBjb21wcmVzc2VkIGRhdGEgaGFsZndheT8KPj4KPj4gUGVyc29uYWxs
eSBJJ20gdmVyeSBmYW1pbGlhciB3aXRoIExaNCwgTFpNQSwgYW5kIERFRkxBVEUKPj4gYWxnb3Jp
dGhtIGludGVybmFscywgYW5kIEkgYWxzbyBoYXZlIGV4cGVyaWVuY2UgdG8gYnVpbGQgTFpNQSwK
Pj4gREVGTEFURSBjb21wcmVzc29ycy4KPj4KPj4gSXQncyB0b3RhbGx5IHdvcmthYmxlIGZvciBM
WjQsIGluIHNob3J0IGl0IHdpbGwgcmVhZCB0aGUgY29tcHJlc3NlZAo+PiBkYXRhIGF0IHRoZSBl
bmQgb2YgdGhlIGRlY29tcHJlc3NlZCBidWZmZXJzLCBhbmQgdGhlIHByb3BlciBtYXJnaW4KPj4g
Y2FuIG1ha2UgdGhpcyBhbG1vc3QgYWx3YXlzIHN1Y2NlZWQuCj4gCj4gSSBndWVzcyB0aGF0J3Mg
d2h5IGJ0cmZzIGNhbiBub3QgZ28gdGhhdCB3YXkuCj4gCj4gRHVlIHRvIGRhdGEgQ09XLCB3ZSdy
ZSB0b3RhbGx5IHBvc3NpYmxlIHRvIGhpdCBhIGNhc2UgdGhhdCB3ZSBvbmx5IHdhbnQgdG8gcmVh
ZCBvdXQgb25lIHNpbmdsZSBwbGFpbnRleHQgYmxvY2sgZnJvbSBhIGNvbXByZXNzZWQgZGF0YSBl
eHRlbnQgKHRoZSBjb21wcmVzc2VkIHNpemUgY2FuIGV2ZW4gYmUgbGFyZ2VyIHRoYW4gb25lIGJs
b2NrKS4KPiAKPiBJbiB0aGF0IGNhc2Ugc3VjaCBpbi1wbGFjZSBkZWNvbXByZXNzaW9uIHdpbGwg
ZGVmaW5pdGVseSBub3Qgd29yay4KCk9rLCBJIHRoaW5rIGl0J3MgbWFpbmx5IGR1ZSB0byBidHJm
cyBjb21wcmVzc2lvbiBkZXNpZ24uICBBbm90aGVyIHBvaW50CmlzIHRoYXQgZGVjb21wcmVzc2lv
biBpbnBsYWNlIGNhbiBhbHNvIGJlIHVzZWQgZm9yIG11bHRpLXNob3QgaW50ZXJmYWNlcwooYXMg
eW91IHNhaWQsICJzd2FwcGluZyBpbnB1dC8gb3V0cHV0IGJ1ZmZlciB3aGVuIG9uZSBvZiB0aGVt
IGlzIGZ1bGwiKQpsaWtlIGRlZmxhdGUsIGx6bWEgYW5kIHpzdGQuIEJlY2F1c2UgeW91IGNhbiBr
bm93IHdoZW4gdGhlIGRlY29tcHJlc3NlZApidWZmZXJzIGFuZCBjb21wcmVzc2VkIGJ1ZmZlcnMg
YXJlIG92ZXJsYXBwZWQgc2luY2UgQVBJcyBhcmUgbXVsdGktc2hvdCwKYW5kIG9ubHkgY29weSB0
aGUgb3ZlcmxhcHBlZCBjb21wcmVzc2VkIGRhdGEgdG8gc29tZSBhZGRpdGlvbmFsIHRlbXByYXJ5
CmJ1ZmZlcnMgKGFuZCB0aGV5IGNhbiBiZSBzaGFyZWQgYW1vbmcgbXVsdGlwbGUgY29tcHJlc3Nl
ZCBleHRlbnRzKS4KCkl0IGhhcyBsZXNzIG92ZXJoZWFkIHRoYW4gYWxsb2NhdGluZyB0ZW1wb3Jh
cnkgYnVmZmVycyB0byBrZWVwIGNvbXByZXNzZWQKZGF0YSBkdXJpbmcgdGhlIHdob2xlIEkvTyBw
cm9jZXNzIChhZ2FpbiwgYmVjYXVzZSBpdCBqdXN0IHVzZXMgdmVyeSBzbWFsbApudW1iZXIgYnVm
ZmVycyBkdXJpbmcgZGVjb21wcmVzc2lvbiBwcm9jZXNzKSwgZXNwZWNpYWxseSBmb3Igc2xvdyAo
ZXZlbgpuZXR3b3JrKSBzdG9yYWdlIGRldmljZXMuCgpJIGRvIHVuZGVyc3RhbmQgQnRyZnMgbWF5
IG5vdCBjb25zaWRlciB0aGlzIGJlY2F1c2Ugb2YgZGlmZmVyZW50IHRhcmdldAp1c2VycywgYnV0
IG9uZSBvZiBFUk9GUyBtYWluIHVzZSBjYXNlcyBpcyBsb3cgb3ZlcmhlYWQgZGVjb21wcmVzc2lv
bgp1bmRlciB0aGUgbWVtb3J5IHByZXNzdXJlIChtYXliZSArIGNoZWFwIHN0b3JhZ2UpLCBMWjQg
KyBpbnBsYWNlCmRlY29tcHJlc3Npb24gaXMgdXNlZnVsLgoKQW55d2F5LCBJJ20gbm90IGFkdm9j
YXRpbmcgaW5wbGFjZSBkZWNvbXByZXNzaW9uIGluIGFueSBjYXNlLiAgSSB0aGluawp1bmxpa2Ug
cGxhaW4gdGV4dCwgZW5jb2RlZCBkYXRhIGhhcyB2YXJpb3VzIGFwcHJvYWNoZXMgdG8gb3JnYW5p
emUKb24gZGlzayBhbmQgdXRpbGl6ZSBwYWdlIGNhY2hlLiAgRHVlIHRvIGRpZmZlcmVudCBvbi1k
aXNrIGRlc2lnbiBhbmQKdGFyZ2V0IHVzZXJzLCB0aGVyZSB3aWxsIGJlIGRpZmZlcmVudCB1c2Fn
ZSBtb2RlLgoKQXMgZm9yIEVST0ZTLCB3ZSBhbHJlYWR5IG5hdGl2ZWx5IHN1cHBvcnRzIGNvbXBy
ZXNzZWQgbGFyZ2UgZm9saW9zCnNpbmNlIDYuMTEsIGFuZCBvcmRlci0wIGZvbGlvIGlzIGFsd2F5
cyBvdXIgdXNlIGNhc2VzLCBzbyBJIGRvbid0CnRoaW5rIHRoaXMgd2lsbCBnaXZlIGV4dHJhIGJl
bmVmaXRzIHRvIHVzZXJzLgoKPiAKPiBbLi4uXQo+IAo+Pj4gQWxsIHRoZSBkZWNvbXByZXNzaW9u
L2NvbXByZXNzaW9uIHJvdXRpbmVzIGFsbCBzdXBwb3J0IHN3YXBwaW5nIGlucHV0LyBvdXRwdXQg
YnVmZmVyIHdoZW4gb25lIG9mIHRoZW0gaXMgZnVsbC4KPj4+IFNvIGttYXBfbG9jYWwoKSBpcyBj
b21wbGV0ZWx5IGZlYXNpYmxlLgo+Pgo+PiBJIHRoaW5rIG9uZSBvZiB0aGUgYnRyZnMgc3VwcG9y
dGVkIGFsZ29yaXRobSBMWk8gaXMgbm90LAo+IAo+IEl0IGlzLCB0aGUgdHJpY2t5IHBhcnQgaXMg
YnRyZnMgaXMgaW1wbGVtZW50aW5nIGl0cyBvd24gVExWIHN0cnVjdHVyZSBmb3IgTFpPIGNvbXBy
ZXNzaW9uLgo+IAo+IEFuZCBidHJmcyBkb2VzIGV4dHJhIHBhZGRpbmcgdG8gZW5zdXJlIG5vIFRM
ViAoY29tcHJlc3NlZCBkYXRhICsgaGVhZGVyKSBzdHJ1Y3R1cmUgd2lsbCBjcm9zcyBibG9jayBi
b3VuZGFyeS4KPiAKPiBTbyBidHJmcyBMWk8gY29tcHJlc3Npb24gaXMgc3RpbGwgYWJsZSB0byBz
d2FwIG91dCBpbnB1dC9vdXRwdXQgaGFsZndheSwgbW9zdGx5IGR1ZSB0byB0aGUgYnRyZnMnIHNw
ZWNpZmljIGRlc2lnbi4KCk9rLCBpdCBzZWVtcyBtdWNoIGxpa2UgYSBidHJmcy1zcGVjaWZpYyBk
ZXNpZ24sIGJlY2F1c2UgaXQncyBtdWNoCmxpa2UgcGVyLWJsb2NrIGNvbXByZXNzaW9uIGZvciBM
Wk8gaW5zdGVhZCwgYW5kIGl0IHdpbGwgaW5jcmVhc2UKdGhlIGNvbXByZXNzZWQgc2l6ZSwgSSBr
bm93IGJ0cmZzIG1heSBub3QgY2FyZSwgYnV0IGl0J3Mgbm90IHRoZQpFUk9GUyBjYXNlIGFueXdh
eS4KClRoYW5rcywKR2FvIFhpYW5nCgo+IAo+IFRoYW5rcywKPiBRdQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
