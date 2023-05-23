Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DAEC7EE23
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 09:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rbdiIZ11kq1lv00ru3wE13cTneIVOpZZoP6MkZ3nXiA=; b=HFLHYwvK9l24R4
	vEVzu9DyA+roYO/uq1UhepdTkWgquHSKtcS+rJ0KXkcjTV9LRCCJ3qOO7MPKogRyPXQaCELAKrxRF
	EZ2vaSSCylIUJJabj1yVVr9PTvT+iLKQHxm5yjJUWqhzyYv2QBC/5ZbT5P1CqG9XRp+5Ic16mtb/k
	FXDWjW7tgvJueQbOthHmvKxwWhSBGEaqhw2fVEJIC1GdJm2r5b+G/rTzll8PdyDDI2gGO2S/vXHPL
	fI/gBeUFuFht+q9zGzWuXRbkQjzI9RFihzxMkC+CAn+YbobeitGQ5d3ZWpAtWBlQCBvz77fMwIU6T
	s56kYus/cW42vBw+gKvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1ONz-009cf9-22;
	Tue, 23 May 2023 09:32:55 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1ONw-009cdT-1a
	for linux-mtd@lists.infradead.org;
	Tue, 23 May 2023 09:32:54 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 692C81BF208;
	Tue, 23 May 2023 09:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684834363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X9Qn8AqTo/sXg8jlDCBz4izis3PpHn0GZ9QSR6MiR2o=;
	b=nDLTR3vUfrTOLo3EM5MuxyetQ0aQdZJM+Ho1A4w2GfIirH7p4eH4c2TDG/3OEXvma9vKPC
	obbBH7nmZo1SiIwLKlU/noxPyVUnR1SsgXwrP5iRZCGDyCaU7xO/Vk7vWlbnLit0NmV8kV
	m02z5NwwFnxYe40ugcnK7LQmb5c+jb8MwLtLJfdcoV5cUZMb2QnzyuzEauviQLaTcLqw6m
	2ya4z3/LN47E29vcHLvs21LUmJ/zNFLig5VUwQni0fOM8/6P94Hx0DxoYg7aecPc0wmLND
	6dqjmGBlVobsq2X/SZb7YaYswGocBo6i9e+marQku6QRSGtv5Ak72OaDQiwxew==
Date: Tue, 23 May 2023 11:32:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Mike
 Snitzer <snitzer@kernel.org>, Joern Engel <joern@lazybastard.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Pavel
 Machek <pavel@ucw.cz>, dm-devel@redhat.com, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH 22/24] mtd: block2mtd: factor the early block device
 open logic into a helper
Message-ID: <20230523113236.7003c303@xps-13>
In-Reply-To: <20230523074535.249802-23-hch@lst.de>
References: <20230523074535.249802-1-hch@lst.de>
	<20230523074535.249802-23-hch@lst.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_023252_697018_4580B002 
X-CRM114-Status: GOOD (  10.85  )
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

SGkgQ2hyaXN0b3BoLAoKaGNoQGxzdC5kZSB3cm90ZSBvbiBUdWUsIDIzIE1heSAyMDIzIDA5OjQ1
OjMzICswMjAwOgoKPiBTaW1wbHkgYWRkX2RldmljZSBhIGJpdCBieSBzcGxpdHRpbmcgb3V0IHRo
ZSBjdW1iZXJzb21lIGVhcmx5IGJvb3QgbG9naWMKCkkgZ3Vlc3MgeW91IG1lYW50ICJTaW1wbGlm
eS4uLiIKCk90aGVyd2lzZSBsZ3RtIHNvLAoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cgo+IGludG8gYSBzZXBhcmF0ZSBoZWxwZXIuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gIGRy
aXZlcnMvbXRkL2RldmljZXMvYmxvY2sybXRkLmMgfCA1MyArKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDIzIGRlbGV0
aW9ucygtKQo+IAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
