Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E547C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Mar 2022 09:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6LkneJggINhV3DzWocbR6nvMpTAzQbVh3zQmhkgkR5o=; b=vkq1advEBMug6x
	knL2NDrXq6RmkBKAMJ99PO5hnW+SBvwiEvfLp/cuLTie5u/5PD4Kxdz1Sp2dF32c7ERZc41ZF8hpr
	P06xmeaZZg0bBQwd58HTAyNXs3JJyNqo3b8X9BY7LkISV8jx3/2cYc2WXXSyBpB2i5bbBlnXMQvIn
	NIivzwvi6RthcYhXH5gcsx+89xuQ73w5E1uOA33oaQD6qVu+BJ3Zo+AZGYFv03s+A470y3me7fV14
	ZhhaFZKqWOttsyWKbndCb+h2BRBqDECkJxdKZZL/rZejTx+3St8JNNhlg7CJ8pAfXHRYYSXuqKdFj
	kylPCbmYDIOEb588yGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYlOM-007yxR-AM; Mon, 28 Mar 2022 09:10:26 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYlOG-007yth-VJ
 for linux-mtd@lists.infradead.org; Mon, 28 Mar 2022 09:10:23 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AAB96FF80B;
 Mon, 28 Mar 2022 09:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1648458616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7aARYbxZWyeQgRZ1/im0fGsSE+ad3LBtIevTSZ2bZxs=;
 b=nNhSLS8yT7VkOXAP/A7yaoSWYbvWSfjDM9akivDKa+tgPIDt3DyxSjvxhniwurS2DSat/R
 RtQCMonHxKVQRyFs5GwAKzVjULA/9lJ5qoabTUZajYG3lDd2HixldIwFPlq+a/l4NIq1Ol
 SjwTTbSFdoyyj4arGd9itTm7OlSn5zh1DwSqxFRAISyOxABdQLowYoM8m9iswfhgPU19L6
 PSAGauwqR0QeyrO8H0/VytXhDcao0ClUe1/eJo7JGAAWqYscX/O+v6kAqmhFHM+kv+Pe0V
 vpf9Vgept5dD1ERtsJc4tJhxJ4f2jCP6ZrasagcEvMNmWoS1HgP1xlfNRDlzCA==
Date: Mon, 28 Mar 2022 11:10:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>
Cc: sbabic@denx.de, sean@geanix.com, frieder.schrempf@kontron.de,
 festevam@gmail.com, ye.li@nxp.com, peng.fan@nxp.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 2/2] mtd: rawnand: gpmi: Add large oob bch setting
 support
Message-ID: <20220328111014.32526b32@xps13>
In-Reply-To: <20220325211411.30714-2-han.xu@nxp.com>
References: <20220325211411.30714-1-han.xu@nxp.com>
 <20220325211411.30714-2-han.xu@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_021021_507298_B3898B84 
X-CRM114-Status: GOOD (  23.67  )
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

SGkgSGFuLAoKaGFuLnh1QG54cC5jb20gd3JvdGUgb24gRnJpLCAyNSBNYXIgMjAyMiAxNjoxNDox
MSAtMDUwMDoKCj4gVGhlIGNvZGUgY2hhbmdlIHByb3Bvc2VzIGEgbmV3IHdheSB0byBzZXQgYmNo
IGdlb21ldHJ5IGZvciBsYXJnZSBvb2IKPiBOQU5EIChvb2JzaXplID4gMUtCKS4gSW4gdGhpcyBj
YXNlLCBwcmV2aW91cyBpbXBsZW1lbnRhdGlvbiBjYW4gTk9UCj4gZ3VhcmFudGVlIHRoZSBiYWQg
YmxvY2sgbWFyayBhbHdheXMgbG9jYXRlcyBpbiBkYXRhIGNodW5rLCBzbyB3ZSBuZWVkIGEKPiBu
ZXcgd2F5IHRvIGRvIGl0LCB0aGUgZ2VuZXJhbCBpZGVhIGlzLAo+IAo+IDEuVHJ5IGFsbCBFQ0Mg
c3RyZW5ndGggZnJvbSB0aGUgbWluaW11bSB2YWx1ZSByZXF1aXJlZCBieSBOQU5EIGNoaXAgdG8K
PiAgIHRoZSBtYXhpbXVtIG9uZSB0aGF0IGNvbnRyb2xsZXIgY2FuIHByb3ZpZGUsIGFueSBFQ0Mg
c3RyZW5ndGggbWFrZXMKPiAgIHRoZSBCQk0gbG9jYXRlIGluIGRhdGEgY2h1bmsgY2FuIGJlIGVs
aWdpYmxlLgoKV2h5IGRvIHlvdSBzdGFydCBmcm9tIHRoZSBsb3dlc3Qgc3RyZW5ndGggdG93YXJk
cyB0aGUgYmlnZ2VzdD8gV2hhdCBpcwp5b3VyIGdvYWwgaGVyZT8gV291bGQgaXQgYmUgYmV0dGVy
IHRvIGRvIGl0IGluIHRoZSBvdGhlciBkaXJlY3Rpb24/Cgo+IDIuSWYgbm9uZSBvZiB0aGVtIHdv
cmtzLCB1c2luZyBzZXBhcmF0ZSBFQ0MgZm9yIG1ldGEsIHdoaWNoIHdpbGwgYWRkCj4gICBvbmUg
ZXh0cmEgZWNjIHdpdGggdGhlIHNhbWUgRUNDIHN0cmVuZ3RoIGFzIG90aGVyIGRhdGEgY2h1bmtz
LiAgVGhpcwo+ICAgZXh0cmEgRUNDIGNhbiBndWFyYW50ZWUgQkJNIGxvY2F0ZWQgaW4gZGF0YSBj
aHVuaywgYWxzbyB3ZSBuZWVkIHRvCj4gICBjaGVjayBpZiBvb2IgY2FuIGFmZm9yZCBpdC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBIYW4gWHUgPGhhbi54dUBueHAuY29tPgo+IAo+IC0tLQo+IENoYW5n
ZXMgaW4gdjI6Cj4gIC0gc3BsaXQgdGhlIGxhcmdlIG9vYiBwYXJ0IHRvIGEgc2luZ2xlIHBhdGNo
Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYyB8IDI0
NyArKysrKysrKysrKysrKysrKystLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5k
L2dwbWktbmFuZC5oIHwgIDEyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjI4IGluc2VydGlvbnMo
KyksIDMxIGRlbGV0aW9ucygtKQo+IAoKWy4uLl0KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuaCBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dw
bWktbmFuZC9ncG1pLW5hbmQuaAo+IGluZGV4IDVlMWMzZGRhZTVmOC4uOWFkZTQwZDBmNTg2IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuaAo+
ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuaAo+IEBAIC0z
MCw5ICszMCw5IEBAIHN0cnVjdCByZXNvdXJjZXMgewo+ICAgKiBAcGFnZV9zaXplOiAgICAgICAg
ICAgICAgICBUaGUgc2l6ZSwgaW4gYnl0ZXMsIG9mIGEgcGh5c2ljYWwgcGFnZSwgaW5jbHVkaW5n
Cj4gICAqICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvdGggZGF0YSBhbmQgT09CLgo+ICAg
KiBAbWV0YWRhdGFfc2l6ZTogICAgICAgICAgICBUaGUgc2l6ZSwgaW4gYnl0ZXMsIG9mIHRoZSBt
ZXRhZGF0YS4KPiAtICogQGVjY19jaHVua19zaXplOiAgICAgICAgICAgVGhlIHNpemUsIGluIGJ5
dGVzLCBvZiBhIHNpbmdsZSBFQ0MgY2h1bmsuIE5vdGUKPiAtICogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdGhlIGZpcnN0IGNodW5rIGluIHRoZSBwYWdlIGluY2x1ZGVzIGJvdGggZGF0YSBh
bmQKPiAtICogICAgICAgICAgICAgICAgICAgICAgICAgICAgbWV0YWRhdGEsIHNvIGl0J3MgYSBi
aXQgbGFyZ2VyIHRoYW4gdGhpcyB2YWx1ZS4KPiArICogQGVjY19jaHVuazBfc2l6ZTogICAgICAg
ICAgVGhlIHNpemUsIGluIGJ5dGVzLCBvZiBhIGZpcnN0IEVDQyBjaHVuay4KPiArICogQGVjY19j
aHVua25fc2l6ZTogICAgICAgICAgVGhlIHNpemUsIGluIGJ5dGVzLCBvZiBhIHNpbmdsZSBFQ0Mg
Y2h1bmsgYWZ0ZXIKPiArICogICAgICAgICAgICAgICAgICAgICAgICAgICAgdGhlIGZpcnN0IGNo
dW5rIGluIHRoZSBwYWdlLgoKSSdtIG5vdCBzdXJlIHdoYXQgeW91IG1lYW4gYnkgY2h1bmswIGFu
ZCBjaHVua24gYWxsIG92ZXIgdGhpcyBwYXRjaC4KV291bGRuJ3QgaXQgYmUgImNodW5rIiBhbmQg
Im1ldGFfY2h1bmsiIG9yIHNvbWV0aGluZyBsaWtlIHRoaXM/CgpQZXJoYXBzIGlmIGl0IGlzIHNp
bXBsZSB5b3UgbWlnaHQganVzdCBkbyB0aGUgcmVuYW1lIG9mIHdoYXQgaXMKZXhpc3RpbmcgKGxp
a2UgY2h1bmsgLT4gY2h1bmtuIGlmIGl0IHN0aWxsIGFwcGxpZXMgZm9yIGluc3RhbmNlKSBhbmQK
dGhlbiBpbiBhbm90aGVyIHBhdGNoIGJyaW5nIHN1cHBvcnQgZm9yIHRoZSBtZXRhIGFkZGl0aW9u
YWwgY2h1bms/CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
