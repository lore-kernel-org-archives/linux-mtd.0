Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8ECC87FC8
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jul 2025 03:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2+yz9IjmwbCb0hGYkuWNjG9KYeVlKZnLERXTPb4+joU=; b=Rr+NFEa3NuIuuy
	q0D3t1M1nqVv2xsvchucw3AuoIhTLm/pG0sgaBjAJM+mjqvwExRtQg8pW6XcRrK1aJNPgwMCp3Cby
	1xG5NPqJpLvVsjl6svnowZYsivMqOpshNc+8nEiViPgb1zj3r0hqx3XhsWuqO0xbOo7AWM2tUlsDe
	Q0VeqnlbQB5IkBQzDxO9RjvdAUGJDgJLlMYCwRpCLKWY4JMjfWERHViZCqb0tIQpATw5MbFdVvGLf
	mFhuUYboP8n3VfcdTyRMXJDHX7aXBngnQZ1XR1HjUqONVCAeAR9c7aAjYRKadL8tD8PaYr/GlNEcw
	sOpZV81v6paedpVHcK6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udhEo-0000000G5xs-0xJ4;
	Mon, 21 Jul 2025 03:30:50 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udgyi-0000000G4QW-1MAi
	for linux-mtd@lists.infradead.org;
	Mon, 21 Jul 2025 03:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1753067648; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=lCr7ru8zjyenyzhIwOzkZiA0apFYT5PO1pQKlR1f6Gw=;
	b=fziExLzuV0rwx+GNWyk/aJVvLiw1lgfmtG0LVBGZ/fXM0/0zWxg0EtREi2ma38nXPryOAVmk72zNme1RDevzg4cZAmIbEFy4vq17BzYaoHwhzcXIYN+J2mYubwxO/v6uCpPangEKOAXY+UpHDPG/3hV4FABx7exXkQlz7jwfW3Y=
Received: from 30.221.132.193(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WjIdN4u_1753067645 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 21 Jul 2025 11:14:06 +0800
Message-ID: <7ea73f49-df4b-4f88-8b23-c917b4a9bd8a@linux.alibaba.com>
Date: Mon, 21 Jul 2025 11:14:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Compressed files & the page cache
To: Barry Song <21cnbao@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 linux-btrfs@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-erofs@lists.ozlabs.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
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
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <CAGsJ_4xJjwsvMpeBV-QZFoSznqhiNSFtJu9k6da_T-T-a6VwNw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_201412_856876_CE951ACA 
X-CRM114-Status: GOOD (  14.75  )
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

SGkgQmFycnksCgpPbiAyMDI1LzcvMjEgMDk6MDIsIEJhcnJ5IFNvbmcgd3JvdGU6Cj4gT24gV2Vk
LCBKdWwgMTYsIDIwMjUgYXQgODoyOOKAr0FNIEdhbyBYaWFuZyA8aHNpYW5na2FvQGxpbnV4LmFs
aWJhYmEuY29tPiB3cm90ZToKPj4KCi4uLgoKPj4KPj4gLi4uIGhpZ2gtb3JkZXIgZm9saW9zIGNh
biBjYXVzZSBzaWRlIGVmZmVjdHMgb24gZW1iZWRkZWQgZGV2aWNlcwo+PiBsaWtlIHJvdXRlcnMg
YW5kIElvVCBkZXZpY2VzLCB3aGljaCBzdGlsbCBoYXZlIE1pQnMgb2YgbWVtb3J5IChhbmQgSQo+
PiBiZWxpZXZlIHRoaXMgd29uJ3QgY2hhbmdlIGR1ZSB0byB0aGVpciB1c2UgY2FzZXMpIGJ1dCB0
aGV5IGFsc28gdXNlCj4+IExpbnV4IGtlcm5lbCBmb3IgcXVpdGUgbG9uZyB0aW1lLiAgSW4gc2hv
cnQsIEkgZG9uJ3QgdGhpbmsgZW5hYmxpbmcKPj4gbGFyZ2UgZm9saW9zIGZvciB0aG9zZSBkZXZp
Y2VzIGlzIHZlcnkgdXNlZnVsLCBsZXQgYWxvbmUgbGltaXRpbmcKPj4gdGhlIG1pbmltdW0gZm9s
aW8gb3JkZXIgZm9yIHRoZW0gKEl0IHdvdWxkIG1ha2UgdGhlIGZpbGVzeXN0ZW0gbm90Cj4+IHN1
aXRhYmxlIGFueSBtb3JlIGZvciB0aG9zZSB1c2Vycy4gIEF0IGxlYXN0IHRoYXQgaXMgd2hhdCBJ
IG5ldmVyCj4+IHdhbnQgdG8gZG8pLiAgQW5kIEkgYmVsaWV2ZSB0aGlzIGlzIGRpZmZlcmVudCBm
cm9tIHRoZSBjdXJyZW50IExCUwo+PiBzdXBwb3J0IHRvIG1hdGNoIGhhcmR3YXJlIGNoYXJhY3Rl
cmlzdGljcyBvciBMQlMgYXRvbWljIHdyaXRlCj4+IHJlcXVpcmVtZW50Lgo+IAo+IEdpdmVuIHRo
ZSBkaWZmaWN1bHR5IG9mIGFsbG9jYXRpbmcgbGFyZ2UgZm9saW9zLCBpdCdzIGFsd2F5cyBhIGdv
b2QKPiBpZGVhIHRvIGhhdmUgb3JkZXItMCBhcyBhIGZhbGxiYWNrLiBXaGlsZSBJIGFncmVlIHdp
dGggeW91ciBwb2ludCwKPiBJIGhhdmUgYSBzbGlnaHRseSBkaWZmZXJlbnQgcGVyc3BlY3RpdmUg
4oCUIGVuYWJsaW5nIGxhcmdlIGZvbGlvcyBmb3IKPiB0aG9zZSBkZXZpY2VzIG1pZ2h0IGJlIGJl
bmVmaWNpYWwsIGJ1dCB0aGUgbWF4aW11bSBvcmRlciBzaG91bGQKPiByZW1haW4gc21hbGwuIEkn
bSByZWZlcnJpbmcgdG8gInNtYWxsIiBsYXJnZSBmb2xpb3MuCgpZZWFoLCBhZ3JlZWQuIEhhdmlu
ZyBhIHdheSB0byBsaW1pdCB0aGUgbWF4aW11bSBvcmRlciBmb3IgdGhvc2Ugc21hbGwKZGV2aWNl
cyAocmF0aGVyIHRoYW4gZGlzYWJsaW5nIGl0IGNvbXBsZXRlbHkpIHdvdWxkIGJlIGhlbHBmdWwu
ICBBdApsZWFzdCAic21hbGwiIGxhcmdlIGZvbGlvcyBjb3VsZCBzdGlsbCBwcm92aWRlIGJlbmVm
aXRzIHdoZW4gbWVtb3J5CnByZXNzdXJlIGlzIGxpZ2h0LgoKVGhhbmtzLApHYW8gWGlhbmcKCj4g
Cj4gU3RpbGwsIGV2ZW4gd2l0aCB0aG9zZSwgYWxsb2NhdGlvbiBjYW4gYmUgZGlmZmljdWx0IOKA
lCBlc3BlY2lhbGx5Cj4gc2luY2Ugc28gbWFueSBvdGhlciBhbGxvY2F0aW9ucyAod2hpY2ggYXJl
bid0IGxhcmdlIGZvbGlvcykgY2FuIGNhdXNlCj4gZnJhZ21lbnRhdGlvbi4gU28gaGF2aW5nIG9y
ZGVyLTAgYXMgYSBmYWxsYmFjayByZW1haW5zIGltcG9ydGFudC4KPiAKPiBJdCBzZWVtcyB3ZSdy
ZSBtaXNzaW5nIGEgbWVjaGFuaXNtIHRvIGVuYWJsZSAic21hbGwiIGxhcmdlIGZvbGlvcwo+IGZv
ciBmaWxlcy4gRm9yIGFub24gbGFyZ2UgZm9saW9zLCB3ZSBkbyBoYXZlIHN5c2ZzIGtub2Jz4oCU
dGhvdWdoIHRoZXkKPiBkb27igJl0IHNlZW0gdG8gYmUgdW5pdmVyc2FsbHkgYXBwcmVjaWF0ZWQu
IDotKQo+IAo+IFRoYW5rcwo+IEJhcnJ5CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
