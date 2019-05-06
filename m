Return-Path: <SRS0=tMSz=TG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E876C04AAB
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 08:10:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0CDD2082F
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 08:10:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IoWWzyRq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0CDD2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5sCSD5ObWjR7A+72RhRecFFJPkN56E3gdVA8rpbS1g=; b=IoWWzyRqMePS/g
	/Ag0FRcOUCSgDVJF2Me7ATLPee8YEjqPnLJQwGsw+cL/DOtpoAkAQR7I2wOYZc6VcTL+nvmQmt7x0
	1j+MN/X3RHuuQmd1ZPn+MTDz1JxTXZo5W3Dmo299GVxsx2QiVyUQMR252uWDrJbEDRnuiK4ZK/iOq
	VxDqGhk6JpLdFLXMg40gblDNPVhAhbAtX/qqoA60gzXjlT6WrJ0PNNpgaauZw58onukEACZdbPLhB
	p7qkIMkbZPVFW4F4Nz9edLlY+QS+qpVbBxy6ySyrxHjT0rZ0Dxm/peDoURuwt8fa5Q7KsbLFjtsmv
	JyHdkKh56eRjsdwxl94g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNYhb-0008HU-Jk; Mon, 06 May 2019 08:10:23 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNYhV-00073m-6S; Mon, 06 May 2019 08:10:19 +0000
X-Originating-IP: 90.88.149.145
Received: from xps13 (aaubervilliers-681-1-29-145.w90-88.abo.wanadoo.fr
 [90.88.149.145]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id ED8DDFF814;
 Mon,  6 May 2019 08:09:17 +0000 (UTC)
Date: Mon, 6 May 2019 10:09:16 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: xiaolei li <xiaolei.li@mediatek.com>
Subject: Re: [RFC PATCH v3 1/1] mtd: rawnand: mtk: Re-license MTK NAND
 driver as Dual MIT/GPL
Message-ID: <20190506100916.33b7c103@xps13>
In-Reply-To: <1557104180.26455.89.camel@mhfsdcap03>
References: <20190429085116.60081-1-xiaolei.li@mediatek.com>
 <20190429085116.60081-2-xiaolei.li@mediatek.com>
 <82cc648b1e92d5ed6876b025a2da1821@milecki.pl>
 <1557047534.26455.81.camel@mhfsdcap03>
 <79539034414767c95e456a79391a18e7@milecki.pl>
 <1557104180.26455.89.camel@mhfsdcap03>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190506_011017_543565_BBCB1EB2 
X-CRM114-Status: GOOD (  19.04  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: daniel.thompson@linaro.org, ryder.lee@mediatek.com,
 srv_heupstream@mediatek.com, richard@nod.at, jorge.ramirez-ortiz@linaro.org,
 yingjoe.chen@mediatek.com, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, yellowriver2010@hotmail.com,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgeGlhb2xlaSwKCnhpYW9sZWkgbGkgPHhpYW9sZWkubGlAbWVkaWF0ZWsuY29tPiB3cm90ZSBv
biBNb24sIDYgTWF5IDIwMTkgMDg6NTY6MjAKKzA4MDA6Cgo+IEhpIFJhZmFsLAo+IAo+IE9uIFN1
biwgMjAxOS0wNS0wNSBhdCAxNzowNiArMDIwMCwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+ID4g
T24gMjAxOS0wNS0wNSAxMToxMiwgeGlhb2xlaSBsaSB3cm90ZTogIAo+ID4gPiBVcCB0byBub3cs
Cj4gPiA+IFhpYW9sZWkgTGkgPHhpYW9sZWkubGlAbWVkaWF0ZWsuY29tPiAodGhlIGF1dGhvciBh
bmQgbWFqb3IgCj4gPiA+IGNvbnRyaWJ1dG9yKSwKPiA+ID4gSm9yZ2UgUmFtaXJlei1PcnRpeiA8
am9yZ2UucmFtaXJlei1vcnRpekBsaW5hcm8ub3JnPiAodGhlIGF1dGhvciBhbmQKPiA+ID4gbWFq
b3IgY29udHJpYnV0b3IpLAo+ID4gPiBSeWRlciBMZWUgPHJ5ZGVyLmxlZUBtZWRpYXRlay5jb20+
IChkZXZlbG9wZXIpLAo+ID4gPiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+IChk
ZXZlbG9wZXIpCj4gPiA+IHNlbnQgQUNLIGZvciB0aGlzIFJGQyBwYXRjaC4KPiA+ID4gCj4gPiA+
IE1heSBJIGFzayBpZiBpdCBpcyBlbm91Z2ggdG8gYWNjZXB0IHRoaXMgY2hhbmdlPyBPciBzaG91
bGQgSSB3YWl0IGZvcgo+ID4gPiBvdGhlciBkZXZlbG9wZXIncyByZXNwb25zZT8gIAo+ID4gCj4g
PiBJIGNhbid0IGltYWdpbmUgcmUtbGljZW5zaW5nIHNvbWVvbmUncyB3b3JrIHdpdGhvdXQgYSBw
ZXJtaXNzaW9uLiAgCj4gCj4gSSBoYXZlIG5vIGludGVudGlvbiB0byBvZmZlbmQgb3RoZXIncyBj
b250cmlidXRpb24uCj4gVGhhdCBpcyB3aHkgSSBzZW50IHRoaXMgUkZDIHBhdGNoIHRvIGFzayBm
b3IgQUNLcyBmcm9tIGNvbnRyaWJ1dG9ycy4KPiAKPiA+IAo+ID4gVGhlIGJlc3QgeW91IGNhbiBk
byBpcyBpZ25vcmluZyBjb250cmlidXRvcnMgdGhhdCBzdWJtaXR0ZWQgY2hhbmdlcyB0aGF0Cj4g
PiBhcmVuJ3QgcmVhbGx5IGNvcHlyaWdodGFibGUgKHNvbWV0aGluZyBsaWtlIGZpeGluZyBhIGNv
bW1lbnQgdHlwbywgc29tZQo+ID4gYXV0by1nZW5lcmF0ZWQgZGlmZi1zKS4KPiA+IAo+ID4gSSB1
c2VkIGZvbGxvd2luZyBjb21tYW5kIHRvIGNoZWNrIG10a19uYW5kLmMgZmlsZSBoaXN0b3J5Ogo+
ID4gIyBnaXQgbG9nIC0tZm9sbG93IGRyaXZlcnMvbXRkL25hbmQvcmF3L210a19uYW5kLmMgfCBn
cmVwIAo+ID4gIlNpZ25lZC1vZmYtYnkiIHwgc29ydCB8IHVuaXEgLWMgfCBzb3J0IC1yIC1uCj4g
PiAgICAgICAxOSAgICAgU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5h
bEBib290bGluLmNvbT4KPiA+ICAgICAgIDE4ICAgICBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6
aWxsb24gPGJvcmlzLmJyZXppbGxvbkBib290bGluLmNvbT4KPiA+ICAgICAgIDE1ICAgICBTaWdu
ZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gCj4gPiA8Ym9yaXMuYnJlemlsbG9uQGZyZWUtZWxl
Y3Ryb25zLmNvbT4KPiA+ICAgICAgICA2ICAgICBTaWduZWQtb2ZmLWJ5OiBYaWFvbGVpIExpIDx4
aWFvbGVpLmxpQG1lZGlhdGVrLmNvbT4KPiA+ICAgICAgICAzICAgICBTaWduZWQtb2ZmLWJ5OiBS
b2dlckNDIExpbiA8cm9nZXJjYy5saW5AbWVkaWF0ZWsuY29tPgo+ID4gICAgICAgIDIgICAgIFNp
Z25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgCj4gPiA8bWlxdWVsLnJheW5hbEBmcmVlLWVsZWN0
cm9ucy5jb20+Cj4gPiAgICAgICAgMSAgICAgU2lnbmVkLW9mZi1ieTogV2VpIFlvbmdqdW4gPHdl
aXlvbmdqdW4xQGh1YXdlaS5jb20+Cj4gPiAgICAgICAgMSAgICAgU2lnbmVkLW9mZi1ieTogUnlk
ZXIgTGVlIDxyeWRlci5sZWVAbWVkaWF0ZWsuY29tPgo+ID4gICAgICAgIDEgICAgIFNpZ25lZC1v
ZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiA+ICAgICAgICAxICAg
ICBTaWduZWQtb2ZmLWJ5OiBQZXRlciBQYW4gPHBldGVycGFuZG9uZ0BtaWNyb24uY29tPgo+ID4g
ICAgICAgIDEgICAgIFNpZ25lZC1vZmYtYnk6IE1hc2FoaXJvIFlhbWFkYSAKPiA+IDx5YW1hZGEu
bWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4KPiA+ICAgICAgICAxICAgICBTaWduZWQtb2ZmLWJ5OiBK
b3JnZSBSYW1pcmV6LU9ydGl6IAo+ID4gPGpvcmdlLnJhbWlyZXotb3J0aXpAbGluYXJvLm9yZz4K
PiA+IAo+ID4gSWRlYWxseSB5b3Ugc2hvdWxkIHN0aWxsIGdldCBhY2tzIGZyb206Cj4gPiAKPiA+
IDEpIE1pcXVlbAo+ID4gQ29udHJpYnV0b3Igb2YgMjEgY2hhbmdlcwo+ID4gCj4gPiAyKSBCb3Jp
cwo+ID4gQ29udHJpYnV0b3Igb2YgMzMgY2hhbmdlcwo+ID4gCj4gPiAzKSBSb2dlckNDCj4gPiBD
b250cmlidXRvciBvZiAzIGNoYW5nZXM6Cj4gPiA5OGRlYThkNzE5MzEgKCJtdGQ6IG5hbmQ6IG10
azogU3VwcG9ydCBNVDc2MjIgTkFORCBmbGFzaCBjb250cm9sbGVyLiIpCj4gPiBiNDVlZTU1MDFl
ZGUgKCJtdGQ6IG5hbmQ6IG10azogU3VwcG9ydCBkaWZmZXJlbnQgTVRLIE5BTkQgZmxhc2ggCj4g
PiBjb250cm9sbGVyIElQIikKPiA+IDU1OWU1OGU3ZWQyZCAoIm10ZDogbmFuZDogZml4IGNoYW5j
ZXMgdG8gY3JlYXRlIGluY29tcGxldGUgRUNDIGRhdGEgd2hlbiAKPiA+IHdyaXRpbmciKQo+ID4g
Cj4gPiA0KSBXZWkKPiA+IENvbnRyaWJ1dG9yIG9mIDEgY2hhbmdlOgo+ID4gMDdmNzY0NDNlZjgx
ICgibXRkOiBuYW5kOiBtZWRpYXRlazogcmVtb3ZlIHJlZHVuZGFudCBkZXZfZXJyIGNhbGwgaW4g
Cj4gPiBtdGtfbmZjX3Byb2JlKCkiKQo+ID4gCj4gPiA1KSBQZXRlcgo+ID4gQ29udHJpYnV0b3Ig
b2YgMSBjaGFuZ2U6Cj4gPiBkNDA5MmQ3NmE0YTQgKCJtdGQ6IG5hbmQ6IFJlbmFtZSBuYW5kLmgg
aW50byByYXduYW5kLmgiKQo+ID4gCj4gPiA2KSBNYXNhaGlybwo+ID4gQ29udHJpYnV0b3Igb2Yg
MSBjaGFuZ2U6Cj4gPiBmMGRiZTRhYTM1ZTcgKCJtdGQ6IG5hbmQ6IG1lZGlhdGVrOiByZXR1cm4g
ZXJyb3IgY29kZSBvZiAKPiA+IG5hbmRfc2Nhbl9pZGVudC90YWlsKCkgb24gZXJyb3IiKQo+ID4g
Cj4gPiBJIGd1ZXNzIHdlIGNvdWxkIGFjY2VwdCB5b3VyIHBhdGNoIHdpdGhvdXQgYWNrcyBmcm9t
IFdlaSwgUGV0ZXIgYW5kIAo+ID4gTWFzYWhpcm8uCj4gPiAKPiA+IFlvdSBkZWZpbml0ZWx5IG5l
ZWQgYW4gYXBwcm92YWwgZnJvbSBNaXF1ZWwsIEJvcmlzIGFuZCBSb2dlckNDLgoKQWNrZWQtYnk6
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpMZXQncyB3YWl0IGZv
ciBSb2dlckNDIGFuZCBCb3JpcyBhY2tzLiBUaGFua3MgUmFmYcWCIGZvciB0aGUgZGV0YWlscy4K
Cj4gPiAKPiA+IEl0IGRvZXNuJ3Qgc2VlbSB5b3UgdG9vayB0aGlzIHJlLWxpY2Vuc2luZyB0YXNr
IHRvbyBzZXJpb3VzbHkuCj4gPiAKPiA+IFBsZWFzZSBwYXkgbW9yZSBhdHRlbnRpb24gdG8gdGhp
cyBsaWNlbnNpbmcgcHJvYmxlbSwgeW91IGNhbiBzdGFydCB3aXRoIAo+ID4gZG9pbmcKPiA+IGEg
c2ltaWxhciByZXNlYXJjaCBmb3IgbXRrX2VjYy5jIGFuZCBtdGtfZWNjLmguICAKPiAKPiBUaGFu
a3MgZm9yIHlvdXIgQUNLIGFuZCBnb29kIHN1Z2dlc3Rpb24uIEl0IGlzIHJlYWxseSBoZWxwZnVs
IGZvciBtZS4KPiAKPiBUaGFua3MsCj4gWGlhb2xlaQo+IAoKClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
