Return-Path: <SRS0=79Kh=NN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28E6C4338F
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Aug 2021 14:22:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5944F6120D
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Aug 2021 14:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5944F6120D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=28Ay8t5CoNtIEoNjHK5rT3Y59QR2/HB+/qUXOHASSkI=; b=IKud566JrYvgjK
	CRs9mxIi0/vDCrnrmAOyVENKro3WS/V8DvShERyVpm7riSvGBMvDVD3s4nP9nsVTjrWbohB9foUSN
	NMQhonlsKXFDwubFZL/5f0fggMdZsdFG+H1/iW8uYHkTvolxiBrtloefbT8UoyydtQQ26WPAfWtSs
	SN+7Pxp6Wf7sgfUANJpgNTc9DmbrChtc/F+ASfFwWRL+a/PBcHvUnLP00HtGjgn7PcHcYD1w3Z6NW
	Va5NXGPdLNS1cVsgxNgV3HGzpG/AKvCVuHa/NkDJNb+K0pGrVU8Lak41pq3pMkB6W4MgljJ7Bygow
	ut41ij/rm5YkVrLdiWIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHoLs-00EDeE-Ur; Sun, 22 Aug 2021 14:21:33 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHoLn-00EDdV-Sk
 for linux-mtd@lists.infradead.org; Sun, 22 Aug 2021 14:21:31 +0000
Received: by mail-ed1-x52e.google.com with SMTP id s3so9633382edd.11
 for <linux-mtd@lists.infradead.org>; Sun, 22 Aug 2021 07:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=J4ZN/SXLkaHtgaR5XMNgO5PtUr/lZWOqM0+2vN5G3FE=;
 b=DKAzZ8Q4mXjXOBqaMdNNISaFGKc9lQXjGeecFK1OFEAGNv2u4kbda/p/vKDS42UX6h
 KCXnwavPMs6+8oSSt9oJoXkxaP9Q5UkTSr7FiLunnGQmvE+ZnSd68uG/V5VaRYLxKilv
 sgqkfYGdvvmKvjugUd17wtvv/GWx3EW+MjQU7pkg9mto22HFkW814EuquaKH3vCu+wZO
 s0wasYNMAQAX6EvNlLuWjb7KZQ2WpdC1Pz0wN8qQ+3SGgtMlZRJSTD9So4RWGK/AIZ+v
 7xm5ED3BN1nuzyFckLpNfhulcdYXepu3YnnuqDVFjagvD+9mH0T6TEdLq/6Cd8op2Ng7
 +qmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J4ZN/SXLkaHtgaR5XMNgO5PtUr/lZWOqM0+2vN5G3FE=;
 b=UZZLh2o1+Su0WQ7QZwDPvlRuTOniArUfgfNE63mCgbsLViLmr53bxniZyU1MtgnU31
 tn6eQL/vwqzs5ng2z/rWjJ6hjJNh7JvZJKUdrsDZMDvMGGNR2Njpd6eCJux5qJI3t0E2
 dtEkNoN3WjLoNZVBBJB0w+/0z+gHrQj4+8Bk/Rrch5rmRkZSn5aPwg9zq7ZRcrtgB6wH
 HiWOs1p3NO4tP4li/pfUolWbN3vnf+MJVnIitYvWtrgj3mK1l+ly0LvNLrc3EgtT9gTi
 RIv1CIcg67TIz4nio9ON4EvHIPLCu2NDCA8vF9Yn03TKBvSSNI64yZxx9AsLQNv+S46F
 wN+g==
X-Gm-Message-State: AOAM53216FfMeZ3zc9HVgalQ86bBp00uB7HL4Zbu0pt6ULg+rS6H+jxC
 OiDAXLDM2rgk7vY2WqW2WY0mDQ7CBfv3Ro4pHS7Q4g==
X-Google-Smtp-Source: ABdhPJyMJP+G+zDtU3cQrzH4Rz/vW+DE8h+ZLTS8Oh06SyfmGu1gILfLx/I1pNO4KYHoUUGvd0DJPnSytYxVcS+uRfA=
X-Received: by 2002:aa7:dcd1:: with SMTP id w17mr31920855edu.322.1629642083843; 
 Sun, 22 Aug 2021 07:21:23 -0700 (PDT)
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
 <CAOuPNLj+DSigRY_AgHQnGKCK-Vm4ykQBR8UfnTi2UObORTcBFg@mail.gmail.com>
 <CAOuPNLgfJGzp-RJBjydFDL1ZAvOd7=-MgXhnsb2eb_xFSLC66w@mail.gmail.com>
In-Reply-To: <CAOuPNLgfJGzp-RJBjydFDL1ZAvOd7=-MgXhnsb2eb_xFSLC66w@mail.gmail.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 22 Aug 2021 11:21:12 -0300
Message-ID: <CAAEAJfBuut7VSbrrz6CxOC+Cke36eGGv8VUvfdbfLwvSBxOAAA@mail.gmail.com>
Subject: Re: MTD: How to get actual image size from MTD partition
To: Pintu Agarwal <pintu.ping@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 Kernelnewbies <kernelnewbies@kernelnewbies.org>, 
 Greg KH <greg@kroah.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, Sean Nyekjaer <sean@geanix.com>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_072128_095211_EB755B22 
X-CRM114-Status: GOOD (  31.91  )
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

SGkgUGludHUsCgpPbiBGcmksIDIwIEF1ZyAyMDIxIGF0IDE1OjI1LCBQaW50dSBBZ2Fyd2FsIDxw
aW50dS5waW5nQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIDI5IEp1bCAyMDIxIGF0IDIy
OjQxLCBQaW50dSBBZ2Fyd2FsIDxwaW50dS5waW5nQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
T24gVGh1LCAyOSBKdWwgMjAyMSBhdCAxNzozMywgRXplcXVpZWwgR2FyY2lhCj4gPiA8ZXplcXVp
ZWxAdmFuZ3VhcmRpYXN1ci5jb20uYXI+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBUaHUsIDI5IEp1
bCAyMDIxIGF0IDA4OjQ1LCBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PiB3cm90
ZToKPiA+ID4gPgo+ID4gPiA+IEV6ZXF1aWVsLAo+ID4gPiA+Cj4gPiA+ID4gLS0tLS0gVXJzcHLD
vG5nbGljaGUgTWFpbCAtLS0tLQo+ID4gPiA+ID4gW3NuaXBdCj4gPiA+ID4gPgo+ID4gPiA+ID4g
T3VjaCwgc28gc3VycHJpc2VkIHRoYXQgYWZ0ZXIgYWxsIHRoZXNlIHllYXJzIHNvbWVvbmUgaXMg
ZG9pbmcgc3F1YXNoZnMvbXRkYmxvY2sKPiA+ID4gPiA+IGluc3RlYWQgb2YgdXNpbmcgdWJpYmxv
Y2sgOi0pCj4gPiA+ID4gPgo+ID4gPiA+ID4gQ2FuIHdlIHBhdGNoIGVpdGhlciBLY29uZmlnIG9y
IGFkZCBzb21lIHdhcm5fb25jZSBvbiBtdGRibG9jawo+ID4gPiA+ID4gdXNhZ2UsIHN1Z2dlc3Rp
bmcgdG8gdXNlIHViaWJsb2NrIGluc3RlYWQ/Cj4gPiA+ID4KPiA+ID4gPiBhIGhpbnQgaW4gS2Nv
bmZpZyBtYWtlcyBJTUhPIHNlbnNlLiBEbyB5b3Ugd2FudCB0byBzZW5kIGEgcGF0Y2g/Cj4gPiA+
ID4gQSB3YXJuaW5nIGlzIHRvbyBtdWNoIHNpbmNlIG9uIHNvbWUgdGlueSBlbWJlZGRlZCBzeXN0
ZW0gd2l0aCBOT1IgZmxhc2ggbXRkYmxvY2sgaXMgc3RpbGwKPiA+ID4gPiBhIGdvb2QgY2hvaWNl
Lgo+ID4gPiA+IHViaWJsb2NrIGlzIG1vc3RseSB1c2VmdWwgZm9yIE5BTkQgZmxhc2guCj4gPiA+
ID4KPiA+ID4gPiA+IEkgcmVtZW1iZXIgdGhlcmUgd2FzIHN0aWxsIHNvbWUgdXNlIGNhc2Uocykg
Zm9yIG10ZGJsb2NrIGJ1dCBJIGNhbid0IHJlbWVtYmVyCj4gPiA+ID4gPiBub3cgd2hhdCB3YXMg
aXQsIHBlcmhhcHMgd2Ugc2hvdWxkIGRvY3VtZW50IHRoZSBleHBlY3RhdGlvbnM/Cj4gPiA+ID4g
PiAoSXMgdGhhdCBmb3IgSkZGUzIgdG8gbW91bnQ/KQo+ID4gPiA+Cj4gPiA+ID4gYSBsb25nIHRp
bWUgYWdvIG1vdW50IGRpZG4ndCBhY2NlcHQgY2hhcmFjdGVyIGRldmljZXMsIHNvIHlvdSBoYWQg
dG8gcGFzcyBtdGRibG9ja1ggdG8gbW91bnQKPiA+ID4gPiBKRkZTMi4KPiA+ID4gPiBUaGlzIGxp
bWl0YXRpb24gaXMgZ29uZS4KPiA+ID4gPgo+Cj4gSGksCj4KPiBKdXN0IGEgZnVydGhlciBmb2xs
b3ctdXAgb24gdGhpcyBkaXNjdXNzaW9uLgo+IFdoZXRoZXIgdG8gdXNlIC9kZXYvbXRkYmxvY2sg
b3IgL2Rldi91YmlibG9jayBmb3Igcm9vdGZzIChzcXVhc2hmcykKPiBtb3VudGluZyBkdXJpbmcg
Ym9vdC4KPgo+IEFzIHN1Z2dlc3RlZCBoZXJlOgo+IEluc3RlYWQgb2YgdXNpbmcgdGhpcyBpbiBr
ZXJuZWwgY29tbWFuZCBsaW5lOgo+IFsgICAgMC4wMDAwMDBdIEtlcm5lbCBjb21tYW5kIGxpbmU6
IC4uLiByb290ZnN0eXBlPXNxdWFzaGZzCj4gcm9vdD0vZGV2L210ZGJsb2NrNDQgdWJpLm10ZD00
MCwwLDMwIC4uLgo+Cj4gSSB1c2VkIHRoaXM6Cj4gWyAgICAwLjAwMDAwMF0gS2VybmVsIGNvbW1h
bmQgbGluZTogLi4uIHJvb3Rmc3R5cGU9c3F1YXNoZnMKPiB1YmkubXRkPTQwLDAsMzAgdWJpLmJs
b2NrPTAsMCByb290PS9kZXYvdWJpYmxvY2swXzAgLi4uCj4KPiBUaGUgZGV2aWNlIGlzIGJvb3Rp
bmcgZmluZSB3aXRoIHViaWJsb2NrIGFzIHdlbGwuCj4gQnV0LCBwZXIgc2F5LCBJIGNvdWxkIG5v
dCBmaW5kIGFueSB2aXNpYmxlIGRpZmZlcmVuY2UuCj4gSSBqdXN0IG9ic2VydmVkIGEgc2xpZ2h0
IGltcHJvdmVtZW50IGluIGJvb3QgdGltZSwgYnV0IEkgbmVlZCB0bwo+IGRvdWJsZS1jaGVjayBv
biB0aGlzLCB3aXRoIGZldyBtb3JlIHJlYm9vdCBjeWNsZXMuCj4KClRoYXQncyBhIHZlcnkgZ29v
ZCB0aGluZywgaXQgbWVhbnMgd2Ugb2ZmZXJlZCB5b3UgYSBzbW9vdGggdHJhbnNpdGlvbiA6LSkK
Cj4gQXBhcnQgZnJvbSB0aGlzIHdoYXQgYXJlIHRoZSBvdGhlciB2aXNpYmxlIGJlbmVmaXRzIG9m
IHVzaW5nIHViaWJsb2NrCj4gd2hpY2ggY2FuIGJlIGV4cGxhaW5lZCB0byBiZSBtYW5hZ2VtZW50
IG9yIGludGVybmFsIHRlYW0gPwo+IEkgY291bGQgbm90IGZpbmQgYW55IGRvY3VtZW50YXRpb24g
ZXhwbGFpbmluZyB0aGUgZGlmZmVyZW5jZSwgZXhjZXB0IHRoaXMgb25lOgo+IGh0dHA6Ly93d3cu
bGludXgtbXRkLmluZnJhZGVhZC5vcmcvZG9jL3ViaS5odG1sI0xfdWJpYmxvY2sKPgoKSSdtIG5v
dCBhIGZsYXNoIGV4cGVydCBoZXJlLiBJbiBhbnkgY2FzZSwgeW91IGFyZSBleHBlY3RlZCB0byBk
byB5b3VyIG93bgpyZXNlYXJjaCAoanVzdCBsaWtlIHdlIGFsbCBkaWQpLCBkZXNpZ24geW91ciBv
d24gc2V0dXAgbWF0Y2hpbmcKeW91ciB1c2UtY2FzZSwgZGVzaWduIHRlc3RzIGJhc2VkIG9uIHlv
dXIgd29ya2xvYWQgYW5kIGFjY2VzcyBwYXR0ZXJucywgZXRjLgoKVGhlcmUgYXJlIHByZXNlbnRh
dGlvbnMgb24gWW91VHViZSB3aGljaCBkaXNjdXNzIFVCSSwgVUJJRlMgYW5kCk5BTkQtYmFzZWQg
ZGVzaWducyBvbiBMaW51eCwgYXMgd2VsbCBhcyB3aGl0ZSBwYXBlcnMgZGlzY3Vzc2luZwpOQU5E
IGZsYXNoZXMgY2hhbGxlbmdlcy4KCkhhdmluZyBzYWlkIHRoYXQuLi4KCldoZW4geW91IHVzZSBV
QkkgYmxvY2ssIHlvdSBhcmUgYWNjZXNzaW5nIHRoZSBmbGFzaCB2aWEgdGhlIFVCSSBsYXllci4K
VGhpcyBpcyBJTU8gdGhlIGJlc3Qgd2F5IHRvIGRlc2lnbiB5b3VyIHN5c3RlbSwgc2luY2UgVUJJ
IGFkZHJlc3Nlcwp3ZWFyIGxldmVsaW5nIGFuZCBiYWQgYmxvY2tzLCBhbmQgb2ZmZXJzIGF0b21p
YyB1cGRhdGVzLgoKSW4gb3RoZXIgd29yZHMsIElNTyBpdCdzIGJlc3QgdG8gZXhwb3NlIHRoZSBO
QU5EIHRocm91Z2ggVUJJCmZvciBib3RoIHJlYWQtb25seSBhbmQgcmVhZC13cml0ZSBhY2Nlc3Ms
IHVzaW5nIGEgc2luZ2xlIFVCSSBkZXZpY2UsCmFuZCB0aGVuIGNyZWF0aW5nIFVCSSB2b2x1bWVz
IGFzIG5lZWRlZC4gVGhpcyB3aWxsIGFsbG93IFVCSQp0byBzcHJlYWQgd2VhciBsZXZlbGluZyBh
Y3Jvc3MgdGhlIHdob2xlIGRldmljZSwgd2hpY2ggaXMgZXhwZWN0ZWQKdG8gaW5jcmVhc2UgdGhl
IGZsYXNoIGxpZmV0aW1lLgoKRm9yIGluc3RhbmNlLCBqdXN0IGFzIHNvbWUgc2lsbHkgZXhhbXBs
ZSwgeW91IGNvdWxkIGhhdmUgc29tZXRoaW5nIGxpa2UgdGhpczoKCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IFJvb3RGUyBTcXVhc2hGUyAgfAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCBVQkkgYmxvY2sgICAgICAgIHwgVUJJRlMgVXNlciBSLVcgYXJlYQotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KS2VybmVsIEEgfCBLZXJuZWwgQiB8IFJvb3RGUyBBIHwgUm9vdEZTIEIgICAgICAg
ICB8IFVzZXIKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFVCSVgKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC9k
ZXYvbXRkWAoKVGhpcyBzZXR1cCBhbGxvd3Mgc2FmZSBrZXJuZWwgYW5kIHJvb3RmcyB1cGdyYWRp
bmcuIFRoZSBSb290RlMgaXMgcmVhZC1vbmx5CnZpYSBTcXVhc2hGUyBhbmQgdGhlcmUncyBhIHJl
YWQtd3JpdGUgdXNlciBhcmVhLiBVQkkgaXMgc3VwcG9ydGluZyBhbGwKdGhlIHZvbHVtZXMsIGhh
bmRsaW5nIGJhZCBibG9ja3MgYW5kIHdlYXIgbGV2ZWxpbmcuCgo+IENhbiBzb21lb25lIGFsc28g
cG9pbnQgbWUgdG8gdGhlIHJlc3BlY3RpdmUgZHJpdmVyIGNvZGUgaW4gY2FzZSBvZgo+IHVzaW5n
IC9kZXYvbXRkYmxvY2sgYW5kIC9kZXYvdWJpYmxvY2sgPwo+IEFwYXJ0IGZyb20gdGhlb3J5IEkg
YWxzbyB3YW50IHRvIGNoZWNrIHRoZSBpbXBhY3QgYXQgdGhlIGNvZGUgbGV2ZWwuLgo+CgpZb3Ug
Y2FuIGZpbmQgYWxsIHRoZSBVQkkgY29kZSBpbiBkcml2ZXJzL210ZC91Ymkgb2YgY291cnNlLiBU
aGUgZGlmZmVyZW5jZXMKYmV0d2VlbiBtdGRibG9jayBhbmQgdWJpYmxvY2sgYXJlIGh1Z2U6IG9u
ZSBnb2VzIGRpcmVjdGx5IHRvIHRoZSBmbGFzaCwKYW5kIHRoZSBvdGhlciB1c2VzIFVCSS4KCkdv
b2QgbHVjayEKRXplcXVpZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
