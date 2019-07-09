Return-Path: <SRS0=DwYL=VG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F8D6C606B0
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jul 2019 08:00:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30764214AF
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jul 2019 08:00:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iFlFPw1o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30764214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i1Foc3oGLoMLL9P0SZqJ3xBPH+hKvIxIg5Gr42rIZes=; b=iFlFPw1o/xF/dq
	cCEOgl+h4decVWkEYhFXK/d/TfL7egLiO7kQpGvs2zhcNb0nAmaA2j6twchEtxg9UoPAzXDgTVSEy
	Dt4a6GIttQpS6VCotIz9QSuwc6rgNKIMbun/nkeDTgeobXlDxMM7Ficsi1CVuiAOBD1Z6JuCRBzpd
	x9RNuvuu151DCCdDaJo9vBbcsNUwm0O6hvLAseln1x9i+vj1YuqcSxlVlMBK7gTBOW9q8csbRNN83
	a8r13HrtSv8ngwyfe1IGsVVfvEUj4bhlTtOcDYKfvKyuKm2Te+c7V3iYLNSWEGAE/S6PNrGpiD7KV
	h/Kugq+1OZz2hVaD62+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hkl2a-0003Gq-5X; Tue, 09 Jul 2019 07:59:56 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hkl2W-0003GC-Ea
 for linux-mtd@lists.infradead.org; Tue, 09 Jul 2019 07:59:54 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C60EC20002;
 Tue,  9 Jul 2019 07:59:25 +0000 (UTC)
Date: Tue, 9 Jul 2019 09:59:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Subject: Re: [PATCH] mtd: rawnand: stm32_fmc2: avoid warnings when building
 with W=1 option
Message-ID: <20190709095925.7accd6f4@xps13>
In-Reply-To: <13d30ef8-b649-6416-3814-35a53c5c09ce@st.com>
References: <1561128189-14411-1-git-send-email-christophe.kerello@st.com>
 <20190701091128.4e67f1de@xps13>
 <13d30ef8-b649-6416-3814-35a53c5c09ce@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190709_005952_647833_16B9F858 
X-CRM114-Status: UNSURE (   8.67  )
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQ2hyaXN0b3BoZSwKCkNocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0
LmNvbT4gd3JvdGUgb24gVHVlLCA5IEp1bCAyMDE5CjA5OjUwOjEwICswMjAwOgoKPiBPbiA3LzEv
MTkgOToxMSBBTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIENocmlzdG9waGUsCj4gPiAK
PiA+IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0LmNvbT4gd3JvdGUg
b24gRnJpLCAyMSBKdW4KPiA+IDIwMTkgMTY6NDM6MDkgKzAyMDA6Cj4gPiAgIAo+ID4+IFRoaXMg
cGF0Y2ggc29sdmVzIHdhcm5pbmdzIGRldGVjdGVkIGJ5IHNldHRpbmcgVz0xIHdoZW4gYnVpbGRp
bmcuCj4gPj4KPiA+PiBXYXJuaW5ncyB0eXBlIGRldGVjdGVkOgo+ID4+IGRyaXZlcnMvbXRkL25h
bmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jOiBJbiBmdW5jdGlvbiDigJhzdG0zMl9mbWMyX2NhbGNf
dGltaW5nc+KAmToKPiA+PiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYzox
NDE3OjIzOiB3YXJuaW5nOiBjb21wYXJpc29uIGlzCj4gPj4gYWx3YXlzIGZhbHNlIGR1ZSB0byBs
aW1pdGVkIHJhbmdlIG9mIGRhdGEgdHlwZSBbLVd0eXBlLWxpbWl0c10KPiA+PiAgICBlbHNlIGlm
ICh0aW1zLT50d2FpdCA+IEZNQzJfUE1FTV9QQVRUX1RJTUlOR19NQVNLKQo+ID4+Cj4gPj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9Ac3QuY29t
Pgo+ID4+IC0tLSAgCj4gPiAKPiA+IEFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MuICAKPiAK
PiBIaSBNaXF1ZWwsCj4gCj4gQWZ0ZXIgZmV0Y2hpbmcgbmFuZC9uZXh0LCBJIGRvIG5vdCBzZWUg
dGhpcyBwYXRjaCBhcHBsaWVkLgo+IAoKTm90IHN1cmUgd2hhdCBoYXBwZW5lZCwgcGxlYXNlIHJl
c2VuZCB3aXRoIGEgRml4ZXMvc3RhYmxlIHRhZyBhZGRlZCwKSSdsbCBhcHBseSB3aGVuIC1yYzEg
d2lsbCBiZSBvdXQuCgpTb3JyeSBhZ2FpbiBmb3IgdGhlIHRyb3VibGUsIHRoYW5rcyBmb3IgdGhl
IG5vdGljZSEKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
