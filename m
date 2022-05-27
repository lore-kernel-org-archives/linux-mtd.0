Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F6CC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 27 May 2022 10:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QsOT3N1MQo+HaiNbR3R5atotv8b1VjlfSiRmuwri2i4=; b=tPSVbRJPEo1OOU
	UDbvru/3N/v2THpeInW1Lfgw2dBhVqvI79dbDci7Ir8qFLZccda1VHohQRkENArfj1eFBJlPABYJz
	ZCoC/Zo3xX6boVMCe8Y7Ax33K/39+b0YgGzv5Su+MGsHS2YKznr4j0Y0V2+MepR/JhZgxXczbgzK5
	uffisrusJReJ9J+JZnwxHnkNxpfheEltZKpz01fgODhOwCHp8n3SZ9TZ6mvuQOB72Y7G5+0IT+dXF
	SbundDEM2d1t9UGdFnn8sppyzIGbcp9n54M5YGSMAfuLpFuhw5sIUzCvvbw8pN3LmgRdHYQ3y2E/E
	L8fzVdriESrjiSd7hAnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuXTM-00HPVD-7h; Fri, 27 May 2022 10:45:36 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuXTI-00HPSt-Eu
	for linux-mtd@lists.infradead.org; Fri, 27 May 2022 10:45:34 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2A5F8100009;
	Fri, 27 May 2022 10:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653648326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JB0mhdnR46lzp5SeNAr4p9Ad8iU4Z1hWgOymRKFoU7o=;
	b=eklpqcblb0aQr6N+ca93ufY/mFI+iOkxU18x8X7BkHSFlRBSL5barbpNunBdKp0r99+NdM
	V/EbLal3hBn+A1frcq4sefFFud94fx6Zf7uZMvez3ZDKdmC98VFxmfuW1gckLSJSmh3SaO
	uPyByhZrvS5KRx4WcgvAdpv6qyPm97p6dacCM6oir8kBXGgRcW18apvT4Nh6DwEObhl8v1
	AbqOWz/MfNax4E0ocwykm6TbgyPDMGE5RS2Ik9zXawCJR5+jmu1/0B3Shvrl6WwqMl1F4v
	NJTYyBeBtHD73G63T4SZAgR8yopyWFgjDN60ZryN/xypJ50LLD/0GC+ynLUuTQ==
Date: Fri, 27 May 2022 12:45:21 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Haowen Bai <baihaowen@meizu.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] xfs: drop the useless LIST_HEAD in
 __mtd_del_partition()
Message-ID: <20220527124521.15ac865e@xps-13>
In-Reply-To: <1653645678-29049-1-git-send-email-baihaowen@meizu.com>
References: <1653645678-29049-1-git-send-email-baihaowen@meizu.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_034532_974017_CFDEF544 
X-CRM114-Status: GOOD (  12.82  )
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

SGkgSGFvd2VuLAoKYmFpaGFvd2VuQG1laXp1LmNvbSB3cm90ZSBvbiBGcmksIDI3IE1heSAyMDIy
IDE4OjAxOjE4ICswODAwOgoKPiBEcm9wIExJU1RfSEVBRCB3aGVyZSB0aGUgdmFyaWFibGUgaXQg
ZGVjbGFyZXMgaXMgbmV2ZXIgdXNlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBIYW93ZW4gQmFpIDxi
YWloYW93ZW5AbWVpenUuY29tPgoKVGhlIHRpdGxlIHNlZW1zIHdyb25nLiBBIGZpeGVzIHRhZyB3
b3VsZCBiZSBhcHByb3ByaWF0ZS4KCj4gLS0tCj4gIGRyaXZlcnMvbXRkL210ZHBhcnQuYyB8IDEg
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9tdGRwYXJ0LmMgYi9kcml2ZXJzL210ZC9tdGRwYXJ0LmMKPiBpbmRleCBkNDQyZmE5
NGM4NzIuLjk3NmU5YzMwMjQ0ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9tdGRwYXJ0LmMK
PiArKysgYi9kcml2ZXJzL210ZC9tdGRwYXJ0LmMKPiBAQCAtMzI2LDcgKzMyNiw2IEBAIHN0YXRp
YyBpbnQgX19tdGRfZGVsX3BhcnRpdGlvbihzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPiAgc3RhdGlj
IGludCBfX2RlbF9tdGRfcGFydGl0aW9ucyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPiAgewo+ICAJ
c3RydWN0IG10ZF9pbmZvICpjaGlsZCwgKm5leHQ7Cj4gLQlMSVNUX0hFQUQodG1wX2xpc3QpOwo+
ICAJaW50IHJldCwgZXJyID0gMDsKPiAgCj4gIAlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoY2hp
bGQsIG5leHQsICZtdGQtPnBhcnRpdGlvbnMsIHBhcnQubm9kZSkgewoKClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
