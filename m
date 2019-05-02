Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB478C43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 06:23:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97FCF20873
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 06:23:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u3dLguPt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQE+pYv7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97FCF20873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=posgoVxMXVFgAptykXYVnHhPqWwRGKcoPLXpdus3WjY=; b=u3dLguPtqaMGTs
	c//44Oqo+z5bknvgypSkcI3SO2YNaCVih2rjVO8FCnGXm3y/IyLS1Tn/6WoVqvJSuOL6JZXzsaBkQ
	SZllQtlYhTrG5H936kuTLo4Hkvast66PBBX6qx4+T6MWjBzK63hyLRjJsxqqd+Amne15MkUG+r+Z5
	TPt4CBldpi8w1XNkn2HBW+kzP/wdmzh7yJ3ohLKSgR3SSWXejX4xqYpJRMjXPc7/49vTwjzXCF5je
	SoNtwhCJsBYmqu3FNrxR3TNmhdTYJXXqP2LztIrDytw6Nh70aHbic/exme2fg7GxNOw5j2P8ko2vy
	776d+zcV0MYSJahyVgag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hM58H-0002gM-0T; Thu, 02 May 2019 06:23:49 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hM58D-0002fW-VE
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 06:23:47 +0000
Received: by mail-io1-xd44.google.com with SMTP id r18so1090735ioh.2
 for <linux-mtd@lists.infradead.org>; Wed, 01 May 2019 23:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZhEnpCiK38dEYBr2uzx8FJBZlmYQCiMhky3F4FoA1gQ=;
 b=BQE+pYv7YdStjjZYwA3VXk0sjcHeVCvkicQKlA2YUgZgPegb7+25JLDs5Sy5rMwvSZ
 OhP6Je0CtJR6DVV/sp1CbcyNrST3IbvYuXboU0plXYtOKxt/GBRpB2raZCZ/7DeBGr0E
 p0CTmS1qUc10v0a1KMkiyKb2H7hapQm3i8gmHmM+rpU2Lkt/YgLnzSoFGrbDUs2P1S80
 UGYb7M8pDZa1EMHMqzLE1cQIHNmpDxlD/+cDlWRHuyQLPjT5NafBgOI7o+pE6eUPZK9E
 WuoTB+yIFScSYctxgzSwrnc5HPuWHn2pzv3nInu4M7MSRKpZPkrj7itDwkNBQTyJW+Mi
 G9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZhEnpCiK38dEYBr2uzx8FJBZlmYQCiMhky3F4FoA1gQ=;
 b=RHUF5zXotyCwevbnt3N6Qmov1hf8oSgnauORIN0e/TYmQxBzuM0YRYh92QiKapWSYH
 jQ61pLzqSkhF/uyTsBvTFHkBNVT5UfBZpikO4PRRK/YdJliqXSdpgOQAfoDGbK48LW01
 /T3uSBmsnHVXA6PET9BZWbj8ZIe1CrjfekOUM84Ln/7XtmKGOZM/rqBQNSoSwsehIYB3
 YDeoBeVKL4xHz/hkS2aJM3tKczmEmYtmhl7kodf5axQ7To4e9D9E8cmDu9qxtjym7SjG
 AKlRz/DTPwKohKB3QSxvr8/jejHr/l9ejhPsvfnMBTowshkkSMw0lMKrb69+JNNH3th3
 BZVg==
X-Gm-Message-State: APjAAAVqX8EBRJarjByBqgBlmuZeaLtKk5DyDDHYKGBkMYiCO4Nx5Aij
 D6fBiSHMzrMDO9ReSGy0AzZeiLMrVcvarWg6+M0=
X-Google-Smtp-Source: APXvYqxoAwhRx+e3Wq+/p+L/aiuaPbf2PkVB26huHmGBGPw0izOihcwI/g4G+h/PSSTN0vAD/uVmLCKioGLA6a5P0GI=
X-Received: by 2002:a05:6602:12:: with SMTP id
 b18mr1290631ioa.224.1556778224306; 
 Wed, 01 May 2019 23:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
 <20190426164224.11327-5-pawel.mikolaj.chmiel@gmail.com>
 <20190502015408.GA11612@bogus>
In-Reply-To: <20190502015408.GA11612@bogus>
From: Tomasz Figa <tomasz.figa@gmail.com>
Date: Thu, 2 May 2019 15:23:33 +0900
Message-ID: <CA+Ln22HLqnbbY37FG6CwjZvZH7G35Z+0kNq7XFU4WtZyk_EqZQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] dt-binding: mtd: onenand/samsung: Add device tree
 support
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190501_232346_009040_30BA80EF 
X-CRM114-Status: GOOD (  23.37  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, bbrezillon@kernel.org, richard@nod.at,
 linux-kernel <linux-kernel@vger.kernel.org>, marek.vasut@gmail.com,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com,
 David Woodhouse <dwmw2@infradead.org>,
 =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

MjAxOeW5tDXmnIgy5pelKOacqCkgMTA6NTQgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz46
Cj4KPiBPbiBGcmksIEFwciAyNiwgMjAxOSBhdCAwNjo0MjoyM1BNICswMjAwLCBQYXdlxYIgQ2ht
aWVsIHdyb3RlOgo+ID4gRnJvbTogVG9tYXN6IEZpZ2EgPHRvbWFzei5maWdhQGdtYWlsLmNvbT4K
PiA+Cj4gPiBUaGlzIHBhdGNoIGFkZHMgZHQtYmluZGluZ3MgZm9yIFNhbXN1bmcgT25lTkFORCBk
cml2ZXIuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogVG9tYXN6IEZpZ2EgPHRvbWFzei5maWdhQGdt
YWlsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFBhd2XFgiBDaG1pZWwgPHBhd2VsLm1pa29sYWou
Y2htaWVsQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9iaW5kaW5ncy9tdGQvc2Ftc3VuZy1v
bmVuYW5kLnR4dCAgICAgICAgICB8IDQ2ICsrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3NhbXN1bmctb25lbmFuZC50eHQKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9zYW1z
dW5nLW9uZW5hbmQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9z
YW1zdW5nLW9uZW5hbmQudHh0Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAw
MDAwMDAwMDAwLi4zNDFkOTdjYzE1MTMKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvc2Ftc3VuZy1vbmVuYW5kLnR4dAo+ID4g
QEAgLTAsMCArMSw0NiBAQAo+ID4gK0RldmljZSB0cmVlIGJpbmRpbmdzIGZvciBTYW1zdW5nIFNv
QyBPbmVOQU5EIGNvbnRyb2xsZXIKPiA+ICsKPiA+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ID4g
KyAtIGNvbXBhdGlibGUgOiB2YWx1ZSBzaG91bGQgYmUgZWl0aGVyIG9mIHRoZSBmb2xsb3dpbmcu
Cj4gPiArICAgKGEpICJzYW1zdW5nLHMzYzY0MDAtb25lbmFuZCIgLSBmb3Igb25lbmFuZCBjb250
cm9sbGVyIGNvbXBhdGlibGUgd2l0aAo+ID4gKyAgICAgICBTM0M2NDAwIFNvQywKPiA+ICsgICAo
YikgInNhbXN1bmcsczNjNjQxMC1vbmVuYW5kIiAtIGZvciBvbmVuYW5kIGNvbnRyb2xsZXIgY29t
cGF0aWJsZSB3aXRoCj4gPiArICAgICAgIFMzQzY0MTAgU29DLAo+ID4gKyAgIChjKSAic2Ftc3Vu
ZyxzNXBjMTAwLW9uZW5hbmQiIC0gZm9yIG9uZW5hbmQgY29udHJvbGxlciBjb21wYXRpYmxlIHdp
dGgKPiA+ICsgICAgICAgUzVQQzEwMCBTb0MsCj4gPiArICAgKGQpICJzYW1zdW5nLHM1cHYyMTAt
b25lbmFuZCIgLSBmb3Igb25lbmFuZCBjb250cm9sbGVyIGNvbXBhdGlibGUgd2l0aAo+ID4gKyAg
ICAgICBTNVBDMTEwL1M1UFYyMTAgU29Dcy4KPiA+ICsKPiA+ICsgLSByZWcgOiB0d28gbWVtb3J5
IG1hcHBlZCByZWdpc3RlciByZWdpb25zOgo+ID4gKyAgIC0gZmlyc3QgZW50cnk6IGNvbnRyb2wg
cmVnaXN0ZXJzLgo+ID4gKyAgIC0gc2Vjb25kIGFuZCBuZXh0IGVudHJpZXM6IG1lbW9yeSB3aW5k
b3dzIG9mIHBhcnRpY3VsYXIgT25lTkFORCBjaGlwczsKPiA+ICsgICAgIGZvciB2YXJpYW50cyBh
KSwgYikgYW5kIGMpIG9ubHkgb25lIGlzIGFsbG93ZWQsIGluIGNhc2Ugb2YgZCkgdXAgdG8KPiA+
ICsgICAgIHR3byBjaGlwcyBjYW4gYmUgc3VwcG9ydGVkLgo+ID4gKwo+ID4gKyAtIGludGVycnVw
dC1wYXJlbnQgOiBwaGFuZGxlIG9mIGludGVycnVwdCBjb250cm9sbGVyIHRvIHdoaWNoIHRoZSBP
bmVOQU5ECj4gPiArICAgY29udHJvbGxlciBpcyB3aXJlZCwKPgo+IFRoaXMgaXMgaW1wbGllZCBh
bmQgY2FuIGJlIHJlbW92ZWQuCj4KPiA+ICsgLSBpbnRlcnJ1cHRzIDogc3BlY2lmaWVyIG9mIGlu
dGVycnVwdCBzaWduYWwgdG8gd2hpY2ggdGhlIE9uZU5BTkQgY29udHJvbGxlcgo+ID4gKyAgIGlz
IHdpcmVkOyBzaG91bGQgY29udGFpbiBqdXN0IG9uZSBlbnRyeS4KPiA+ICsgLSBjbG9jay1uYW1l
cyA6IHNob3VsZCBjb250YWluIHR3byBlbnRyaWVzOgo+ID4gKyAgIC0gImJ1cyIgLSBidXMgY2xv
Y2sgb2YgdGhlIGNvbnRyb2xsZXIsCj4gPiArICAgLSAib25lbmFuZCIgLSBjbG9jayBzdXBwbGll
ZCB0byBPbmVOQU5EIG1lbW9yeS4KPgo+IElmIHRoZSBjbG9jayBqdXN0IGdvZXMgdG8gdGhlIE9u
ZU5BTkQgZGV2aWNlLCB0aGVuIGl0IHNob3VsZCBiZSBpbiB0aGUKPiBuYW5kIGRldmljZSBub2Rl
IHJhdGhlciB0aGFuIHRoZSBjb250cm9sbGVyIG5vZGUuCj4KCihUcnlpbmcgaGFyZCB0byByZWNh
bGwgdGhlIGRldGFpbHMgYWJvdXQgdGhpcyBoYXJkd2FyZS4pCkFGQUlSIHRoZSBjbG9jayBnb2Vz
IHRvIHRoZSBjb250cm9sbGVyIGFuZCB0aGUgY29udHJvbGxlciB0aGVuIGZlZWRzCml0IHRvIHRo
ZSBtZW1vcnkgY2hpcHMuCgpBbHNvIEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGhhdmUgYW55IG5h
bmQgZGV2aWNlIG5vZGVzIGhlcmUsIHNpbmNlCnRoZSBtZW1vcnkgaXRzZWxmIGlzIG9ubHkgZXhw
b3NlZCB2aWEgdGhlIGNvbnRyb2xsZXIsIHdoaWNoIG9mZmVycwp2YXJpb3VzIHF1ZXJpZXMgdG8g
cHJvYmUgdGhlIG1lbW9yeSBhdCBydW50aW1lLCBzbyB0aGVyZSBpcyBubyBuZWVkIHRvCmRlc2Ny
aWJlIGl0IGluIERULgoKPiA+ICsgLSBjbG9jazogc2hvdWxkIGNvbnRhaW4gbGlzdCBvZiBwaGFu
ZGxlcyBhbmQgc3BlY2lmaWVycyBmb3IgYWxsIGNsb2NrcyBsaXN0ZWQKPiA+ICsgICBpbiBjbG9j
ay1uYW1lcyBwcm9wZXJ0eS4KPiA+ICsgLSAjYWRkcmVzcy1jZWxscyA6IG11c3QgYmUgMSwKPiA+
ICsgLSAjc2l6ZS1jZWxscyA6IG11c3QgYmUgMS4KPgo+IFRoaXMgaW1wbGllcyBzb21lIGNoaWxk
IG5vZGVzLiBXaGF0IGFyZSB0aGUgY2hpbGQgbm9kZXM/Cj4KCkkgY2FuJ3QgcmVjYWxsIHRoZSBy
ZWFzb24gZm9yIHRoaXMgdW5mb3J0dW5hdGVseS4KCkJlc3QgcmVnYXJkcywKVG9tYXN6CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
