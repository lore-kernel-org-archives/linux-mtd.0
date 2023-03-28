Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B853C6FD18
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 12:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0aPhYvr42H0NZljPr6G0Dnzxx1Tl0p/J7Mes3ccOrNE=; b=QSiYypxenR9v1R
	1sTUxQAMJR6KYTfQccB6sDYDxbzGhuS81puZzPwoYSjNlWkaOORpL8SF7q5zr0ZcLN/i9tvvs6y40
	41Xx5NAhjnQQTgXZqSgQQK5MMOz9tbVs1/JOSKD8/CyzW9KI7LY9UEifrl2vEMF1wvcT1kOhfn2Gc
	sdSS8fi/UffScTk5LpLagJvokezGT5XvUIwcDcfc+Tk4Euo/xlplb4F+AiO/kFaIDJfgShsA8Pi+q
	z4ui6LZ+uxX4DCXK3zWrUF2Cl0rhtxsyyZtJfgqdbppaTS7AdnfAx+NNHIpDjirJdrGr+HQW2o4G0
	J13lhkekqUC0AfxCDWGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph8sh-00ESpj-1h;
	Tue, 28 Mar 2023 12:56:55 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph8sd-00ESnV-1L
	for linux-mtd@lists.infradead.org;
	Tue, 28 Mar 2023 12:56:54 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 98BB960003;
	Tue, 28 Mar 2023 12:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680008202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZSlLQghHIFL3M5xh3xr1rj4t1TXCqa427YGaNbcDRjM=;
	b=XD+Bokt0186NupiJEabVssWUp8xwPGcTAcJC7SuuKWFoA0dHZ0FhVxKIg8nRLHIrXsaqLj
	1Qrq0LaY15Fr/ZdMTcitYaVBRbQ08mJOClcm1kod5m1reV96Gn3zUll+nvwxI6vrCQ2Tzl
	C/j/kSsbJlS0bqhpHmr2aEDyCFGTJsGw4HvmQfrXH2mWfn12jLXrsMM+4o3sa87EDM1JRj
	aG3Cp9eTRCZSGydhbxs2396AwHgvD5ejAndoUl+DVFYXcTPWMcQV1pZNbsUB+Jv8jpmObj
	M2kSMaHFCaI9AD3s9wv0xeE8HIXynn5YMOi27iFlMubK5lblSlXbJugvJg0CkA==
Date: Tue, 28 Mar 2023 14:56:39 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Kurbanov <mmkurbanov@sberdevices.ru>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Dmitry Rokosov <ddrokosov@sberdevices.ru>, Chuanhong Guo
 <gch981213@gmail.com>, Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
 Felix Matouschek <felix@matouschek.org>, <kernel@kempniu.pl>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <kernel@sberdevices.ru>
Subject: Re: [PATCH v3] mtd: spinand: add support for ESMT F50x1G41LB
Message-ID: <20230328145639.1aef44e2@xps-13>
In-Reply-To: <20230322151625.791131-1-mmkurbanov@sberdevices.ru>
References: <20230322151625.791131-1-mmkurbanov@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_055651_605480_61E18383 
X-CRM114-Status: GOOD (  13.16  )
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

SGkgTWFydGluLAoKbW1rdXJiYW5vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBXZWQsIDIyIE1h
ciAyMDIzIDE4OjE2OjI1ICswMzAwOgoKPiBGcm9tOiBDaHVhbmhvbmcgR3VvIDxnY2g5ODEyMTNA
Z21haWwuY29tPgo+IAo+IFRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0IGZvciBFU01UIEY1MEwxRzQx
TEIgYW5kIEY1MEQxRzQxTEIuCj4gSXQgc2VlbXMgdGhhdCBFU01UIGxpa2VzIHRvIHVzZSByYW5k
b20gSkVERUMgSUQgZnJvbSBvdGhlciB2ZW5kb3JzLgo+IFRoZWlyIDFHIGNoaXBzIHVzZXMgMHhj
OCBmcm9tIEdpZ2FEZXZpY2UgYW5kIDJHLzRHIGNoaXBzIHVzZXMgMHgyYyBmcm9tCj4gTWljcm9u
LiBGb3IgdGhpcyByZWFzb24sIHRoZSBFU01UIGVudHJ5IGlzIG5hbWVkIGVzbXRfYzggd2l0aCBl
eHBsaWNpdAo+IEpFREVDIElEIGluIHZhcmlhYmxlIG5hbWUuCgpJIHdhcyBhYm91dCB0byBtZXJn
ZSB0aGlzIHBhdGNoIGJ1dCBpdCB0dXJucyBvdXQgdGhlcmUgYXJlIGNvbmZsaWN0cyBpbgp0aGUg
dHJlZS4gQ2FuIHlvdSBwbGVhc2UgcmViYXNlIG9uIHRvcCBvZiBuYW5kL25leHQgYW5kIHNlbmQg
YSB2ND8KCj4gCj4gRGF0YXNoZWV0czoKPiBodHRwczovL3d3dy5lc210LmNvbS50dy91cGxvYWQv
cGRmL0VTTVQvZGF0YXNoZWV0cy9GNTBMMUc0MUxCKDJNKS5wZGYKPiBodHRwczovL3d3dy5lc210
LmNvbS50dy91cGxvYWQvcGRmL0VTTVQvZGF0YXNoZWV0cy9GNTBEMUc0MUxCKDJNKS5wZGYKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBDaHVhbmhvbmcgR3VvIDxnY2g5ODEyMTNAZ21haWwuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IE1hcnRpbiBLdXJiYW5vdiA8bW1rdXJiYW5vdkBzYmVyZGV2aWNlcy5ydT4K
PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgUm9rb3NvdiA8ZGRyb2tvc292QHNiZXJkZXZpY2VzLnJ1
Pgo+IFRlc3RlZC1ieTogTWFydGluIEt1cmJhbm92IDxtbWt1cmJhbm92QHNiZXJkZXZpY2VzLnJ1
PgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
