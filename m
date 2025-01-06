Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA865E77188
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jan 2025 10:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mUpkkqL0TDBzxi3IQ4r5MOV+oZss86wU4xwca25eCYs=; b=U88H237xHKLfOm
	XYgWxfMf/BfazvjTKDnWd+3WsoL7ovoapXMD4Rk+NL6WQN0JDGx84VtgDXtmqdzWT2ZLi5OCHige3
	vZBhMouKKRTvXYtepzUqfJN+d4b2D5rDDJn26KHgdn8MxMhk1fI5KlkyASr9L7CEkvcfdd2c2kjPF
	x6vncR+KqQ+V12+F530u/fjF2aJGeKUjX+HmmpLe5+HYd6saJRHOpCaZG5YXwGpFtnImcJKjc/oPp
	/i5l8izHVM/8aley4W+KIxrBdMdHV059WIsa/4mNiUsM4ND7GsDy6K20+6A6WJIsMV3vB11GNhdX5
	lkGpnDRTooQ9dsWrBtvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUkdC-00000000uR5-0WqF;
	Mon, 06 Jan 2025 10:46:46 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUkd0-00000000uOk-2PAC
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jan 2025 10:46:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81E4224000C;
	Mon,  6 Jan 2025 10:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736160388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DJ+D6qi4mbfuXPyLe+w6+zrZoPI7FQCfPbiq3MQBu4E=;
	b=jf3OAaHBEQgLGTdjbWJ+Nr6uK1KydwHIM3hULmkIuycUOpS+aWWLaVhvJBI6gXLfBSulpA
	4ZdY0BSkKOzjm8wEmec81rgnlTw5NS9VriPTznHJG0QufJgh6f25GwBkvx3uKA5+6Dq7zX
	JpuGqZYZ9Wp7oGapaizgXHwJJAj1ZJQdK5/28WWFtHUwgFuJStm2dp+xZDyNL/SjEBa5hT
	3qRFa28HM9kdIjhesx0jhoHPm1pcPtnDS8fdPxErY1mVXtlK6xQcp4CslbwJxM04vBh12u
	HGHEnGXaN6oo/TDcKqeBmMlyn/FACtOuBDAluilt536Nem9rQo0EGZgpIqIFNQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Lucas De Marchi <lucas.demarchi@intel.com>,  Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,  Rodrigo
 Vivi
 <rodrigo.vivi@intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>,
  Karthik Poosa <karthik.poosa@intel.com>,  Reuven Abliyev
 <reuven.abliyev@intel.com>,  Oren Weil <oren.jer.weil@intel.com>,
  linux-mtd@lists.infradead.org,  dri-devel@lists.freedesktop.org,
  intel-gfx@lists.freedesktop.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/11] mtd: core: always create master device
In-Reply-To: <20250101153925.865703-2-alexander.usyskin@intel.com> (Alexander
	Usyskin's message of "Wed, 1 Jan 2025 17:39:15 +0200")
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
	<20250101153925.865703-2-alexander.usyskin@intel.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 06 Jan 2025 11:46:26 +0100
Message-ID: <87sepwp6d9.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_024635_693906_615AD679 
X-CRM114-Status: UNSURE (   7.73  )
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

SGkgQWxleGFuZGVyLAoKT24gMDEvMDEvMjAyNSBhdCAxNzozOToxNSArMDIsIEFsZXhhbmRlciBV
c3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+IHdyb3RlOgoKPiBDcmVhdGUgbWFz
dGVyIGRldmljZSB3aXRob3V0IHBhcnRpdGlvbiB3aGVuCj4gQ09ORklHX01URF9QQVJUSVRJT05F
RF9NQVNURVIgZmxhZyBpcyB1bnNldC4KCkkgZG9uJ3QgdGhpbmsgeW91IHRvb2sgaW50byBjb25z
aWRlcmF0aW9uIG15IHJlbWFya3MgcmVnYXJkaW5nIHRoZSBmYWN0CnRoYXQgeW91IHdvdWxkIGJy
ZWFrIHVzZXJzcGFjZS4gSWYgeW91IGVuYWJsZSB0aGUgbWFzdGVyLCB5b3Ugbm8gbG9uZ2VyCmhh
dmUgdGhlIHNhbWUgZGV2aWNlIG51bWJlcmluZyBpbiB1c2Vyc3BhY2UuIEkga25vdyBwZW9wbGUg
c2hvdWxkIG5vdApjYXJlIGFib3V0IHRoZXNlIG51bWJlcnMsIGJ1dCBpbiBwcmFjdGljZSB0aGV5
IGRvLgoKSWYgSSdtIHdyb25nLCBwbGVhc2UgYmUgYSBsaXR0bGUgbW9yZSB2ZXJib3NlIGFib3V0
IHdoeSA6KQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
