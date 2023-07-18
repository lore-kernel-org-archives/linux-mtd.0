Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E51C001B0
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 05:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G71Mijx+WeEWpJaE/m5zGv4zgB3zbo25wgGscAqQoC4=; b=O6rBe48hIgxdVQ
	Td+FqPVngJ9yuNW26X/ommt6QQMtPVIe5tYVYEpmUQMP6PEFL3OXNXwa0QFcGjGEnVzgdar5GHZfq
	n+MWNa7FceWtxlaQlKdiwbkDT56nS1pv0KTSZd3WLd1ws0GwsvTXeWnxdJdgxjAUBr9PT63YGJJlY
	rx4NJDtpBOQFQ+ecuZHD1SEp80c+6NpKnL34XiqoHJtuEDPcIrHCU3EI6SsSbupKKJ3p/IE6mXWB+
	4cmKrvsVYylXvEyre4D05SFkZqsm4acIhDmyGP9ZmbI+tUE3XH66Lnw9vo5AJw7WDDE+/ODVIgScK
	WDB/BTKINLbFwU/U9WPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLztu-005MjJ-0w;
	Wed, 19 Jul 2023 05:39:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzts-005MiQ-28
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:39:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rZ0tsLSHYDdinW0/0PSHBjblW1PDJmeicsu1MK6xsHo=; b=X2HwNO9BDF5WbwDe2FZUwP7FNo
	CL42xjaXJvAt9OAtC/CelEZI7cmWjLlqmK17QYXQ0nvMFZl6qE1QZq0aBQj1dOzMkGmK6D/UzlTlp
	Ga930ELnnFM1bppPhvOk4xeldKPADBn6aeJ2xuqMfuuOXR0OPIpapPnjra42ngs4mEdmBZK444i6Y
	bX3OQWg3os1B2XwGx0h0Kl6nsAo7Zx5GlcvVR/620x8RNZ/T23tJkVTalj/pQiWHlENX2fXv+AD73
	jya1PYAJzKCtnACNLWukgdCS8l2KsRIoElk8utXwRLXuiHeIgu5MJpcKZ8E3EfvIWfmcAWQ7zgFSF
	xeh47LkA==;
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLgro-00BLvu-2I
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 09:20:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9A16FF808;
	Tue, 18 Jul 2023 09:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689671951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rZ0tsLSHYDdinW0/0PSHBjblW1PDJmeicsu1MK6xsHo=;
	b=CT8zw+LeHEjAlkRmAO6trQ+Y7PgX95BBLggVkp1O2D5aq9mec4Qk7pQbOVriI1Cb2LQjUX
	xjoaWjTwcg77DLUFdNYpluZq0Te6uErtV5HqM7OnKeSIEX7YmUbswaA9rQ3rLDr39LNKl1
	QYPvJ3dYYbG5mbUX5+yy17iflFTRXYa3acpg0hMwfnBpoThYuR8zDXD1acB+78jak4TKNM
	N5G/Vf2VolmNUjAldig0cTnt1C4wjik/A2A24vSQLOQCaUa5oiI2eY6MUjWrS9OfhNpeb6
	ltkVvNeeqKACXJ61a3tTDYuArkmDgWBHfGXIwvhKsjHMPRO3jydabU1hn7F+hQ==
Date: Tue, 18 Jul 2023 11:19:06 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Bartosz
 Golaszewski <bgolaszewski@baylibre.com>, Alban Bedel <albeu@free.fr>,
 Christian Marangi <ansuelsmth@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Subject: Re: [PATCH] Revert "nvmem: add new config option"
Message-ID: <20230718111906.7a69c320@xps-13>
In-Reply-To: <20230718084804.20139-1-zajec5@gmail.com>
References: <20230718084804.20139-1-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_102014_877338_DE5293DD 
X-CRM114-Status: UNSURE (   8.47  )
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

SGkgUmFmYcWCLAoKemFqZWM1QGdtYWlsLmNvbSB3cm90ZSBvbiBUdWUsIDE4IEp1bCAyMDIzIDEw
OjQ4OjA0ICswMjAwOgoKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+
Cj4gCj4gVGhpcyByZXZlcnRzIGNvbW1pdCA1MTdmMTRkOWNmMzUzM2Q1YWI0ZmRlZDE5NWFiNmY4
MGE5MmUzNzhmLgo+IAo+IEl0IHNlZW1zIHRoYXQgIm5vX29mX25vZGUiIGNvbmZpZyBvcHRpb24g
d2FzIGFkZGVkIHRvIGhlbHAgbXRkJ3MgY2FzZS4KPiAKPiBEVCBub2RlcyBvZiBNVEQgcGFydGl0
aW9ucyAodGhhdCBhcmUgYWxzbyBOVk1FTSBkZXZpY2VzKSBtYXkgY29udGFpbgo+IHN1Ym5vZGVz
IHRoYXQgU0hPVUxEIE5PVCBiZSB0cmVhdGVkIGFzIE5WTUVNIGZpeGVkIGNlbGxzLiBUbyBwcmV2
ZW50Cj4gTlZNRU0gY29yZSBjb2RlIGZyb20gcGFyc2luZyB0aGVtICJub19vZl9ub2RlIiB3YXMg
c2V0IHRvIHRydWUgYW5kIHRoYXQKPiBtYWRlIGZvcl9lYWNoX2NoaWxkX29mX25vZGUoKSBpbiBO
Vk1FTSBhIG5vLW9wLgo+IAo+IFdpdGggdGhlIGludHJvZHVjdGlvbiBvZiAiYWRkX2xlZ2FjeV9m
aXhlZF9vZl9jZWxscyIgY29uZmlnIG9wdGlvbgo+IHRoaW5ncyBnb3QgbW9yZSBleHBsaWNpdC4g
TVREIHN1YnN5c3RlbSBzaW1wbHkgdGVsbHMgTlZNRU0gd2hlbiB0byBsb29rCj4gZm9yIGZpeGVk
IGNlbGxzIGFuZCB0aGVyZSBpcyBubyBuZWVkIHRvIGhhY2sgIm9mX25vZGUiIHBvaW50ZXIgYW55
bW9yZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2ku
cGw+CgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNv
bT4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
