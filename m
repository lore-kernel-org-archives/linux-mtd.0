Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7614FC61DE3
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Feb 2026 09:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=43tlJZmGVg8zu9lbPCuF7iUJdOyCvvOeiduVSGEUE6w=; b=qe6awnwc2oUFbn
	oESi5iuHaH6Y9CybpA9bOJGfzX07H15unoeHnV9zNQlS2g3rHhSm3vDnQYsFwPpKhiwpE6vCsKrYG
	cy4JU92/RnAGkt9icDvlH4/lluVs0FglHj/rKendlgBGZV/8ynsp8ipcyN1fHpkU+Z00UDHLcRjQs
	o5ysysxYPSUAXfwypkOxU7PUffExKcDGbuPIkAAD4oaiNm4lDn+Jd6Z9znhgiTPA1x9Pxko52v8/1
	7MppXbB2ECv0M0MWHNjoFL8/krJFvhiBvzWU9HB0YeAYjYF1VDNOIMBtaQ+xL9K687Cm3pIEmYHR4
	7aC2w5I993u6XtpJVU4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtjTE-0000000FwjP-0edA;
	Sat, 21 Feb 2026 09:40:16 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtjT8-0000000Fwed-1WHb
	for linux-mtd@lists.infradead.org;
	Sat, 21 Feb 2026 09:40:11 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4376acce52eso1737783f8f.1
        for <linux-mtd@lists.infradead.org>; Sat, 21 Feb 2026 01:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771666808; x=1772271608; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2dvvtP0QHY/bsWx4Eesgw3WQJgKi927oam26nArPGM=;
        b=PfrE8inIoNPRGadu0Yu2TFU3PPQvKDOjGnYvyxxJAe+JcXD2IOWoGgI5hYXf3gPIhI
         nWlwQ4WPvJpcsgu6/4Wf2N4hpWmsSGr2pEIr/Vcc5lJ+OFnokNBMK5SgQiAekdCWN2Dj
         Ch2u04qZa1Moe7NrhbJljKMBEdMDVqWyZpC5JT6QDPavKgWwCB0BlpDFYFg0IkcQEJC1
         j0O71zHC8GBamMPjjRuZp3KUXF7d9WP3YpCxbMuf09dSUvkh3iqwtb4b+G73MbwdfurG
         CBUO7UQutcmOBxLPcOv3B3Sa6n1bTd+9uErpiUQVODyJ1nNaYXw7LK7ScojNoIzM6wHG
         GhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771666808; x=1772271608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X2dvvtP0QHY/bsWx4Eesgw3WQJgKi927oam26nArPGM=;
        b=OPfXcGutT3BpTHOkdxjyA3d0Yv4O9uM91ruhPfDKBOfHOY+nt3TproQf56b5WPUZwZ
         Eb31tD/xMukG/C0Y/QfkFdoZo+AFLR1R1L1zSEM11zwZ+wczUff66+gQ+oAN0X9QV8VH
         fcOYEJqXeuQEA3/IMCyOWHiMT7HVaM1IbMdrNUBLEBnLA3Gk5mJcW3jxWPVtnkO5NYGh
         DnMYYLCMHyYnOo0DKdFNMa9+rGq+AmcIQhquRv6+4gV9cbY778LAkbuNeqwz/EiwmoDq
         jQDbzEGbUGVMFxxB4Lp2QT+Cx2iXNfncxHpjErgc9/Efsd0bxaSmSVIDjhkmc8l706Fh
         uD7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWsMpmSmXkZXsCHOeahhEjHLGla/jw212pYKr1oImBeswpsNCgOdWCr4FyMUPnzQHjj2TObziC4HIU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1z7z1+nokdgDZBB1wPkVi2100nRfLNBcMZ5if6Rzx7rz6LBNa
	cAud+bGpcFQ4DMSP7vJZ9u8fe4xlz2gJdJkdtSosVTfecFnRtxtyl4x0
X-Gm-Gg: AZuq6aLLEqojwAFjKGz+mxF9ac7Ubj0s3UjyX3KCBIvCOyi3wLN6NI6Hh1JLuCBM5Ht
	a95KCdHp/jdoFh/G72PqeSPlR1AlBRtFW9Slzn23b61QRi3+92dZadSJGOMnDyRNQBwjjADnlUl
	7hKICVkWB4OvmpWZd0spukqn4CvbQaRQrS1KFqcqCMdHhmqAcvxfSrOabS4HJYT9XLsVY3HbhcU
	e2yER49wnDmUxi1/ky0AAdVofLaiGyxXx+nXDHgzfxCu0jI10Z7bffDFOlf68Wg2t120+WSigN4
	ePEnzjbdMKmUwMfZa/OHHo3cZzip/NQLTdKT71DckCJfr38/S2okyiDyk3mMlzI2pAk+PNBf5+o
	nh6AHBiGRIYE0KyefNU0it+cg0jCM9AJLGmI/z550uicZaLF6eF1m+8lMq7ol7VUU8NR9tc71gF
	AdFp3GuMCs9IxjjGVzQOEE1aWw1ft+CJk9v2m8pj6D8W5Pz+GpzrTHnz1TuBk8xg0e821GSQYRv
	5u9BjiB2bjW3MuGJQ==
X-Received: by 2002:a05:6000:604:b0:435:8ad8:b7a with SMTP id ffacd0b85a97d-4396f181362mr4957590f8f.46.1771666808395;
        Sat, 21 Feb 2026 01:40:08 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff6dsm4555030f8f.25.2026.02.21.01.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 01:40:08 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Richard Genoud <richard.genoud@bootlin.com>
Subject: Re: [PATCH 2/6] mtd: rawnand: sunxi: fix sunxi_nfc_hw_ecc_read_extra_oob
Date: Sat, 21 Feb 2026 10:15:56 +0100
Message-ID: <5078855.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20260220161011.999642-3-richard.genoud@bootlin.com>
References: <20260220161011.999642-1-richard.genoud@bootlin.com>
 <20260220161011.999642-3-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_014010_416719_2AF1B0E9 
X-CRM114-Status: UNSURE (   9.04  )
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

RG5lIHBldGVrLCAyMC4gZmVicnVhciAyMDI2IG9iIDE3OjEwOjA3IFNyZWRuamVldnJvcHNraSBz
dGFuZGFyZG5pIMSNYXMgamUgUmljaGFyZCBHZW5vdWQgbmFwaXNhbChhKToKPiBXaGVuIGR1bXBp
bmcgdGhlIE9PQiwgdGhlIGJ5dGVzIGF0IHRoZSBlbmQgd2hlcmUgYWN0dWFsbHkgY29waWVkIGZy
b20KPiB0aGUgYmVnaW5uaW5nIG9mIHRoZSBPT0IgaW5zdGVhZCBvZiBjdXJyZW50X29mZnNldC4K
PiAKPiBUaGF0IGxlYWRzIHRvIHNvbWV0aGluZyBsaWtlOgo+IE9PQjogZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZWEgMTkgMDAgM2EgODMgZGIgYWEgOGQKPiBPT0I6IDk5IDA5IGM4IDlhIDkwIDM2
IDM1IDdkIGFhIDE1IDEzIDA3IDNkIDk3IGIyIGE0Cj4gT09COiBhOCBiYiAxOSBiMyAwNyBlOSBm
NiAyNSA1MiBkNyAxYSAyMyBlMiA3ZSAwYSBlNAo+IE9PQjogNTIgOGEgMDkgZDIgMWEgODYgM2Qg
Y2YgYjQgOTkgNDMgMTMgZDMgOTAgMzMgMGIKPiBPT0I6IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGVhIDE5IDAwIDNhIDgzIGRiIGFhIDhkCj4gT09COiA5OSAwOSBjOCA5YSA5MCAzNiAzNSA3ZCBh
YSAxNSAxMyAwNyAzZCA5NyBiMiBhNAo+IE9PQjogYTggYmIgMTkgYjMgMDcgZTkgZjYgMjUgNTIg
ZDcgMWEgMjMgZTIgN2UgMGEgZTQKPiBPT0I6IDUyIDhhIDA5IGQyIDFhIDg2IDNkIGNmIGI0IDk5
IDQzIDEzIGQzIDkwIDMzIDBiCj4gaW5zdGVhZCBvZjoKPiBPT0I6IGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGVhIDE5IDAwIDNhIDgzIGRiIGFhIDhkCj4gT09COiA5OSAwOSBjOCA5YSA5MCAzNiAz
NSA3ZCBhYSAxNSAxMyAwNyAzZCA5NyBiMiBhNAo+IE9PQjogYTggYmIgMTkgYjMgMDcgZTkgZjYg
MjUgNTIgZDcgMWEgMjMgZTIgN2UgMGEgZTQKPiBPT0I6IDUyIDhhIDA5IGQyIDFhIDg2IDNkIGNm
IGI0IDk5IDQzIDEzIGQzIDkwIDMzIDBiCj4gT09COiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZgo+IE9PQjogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYKPiBPT0I6IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmCj4gT09COiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZgo+IChleGFtcGxlIHdpdGggQkNIMTYsIHVzZXIgZGF0YSBbOCwwXSwg
bm8gc2NyYW1ibGluZykKPiAKPiAqY3VyX29mZiAob2Zmc2V0IGZyb20gdGhlIGJlZ2lubmluZyBv
ZiB0aGUgcGFnZSkgd2FzIGNvbXBhcmVkIHRvIG9mZnNldAo+IChvZmZzZXQgZnJvbSB0aGUgYmVn
aW5uaW5nIG9mIHRoZSBPT0IpLCBhbmQgdGhlbiwgdGhlCj4gbmFuZF9jaGFuZ2VfcmVhZF9jb2x1
bW5fb3AoKSBzZXRzIHRoZSBjdXJyZW50IHBvc2l0aW9uIHRvIHRoZSBiZWdpbm5pbmcKPiBvZiB0
aGUgT09CIGluc3RlYWQgb2YgT09CK29mZnNldAo+IAo+IEZpeGVzOiAxNWQ2ZjExODI4NWYgKCJt
dGQ6IHJhd25hbmQ6IHN1bnhpOiBTdG9wIHN1cHBvcnRpbmcgRUNDX0hXX1NZTkRST01FIG1vZGUi
KQo+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgR2Vub3VkIDxyaWNoYXJkLmdlbm91ZEBib290bGlu
LmNvbT4KClJldmlld2VkLWJ5OiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwu
Y29tPgoKQmVzdCByZWdhcmRzLApKZXJuZWoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
