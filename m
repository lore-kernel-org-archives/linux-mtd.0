Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1218B606A321
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2026 01:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EBek5ZKe;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=u8WJaF3q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=d8OEqkt4Mc0j6c9cGtcugn7+arNLUZeF/9P14xBuH+M=; b=EBek5ZKeRpOB3Dqi7zFIHg/rZO
	eVi9GKhwMThQEe/d3zqO/b9E80h54SHGnctmRKhV5pGkyWqyz3YTO0UbPGayB7XbINQhAwziLtwsp
	eLxZj3lNgKiaYK8tB6NoPzxopBSIke5MayCBOR0sW1oGAhwq4EPRamKaIY2BOxinvIOoC6cVcl+Zz
	dPhe4gfYbn3QnoHqRIYsuDyolcGXlFJ4gldyvQbDpb97kEs4ohlhiR+P2KUPbBC9vW6HWVp5877VY
	MFRh6HDcZdOkjVu54ftK/IXey/gFWlOf0u7ERq4/p0xHTacipxRffsNPx3dMFUQf1SCb3Fz0dQz0p
	sYlyeAfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxXO-00000005Ofb-3uEM;
	Wed, 11 Nov 2026 01:54:10 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxXK-00000005OfA-1wda
	for linux-mtd@lists.infradead.org;
	Wed, 11 Nov 2026 01:54:09 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3j8i2RMfXjq7ikEdRoC0M7EhfQxRKXJ1iTD8fT2y+DU=;
	b=u8WJaF3qwa/K+ecI0wenMsNXgYb0HrhprmHkE4QJODjrBSe4+EjL0OlYwiEG9frJzY+4PPxby
	qRrA9VhuhNZ4ggwJdtZrkD6d3YGfwh7W6Pdcao/OwZASKxUTbOa+r99DHhX+1mx0w7PHC/IOtLO
	utdxMg8JLCv/gqi4hb5i1Kc=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jPRQ61DyGzKm6m;
	Wed, 11 Nov 2026 09:53:50 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id F100C4055B;
	Wed, 11 Nov 2026 09:53:59 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 11 Nov 2026 09:53:57 +0800
Subject: Re: [PATCH v2 28/34] ubifs: don't set SB_RDONLY after errors
To: Christian Brauner <brauner@kernel.org>, <linux-fsdevel@vger.kernel.org>,
	Jan Kara <jack@suse.com>
CC: Al Viro <viro@zeniv.linux.org.uk>, <ecryptfs@vger.kernel.org>,
	<linux-ext4@vger.kernel.org>, <jfs-discussion@lists.sourceforge.net>,
	<linux-nilfs@vger.kernel.org>, <exfat@lists.linux.dev>, <linux-mm@kvack.org>,
	<ntfs@lists.linux.dev>, <ocfs2-devel@lists.linux.dev>,
	<linux-btrfs@vger.kernel.org>, <gfs2@lists.linux.dev>,
	<linux-efi@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<linux-xfs@vger.kernel.org>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-28-2f44f64f0b66@kernel.org>
 <0d472865-6cbb-cbb5-b361-1f2bf71dd528@huawei.com>
 <20261110-erfanden-dossier-zahntechnik-efcb7a6439b0@brauner>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <7cc1871c-9209-51ee-9d0e-c46e5adfaf1e@huawei.com>
Date: Wed, 11 Nov 2026 09:53:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261110-erfanden-dossier-zahntechnik-efcb7a6439b0@brauner>
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_175406_689468_503632AA 
X-CRM114-Status: GOOD (  15.46  )
X-Spam-Score: -3.8 (---)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYvMTEvMTEgNTo1NCwgQ2hyaXN0aWFuIEJyYXVuZXIg5YaZ6YGTOgo+IE9uIEZyaSwg
T2N0IDMwLCAyMDI2IGF0IDExOjQyOjE1QU0gKzA4MDAsIFpoaWhhbyBDaGVuZyB3cm90ZToKPj4g
SWYgd2UgcmVtb3ZlIHRoZSBjLT5yb19lcnJvciBjaGVjaywgdWJpZnNfcmVtb3VudF9yby0+dWJp
ZnNfd2J1Zl9zeW5jCj4+IHdpbGwgcmV0dXJuIEVST0ZTIGFuZCB0cmlnZ2VyIHViaWZzX3JvX21v
ZGUoKSBhZ2FpbiwgSSB0aGluayB3ZSBjYW4KPj4gcmV0YWluIHRoZSBwcmUtY2hlY2sgcGxhY2Vt
ZW50IHRvIHRyaWdnZXIgbW9yZSBlcnJvciBwcmludGluZy4KPiAKPiB1Ymlmc19yb19tb2RlKCkg
ZG9lc24ndCBkbyBhbnl0aGluZyBvbmNlIGMtPnJvX2Vycm9yIGlzIHNldCBzbyB0aGF0Cj4gd29u
J3QgcHJpbnQgYW55dGhpbmcgYWdhaW4uIEJ1dCB0aGVyZSdzIG5vIHBvaW50IGluIHN5bmNpbmcg
dGhlCj4gd3JpdGUtYnVmZmVycyBhbmQgd3JpdGluZyB0aGUgbWFzdGVyIG5vZGUgYWZ0ZXIgYW4g
ZXJyb3IuCj4gCkFncmVlZAo+IFNvIEknbGwgc2tpcCBib3RoIGluIHViaWZzX3JlbW91bnRfcm8o
KSB3aGVuIGMtPnJvX2Vycm9yIGlzIHNldCBsaWtlCj4gdWJpZnNfcHV0X3N1cGVyKCkgZG9lcyBh
bmQgb25seSBjYW5jZWwgdGhlIHdyaXRlLWJ1ZmZlciB0aW1lcnMuIFRoZQo+IHJlbW91bnQgdG8g
cmVhZC1vbmx5IGl0c2VsZiBoYXMgdG8ga2VlcCB3b3JraW5nIGJlY2F1c2UgdGhlIGVycm9yCj4g
ZG9lc24ndCBzZXQgU0JfUkRPTkxZIGFueW1vcmUuCkFncmVlZC4KCj4gCj4+IEJUVywgYSByZW1v
dW50IHRvIHJlYWQtd3JpdGUgYWZ0ZXIgYW4gZXJyb3IgaXMgcmVmdXNlZCB0b28uCj4gCj4gT25s
eSBpZiBjLT5yb19tb3VudCBpcyBzZXQuIHViaWZzX3JvX21vZGUoKSBzZXRzIFNCX1JET05MWSBi
dXQgbmV2ZXIKPiBjLT5yb19tb3VudC4gU28gYWZ0ZXIgYW4gZXJyb3Igb24gYSByZWFkLXdyaXRl
IG1vdW50IHViaWZzX3JlY29uZmlndXJlKCkKPiB0YWtlcyBuZWl0aGVyIGJyYW5jaCBhbmQgcmVj
b25maWd1cmVfc3VwZXIoKSBjbGVhcnMgU0JfUkRPTkxZIGFnYWluLgpPaCwgSSB1bmRlcnN0YW5k
IG5vdywgeW91IG1lYW4gdGhlIFNCX1JET05MWSBmbGFnIGluIHZmcyBsYXllci4KPiAKPj4gVGhl
IHNiX3Jkb25seSB3b24ndCBhZmZlY3QgdGhlIHN5bmNfZnNfb25lX3NiKCkgYWZ0ZXIgYW4gZXJy
b3IsIGFuZAo+PiBzYl9lbWVyZ2VuY3lfcm8gY2hlY2sgaW4gbm90IGFkZGVkIGludG8gc3luY19m
c19vbmVfc2IsIHNob3VsZCB3ZSBhZGQKPj4gdGhlIGMtPnJvX2Vycm9yIGNoZWNrIGluIHViaWZz
X3N5bmNfZnMoKSB0byBwcmV2ZW50IHRoZSBmYWlsdXJlCj4+IHViaWZzX3didWZfc3luYyBleGVj
dXRpbmc/Cj4gCj4gWWVzLCBJJ2xsIHJldHVybiAtRVJPRlMgZnJvbSB1Ymlmc19zeW5jX2ZzKCkg
d2hlbiBjLT5yb19lcnJvciBpcyBzZXQuCj4gQWZ0ZXIgdGhlICF3YWl0IGNoZWNrIHNvIHN5bmNf
ZmlsZXN5c3RlbSgpIHN0aWxsIGdldHMgdG8gc3luY19pbm9kZXNfc2IoKS4KR3JlYXQuCj4gCj4g
Lgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
