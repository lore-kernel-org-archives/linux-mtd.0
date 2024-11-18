Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAC0D4920B
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2024 10:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E+v+HvSnfwbW6fi3SzT/zc5vxqGVu3iDhS5Z/X92NNA=; b=V0SYqZs1HKmq5B
	j1KQxtq0kKbOSRJg0O+W7sfTbynLAUpM4oqDnjEM4tmt2RgfkirFdhpR3uMxR0XlQAbTfTWEuHQ1X
	5eb7BOTIfwAG3/6AVzdYUlSSnJr4eKJ0qV0t0Y4b1gkL8gjf7J8/jbb6C/OJIGAwWsvHSiU8EsQoO
	EPevQI4AoCxcf4XkLvy9zSZy/1jicIcF7f7lCKuAuZJeg34NoEPSJ0Xqib4ZSjAmsgI/GuS0MOzns
	5sA+gqdRIKM4hfm/a1JwonhEd1uvOlWsyTSTpEat6HK6LD6ULpAEtMDIzr4sQwUf7KqopdVzua1KZ
	HF5AqfklzHJ8UCaOOrcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCzR2-00000009ASP-0o0L;
	Mon, 18 Nov 2024 10:56:48 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCzQ0-00000009ACy-0dHb;
	Mon, 18 Nov 2024 10:55:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30A776000A;
	Mon, 18 Nov 2024 10:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731927341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zzh7nhip7P2NRDANsFNZDjlxnLfwoqac2YOb0mHrdHE=;
	b=c+jy871sogY634JgCb022cxm3ui6nnQ+VW/olbgb8aXdgl/d4PenzcP8SjJImE+H2rCp94
	qhmv2swkL2b7rdpqSEntQaEs1jzIbpsyx7URkUek3or0FUBckUKuTVxTCRkg5XrEVjOPnE
	dXNXvLy3wnoIKgNi9mbnYYlxOSg8uyUN8QpETTxHTzc+A6lYfk5p3bSk0/oAuv/SM/8tSx
	lZp6Q8r8m2Idpk/WKr/vHf+J50DGAcOJyby0dKd2em3ATkN7rqnTEozLpEIktf2D3DtycP
	KpR5bTCFxAjv0lkkDITe6G1kOb4WbOzmXgp/r3g+yyJaI3IpXhvc1cNBvjWoAA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Daniel Golle
 <daniel@makrotopia.org>,  Chia-Lin Kao <acelan.kao@canonical.com>,  "Mika
 Westerberg" <mika.westerberg@linux.intel.com>,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <linux-arm-kernel@lists.infradead.org>,
  <linux-mediatek@lists.infradead.org>,  Steven Liu
 <Steven.Liu@mediatek.com>
Subject: Re: [RFC PATCH nand/next 1/4] mtd: nand: Create param.c to do CRC
 check and bitwise majority for Parameter & CASN page
In-Reply-To: <20241020132722.20565-2-SkyLake.Huang@mediatek.com> (Sky Huang's
	message of "Sun, 20 Oct 2024 21:27:19 +0800")
References: <20241020132722.20565-1-SkyLake.Huang@mediatek.com>
	<20241020132722.20565-2-SkyLake.Huang@mediatek.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 18 Nov 2024 11:55:39 +0100
Message-ID: <87bjyczu8k.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_025544_334513_19924352 
X-CRM114-Status: UNSURE (   7.85  )
X-CRM114-Notice: Please train this message.
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

T24gMjAvMTAvMjAyNCBhdCAyMToyNzoxOSArMDgsIFNreSBIdWFuZyA8U2t5TGFrZS5IdWFuZ0Bt
ZWRpYXRlay5jb20+IHdyb3RlOgoKPiBGcm9tOiAiU2t5Lkh1YW5nIiA8c2t5bGFrZS5odWFuZ0Bt
ZWRpYXRlay5jb20+Cj4KPiBDcmVhdGUgZHJpdmVycy9tdGQvbmFuZC9wYXJhbS5jIHNvIE9ORkkg
cGFyYW1ldGVyIHBhZ2UgJiBDQVNOIHBhZ2UKPiBjYW4gYm90aCB1c2UgbmFuZGRldl9jcmMxNigp
IGFuZCBuYW5kZGV2X2JpdF93aXNlX21ham9yaXR5KCkgZGlyZWN0bHkKPiBsaWtlIHRoaXM6Cj4g
KiBGb3IgT05GSSBQYXJhbWV0ZXIgcGFnZToKPiBvbmZpX2NyYzE2KCkgLT4gbmFuZGRldl9jcmMx
NigpCj4gKiBGb3IgQ0FTTiBwYWdlOiBuYW5kZGV2X2NyYzE2KCkKPgo+IG5hbmRkZXZfYml0X3dp
c2VfbWFqb3JpdHkoKSBpcyBzYW1lIGFzIG5hbmRfYml0X3dpc2VfbWFqb3JpdHkoKS4KClBsZWFz
ZSB1c2UgdGhlIHNhbWUgbmFuZGRldl8gcHJlZml4LgoKPiBuYW5kZGV2X2NyYzE2KCkgaXMgc2Ft
ZSBhcyBvbmZpX2NyYzE2KCkuIEJ1dCB0aGVyZSBhcmUgbG90cyBvZgo+IG9uZmlfY3JjMTYoKSBj
YWxsLCBzbyBrZWVwIG9uZmlfY3JjMTYoKSB0aGVyZSBhbmQgaG9vayBpdCB0bwo+IG5hbmRkZXZf
Y3JjMTYoKS4KPgo+IFNpZ25lZC1vZmYtYnk6IFNreSBIdWFuZyA8c2t5bGFrZS5odWFuZ0BtZWRp
YXRlay5jb20+CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
