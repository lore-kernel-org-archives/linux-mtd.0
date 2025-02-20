Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FCDC021B1
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Feb 2025 14:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVbYpqgznEzvG2esmmY0aWiD+EBs/90Kal131KCj+WM=; b=36d+3POqb40SXod3k3rJHAXdm7
	oIE96iLnobAyzusxtaUagzwIj2IJUkln3OXmo40VBunw2tmXTIbKi0OLgOJIPRaBHDcnCceYoDUBM
	8TRYU4weLfMci7A6es6+ye/7ndc7sDYWMeTC+k3Zd1JWWvVuK+IyRrUHJ98fDiKPirVafE6hgZoox
	peMvXNdTnHfYtXqqFXNh2nivbZ31WWOBzP3CrM9WjxMFq+7Tl5Q0KeRdqMuF8VXFc4Y8J63FlYJcs
	IqYZJOnBBLZJOtcxxFyQdMEGHhv0c1p30Z3bE94/tFubAS1XWqvbXr8Wb4aG82OjtmjMKMOMAOnDR
	YBnwzgvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7Hx-00000001Err-0Fqq;
	Thu, 20 Feb 2025 14:12:29 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7Ao-00000001CwJ-0bG5
	for linux-mtd@lists.infradead.org;
	Thu, 20 Feb 2025 14:05:07 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4YzFJc1tm5z1TCkm;
	Thu, 20 Feb 2025 22:00:16 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id BDAF61802D2;
	Thu, 20 Feb 2025 22:04:53 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 20 Feb 2025 22:04:52 +0800
Subject: Re: [ANNOUNCE] mtd-utils-2.3.0 is released
To: Miquel Raynal <miquel.raynal@bootlin.com>, David Oberhollenzer
	<david.oberhollenzer@sigma-star.at>
CC: MTD Mailing List <linux-mtd@lists.infradead.org>, Buildroot Mailing List
	<buildroot@busybox.net>, "Josh Boyer (Fedora)"
	<mtd-utils-maintainers@fedoraproject.org>, "Bastian Germann (Debian)"
	<bage@debian.org>, "(Rosa Linux)" <a.proklov@rosalinux.ru>, Embedded Gentoo
	<embedded@gentoo.org>, "Robin H. Johnson" <robbat2@gentoo.org>, "John
 (OpenWRT)" <john@phrozen.org>, "Michael Tross (T2 SDE)" <michael@tross.org>,
	"Oliver Schinagl (Alpine)" <oliver@schinagl.nl>, "Orphaned (Void Linux)"
	<orphan@voidlinux.org>, "Sergey Bolshakov (ALT Linux)"
	<sbolshakov@altlinux.org>, "Silvan Calarco (openmamba)"
	<silvan.calarco@mambasoft.it>, "Viric (nixpkgs)" <viric@viric.name>, "Pascal
 Bleser (SUSE)" <pascal.bleser@opensuse.org>, "Levente Polyak (Arch)"
	<anthraxx@archlinux.org>, =?UTF-8?Q?Llu=c3=ads_Batlle_i_Rossell_=28NixOS=29?=
	<shaba@altlinux.org>, Richard Weinberger <richard@nod.at>
References: <1b7a55a6-1c5b-4e86-8006-e2010e54367e@sigma-star.at>
 <87zfigk9ai.fsf@bootlin.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <016049d9-c15e-ee5f-e69a-4e5a6d351613@huawei.com>
Date: Thu, 20 Feb 2025 22:04:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <87zfigk9ai.fsf@bootlin.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_060506_370973_68D68E62 
X-CRM114-Status: GOOD (  16.74  )
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

5ZyoIDIwMjUvMi8yMCAyMTo1OCwgTWlxdWVsIFJheW5hbCDlhpnpgZM6Cj4gSGVsbG8gRGF2aWQs
Cj4gCj4gK1poaWhhbwo+IAo+IE9uIDE1LzAyLzIwMjUgYXQgMTc6MDU6NTMgKzAxLCBEYXZpZCBP
YmVyaG9sbGVuemVyIDxkYXZpZC5vYmVyaG9sbGVuemVyQHNpZ21hLXN0YXIuYXQ+IHdyb3RlOgo+
IAo+PiBIaSwKPj4KPj4gbXRkLXV0aWxzLTIuMy4wIGlzIHJlbGVhc2VkLgo+IAo+IFRoYW5rcyBh
IGxvdCBmb3IgdGhpcyBuZXcgcmVsZWFzZSEgSSB3YW50ZWQgdG8gYnVtcCB0aGUgcGFja2FnZSB2
ZXJzaW9uCj4gaW4gQnVpbGRyb290IGJ1dCBJIGdvdCBpc3N1ZXMsIHBlcmhhcHMgeW91IGNhbiBo
ZWxwLgo+IAo+IEEgcmVndWxhciBgLi9jb25maWd1cmUgLS1ob3N0PTxhcm0+ICYmIG1ha2VgIHdv
cmtzIHdlbGwgd2hlbiBjbG9uaW5nIHRoZQo+IEdpdCByZXBvc2l0b3J5LCBob3dldmVyIEJ1aWxk
cm9vdCB1c2VkIHRvIGRvd25sb2FkIHRoZSB0YXJiYWxsLCB3aGljaCBpbgo+IHByYWN0aWNlIGRv
ZXMgbm90IGNvbnRhaW4gYWxsIHRoZSAuZ3ogZmlsZXM6Cj4gaHR0cHM6Ly9naXQuaW5mcmFyb290
LmF0L210ZC11dGlscy5naXQvdHJlZS90ZXN0cy91Ymlmc190b29scy10ZXN0cy9pbWFnZXMKPiAK
PiBUaGlzIG9mIGNvdXJzZSBsZWFkcyB0byBhIGJ1aWxkIGZhaWx1cmU6Cj4gbWFrZVsxXTogKioq
IE5vIHJ1bGUgdG8gbWFrZSB0YXJnZXQgJ3Rlc3RzL3ViaWZzX3Rvb2xzLXRlc3RzL2ltYWdlcy9n
b29kLmd6JywgbmVlZGVkIGJ5ICdhbGwtYW0nLiAgU3RvcC4KPiAKPiBUaGUgY29tbWl0cyBmcm9t
IFpoaWhhbyBhY3R1YWxseSBsaXN0IHRoZXNlIC5neiBmaWxlcyBpbiB0aGUgLmFtIGZpbGVzLAo+
IGFuZCB0aGV5IGFsc28gYXBwZWFyIGluIHRoZSBNYWtlZmlsZS5pbiBhcwo+IAo+ICAgICAgQEJV
SUxEX1RFU1RTX1RSVUVAYW1fX2FwcGVuZF8yMgo+IAo+IHlldCB0aGV5IGFyZSBub3QgcGFydCBv
ZiB0aGUgZmluYWwgZGlzdHJpYnV0ZWQgdGFyYmFsbC4gQW55IGlkZWEgaG93IHRvCj4gZml4IHRo
YXQgcHJvcGVybHk/CgpIaSBNaXF1ZWwsIHNvcnJ5IGZvciBpbnRyb2R1Y2luZyB0aGUgcHJvYmxl
bS4gSXQgY291bGQgYmUgZml4ZWQgYnkgdGhpcyAKcGF0Y2g6CgpodHRwczovL3BhdGNod29yay5v
emxhYnMub3JnL3Byb2plY3QvbGludXgtbXRkL3BhdGNoLzIwMjUwMjIwMTEyNTU0LjIxNTAwNDYt
MS1tLm9sYnJpY2hAcGVuZ3V0cm9uaXguZGUvCj4gCj4gVGhhbmtzIQo+IE1pcXXDqGwKPiAuCj4g
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
