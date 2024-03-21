Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8493C54E68
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2024 13:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fsAOfGzxtBbeO/cZigDh2sbGATJhKfiiM7zwdKNiRrQ=; b=eGAgdl0A/NvPbu
	ieuLsjYTMuHbQ6rDZxNKoRPdrl2iMsULluUW4OX+agYU6Xa9bWHRQkQnNV5OY4FSImuKfwHyNb0HS
	56J6OPC/mpqGRYhc7qFLUNOvhCuX18eFI6hAnSmGQ1szORr7LypInJI+0mypV86xrQSIXzDw82y4O
	0rpDnUU23afXa2jfH6fbcWqb3xfVaHyleLZiYLP5asX5/hFtwBwhAkPBwzxhEic/V/ZxdHk7XF7fL
	d04bPS6Z2WVHGSZz2+E+CvUq/yaA6VzXfoKt4++pF+di4YJshTLEodyNOnAAlQgd2OeEb7qrcpyWo
	t7wjlNldhX8FzqW9Gm1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnIKf-000000036Hj-03IP;
	Thu, 21 Mar 2024 13:19:45 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnIKb-000000036Gi-1C8w
	for linux-mtd@lists.infradead.org;
	Thu, 21 Mar 2024 13:19:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D9BBE0009;
	Thu, 21 Mar 2024 13:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711027178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wux1s3DDeZBv3SAkVVcioL1ZXc29Eq5S/w6BTrDFtLI=;
	b=MBoOE/TdPuhXe16Grsc3TzmXJ9oCsqgYShJpE3uG/edE5lbdMpxbLojckikoY/d/WP8DNa
	SrBSEsgml8tVUa3xDMX8uPIAnW1UifW3PflqNxQonUdqeiCBlRE2ngn2SkewJ1BGLu5KLH
	XNlVY14IOYZa7G0cwTECVqw99oilSgZPYGGTbMPKJ2Ay29sAWFRI07KWrGGGv965Q1CPN3
	7qEOjzke+bqJXJex0ocr6QJlkhuR0gWH8a03utAsnnRydbcKQM4sMlxGmbPB0PzkND0DFr
	jD30VPH0Ds5O6DRf14T+HxHfj4xIqNPvwAau7MaaSJxZM8WCVdmos+5HbNP6Hw==
Date: Thu, 21 Mar 2024 14:19:35 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: limit OTP NVMEM Cell parse to non Nand devices
Message-ID: <20240321141935.1b9f6e71@xps-13>
In-Reply-To: <65fc0d2b.050a0220.102ac.24f6@mx.google.com>
References: <20240321095522.12755-1-ansuelsmth@gmail.com>
	<20240321113256.7e66ac0f@xps-13>
	<65fc0d2b.050a0220.102ac.24f6@mx.google.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_061941_756509_88A35ABE 
X-CRM114-Status: GOOD (  24.68  )
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

SGksCgphbnN1ZWxzbXRoQGdtYWlsLmNvbSB3cm90ZSBvbiBUaHUsIDIxIE1hciAyMDI0IDExOjM0
OjE2ICswMTAwOgoKPiBPbiBUaHUsIE1hciAyMSwgMjAyNCBhdCAxMTozMjo1NkFNICswMTAwLCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgQ2hyaXN0aWFuLAo+ID4gCj4gPiBhbnN1ZWxzbXRo
QGdtYWlsLmNvbSB3cm90ZSBvbiBUaHUsIDIxIE1hciAyMDI0IDEwOjU1OjEzICswMTAwOgo+ID4g
ICAKPiA+ID4gTVREIE9UUCBsb2dpYyBpcyB2ZXJ5IGZyYWdpbGUgYW5kIGNhbiBiZSBwcm9ibGVt
YXRpYyB3aXRoIHNvbWUgc3BlY2lmaWMKPiA+ID4ga2luZCBvZiBkZXZpY2VzLgo+ID4gPiAKPiA+
ID4gTlZNRU0gYWNyb3NzIHRoZSB5ZWFycyBoYWQgdmFyaW91cyBpdGVyYXRpb24gb24gaG93IENl
bGxzIGNvdWxkIGJlCj4gPiA+IGRlY2xhcmVkIGluIERUIGFuZCBNVEQgT1RQIHByb2JhYmx5IHdh
cyBsZWZ0IGJlaGluZCBhbmQKPiA+ID4gYWRkX2xlZ2FjeV9maXhlZF9vZl9jZWxscyB3YXMgZW5h
YmxlZCB3aXRob3V0IHRoaW5raW5nIG9mIHRoZSBjb25zZXF1ZW5jZXMuCj4gPiA+IAo+ID4gPiBU
aGF0IG9wdGlvbiBlbmFibGVzIE5WTUVNIHRvIHNjYW4gdGhlIHByb3ZpZGVkIG9mX25vZGUgYW5k
IHRyZWF0IGVhY2gKPiA+ID4gY2hpbGQgYXMgYSBOVk1FTSBDZWxsLCB0aGlzIHdhcyB0byBzdXBw
b3J0IGxlZ2FjeSBOVk1FTSBpbXBsZW1lbnRhdGlvbgo+ID4gPiBhbmQgZG9uJ3QgY2F1c2UgcmVn
cmVzc2lvbi4KPiA+ID4gCj4gPiA+IFRoaXMgaXMgcHJvYmxlbWF0aWMgaWYgd2UgaGF2ZSBkZXZp
Y2VzIGxpa2UgTmFuZCB3aGVyZSB0aGUgT1RQIGlzCj4gPiA+IHRyaWdnZXJlZCBieSBzZXR0aW5n
IGEgc3BlY2lhbCBtb2RlIGluIHRoZSBmbGFzaC4gSW4gdGhpcyBjb250ZXh0IHJlYWwKPiA+ID4g
cGFydGl0aW9ucyBkZWNsYXJlZCBpbiB0aGUgTmFuZCBub2RlIGFyZSByZWdpc3RlcmVkIGFzIE9U
UCBDZWxscyBhbmQKPiA+ID4gdGhpcyBjYXVzZSBwcm9iZSBmYWlsIHdpdGggLUVJTlZBTCBlcnJv
ci4KPiA+ID4gCj4gPiA+IFRoaXMgd2FzIG5ldmVyIG5vdGljZSBkdWUgdG8gdGhlIGZhY3QgdGhh
dCB0aWxsIG5vdywgbm8gTmFuZCBzdXBwb3J0ZWQKPiA+ID4gdGhlIE9UUCBmZWF0dXJlLiBXaXRo
IGNvbW1pdCBlODcxNjEzMjFhNDAgKCJtdGQ6IHJhd25hbmQ6IG1hY3Jvbml4OiBPVFAKPiA+ID4g
YWNjZXNzIGZvciBNWDMwTEZ4RzE4QUMiKSB0aGlzIGNoYW5nZWQgYW5kIGNvaW5jaWRlbnRhbGx5
IHRoaXMgTmFuZCBpcwo+ID4gPiB1c2VkIG9uIGFuIEZyaXR6Qm94IDc1MzAgc3VwcG9ydGVkIG9u
IE9wZW5XcnQuCj4gPiA+IAo+ID4gPiBBbHRlcm5hdGl2ZSBhbmQgbW9yZSByb2J1c3Qgd2F5IHRv
IGRlY2xhcmUgT1RQIENlbGxzIGFyZSBhbHJlYWR5Cj4gPiA+IHByb3NzaWJsZSBieSB1c2luZyB0
aGUgZml4ZWQtbGF5b3V0IG5vZGUgb3IgYnkgZGVjbGFyaW5nIGEgY2hpbGQgbm9kZQo+ID4gPiB3
aXRoIHRoZSBjb21wYXRpYmxlIHNldCB0byAib3RwLXVzZXIiIG9yICJvdHAtZmFjdG9yeSIuCj4g
PiA+IAo+ID4gPiBUbyBmaXggdGhpcyBhbmQgbGltaXQgYW55IHJlZ3Jlc3Npb24gd2l0aCBvdGhl
ciBNVEQgdGhhdCBtYWtlcyB1c2Ugb2YKPiA+ID4gZGVjbGFyaW5nIE9UUCBhcyBkaXJlY3QgY2hp
bGQgb2YgdGhlIGRldiBub2RlLCBkaXNhYmxlCj4gPiA+IGFkZF9sZWdhY3lfZml4ZWRfb2ZfY2Vs
bHMgaWYgd2UgaGF2ZSBhIG5vZGUgY2FsbGVkIG5hbmQgc2luY2UgaXQncyB0aGUKPiA+ID4gc3Rh
bmRhcmQgcHJvcGVydHkgbmFtZSB0byBpZGVudGlmeSBOYW5kIGRldmljZXMgYXR0YWNoZWQgdG8g
YSBOYW5kCj4gPiA+IENvbnRyb2xsZXIuICAKPiA+IAo+ID4gWW91IGZvcmdvdCB0byB1cGRhdGUg
dGhlIGNvbW1pdCBsb2cgOi0pCj4gPiAgCj4gCj4gVWdoLi4uIHNvcnJ5LiBPayB0byByZXNlbmQg
b3IgSSBuZWVkIHRvIHdhaXQgMjRoIHNpbWlsYXIgdG8gdGhlIHJ1bGVzIG9uCj4gbmV0LW5leHQ/
Cj4gCgpZb3UgY2FuIGdvIGFoZWFkLCBidXQgSSdsbCBvbmx5IHF1ZXVlIGl0IGFmdGVyIC1yYzEg
aXMgb3V0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
