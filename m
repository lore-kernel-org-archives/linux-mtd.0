Return-Path: <SRS0=Kxx5=TH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA79C004C9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 10:07:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E1BB205ED
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 10:07:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rRQ+xSIX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Vk9cyniS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E1BB205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xo+Xtg9o/4/gCps/HHOWkEb4BFSs6gx4sTgDE7NKD8Q=; b=rRQ+xSIX5Y262C
	USu2c80RGZttrCZ1muDHVmJ8XrUNx50I8oLqukKGfTRuXeNF+nabVjIP1VHPdL1AFV/zme/qsujm3
	8DBd/cdPH5vjrhNYdF29i5z5NHKfLfXBJ2dg1V6Ab4PsIA6fv2DiRTuKuTy3o5QX3Pc9rOzDK8Zma
	1nIl61GcuInnTcf66PoaG0yxWu7Y8LA0SOysFaDArGwB81pJ/SedvJ5O2qMbjQjJ0ZmLuTMvQ+9RQ
	y5oqvSRc1f99H6G6owRFnyQYbaL6YPnyOcT7cpVpPiAAyJJ9/qeeRJH3Gsd+URlzZrOI5ZbXWoicB
	zMF2q2sUHhGK2Y5ENi8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNx0i-0003BP-2X; Tue, 07 May 2019 10:07:44 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNx0f-0003Ab-OP; Tue, 07 May 2019 10:07:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ngSi+cHq37G6kATEKdzAyh4gPLb0ZNpRbKkDoXXEZN8=; b=Vk9cyniSk/fXD2CV2QLfjHNhIv
 G4/f62igiMHH3sgB9ixQfjuje2CG0ZTBSqb+6p7TkI65e2a2Fg6S78OKXh7Wi4ODt8svBeLcpC6Fe
 /tb/yWiIxnT0/MkXGeZXYI6WvFCSp7j2N1konaQBmCtfJYZ+OO8lH2CwQ1u29rrZj9MlBF4xFz+4l
 Dzbe/jH7a2xoKwnrSNzdBpCoMn/oZfq9vlbZ44y49ptZrDtQ0WfInB7CkYhUPqrj1EJjDRFwFbj8T
 TWFTKA2gtUw9XyfkqQnxhi9jYxeyFf50lO1YQKwTT4WMc1ZX1JSyWSpXmDdrN5nlN4otQpZJIuL/b
 GBTtxNvw==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNx0b-0005X0-Nu; Tue, 07 May 2019 10:07:39 +0000
X-Originating-IP: 90.88.149.145
Received: from xps13 (aaubervilliers-681-1-29-145.w90-88.abo.wanadoo.fr
 [90.88.149.145]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 94BC7FF81B;
 Tue,  7 May 2019 10:06:45 +0000 (UTC)
Date: Tue, 7 May 2019 12:06:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xiaolei Li <xiaolei.li@mediatek.com>
Subject: Re: [RFC PATCH v4 1/1] mtd: rawnand: mtk: Re-license MTK NAND
 driver as Dual MIT/GPL
Message-ID: <20190507120644.6bd0d118@xps13>
In-Reply-To: <20190507092020.1917-2-xiaolei.li@mediatek.com>
References: <20190507092020.1917-1-xiaolei.li@mediatek.com>
 <20190507092020.1917-2-xiaolei.li@mediatek.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_060737_870438_71D1999C 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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
Cc: daniel.thompson@linaro.org, ryder.lee@mediatek.com, arnd@arndb.de,
 srv_heupstream@mediatek.com, gustavo@embeddedor.com, richard@nod.at,
 yingjoe.chen@mediatek.com, linux-mediatek@lists.infradead.org,
 yamada.masahiro@socionext.com, rafal@milecki.pl, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, weiyongjun1@huawei.com,
 yellowriver2010@hotmail.com, matthias.bgg@gmail.com,
 jorge.ramirez-ortiz@linaro.org, rogercc.lin@mediatek.com,
 dan.carpenter@oracle.com, peterpandong@micron.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWGlhb2xlaSwKClhpYW9sZWkgTGkgPHhpYW9sZWkubGlAbWVkaWF0ZWsuY29tPiB3cm90ZSBv
biBUdWUsIDcgTWF5IDIwMTkgMTc6MjA6MjAKKzA4MDA6Cgo+IEl0IGlzIHdhbnRlZCB0byB1c2Ug
TVRLIE5BTkQgZHJpdmVyIHdpdGggR1BMLTIuMCBvciBNSVQgbGljZW5zZS4KPiBCdXQgbm93IGl0
IGlzIG9ubHkgbGljZW5zZWQgYXMgR1BMLTIuMC4KPiBTbyByZS1saWNlbnNlIGl0IGFzIGR1YWwg
TUlUL0dQTCBhbmQgcmVwbGFjZSBsaWNlbnNlIHRleHQgd2l0aAo+IFNQRFggdGFnLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFhpYW9sZWkgTGkgPHhpYW9sZWkubGlAbWVkaWF0ZWsuY29tPgo+IEFja2Vk
LWJ5OiBKb3JnZSBSYW1pcmV6LU9ydGl6IDxqb3JnZS5yYW1pcmV6LW9ydGl6QGxpbmFyby5vcmc+
Cj4gQWNrZWQtYnk6IFJ5ZGVyIExlZSA8cnlkZXIubGVlQG1lZGlhdGVrLmNvbT4KPiBBY2tlZC1i
eTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IEFja2VkLWJ5OiBNaXF1ZWwg
UmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IEFja2VkLWJ5OiBCb3JpcyBCcmV6
aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+IEFja2VkLWJ5OiBSb2dlckND
IExpbiA8cm9nZXJjYy5saW5AbWVkaWF0ZWsuY29tPgo+IC0tLQoKV2hlbiB0aGVyZSBpcyBvbmx5
IG9uZSBwYXRjaCwgbm8gbmVlZCB0byBjcmVhdGUgYSBjb3ZlciBsZXR0ZXIuIFlvdSBjYW4KcHV0
IHRoZSB0ZXh0IHdoaWNoIGlzIGluIDAvMSBiZWxvdyB0aGUgdGhyZWUgZGFzaGVzICctLS0nLgoK
QWxzbyBubyBuZWVkIHRvIHNlbmQgYSBuZXcgdmVyc2lvbiB3aGlsZSB0aGVyZSBpcyBub3RoaW5n
IGNoYW5nZWQgaW4KdGhlIGNvZGUuIFBhdGNod29yayBhdXRvbWF0aWNhbGx5IGNvbGxlY3RzIHRh
Z3MuCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
