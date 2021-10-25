Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716FCC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 09:36:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4384160EB1
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 09:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4384160EB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5p0pgpjiek8pJst6R4LEF1QMPLv9082uaqbThRlrM+0=; b=0CFvez7qH4IOsQ
	dwlPgNRzfFc5p9b5qanuYTp2IuzbvAFNz2MzX3aCRVARzd2SOfcJodsn1wqq/BeNaXBggy5VCBVwO
	tG3jBZwAAu3DHpCJkDlwcvCedcZAGgoDC+HZ5fN1SU9Ehnw9IaugZ4Q3I95I8uggLs34tn+BINJ7T
	Ar6fD6NIbxvcZ6LC654jpnVXfJvlqCRD4ZDU9lWLSZlJy6EYbl+Uc0j/SUnEDDqX6T4vEwUT0tczv
	ElmHR0fpQQ9wfWmmjsnvTWn+5n0QVYV8EWjQ2BUwNLWTIb9T/zKLucJjOnLBPmsJv5Szoh4vdXrgE
	ZiO49XL7+Se3udiEdWwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mewOA-00Fxwi-Vs; Mon, 25 Oct 2021 09:35:31 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mewO6-00FxtW-06
 for linux-mtd@lists.infradead.org; Mon, 25 Oct 2021 09:35:27 +0000
Received: by mail-ua1-x92e.google.com with SMTP id p23so7945278uaa.6
 for <linux-mtd@lists.infradead.org>; Mon, 25 Oct 2021 02:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LB8BZYJIdwo1dkje94sBT8x1ZbPAWVxknyBv9ftdAu8=;
 b=iZ8Oy0bXvo+EXgZSYyrGGf1QSUeXyck7vVTvWIjpPFUQS2TlHYPjXl0hIsDBlJ13LY
 g57iZ8fF5DoJkPXPZcubpQe3FI+kU83rON4vyzNMFLdI0QebkR3Tq30brJ2XNL9StcqC
 cxhVNPwJ4wekBm+Ni5fuHdehX4FAwxEWQiCsIU6+mVTN24kP/hEuV+DiVOpCV+S0VHre
 DYeH9CvzlfbF4YTtQc7KB9hpLZRW8kQCdvy9Th09lLcSd7GWGY9ydBPnoZ3otmp34TKQ
 2hgFzNmBKZs8VXwqlAJw/yj6HlascjXW7seYy9GdQ8RFZxEiemnjDAzRsUQNE5xdbnXR
 8mnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LB8BZYJIdwo1dkje94sBT8x1ZbPAWVxknyBv9ftdAu8=;
 b=ILrRv4xUfMZ2c66PuGb2hQy8HvEazKZKVQ0AnTjBvBXAhIDxWZprLVbkf2w6TjVqtm
 nn7jSQQJp6LGSIU3MSDmNR6+yCPOfTK2l+KGdWov3C4MCd1fBOJ5tyK6CgGzPhSnAx/t
 eOtbTblU40KoVJbu+re9NBYNT/Jdaki7FFdFZcTR/aod3KJeG4myd2574hzHHwqOKsrU
 ft9o8mi/6g42Cq3dY/XaqREe42+fvxML+BOLXQ5nwepau7I5by2ANFNUTtIf6ut3N1DS
 mVAKtDjGrDWfxlhxtOY9/WrcWb6KLVmqGBjdCqk13dQXpvMcxzJ2vZhtUknVEj8mpi8N
 oBxA==
X-Gm-Message-State: AOAM531PUOI/i1nPVVmEP0g9ZMprVUi5y8U8/J4VIYS6awuG6mRmZ2J1
 K4Fxp4HsTyCxsSP+kt/iAxo9W/+KlWtrmRSWe5KN+nS9mqTkkw==
X-Google-Smtp-Source: ABdhPJysY2bq3I5q0n87R58oPDlapzWu5Xo66NIYCnm+B3/Ps0RxDhyTAVzLhloLiNTujSivhXYzwbny95aciuyETCY=
X-Received: by 2002:ab0:7044:: with SMTP id v4mr13651916ual.76.1635154523841; 
 Mon, 25 Oct 2021 02:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <CADBnMviweAwc1oFz2-4KtGBAQb3hii1ZkJpZDELXY_CASpd53w@mail.gmail.com>
 <1041553131.62488.1633978966122.JavaMail.zimbra@nod.at>
 <CADBnMvibQS+PZW-fJY2E+mVw4C48BuBF4PoB704L6PRfG4Absw@mail.gmail.com>
 <1040411488.65265.1634045778705.JavaMail.zimbra@nod.at>
 <CADBnMvidNZEiJfSTLe-rj+V0N=EtW8jTrYXzc2KRJKNS-zkCjg@mail.gmail.com>
 <CADBnMvhCmNQsYRVAveuf=Ri820bLyLdcrA71Nywh0mVL+X8Fng@mail.gmail.com>
 <CADBnMviZDXD4p6U4fPDsMFsY1OJYEcjkNGTXDRbbM0mKDVpaAQ@mail.gmail.com>
 <1035601262.21954.1634838266590.JavaMail.zimbra@nod.at>
In-Reply-To: <1035601262.21954.1634838266590.JavaMail.zimbra@nod.at>
From: Kristof Havasi <havasiefr@gmail.com>
Date: Mon, 25 Oct 2021 11:35:12 +0200
Message-ID: <CADBnMvidrikjUWU5TvM3+ifMXE9i=m-Huv34oCDBhprvLqCGQg@mail.gmail.com>
Subject: Re: UBIFS panic during brown-out
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_023526_099775_9F0630C0 
X-CRM114-Status: GOOD (  17.71  )
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

RGVhciBSaWNoYXJkLAoKT24gVGh1LCAyMSBPY3QgMjAyMSBhdCAxOTo0NCwgUmljaGFyZCBXZWlu
YmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4gd3JvdGU6Cj4KPiBLcmlzdG9mLAo+Cj4gLS0tLS0gVXJz
cHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+ID4gVm9uOiAiS3Jpc3RvZiBIYXZhc2kiIDxoYXZhc2ll
ZnJAZ21haWwuY29tPgo+ID4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+Cj4gPiBDQzog
ImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPgo+ID4gR2VzZW5kZXQ6
IERvbm5lcnN0YWcsIDIxLiBPa3RvYmVyIDIwMjEgMTc6MzM6MTUKPiA+IEJldHJlZmY6IFJlOiBV
QklGUyBwYW5pYyBkdXJpbmcgYnJvd24tb3V0Cj4KPiA+IERlYXIgUmljaGFyZCwKPiA+Cj4gPiBJ
IG5vdGljZWQgdGhhdCBJIGZvcmdvdCB0byBDYyBsaW51eC1tdGQgZnJvbSB0aGUgcHJldmlvdXMg
ZW1haWxzLgo+ID4KPiA+IExhdGVzdCB1cGRhdGU6IHdlIGNvdWxkIHJlcHJvZHVjZSB0aGUgYnVn
IHdpdGggYSB2NS4xMCBwb3J0Lgo+ID4gVGhlIHNhbWUgRVBFUk0gZXJyb3IgaXMgaGl0Lgo+ID4K
PiA+IEhhcHB5IHRvIGhlYXIgYW55IGhpbnRzIG9uIGhvdyBJIGNhbiBzdXBwb3J0IGluIGZpeGlu
ZyB0aGlzIGlzc3VlLgo+Cj4gc28gSSBmZWFyIHlvdSBmb3VuZCBhIGJ1ZyBpbiB0aGUgVUJJRlMg
YXV0aCBjb2RlLgo+IElzIGl0IHBvc3NpYmxlIHRvIHNoYXJlIHRoZSBmaWxlc3lzdGVtIGFuZCB0
aGV5IGtleW1hdGVyaWFsIHdpdGggbWU/CgpJIHVzZWQgb3VyIGJ1aWxkIHNlcnZlciB0byBnZW5l
cmF0ZSB0aGUgdGVzdCBpbWFnZXMsIHdoZXJlIHdlIHVzZSBvbmUtdGltZQp0aHJvdy1hd2F5IGtl
eXMvY2VydHMgZm9yIGVhY2ggYnVpbGQuIEFueXdheSwgSSBtYW5hZ2VkIHRvIHJldHJpZXZlCnRo
ZSBrZXkgbWF0ZXJpYWxzCmZvciB0aGUgZmFpbGluZyB2NS4xMC1iYXNlZCB0ZXN0LgoKV2UgaGF2
ZSB0aGUgZm9sbG93aW5nIGxheW91dCBvbiB0aGUgZmxhc2g6CjAwMDAgLSBbWFhYXSBwYXJ0aXRp
b24gZm9yIGJvb3RzdHJhcCAoYXQ5MSkKW1hYWF0tICAgICAgICAgICBwYXJ0aXRpb24gZm9yIFVC
SSBpbWFnZQoKd2hlcmUgdGhlIFVCSSBpbWFnZSBoYXM6Ci0gdm9sLTAgRFRCMCBbcm9dCi0gdm9s
LTEgRFRCMSBbcm9dCi0gdm9sLTIgS2VybmVsMCBbcm9dCi0gdm9sLTMgS2VybmVsMSBbcm9dCi0g
dm9sLTQgUm9vdEZTIFtkeW4sIGF1dG9yZXNpemVdCgpJIGRvbid0IGtub3cgaG93IHRvIGV4dHJh
Y3Qgb25seSB0aGUgcm9vdEZTIGZyb20gdGhlICJicmlja2VkIiBkZXZpY2UuCkJ1dCBJIGNvdWxk
IGR1bXAgdGhlIGZsYXNoIG9mIHRoYXQgZGV2aWNlIGFuZCBjcmVhdGUgYSBsaW5rIGZvciB5b3UK
d2l0aCB0aGF0IGFuZCB0aGUga2V5cy9jZXJ0cy4KV291bGQgdGhhdCBoZWxwPwoKPgo+IFRoYW5r
cywKPiAvL3JpY2hhcmQKCkJlc3QgUmVnYXJkcywKS3Jpc3TDs2YKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
