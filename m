Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69475C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Nov 2022 20:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GOryPr7zAg746GjKUos1m4xHfwq2DgbxM+oHprWwVxg=; b=SPznQ2tSb/5RNTyaRtcLUzPsMa
	EMdsv56zDpEmr7OYPeXZaxnTcu12lGArhBFS5IFumasZR+7tqCblsNeDFoxSLqgBp8EGqBRDbtrJk
	4hfZte8UFAbSqeCaKjBf4ta3Bb8CMIruX7luJrzec0sMHCNfITt5wPey/rJJSJ1rW6jnhpijx3B2U
	l9O+7FYA0xhkV1ytVtqMKPgk806NVLuMASgwfEDwPu7S+RQoRZP9CaJWEm4dNo3l+QDRotQIaza3N
	fPlPIwjYRkAKSPeMrMSFHjZY1Ku5UYREXNWipDBdoTl7Hapx9IHfr+sUfXMoveskqe0VDc76O6bwy
	E3B1RXHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otDui-009BgR-43; Thu, 10 Nov 2022 20:12:40 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otDuf-009Bco-9S
	for linux-mtd@lists.infradead.org; Thu, 10 Nov 2022 20:12:38 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C40F863CDC5B;
	Thu, 10 Nov 2022 21:12:35 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 8t93NELvwpPx; Thu, 10 Nov 2022 21:12:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 632B161B8B4D;
	Thu, 10 Nov 2022 21:12:35 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id drrJ2Br71Io2; Thu, 10 Nov 2022 21:12:35 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3BA6463CDC5B;
	Thu, 10 Nov 2022 21:12:35 +0100 (CET)
Date: Thu, 10 Nov 2022 21:12:35 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Jens Axboe <axboe@kernel.dk>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	Matthew Wilcox <willy@infradead.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, 
	Chaitanya Kulkarni <kch@nvidia.com>, Ming Lei <ming.lei@redhat.com>, 
	linux-block <linux-block@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-efi <linux-efi@vger.kernel.org>
Message-ID: <871124728.219224.1668111155161.JavaMail.zimbra@nod.at>
In-Reply-To: <Y21ZXRKJF3hZg8wk@makrotopia.org>
References: <Y2rgbfpYfpbLKHaf@makrotopia.org> <1691046252.219046.1668109493753.JavaMail.zimbra@nod.at> <Y21ZXRKJF3hZg8wk@makrotopia.org>
Subject: Re: [PATCH v4 4/5] mtd_blkdevs: add option to enable scanning for
 partitions
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: mtd_blkdevs: add option to enable scanning for partitions
Thread-Index: JXERWtnlcCWgydDBA6DChmOXmJ0hxw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_121237_503081_53EDB170 
X-CRM114-Status: GOOD (  11.26  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IE9uIFRodSwgTm92IDEwLCAyMDIyIGF0
IDA4OjQ0OjUzUE0gKzAxMDAsIFJpY2hhcmQgV2VpbmJlcmdlciB3cm90ZToKPj4gLS0tLS0gVXJz
cHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiA+IFZvbjogIkRhbmllbCBHb2xsZSIgPGRhbmllbEBt
YWtyb3RvcGlhLm9yZz4KPj4gPiArCj4+ID4gKwkJaWYgKCFJU19FTkFCTEVEKENPTkZJR19NVERf
QkxPQ0tfUEFSVElUSU9OUykgfHwgbXRkX3R5cGVfaXNfbmFuZChuZXctPm10ZCkpCj4+ID4gKwkJ
CWdkLT5mbGFncyB8PSBHRU5IRF9GTF9OT19QQVJUOwo+PiAKPj4gSSBrbm93IHRoYXQgTkFORCBz
aG91bGQgbm90IGdldCB1c2VkIHdpdGggbXRkYmxvY2sgYmVjYXVzZSBsYWNrIG9mIHdlYXJsZXZl
bGluZwo+PiBhbmQKPj4gaW4gZ2VuZXJhbCB0b28gbWFueSB3cml0ZXMuIEJ1dCB3aGF0IGV4YWN0
bHkgaXMgdGhlIHJhdGlvbmFsZSB0byBkZW55IHBhcnQKPj4gc2Nhbm5pbmcgZm9yIE5BTkQ/Cj4g
Cj4gQXMgVUJJIHNob3VsZCBiZSB1c2VkIG9uIE5BTkQsIHBhcnRpdGlvbiBzY2FubmluZyBzaG91
bGQgYmUgZW5hYmxlZCBmb3IKPiB1YmlibG9jayBkZXZpY2VzIHRvIGhhdmUgdUltYWdlLkZJVCBm
aWxlc3lzdGVtIHN1YmltYWdlcyBtYXBwZWQgYnkgdGhlCj4gcGFydGl0aW9uIHBhcnNlci4KPiAK
PiBJZiBub3Qgc2tpcHBpbmcgcGFydGl0aW9uIHNjYW5uaW5nIG9uIE5BTkQtYmFja2VkIG10ZGJs
b2NrIGRldmljZXMgdGhlCj4gc2Nhbm5pbmcgaXRzZWxmIHdpbGwgYWxyZWFkeSB0cmlnZ2VyIG11
bHRpcGxlIHdhcm5pbmdzIHdoaWNoIG5vdyBoYXBwZW4KPiBldmVyeSB0aW1lIHdoZW4gYSBOQU5E
LWJhY2tlZCBtdGRibG9jayBkZXZpY2UgaXMgYmVpbmcgb3BlbmVkIHNpbmNlCj4gY29tbWl0IDk2
YTMyOTVjICgibXRkYmxvY2s6IHdhcm4gaWYgb3BlbmVkIG9uIE5BTkQiKS4KCkkgc2VlLCB5b3Ug
d2FudCB0byBwcm9tb3RlIFVCSS4gTWFrZXMgc2Vuc2UuCkluIGNhc2UgeW91IGRvIGEgdjUgc2Vy
aWVzLCBwbGVhc2UgYWRkIGEgY29tbWVudCB0byB0aGUgY29kZS4KClRoYW5rcywKLy9yaWNoYXJk
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
