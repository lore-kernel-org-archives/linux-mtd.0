Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18926C433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 16:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FiInj34m8efyBLWHh/yfPJHDZf+KXVIRNemCLWSttHQ=; b=al551jrf8GHg12
	eZWDi1ae+WpS1+PS/8XeuGmojKad0zzca893herA9s6+z6dUUqcPjY3HJspo4uTFeshu9cGFwf+cu
	0gIVljcVOReW6E2cYQQYmh2R0RaKKWKkYRjAMJCO97DyHFs+21xpxj2LknnolMFHQ4MVhHxtcZX6E
	jUKBTe6ueHu+uqdMRDe88w1GlYsHZW2j0mCbaSWZUcBmdgLag9hpl63VvarDQrvfPhpA7DQ3ijhrJ
	o0BuSJo3reNGaeqA7icZOrzuxjEc2qHH8Iy2QLLddcWdROUyhJfy0+zp1kCSgGbThamPyLSL2P8od
	tmQZb0TVOl07VdyZqQ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4iD-00G3ER-Kb; Mon, 07 Nov 2022 16:11:01 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4iA-00G36Z-5c
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2022 16:11:00 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 95361100008;
	Mon,  7 Nov 2022 16:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667837443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=reKmzyV0zLY9jo0MbPCUMRWY04FYf/Kp2/Ch5dAccN8=;
	b=WmysRQowoZAFx0x1mjou05foke1N6Cm38lHaS0sS+7dSTfp3Nl4pEzYdiqKsI+WoeGgIHe
	DraaO+W6ggYpzxTPsn4uZTI2GacF1ArXF3tFFjDZVft2Ybuo/hH0b8E4P3DoNc4wRFqa/6
	uEuYYce6PqrkLHGm5pvpOVtdHvjpnO0i5lujLv0JcC50/NsgK+KBnyJ2dQRw9hrmICd4ra
	bsMUTllQTkkOsr3oy9K1LZlGTm3zE2l/lgevwT4xv3OY/yglB0E4WFJHrzzi6ygVstv6M9
	kxVaffYFdzhIyWOj0Aw+e4mkl7N+/NO0dsCdhftv/IPVTf8c8MdC7FZeSV45ZA==
Date: Mon, 7 Nov 2022 17:10:41 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: parsers: tplink_safeloader: fix uninitialized
 variable bug
Message-ID: <20221107171041.3eac0bbb@xps-13>
In-Reply-To: <4a9cbb40-e83f-b117-3ea4-38ff582e2db8@milecki.pl>
References: <Y1gCALFWXYYwqV1P@kili>
	<20221107165238.17bbc8fe@xps-13>
	<4a9cbb40-e83f-b117-3ea4-38ff582e2db8@milecki.pl>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_081058_379025_BA269726 
X-CRM114-Status: GOOD (  16.83  )
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

CnJhZmFsQG1pbGVja2kucGwgd3JvdGUgb24gTW9uLCA3IE5vdiAyMDIyIDE3OjAxOjA0ICswMTAw
OgoKPiBPbiA3LjExLjIwMjIgMTY6NTIsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBEYW4s
Cj4gPiAKPiA+IGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbSB3cm90ZSBvbiBUdWUsIDI1IE9jdCAy
MDIyIDE4OjM0OjI0ICswMzAwOgo+ID4gICAKPiA+PiBPbiA2NCBiaXQgc3lzdGVtcywgdGhlIGhp
Z2hlc3QgMzIgYml0cyBvZiB0aGUgIm9mZnNldCIgdmFyaWFibGUgYXJlCj4gPj4gbm90IGluaXRp
YWxpemVkLiAgQWxzbyB0aGUgZXhpc3RpbmcgY29kZSBpcyBub3QgZW5kaWFuIHNhZmUgKGl0IHdp
bGwKPiA+PiBmYWlsIG9uIGJpZyBlbmRpYW4gc3lzdGVtcykuICBDaGFuZ2UgdGhlIHR5cGUgb2Yg
Im9mZnNldCIgdG8gYSB1MzIuCj4gPj4KPiA+PiBGaXhlczogYWVjNGQ1ZjVmZmQwICgibXRkOiBw
YXJzZXJzOiBhZGQgVFAtTGluayBTYWZlTG9hZGVyIHBhcnRpdGlvbnMgdGFibGUgcGFyc2VyIikK
PiA+PiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5j
b20+Cj4gPj4gLS0tCj4gPj4gICBkcml2ZXJzL210ZC9wYXJzZXJzL3RwbGlua19zYWZlbG9hZGVy
LmMgfCA2ICsrKy0tLQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9wYXJzZXJzL3Rw
bGlua19zYWZlbG9hZGVyLmMgYi9kcml2ZXJzL210ZC9wYXJzZXJzL3RwbGlua19zYWZlbG9hZGVy
LmMKPiA+PiBpbmRleCAyMzU4NGE0NzczOTEuLmY2MDFlN2JkODYyNyAxMDA2NDQKPiA+PiAtLS0g
YS9kcml2ZXJzL210ZC9wYXJzZXJzL3RwbGlua19zYWZlbG9hZGVyLmMKPiA+PiArKysgYi9kcml2
ZXJzL210ZC9wYXJzZXJzL3RwbGlua19zYWZlbG9hZGVyLmMgIAo+ID4gCj4gPiBJIGFtIHNvcnJ5
IGJ1dCBJIGRvbid0IGhhdmUgdGhpcyBmaWxlIGluIG15IHRyZWUsIHdoYXQga2VybmVsIGFyZSB5
b3UKPiA+IHVzaW5nPyAgCj4gCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdC9sb2cvP2g9bXRkL25leHQKPiBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0L2NvbW1pdC8/
aD1tdGQvbmV4dCZpZD1hZWM0ZDVmNWZmZDBmMDA5MmJkOWRjMjFlYTkwZTBiYzIzN2Q0Yjc0Cj4g
Cj4gKGNvbW1pdHRlciBNaXF1ZWwgUmF5bmFsIDspICkKCkFoLCBJIGtuZXcgSSB3YXMgbWlzc2lu
ZyBzb21ldGhpbmc6IHRoZSByaWdodCBicmFuY2guIDotKQoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
