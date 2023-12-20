Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B786EC46CCD
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Dec 2023 09:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ykv1AozDWN3yaSj2bVaF0yTNkvKhOaX1ZAAjSYNqK9Y=; b=FW9LfBEa3jTbgq
	18U/IqS1dI2VcAfLIf55YUmvZWjtX86N4td4TUYqkSsIZcq3LmZaCm6+QEzJJ6sHjMNrg0Bbap41x
	DMeUDwe9Bk9WyGTn7P2TH/qVsBgX0wsi9TDg1KTlrcFz1v07iYvuIcBvTPU8X5H+7EfiSUDHanscH
	NoaAtf7jtSlH1UEAqRVakQPuwWaAjhFF/Gsf5ihoeZrur0gR4LFT2/dGk6ZJ6zltmCTFOQNVk5AHk
	PlBp8PQoMzxFBWjihQ5ZLu++N1pVEJkTzN++x86bj/F2sNK4UtPXVT+78thZWkDU3MoFBKg11NI0w
	Vvne6vNpfl/5i5yRRE3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsdI-00Gh5u-0E;
	Wed, 20 Dec 2023 09:12:52 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsdE-00Gh5E-1y
	for linux-mtd@lists.infradead.org;
	Wed, 20 Dec 2023 09:12:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45BCFFF803;
	Wed, 20 Dec 2023 09:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703063562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3mCR1Dvkv7wQjJFGFcVOYbaNhzlOz828ZxpONDrKsmM=;
	b=kZKl2bv/JZArh4wgtRB1PTgVMI++06p/qE65ClLqBtmLOgYiGaw6yJMamCd9sQNcly8xAh
	JgJ2MppHZH36qamAt81YoGAYCg1EBViWzIlOfvnLfW8BhjH8a+zG6FaTFzi2xDrsXS6osZ
	Au5eHDhwNgnuGdoi6Z7JF5piHSNg0tliX3KHCHzxS4Ke9R4SoXiR8GCR7OOqvLo+ajEbWv
	fl4bmJBtmWR1+rcJEUPsA4v2uyAejUvZOCNA6hIKM3qsDqoqa9/ocJeWV/33gzmbtrplKG
	S3b+4kyo70MchMFYwXr/qL0FlRbKpPEoXBqFMzv9JfQ+Gusl9WGO+J5v+fLvaw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: ZhaoLong Wang <wangzhaolong1@huawei.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	dpervushin@embeddedalley.com,
	Artem.Bityutskiy@nokia.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	chengzhihao1@huawei.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com
Subject: Re: [PATCH V4] mtd: Fix gluebi NULL pointer dereference caused by ftl notifier
Date: Wed, 20 Dec 2023 10:12:40 +0100
Message-Id: <20231220091240.655350-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231220024619.2138625-1-wangzhaolong1@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2fb802a9c52d326d0d9c32962fb701fe0ed3eb39'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_011248_811026_114BBFF5 
X-CRM114-Status: GOOD (  12.57  )
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

T24gV2VkLCAyMDIzLTEyLTIwIGF0IDAyOjQ2OjE5IFVUQywgWmhhb0xvbmcgV2FuZyB3cm90ZToK
PiBJZiBib3RoIGZ0bC5rbyBhbmQgZ2x1ZWJpLmtvIGFyZSBsb2FkZWQsIHRoZSBub3RpZmllciBv
ZiBmdGwKPiB0cmlnZ2VycyBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2Ugd2hlbiB0cnlpbmcgdG8g
YWNjZXNzCj4g4oCYZ2x1ZWJpLT5kZXNj4oCZIGluIGdsdWViaV9yZWFkKCkuCj4gCj4gdWJpX2ds
dWViaV9pbml0Cj4gICB1YmlfcmVnaXN0ZXJfdm9sdW1lX25vdGlmaWVyCj4gICAgIHViaV9lbnVt
ZXJhdGVfdm9sdW1lcwo+ICAgICAgIHViaV9ub3RpZnlfYWxsCj4gICAgICAgICBnbHVlYmlfbm90
aWZ5ICAgIG5iLT5ub3RpZmllcl9jYWxsKCkKPiAgICAgICAgICAgZ2x1ZWJpX2NyZWF0ZQo+ICAg
ICAgICAgICAgIG10ZF9kZXZpY2VfcmVnaXN0ZXIKPiAgICAgICAgICAgICAgIG10ZF9kZXZpY2Vf
cGFyc2VfcmVnaXN0ZXIKPiAgICAgICAgICAgICAgICAgYWRkX210ZF9kZXZpY2UKPiAgICAgICAg
ICAgICAgICAgICBibGt0cmFuc19ub3RpZnlfYWRkICAgbm90LT5hZGQoKQo+ICAgICAgICAgICAg
ICAgICAgICAgZnRsX2FkZF9tdGQgICAgICAgICB0ci0+YWRkX210ZCgpCj4gICAgICAgICAgICAg
ICAgICAgICAgIHNjYW5faGVhZGVyCj4gICAgICAgICAgICAgICAgICAgICAgICAgbXRkX3JlYWQK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgIG10ZF9yZWFkX29vYgo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBtdGRfcmVhZF9vb2Jfc3RkCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZ2x1ZWJpX3JlYWQgICBtdGQtPnJlYWQoKQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZ2x1ZWJpLT5kZXNjIC0gTlVMTAo+IAo+IERldGFpbGVkIHJlcHJvZHVjdGlvbiBp
bmZvcm1hdGlvbiBhdmFpbGFibGUgYXQgdGhlIExpbmsgWzFdLAo+IAo+IEluIHRoZSBub3JtYWwg
Y2FzZSwgb2J0YWluIGdsdWViaS0+ZGVzYyBpbiB0aGUgZ2x1ZWJpX2dldF9kZXZpY2UoKSwKPiBh
bmQgYWNjZXNzIGdsdWViaS0+ZGVzYyBpbiB0aGUgZ2x1ZWJpX3JlYWQoKS4gSG93ZXZlciwKPiBn
bHVlYmlfZ2V0X2RldmljZSgpIGlzIG5vdCBleGVjdXRlZCBpbiBhZHZhbmNlIGluIHRoZQo+IGZ0
bF9hZGRfbXRkKCkgcHJvY2Vzcywgd2hpY2ggbGVhZHMgdG8gTlVMTCBwb2ludGVyIGRlcmVmZXJl
bmNlLgo+IAo+IFRoZSBzb2x1dGlvbiBmb3IgdGhlIGdsdWViaSBtb2R1bGUgaXMgdG8gcnVuIGpm
ZnMyIG9uIHRoZSBVQkkKPiB2b2x1bWUgd2l0aG91dCBjb25zaWRlcmluZyB3b3JraW5nIHdpdGgg
ZnRsIG9yIG10ZGJsb2NrIFsyXS4KPiBUaGVyZWZvcmUsIHRoaXMgcHJvYmxlbSBjYW4gYmUgYXZv
aWRlZCBieSBwcmV2ZW50aW5nIGdsdWViaSBmcm9tCj4gY3JlYXRpbmcgdGhlIG10ZGJsb2NrIGRl
dmljZSBhZnRlciBjcmVhdGluZyBtdGQgcGFydGl0aW9uIG9mIHRoZQo+IHR5cGUgTVREX1VCSVZP
TFVNRS4KPiAKPiBGaXhlczogMmJhM2Q3NmExZTI5ICgiVUJJOiBtYWtlIGdsdWViaSBhIHNlcGFy
YXRlIG1vZHVsZSIpCj4gTGluazogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVn
LmNnaT9pZD0yMTc5OTIgWzFdCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC80
NDExMDcxMDAuMjM3MzQuMTY5NzkwNDU4MDI1Mi5KYXZhTWFpbC56aW1icmFAbm9kLmF0LyBbMl0K
PiBTaWduZWQtb2ZmLWJ5OiBaaGFvTG9uZyBXYW5nIDx3YW5nemhhb2xvbmcxQGh1YXdlaS5jb20+
Cj4gUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4g
QWNrZWQtYnk6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+CgpBcHBsaWVkIHRv
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51
eC5naXQgbXRkL25leHQsIHRoYW5rcy4KCk1pcXVlbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
