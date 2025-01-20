Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE877C02185
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2025 08:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X+P4YdUMRmwpVjsg8VQvWvic98n0NoVSNf0ed/sJpCE=; b=pwQ9ShN6Wajr9a
	7z03XQ/Y46Lxrs6xXEOaAyZjgczBcfhP8HUbZWvoktUgolF0Q0Vo3U4j/X3CkaHHdxnfO5e9ODzkV
	MXtB7F2jepFq0YPrRBvTwg0csS3E7rEdQrmGZCeoZ4ncjcj8+x8elnU71mO1Y9jW6u8fmyFW8++dL
	BdJgZx4WJ4sTmBNggxPH5YekoYfV4EuLIwiavGN/ZEvdMZmfhw67svIfGeR7byXsLYl3IIaNW7GLP
	5WQZrqWcdFMa9DYH6O/Qsd8SbWoXggrUAJOmJuFmJ7+rYJvWjSd6e4qoQAkx5eXUhKOiUuhSRuCno
	d+E1ApteG3eas1VhOVkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZmrM-00000004zQr-41k4;
	Mon, 20 Jan 2025 08:10:12 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZmrJ-00000004zQF-1rDA
	for linux-mtd@lists.infradead.org;
	Mon, 20 Jan 2025 08:10:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C5DB24000A;
	Mon, 20 Jan 2025 08:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737360605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H4+cy6US/uZAjZmugxgIPG09WzOslaSKe4LUtckj+9w=;
	b=OnvprkhIw7yOUZO1XyyC2I5wZ2cCxTJv7kjHrd0itixN6Q2mDOz6pzI4c98f8Dl8hQrkeM
	DNFQMnXhiLPVc+KThh0RKrNEOGfapOzeNySQqdphA44+0HG7T6j3zl2SSp6UCRicQn6lP0
	rJh3mG/4c4AdZRz+Ayiv5WFkVHV/nEejPpkXha9TaZPOzBl9h9JjWJcIZx8JouIB5DP7Hl
	hb32Xf/eSeaaBMlAkNIlX4eNrVbsKOOqF7upJkh0b3XbWQjQVZAV82KuGTtqSOCr36y3MO
	/C60C3WdnPj8ogR0Ash4b7QrPapaB03l/GAV8cLkrv2UZSkJyHKmrrefRyzEyw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-media@vger.kernel.org
Subject: Re: [PATCH v11 2/2] mtd: rawnand: Add Loongson-1 NAND Controller
 Driver
In-Reply-To: <CAJhJPsVhH=8dKmUgmTSHnG8H1_9G3zvovX9hDv_VM6fSUR5oQw@mail.gmail.com>
	(Keguang Zhang's message of "Sat, 18 Jan 2025 16:01:19 +0800")
References: <20241217-loongson1-nand-v11-0-b692c58988bb@gmail.com>
	<20241217-loongson1-nand-v11-2-b692c58988bb@gmail.com>
	<87v7ufnc0w.fsf@bootlin.com>
	<CAJhJPsWe+maw+zK6uiwvObTd_Ew73yjH=KddkgxwY7Zp0Y7ZYw@mail.gmail.com>
	<87plkli9fj.fsf@bootlin.com>
	<CAJhJPsVhH=8dKmUgmTSHnG8H1_9G3zvovX9hDv_VM6fSUR5oQw@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 20 Jan 2025 09:10:04 +0100
Message-ID: <874j1tykgz.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_001009_623018_F499E45F 
X-CRM114-Status: UNSURE (   9.91  )
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

Cj4+ID4+IERvbid0IHlvdSBuZWVkIGEgZG1hX2FkZHJfdCBoZXJlIGluc3RlYWQ/IFlvdSBzaGFs
bCByZW1hcCB0aGUgcmVzb3VyY2UuCj4+ID4+Cj4+ID4gU29ycnksIEkgZG9uJ3QgcXVpdGUgdW5k
ZXJzdGFuZC4KPj4gPiAnZG1hX2Jhc2UnIGlzIGFscmVhZHkgb2YgdHlwZSBkbWFfYWRkcl90Lgo+
Pgo+PiBJIGRpZG4ndCBpZGVudGlmeSB3aGVyZSB0aGUgZG1hX2Jhc2Ugd2FzIHJlbWFwcGVkLCBi
dXQgaWYgdGhhdCdzIGFscmVhZHkKPj4gZG9uZSB0aGVuIHdlJ3JlIGdvb2QuCj4KPiBQZXJoYXBz
IEkgbWlzdW5kZXJzdGFuZCB0aGUgdXNhZ2Ugb2YgZG1hX21hcF9yZXNvdXJjZSgpLiBkbWFfYmFz
ZSBpcwo+IHRoZSBwaHlzaWNhbCBhZGRyZXNzIGFuZCB3aWxsIGJlIHdyaXR0ZW4gdG8gdGhlIERN
QSBjb250cm9sbGVyCj4gcmVnaXN0ZXIgYXQgbGFzdC4KCklJVUMsIHllcyBhbmQgbm8uIEl0IGlz
IHRoZSByZW1hcHBlZCBhZGRyZXNzIG9mIHRoZSBwaHlzaWNhbCBhZGRyZXNzIHlvdQp3YW50IHRv
IHJlYWNoLCBub3QgdGhlIHBoeXNpY2FsIGFkZHJlc3MgaXRzZWxmLiBUaGUgdHlwZSBpcyBkbWFf
YWRkcl90CmFuZCBub3QgcGh5c19hZGRyX3QgYW5kIHlvdSBjYW4gZ2V0IGEgZG1hIGFkZHJlc3Mg
b3V0IG9mIGEgcGh5c2ljYWwKYWRkcmVzcyB3aXRoIGEgY2FsbCB0byBkbWFfbWFwX3Jlc291cmNl
KCkuIFRoZSBudW1lcmljYWwgdmFsdWUgbWlnaHQgYmUKdGhlIHNhbWUgaWYgdGhlcmUgaXMgbm8g
SU8tTU1VIGludm9sdmVkLCBidXQgdGhlIGdvb2QgcHJhY3RpY2UgaXMgdG8KcmVtYXAgYW55d2F5
LgoKVGhhbmtzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
