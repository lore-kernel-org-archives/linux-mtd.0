Return-Path: <SRS0=/Eax=6V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A21C4724C
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 12:20:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42426208E4
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 12:20:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="exobEDU4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42426208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D6Ur4mSCuvYSQfKHeWTZLxlqfsXhVH1uJ7m5e3xpzPY=; b=exobEDU41lEvup
	uS+bGanseng7vmi7v8CYBThZskc6I3qiMOMKHBns15JUaUg7EJ2H2wSUutq6SFwlaOMGMeU0UyjH2
	89zLq5tRbUDcxML+j+hC62pMngcgqiSBT3i+9kX2SbbpjVMGLJD77DVExjyd9Sz2EeE6tzNZj2keA
	8/rcaXlt8Jgh3tHTE9C4TMzU6YwBMda9sT0xC00n/4Ls57+50l/m0Gi8P5kcVwtBp8LvymTION5dj
	TpfZMEF0gUQpQJnbnjlYtYUNjevu8DPIQd5iI0KIpePFpdy5Q+M1ofZuDMErMeKqvX6iK+1S8XzBK
	oGPDWNkpE0BuGLNmHrmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWfW6-0007jg-W6; Thu, 07 May 2020 12:20:43 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWfW1-0007hr-Kh
 for linux-mtd@lists.infradead.org; Thu, 07 May 2020 12:20:41 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4232A609D2CC;
 Thu,  7 May 2020 14:20:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 2hU0nOdW1_HM; Thu,  7 May 2020 14:20:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C804D609D2FA;
 Thu,  7 May 2020 14:20:31 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id TvS4JaUVxAjG; Thu,  7 May 2020 14:20:31 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 99F00609D2CC;
 Thu,  7 May 2020 14:20:31 +0200 (CEST)
Date: Thu, 7 May 2020 14:20:31 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: "Bean Huo, beanhuo" <beanhuo@micron.com>
Message-ID: <1802697359.195569.1588854031481.JavaMail.zimbra@nod.at>
In-Reply-To: <BN7PR08MB5684AFAA722A0633357C064ADBA50@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <20200503114029.30257-1-miquel.raynal@bootlin.com>
 <BN7PR08MB56843895500F4ADA88262C59DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <1414270659.192477.1588790669444.JavaMail.zimbra@nod.at>
 <20200506210158.7fe33cec@collabora.com>
 <662469728.192614.1588792998746.JavaMail.zimbra@nod.at>
 <20200506224016.2d48d0b4@collabora.com>
 <130342272.192940.1588798779898.JavaMail.zimbra@nod.at>
 <BN7PR08MB5684AFAA722A0633357C064ADBA50@BN7PR08MB5684.namprd08.prod.outlook.com>
Subject: Re: [EXT] [PATCH v2 3/3] mtd: rawnand: micron: Address the shallow
 erase issue
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: rawnand: micron: Address the shallow erase issue
Thread-Index: AQHWIT+tSg2eMxWQMkmMQ2x4Hr5xC6iauX8wgAAJXACAAHVPUIAABVcAgAAAtIDY4+LN9qccTiAAgAAF9gCAABWBAIAABWqAgAC2lLADdSprIQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_052037_987550_1C0F1010 
X-CRM114-Status: UNSURE (   6.31  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, "Zoltan Szubbocsev,
 zszubbocsev" <zszubbocsev@micron.com>, Steve deRosier <derosier@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, tglx <tglx@linutronix.de>,
 Piotr Wojtaszczyk <WojtaszczykP@cumminsallison.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkJlYW4gSHVvLCBiZWFuaHVv
IiA8YmVhbmh1b0BtaWNyb24uY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0Piwg
IkJvcmlzIEJyZXppbGxvbiIgPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+IENDOiAi
TWlxdWVsIFJheW5hbCIgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+LCAiVmlnbmVzaCBSYWdo
YXZlbmRyYSIgPHZpZ25lc2hyQHRpLmNvbT4sICJUdWRvciBBbWJhcnVzIgo+IDxUdWRvci5BbWJh
cnVzQG1pY3JvY2hpcC5jb20+LCAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVh
ZC5vcmc+LCAiU3RldmUgZGVSb3NpZXIiIDxkZXJvc2llckBnbWFpbC5jb20+LAo+ICJUaG9tYXMg
UGV0YXp6b25pIiA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4sICJ0Z2x4IiA8dGdseEBs
aW51dHJvbml4LmRlPiwgIlpvbHRhbiBTenViYm9jc2V2LCB6c3p1YmJvY3NldiIKPiA8enN6dWJi
b2NzZXZAbWljcm9uLmNvbT4sICJQaW90ciBXb2p0YXN6Y3p5ayIgPFdvanRhc3pjenlrUEBjdW1t
aW5zYWxsaXNvbi5jb20+Cj4gR2VzZW5kZXQ6IERvbm5lcnN0YWcsIDcuIE1haSAyMDIwIDExOjI4
OjU5Cj4gQmV0cmVmZjogUkU6IFtFWFRdIFtQQVRDSCB2MiAzLzNdIG10ZDogcmF3bmFuZDogbWlj
cm9uOiBBZGRyZXNzIHRoZSBzaGFsbG93IGVyYXNlIGlzc3VlCgo+IEhpIFJpY2hhcmQKPiBUaGFu
a3MuCj4gCj4gSG93IGFib3V0IHRoaXMgc3BlY2lhbCAgc2l0dWF0aW9uOgo+IAo+IFBhZ2UgMChF
QykgaXMgZ29vZDsKPiBQYWdlIDEoVklEKSBpcyBiYWQ7Cj4gUGFnZSAyIChkYXRhKSBpcyBnb29k
Owo+IFBhZ2UgMyggZGF0YSkgaXMgYmFkLCBvciBjb250YWluIGZpbGxpbmcgcGF0dGVybi4KPiBQ
YWdlIDQgKGRhdGEpIGlzIGdvb2QsIG9yIGVtcHR5Owo+IFBhZ2UgNSggZGF0YSkgaXMgYmFkLCBv
ciBjb250YWluIGZpbGxpbmcgcGF0dGVybi4KPiBQYWdlIDYgKGRhdGEpIGlzIGdvb2QsIG9yIGVt
cHR5OwoKImJhZCIgbWVhbnMgRUNDIGVycm9ycyB1cG9uIHJlYWQ/CgpVQkkgd2lsbCBiZSB1bmhh
cHB5IGluIHNjYW5uaW5nIG1vZGUgaWYgVklEIGhlYWRlciBpcyBiYWQgYnV0IHBheWxvYWQKZG9l
cyBub3Qgc2hvdyBFQ0MgZXJyb3JzIG5vciBiaXRmbGlwcyBhbmQgaXMgbm90IDB4RkYuCgpTZWUg
Y2hlY2tfY29ycnVwdGlvbigpIGluIGRyaXZlcnMvbXRkL3ViaS9hdHRhY2guYwpJJ20gbm90IHN1
cGVyIGVhZ2VyIHRvIHNvZnRlbiB0aGVzZSBjaGVja3MgYnV0IGFzIGxhc3QgcmVzb3J0CndlIGNh
biBtb2RpZnkgdGhlbS4KCkZhc3RtYXAgaXMgbW9yZSBmb3JnaXZpbmcgYW5kIGp1c3QgY2hlY2tz
IHdoZXRoZXIgdGhlIFZJRCBoZWFkZXIgaXMgY29ycnVwdGVkLgpXaGlsZSByZWFkaW5nIHRoaXMg
Y29kZSBJIHRoaW5rIHdlIGNhbiBhY3R1YWxseSB1c2UgY2hlY2tfY29ycnVwdGlvbigpIHRoZXJl
IHRvbywgaG1tbS4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
