Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB63CCF2C9
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2026 10:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:To:Subject:From:Message-ID:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tdiAaBPZ1AyCADv6PnqnmvkW1pnUUqNc4r2qYVZF88M=; b=Jaz8lmYj3Szriz
	aEOrWrH6MLYrSx0Z6S3k28bOIGA6vtRmMOh2NrvakWvb9BWrIZz1kFXdSLttKqufpu9L7r+t2nDrn
	460J9FXfusrLjdkxVrR8wcqich1QxSUqscAVo0q0D2W3qXMC8zfHfmRD7IckC83a/56bSiwgr+WLw
	MLK91kkodf7aJw80koJrwM5dY6JXFn9t89BHPqpTB0GSFEZDI6r60x/OiB0OKN787TYHO5d45EXlF
	LeoWvokRGhOAWcR3M7AmL3huiz1GQuXk6CCloA7x8Wkoi98AguLOKKto4Is1VFIVUviGSRT87HrNv
	ehI83C8vMop+qrziktpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI1pz-00000004fzm-0CYt;
	Sat, 17 Oct 2026 10:40:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI1pw-00000004fzf-1eEF
	for linux-mtd@lists.infradead.org;
	Sat, 17 Oct 2026 10:40:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 99F89436D4;
	Sat, 17 Oct 2026 10:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF261F000C4;
	Sat, 17 Oct 2026 10:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792233623;
	bh=318XGSk7k3m8SB3ZUHCIBN+7ZAatLVpr/m6+KQ/qjEQ=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=aoOyrWdJAsPvHE0LuM27iNyt8kc3aYZTsUOvWs3G2SU95XkEsN3A8W8F5SeOI7yrh
	 mdIhGxy66A1wnQmx1av7XwKGvVKZlDQagdF0mIso5KmknCMR9TzgRp1n46qAv2xnbD
	 rufOPAeh0vLHSEgY9p+i729bb+363C7hD1wAYAYBD9Scg0DIOOGGHbGAD8+ak7wLdq
	 u8Xp21DhPvb3PjdhetYEywufuxQxcj0BIOcVjmx2Zx0RrJlVUwiixWF8zim3gGOBX/
	 dXO31J94SBgBkGIHc8tUGr0ZJ42PCBxw8zbuacjMPBZINMp9GkSAfCg6AII71UV5RV
	 /AvRkNrx62Ynw==
Message-ID: <sashiko-outbox-175470@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 4/8] mtd: spi-nor: sfdp: expose the SFDP as a
 read-only NVMEM device
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>, pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, linusw@kernel.org, arnd@arndb.de, pengpeng@iscas.ac.cn, gregkh@linuxfoundation.org, mathieu.dubois-briand@bootlin.com, michael@walle.cc, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <889d6d5b7c608fd6553f38e4a34b050dcf70317f.1792145382.git.manikandan.m@microchip.com>
References: <cover.1792145382.git.manikandan.m@microchip.com>
 <889d6d5b7c608fd6553f38e4a34b050dcf70317f.1792145382.git.manikandan.m@microchip.com>
Date: Sat, 17 Oct 2026 10:40:21 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogc3BpLW5vcjog
c2ZkcDogc3RlYWxzIHBhcmVudCdzIG52bWVtLWxheW91dCB3aGVuICdqZWRlYyxzZmRwJyBub2Rl
IGlzIG1pc3NpbmcKLS0KCmNvbW1pdCBlNDExMWZlYTdhM2M3MGIwYmIxZjVjZDE1M2EyNTllNGZk
YjYyYzkzCkF1dGhvcjogTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gPG1hbmlrYW5kYW4ubUBtaWNy
b2NoaXAuY29tPgoKbXRkOiBzcGktbm9yOiBzZmRwOiBleHBvc2UgdGhlIFNGRFAgYXMgYSByZWFk
LW9ubHkgTlZNRU0gZGV2aWNlCgpUaGlzIGNvbW1pdCBleHBvc2VzIHRoZSBjYWNoZWQgU0ZEUCB0
YWJsZSBhcyBhIHJlYWQtb25seSBOVk1FTSBkZXZpY2UsCnJvb3RlZCBhdCB0aGUgZmxhc2gncyBT
RkRQIGNoaWxkIG5vZGUgaWYgYXZhaWxhYmxlLiBUaGlzIGFsbG93cyBnZW5lcmljCmFuZCB2ZW5k
b3IgTlZNRU0gY2VsbHMgdG8gcmVmZXJlbmNlIFNGRFAgZGF0YS4KCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiBp
bmRleCA4YmMxMTdiNDZlMDI4Li5lZDQ3OGU0OGNhMTE2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bXRkL3NwaS1ub3IvY29yZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKClsg
Li4uIF0KCj4gQEAgLTMwMDEsNiArMzAwMiw3MiBAQCBzdGF0aWMgdm9pZCBzcGlfbm9yX2luaXRf
Zml4dXBfZmxhZ3Moc3RydWN0IHNwaV9ub3IgKm5vcikKClsgLi4uIF0KCj4gK3N0YXRpYyBpbnQg
c3BpX25vcl9yZWdpc3Rlcl9zZmRwX252bWVtKHN0cnVjdCBzcGlfbm9yICpub3IpCj4gK3sKPiAr
CXN0cnVjdCBkZXZpY2UgKmRldiA9IG5vci0+ZGV2Owo+ICsJc3RydWN0IG52bWVtX2NvbmZpZyBj
b25maWcgPSB7IH07Cj4gKwlzdHJ1Y3QgbnZtZW1fZGV2aWNlICpudm1lbTsKPiArCXN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbnA7Cj4gKwo+ICsJaWYgKCFub3ItPnNmZHApCj4gKwkJcmV0dXJuIDA7Cj4g
Kwo+ICsJbnAgPSBvZl9nZXRfY29tcGF0aWJsZV9jaGlsZChkZXZfb2Zfbm9kZShkZXYpLCAiamVk
ZWMsc2ZkcCIpOwo+ICsKPiArCWNvbmZpZy5kZXYgPSBkZXY7Cj4gKwljb25maWcub2Zfbm9kZSA9
IG5wOwoKW1NldmVyaXR5OiBIaWdoXQpJZiB0aGUgamVkZWMsc2ZkcCBjaGlsZCBub2RlIGlzIG1p
c3NpbmcgZnJvbSB0aGUgZGV2aWNlIHRyZWUsIG5wIHdpbGwKYmUgTlVMTCBhbmQgYXNzaWduZWQg
dG8gY29uZmlnLm9mX25vZGUuIERvZXMgdGhpcyBpbmFkdmVydGVudGx5IHRyaWdnZXIgdGhlCk5W
TUVNIGNvcmUncyBmYWxsYmFjayBiZWhhdmlvcj8KCkxvb2tpbmcgYXQgbnZtZW1fcmVnaXN0ZXIo
KSBpbiBkcml2ZXJzL252bWVtL2NvcmUuYywgdGhlcmUgaXMgYSBmYWxsYmFjawptZWNoYW5pc20g
Zm9yIG1pc3Npbmcgbm9kZXM6CgogICAgaWYgKGNvbmZpZy0+b2Zfbm9kZSkKICAgICAgICAgICAg
bnZtZW0tPmRldi5vZl9ub2RlID0gb2Zfbm9kZV9nZXQoY29uZmlnLT5vZl9ub2RlKTsKICAgIGVs
c2UKICAgICAgICAgICAgbnZtZW0tPmRldi5vZl9ub2RlID0gb2Zfbm9kZV9nZXQoY29uZmlnLT5k
ZXYtPm9mX25vZGUpOwoKSWYgY29uZmlnLm9mX25vZGUgaXMgTlVMTCwgdGhlIFNGRFAgTlZNRU0g
ZGV2aWNlIHdpbGwgaW5jb3JyZWN0bHkgaW5oZXJpdAp0aGUgU1BJIE5PUiBmbGFzaCdzIG1haW4g
ZGV2aWNlIG5vZGUuCgpUaGUgTlZNRU0gY29yZSB0aGVuIHNlYXJjaGVzIGZvciBhbiBudm1lbS1s
YXlvdXQgY2hpbGQgbm9kZSBhbmQgd2lsbApmaW5kIHRoZSBsYXlvdXQgaW50ZW5kZWQgZm9yIHRo
ZSBtYWluIGZsYXNoIG1lbW9yeSwgYXR0YWNoaW5nIGFsbCBOVk1FTQpjZWxscyB0byB0aGUgc21h
bGwgU0ZEUCBOVk1FTSBkZXZpY2UgYW5kIG1hcmtpbmcgdGhlIGxheW91dCBub2RlIHBvcHVsYXRl
ZC4KCkxhdGVyLCB3aGVuIHRoZSBNVEQgc3Vic3lzdGVtIHJlZ2lzdGVycyB0aGUgcHJpbWFyeSBO
Vk1FTSBkZXZpY2UgZm9yIHRoZQphY3R1YWwgZmxhc2ggY29udGVudHMsIGl0IHdpbGwgc2tpcCB0
aGUgbGF5b3V0IG5vZGUgYmVjYXVzZSBpdCBpcyBhbHJlYWR5Cm1hcmtlZCBwb3B1bGF0ZWQuIAoK
Q291bGQgYW55IGNvbnN1bWVyIGF0dGVtcHRpbmcgdG8gcmVhZCBhbiBOVk1FTSBjZWxsIHRoZW4g
YmUgbWlzZGlyZWN0ZWQgCnRvIHRoZSBzbWFsbCBTRkRQIE5WTUVNIGRldmljZSdzIHJlYWQgY2Fs
bGJhY2sgaW5zdGVhZCBvZiB0aGUgbWFpbiBmbGFzaCwgCnJlc3VsdGluZyBpbiAtRUlOVkFMIGJv
dW5kcyBjaGVjayBlcnJvcnMgb3IgY29ycnVwdGVkIGRhdGE/Cgo+ICsJY29uZmlnLm5hbWUgPSAi
c2ZkcCI7Cj4gKwljb25maWcuaWQgPSBOVk1FTV9ERVZJRF9BVVRPOwo+ICsJY29uZmlnLm93bmVy
ID0gVEhJU19NT0RVTEU7CgpbIC4uLiBdCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0L2NvdmVyLjE3OTIxNDUzODIuZ2l0Lm1hbmlrYW5kYW4u
bUBtaWNyb2NoaXAuY29tP3BhcnQ9NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
