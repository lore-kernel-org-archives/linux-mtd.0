Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7545AC3ABBE
	for <linux-mtd@archiver.kernel.org>; Thu,  8 May 2025 09:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sl+Qj1QjX6In73Xn9Z9kz5G8A3rej6vNFhAOJeTBqjI=; b=PTqy9xKXiBU9J7
	PKEtUfFDWbCjqcY3hrE/z6s2ncanN3efgGqxhWryVCPnk18HbHtgbm1wdF5RkOKKe1nbHNkkRTfEE
	sl7w8yFkZA4sWgWBl9Cs2J1hbifda/OUQ09TppqD0HEsCLkBH3mUViOos0918WonzUIzQEz5dR8tb
	J4skWZzXOhLBVl6rNpMj+bcWn+E5rwwpFPzA3lM70PcnRGzgj2INQHuIFFrv+0AwZqc/1rmc1uvc+
	/53bWF3XJr27ozbqaZDnlOfue2iE8l4n7RBNCf/V44MGF5AZgjJel7fe8afQtf45RPZoPT+7Nfria
	aSVI7xcf3nbmJGTZcIbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxxL-00000000Jan-3d0h;
	Thu, 08 May 2025 09:54:19 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxm9-00000000HnT-3TqH
	for linux-mtd@lists.infradead.org;
	Thu, 08 May 2025 09:42:47 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 7F20EA0402;
	Thu,  8 May 2025 11:42:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=FqcpfxV/1MzYuJfxO/fU
	aFYv5o/e4eUrzT9SJNKucj8=; b=j3sU1py5rlsFW59UcDLeXlEUpgqOgu4nEeMS
	jC2iKRwqy8LB1h/AjpluSZIg1PXou45w+xl9DtRSuHA0dXXjF31SHR5mBDPE2L5J
	MbDdZAiV47WOrRMt7oNrkiESYRI6IPf0PR9UVXX9j2oWoPCW4pagUypcjejq9QUy
	lrd/DjzBMyUVGYNAnru4hWF1XPN2MMdbjZpoSQIWQqoAdCFLlFX0SZLpVbvx7nGK
	iU9l1gueruqDgOTZDZ7yroaUf4Y39vm0zodXpVublUn8nwWxO2lVBm+kAqMaK7Gv
	/XjZujOkPXX0sgRnsweh/yrkj+v07H9QsxFpbjhS0e2VRasj7meMmMoU5V0hsQLc
	tjjt7VhcS6B+97EvqA4IYaKm++22VG2RPKG/mLbhJqyQ68qGGFWzUh8OpKpPXS7j
	+q0ETr5IfaxISJNFOY5cq+G8YXbfkrxkpN2ZRhL6JDSBYHwJIScQBrz7HkBBFTPi
	gxEklY1occ0nihfMcLRpx6ej0PR6Q8v8BdM2eIp/NKLJJH7eNcyMnVx5R7cYjWoS
	EhDoQp4NF7+ktNSAPSTLeF3IGNmyO/w2OR4YT7n1gMnydOszc+3NNZQd8KdUyJoU
	kBiuhRJYgkDLzpUFCzbQii/vwuqO4xEiBw3sFNGM3LU6/ZFCPtfei5QlSGgumo2b
	JqppW68=
Message-ID: <1f5412e0-f332-428f-899f-26ca06a3b0a4@prolan.hu>
Date: Thu, 8 May 2025 11:42:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi-nor: Verify written data in paranoid mode
To: Richard Weinberger <richard@nod.at>
CC: Michael Walle <mwalle@kernel.org>, linux-mtd
	<linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	=?UTF-8?Q?Tam=C3=A1s_Szentendrei?= <szentendrei.tamas@prolan.hu>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, pratyush <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20250415180434.513405-1-csokas.bence@prolan.hu>
 <D981O3AA6NK9.2EEVUPM62EV6S@kernel.org>
 <dd3c7cc0-a568-4046-b105-e6786b5c80f8@prolan.hu>
 <373620122.295980015.1744808943985.JavaMail.zimbra@nod.at>
 <c56c52c0-a824-4ad7-9847-e0e973f811ed@prolan.hu>
 <81225127.297167214.1744828878236.JavaMail.zimbra@nod.at>
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <81225127.297167214.1744828878236.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94853667266
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_024246_330493_A0137C5F 
X-CRM114-Status: GOOD (  14.23  )
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

SGkgUmljaGFyZCwKCk9uIDIwMjUuIDA0LiAxNi4gMjA6NDEsIFJpY2hhcmQgV2VpbmJlcmdlciB3
cm90ZToKPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+IFZvbjogIkNzw7Nrw6Fz
IEJlbmNlIiA8Y3Nva2FzLmJlbmNlQHByb2xhbi5odT4KPj4+IEknbSBub3Qgc28gc3VyZSB3aGV0
aGVyIGl0IG1ha2VzIHNlbnNlIGF0IGFsbC4KPj4+IEluIGl0J3MgY3VycmVudCBmb3JtLCB0aGVy
ZSBpcyBubyByZWNvdmVyeS4gU28gYW55dGhpbmcgbm9uLXRyaXZpYWwKPj4+IG9uIHRvcCBvZiB0
aGUgTVREIHdpbGwganVzdCBzZWUgYW4gLUVJTyBhbmQgaGFzIHRvIGdpdmUgdXAuCj4+PiBFLmcu
IGEgZmlsZXN5c3RlbSB3aWxsIHJlbW91bnQgcmVhZC1vbmx5Lgo+Pgo+PiBJbiBvdXIgY2FzZSwg
d2UgdXNlIFVCSUZTIG9uIHRvcCBvZiBVQkksIHdoaWNoIGluIHRoaXMgY2FzZSBjaG9vc2VzCj4+
IGFub3RoZXIgZXJhc2VibG9jayB0byBob2xkIHRoZSBkYXRhIGluc3RlYWQsIHRoZW4gcmUtdGVz
dHMgKGVyYXNlK3dyaXRlCj4+IGN5Y2xlcykgdGhlIG9uZSB3aGljaCBnYXZlIC1FSU8uIFNpbmNl
IHRoZSBidXMgZXJyb3IgaXMgb25seSB0cmFuc2llbnQsCj4+IGl0IGdvZXMgYXdheSBieSB0aGlz
IHRpbWUsIGFuZCB0aHVzIFVCSUZTIHdpbGwgcmVjb3ZlciBmcm9tIHRoaXMgY2xlYW5seS4KPiAK
PiBBcmUgeW91IHN1cmUgYWJvdXQgdGhhdD8KPiAKPiBJJ2QgZXhwZWN0IFVCSSB0byBnbyBpbnRv
IFJPIG1vZGUgdmlhIGEgY2FsbCBwYXRoIGxpa2U6Cj4gdWJpX2ViYV93cml0ZV9sZWIoKSAtPiB1
YmlfaW9fd3JpdGUoKSAtPiBtdGRfd3JpdGUoKQo+IElmIG10ZF93cml0ZSgpIHJldHVybnMgYW4g
RUlPLCBVQkkgd2lsbCBnbyBpbnRvIFJPIG1vZGUgaW1tZWRpYXRlbHkuCj4gCj4gKEknbSBhc3N1
bWluZywgeW91ciBTUEktTk9SIGhhcyBubyBiYWQgYmxvY2sgc3VwcG9ydCwgc28gdWJpLT5iYWRf
YWxsb3dlZAo+IGlzIGZhbHNlKS4KCllvdSBhcmUgcmlnaHQsIGluIG91ciBjYXNlIHdlIGhhZCB0
byBwYXRjaCBiYWRfYWxsb3dlZCB0byBiZSB0cnVlLiBCdXQgCnRoZSBwb2ludCBpcywgdGhhdCBV
QklGUyBfZG9lc18gZ2V0IG5vdGlmaWVkLCBhbmQgaXQgX2RvZXNfIGdvIGludG8gUk8gCm1vZGUs
IGluc3RlYWQgb2YgZ2V0dGluZyBzdWNjZXNzIGZyb20gbXRkX3dyaXRlKCksIGV2ZW4gdGhvdWdo
IHRoZSAKd3JpdHRlbiBkYXRhIHdhcyBjb3JydXB0ZWQuCgpPbiAyMDI1LiAwNC4gMTYuIDE0OjM4
LCBDc8Oza8OhcyBCZW5jZSB3cm90ZToKID4gV2UgX2NvdWxkXyBtYWtlIGl0IE1URC13aWRlLCBp
biBvdXIgY2FzZSB3ZSBvbmx5IGhhdmUgYSBOT1IgRmxhc2gKID4gb25ib2FyZCBzbyB0aGlzIGlz
IHdoZXJlIHdlIGFkZGVkIGl0LiBJZiBpdCB3ZXJlIGluIHRoZSBNVEQgY29yZSwgd2hlcmUKID4g
d291bGQgaXQgbWFrZSBzZW5zZT8KID4KID4gKiBtdGRfd3JpdGUoKQogPiAqIG10ZF93cml0ZV9v
b2IoKQogPiAqIG10ZF93cml0ZV9vb2Jfc3RkKCkKID4gKiBvciBzb21ld2hlcmUgZWxzZSBlbnRp
cmVseT8KCkknbSBub3cgc3RhcnRpbmcgdG8gdGhpbmsgbXRkX3dyaXRlX29vYigpIHdvdWxkIGJl
IHRoZSByaWdodCBwbGFjZSBmb3IgCml0LiBUaG91Z2h0cz8KCkJlbmNlCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
