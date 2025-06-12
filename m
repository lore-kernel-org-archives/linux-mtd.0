Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1EBC71141
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Jun 2025 13:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=r3inQyVH2xe2V4YKxNsl3e5Be4Y0ZZWO82yCYrsMAwM=; b=sX1SMflrKIJu0iKBQhxFdrU7iO
	giWfimu1gnNK2Z5igmyDAuc6MTyMVtbyQq1JSaANgucE68oY15n5wpMRjpyftAKz351KRw6k9PNu4
	UEfY9XYp1o5oPIPfV4v2eFut4Ku2djZXqoRzZHJnas0wSmo9mpVQHuj3a5g2puL9OLJjjrvEqRp+8
	CPHxicnJv5Hx+a4mjn3Qo/a0zQnM44aGSLx2wYeuBRc4B9KOZeFlVgZ2RYQNzNtPFLYg74LpCO6Xn
	WAiU8T6qB+wwsEf4pOi2aZ3ZGyVwuGVlQ6lpgQldYI43gx0VrEXZtbN5UHKC54mYlEeaP0GfvWJxT
	pGfkN2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhpb-0000000DMXa-0BeG;
	Thu, 12 Jun 2025 13:18:59 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPf7m-0000000CyJi-2W7o
	for linux-mtd@lists.infradead.org;
	Thu, 12 Jun 2025 10:25:36 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id B2C8929473A;
	Thu, 12 Jun 2025 12:25:31 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Xj8l1EkZv1wk; Thu, 12 Jun 2025 12:25:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5326B298565;
	Thu, 12 Jun 2025 12:25:31 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id NFts6TOxXvra; Thu, 12 Jun 2025 12:25:31 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1AD3329473A;
	Thu, 12 Jun 2025 12:25:31 +0200 (CEST)
Date: Thu, 12 Jun 2025 12:25:30 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Guenter Roeck <linux@roeck-us.net>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, 
	Karthik Poosa <karthik.poosa@intel.com>, 
	Reuven Abliyev <reuven.abliyev@intel.com>, 
	Oren Weil <oren.jer.weil@intel.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	DRI mailing list <dri-devel@lists.freedesktop.org>, 
	intel-gfx <intel-gfx@lists.freedesktop.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1466250376.134375386.1749723930972.JavaMail.zimbra@nod.at>
In-Reply-To: <CY5PR11MB6366DA38B20B29C1662BDC76ED74A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250302140921.504304-1-alexander.usyskin@intel.com> <130790886.134361099.1749560056731.JavaMail.zimbra@nod.at> <c90c8bad-9c7a-4bf7-8282-ebefebba90a3@roeck-us.net> <877c1ivcym.fsf@bootlin.com> <1612313571.134371311.1749637592940.JavaMail.zimbra@nod.at> <CY5PR11MB636692EFD9BB99B6F2D959BFED75A@CY5PR11MB6366.namprd11.prod.outlook.com> <87y0tytjmj.fsf@bootlin.com> <CY5PR11MB6366DA38B20B29C1662BDC76ED74A@CY5PR11MB6366.namprd11.prod.outlook.com>
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF139 (Linux)/8.8.12_GA_3809)
Thread-Topic: core: always create master device
Thread-Index: AQHbi35N9ptLZMK+/0+KHmcJoUKk0bP5FNKAgABXSdCAANahSoAAWdKAgACSaAOAACUigIAAFAQAgAAhxhCAAAxMAIAAXViAgADet1B87pkdB/wY57yAgAEiYbGAAA56AIAABaLggABFNgOAATvKgCORNoJK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_032534_777905_B9AB8063 
X-CRM114-Status: UNSURE (   6.23  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkFsZXhhbmRlciBVc3lza2lu
IiA8YWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tPgo+IEluIGdlbmVyYWwsIGl0IGlzIGZpbmUg
Zm9yIG1lIC0gd2UgaGF2ZSBwYXJlbnQgbXRkIGluaXRpYWxpemVkIGFuZCBwYXJ0aWNpcGF0aW5n
Cj4gaW4gcG93ZXIgbWFuYWdlbWVudC4KPiAKPiBJIGNhbid0IHNlZSBob3cgdG8gYmVuZCBpZHJf
YWxsb2MgdG8gYWxsb2NhdGUgZnJvbSB0aGUgZW5kIGFuZCBjb3JuZXIgY2FzZQo+IG9mIGZ1bGwg
aWRyIHJhbmdlIGlzIGFsc28gd2lsbCBiZSBwcm9ibGVtYXRpYy4KCkkgZXhwZWN0ZWQgaXQgdG8g
d29yayBiZWNhdXNlIHdlIGNhbiB0cmFjayB0aGUgaGlnaGVzdCBtdGQgSUQgYW5kIHBhc3MgbGlt
aXRzCnRvIGlkcl9hbGxvYygpLCBubz8KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
