Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BF3E7717F
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Dec 2024 11:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+xXcGvIxG8buSgltwjRFm/ro2MsvCRmxoqNYFeVe5FY=; b=HkOnL8cPDn9nsD
	P6mmKwQJsMkErcjEI4BC/V9CTg+f7VvMjnrpMqhzH3HG8CvAoETY5u6FRUiD9B5CRG2MYmsSm9QOs
	fszRthQ0923SJueUtTfz10qo2VmEsk66PHpfStNveqnt2VXvzkGz9DhiXxkAwpOxPoBOGh+ROX+aw
	Vgb9BeSRKZQkWnf9rQMOtw7NgcjVMJzH0xHQoku/4jlIWUMVHywm0puFpk66JA7hicxoMg7vrEUiW
	Mj2G+9AH0ZCmktRSYS4WGDE8wQy5fzTrhGBieJx2FgZPR2l0M/J2yA9fgQSmb/BRnlYSowoI1WMui
	JM000rTSMb0v4LHEGMwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3Q1-00000003Uvo-4C7t;
	Fri, 13 Dec 2024 11:01:14 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3PU-00000003UnW-0Do1
	for linux-mtd@lists.infradead.org;
	Fri, 13 Dec 2024 11:00:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 463041BF20A;
	Fri, 13 Dec 2024 11:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734087637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ghJfDJQrGb+JKsXHfSOnVUgL6QGG/gcoCMUQJblVAao=;
	b=Tp6VIkKZy9QbAgzj3iKljiho8FI4dat8C5c4dTsghYv45TS3cslQRGDzjQ33++zisBK0OR
	wj7XMyehPZ46GIxO+4C9sLv5aXwBfZt5XCLT/lXy9Q6n33oamTHhXCAf/6y6nTRDCfrFSF
	48EWMx9Tm2deDjxV02dDR7Vl5ZnjsMxF/9F8q1wxpyn/UXdAjO0d+39XMySlibc/6xwxEN
	WZ2FCJSAHDhQ24XDFJLoIrzyftMSbpJO1NTAA8eYSnuaaOZ4OX2cCKc7F73hji/KowzdoA
	BEj8PDB2VfNvsMXbXWas1ISN18F2j8pmfJ9X3X/Gdsf4QU9eDBcrxFx3UCMiiw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <michael@walle.cc>,  linux-mtd@lists.infradead.org,  Mark Brown
 <broonie@kernel.org>,  linux-spi@vger.kernel.org,  Steam Lin
 <stlin2@winbond.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Sanjay R Mehta <sanju.mehta@amd.com>,  Han Xu <han.xu@nxp.com>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Haibo Chen
 <haibo.chen@nxp.com>,  Yogesh Gaur <yogeshgaur.83@gmail.com>,  Heiko
 Stuebner <heiko@sntech.de>,  Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 02/24] spi: spi-mem: Add a new controller capability
In-Reply-To: <59d350f3-73f7-411a-9ab2-0b2eee5247b0@linaro.org> (Tudor
	Ambarus's message of "Mon, 11 Nov 2024 13:18:36 +0000")
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
	<20241025161501.485684-3-miquel.raynal@bootlin.com>
	<59d350f3-73f7-411a-9ab2-0b2eee5247b0@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 13 Dec 2024 12:00:35 +0100
Message-ID: <878qsjonjg.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_030040_218100_AC2EEF80 
X-CRM114-Status: UNSURE (   8.87  )
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

SGkgVHVkb3IsCgo+PiBBbW9uZyBhbGwgdGhlIHNwaS1tZW1vcnkgY29udHJvbGxlcnMsIEkgYmVs
aWV2ZSBhbGwgYXJlIGNhcGFibGUgb2YKPgo+IG5pdDogU1BJIG1lbW9yeT8gb3Igc3BpIG1lbW9y
eT8gYnV0IG5vICItIiBJIHRoaW5rCgouLi4KCj4+IGNoYW5naW5nIHRoZSBzcGkgZnJlcXVlbmN5
IG9uIHRoZSBmbHkuIFNvbWUgb2YgdGhlIGRyaXZlcnMgZG8gbm90IG1ha2UKPj4gYW55IGZyZXF1
ZW5jeSBzZXR1cCB0aG91Z2guIEFuZCBzb21lIG90aGVycyB3aWxsIGRlcml2ZSBhIHBlci1jaGlw
Cj4KPiBuaXQ6IHMvcGVyLWNoaXAvcGVyIGNoaXA/CgouLi4KCj4+IHByZS1zY2FsZXIgdmFsdWUg
d2hpY2ggd2lsbCBiZSB1c2VkIGZvcmV2ZXIuCj4KPiBuaXQ6IHMvcHJlLXNjYWxlci9wcmVzY2Fs
ZXI/CgouLi4KCj4+ICsgKiBAcGVyX29wX2ZyZXE6IFN1cHBvcnRzIHBlci1vcGVyYXRpb24gZnJl
cXVlbmN5IHN3aXRjaGluZwo+Cj4gbml0OiBzL3Blci1vcGVyYXRpb24vcGVyIG9wZXJhdGlvbj8K
Pgo+IElmIHlvdSBmaXggdGhlIGJ1ZyB0aGF0IHlvdSBpZGVudGlmaWVkIHlvdSBjYW4gYWRkIG15
IFItYiB0YWcsCj4gcmVnYXJkbGVzcyBpZiB5b3UgYWRkcmVzcyB0aGVzZSBuaXRzIG9yIG5vdDoK
Pgo+IFJldmlld2VkLWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+
CgpObyBpZGVhIHdoeSBJIGxpa2UgJy0nIHNvIG11Y2guIEkgcmVtb3ZlZCB0aGVtIGFsbCBhcyBh
ZHZpc2VkIDotKQoKVGhhbmtzIQpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
