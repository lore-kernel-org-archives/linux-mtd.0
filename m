Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD432C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 07:24:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9544161184
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 07:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9544161184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8LmIL5QS7UCsMpS6h6XqMqOxrsL/M1cI+DlkLDYQyFA=; b=3xTEDUROiy0AJJ
	f99HLlIBY7yBkzbHo34imf2K4hOKSXnyCkoU1QxOvfo+GistsLz+qCWCtyJ3QtoV1f8/RVQ3+JbfS
	0sinoxSI73ymdx0pKsWWCi2eyRQU82IafFC95udJTd+C+c3V4xlqKs38n6aw6qhK2ClM1P1cWU6VO
	V7dwdK648O1EcEr6RwqwSsZdCEGJhancPnB29FUkZGTry33uZUGQlirBLzBFizKtVeQW/sNuhsTit
	KQJT+MhlhkO+Wg1E86RyHAvsCy5/pa+d1RrGJgTz2DdN7q6IVoN9rEfcVNNT/AlSHEKJ9u65JeqO7
	pViPk77wLmccDeOiazDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI4Jd-00FipB-24; Mon, 23 Aug 2021 07:24:17 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI4JZ-00Find-Lt
 for linux-mtd@lists.infradead.org; Mon, 23 Aug 2021 07:24:15 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 0B84440002;
 Mon, 23 Aug 2021 07:24:05 +0000 (UTC)
Date: Mon, 23 Aug 2021 09:24:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Apurva Nandan <a-nandan@ti.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH 03/13] mtd: spinand: Setup spi_mem_op for the SPI IO
 protocol using reg_proto
Message-ID: <20210823092404.0a9b68e4@xps13>
In-Reply-To: <20210823091145.0fd471ef@collabora.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-4-a-nandan@ti.com>
 <20210806203013.30a41fd5@xps13>
 <3de32033-2a6e-bc46-a65a-4027ce78c6d6@ti.com>
 <20210820140840.4bbcac7e@xps13>
 <20210823091145.0fd471ef@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_002413_899638_A006CA65 
X-CRM114-Status: GOOD (  12.04  )
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

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBNb24sIDIzIEF1ZwoyMDIxIDA5OjExOjQ1ICswMjAwOgoKPiBPbiBGcmksIDIw
IEF1ZyAyMDIxIDE0OjA4OjQwICswMjAwCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4gd3JvdGU6Cj4gCj4gPiBIaSBBcHVydmEsCj4gPiAKPiA+IEJvcmlzLCB5b3Ug
bWlnaHQgaGF2ZSBhIGdvb2QgaWRlYSBmb3IgdGhlIG5hbWluZyBkaXNjdXNzZWQgYmVsb3c/ICAK
PiAKPiB7cGF0Y2gsYWRqdXN0LHR3ZWFrfV9vcCgpIGFsbCBzb3VuZCBnb29kIHRvIG1lLiBUaGlz
IGJlaW5nIHNhaWQsIEknbQo+IGEgYml0IGNvbmNlcm5lZCBhYm91dCBkb2luZyB0aGlzIG9wIHR3
ZWFraW5nIGluIHRoZSBob3QtcGF0aC4KPiBMb29rcyBsaWtlIHNvbWV0aGluZyB0aGF0IHNob3Vs
ZCBiZSBkb25lIGF0IHByb2JlIG9yIHdoZW4gc3dpdGNoaW5nIHRvCj4gOEQgbW9kZSwgYW5kIGtl
cHQgYXJvdW5kLiBUaGUgYWx0ZXJuYXRpdmUgd291bGQgYmUgdG8gaGF2ZSBwZXItbW9kZSBvcAo+
IHRhYmxlcywgd2hpY2ggSSB0aGluayB3b3VsZCBiZSBjbGVhcmVyLgoKVHJ1ZSEgVGhhbmtzIGZv
ciB0aGUgaWRlYSEKCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
