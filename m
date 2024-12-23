Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBB5E7718B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Dec 2024 19:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ghIQvX7OGxxpyvUYSS/r5HBUg0frlT7ii2QyimH7ECU=; b=SjHdBsxO8hmXMB
	QdSIn2aWRsZqizbd+/W5162mw9JN+/+ny0k8VfsX3HuBa/ptuf78/tK9Yir0yF2IZBb/t9eJQk6bV
	MZGdl54ebzj5RWJPos8RiO+PC8M9ueNKdpGDzMfySXHJiP8WWuo03K0uaIyOiZ0oOp5+u94Z7KcX0
	ihXoNjCF6xnP8yRE12GcwLr9gKJl0BF7SjX+NE4MApuYt0uguCfxwNRkH/rSNxgDegIUAv+ZWtiov
	4MG2vPqWUSI6kxhGsmdEhr6E6f1UvHPOuGfZPU93IvNlrHiphhKhvnhDAp/ZejzJ7e6HoHvMtwG1z
	m8Bxrb38xdg8cfvRezkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPnzl-0000000AcIc-2NbQ;
	Mon, 23 Dec 2024 19:21:37 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPnzi-0000000AcHz-1kMT
	for linux-mtd@lists.infradead.org;
	Mon, 23 Dec 2024 19:21:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4343AFF803;
	Mon, 23 Dec 2024 19:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734981691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KWj1thEE3fEk4/JDoMlPzjIiOgvaovwBP/OLPmPxMTc=;
	b=XkL4HlxDTSTVu8Z3tpaDo0aUqQjDmb1EDtc/kb/3vkFvtvfjq5NCactwOYkt2DXR9/jgDL
	wrtpgjGDtx0hpkK9ZmSvEYv2EMZbYwv9arz0d3MZuxWiyvtWmfZHn7mwGrlqtaMv6I4+6Y
	90hO51r6ps3MOp4l27g2VGiqP80/ZIJ9OvQmo2O7Bop199rK/KyLNYvqfNj8LseasjZkdO
	AnUXXqybWyvrrZqpZB6TGEVAFLXkpc7XQALLfRbrORYiVT31MnMNXB8uAD28QDMsCT1zp7
	aZgUix8Gfs2nXqYN47SFUTEpGx6C7wxgo0RLtW2VnFI6M3Hae/LoYaQyEMzS9g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: "Poosa, Karthik" <karthik.poosa@intel.com>,  "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  "De Marchi, Lucas"
 <lucas.demarchi@intel.com>,  Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>,
  "Weil, Oren jer" <oren.jer.weil@intel.com>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
  "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 06/10] mtd: intel-dg: wake card on operations
In-Reply-To: <CY5PR11MB6366CBE2D1AA392AD3F745F7ED052@CY5PR11MB6366.namprd11.prod.outlook.com>
	(Alexander Usyskin's message of "Wed, 18 Dec 2024 15:58:35 +0000")
References: <20241119140112.790720-1-alexander.usyskin@intel.com>
	<20241119140112.790720-7-alexander.usyskin@intel.com>
	<Z2H_7Xry3R2fWpMZ@intel.com>
	<24725a85-47c2-49c3-b2ae-443279b2bd13@intel.com>
	<CY5PR11MB63663382E44A258B0BAEF1BAED052@CY5PR11MB6366.namprd11.prod.outlook.com>
	<CY5PR11MB6366CBE2D1AA392AD3F745F7ED052@CY5PR11MB6366.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 23 Dec 2024 20:21:29 +0100
Message-ID: <87cyhiqk7a.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_112134_589160_7719E17B 
X-CRM114-Status: UNSURE (   8.33  )
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

SGVsbG8gQWxleGFuZGVyLAoKPj4gSWYgc28sIEkgaGF2ZSB0byBhZGQgcGF0Y2ggZm9yIG10ZCBz
dWJzeXN0ZW0gdG8gYWx3YXlzIGhhdmUgZGV2aWNlIGZvciBtYXN0ZXIKPj4gaW5pdGlhbGl6ZWQg
cmVnYXJkbGVzcyBvZiBrZXJuZWwgZmxhZy4KPj4gT25seSB0byBpbml0aWFsaXplIHN0cnVjdCBk
ZXZpY2UsIG5vdCB0byBjcmVhdGUgZnVsbCBtdGQgbm9kZS4KPj4gCj4+IE1pcXVlbCAtIGFyZSB5
b3UgYWdyZWUgdG8gdGhpcz8KCkNvbmNlcHR1YWxseSB5ZXMsIGJ1dCBwbGVhc2UgbWluZCBvbmUg
dGhpbmc6IHdlIGRvIG5vdCBicmVhawp1c2Vyc3BhY2UuIFNvIGlmIHlvdSB3YW50IHRvIGtlZXAg
dGhlIG1hc3RlciBtdGQgZGV2aWNlLCBmaW5lLCBidXQgeW91Cm5lZWQgdG8gZG8gaXQgaW4gYSBj
b25zaXN0ZW50IHdheSBzbyB0aGF0IHBlb3BsZSBub3QgZW5hYmxpbmcgdGhlIGtlcm5lbApmbGFn
IHdvbid0IGdldCBhIG5ldyBkZXZpY2UgaW4gdGhlaXIgcm9vdGZzLCBzaGlmdGluZyBhbGwgaW5k
ZXhlcwp1cHdhcmRzLgoKVGhhdCBiZWluZyBzYWlkLCB5b3UgYXJlIHByb2JhYmx5IGdvaW5nIGlu
IHRoZSByaWdodCBkaXJlY3Rpb24gYnkgZG9pbmcKdGhhdC4KClRoYW5rcywKTWlxdcOobAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
