Return-Path: <SRS0=YHiu=MV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C2F2C4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jul 2021 17:13:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C053560F21
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jul 2021 17:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C053560F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G4BeTOZkJiakJaF/mwOalvEL3C07wxpheT6jhLloC8A=; b=FU+EhQM0aHd8zz
	MZKFN/hom44EbDqESRt8a8g8iUIeNsV2au6QsHya57wQZi37vS1Bvi0kRfqc6YfJq1Dj0yxLkbUzT
	DXG6w9LiWBKrTxzwqJjm6iNWNfGPYGWyucIspmWEbykht2EiSaNgQoNuw2KBd6YgUocZs+M+FpCdJ
	l9/pWe8+Ujy1SfNWC9pFi2f7WXMYPZvyirQcj7TDpoBoA5FaxOy0+BrhQcIQ/yCt3Yrhq6pPNVfx2
	T7zrpvWAyLkoYQZ5GXWdGCO0SxB4o69v+Nsz8nzSd6sIKwapcdQ5X6uGhI9QM+yuSfKlfES6j0puZ
	pNvHj6hBmsKzZVzukNxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m99aQ-005GgC-Ri; Thu, 29 Jul 2021 17:12:46 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m99ZY-005GCm-92
 for linux-mtd@lists.infradead.org; Thu, 29 Jul 2021 17:11:53 +0000
Received: by mail-ed1-x52a.google.com with SMTP id b7so9211710edu.3
 for <linux-mtd@lists.infradead.org>; Thu, 29 Jul 2021 10:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7tiye3BP8+eAcI9Ua4+M/nbZ9rLFrkFbWFrBumIaS3k=;
 b=jnQzJO8sksNbCAaYpocc6iVuTNjQe4LOxEXA9e6MbHgwF1T+0wDhULbKB+n6uwG92Z
 i7ETciQurvwcg/RC1ie/FcIjkoVO+nSu2eESwbrQUWVFg98qdz17RytgNe36zA81/pS8
 yYsWYLtTXt/xpr+O179oFNKkLgnq4NaVJPWrrIcYK97DfUJlOBRhmGsd9OZpRmg8f+tS
 3xPimxAi8xYUQYMPjHvc2SxMZmhZPPKvCbXH6dvAdzTDI36YYYa2K6Vw+20EXYexPZck
 CxRhCV637h2ramddrX200aXEf6hFnHtNsjRU1x7dNVv2e9vduJMO1dZ10NpPPTj+LUm8
 gu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7tiye3BP8+eAcI9Ua4+M/nbZ9rLFrkFbWFrBumIaS3k=;
 b=JRlQyvFK6wYIiCT0jVgmrH2T7hf6dHYmjNaUmpsLmMfCE327L3UiI4P4t12CUrDeal
 jamdK59A1avXOHIxr1pWQW4SoxRAwQoLOAlgTHIP1YMvYy86GDUh6NQaKfzjqGWM+mBu
 K/K0hRjlQfRfrOc1vTYEDwzWhYVj3Rm/pmYUmem6CnB77ydKNaTvNwGHM/xgEkcdakQT
 VkcuOEd79VUyPnqQ+bLn0uE1oHCuxS1IJHIVHik833nz8/DXttXgheA5efX447525/2r
 //H2HXKusCOEfecE1EPsEJUMT1+f06Zqgn9mMn/BpXHLDt1FDTdZvfi5pgE5AfnWZa91
 YiOg==
X-Gm-Message-State: AOAM531gQTP7antme4YtcVga9b86UvYjJPR3hIbrLUDFvJVlnMKBNt11
 91GfZu4RRXuYY/b/z0kozE3uHLl/D285fHB33DM=
X-Google-Smtp-Source: ABdhPJwgSE2otSPTvBYc+j0oKM7zrw81iIsLjHzZEDcxHmknvloadG02SDKv5NWVGH6KBOGAEif3p+3tkjqdpx+yudk=
X-Received: by 2002:a05:6402:514e:: with SMTP id
 n14mr7359602edd.129.1627578710016; 
 Thu, 29 Jul 2021 10:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLjzyG_2wGDYmwgeoQuuQ7cykJ11THf8jMrOFXZ7vXheJQ@mail.gmail.com>
 <CAOuPNLh_KY4NaVWSEV2JPp8fx0iy8E1MU8GHT-w7-hMXrvSaeA@mail.gmail.com>
 <1556211076.48404.1626763215205.JavaMail.zimbra@nod.at>
 <CAOuPNLhti3tocN-_D7Q0QaAx5acHpb3AQyWaUKgQPNW3XWu58g@mail.gmail.com>
 <2132615832.4458.1626900868118.JavaMail.zimbra@nod.at>
 <CAOuPNLhCMT7QTF+QadJyGDFNshH9VjEAzWStRpe8itw7HXve=A@mail.gmail.com>
 <CAFLxGvywv29u6DJZrJxnJJmUDSQ4xpbT0u5LNKY1uGKyQom+WA@mail.gmail.com>
 <CAAEAJfCY+X-G=7Oe9NqrJ4yQZ29DBA78jOFAX44GD0g6=s7qhg@mail.gmail.com>
 <1668790824.35266.1627559144878.JavaMail.zimbra@nod.at>
 <CAAEAJfDDtGcUquyP7Jn0Urttt4kSfAQbJ_qPQ90ROtWLavW9EA@mail.gmail.com>
In-Reply-To: <CAAEAJfDDtGcUquyP7Jn0Urttt4kSfAQbJ_qPQ90ROtWLavW9EA@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Thu, 29 Jul 2021 22:41:38 +0530
Message-ID: <CAOuPNLj+DSigRY_AgHQnGKCK-Vm4ykQBR8UfnTi2UObORTcBFg@mail.gmail.com>
Subject: Re: MTD: How to get actual image size from MTD partition
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Richard Weinberger <richard@nod.at>,
 Kernelnewbies <kernelnewbies@kernelnewbies.org>, 
 Greg KH <greg@kroah.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, Sean Nyekjaer <sean@geanix.com>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_101152_351658_B4D95A98 
X-CRM114-Status: GOOD (  29.99  )
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

T24gVGh1LCAyOSBKdWwgMjAyMSBhdCAxNzozMywgRXplcXVpZWwgR2FyY2lhCjxlemVxdWllbEB2
YW5ndWFyZGlhc3VyLmNvbS5hcj4gd3JvdGU6Cj4KPiBPbiBUaHUsIDI5IEp1bCAyMDIxIGF0IDA4
OjQ1LCBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PiB3cm90ZToKPiA+Cj4gPiBF
emVxdWllbCwKPiA+Cj4gPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gPiA+IFtz
bmlwXQo+ID4gPgo+ID4gPiBPdWNoLCBzbyBzdXJwcmlzZWQgdGhhdCBhZnRlciBhbGwgdGhlc2Ug
eWVhcnMgc29tZW9uZSBpcyBkb2luZyBzcXVhc2hmcy9tdGRibG9jawo+ID4gPiBpbnN0ZWFkIG9m
IHVzaW5nIHViaWJsb2NrIDotKQo+ID4gPgo+ID4gPiBDYW4gd2UgcGF0Y2ggZWl0aGVyIEtjb25m
aWcgb3IgYWRkIHNvbWUgd2Fybl9vbmNlIG9uIG10ZGJsb2NrCj4gPiA+IHVzYWdlLCBzdWdnZXN0
aW5nIHRvIHVzZSB1YmlibG9jayBpbnN0ZWFkPwo+ID4KPiA+IGEgaGludCBpbiBLY29uZmlnIG1h
a2VzIElNSE8gc2Vuc2UuIERvIHlvdSB3YW50IHRvIHNlbmQgYSBwYXRjaD8KPiA+IEEgd2Fybmlu
ZyBpcyB0b28gbXVjaCBzaW5jZSBvbiBzb21lIHRpbnkgZW1iZWRkZWQgc3lzdGVtIHdpdGggTk9S
IGZsYXNoIG10ZGJsb2NrIGlzIHN0aWxsCj4gPiBhIGdvb2QgY2hvaWNlLgo+ID4gdWJpYmxvY2sg
aXMgbW9zdGx5IHVzZWZ1bCBmb3IgTkFORCBmbGFzaC4KPiA+Cj4gPiA+IEkgcmVtZW1iZXIgdGhl
cmUgd2FzIHN0aWxsIHNvbWUgdXNlIGNhc2UocykgZm9yIG10ZGJsb2NrIGJ1dCBJIGNhbid0IHJl
bWVtYmVyCj4gPiA+IG5vdyB3aGF0IHdhcyBpdCwgcGVyaGFwcyB3ZSBzaG91bGQgZG9jdW1lbnQg
dGhlIGV4cGVjdGF0aW9ucz8KPiA+ID4gKElzIHRoYXQgZm9yIEpGRlMyIHRvIG1vdW50PykKPiA+
Cj4gPiBhIGxvbmcgdGltZSBhZ28gbW91bnQgZGlkbid0IGFjY2VwdCBjaGFyYWN0ZXIgZGV2aWNl
cywgc28geW91IGhhZCB0byBwYXNzIG10ZGJsb2NrWCB0byBtb3VudAo+ID4gSkZGUzIuCj4gPiBU
aGlzIGxpbWl0YXRpb24gaXMgZ29uZS4KPiA+Cj4KPiBPSywgbGV0IG1lIHRyeSB0byBjb29rIGEg
cGF0Y2ggZm9yIHlvdS4KPgoKRGVhciBFemUgYW5kIFJpY2hhcmQsCgpGaXJzdCBvZiBhbGwsIHRo
YW5rIHlvdSBzbyBtdWNoIGZvciBhbGwgeW91ciByZXBsaWVzIHNvIGZhci4KU29ycnksIEkgaGF2
ZSBsaW1pdGVkIGtub3dsZWRnZSBhYm91dCBOQU5ELCBNVEQsIFVCSSBsYXllcnMsIGJ1dCBteQpj
dXJyZW50IHdvcmsgaW52b2x2ZXMgYWxsIHRoZXNlIHNvIEkgYW0gaGVyZS4KQnV0IEkgd2lsbCBz
dXJlbHkgc2hhcmUgdGhpcyBpbmZvcm1hdGlvbiB0byBvdXIgaW50ZXJuYWwgdGVhbSBhYm91dAp1
c2luZyB1YmlibG9jayBpbnN0ZWFkIG9mIG10ZGJsb2NrLgoKSG93ZXZlciwgSSBzdGlsbCBmYWls
IHRvIHVuZGVyc3RhbmQgdGhlIHByb2JsZW0gYW5kIGNvbnNlcXVlbmNlcyBvZgp1c2luZyBtdGRi
bG9jayBmb3Igcm9vdGZzIGluc3RlYWQgb2YgdWJpYmxvY2suCkxhc3QgdGltZSwgZm9yIG15IHNx
dWFzaGZzIHRlc3QsIHdoZW4gSSB0cmllZCB0byByZXBsYWNlIHRoZSBjb21tYW5kCmxpbmUgd2l0
aCB1YmlibG9jaywgSSBjb3VsZCBub3Qgc2VlIGFueSBkaWZmZXJlbmNlLgpIb3cgdG8gdmlzaWJs
eSBzZWUgdGhlIGRpZmZlcmVuY2Ugc28gdGhhdCBJIGNhbiBlYXNpbHkgdW5kZXJzdGFuZCBhbmQK
ZXhwbGFpbiB0aGUgZGlmZmVyZW5jZSBpbnRlcm5hbGx5PwpPciwgaXMgdGhlcmUgYSBkb2N1bWVu
dCBhdmFpbGFibGUgc29tZXdoZXJlIHRvIGhpZ2hsaWdodCB0aGUKZGlmZmVyZW5jZSBiZXR3ZWVu
IHRoZSB0d28/CgpCVFcsIHdlIGhhdmUgZmV3IHJhdyBuYW5kIHBhcnRpdGlvbnMgYW5kIGZldyB1
Ymkgdm9sdW1lcyBbaW5jbHVkaW5nCnJvb3RmcyhzcXVhc2hmcyksIGRhdGEodWJpZnMsIHJ3KV0K
U28sIEkgZ3Vlc3Mgd2Ugc2hvdWxkIHVzZSB1YmlibG9jayBmb3IgYWxsIHViaSB2b2x1bWVzPwoK
UmVnYXJkaW5nIEtjb25maWcsIEkgaGF2ZSBmZXcgb3BpbmlvbnMuClllcywgYWRkaW5nIG1vcmUg
ZGVzY3JpcHRpb24gaW4gS2NvbmZpZyBpcyBhIGdvb2QgY2hvaWNlLgpCdXQgSSBzZWUgdGhhdCBt
b3N0IG9mIHRoZSB0aW1lIHRoZXNlIGtlcm5lbCBjb25maWcgb3B0aW9ucyByZW1haW5zCihhcyBk
ZWZhdWx0KSBhbmQgcGxhdGZvcm0gZGV2ZWxvcGVycyBuZXZlciBjYXJlcyBhYm91dCB0aGUKZGVz
Y3JpcHRpb24uClNvLCBob3cgdG8gYmV0dGVyIGNyZWF0ZSBhd2FyZW5lc3MgYW1vbmcgdGhlbSwg
bm90IHRvIG1ha2UgdGhlc2UgbWlzdGFrZXM/Ck9uZSBvcHRpb24gaXMgdG8gY2FwdHVyZSB0aGVz
ZSBkZXRhaWxzIGFzIHBhcnQgb2YgS2VybmVsIGRvY3VtZW50YXRpb24uClJpZ2h0IG5vdyB3aGVu
IEkgc2VhcmNoIEkgY291bGQgbm90IGZpbmQgYW55dGhpbmcuCkFub3RoZXIgb3B0aW9uIGlzIHRv
IGFkZCBhIGZldyAoY3JpdGljYWwpIHdhcm5pbmdzIGluIGtlcm5lbCBib290dXAKbG9ncyB0byBn
aXZlIHNvbWUgaGludCB0byB0aGUgZGV2ZWxvcGVyIHRoYXQgdGhlcmUgaXMgcHJvYmFibHkKc29t
ZXRoaW5nIHdyb25nLgpUaGlzIHdpbGwgZGlyZWN0bHkgYmUgdmlzaWJsZSB0byBhbGwgYW5kIHNv
bWUgZGV2ZWxvcGVycyB3aWxsIG5vdCBsaWtlCnRvIGlnbm9yZSBpdC4KT3IsIG1heWJlIGFkZGlu
ZyBib3RoIG9wdGlvbnMgaXMgYWxzbyBnb29kLgoKClRoYW5rcywKUGludHUKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
