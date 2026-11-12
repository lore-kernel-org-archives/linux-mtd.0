Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81106606A884
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 11:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KT/GABm9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bJDQudij
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:To:Subject:From:Message-ID:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iRcmQccgc5NULUqOsKrN6GcUWNo6p9pmKaBRdTYqK+s=; b=KT/GABm9/8HfSJZU1gxNNNO9Fs
	o3V1tPMc5gVTvLfeV8ogBTKA/fDlbTDo0ShfjcBG3f0FVJNPwBbikwe7gwAhYNd7KqvKKb4aLrFht
	b9H+L4Q9lCdvDwaLDLEiXQJj3OnZQ5523grIMHFC46x7V7VSC87R3FHNyjEco2iUlaP9f5oNRoIs7
	3kcQYWGfsN4q0I0Y7/5oIxtSRacpYHjVlGIjd77dQtXO/RG2EtcvgSqM51mEFZ6kxQy4pGwAV4z6c
	hIQd3F157QmrvnDO/6bntf4q+SdmeNOLLL/ELlbOlzHrDCgUNg+elutAZlTdFWne21gvMKKWexPx/
	00QpxnvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTQl-00000009nRQ-2MZM;
	Thu, 12 Nov 2026 11:57:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTQk-00000009nQt-1ERa
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 11:57:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 824B263266;
	Thu, 12 Nov 2026 11:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 557451F00A06;
	Thu, 12 Nov 2026 11:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794484645;
	bh=Hm8XLf8raqGW2MMzUHdE/tZ7cnarvkX09yT2lNnv5wA=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=bJDQudijQz/zhseTBaZJMN9PULZ9+IkHhKgufMFPxie6zeaCpvVvp5t4Cq5G1mnJe
	 n/Zp9oSxMlTy5ngZA/Fwi6MTUBuRtBEAI5qD0wQDs4G9tHlGeMvbUnYXjgrxRRGqOf
	 LG+1En2XfX7sAdXXF2QKbHRD9eEJA+Z1DKROQu1072xvN5yApcjqLcVDXIdri4GiV5
	 /7H9ioNlmCThyvNHzuSgv0cwSKGQDA+YjjrMSi0FGMA0Sdf4Z40TOtpmUAeTaMeLgF
	 kV5vxjycsC1N9Uw3NNC+5+Gs8Caq8SpQ6S90CwA8DRbleGsh9tnSRjGClKJakFfHzM
	 U/YuA6VE/W7jg==
Message-ID: <sashiko-outbox-211057@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 4/8] mtd: spi-nor: sfdp: expose the SFDP as a
 read-only NVMEM device
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>, pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, arnd@arndb.de, linusw@kernel.org, enelsonmoore@gmail.com, aaro.koskinen@iki.fi, pengpeng@iscas.ac.cn, mathieu.dubois-briand@bootlin.com, gregkh@linuxfoundation.org, michael@walle.cc, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <d0cc3945cf8ef204d920efbe776828477bfde469.1794391660.git.manikandan.m@microchip.com>
References: <cover.1794391660.git.manikandan.m@microchip.com>
 <d0cc3945cf8ef204d920efbe776828477bfde469.1794391660.git.manikandan.m@microchip.com>
Date: Thu, 12 Nov 2026 11:57:24 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MyBwb3RlbnRpYWwKaXNzdWVzIHRvIGNvbnNpZGVyOgotIFtIaWdoXSBtdGQ6IHNwaS1ub3I6IHNm
ZHA6IGZhbGxiYWNrIHRvIGZsYXNoIG9mX25vZGUgd2hlbiBqZWRlYyxzZmRwCiAgbm9kZSBpcyBh
YnNlbnQKLSBbTWVkaXVtXSBtdGQ6IHNwaS1ub3I6IHNmZHA6IHdyb25nIERUIG5vZGUgbG9va3Vw
IGluCiAgc3BpX25vcl9yZWdpc3Rlcl9zZmRwX252bWVtKCkKLSBbTWVkaXVtXSBtdGQ6IHNwaS1u
b3I6IHNmZHA6IG1pc3NpbmcgaWdub3JlX3dwIGluCiAgc3BpX25vcl9yZWdpc3Rlcl9zZmRwX252
bWVtKCkKLS0KCmNvbW1pdCBkNmIxZjVkNjg5Njg4MTljZDAyZjI1ZGQxODUyNjcyNTY2MWY3NTQy
CkF1dGhvcjogTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gPG1hbmlrYW5kYW4ubUBtaWNyb2NoaXAu
Y29tPgoKbXRkOiBzcGktbm9yOiBzZmRwOiBleHBvc2UgdGhlIFNGRFAgYXMgYSByZWFkLW9ubHkg
TlZNRU0gZGV2aWNlCgpUaGlzIGNvbW1pdCBleHBvc2VzIHRoZSBjYWNoZWQgU0ZEUCB0YWJsZSBv
ZiBhIFNQSSBOT1IgZmxhc2ggYXMgYSByZWFkLW9ubHkKTlZNRU0gZGV2aWNlIHJvb3RlZCBhdCB0
aGUgZmxhc2gncyAiamVkZWMsc2ZkcCIgY2hpbGQgbm9kZS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL3NwaS1ub3IvY29yZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiBpbmRl
eCA5MDUyNGM1ODYwMmUxLi5hMDM0ZGNlN2M4MzllIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRk
L3NwaS1ub3IvY29yZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKClsgLi4u
IF0KCj4gK3N0YXRpYyBpbnQgc3BpX25vcl9yZWdpc3Rlcl9zZmRwX252bWVtKHN0cnVjdCBzcGlf
bm9yICpub3IpCj4gK3sKPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9IG5vci0+ZGV2Owo+ICsJc3Ry
dWN0IG52bWVtX2NvbmZpZyBjb25maWcgPSB7IH07Cj4gKwlzdHJ1Y3QgbnZtZW1fZGV2aWNlICpu
dm1lbTsKPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnA7Cj4gKwo+ICsJaWYgKCFub3ItPnNmZHAp
Cj4gKwkJcmV0dXJuIDA7Cj4gKwo+ICsJbnAgPSBvZl9nZXRfY29tcGF0aWJsZV9jaGlsZChkZXZf
b2Zfbm9kZShkZXYpLCAiamVkZWMsc2ZkcCIpOwoKW1NldmVyaXR5OiBNZWRpdW1dClNob3VsZCB0
aGlzIGxvb2sgdXAgdGhlIGNoaWxkIG5vZGUgdW5kZXIgc3BpX25vcl9nZXRfZmxhc2hfbm9kZShu
b3IpIGluc3RlYWQKb2YgZGV2X29mX25vZGUoZGV2KT8KCkluIFNQSSBOT1IgY29udHJvbGxlciBk
cml2ZXJzIHN1Y2ggYXMgaGlzaS1zZmMgYW5kIG54cC1zcGlmaSwgbm9yLT5kZXYgaXMgdGhlCmNv
bnRyb2xsZXIgZGV2aWNlIHdoaWxlIHRoZSBmbGFzaCBub2RlIGlzIGEgY2hpbGQgRFQgbm9kZSBz
dG9yZWQgdmlhCnNwaV9ub3Jfc2V0X2ZsYXNoX25vZGUoKS4gIFVzaW5nIGRldl9vZl9ub2RlKGRl
dikgc2VhcmNoZXMgdGhlIGNvbnRyb2xsZXIncwpEVCBub2RlIGFuZCBtaXNzZXMgdGhlIGZsYXNo
J3MgImplZGVjLHNmZHAiIGNoaWxkIG5vZGUuCgo+ICsKPiArCWNvbmZpZy5kZXYgPSBkZXY7Cj4g
Kwljb25maWcub2Zfbm9kZSA9IG5wOwoKW1NldmVyaXR5OiBIaWdoXQpXaGVuIHRoZSBmbGFzaCBE
VCBub2RlIGhhcyBubyAiamVkZWMsc2ZkcCIgY2hpbGQgbm9kZSwgbnAgaXMgTlVMTCwgYnV0CnNw
aV9ub3JfcmVnaXN0ZXJfc2ZkcF9udm1lbSgpIHN0aWxsIHJlZ2lzdGVycyB0aGUgTlZNRU0gZGV2
aWNlIHdpdGgKY29uZmlnLm9mX25vZGUgPSBOVUxMIGFuZCBjb25maWcuZGV2ID0gZGV2LiAgSW4g
bnZtZW1fcmVnaXN0ZXIoKSwgYSBOVUxMCmNvbmZpZy0+b2Zfbm9kZSBmYWxscyBiYWNrIHRvIGNv
bmZpZy0+ZGV2LT5vZl9ub2RlOgoKZHJpdmVycy9udm1lbS9jb3JlLmM6bnZtZW1fcmVnaXN0ZXIo
KSB7CiAgICAuLi4KCWlmIChjb25maWctPm9mX25vZGUpCgkJbnZtZW0tPmRldi5vZl9ub2RlID0g
b2Zfbm9kZV9nZXQoY29uZmlnLT5vZl9ub2RlKTsKCWVsc2UKCQludm1lbS0+ZGV2Lm9mX25vZGUg
PSBvZl9ub2RlX2dldChjb25maWctPmRldi0+b2Zfbm9kZSk7CiAgICAuLi4KfQoKQmVjYXVzZSBz
cGlfbm9yX3JlZ2lzdGVyX3NmZHBfbnZtZW0oKSBydW5zIGR1cmluZyBzcGlfbm9yX3NjYW4oKSBi
ZWZvcmUKbXRkX2RldmljZV9wYXJzZV9yZWdpc3RlcigpIHJlZ2lzdGVycyB0aGUgbWFpbiBNVEQg
YW5kIE9UUCBOVk1FTSBkZXZpY2VzLCBkb2VzCnRoaXMgYmluZCB0aGUgU0ZEUCBOVk1FTSBkZXZp
Y2UgdG8gdGhlIHBhcmVudCBmbGFzaCBEVCBub2RlIGZpcnN0PwoKT24gYW55IFNQSSBOT1IgZmxh
c2ggd2l0aCBTRkRQIHdob3NlIERUIG5vZGUgaGFzIG5vICJqZWRlYyxzZmRwIiBzdWJub2RlLCB0
aGUKU0ZEUCBOVk1FTSBkZXZpY2UgY2xhaW1zIGFueSBudm1lbS1sYXlvdXQgb24gdGhlIGZsYXNo
IG5vZGUgKHNldHRpbmcKT0ZfUE9QVUxBVEVEX0JVUyBzbyBtdGRfbnZtZW1fYWRkKCkgc2tpcHMg
aXQpIGFuZCBzaGFkb3dzIHRoZSBmbGFzaCBNVEQgYW5kCk9UUCBOVk1FTSBwcm92aWRlcnMgaW4g
b2ZfbnZtZW1fY2VsbF9nZXQoKSBhbmQgb2ZfbnZtZW1fZGV2aWNlX2dldCgpLCBjYXVzaW5nCmNl
bGwgbG9va3VwcyBvbiB0aGUgZmxhc2ggbm9kZSB0byBmYWlsIG9yIHJldHVybiBTRkRQIGJ5dGVz
IGluc3RlYWQgb2YgZmxhc2gKZGF0YS4KCklmIHJlZ2lzdGVyaW5nIHdpdGhvdXQgYSAiamVkZWMs
c2ZkcCIgc3Vibm9kZSBpcyBpbnRlbmRlZCwgc2V0dGluZwpjb25maWcubm9fb2Zfbm9kZSA9ICFu
cCBwcmV2ZW50cyBudm1lbV9yZWdpc3RlcigpIGZyb20gZmFsbGluZyBiYWNrIHRvCmRldi0+b2Zf
bm9kZS4KCj4gKwljb25maWcubmFtZSA9ICJzZmRwIjsKPiArCWNvbmZpZy5pZCA9IE5WTUVNX0RF
VklEX0FVVE87Cj4gKwljb25maWcub3duZXIgPSBUSElTX01PRFVMRTsKPiArCWNvbmZpZy5yZWFk
X29ubHkgPSB0cnVlOwo+ICsJY29uZmlnLndvcmRfc2l6ZSA9IDE7Cj4gKwljb25maWcuc3RyaWRl
ID0gMTsKPiArCWNvbmZpZy5zaXplID0gKGludCkobm9yLT5zZmRwLT5udW1fZHdvcmRzICogc2l6
ZW9mKCpub3ItPnNmZHAtPmR3b3JkcykpOwo+ICsJY29uZmlnLnJlZ19yZWFkID0gc3BpX25vcl9z
ZmRwX3JlZ19yZWFkOwo+ICsJY29uZmlnLnByaXYgPSBub3I7CgpbU2V2ZXJpdHk6IE1lZGl1bV0K
RG9lcyBjb25maWcgYWxzbyBuZWVkIGlnbm9yZV93cCA9IHRydWUsIGxpa2UgbXRkX252bWVtX2Fk
ZCgpIGFuZAptdGRfb3RwX252bWVtX3JlZ2lzdGVyKCk/CgpXaGVuIGNvbmZpZy5pZ25vcmVfd3Ag
aXMgZmFsc2UsIG52bWVtX3JlZ2lzdGVyKCkgY2FsbHMKZ3Bpb2RfZ2V0X29wdGlvbmFsKGNvbmZp
Zy0+ZGV2LCAid3AiLCBHUElPRF9PVVRfSElHSCkgZXZlbiBmb3IgcmVhZC1vbmx5CnByb3ZpZGVy
cy4gIFNpbmNlIHRoZSBTRkRQIHByb3ZpZGVyIG9ubHkgcmVhZHMgZnJvbSB0aGUgY2FjaGVkCm5v
ci0+c2ZkcC0+ZHdvcmRzIGJ1ZmZlciwgbGVhdmluZyBpZ25vcmVfd3AgdW5zZXQgY2xhaW1zIGFu
eSB3cC1ncGlvcwpwcm9wZXJ0eSBvbiBub3ItPmRldiBhbmQgZHJpdmVzIHRoZSB3cml0ZS1wcm90
ZWN0IGxpbmUgaGlnaCwgb3IgZmFpbHMgcHJvYmUKd2l0aCAtRUJVU1kgaWYgdGhlIEdQSU8gaXMg
YWxyZWFkeSBjbGFpbWVkLgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlr
by5kZXYvIy9wYXRjaHNldC9jb3Zlci4xNzk0MzkxNjYwLmdpdC5tYW5pa2FuZGFuLm1AbWljcm9j
aGlwLmNvbT9wYXJ0PTQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
