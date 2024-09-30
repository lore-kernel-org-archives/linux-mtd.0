Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8067ACF6498
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 01:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tP5jJD5kqsKfc+Rsc1T08cti5Rz/Hp37qM5bVdULujo=; b=WjzPpKzmF23mCb2BA7g5IY8QD/
	7eSAlFmWpF7mS/Tf6oOydCoMfaQhACyEjMMGFPceP7hPd0vov8KrqLbMijgPO+XYILZc29eiPYEtl
	TY9ni0uItfIRodMQsw4HFiXyR0IF2FXp15TwV7q+tXDGfAgvlOM3Y3Ni4AKRDk1sefG5n8B4dF1ph
	VcP3hbe5w/PXEdyttIFUutsYB6jYowPG7icL/GNce66Hw69k7j4eQzJjsEULunGDSLk3pAhWc1Nkt
	1HyrrqcWFgzWxehOZACe+5MC42weoO+E1UvlNENxxzknZVfNzG/uFQjWtRSi+qJ4JZVQwSNYZkinR
	kOdbqJDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sv5eC-0000000Fgbv-3pn0;
	Mon, 30 Sep 2024 01:56:24 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sv5e9-0000000FgbK-3TF3
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 01:56:24 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XH3wc376Rz1HKR6;
	Mon, 30 Sep 2024 09:52:16 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id F1B76140360;
	Mon, 30 Sep 2024 09:56:11 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 09:56:10 +0800
Subject: Re: [PATCH RFC 2/2] mtd: ubi: add support for protecting critical
 volumes
To: Richard Weinberger <richard@nod.at>, Daniel Golle <daniel@makrotopia.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, robh <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, John Crispin
	<john@phrozen.org>, linux-mtd <linux-mtd@lists.infradead.org>, devicetree
	<devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
References: <e0936674dd1d6c98322e35831b8f0538a5cfa7a3.1727527457.git.daniel@makrotopia.org>
 <b43a7155f80995c3986893951c092291caf3a5f4.1727527457.git.daniel@makrotopia.org>
 <251386789.117942.1727612762462.JavaMail.zimbra@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <ed98871a-b41a-9755-4eed-18ad9e00869c@huawei.com>
Date: Mon, 30 Sep 2024 09:56:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <251386789.117942.1727612762462.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_185622_126552_0A2C7C81 
X-CRM114-Status: GOOD (  15.59  )
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

5ZyoIDIwMjQvOS8yOSAyMDoyNiwgUmljaGFyZCBXZWluYmVyZ2VyIOWGmemBkzoKPiAtLS0tLSBV
cnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+IFZvbjogIkRhbmllbCBHb2xsZSIgPGRhbmllbEBt
YWtyb3RvcGlhLm9yZz4KPj4gQWxsb3cgdGhlIGJvb3QgZmlybXdhcmUgdG8gZGVmaW5lIHZvbHVt
ZXMgd2hpY2ggYXJlIGNyaXRpY2FsIGZvciB0aGUKPj4gc3lzdGVtIHRvIGJvb3QsIHN1Y2ggYXMg
dGhlIGJvb3Rsb2FkZXIgaXRzZWxmIGlmIHN0b3JlZCBpbnNpZGUgYSBVQkkKPj4gdm9sdW1lLiBQ
cm90ZWN0IGNyaXRpY2FsIHZvbHVtZXMgYnkgcHJldmVudGluZyB0aGUgdXNlciBmcm9tIHJlbW92
aW5nLAo+PiByZXNpemluZyBvciB3cml0aW5nIHRvIHRoZW0sIGFuZCBhbHNvIHByZXZlbnQgdGhl
IFVCSSBkZXZpY2UgZnJvbQo+PiBiZWluZyBkZXRhY2hlZCBpZiBhIGNyaXRpY2FsIHZvbHVtZSBp
cyBwcmVzZW50Lgo+IAo+IEkgYWdyZWUgd2l0aCB0aGUgZG91YnRzIHJhaXNlZCBpbiBwYXRjaCAx
LzIsIGlmIHVzZXJzcGFjZSBpcyBzbyBob3N0aWxlCj4gdG8gZGVsZXRlIHN5c3RlbSBwYXJ0aXRp
b25zLCB0aGVyZSBpcyBsaXR0bGUgaG9wZS4KPiBCdXQgSSdtIHN0aWxsIG9wZW4gZm9yIGRpc2N1
c3Npb24uCgpZZXMsIEkgYWdyZWUgdGhhdCBpdCBpcyBtZWFuaW5nZnVsIHRvIHByZXZlbnQgdXNl
ciBmcm9tIG9wZXJhdGluZyAKdm9sdW1lcyBhY2NpZGVudGx5LiBIb3cgYWJvdXQgZG9pbmcgdGhh
dCBieSBzb21lIGV4aXN0aW5nIG1ldGhvZHM/IEVnLiAKc2VsaW51eChEZXNpZ24gc2Vwb2xpY3kg
Zm9yIGlvY3RsIGNtZCkuCj4gCj4gV2hhdCBJIHZldG8gaXMgcHJldmVudGluZyBkZXRhY2guCj4g
VGhpcyBtYWtlcyBhIGNsZWFuIHRlYXIgZG93biBvZiB0aGUgc3lzdGVtIGltcG9zc2libGUuCj4g
SXQgYmVjb21lcyBtb3JlIGFuZCBtb3JlIGNvbW1vbiB0aGF0IGFkdmFuY2VkIHVzZXJzcGFjZSBz
aHV0cyBkb3duCj4gZXZlcnl0aGluZyBpdCBzZXR1cCBkdXJpbmcgYm9vdC4gZS5nLiB3aGlsZSBy
ZWJvb3Qgc3dpdGNoaW5nIGJhY2sKPiB0byBhbiBpbml0cmFtZnMsIHVtb3VudGluZyByb290LCBz
aHV0dGluZyBkb3duIGFsbCBzdG9yYWdlLCBldGMuLi4KPiAKPiBUaGFua3MsCj4gLy9yaWNoYXJk
Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCj4gCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
