Return-Path: <SRS0=qhal=MM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E96C07E95
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jul 2021 06:19:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2F0F60FE4
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jul 2021 06:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2F0F60FE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1KNf0UpugjmBnXI1dmOowRjHh9lwKes2yi53oQDdloM=; b=J9Fqj/d4i0/ChF
	LQhGm2myvH6dEV0JYz1kRwyyhjJA2n5taPtGlz9vLamRffDny6EZwKjVmj0YiyxQO0iYJx4hHLM+2
	WFJ0A7lzWcnS+S52xfEdWLl3AR+6/G/RVkK++szk69B5kQsrivSek4XZkyPGqCRaPGTT0C24ESt5Z
	k4//YkXCQzhVoBbZN933PCjIcmZVlI96e0+RQL26s+1cNFSNI27N4/DwaLbdT6tFkepshfK2/hpp2
	1lYOE7cJ0iiZr8V13BlUjlAE3T5eGezWknnaSGjz1146l8m6LqNpsOwFohCgLy3fbFymRejZEuCL6
	cV6aDnV14LTNt/Uige8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5j4x-00BycH-U2; Tue, 20 Jul 2021 06:18:07 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5j4t-00BybX-1T
 for linux-mtd@lists.infradead.org; Tue, 20 Jul 2021 06:18:04 +0000
Received: by mail-ed1-x529.google.com with SMTP id w14so27050315edc.8
 for <linux-mtd@lists.infradead.org>; Mon, 19 Jul 2021 23:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=i0kMgSuHZ4kPt4sP1uRhzPOM7Gd+u7oji/d01Xfy6CI=;
 b=JN4hdVZX4kVjpEa2ZUVU46PqVLYNHzXlDz6vh8HxpEVP4n6GlVPer5Vm0zzRm+Og7U
 znr42WF/93H00R0SFA/Qmi50tfGItf8ENCn+XUZ+BeRdtA2JQ2bPplCqJtVvkpMrWlnI
 79d8dzSKR3IwP/cbOvmjbFjrRHaTN6IbpmrkBxJYTuEJ7nstVhhJSSl1tPG4LTXtEdNV
 DeTpaKZuahpiFUsuLQOHmRJqq7gMn1vlXB7X05G6bdEpvaS0+VFTmODa8NCj2foTHHVj
 sBdBYyYZuYz1GvR1nI4P+5U5+PVPRLP0j9OZbN2OhhSDgb6K7tUcqzy4KWPg4qvnqdrr
 QcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=i0kMgSuHZ4kPt4sP1uRhzPOM7Gd+u7oji/d01Xfy6CI=;
 b=XHqYvLCXO6qXh4P9xndDFymi0Q7QkqMebEybVqT+ty8eisJhNhdur+oYeFTGaagl2K
 Zn3g/Hi8NsJiow+HGdZ8+kx+GSTng1Dw/0F87fIUbDf98P/gdpi0yJ5+kLgEi71n1LK2
 zticoPkn2FXM4f4lXYspYJEn66Y+oh3G9ynfOWU1tiZP+dk7VcDbnIiTwLApsMuGu7qM
 XUTMiz7RKE7pVRJOCP8cgEZm/0qmtMiuxKt9oxDSjkv7YLA2SXe0mrI/iTFsRyBbB9Ie
 7DYRCYXXB2ad2rDKS7+lzzwiUIqkpdcLE9ZRuFazh6x7x3ziinXflSFBtq4+NHz+Rq8+
 psOw==
X-Gm-Message-State: AOAM530SwT4LEI2C28PktKH+ttVPYG//h/eorQFMizdcx+vCRdyufi4b
 3cfttfajThXf+XZx4ebhDkA19hWXhRd1jzxiJ/s=
X-Google-Smtp-Source: ABdhPJy6k0BPgBjkY1GjQMzqFi44EyZ3OU0v6LZ8PrYAbhFp7ALdrGWVXIkwNCfOmdT6Uhq8PtDLdGyUso1rul1NT9k=
X-Received: by 2002:a05:6402:270d:: with SMTP id
 y13mr39156656edd.66.1626761881202; 
 Mon, 19 Jul 2021 23:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLjzyG_2wGDYmwgeoQuuQ7cykJ11THf8jMrOFXZ7vXheJQ@mail.gmail.com>
 <YPGojf7hX//Wn5su@kroah.com>
 <568938486.33366.1626452816917.JavaMail.zimbra@nod.at>
 <CAOuPNLj1YC7gjuhyvunqnB_4JveGRyHcL9hcqKFSNKmfxVSWRA@mail.gmail.com>
 <1458549943.44607.1626686894648.JavaMail.zimbra@nod.at>
In-Reply-To: <1458549943.44607.1626686894648.JavaMail.zimbra@nod.at>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Tue, 20 Jul 2021 11:47:49 +0530
Message-ID: <CAOuPNLh_KY4NaVWSEV2JPp8fx0iy8E1MU8GHT-w7-hMXrvSaeA@mail.gmail.com>
Subject: Re: MTD: How to get actual image size from MTD partition
To: Richard Weinberger <richard@nod.at>
Cc: Greg KH <greg@kroah.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>, 
 Sean Nyekjaer <sean@geanix.com>,
 Kernelnewbies <kernelnewbies@kernelnewbies.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_231803_127649_619C4CF3 
X-CRM114-Status: GOOD (  21.81  )
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

T24gTW9uLCAxOSBKdWwgMjAyMSBhdCAxNDo1OCwgUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJk
QG5vZC5hdD4gd3JvdGU6Cj4KPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gPiBW
b246ICJQaW50dSBBZ2Fyd2FsIiA8cGludHUucGluZ0BnbWFpbC5jb20+Cj4gPiBBbjogInJpY2hh
cmQiIDxyaWNoYXJkQG5vZC5hdD4KPiA+IENDOiAiR3JlZyBLSCIgPGdyZWdAa3JvYWguY29tPiwg
ImxpbnV4LWtlcm5lbCIgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+LCAibGludXgtbXRk
Igo+ID4gPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgImxpbnV4LWZzZGV2ZWwiIDxs
aW51eC1mc2RldmVsQHZnZXIua2VybmVsLm9yZz4sICJQaGlsbGlwIExvdWdoZXIiCj4gPiA8cGhp
bGxpcEBzcXVhc2hmcy5vcmcudWs+LCAiU2VhbiBOeWVramFlciIgPHNlYW5AZ2Vhbml4LmNvbT4s
ICJLZXJuZWxuZXdiaWVzIiA8a2VybmVsbmV3Ymllc0BrZXJuZWxuZXdiaWVzLm9yZz4KPiA+IEdl
c2VuZGV0OiBNb250YWcsIDE5LiBKdWxpIDIwMjEgMTE6MDk6NDYKPiA+IEJldHJlZmY6IFJlOiBN
VEQ6IEhvdyB0byBnZXQgYWN0dWFsIGltYWdlIHNpemUgZnJvbSBNVEQgcGFydGl0aW9uCj4KPiA+
IE9uIEZyaSwgMTYgSnVsIDIwMjEgYXQgMjE6NTYsIFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFy
ZEBub2QuYXQ+IHdyb3RlOgo+ID4KPiA+PiA+PiBNeSByZXF1aXJlbWVudDoKPiA+PiA+PiBUbyBm
aW5kIHRoZSBjaGVja3N1bSBvZiBhIHJlYWwgaW1hZ2UgaW4gcnVudGltZSB3aGljaCBpcyBmbGFz
aGVkIGluIGFuCj4gPj4gPj4gTVREIHBhcnRpdGlvbi4KPiA+PiA+Cj4gPj4gPiBUcnkgdXNpbmcg
dGhlIGRtLXZlcml0eSBtb2R1bGUgZm9yIGVuc3VyaW5nIHRoYXQgYSBibG9jayBkZXZpY2UgcmVh
bGx5Cj4gPj4gPiBpcyBwcm9wZXJseSBzaWduZWQgYmVmb3JlIG1vdW50aW5nIGl0LiAgVGhhdCdz
IHdoYXQgaXQgd2FzIGRlc2lnbmVkIGZvcgo+ID4+ID4gYW5kIGlzIGluZGVwZW5kZW50IG9mIHRo
ZSBibG9jayBkZXZpY2UgdHlwZS4KPiA+Pgo+ID4+IE1URHMgYXJlIG5vdCBibG9jayBkZXZpY2Vz
LiA6LSkKPiA+Pgo+ID4gSXMgaXQgcG9zc2libGUgdG8gdXNlIGRtLXZlcml0eSB3aXRoIHNxdWFz
aGZzID8KPiA+IFdlIGFyZSB1c2luZyBzcXVhc2hmcyBmb3Igb3VyIHJvb3RmcyB3aGljaCBpcyBh
biBNVEQgYmxvY2sgL2Rldi9tdGRibG9jazQ0Cj4KPiBXZWxsLCBpZiB5b3UgZW11bGF0ZSBhIGJs
b2NrIGRldmljZSB1c2luZyBtdGRibG9jaywgeW91IGNhbiB1c2UgZG0tdmVyaXR5IGFuZCBmcmll
bmRzLgo+IEFsc28gY29uc2lkZXIgdXNpbmcgdWJpYmxvY2suIEl0IG9mZmVycyBiZXR0ZXIgcGVy
Zm9ybWFuY2UgYW5kIHdlYXIgbGV2ZWxpbmcgc3VwcG9ydC4KPgpPa2F5IHRoYW5rIHlvdS4KV2Ug
aGF2ZSB0cmllZCBkbS12ZXJpdHkgd2l0aCBzcXVhc2hmcyAoZm9yIG91ciByb290ZnMpIGJ1dCB3
ZSBhcmUKZmFjaW5nIHNvbWUgbW91bnRpbmcgaXNzdWVzLgpbLi4uXQpbICAgIDQuNjk3NzU3XSBk
ZXZpY2UtbWFwcGVyOiBpbml0OiBhZGRpbmcgdGFyZ2V0ICcwIDk2MTYwIHZlcml0eSAxCi9kZXYv
bXRkYmxvY2szNCAvZGV2L210ZGJsb2NrMzkgNDA5NiA0MDk2IDEyMDIwIDggc2hhMjU2CmQ3Yjhh
N2QwYzAxYjlhZWM4ODg5MzA4NDEzMTNhODE2MDNhNTBhMmE3YmU0NDYzMWM0YzgxMzE5N2E1MGQ2
ODEKYWVlMDg3YTViZTNiOTgyOTc4YzkyM2Y1NjZhOTQ2MTM0OTZiNDE3ZjJhZjU5MjYzOWJjODBk
MTQxZTM0ZGZlNycKWyAgICA0LjcwNDc3MV0gZGV2aWNlLW1hcHBlcjogdmVyaXR5OiBzaGEyNTYg
dXNpbmcgaW1wbGVtZW50YXRpb24KInNoYTI1Ni1nZW5lcmljIgpbLi4uXQpbICAgIDQuNzI3MzY2
XSBkZXZpY2UtbWFwcGVyOiBpbml0OiBkbS0wIGlzIHJlYWR5ClsgICAgNC45MTI1NThdIFZGUzog
Q2Fubm90IG9wZW4gcm9vdCBkZXZpY2UgImRtLTAiIG9yCnVua25vd24tYmxvY2soMjUzLDApOiBl
cnJvciAtNQoKVGhlIHNhbWUgd29ya3Mgd2l0aCBleHQ0IGVtdWxhdGlvbi4KU28sIG5vdCBzdXJl
IGlmIHRoZXJlIGFyZSBhbnkgY2hhbmdlcyBtaXNzaW5nIHcuci50LiBzcXVhc2hmcyBvbiA0LjE0
IGtlcm5lbCA/CgpBbnl3YXlzLCBJIHdpbGwgY3JlYXRlIGEgc2VwYXJhdGUgdGhyZWFkIGZvciBk
bS12ZXJpdHkgaXNzdWUgYW5kIGtlZXAKdGhpcyB0aHJlYWQgc3RpbGwgb3BlbiBmb3IgVUJJIGlt
YWdlIHNpemUgaXNzdWUuCldlIG1heSB1c2UgZG0tdmVyaWZ5IGZvciByb290ZnMgZHVyaW5nIGJv
b3RpbmcsIGJ1dCBzdGlsbCB3ZSBuZWVkIHRvCnBlcmZvcm0gaW50ZWdyaXR5IGNoZWNrIGZvciBv
dGhlciBuYW5kIHBhcnRpdGlvbnMgYW5kIFVCSSB2b2x1bWVzLgoKU28sIGluc3RlYWQgb2YgY2Fs
Y3VsYXRpbmcgdGhlIGNoZWNrc3VtIGZvciB0aGUgZW50aXJlIHBhcnRpdGlvbiwgaXMKaXQgcG9z
c2libGUgdG8gcGVyZm9ybSBjaGVja3N1bSBvbmx5IGJhc2VkIG9uIHRoZSBpbWFnZSBzaXplID8K
UmlnaHQgbm93LCB3ZSBhcmUgc3RpbGwgZXhwbG9yaW5nIHdoYXQgYXJlIHRoZSBiZXN0IHBvc3Np
YmxlCm1lY2hhbmlzbXMgYXZhaWxhYmxlIGZvciB0aGlzLgoKVGhhbmtzLApQaW50dQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
