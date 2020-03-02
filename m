Return-Path: <SRS0=I4i7=4T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0350C3F2D2
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 10:14:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72A1320870
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 10:14:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Du45JV0w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72A1320870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9hGFjCMrUaxRB8Un6KIFcLW5H/ltO5rSKWKs8lVSPmw=; b=Du45JV0ww9i8gA
	Num7eOp/+cSfz3bqVOw6N3uiMYmwXU5VMh7p8iW4Ut5QzT0vHaprAk1sy9qXx98ay66p2i51vp42H
	LtyJ+ZUOOR8iTRuVamfazCVWawCGdHujama6cyL5WarSRl2YV0q+Bqvf6DgbTlKjPxtEXv2Ag6UNB
	Ine1ghwB4gVW/eYgWvPrL89X4WZmkgSRf4LurT39U/XLCMGskpj0J25N3+IeRzVviSPgFYOpUINsB
	3yQSCo1007xeotKsUxex6lUk3VBBdcDamM2XA9k/W5cVHc2igWZP0erhtZZAdD5tv3Mjj3DNZ4gZw
	nZzxEeG12TzFT8Az2M2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8i5c-0002Ok-43; Mon, 02 Mar 2020 10:14:20 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8i5X-0002Jy-CJ
 for linux-mtd@lists.infradead.org; Mon, 02 Mar 2020 10:14:17 +0000
X-Originating-IP: 90.89.41.158
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 09708FF819;
 Mon,  2 Mar 2020 10:14:12 +0000 (UTC)
Date: Mon, 2 Mar 2020 11:14:12 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?6LW15Luq5bOw?= <yifeng.zhao@rock-chips.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/3] mtd: rawnand: rockchip: NFC drivers for RK3308,
 RK3188 and others
Message-ID: <20200302111412.156ba580@xps13>
In-Reply-To: <202003021803354304878@rock-chips.com>
References: <20200302024744.28185-1-yifeng.zhao@rock-chips.com>
 <20200302024744.28185-2-yifeng.zhao@rock-chips.com>
 <20200302104754.61204e72@xps13>
 <202003021803354304878@rock-chips.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_021415_783274_D1B40A58 
X-CRM114-Status: UNSURE (   7.09  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgrotbXku6rls7AgPHlpZmVuZy56aGFvQHJvY2stY2hpcHMuY29tPiB3cm90ZSBvbiBN
b24sIDIgTWFyIDIwMjAgMTg6MDY6MTgKKzA4MDA6Cgo+IEhpIE1pcXVlbO+8jAo+IAo+IFRoYW5r
IHlvdSBmb3IgeW91ciByZXBseSwKPiAKPiBDb3VsZCB5b3UgIGNoZWNrIGlmIHRoZXJlIGFyZSBh
bnkgb3RoZXIgc3R5bGUgcHJvYmxlbXM/IEknbGwgbW9kaWZ5IHRoZW0gdG9nZXRoZXIuCgpZb3Ug
Y2FuIGRvIGl0IGJ5IHlvdXIgb3duOgoKCXNjcmlwdHMvY2hlY2twYXRjaC5wbCAtLXN0cmljdCAu
LypwYXRjaAoKVGhlcmUgaXMgYWxzbyBhIG1ha2UgdGFyZ2V0IHRvIHZlcmlmeSB5b3VyIHlhbWwg
c3ludGF4OiAKCgltYWtlIGR0X2JpbmRpbmdfY2hlY2sKCkFsc28gcGxlYXNlIGZpeCB5b3VyIG1h
aWxlciBzbyB0aGF0IGl0IHByZXBlbmRzIGEgJz4gJyB0byBlYWNoCmNvbnRleHQgbGluZSB3aGVu
IHJlc3BvbmRpbmcgdG8gc29tZW9uZS4KCkZpbmFsbHksIHBsZWFzZSBhbHdheXMgaGl0IHRoZSAi
YW5zd2VyIHRvIGFsbCIgYnV0dG9uLCBzbyB0aGF0IGFueW9uZQpjYW4gYmVuZWZpdCBmcm9tIHRo
ZSBkaXNjdXNzaW9ucyA6KQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
