Return-Path: <SRS0=s9Jc=V2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B42DC433FF
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 07:14:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D61522070B
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 07:14:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ngN/rx2Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzRXW84t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D61522070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hiRLijwdMS/xg23EUyoONuiXk9+qTuj4QVo9TkBcdiw=; b=ngN/rx2Qdfmdh1
	VWdzOyNzyRLvL9s2BqB49HhEQT61OELlcOO6ziywyJDqJ3LMTAoJjWKCD5nfqJ5zuX+8GwJN96L/W
	Ds6+jzBnBHGPmRP4dzFkoo5twgepc2yiQjn2NX7zwcmarnI52MQFM3CAn+eE4ZQwHFR741KnN4b0Y
	CxF6/2rwlrex8hL9UEU/larZ8Y1QV5fPPUgRNCBA9LiHS7YQar9FY/7zqgB/CZsBHcRMBhGs8nYdJ
	23Aca8TPd60ZGd8w6Zej68erm9OzgAVS39CmVcHhvDg/Og00PDXuYckRgyp17ex/NXeOb4kStK5zJ
	hyUuGJp+kOTqCDY4YAqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrzrb-0004NK-CB; Mon, 29 Jul 2019 07:14:31 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrzrX-0004Mq-Ui
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2019 07:14:29 +0000
Received: by mail-wr1-x441.google.com with SMTP id x1so10643431wrr.9
 for <linux-mtd@lists.infradead.org>; Mon, 29 Jul 2019 00:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cPhNW6XM/DWjYpp1TRsuuPPfo9D+4pBgDNYFFKehphM=;
 b=VzRXW84tovUMshRZqE7B2N33RTcWhzQpxbZnLaZjI88d/N8Q+d1/XwrNy2AzEU7E8L
 2v2xXFyEHVtiU1kqgIuoRko0Uyz4ddLof+jzG+XuqQNWkLpl5QhrSraek22QpOvYc63o
 H3bVGEtUaEhCfq75+62X+3m0kdbhq2n6KHTxhY/CLgurtjBkt7qlsygME7cf7YmRc7A3
 rM1Z/l+8pRJnCYwzWPjanCWNmyW3AmYIX1JV2jX188aPg+s2mORYhhHXPw2w1WdLaRtY
 LxXOFY687g7D+9GzktpvvcFAsSPlwgc2CMtGeti3TUXujzsxa2phpy9iNo+gk5HhRF4i
 /a9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cPhNW6XM/DWjYpp1TRsuuPPfo9D+4pBgDNYFFKehphM=;
 b=mus4lJYhNPVIEfXWgHO3F0t67QZl/rMG+UX/d+xrahjhY7LUptsx2AxWNP088lVNX0
 KaciiJ1D0aVy7PRH8ekc39gw5z+FdiJ95zu6rKdnBuXXhCqnnGmmzuj1unAv2oKUMI4s
 fPyxas/Ak2GSREE8c32mQnM3fZCHVCBUtDpL+le7cog86BSJhYGrsMkKEq4PZIKJnQ2v
 nKWIN0ujjOQ9JntRCeNpaQzBtNSvd9JwXlTtv51WbDRVTmLN8AZoezfBAa/iUeZyKbZy
 AGMowynZIe66AeNq1cmOogMpLKUFPSlz53/l0Gy2HI5nSgx8Uxxivvg4EaodoCS2V6ek
 JELw==
X-Gm-Message-State: APjAAAXtv5MM4y398HIs6G7NL36uJrQl3EbnMueQu9Q4Z5fI62HsIpmF
 1WiWGQhIN5FHZwV6Vi2VGnoyV1HkFci+2/xvSk8=
X-Google-Smtp-Source: APXvYqxlE5EC8FXImrLCZo8M6Mps0ppkoTKD0q4f3M3xR+b39DLEtMg49EXST++vclsWjzxqN6WplQUIOBJnkwTD/Ys=
X-Received: by 2002:adf:e602:: with SMTP id p2mr81437019wrm.306.1564384465878; 
 Mon, 29 Jul 2019 00:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190618030926.30616-1-yamada.masahiro@socionext.com>
 <1318390798.95477.1560838785550.JavaMail.zimbra@nod.at>
 <CAK7LNARA62uqi8rkDeJ=zjA6vnruTAH2VGOBd4=sQMhF+FHMLA@mail.gmail.com>
 <957967732.18164.1561621143523.JavaMail.zimbra@nod.at>
 <CAK7LNAQLheA3E0UrjirNHzpS2x+xmjc2YCupCBMNoHOwviz6GQ@mail.gmail.com>
 <1574230514.38485.1563091693340.JavaMail.zimbra@nod.at>
In-Reply-To: <1574230514.38485.1563091693340.JavaMail.zimbra@nod.at>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 29 Jul 2019 09:14:14 +0200
Message-ID: <CAFLxGvxYa9AZiSLBVeDtXznab41me8jBUMoGNvcMDfAZQ8wr7g@mail.gmail.com>
Subject: Re: [PATCH v2] jffs2: remove C++ style comments from uapi header
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_001428_048693_F0759590 
X-CRM114-Status: GOOD (  11.61  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBKdWwgMTQsIDIwMTkgYXQgMTA6MDggQU0gUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNo
YXJkQG5vZC5hdD4gd3JvdGU6Cj4KPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4g
PiBMb29rcyBsaWtlIHRoaXMgdHJpdmlhbCBwYXRjaCBtaXNzZWQgdGhlIHB1bGwgcmVxdWVzdC4K
PiA+Cj4gPgo+ID4gTXkgbW90aXZhdGlvbiBpcyB0byBtYWtlIHN1cmUgVUFQSSBoZWFkZXJzCj4g
PiBhcmUgcmVhbGx5IGNvbXBpbGFibGUgaW4gdXNlci1zcGFjZSwKPiA+IGFuZCBub3cgY2hlY2tl
ZCBieSB0aGUgZm9sbG93aW5nIGNvbW1pdDoKPiA+Cj4gPiBjb21taXQgZDZmYzlmY2JhYTY1NWNm
ZjJkMmJlMDVlMTY4NjdkMTkxOGY3OGI4NQo+ID4gQXV0aG9yOiBNYXNhaGlybyBZYW1hZGEgPHlh
bWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgo+ID4gRGF0ZTogICBNb24gSnVsIDEgMDk6NTg6
NDAgMjAxOSArMDkwMAo+ID4KPiA+ICAgIGtidWlsZDogY29tcGlsZS10ZXN0IGV4cG9ydGVkIGhl
YWRlcnMgdG8gZW5zdXJlIHRoZXkgYXJlIHNlbGYtY29udGFpbmVkCj4gPgo+ID4KPiA+Cj4gPiBJ
cyB0aGVyZSBhIGNoYW5jZSBmb3IgaXQgYmVpbmcgbWVyZ2VkLAoKQXBwbGVkLgoKLS0gClRoYW5r
cywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
