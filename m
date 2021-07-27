Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6F1C432BE
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 21:17:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCD1A60BD3
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 21:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BCD1A60BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NrGTzigB7I1V26e5k2GC1N/IC1QUvyoTVyVwBEUV7EM=; b=dsYygiW07OKaJ4
	924JfeqTqIpQ90IoJT5ZJGCsitebcqyVaAFZa2Na/f5521O3ejYVxMVRw3c4/rLxB7NIYKWUhtXsc
	ubi8AdtqKJ+YVjNHXlnKkY6VOEHttRovBnT78dApWSHUFN5jZDGoWthJkQqEe6WQeyTCUFv6QqW3M
	oNV2POjQm8bsEbLPPq9SFKc7VJyHsk2ZEU9HXeuhjq4kqgCtMWNko4Igu29ECzFJDsrGqr/UM04Fm
	PagunU3IwknkdMj1rUA9UeQaHORo6GXnckGP15kCo1N80VYYHUOs896BoTKTiMxBzoqcvU8ZDf7D/
	me9BdlOzQq/WnNAK8jeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8URM-00GP29-Ha; Tue, 27 Jul 2021 21:16:40 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8URK-00GP1l-6q
 for linux-mtd@lists.infradead.org; Tue, 27 Jul 2021 21:16:39 +0000
Received: by mail-qt1-x834.google.com with SMTP id b1so10695267qtx.0
 for <linux-mtd@lists.infradead.org>; Tue, 27 Jul 2021 14:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Zei6F6+BbgKDPk/JT5TPStQmPkRCi2WEQwwoBdhRoIY=;
 b=solrd46rzkgzUZMr6uvDwyWIlp4cDe57cqaw9HivmA5r/T6sxH/Qz8iwM3KuA1IWcu
 NrS2JtbmSJwbWfN7H+hfxIq7Aiqc5W2w/tD48fbMdtk2Ecei4CQTVB5dmIeCv7E8ASEk
 7J2hWl6tuBwIjKsQFYJiNum2Q4+RN9W3mQYmgNRxlUKfBTm4IwcUtrhVIn3ThOiyRp1g
 H8DPVWCeOSkT1YX0RNMs9bNiha/N995LI/GSN4QYcJdQuoD+9baFuZ5odVN0eRsYb6I/
 3S8biW6jIpuJPKAVFnNrgfS7yt6MMqywdC5Om1cZWBAOjCV8u4KIGVySVD963Ax4gDX1
 KVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Zei6F6+BbgKDPk/JT5TPStQmPkRCi2WEQwwoBdhRoIY=;
 b=Xr5uwCXrrskhEytx0bhdpb7iJMN3H+ixPkGNIvkFqxOoT1d6a8dzTxoVNmm+JG+ltx
 0LmXxI1kQx9PYimOo4xbjMWiKJ0Iu17AxJs8GgllQGdfaB+YQR05NgiygiOzbPLkVRRd
 f0SwT8y7G78vUi9NRhoB0B+REkVgvdaxpKvfV2wcGiS5XV+XCfKtlwItw6mc08AmiZ15
 XF4op/+wIMz1iDURVlODT/hc/ddYd+70izqHLaEF9DkevJ904PpzNG/SHD5mSkGwVpQJ
 OlwzHKNmx/CpXZCNY3WQAjFxFZsnHES04hZfdu2Ibmq/UkkDV2MACqL+08BmEcNJ1kQy
 8EGw==
X-Gm-Message-State: AOAM5304OSTTR9Xs9Nx8tpZpPTK68zye52R4HeoNZKw1SKVz+kQlV85N
 85cDuFRvwFTLNAhaReeN+SCXgSsdGF2ACVP7c/o=
X-Google-Smtp-Source: ABdhPJz7eMTUfDZGZR8ARw+sscj4utcJttleb4w7Knuq362uAZGy2HzIqMJqIOrLcZYkNzHnckOpwxYHoaKXGHEODos=
X-Received: by 2002:ac8:6708:: with SMTP id e8mr20622179qtp.166.1627420597040; 
 Tue, 27 Jul 2021 14:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLjzyG_2wGDYmwgeoQuuQ7cykJ11THf8jMrOFXZ7vXheJQ@mail.gmail.com>
 <YPGojf7hX//Wn5su@kroah.com>
 <568938486.33366.1626452816917.JavaMail.zimbra@nod.at>
 <CAOuPNLj1YC7gjuhyvunqnB_4JveGRyHcL9hcqKFSNKmfxVSWRA@mail.gmail.com>
 <1458549943.44607.1626686894648.JavaMail.zimbra@nod.at>
 <CAOuPNLh_KY4NaVWSEV2JPp8fx0iy8E1MU8GHT-w7-hMXrvSaeA@mail.gmail.com>
 <1556211076.48404.1626763215205.JavaMail.zimbra@nod.at>
 <CAOuPNLhti3tocN-_D7Q0QaAx5acHpb3AQyWaUKgQPNW3XWu58g@mail.gmail.com>
 <2132615832.4458.1626900868118.JavaMail.zimbra@nod.at>
 <CAOuPNLhCMT7QTF+QadJyGDFNshH9VjEAzWStRpe8itw7HXve=A@mail.gmail.com>
In-Reply-To: <CAOuPNLhCMT7QTF+QadJyGDFNshH9VjEAzWStRpe8itw7HXve=A@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 27 Jul 2021 23:16:25 +0200
Message-ID: <CAFLxGvywv29u6DJZrJxnJJmUDSQ4xpbT0u5LNKY1uGKyQom+WA@mail.gmail.com>
Subject: Re: MTD: How to get actual image size from MTD partition
To: Pintu Agarwal <pintu.ping@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 Kernelnewbies <kernelnewbies@kernelnewbies.org>, 
 Greg KH <greg@kroah.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, Sean Nyekjaer <sean@geanix.com>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_141638_298517_4851E5EA 
X-CRM114-Status: GOOD (  29.73  )
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

T24gVGh1LCBKdWwgMjIsIDIwMjEgYXQgMToxMSBQTSBQaW50dSBBZ2Fyd2FsIDxwaW50dS5waW5n
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIDIyIEp1bCAyMDIxIGF0IDAyOjI0LCBSaWNo
YXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PiB3cm90ZToKPiA+Cj4gPiAtLS0tLSBVcnNw
csO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gPiA+PiBCdXQgbGV0IG1lIGFkdmVydGlzZSB1YmlibG9j
ayBhIHNlY29uZCB0aW1lLgo+ID4gPiBTb3JyeSwgSSBjb3VsZCBub3QgdW5kZXJzdGFuZCBhYm91
dCB0aGUgdWJpYmxvY2sgcmVxdWVzdC4gSXMgaXQKPiA+ID4gcG9zc2libGUgdG8gZWxhYm9yYXRl
IGxpdHRsZSBtb3JlID8KPiA+ID4gV2UgYXJlIGFscmVhZHkgdXNpbmcgc3F1YXNoZnMgb24gdG9w
IG9mIG91ciBVQkkgdm9sdW1lcyAoaW5jbHVkaW5nCj4gPiA+IHJvb3RmcyBtb3VudGluZykuCj4g
PiA+IFRoaXMgaXMgdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUgd2UgcGFzczoKPiA+ID4gcm9vdGZz
dHlwZT1zcXVhc2hmcyByb290PS9kZXYvbXRkYmxvY2s0NCB1YmkubXRkPTQwLDAsMzAKPiA+ID4g
QW5kIENPTkZJR19NVERfVUJJX0JMT0NLPXkgaXMgYWxyZWFkeSBlbmFibGVkIGluIG91ciBrZXJu
ZWwuCj4gPiA+IERvIHdlIG5lZWQgdG8gZG8gc29tZXRoaW5nIGRpZmZlcmVudCBmb3IgdWJpYmxv
Y2sgPwo+ID4KPiA+IEZyb20gdGhhdCBjb21tYW5kIGxpbmUgSSB1bmRlcnN0YW5kIHRoYXQgeW91
IGFyZSAqbm90KiB1c2luZyBzcXVhc2hmcyBvbiB0b3Agb2YgVUJJLgo+ID4gWW91IHVzZSBtdGRi
bG9jay4gdWJpYmxvY2sgaXMgYSBtZWNoYW5pc20gdG8gdHVybiBhbiBVQkkgdm9sdW1lIGludG8g
YSByZWFkLW9ubHkKPiA+IGJsb2NrIGRldmljZS4KPiA+IFNlZTogaHR0cDovL3d3dy5saW51eC1t
dGQuaW5mcmFkZWFkLm9yZy9kb2MvdWJpLmh0bWwjTF91YmlibG9jawo+ID4KPiBPa2F5LCB5b3Ug
bWVhbiB0byBzYXksIHdlIHNob3VsZCB1c2UgdGhpcyA/Cj4gdWJpLm10ZD01IHViaS5ibG9jaz0w
LDAgcm9vdD0vZGV2L3ViaWJsb2NrMF8wCj4gSW5zdGVhZCBvZiB0aGlzOgo+IHJvb3Q9L2Rldi9t
dGRibG9jazQ0IHViaS5tdGQ9NDAsMCwzMAoKWWVzLiBCdXQgaXQgaXMgbm90IG9ubHkgYWJvdXQg
YSBkaWZmZXJlbnQgY29tbWFuZCBsaW5lLiBJdCBpcyBhCmRpZmZlcmVudCBjb25jZXB0LgpZb3Ug
dXNlIGEgZW11bGF0ZWQgYmxvY2sgZGV2aWNlIG9uIHRvcCBvZiBVQkksIGFuZCBub3QgZGlyZWN0
bHkgb24gdG9wCm9mIGFuIE1URCBwYXJ0LgoKPiBTb3JyeSwgSSBjb3VsZCBub3QgZ2V0IHRoaXMg
cGFydC4gSG93IHN0YXRpYyB2b2x1bWUgY2FuIGdpdmUgaW1hZ2UgbGVuID8KPiBZb3UgbWVhbiB0
aGVyZSBpcyBzb21lIGludGVyZmFjZSBhdmFpbGFibGUgaW4ga2VybmVsIHRvIGdldCBhY3R1YWwg
aW1hZ2UgbGVuID8KCnVzZSB0aGUgdWJpbmZvIHRvb2wuIFN0YXRpYyB2b2x1bWVzIGtub3cgZXhh
Y3RseSBob3cgbXVjaCB0aGV5IGFyZSBmaWxsZWQuCgo+ID4gPiBBbHNvLCBob3cgY2FuIHdlIGdl
dCB0aGUgY2hlY2tzdW0gb2YgdGhlIGVudGlyZSBVQkkgdm9sdW1lIGNvbnRlbnQKPiA+ID4gKGln
bm9yaW5nIHRoZSBlcmFzZWQvZW1wdHkvYmFkIGJsb2NrIGNvbnRlbnQpID8KPiA+Cj4gPiBKdXN0
IHJlYWQgZnJvbSB0aGUgdm9sdW1lLiAvZGV2L3ViaVhfWS4KPiA+Cj4gSSB0aGluayB0aGlzIGFs
c28gd2lsbCBnaXZlIHRoZSBlbnRpcmUgdm9sdW1lIHNpemUsIGJ1dCB3ZSBzdGlsbCBkb24ndCBr
bm93IGhvdwo+IG1hbnkgcGFnZXMgaGF2ZSByZWFsIGRhdGEgPwoKInViaWluZm8gL2Rldi91YmlY
X1kiIHdpbGwgdGVsbCB5b3UgaWYgdGhlIHZvbHVtZSBpcyBvZiB0eXBlIHN0YXRpYy4KCj4gRm9y
IGV4YW1wbGU6Cj4gU3VwcG9zZSwgbXkgcmF3IHBhcnRpdGlvbi92b2x1bWUgaXMgb2Ygc2l6ZSAx
ME1CCj4gQnV0IG15IGFjdHVhbCBkYXRhIGluc2lkZSBpdCBpcyBvZiBzaXplIH4zTUIgKG1heSBi
ZSBzcGxpdCBhY3Jvc3M/KQo+IFRoZW4sIGhvdyBjYW4gd2UgZ2V0IHRoZSBhY3R1YWwgc2l6ZSBv
ZiB0aGUgZGF0YSBjb250ZW50ID8KClNlZSBhYm92ZS4KCj4gWW91IG1lYW4gdG8gc2F5OiAvZGV2
L3ViaVhfWSBzaG91bGQgY29udGFpbiBvbmx5IGRhdGEgYmxvY2tzID8KClllcy4gQW4gVUJJIHZv
bHVtZSBjb250YWlucyBvbmx5ICJ1c2VyIGRhdGEiLgoKLS0gClRoYW5rcywKLy9yaWNoYXJkCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
