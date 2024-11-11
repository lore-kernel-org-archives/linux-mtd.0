Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034D4D3ABF4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 20:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yhe7aWi0djRpQMHF23CY+YwqI1vbRMtH9s0pJYCfI0U=; b=dapT6Jgmazzo7T
	jH0yW8APCXtsEppSJ4om+5nAaxi+5cic0xhv7heXH8DBXP1w3bpjRyjc2h1bYs0/G28nY/yDtAevR
	jkYCU7APOKkCMdigkFEec5KDe9kjkuJoHlmDUZHLy2+HSs0W+sSJk+SHKQEzgUDXFibMmxkckp/lA
	zZGzr3PpiogCHJOiWiKKauBWhyeOWRkfCOs4lvfqoYJ/W8kFzTrzl4np8qXoNlL9bWSO/pGk4ZNOE
	Kzf3mdfjfmhyqbK64mUGPcjXz2jDrRI9OACPRQNODxl2lvXHQXb9HtrznrTdS6RuLOwihylo1UKdO
	d6EQSIXoDvwTorfqdOUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAaa7-000000017vE-1A0y;
	Mon, 11 Nov 2024 20:00:15 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAaZw-000000017oS-3mNE
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 20:00:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64570FF805;
	Mon, 11 Nov 2024 19:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731355201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/sZlCQTAFlSV3ML2XYkoLh9xs5MKTCcnmOpJ7AVIaFs=;
	b=Uz4rrv9sAP6S1v8QJIJFrVsvty0w6LV7bj8szBZ3c6JUpFfJZMqY1PY7ggwgRie8xN6OtY
	DPSXnkYejOFnRKak5R1szxwUDKqIDtzg1hzIZX6bAeA9PwYmGxGqRlxGuCTu5wVuojLLR0
	5/EKKzrKJYipEREX7mfpycg3/XKqDBkB/U47/hFOlwAN6G0lefplYzZh1RT/ghKfeaAx+G
	FebU7XtxgGauhPdMs6Ho0PNyl6Z38OWv7zh4/ioRknH7nxLvC43fd21YlFFfudVvHh10RL
	D0pckZO+obQ4tj7cdnK9tdsytdbUQHJcMJl0P2UrnR6OJjsvuwyPrW7M2ncK7A==
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
  Oren Weil <oren.jer.weil@intel.com>,  linux-mtd@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  intel-gfx@lists.freedesktop.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/10] mtd: add driver for Intel discrete graphics
In-Reply-To: <20241107131356.2796969-1-alexander.usyskin@intel.com> (Alexander
	Usyskin's message of "Thu, 7 Nov 2024 15:13:46 +0200")
References: <20241107131356.2796969-1-alexander.usyskin@intel.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 11 Nov 2024 20:59:58 +0100
Message-ID: <87y11po81t.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_120005_113228_77C09182 
X-CRM114-Status: GOOD (  11.31  )
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

SGVsbG8gQWxleGFuZGVyLAoKT24gMDcvMTEvMjAyNCBhdCAxNToxMzo0NiArMDIsIEFsZXhhbmRl
ciBVc3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+IHdyb3RlOgoKPiBBZGQgZHJp
dmVyIGZvciBhY2Nlc3MgdG8gSW50ZWwgZGlzY3JldGUgZ3JhcGhpY3MgY2FyZAo+IGludGVybmFs
IE5WTSBkZXZpY2UuCj4gRXhwb3NlIGRldmljZSBvbiBhdXhpbGlhcnkgYnVzIGJ5IGk5MTUgYW5k
IFhlIGRyaXZlcnMgYW5kCj4gcHJvdmlkZSBtdGQgZHJpdmVyIHRvIHJlZ2lzdGVyIHRoaXMgZGV2
aWNlIHdpdGggTVREIGZyYW1ld29yay4KPgo+IFRoaXMgaXMgYSByZXdyaXRlIG9mICJkcm0vaTkx
NS9zcGk6IHNwaSBhY2Nlc3MgZm9yIGRpc2NyZXRlIGdyYXBoaWNzIgo+IGFuZCAic3BpOiBhZGQg
ZHJpdmVyIGZvciBJbnRlbCBkaXNjcmV0ZSBncmFwaGljcyIKPiBzZXJpZXMgd2l0aCBjb25uZWN0
aW9uIHRvIHRoZSBYZSBkcml2ZXIgYW5kIHNwbGl0dGluZwo+IHRoZSBzcGkgZHJpdmVyIHBhcnQg
dG8gc2VwYXJhdGUgbW9kdWxlIGluIG10ZCBzdWJzeXN0ZW0uCj4KPiBUaGlzIHNlcmllcyBpbnRl
bmRlZCB0byBiZSBwdXNoZWQgdGhyb3VnaCBkcm0teGUtbmV4dC4KCk92ZXJhbGwgdGhlIG10ZCBi
aXRzIGxvb2sgZmluZSwgSSBkb24ndCB3YW50IHRvIGJsb2NrIHRoaXMgc2VyaWVzCmZ1cnRoZXIg
c28geW91IGNhbiBhZGQgb24gdGhlIG10ZCBwYXRjaGVzIG15CgpBY2tlZC1ieTogTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
