Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2752BC48BF6
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2024 11:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MRQKJDDklq7mt04qh9On0/gElSXiSU2xXPXCR9EKMLs=; b=ZRqCjdi0zbox2e
	BWe8zXE9LiYheizIuXmbp9gwAaKvXAXOCdfx4jJfYGXwRoNe2i3yZCYqNM8wKdDpu8QhSGgiYVuma
	4Nsnv71JtR9z1l87273L3ex+Unrf4Z2bTIqpNj1/xQf0BfmN+DyORn1auZmijNG052nvDLUw0p5xy
	nc9SlNd7dejO3ilpa0pbJegCs2jqarMX8y1/HYDI5TVPMvnZt8V0FoZCMwkOvUQU7DxDcE+48+IiX
	5j9Y+nSd+H06CP0Rj3T56iC7qZ0oKEhF7/6Pgza1Z7X+3CfxjhuyJz334IxFy9Ol2e4uuyc/3kKCS
	/OJEzzsmsPIgN3b+nXRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riC8s-00000004MHC-1aJf;
	Thu, 07 Mar 2024 11:42:30 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riC8p-00000004MEg-2EMz
	for linux-mtd@lists.infradead.org;
	Thu, 07 Mar 2024 11:42:29 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_128_GCM_SHA256:128)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1riC8g-0002VN-2E;
	Thu, 07 Mar 2024 11:42:18 +0000
Date: Thu, 07 Mar 2024 11:42:12 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mtd@lists.infradead.org, Dan Carpenter <dan.carpenter@linaro.org>,
 Zhihao Cheng <chengzhihao1@huawei.com>
CC: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Daniel Diaz <daniel.diaz@linaro.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH v2] mtd: ubi: fix NVMEM over UBI volumes on 32-bit systems
User-Agent: K-9 Mail for Android
In-Reply-To: <27c875fb-9507-4034-8468-c4d46c952754@moroto.mountain>
References: <31a20aead3419209991bf01aaeaefe07ab94d23a.1709081052.git.daniel@makrotopia.org> <8ae44e8e-fc3d-28bd-5d1e-e900ce53529f@huawei.com> <27c875fb-9507-4034-8468-c4d46c952754@moroto.mountain>
Message-ID: <005448D3-A311-4B2D-B515-C7A9399B48E4@makrotopia.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_034227_589871_979A1564 
X-CRM114-Status: GOOD (  20.34  )
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

CgpPbiA3IE1hcmNoIDIwMjQgMDk6MTc6NDUgVVRDLCBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVu
dGVyQGxpbmFyby5vcmc+IHdyb3RlOgo+T24gV2VkLCBGZWIgMjgsIDIwMjQgYXQgMDk6NDU6MTNB
TSArMDgwMCwgWmhpaGFvIENoZW5nIHdyb3RlOgo+PiDlnKggMjAyNC8yLzI4IDg6NDYsIERhbmll
bCBHb2xsZSDlhpnpgZM6Cj4+ID4gQSBjb21waWxlciB3YXJuaW5nIHJlbGF0ZWQgdG8gc2l6ZW9m
KGludCkgIT0gOCB3aGVuIGNhbGxpbmcgZG9fZGl2KCkKPj4gPiBpcyB0cmlnZ2VyZWQgd2hlbiBi
dWlsZGluZyBvbiAzMi1iaXQgcGxhdGZvcm1zLgo+PiA+IEFkZHJlc3MgdGhpcyBieSB1c2luZyBp
bnRlZ2VyIHR5cGVzIGhhdmluZyBhIHdlbGwtZGVmaW5lZCBzaXplLgo+PiA+IAo+PiA+IEZpeGVz
OiAzY2U0ODU4MDNkYTEgKCJtdGQ6IHViaTogcHJvdmlkZSBOVk1FTSBsYXllciBvdmVyIFVCSSB2
b2x1bWVzIikKPj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgR29sbGUgPGRhbmllbEBtYWtyb3Rv
cGlhLm9yZz4KPj4gPiAtLS0KPj4gPiB2MjogdXNlIHNpemVfdCBmb3IgJ2J5dGVzX2xlZnQnIHZh
cmlhYmxlIHRvIG1hdGNoIHBhcmFtZXRlciB0eXBlCj4+ID4gCj4+ID4gICBkcml2ZXJzL210ZC91
YmkvbnZtZW0uYyB8IDUgKysrKy0KPj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPj4gPiAKPj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJp
L252bWVtLmMgYi9kcml2ZXJzL210ZC91YmkvbnZtZW0uYwo+PiA+IGluZGV4IGI3YTkzYzQ5NWQx
NzIuLmU2OGI4NTg5YzQyNzkgMTAwNjQ0Cj4+ID4gLS0tIGEvZHJpdmVycy9tdGQvdWJpL252bWVt
LmMKPj4gPiArKysgYi9kcml2ZXJzL210ZC91YmkvbnZtZW0uYwo+PiA+IEBAIC0yMyw5ICsyMywx
MiBAQCBzdHJ1Y3QgdWJpX252bWVtIHsKPj4gPiAgIHN0YXRpYyBpbnQgdWJpX252bWVtX3JlZ19y
ZWFkKHZvaWQgKnByaXYsIHVuc2lnbmVkIGludCBmcm9tLAo+PiA+ICAgCQkJICAgICAgdm9pZCAq
dmFsLCBzaXplX3QgYnl0ZXMpCj4+ID4gICB7Cj4+ID4gLQlpbnQgZXJyID0gMCwgbG51bSA9IGZy
b20sIG9mZnMsIGJ5dGVzX2xlZnQgPSBieXRlcywgdG9fcmVhZDsKPj4gPiAgIAlzdHJ1Y3QgdWJp
X252bWVtICp1bnYgPSBwcml2Owo+PiA+ICAgCXN0cnVjdCB1Ymlfdm9sdW1lX2Rlc2MgKmRlc2M7
Cj4+ID4gKwlzaXplX3QgYnl0ZXNfbGVmdCA9IGJ5dGVzOwo+PiA+ICsJdWludDMyX3Qgb2Zmcywg
dG9fcmVhZDsKPj4gVGhlcmUgc3RpbGwgZXhpc3QgYSB0eXBlIHRydW5jYXRpb24gYXNzaWdubWVu
dCAndG9fcmVhZCA9IGJ5dGVzX2xlZnQnIGJlbG93LAo+PiBhbHRob3VnaCBpdCdzIHNhZmUgaW4g
bG9naWMuCj4KPlllYWguICBBcyB5b3Ugc2F5LCBmcm9tIGxvb2tpbmcgYXQgdGhlIGxvZ2ljIHdl
IGtub3cgaXQncyBzYWZlLgo+Cj4gICAgNDEgICAgICAgICAgICAgICAgICBpZiAodG9fcmVhZCA+
IGJ5dGVzX2xlZnQpCj4gICAgNDIgICAgICAgICAgICAgICAgICAgICAgICAgIHRvX3JlYWQgPSBi
eXRlc19sZWZ0Owo+Cj5PYnZpb3VzbHkgdGhlIG5ldyB2YWx1ZSBpcyBzbWFsbGVyIHRoYW4gdGhl
IG9yaWdpbmFsLCBzbyBpdCBtdXN0IGZpdAo+d2l0aGluIGEgdTMyIHJhbmdlLi4uCgoKSSd2ZSBz
ZW50IHYzIG9mIHRoaXMgZml4IHdoaWNoIHNob3VsZCBiZSBmaW5hbGx5IGJlIHdhcm5pbmcgZnJl
ZSBub3cuCgpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXgtbXRkL3Bh
dGNoL2ZmMjk0NDdkY2VlODM0YzE3ZTRlMWU5OTcyNWI5NDU0YzkwMTM2Y2EuMTcwOTE3ODMyNS5n
aXQuZGFuaWVsQG1ha3JvdG9waWEub3JnLwoKPgo+VGhpcyBidWcgaGFzIGJlZW4gYnJlYWtpbmcg
dGhlIGJ1aWxkIHNpbmNlIERlYyAxOS4gIAoKSSBoYXZlIGEgaGFyZCB0aW1lIGJlbGlldmluZyB0
aGF0IGFzIHRoZSBvZmZlbmRpbmcgY29tbWl0IHdhcyBvbmx5IGFwcGxpZWQgb24gRmViIDI1LgoK
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51
eC1uZXh0LmdpdC9jb21taXQvP2lkPTNjZTQ4NTgwM2RhMWI3OWIyNjkyYjZkMGMyNzkyODI5Mjky
YWQ4MzgKCj4gSXQncyBmaW5lIGlmIHlvdSdyZQo+YWJsZSB0byBtYW51YWxseSBjcmVhdGUgeW91
ciBvd24gLmNvbmZpZ3MgdG8gd29yayBhcm91bmQgYnVpbGQgYnJlYWthZ2UuCj5CdXQgaWYgeW91
J3JlIGRvaW5nIGF1dG9tYXRlZCB0ZXN0aW5nIGF0IHNjYWxlIHRoZW4gaXQncyBhIHNob3cgc3Rv
cHBlci4KPkNvdWxkIHdlIHBsZWFzZSBmaXggaXQuCj4KPnJlZ2FyZHMsCj5kYW4gY2FycGVudGVy
Cj4KPgo+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj5MaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKPmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
