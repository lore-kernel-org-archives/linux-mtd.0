Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72D4C678D5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 09:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Sg150czb71pCIJXF3ujGEukcc69xcKpiyEWTZhJRhA=; b=G+1fIEuWAF/eoa
	vfUQEZEHGRXCXbEWrORNxBimafx5J6is1plbYMovRzG75KWdi+R4f+Z2XpmOF3rf1CiqS/OcOJuYD
	7y3k72NTM7Mi/5ZyabQS2MaR2X7UUrZhrhy7ZcfiQ16A6PgiSxClblqFF4p2dbA4Op/8FtvDdlv0u
	THXYwSVy6iBiuv8JDZbh732IQRwuB2/FPph2Sp9QBojf1V/e8MsMuu8+DY4AmoA+PIPPqJiMrQ56N
	c3Ljm1O7yZm0wdzWmAJ/JCe9rC+uWm5DmWNCtDxX7pqSKvf4Cq6JDDVxxXKxO7IpjpJsL3EcVVH7z
	rRxVLBpYHOYWat4aI28Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTEr-00GpYV-AQ; Tue, 07 Mar 2023 09:04:05 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTEn-00GpVO-LH
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2023 09:04:04 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 43BCE2000B;
	Tue,  7 Mar 2023 09:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678179833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lWnZbQ74txk8fmZIzwltqIy3VGDLFLIoD4qJMLHcs9Q=;
	b=AB8OTewy2WxToW9EIlO9ll68NNpEnvsLM6dwAkzbF8VXcC6yG5UIH+cipbDuAO4GocKFib
	A0XFjscqDG26hgdaKiqFbVTr49wyxAA6AKraiMfuUSDhYiYYIdGYpQvWUErCPRq7NO7BnA
	pJ1gTAo8o5+so1XRs+iMyIMTxFpED6mPzOnm/6kGALJNIQ6LcNqpKTA9WARgTzaDsJaacH
	jRvwNJrlxx85yQBQcJ7n3pCF2s1yqlzNLDe7msOrrniDHC2MJRIYwG8o9ojZvcQ+bAjlhK
	vMixj94XbsAxPSffJqwq2hvINHUo9FkHve5ePUsXZqwLCxgVrIaagJLzxQAvSA==
Date: Tue, 7 Mar 2023 10:03:50 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: parsers: remove reference to config MTD_NAND_TMIO
Message-ID: <20230307100350.1c0af7b9@xps-13>
In-Reply-To: <20230307074038.17391-1-lukas.bulwahn@gmail.com>
References: <20230307074038.17391-1-lukas.bulwahn@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_010401_846470_A930034F 
X-CRM114-Status: GOOD (  17.51  )
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

SGkgTHVrYXMsCgpsdWthcy5idWx3YWhuQGdtYWlsLmNvbSB3cm90ZSBvbiBUdWUsICA3IE1hciAy
MDIzIDA4OjQwOjM4ICswMTAwOgoKPiBDb21taXQgNTY4NDk0ZGI2ODA5ICgibXRkOiByZW1vdmUg
dG1pb19uYW5kIGRyaXZlciIpIHJlbW92ZXMgdGhlIGNvbmZpZwo+IE1URF9OQU5EX1RNSU8gYW5k
IGl0cyBjb3JyZXNwb25kaW5nIGRyaXZlci4KPiAKPiBSZW1vdmUgdGhlIHJlZmVyZW5jZSBpbiBN
VERfU0hBUlBTTF9QQVJUUyB0byB0aGF0IHJlbW92ZWQgY29uZmlnLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEx1a2FzIEJ1bHdhaG4gPGx1a2FzLmJ1bHdhaG5AZ21haWwuY29tPgo+IC0tLQo+IEFybmQs
IHBsZWFzZSBhY2suCj4gTWlxdWVsLCBwbGVhc2UgcGljayB0aGlzIG1pbm9yIG5vbi11cmdlbnQg
cGF0Y2ggb24gdG9wIG9mIHRoZSBjb21taXQgYWJvdmUuCgpBY3R1YWxseSBJIGd1ZXNzIHRoZSBT
SEFSUFNMIGRyaXZlciBpcyBub3Qgc2VsZWN0YWJsZSByaWdodCBub3csIHNvCnRoaXMgc2hvdWxk
IGJlIHNlbnQgYXMgcGFydCBvZiBteSBuZXh0IGZpeGVzIFBSLiBDb3VsZCB5b3UgcGxlYXNlIHNl
bmQKYSB2MiB3aXRoIGEgRml4ZXM6IHRhZz8KCj4gCj4gIGRyaXZlcnMvbXRkL3BhcnNlcnMvS2Nv
bmZpZyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3BhcnNlcnMvS2NvbmZpZyBiL2RyaXZl
cnMvbXRkL3BhcnNlcnMvS2NvbmZpZwo+IGluZGV4IGIyMGUwYzM4YjUxNy4uNjA3MzhlZGNkNWQ1
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3BhcnNlcnMvS2NvbmZpZwo+ICsrKyBiL2RyaXZl
cnMvbXRkL3BhcnNlcnMvS2NvbmZpZwo+IEBAIC0xNDksNyArMTQ5LDcgQEAgY29uZmlnIE1URF9Q
QVJTRVJfVFJYCj4gIAo+ICBjb25maWcgTVREX1NIQVJQU0xfUEFSVFMKPiAgCXRyaXN0YXRlICJT
aGFycCBTTCBTZXJpZXMgTkFORCBmbGFzaCBwYXJ0aXRpb24gcGFyc2VyIgo+IC0JZGVwZW5kcyBv
biBNVERfTkFORF9TSEFSUFNMIHx8IE1URF9OQU5EX1RNSU8gfHwgQ09NUElMRV9URVNUCj4gKwlk
ZXBlbmRzIG9uIE1URF9OQU5EX1NIQVJQU0wgfHwgQ09NUElMRV9URVNUCj4gIAloZWxwCj4gIAkg
IFRoaXMgcHJvdmlkZXMgdGhlIHJlYWQtb25seSBGVEwgbG9naWMgbmVjZXNzYXJ5IHRvIHJlYWQg
dGhlIHBhcnRpdGlvbgo+ICAJICB0YWJsZSBmcm9tIHRoZSBOQU5EIGZsYXNoIG9mIFNoYXJwIFNM
IFNlcmllcyAoWmF1cnVzKSBhbmQgdGhlIE1URAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
