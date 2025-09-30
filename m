Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AB5CAC5B9
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Sep 2025 07:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BFHHR6bIKUchwPq7lEdfb19v6E2OODBm6TvSXmL0Rhc=; b=iK5phpTfNY618K
	P+sY9T5CUElr21bBygD3qnxF383JOpeeDJGiiZY5opWNdtSVfYq+bT+wCh0ze8mkT2LOrB2RgZd/n
	SW0evCY+kRALBlSMmSHBCFlCBiLhSbZWmxh0DUHHalU6YdWyp4u02H0FKKXKXMpc23ZMSG/9OaTxq
	zckEMAiP+rG0N5uv2PA9SuYlR6XY34ll8+FRzkab/qMmUixtvI9bg1oP4KeJZvgIlU1A4lexAmey6
	GQm+dAFJaoVWch/7Vb/kHOxdrNJDrEA8IPURjimpQL5OjvTsZHdTwDKWNECAh9FkE088tzVYrPeDc
	gwnCRv7nJ3xtPDC8y8DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3UyB-00000004W84-1H3z;
	Tue, 30 Sep 2025 07:40:19 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Uy8-00000004W72-0Hhw
	for linux-mtd@lists.infradead.org;
	Tue, 30 Sep 2025 07:40:17 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-33255011eafso5595825a91.1
        for <linux-mtd@lists.infradead.org>; Tue, 30 Sep 2025 00:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759218015; x=1759822815; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zts8pP3+onz4l4ujVG25vTzO1B/t+AvQHBOavBB3fNY=;
        b=QmL3wI3oSd/a7W2Uxh4lNR99V6aYoQXuRxNFoiQGBHvvlQqJ0QTrkPOjwdGQRZagdw
         IisMrECK71How1ou27ePqCzJUugmcfXQwmlHfZMz/0IBT1TupEfw/bWqxWXLoUkaraTc
         pAcEkxYgbRrCBnXa+S6oaC+LjuGhYtpn7YUe3RIzQfCk+qQuwneIGjScXkV0jhxpH034
         qhqt9WTTEZag8XINfagafwi3FXsmGODMQpGxDISN/mAWBBYh+qcDLivCTR9oC7Ys8B6x
         wT+qQth6y4I1bsqvtc+mix/bUNpnVcaHW3DSGQ1geIE5tIV/yWYur4YjNyi71DpCHvtf
         dipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759218015; x=1759822815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zts8pP3+onz4l4ujVG25vTzO1B/t+AvQHBOavBB3fNY=;
        b=PeHiHCkz2NfHUwB1lJJLZ6xFk4rIK1nAU5hayblfB6G75BJ0cvqgGByxpfZJGPVb9c
         yr9eXYMU0QaobrE0EioJzvKDaR1ALkXLs3PUgYimEbUY+7lwl0Tx6Yq86Vgslbw8S05v
         0yI9oQcpEHYUiBi6cB1FaHo2N41MDSG3g06sfe5f3aj7nf33hgrd1lQ11aEooBwdw3Yg
         s1/JSMQv+A4bjqguqaqi9z09nyh0lo2lC9gd/r9aku1Ewf9za0LXd6WeF2ZcZVEZU0gn
         0ryRCas0M7MNGjX/0+GJBfvkpa9nvgGaw6yykUMNgYw6QYph4eyWPpTVWuiG7jEHiCjZ
         P25g==
X-Forwarded-Encrypted: i=1; AJvYcCX9DnSbrgdmlIHqrQ6pxMbn7HslGDAnI/4efxE5OyLc7bZQHG3lJbovGkANC+vumYDQMHasS0eG7ks=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0x8goa1F1s2+LzQ3X4qvod7GU2ZFNwSHvxfB/rD0w5CsuBYBI
	hKyfmPQskcX8/GAhAcnPuEp4J9SFBETpqlZ0S0IMWcujKlo0EbMys3BzSjClQxZ9dWT/AhzXtWB
	zi/81mZtIknOgRbF7sSGl3ANLXUNgC+I=
X-Gm-Gg: ASbGncvFbzuTQJ9ONjKPAjywnDTBvUmMFGXlmIY4sMESARvXb4rnBgxHwb/dnQsTszG
	TXFs5srnwQuUqiIyWS/IG1H7hbFlDgU0UxOqPxiRINDnmNovh0D9oOR0YZVUbia2xMjTw6KqEJP
	673kNdTFwgbWWFVnkNqvkcH7iVLwdaG0MBr8CxF0V51qjmC/N1Qix9mqmYSNU5Gft1xXbj2DiiS
	wkpjPf1BblcS3Ygl+Igcio4V0JnfZPhjW+pvoVlDoUU8yhhi/cP3TIeeW7R9ctDang7hjaINZVH
	REkICW47El2VonsfCzOWvJBMF+yZRGBufoWB2rRZ
X-Google-Smtp-Source: AGHT+IGTKvI1EgmI28isilggVYUZEfP9D1exg1i1hZh7lxCHqd4NwUf7Iw2r8P4SP93LS7emxZAU+m2Q+gXol5mg9ug=
X-Received: by 2002:a17:90b:4a47:b0:32e:87fa:d975 with SMTP id
 98e67ed59e1d1-3342a2c6b13mr20660800a91.34.1759218014942; Tue, 30 Sep 2025
 00:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250407075400.1113177-1-linchengming884@gmail.com>
 <20250407075400.1113177-2-linchengming884@gmail.com> <d98f6eee-d5f7-43b7-bbc8-d6e7e274723a@roeck-us.net>
 <mafs05xh6pf7s.fsf@kernel.org> <da58fc81-3c99-4951-85bc-e3c139283b5a@roeck-us.net>
 <a2a0c40e-69d7-4408-add2-88616c92b0ca@roeck-us.net> <aa2a4480-9b78-4ed9-8f9d-b18a87eb01e9@linaro.org>
 <CAAyq3SYybDgBvkTKh2ZB4UdKq1XV_nnzx3Tj1P915W5x_7_nNA@mail.gmail.com> <DD10QMSJVZ2K.26U45JAXV5EY7@kernel.org>
In-Reply-To: <DD10QMSJVZ2K.26U45JAXV5EY7@kernel.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Tue, 30 Sep 2025 15:36:40 +0800
X-Gm-Features: AS18NWApi5FotxUWGvIY8CxdHG_LR6-afREmMqbnGO-NfNuET8VB41hFCUTvJNQ
Message-ID: <CAAyq3SYyqi-oR8T039Zd0uaF6UieX3SdF9UF2kxOG6+yJqAEUg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash
 info fields
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	Pratyush Yadav <pratyush@kernel.org>, Cheng Ming Lin <chengminglin@mxic.com.tw>, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, 
	Maarten Zanders <maarten@zanders.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_004016_117086_841FBD60 
X-CRM114-Status: GOOD (  15.00  )
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

SGkgTWljaGFlbCwKCk1pY2hhZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3JnPiDmlrwgMjAyNeW5
tDnmnIgyNOaXpSDpgLHkuIkg5LiL5Y2IODoxMeWvq+mBk++8mgo+Cj4gPiBUaGUgcm9vdCBjYXVz
ZSBvZiB0aGlzIHByb2JsZW0gbGllcyBpbiB0aGUgZmFpbHVyZSBvZiBwYXJzaW5nIHRoZSBTRkRQ
Cj4gPiBkYXRhIGZvciB0aGUgZmxhc2gsIHJhdGhlciB0aGFuIGFuIGlzc3VlIHdpdGggdGhlIHBh
dGNoIGl0c2VsZi4gSSBiZWxpZXZlCj4gPiB3ZSBzaG91bGQgbm90IHJldmVydCB0aGlzIHBhdGNo
Lgo+Cj4gSSBkaXNhZ3JlZS4gVGhlcmUgYXJlIE1hY3Jvbml4IGZsYXNoZXMgd2l0aCB0aGF0IElE
IHdoaWNoIGRvZXNuJ3QKPiBoYXZlIFNGRFAuICBBbmQgdGhpcyBwYXRjaCBpcyBkcm9wcGluZyBz
dXBwb3J0IGZvciB0aGVtLiBTZWUgYWxzbwo+IFsxXS4gTm93IEknbSBub3Qgc3VyZSBpdCBpcyB3
b3J0aCByZXZlcnRpbmcgdGhpcyBjb21taXQuIE5vYm9keSwKPiBleGNlcHQgR3VlbnRlciBjb21w
bGFpbmVkLCBidXQgb25seSAqc28gZmFyKiAoYW5kIHRoYXQgcGF0Y2ggaXMgaW4KPiBzaW5jZSA2
LjE2KS4gQW55IG9waW5pb25zPwoKSSBhZ3JlZSB3aXRoIHJldmVydGluZyB0aGlzIHBhdGNoLiBX
aGVuIEkgaW5pdGlhbGx5IHZlcmlmaWVkIGl0LCB0aGUKZGV2aWNlcyBJIGhhZCBvbiBoYW5kIGFs
bCBzdXBwb3J0ZWQgU0ZEUCwgc28gSSBkaWQgbm90IGNhdGNoIHRoaXMgaXNzdWUuCkFmdGVyIGNo
ZWNraW5nIGFnYWluLCBJIGNvbmZpcm0gdGhhdCBzb21lIG9sZGVyIGZsYXNoZXMgd2l0aG91dCBT
RkRQIGFyZQppbmRlZWQgYWZmZWN0ZWQuCgpXb3VsZCBpdCBtYWtlIHNlbnNlIHRvIG9ubHkgY2hh
bmdlIHRoZSBgLm5hbWVgIGZpZWxkIHRvIHVzZSBhIGNvbW1lbnQsCndoaWxlIGtlZXBpbmcgdGhl
IHJlc3QgYXMgaXM/IFRoYXQgd2F5IHdlIGNhbiBzdGlsbCBzdXBwb3J0IGZsYXNoZXMgdGhhdApt
YXkgbm90IHByb3ZpZGUgU0ZEUC4KCj4KPiAtbWljaGFlbAo+Cj4gWzFdIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3IvREQxMEdFNEVPQ0Q3LkNQVE43MTk4UUZVVkBrZXJuZWwub3JnLwoKVGhhbmtz
LApDaGVuZyBNaW5nIExpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
