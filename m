Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90559D5E14B
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Nov 2024 10:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mEBM7Co5WYGtxs2nsXhl8WH7cAu9WpGLfPTtaeeW6+Y=; b=JAsMR2+ibQf2My
	1K1GLUvnqiGJBge0yxKpw+tCdCARs+Cq0sK+nJv5CjTZwascBRjhlOAK+pS3CEwdjiNi3+8msuOPx
	d3uMgWoJIPpRrec0UvTGlKgwj92o8VARgkB0zp5UiTUEsBZCA5xY4qEvdaEteB9qIFpcd80bL6jrR
	OQNThiJm43nnja+ZheZiyM6F/ZRuOFmQWgzA8aVMKohYnas8VxTqwcgrTTd3h3QQaH+B6HkZdhxRi
	1vy9hDdhHnit6d/a0oDLR/MA2pqJNYbnUO5phEn0vSKeGvlmCehdeb2dmsriehX3Kuwe8GI8RvB2/
	+slyebfG0P/RTJOLROKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Lpl-0000000A2zX-0K86;
	Fri, 08 Nov 2024 10:03:17 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Ll1-0000000A25E-1NLS
	for linux-mtd@lists.infradead.org;
	Fri, 08 Nov 2024 09:58:25 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-539e63c8678so2115934e87.0
        for <linux-mtd@lists.infradead.org>; Fri, 08 Nov 2024 01:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731059901; x=1731664701; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5H92Szh7zfoJ1X3k0f3O/M8Kef9HnGfDZM9F62PdTF8=;
        b=wQEXC+lF7WmlztT4BJtw1x0ybIzKiZDAkk+yBCLA+cClp94wFouJePIJDVeSQwU9Ou
         D1z3ACNYjBqqyJ3bzjuZ31jXmwKKXzhDrL5sfR2bAEIeimMvqZP+t5krJ/B15Q20rYA3
         ajolEtGR0HDeIh2F1W0WCYSPZXs4kCWGOF8vZ7yRPuxyvFUgAyWCb/G+ezT8dFyveexV
         0K14lRkCFYlIBmvLmFwhdkGZ8ukBZrrhENIbATa3kDV/HadpqyA4+GARlaYrbJ7p1gTN
         DSuXNyNmazXAvw31n/QVXLVX/Ro0dA/hFw3NT6ffTnIgmgMAZVummnFKzhpA0ScBN2Pi
         UpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731059901; x=1731664701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5H92Szh7zfoJ1X3k0f3O/M8Kef9HnGfDZM9F62PdTF8=;
        b=hYXZVMQfPcdxwo2lBmua1EAibFsRUQX1zR4rdF/Wkz+BV+5rgfs2m3187lhxsZ5M2l
         0BvhOEEmxKCLEfWoCjnRikgTJg8kfG77aG0uhnMgezkVJ/TK7SFKKGK70Cj6Kxf6+R06
         mWIHBOPE74xpGK3c2wTBgRXOpOzFAM1lLtyYaaF2ELPh+qcvgIWnjSAaqp11zbIpIP6D
         KIQ//UVDkkENBcNFB3Pdlq4Snf4MIAxeZz+nWNbV4YTf50Ywiv0KLHERhoDbG4yaJBql
         PAAUMmIzTJHW74zFBcbUf48tVqkshXblbUsc48un+Oa2wN5aunujKHiK2kq0YT4SUUKJ
         v+JA==
X-Forwarded-Encrypted: i=1; AJvYcCX4y5PZI4klTGFJ5p5v0Mm1pwyrR7VcMUt+NKTC3REpsCwEHv37uPsXz8t8x56bhIzrOwlF5Ifxb78=@lists.infradead.org
X-Gm-Message-State: AOJu0YzakB4aEgmfiUbs7Z6kwoggCE3Q71rMVZddlm18GdTn4CEh3u8k
	XFyKd2RWJ56ZSIvG+u07RhKibGcyq9k0eI/2jZuVuBJefhAgEWRHT8ajYur4crI=
X-Google-Smtp-Source: AGHT+IFRdqMG06HtkdzkHICdIIWrY7d6GXyCPZ8Qa2uAHGCAECQ9+blFxeuQwDqlNWgVG3erwh8s3g==
X-Received: by 2002:a05:6512:2256:b0:539:905c:15ab with SMTP id 2adb3069b0e04-53d862e3e86mr1089619e87.32.1731059901467;
        Fri, 08 Nov 2024 01:58:21 -0800 (PST)
Received: from [172.20.143.194] ([154.14.63.34])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-432b05e6042sm57204805e9.44.2024.11.08.01.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 01:58:21 -0800 (PST)
Message-ID: <fe2f0356-ef90-4fc4-85c1-6a42da209b88@linaro.org>
Date: Fri, 8 Nov 2024 09:58:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/10] nvmem: core: calculate bin_attribute size
 through bin_size()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "David E. Box" <david.e.box@linux.intel.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Logan Gunthorpe <logang@deltatee.com>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, linux-mtd@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
 <20241103-sysfs-const-bin_attr-v2-4-71110628844c@weissschuh.net>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-4-71110628844c@weissschuh.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_015823_607506_D27D0E30 
X-CRM114-Status: GOOD (  17.12  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAwMy8xMS8yMDI0IDE3OjAzLCBUaG9tYXMgV2Vpw59zY2h1aCB3cm90ZToKPiBTdG9wIGFi
dXNpbmcgdGhlIGlzX2Jpbl92aXNpYmxlKCkgY2FsbGJhY2sgdG8gY2FsY3VsYXRlIHRoZSBhdHRy
aWJ1dGUKPiBzaXplLiBJbnN0ZWFkIHVzZSB0aGUgbmV3LCBkZWRpY2F0ZWQgYmluX3NpemUoKSBv
bmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdlaXNzc2No
dWgubmV0Pgo+IC0tLQpUaGFua3MgZm9yIHRoZSBwYXRjaCwKCkxHVE0uCgpBY2tlZC1ieTogU3Jp
bml2YXMgS2FuZGFnYXRsYSA8c3Jpbml2YXMua2FuZGFnYXRsYUBsaW5hcm8ub3JnPgoKLS1zcmlu
aQoKPiAgIGRyaXZlcnMvbnZtZW0vY29yZS5jIHwgMTMgKysrKysrKysrKystLQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbnZtZW0vY29yZS5jIGIvZHJpdmVycy9udm1lbS9jb3JlLmMKPiBpbmRleCAz
M2ZmYTJhYTRjMTE1MjM5OGVjNjZiOGRkN2IzMDM4NGM1MzQ2YTZlLi42MzM3MGM3NjM5NGVlOWI4
ZDUxNGRhMDc0Nzc5NjE3Y2VmNjdjMzExIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbnZtZW0vY29y
ZS5jCj4gKysrIGIvZHJpdmVycy9udm1lbS9jb3JlLmMKPiBAQCAtMzAzLDExICszMDMsMTkgQEAg
c3RhdGljIHVtb2RlX3QgbnZtZW1fYmluX2F0dHJfaXNfdmlzaWJsZShzdHJ1Y3Qga29iamVjdCAq
a29iaiwKPiAgIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBrb2JqX3RvX2Rldihrb2JqKTsKPiAgIAlz
dHJ1Y3QgbnZtZW1fZGV2aWNlICpudm1lbSA9IHRvX252bWVtX2RldmljZShkZXYpOwo+ICAgCj4g
LQlhdHRyLT5zaXplID0gbnZtZW0tPnNpemU7Cj4gLQo+ICAgCXJldHVybiBudm1lbV9iaW5fYXR0
cl9nZXRfdW1vZGUobnZtZW0pOwo+ICAgfQo+ICAgCj4gK3N0YXRpYyBzaXplX3QgbnZtZW1fYmlu
X2F0dHJfc2l6ZShzdHJ1Y3Qga29iamVjdCAqa29iaiwKPiArCQkJCSAgY29uc3Qgc3RydWN0IGJp
bl9hdHRyaWJ1dGUgKmF0dHIsCj4gKwkJCQkgIGludCBpKQo+ICt7Cj4gKwlzdHJ1Y3QgZGV2aWNl
ICpkZXYgPSBrb2JqX3RvX2Rldihrb2JqKTsKPiArCXN0cnVjdCBudm1lbV9kZXZpY2UgKm52bWVt
ID0gdG9fbnZtZW1fZGV2aWNlKGRldik7Cj4gKwo+ICsJcmV0dXJuIG52bWVtLT5zaXplOwo+ICt9
Cj4gKwo+ICAgc3RhdGljIHVtb2RlX3QgbnZtZW1fYXR0cl9pc192aXNpYmxlKHN0cnVjdCBrb2Jq
ZWN0ICprb2JqLAo+ICAgCQkJCSAgICAgc3RydWN0IGF0dHJpYnV0ZSAqYXR0ciwgaW50IGkpCj4g
ICB7Cj4gQEAgLTM4Myw2ICszOTEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGF0dHJpYnV0ZV9n
cm91cCBudm1lbV9iaW5fZ3JvdXAgPSB7Cj4gICAJLmJpbl9hdHRycwk9IG52bWVtX2Jpbl9hdHRy
aWJ1dGVzLAo+ICAgCS5hdHRycwkJPSBudm1lbV9hdHRycywKPiAgIAkuaXNfYmluX3Zpc2libGUg
PSBudm1lbV9iaW5fYXR0cl9pc192aXNpYmxlLAo+ICsJLmJpbl9zaXplCT0gbnZtZW1fYmluX2F0
dHJfc2l6ZSwKPiAgIAkuaXNfdmlzaWJsZQk9IG52bWVtX2F0dHJfaXNfdmlzaWJsZSwKPiAgIH07
Cj4gICAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
