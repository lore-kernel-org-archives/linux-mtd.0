Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA2EC0032E
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Oct 2023 11:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AaI7i6eAbUWCulrJERDwFg9TTQFbCkhqNTP1h3JcFFg=; b=n7mckgJ1Q5jJXi
	OV1gzVGqDbWT+gwj3C9PDZ+fngmGmOUn4ftDdSGXGOhEKik7VbrAukFNLykrwc4OC9OvEEjGzPVs9
	h+y8VfksZoN7D/GoGBXWZjofR8ZCEXAy3aNltaZCLJF3zOyZkTtUh/ZB9/BzOIDDHPy9n96FprDMu
	xfR7v7fCooG/31fgj37X4iNcfs/1vbKjhX7VHKGSitJZioTbuQZuPSR4iAWDirjKuEB4wShGflCn3
	qZFGLVrvsNQjCwF8Xx0J7yxT0Ykat0ReNH4kxfWM1DQPfM+xuf5JQCETwRd9pEVb00qf2VC68Hz3v
	//7rlUGE1C8Axik7h0fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvcVP-00CFN5-1Y;
	Wed, 25 Oct 2023 11:56:59 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvcVM-00CFMK-0v
	for linux-mtd@lists.infradead.org;
	Wed, 25 Oct 2023 11:56:57 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6bd20c30831so1433219b3a.1
        for <linux-mtd@lists.infradead.org>; Wed, 25 Oct 2023 04:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698235015; x=1698839815; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FThHlH/oHJcOzPt+VpqUwiN8AhYjHVOn9TN+GnLmaKU=;
        b=d5S9yduMzd/iAKoV+2RSpn3iGlb7LotlbOZuBl1Yl7ibG1vPkmAQYXJIE3fBnwY7+d
         KS6QYRtzhsHXs9mhrxCZA08XZD/JI1CA/e2aX9D2lXknW6m80ASCh3ICxa0SrfBU68m5
         G0v+yTVEv8DysIgQPCaIPnCX6Is9KAes4nn4WusJl+67c4/YD4c4K0DqbCzzyPsTMRor
         lzWg10HwBBjmMPbeUQ62Tx55R5uRI5QeGHP2iDsotoocRiLZBS5ttMLVNCnQ7/4cUVGE
         Bj/H0Y2X0Ku69bnajdGt8Ldg/XCNVduSI0FwPujEfBvulPvXeIPPOgGoaOAga5x3mGDt
         k1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698235015; x=1698839815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FThHlH/oHJcOzPt+VpqUwiN8AhYjHVOn9TN+GnLmaKU=;
        b=kXAVqMuQ0kfo609LjtHDC4TdEueUgi4kWvePkDtxYaevA3iu76dZAgJBBsE2fm6HD0
         +5q+aHHv4BdsUkfjbLRyDkSDL+OAkdTOIGV+38DMpnmb+KgOBDqnsKV5XNs5vgkrthOv
         EEhaczjwZPvdKk9KjqIyRmhb2m3aDzesVfzQVq2P9vf/souGb7VrO7Rk5ouABLc6F3BZ
         HhhAuw1jRn1r5HBkFJx9UxlB6NPQSMliUYterICDQbToS3b25aGngLPv8VrCUYzoXak2
         H40xv4eXxk3t6JVDH2aE4mHKqrQC9sOQNg2U5zZaBZP16btHf/WpTRWYy2iEcXcpxNyN
         6aPw==
X-Gm-Message-State: AOJu0YwVoJSSWg7LgBhSXQoW0q29bj0X4ndxzuGGUYMIwswP9/QgptMR
	cWZK7bWmGhCgUIJ7UoAePShKSSow4vqrHqT2A8Tf75iHQV4=
X-Google-Smtp-Source: AGHT+IH2ImaMhv+V7h++zZOstbpxheeWefjez6NX5rNci4t/EGagm5C68DjO5xlSkmU1xS9LbNAHBfSiS4sSOv6FJ8w=
X-Received: by 2002:a05:6a00:1a8f:b0:6be:cb8c:92c7 with SMTP id
 e15-20020a056a001a8f00b006becb8c92c7mr15970358pfv.3.1698235015142; Wed, 25
 Oct 2023 04:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231023213800.2599704-1-festevam@gmail.com> <6183891066787b6c24df11e0d601ed26@walle.cc>
 <CAOMZO5BNcFZcLsi+0Qx5zxwTHqzrnUsGgb0AMptAtY4Kj9Apmg@mail.gmail.com>
 <1ac379836d4e1e3f7bec565ba7c9bc49@walle.cc> <CAOMZO5BfEsB2vv__F7kkMo9Q-oHD5PiCmaK-ruU-ds9XabUc4Q@mail.gmail.com>
 <4faa5d37-ddf8-4edd-bb0e-a192d16df488@linaro.org> <CAOMZO5AOfVAcap74kBH8qbf53LKWXN60ML32t1nBG8OOoUPkjQ@mail.gmail.com>
 <4e2de38da5a3e492eac522b9a68141c7@walle.cc> <CAOMZO5A98YSykYr+ddJ=v93isw=4jK_KhBLadSDTuBmn_WbqOQ@mail.gmail.com>
 <47aec8ad-3a30-4d97-9e3a-870df02f5ad7@linaro.org>
In-Reply-To: <47aec8ad-3a30-4d97-9e3a-870df02f5ad7@linaro.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 25 Oct 2023 08:56:43 -0300
Message-ID: <CAOMZO5A0Oi1L20o_D9oT-mRXp-n8pAHkC1-AzhwvQ6jVB+UzxQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Add support for mt25qu01g
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Michael Walle <michael@walle.cc>, pratyush@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	Fabio Estevam <festevam@denx.de>, tkuw584924@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_045656_341371_4FB6C25F 
X-CRM114-Status: GOOD (  18.95  )
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

SGkgVHVkb3IsCgpPbiBXZWQsIE9jdCAyNSwgMjAyMyBhdCAxMjozNOKAr0FNIFR1ZG9yIEFtYmFy
dXMgPHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IHlvdSBwcm9iYWJseSBqdXN0
IGdvdCBsdWNreSwgdGhlIFNGRFAgdGFibGVzIGFyZSBqdXN0IDMyYml0IGRhdGEuIFlvdQo+IGFj
dHVhbGx5IGhhdmUgdG8gaGF2ZSB0aGF0IHRhYmxlIGRlZmluZWQgaW4gdGhlIFNGRFAgc3BhY2Uu
CgpPaCwgSSBzZWUuCgpJdCdzIHVuZm9ydHVuYXRlIHRoYXQgU0ZEUF9TQ0NSX01BUF9NQ19JRCBp
cyBub3QgZGVmaW5lZCBpbiB0aGlzIFNQSSBOT1IgZmxhc2guCgo+IENoZWNrIHRoZSBqZXNkMjE2
IHNmZHAgc3RhbmRhcmQgYW5kIGxvb2sgaW50byB0aGUgU0ZEUCBQYXJhbWV0ZXIgSGVhZGVyCj4g
KHNlY3Rpb24gNi4zKS4gRWFjaCB0YWJsZSBoYXMgYSBJRCBMU0IgJiBNU0IgYW5kIGEgcGFyYW1l
dGVyIHRhYmxlCj4gcG9pbnRlci4gSWYgdGhlIFNDQ1IgSUQgaXMgbm90IHRoZXJlIHRoZW4gdGhl
IHRhYmxlIGlzIG5vdCBkZWZpbmVkLCB0aHVzCj4gbm90IHN1cHBvcnRlZC4gTGV0IG1lIGtub3cg
d2hhdCB5b3UgZmluZC4gSSdsbCB0YWtlIGEgbG9vayB0b28gaWYgeW91Cj4gaGF2ZSB0cm91Ymxl
cyBkZWNvZGluZyB0aGUgc2ZkcCBkdW1wIGRhdGEuIFdlJ2QgbGlrZSB0byBhZGQgYSBzZmRwCj4g
ZGVjb2RlciBpbiB0aGUgZnV0dXJlIHRvIGVhc2UgdGhlIHByb2Nlc3MsIGJ1dCBpdCdzIG5vdCBz
b21ldGhpbmcgdGhhdCBJCj4gY2FuIGFsbG9jYXRlIHRpbWUgZm9yIG5vdy4KClRoYW5rcyBmb3Ig
eW91ciBleHBsYW5hdGlvbi4KCkkgaGF2ZSBkb3dubG9hZGVkIHRoZSAgamVzZDIxNiBzcGVjIGFu
ZCB3aWxsIHRha2UgYSBjbG9zZSBsb29rIGF0IGl0LgoKPiA+IE1heWJlIEkgY2FuIGFkZCBhIGZp
eHVwIHRoYXQgY2FsbHMgc3BpX25vcl9wYXJzZV9zY2NyX21jKCk/Cj4KPiBJIGRvdWJ0IGl0LiBZ
b3UgcHJvYmFibHkgbmVlZCBzb21ldGhpbmcgbGlrZSBzMjVmczI1NnRfcG9zdF9zZmRwX2ZpeHVw
KCkuCgpJIG5lZWQgdG8gYmVjb21lIGZhbWlsaWFyIHdpdGggdGhlIHNmZHAgaW50ZXJuYWxzIHRv
IGJlIGFibGUgdG8gY29tZQp1cCB3aXRoIGEgcG9zdF9zZmRwX2ZpeHVwKCkKaW1wbGVtZW50YXRp
b24uCgpJbiB0aGUgbWVhbnRpbWUsIGNvdWxkIHlvdSBwbGVhc2UgY29uc2lkZXIgdGhlIHYyIHBy
b3Bvc2FsPwpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAyMzEwMjQxMzU4MjYu
MjcyOTA4OC0xLWZlc3RldmFtQGdtYWlsLmNvbS9ULyN1CgptdDI1cXUwMWcgaXMgdmVyeSBzaW1p
bGFyIHRvIHRoZSBhbHJlYWR5IHN1cHBvcnRlZCBtdDI1cXUwMmcuCgpJbiB2MiwgdGhlIC5zaXpl
IGFuZCAubm9fc2ZkcF9mbGFnIGZpZWxkcyB3ZXJlIHJlbW92ZWQsIHdoaWNoIGlzIGFuCmltcHJv
dmVtZW50IG92ZXIgbXQyNXF1MDJnLgoKT25seSBOT19DSElQX0VSQVNFIHN0aWxsIG5lZWRzIHRv
IGJlIHBhc3NlZCwgYnV0IHRoYXQgY2FuIGJlIHJlbW92ZWQKbGF0ZXIgd2hlbiB0aGUKbXQyNXF1
MDFnX3Bvc3Rfc2ZkcF9maXh1cCgpIGlzIGltcGxlbWVudGVkLgoKRG9lcyB0aGlzIHNvdW5kIHJl
YXNvbmFibGU/CgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
