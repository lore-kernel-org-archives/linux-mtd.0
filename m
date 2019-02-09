Return-Path: <SRS0=3nsT=QQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FD3C282C4
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Feb 2019 08:30:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B867220869
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Feb 2019 08:30:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nobt7wLi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7/0kqei"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B867220869
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:References:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3TkxoiGelZsmGZyEaufG+3uLmhYKTWxImRiWR7ya93E=; b=Nobt7wLihOMcim
	Cj4VRaKrSoJDIXnlN2Tvtl/UZWkF00PM1tIymhBSarwxSc55ioBOKqvmLzX58Cy+pwOCvWTLlJgnz
	doJEDFPlzvXfbaB8bUj/YEvT35j0uVJs58j8NXsD43vrJUwKClG4mNUPji7G5urovHzqhu8jWZOBz
	fCRBfgmUCiFna8zaNcgKDCUA/3n9yd9oYa6eZoaso1MUerbqFpPBJ1OU434EEY+fn6KRMHRgDlmY6
	vmOdt0TX80QoDQtpOXRhlq8se+QC+56g2/1l69ogLZK/IYwB/kQYs4rIGUmnmitIojCB7r93VgS4n
	bYLyuhnUK3A6se5Tvcww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsO1L-0003tm-Bu; Sat, 09 Feb 2019 08:29:55 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsO1I-0003tP-3R
 for linux-mtd@lists.infradead.org; Sat, 09 Feb 2019 08:29:53 +0000
Received: by mail-pg1-x544.google.com with SMTP id d9so2642040pgl.1
 for <linux-mtd@lists.infradead.org>; Sat, 09 Feb 2019 00:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=94cfNQIHKpyI6F4k2rEWTk6YvzKz4UtBNyk2ZTQ99zc=;
 b=g7/0kqeiKIxEL+dyBK2pudUoAd2B9YuUi6Duh4JqR395pUlpXd1OCatIAo9UBROsUf
 bU0y/oIEL7zr9Tb8pRd/O4WYMdbb+7hGGYMGEVpG50lJYvUuyE3A0xTXaUlSfD7oiwGQ
 6S4wn69AP3xMxUBWZYnUplcx7AMs7TMCbmgB8J3dr1pEPuEYrocQQMAOXfMfnLY3qCWY
 D8Ue7bfjCMvXHByyO6+a4KXoh8uIxmlE5YVQd09DgdK2nEalDbqyCp2rhj5QWlZXyvEg
 UmFhzbu3Syo4XK47vkChT8H5GI5DqPb3LOv1q55q3iQKmmyMIxC3CtkkdNpbyHM0kNZ2
 1odg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=94cfNQIHKpyI6F4k2rEWTk6YvzKz4UtBNyk2ZTQ99zc=;
 b=aH5RuywzzOu/Y1M3cME1GpXGmYdWWbBuDMtLEr0Mz7Za/wKzjnc4kN4eZCdgaeM4ew
 /sk9J1uPHKWBqKk/3WexT/9Ym0LiakSG2QeGezOc7lu1DVB15tKzS2K0jRO2niibAMxv
 ODc72fv190goVsGP8U/xA21EZmvWI3jhPJ48mCFw+vXnxd6oZZHhKDNBcZ/NwGg/AIOp
 Smd79qxjZuWDSnMQbWpZToYklk5+aDFVDfOIPd6akxj7VZfimFF1Wavx/0kES9dd0fjL
 ai+ggULlinO6ff2dvd9sqeuwfNN+0zRuMOZDY5dOYlSjS+MGSOa+wERLiC3E0yIybYfd
 cJcQ==
X-Gm-Message-State: AHQUAuYH8kCazLViMOYkQJdE+UctjMYK4VhD6B3oOUABV25vfFTJX8Y+
 WJ4tzJSLM2+LBxWm/rS31VzzLGFriMg=
X-Google-Smtp-Source: AHgI3Ibcrg9vVSi6wlmuewXUYicN6kfWpmSGJTEKPhYkRTvI1FmMgNfaPg99UMrlrbffcVbxUXnpdQ==
X-Received: by 2002:a63:c56:: with SMTP id 22mr9300464pgm.44.1549700991141;
 Sat, 09 Feb 2019 00:29:51 -0800 (PST)
Received: from ikegamiPC ([240b:10:2720:5510:7dbb:9ccc:f403:cae1])
 by smtp.gmail.com with ESMTPSA id h8sm4996328pgv.27.2019.02.09.00.29.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 09 Feb 2019 00:29:50 -0800 (PST)
From: "Tokunori Ikegami" <ikegami.t@gmail.com>
To: "'Gustavo A. R. Silva'" <gustavo@embeddedor.com>,
 "'David Woodhouse'" <dwmw2@infradead.org>,
 "'Brian Norris'" <computersforpeace@gmail.com>,
 "'Boris Brezillon'" <bbrezillon@kernel.org>,
 "'Marek Vasut'" <marek.vasut@gmail.com>,
 "'Richard Weinberger'" <richard@nod.at>
References: <20190208180615.GA24601@embeddedor>
In-Reply-To: <20190208180615.GA24601@embeddedor>
Subject: RE: [PATCH] mtd: cfi_cmdset_0002: Mark expected switch fall-throughs
Date: Sat, 9 Feb 2019 17:29:46 +0900
Message-ID: <000001d4c051$9f66deb0$de349c10$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQLfvGHS4rj+Sm6xb7HCdJOPFYC+/aPBKgyA
Content-Language: ja
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190209_002952_173789_E509D0FC 
X-CRM114-Status: GOOD (  14.57  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

UmV2aWV3ZWQtYnk6IFRva3Vub3JpIElrZWdhbWkgPGlrZWdhbWkudEBnbWFpbC5jb20+Cgo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogbGludXgtbXRkIFttYWlsdG86bGludXgt
bXRkLWJvdW5jZXNAbGlzdHMuaW5mcmFkZWFkLm9yZ10gT24gQmVoYWxmCj4gT2YgR3VzdGF2byBB
LiBSLiBTaWx2YQo+IFNlbnQ6IFNhdHVyZGF5LCBGZWJydWFyeSA5LCAyMDE5IDM6MDYgQU0KPiBU
bzogRGF2aWQgV29vZGhvdXNlOyBCcmlhbiBOb3JyaXM7IEJvcmlzIEJyZXppbGxvbjsgTWFyZWsg
VmFzdXQ7IFJpY2hhcmQKPiBXZWluYmVyZ2VyCj4gQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRl
YWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBHdXN0YXZvCj4gQS4gUi4gU2ls
dmEKPiBTdWJqZWN0OiBbUEFUQ0hdIG10ZDogY2ZpX2NtZHNldF8wMDAyOiBNYXJrIGV4cGVjdGVk
IHN3aXRjaCBmYWxsLXRocm91Z2hzCj4gCj4gSW4gcHJlcGFyYXRpb24gdG8gZW5hYmxpbmcgLVdp
bXBsaWNpdC1mYWxsdGhyb3VnaCwgbWFyayBzd2l0Y2gKPiBjYXNlcyB3aGVyZSB3ZSBhcmUgZXhw
ZWN0aW5nIHRvIGZhbGwgdGhyb3VnaC4KPiAKPiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dp
bmcgd2FybmluZ3M6Cj4gCj4gZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmM6IElu
IGZ1bmN0aW9uIOKAmGdldF9jaGlw4oCZOgo+IGRyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRf
MDAwMi5jOjg3MDo2OiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkKPiBmYWxsIHRocm91Z2gg
Wy1XaW1wbGljaXQtZmFsbHRocm91Z2g9XQo+ICAgIGlmIChtb2RlID09IEZMX1JFQURZICYmIGNo
aXAtPm9sZHN0YXRlID09IEZMX1JFQURZKQo+ICAgICAgIF4KPiBkcml2ZXJzL210ZC9jaGlwcy9j
ZmlfY21kc2V0XzAwMDIuYzo4NzM6Mjogbm90ZTogaGVyZQo+ICAgZGVmYXVsdDoKPiAgIF5+fn5+
fn4KPiBkcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYzogSW4gZnVuY3Rpb24g4oCY
Y2ZpX2FtZHN0ZF9zeW5j4oCZOgo+IGRyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5j
OjI3NDU6MTY6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heQo+IGZhbGwgdGhyb3VnaCBbLVdp
bXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4gICAgIGNoaXAtPnN0YXRlID0gRkxfU1lOQ0lORzsKPiAg
ICAgfn5+fn5+fn5+fn5+Xn5+fn5+fn5+fn5+Cj4gZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNl
dF8wMDAyLmM6Mjc1MDozOiBub3RlOiBoZXJlCj4gICAgY2FzZSBGTF9TWU5DSU5HOgo+ICAgIF5+
fn4KPiAKPiBXYXJuaW5nIGxldmVsIDMgd2FzIHVzZWQ6IC1XaW1wbGljaXQtZmFsbHRocm91Z2g9
Mwo+IAo+IFRoaXMgcGF0Y2ggaXMgcGFydCBvZiB0aGUgb25nb2luZyBlZmZvcnRzIHRvIGVuYWJs
aW5nCj4gLVdpbXBsaWNpdC1mYWxsdGhyb3VnaC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZv
IEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210
ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0
XzAwMDIuYwo+IGIvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMKPiBpbmRleCA3
MjQyOGI2YmZjNDcuLjBiMGExODc0ZDNiZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9jaGlw
cy9jZmlfY21kc2V0XzAwMDIuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRf
MDAwMi5jCj4gQEAgLTg2OSw2ICs4NjksNyBAQCBzdGF0aWMgaW50IGdldF9jaGlwKHN0cnVjdCBt
YXBfaW5mbyAqbWFwLCBzdHJ1Y3QgZmxjaGlwCj4gKmNoaXAsIHVuc2lnbmVkIGxvbmcgYWRyCj4g
IAkJLyogT25seSBpZiB0aGVyZSdzIG5vIG9wZXJhdGlvbiBzdXNwZW5kZWQuLi4gKi8KPiAgCQlp
ZiAobW9kZSA9PSBGTF9SRUFEWSAmJiBjaGlwLT5vbGRzdGF0ZSA9PSBGTF9SRUFEWSkKPiAgCQkJ
cmV0dXJuIDA7Cj4gKwkJLyogZmFsbCB0aHJvdWdoICovCj4gCj4gIAlkZWZhdWx0Ogo+ICAJc2xl
ZXA6Cj4gQEAgLTI3NDcsNiArMjc0OCw3IEBAIHN0YXRpYyB2b2lkIGNmaV9hbWRzdGRfc3luYyAo
c3RydWN0IG10ZF9pbmZvICptdGQpCj4gIAkJCSAqIGFzIHRoZSB3aG9sZSBwb2ludCBpcyB0aGF0
IG5vYm9keSBjYW4gZG8gYW55dGhpbmcKPiAgCQkJICogd2l0aCB0aGUgY2hpcCBub3cgYW55d2F5
Lgo+ICAJCQkgKi8KPiArCQkJLyogZmFsbCB0aHJvdWdoICovCj4gIAkJY2FzZSBGTF9TWU5DSU5H
Ogo+ICAJCQltdXRleF91bmxvY2soJmNoaXAtPm11dGV4KTsKPiAgCQkJYnJlYWs7Cj4gLS0KPiAy
LjIwLjEKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKPiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
