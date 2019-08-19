Return-Path: <SRS0=wiZC=WP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE11C3A59B
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2019 04:13:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FDA82082C
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2019 04:13:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LAL/xsSD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="TxHlpLPY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FDA82082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TUFfNiccruyjlUElTdVS+99ebQGmcOnGr9AURd/UKqQ=; b=LAL/xsSD2WC0W7
	xG9rv5ocEQCjS6WXV1/+O+ssW90boW5fYgSr8A8O6YCO26TgDgFCc5HELbKtO/QsmtscrDKMJUZpv
	xnA+2fwlqD7urdGuiMYZdQo853b/8ceRBxG6FXgLqn5WuOI+4jbpANAgt4kOU+BkiIZLgWCdBb0oY
	bDatGIlyzFyakNNzYM+jXvXFKyYZAp6cDM60we/WijuLvCoJmtQawZXJFFqCZgkFOoDsMw4+i+iBZ
	Eig/4cmaXK2olXB5vOOI7MVIZCeVkou/edEE0IbEp3JN9LVkidd6ky2KwMzM51G3mb4knGPkHFFh0
	2DsvPFISQlP5CLwG2l/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzZ2o-0002Dw-JL; Mon, 19 Aug 2019 04:13:22 +0000
Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzZ2l-0002DR-Nl
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2019 04:13:21 +0000
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id x7J4CkcJ011237
 for <linux-mtd@lists.infradead.org>; Mon, 19 Aug 2019 13:12:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x7J4CkcJ011237
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1566187967;
 bh=zawdGZ9ZyNmfYfyUdpwVBwZFTc+KSsHNfxOU2+IVi2E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TxHlpLPY9q/MvzcpjcY8U9IfHjyyjQwEkvAcj8aewNLTKBJpq0ZqnEs0lFtvhOBxs
 TGmm1fWQJZwMYdNmQx6qwxFpcAs2TGKEDjSn0nKYTUU40gvwzMry1vT3H9K4LG/TwO
 NZINvAbSn4FEBSU7ZhUPwmhmtEOuWIjzyNHnjb6dCJE8UYGT6No1Gtbg0vCZo6LYJB
 T9IsnkPJbfFjgAKmzOPNx3LWsFG3Pd6Mpc8CYj5UOK+sZ9I5bTF/ls/h1JbXlQBbmo
 yydh0g/9DdVOWgRdERxps/BdxKXNJUKDR7z2XUk/VMr+lvqTEDmrFAiA9CRXyn+ATt
 aznftmZT4pnKg==
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id q188so316805vsa.4
 for <linux-mtd@lists.infradead.org>; Sun, 18 Aug 2019 21:12:47 -0700 (PDT)
X-Gm-Message-State: APjAAAVOke5kR3PP9FexsKBgnlwYLGY13T60hclYyHX5TQfV2P8Rjg02
 ofCMezA3Ykz03DfUfqwxfh2NuHqwJendXAUO19c=
X-Google-Smtp-Source: APXvYqxZWGF3+HnlOCLODkSxLgONq1AiUQ/7Qzg9X7ABdYlPKFtw/zxeBnwxF8hgshBpwXCwlb5WHLuf6u89bG7yL5w=
X-Received: by 2002:a05:6102:20c3:: with SMTP id
 i3mr13018980vsr.155.1566187965946; 
 Sun, 18 Aug 2019 21:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190618030926.30616-1-yamada.masahiro@socionext.com>
 <1318390798.95477.1560838785550.JavaMail.zimbra@nod.at>
 <CAK7LNARA62uqi8rkDeJ=zjA6vnruTAH2VGOBd4=sQMhF+FHMLA@mail.gmail.com>
 <957967732.18164.1561621143523.JavaMail.zimbra@nod.at>
 <CAK7LNAQLheA3E0UrjirNHzpS2x+xmjc2YCupCBMNoHOwviz6GQ@mail.gmail.com>
 <1574230514.38485.1563091693340.JavaMail.zimbra@nod.at>
 <CAFLxGvxYa9AZiSLBVeDtXznab41me8jBUMoGNvcMDfAZQ8wr7g@mail.gmail.com>
In-Reply-To: <CAFLxGvxYa9AZiSLBVeDtXznab41me8jBUMoGNvcMDfAZQ8wr7g@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 19 Aug 2019 13:12:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNARY6beyondOjsQg-vMFCORoTYYM76drnERHfSYsKu92RA@mail.gmail.com>
Message-ID: <CAK7LNARY6beyondOjsQg-vMFCORoTYYM76drnERHfSYsKu92RA@mail.gmail.com>
Subject: Re: [PATCH v2] jffs2: remove C++ style comments from uapi header
To: Richard Weinberger <richard.weinberger@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190818_211319_989536_3712730E 
X-CRM114-Status: GOOD (  12.84  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgNDoxNCBQTSBSaWNoYXJkIFdlaW5iZXJnZXIKPHJpY2hh
cmQud2VpbmJlcmdlckBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gU3VuLCBKdWwgMTQsIDIwMTkg
YXQgMTA6MDggQU0gUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4gd3JvdGU6Cj4g
Pgo+ID4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+ID4gPiBMb29rcyBsaWtlIHRo
aXMgdHJpdmlhbCBwYXRjaCBtaXNzZWQgdGhlIHB1bGwgcmVxdWVzdC4KPiA+ID4KPiA+ID4KPiA+
ID4gTXkgbW90aXZhdGlvbiBpcyB0byBtYWtlIHN1cmUgVUFQSSBoZWFkZXJzCj4gPiA+IGFyZSBy
ZWFsbHkgY29tcGlsYWJsZSBpbiB1c2VyLXNwYWNlLAo+ID4gPiBhbmQgbm93IGNoZWNrZWQgYnkg
dGhlIGZvbGxvd2luZyBjb21taXQ6Cj4gPiA+Cj4gPiA+IGNvbW1pdCBkNmZjOWZjYmFhNjU1Y2Zm
MmQyYmUwNWUxNjg2N2QxOTE4Zjc4Yjg1Cj4gPiA+IEF1dGhvcjogTWFzYWhpcm8gWWFtYWRhIDx5
YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4KPiA+ID4gRGF0ZTogICBNb24gSnVsIDEgMDk6
NTg6NDAgMjAxOSArMDkwMAo+ID4gPgo+ID4gPiAgICBrYnVpbGQ6IGNvbXBpbGUtdGVzdCBleHBv
cnRlZCBoZWFkZXJzIHRvIGVuc3VyZSB0aGV5IGFyZSBzZWxmLWNvbnRhaW5lZAo+ID4gPgo+ID4g
Pgo+ID4gPgo+ID4gPiBJcyB0aGVyZSBhIGNoYW5jZSBmb3IgaXQgYmVpbmcgbWVyZ2VkLAo+Cj4g
QXBwbGVkLgo+Cj4gLS0KPiBUaGFua3MsCj4gLy9yaWNoYXJkCgoKSSBjaGVja2VkIG5leHQtMjAx
OTA4MTksIGJ1dCBJIHN0aWxsIGRvIG5vdCBzZWUgdGhpcyBwYXRjaC4KV2hlcmUgaGFzIHRoaXMg
cGF0Y2ggZ29uZT8KCgoKLS0gCkJlc3QgUmVnYXJkcwpNYXNhaGlybyBZYW1hZGEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
