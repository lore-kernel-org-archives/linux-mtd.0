Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1815C83F25
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jul 2025 13:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PmZgak6swq3E30uJo78YS+MaqCdRhGd6QPeNpJlaF8c=; b=pB6abbkMGpskM/
	+2bUv/zp+1+4TJexclwFEKMUWjjG/tC8QysBz8VgyU+zwiHzj55VabJM5OLrfgUDrcGfyNQ9T5Ien
	E+Cd53sSB2TfkOazrxlZGrupY0oNNcm1KhcqchClhQ8TGDe2SFY8oWEoPpACKvKcRp/Uo06VuaFXw
	VfVrPmbxWWta4HPMjaMojlCtFMjYKfodjl8PgDwZ6q8qpr19+aq0/1LiNEIouVGlSJG3N/mCLHiUe
	hyHerHrFyFW6GHdxIDuCC/dTlN6Q9NEdkPKZmf1XiS2lg3Z4OjUnotcG+kqMGKYrO2O5hykXjzx1z
	lPf4vBej0PY/qubGi5dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqR6-0000000HN7h-2f9a;
	Mon, 21 Jul 2025 13:20:08 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udosa-0000000H8tC-3plt
	for linux-mtd@lists.infradead.org;
	Mon, 21 Jul 2025 11:40:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1753098021; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=8/0MxmZXQFEgx1v9g0Zx0cK6D0Dzk/CVwttHZ2ijYQw=;
	b=UOdFjaM/5FDe7VBZ0Rne7i8heLfH6pD2B0QPuCmuLorGKHn/nBxOmPIZSn/UFiVTcx+hkNMl56atQoi3P6GDaa4Ya00EfUt1Aj2Q+bYphPtCiPUJKE+uj1509CvESiKZcJLw88TLBwBelvuT0VfAt3b79z53L67IN2RXdXRYb94=
Received: from 30.170.233.0(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WjOEKZd_1753098012 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 21 Jul 2025 19:40:15 +0800
Message-ID: <de793a0d-b65e-4b36-ad7f-3202515ba9c9@linux.alibaba.com>
Date: Mon, 21 Jul 2025 19:40:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Compressed files & the page cache
To: Jan Kara <jack@suse.cz>
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
 Hailong Liu <hailong.liu@oppo.com>, Qu Wenruo <quwenruo.btrfs@gmx.com>
References: <aHa8ylTh0DGEQklt@casper.infradead.org>
 <e5165052-ead3-47f4-88f6-84eb23dc34df@linux.alibaba.com>
 <b61c4b7f-4bb1-4551-91ba-a0e0ffd19e75@linux.alibaba.com>
 <CAGsJ_4xJjwsvMpeBV-QZFoSznqhiNSFtJu9k6da_T-T-a6VwNw@mail.gmail.com>
 <7ea73f49-df4b-4f88-8b23-c917b4a9bd8a@linux.alibaba.com>
 <z2ule3ilnnpoevo5mvt3intvjtuyud7vg3pbfauon47fhr4owa@giaehpbie4a5>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <z2ule3ilnnpoevo5mvt3intvjtuyud7vg3pbfauon47fhr4owa@giaehpbie4a5>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_044025_169289_D1CAEFDD 
X-CRM114-Status: GOOD (  15.28  )
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

SGkgSmFuLAoKT24gMjAyNS83LzIxIDE4OjI1LCBKYW4gS2FyYSB3cm90ZToKPiBPbiBNb24gMjEt
MDctMjUgMTE6MTQ6MDIsIEdhbyBYaWFuZyB3cm90ZToKPj4gSGkgQmFycnksCj4+Cj4+IE9uIDIw
MjUvNy8yMSAwOTowMiwgQmFycnkgU29uZyB3cm90ZToKPj4+IE9uIFdlZCwgSnVsIDE2LCAyMDI1
IGF0IDg6MjjigK9BTSBHYW8gWGlhbmcgPGhzaWFuZ2thb0BsaW51eC5hbGliYWJhLmNvbT4gd3Jv
dGU6Cj4+Pj4KPj4KPj4gLi4uCj4+Cj4+Pj4KPj4+PiAuLi4gaGlnaC1vcmRlciBmb2xpb3MgY2Fu
IGNhdXNlIHNpZGUgZWZmZWN0cyBvbiBlbWJlZGRlZCBkZXZpY2VzCj4+Pj4gbGlrZSByb3V0ZXJz
IGFuZCBJb1QgZGV2aWNlcywgd2hpY2ggc3RpbGwgaGF2ZSBNaUJzIG9mIG1lbW9yeSAoYW5kIEkK
Pj4+PiBiZWxpZXZlIHRoaXMgd29uJ3QgY2hhbmdlIGR1ZSB0byB0aGVpciB1c2UgY2FzZXMpIGJ1
dCB0aGV5IGFsc28gdXNlCj4+Pj4gTGludXgga2VybmVsIGZvciBxdWl0ZSBsb25nIHRpbWUuICBJ
biBzaG9ydCwgSSBkb24ndCB0aGluayBlbmFibGluZwo+Pj4+IGxhcmdlIGZvbGlvcyBmb3IgdGhv
c2UgZGV2aWNlcyBpcyB2ZXJ5IHVzZWZ1bCwgbGV0IGFsb25lIGxpbWl0aW5nCj4+Pj4gdGhlIG1p
bmltdW0gZm9saW8gb3JkZXIgZm9yIHRoZW0gKEl0IHdvdWxkIG1ha2UgdGhlIGZpbGVzeXN0ZW0g
bm90Cj4+Pj4gc3VpdGFibGUgYW55IG1vcmUgZm9yIHRob3NlIHVzZXJzLiAgQXQgbGVhc3QgdGhh
dCBpcyB3aGF0IEkgbmV2ZXIKPj4+PiB3YW50IHRvIGRvKS4gIEFuZCBJIGJlbGlldmUgdGhpcyBp
cyBkaWZmZXJlbnQgZnJvbSB0aGUgY3VycmVudCBMQlMKPj4+PiBzdXBwb3J0IHRvIG1hdGNoIGhh
cmR3YXJlIGNoYXJhY3RlcmlzdGljcyBvciBMQlMgYXRvbWljIHdyaXRlCj4+Pj4gcmVxdWlyZW1l
bnQuCj4+Pgo+Pj4gR2l2ZW4gdGhlIGRpZmZpY3VsdHkgb2YgYWxsb2NhdGluZyBsYXJnZSBmb2xp
b3MsIGl0J3MgYWx3YXlzIGEgZ29vZAo+Pj4gaWRlYSB0byBoYXZlIG9yZGVyLTAgYXMgYSBmYWxs
YmFjay4gV2hpbGUgSSBhZ3JlZSB3aXRoIHlvdXIgcG9pbnQsCj4+PiBJIGhhdmUgYSBzbGlnaHRs
eSBkaWZmZXJlbnQgcGVyc3BlY3RpdmUg4oCUIGVuYWJsaW5nIGxhcmdlIGZvbGlvcyBmb3IKPj4+
IHRob3NlIGRldmljZXMgbWlnaHQgYmUgYmVuZWZpY2lhbCwgYnV0IHRoZSBtYXhpbXVtIG9yZGVy
IHNob3VsZAo+Pj4gcmVtYWluIHNtYWxsLiBJJ20gcmVmZXJyaW5nIHRvICJzbWFsbCIgbGFyZ2Ug
Zm9saW9zLgo+Pgo+PiBZZWFoLCBhZ3JlZWQuIEhhdmluZyBhIHdheSB0byBsaW1pdCB0aGUgbWF4
aW11bSBvcmRlciBmb3IgdGhvc2Ugc21hbGwKPj4gZGV2aWNlcyAocmF0aGVyIHRoYW4gZGlzYWJs
aW5nIGl0IGNvbXBsZXRlbHkpIHdvdWxkIGJlIGhlbHBmdWwuICBBdAo+PiBsZWFzdCAic21hbGwi
IGxhcmdlIGZvbGlvcyBjb3VsZCBzdGlsbCBwcm92aWRlIGJlbmVmaXRzIHdoZW4gbWVtb3J5Cj4+
IHByZXNzdXJlIGlzIGxpZ2h0Lgo+IAo+IFdlbGwsIGluIHRoZSBwYWdlIGNhY2hlIHlvdSBjYW4g
dHVuZSBub3Qgb25seSB0aGUgbWluaW11bSBidXQgYWxzbyB0aGUKPiBtYXhpbXVtIG9yZGVyIG9m
IGEgZm9saW8gYmVpbmcgYWxsb2NhdGVkIGZvciBlYWNoIGlub2RlLiBCdHJmcyBhbmQgZXh0NAo+
IGFscmVhZHkgdXNlIHRoaXMgZnVuY3Rpb25hbGl0eS4gU28gaW4gcHJpbmNpcGxlIHRoZSBmdW5j
dGlvbmFsaXR5IGlzIHRoZXJlLAo+IGl0IGlzICJqdXN0IiBhIHF1ZXN0aW9uIG9mIHByb3BlciB1
c2VyIGludGVyZmFjZXMgb3IgYXV0b21hdGljIGxvZ2ljIHRvCj4gdHVuZSB0aGlzIGxpbWl0LgoK
WWVzLCBJIHRvb2sgYSBxdWljayBnbGFuY2Ugb2YgdGhlIGN1cnJlbnQgZXh0NCBhbmQgYnRyZnMg
Y2FzZXMKd2Vla3MgYWdvIHdoaWNoIHVzZSB0aGlzIHRvIGZ1bGZpbGwgdGhlIGpvdXJuYWwgcmVz
ZXJ2YXRpb24KZm9yIGV4YW1wbGUuCgpidXQgY29uc2lkZXJpbmcgdGhhdCBzcGVjaWZpYyBtZW1v
cnkgb3ZlcmhlYWQgdXNlIGNhc2VzICh0bwpsaW1pdCBtYXhpbXVtIGxhcmdlIGZvbGlvIG9yZGVy
IGZvciBzbWFsbCBkZXZpY2VzKSwgaXQgc291bmRzCm1vcmUgbGlrZSBhIGdlbmVyaWMgcGFnZSBj
YWNoZSB1c2VyIGludGVyZmFjZSBmb3IgYWxsCmZpbGVzeXN0ZW1zIGluc3RlYWQsIGFuZCBpbiB0
aGUgZWZmZWN0aXZlIG1heGltdW0gb3JkZXIgc2hvdWxkCmNvbWJpbmUgdGhlc2UgdHdvIG1heGlt
dW0gbnVtYmVycy4KClRoYW5rcywKR2FvIFhpYW5nCgo+IAo+IAkJCQkJCQkJSG9uemEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
