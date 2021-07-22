Return-Path: <SRS0=Hn5r=MO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30957C6377D
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jul 2021 12:28:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA6026128A
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jul 2021 12:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA6026128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ex/E8XSeDywM82ZVew2si4r3a+4T2jb8BL8sCFlZE4M=; b=hsnOwahV20JaYw
	fs7zKvbMPWfyTPhcOOAoX8y4SQ7Ad08usB/D3wr59NyYpJakzWbsf5s2YkjYe1yyD+t4fHCyAnidS
	Rgf8lftHQh+hyNNu4x97kGC9SHax6hQrd41ZZRcsE0EXOvqM+lPfd6eVZX+gCIPSoKpA7sXX2Tf6p
	mlz3aWcLR1wYb9TG2Nl9FblN5IJW36YMR0O7GOATei1HtbXKo3iP2sYigmJTLWztkRK6Zxo5zxoG+
	asUhVrGlpfJLZTEmYVyzON+mTFU46cgvwfh5WQ1c9UgqUnRAHZ4/8jAJpghGnFEHvZGA0V8k10uGO
	ECTYR8CkIm2zSFTnTvyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Xna-001UL7-4r; Thu, 22 Jul 2021 12:27:34 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Wb9-001Jsj-Qw
 for linux-mtd@lists.infradead.org; Thu, 22 Jul 2021 11:10:46 +0000
Received: by mail-ed1-x536.google.com with SMTP id ec55so6312082edb.1
 for <linux-mtd@lists.infradead.org>; Thu, 22 Jul 2021 04:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bB4VtmJFxxMk/xBdcOQ1aAgpkQfyBX7MX2ec1/1+iic=;
 b=kS8N55z/Mvvyqlvp1E5NKwCjT4j99fk1wbSreQcjnCFZZsU7Bh5VqyE1wmM9X18znC
 TMJnNpDiSyrcNnMiYG6Kggc97uaIFNHZlxaQIqMp2bHz4UUgGi7YGg9G18IEDxlH+ACC
 wMhw7fE6DLlLZob+k8ZvVGvbTCyVUv5vErhRggVkfD9adlzkHza1sZUkUOFCuD0omtlr
 hJT/jtngpCE+rIMfgocltP39U68xb+xt0KpHmHMbH8JLUQH/yNYRUqWStTVXeAhx/lvZ
 ZmYS8iGhs9Df5x4d+InHU6Hxqgmqc9WgkjnFkCNXmtpznjNP2/eYi5l0mEIm+YgSUzrt
 YkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bB4VtmJFxxMk/xBdcOQ1aAgpkQfyBX7MX2ec1/1+iic=;
 b=lBF+zJLqdmq2zfl9u2WJgyt/g1qreM5Lplkc7tmpsWgga7BJsgmveRSVe9Ai26Pd9W
 6x+DzDRw7nAyzfzVFmyQV+E1Y8WQ9h816B3wu/Y10VjO5E4Aa5ozXd+bHsrA/7sN9qhe
 tBlWvcVcApNHBgEqB+SHGGZ0yo/Vuf837PbNLMuOJExyFx+t0xe/WAF8R1GVDcnYPB7c
 5k1IMW3gyEAKIWueScRdRb3UPFiUuRMHTwzcczQQArxz2EhdafkXofETD45xrRLRvIx0
 DsMlIv1PyB62DYyVHXUzGIo15HqujJgk4tudIfWAdoiphRWOjGFe1UmTN4w8FykfBLNy
 SCwg==
X-Gm-Message-State: AOAM532O+ctNgoLSdovZO41Wc9hBLEWxxO+222hP81W9J3Z1F5msxwu1
 k8JOnr9rpavBlDjyCQot/ltVJBTI1jOfEW6vwIA=
X-Google-Smtp-Source: ABdhPJxfnXX/pOEUxaSfYeYzP/ePzj4psI/hct4tmT+zwV5PstjA001Zgw8aamUPhp7zuqIJ4TTRbyX/Qbj5vJ+xi6Y=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr52960170edv.230.1626952237710; 
 Thu, 22 Jul 2021 04:10:37 -0700 (PDT)
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
In-Reply-To: <2132615832.4458.1626900868118.JavaMail.zimbra@nod.at>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Thu, 22 Jul 2021 16:40:26 +0530
Message-ID: <CAOuPNLhCMT7QTF+QadJyGDFNshH9VjEAzWStRpe8itw7HXve=A@mail.gmail.com>
Subject: Re: MTD: How to get actual image size from MTD partition
To: Richard Weinberger <richard@nod.at>
Cc: Greg KH <greg@kroah.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>, 
 Sean Nyekjaer <sean@geanix.com>,
 Kernelnewbies <kernelnewbies@kernelnewbies.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_041039_957030_CC4FF125 
X-CRM114-Status: GOOD (  29.52  )
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

T24gVGh1LCAyMiBKdWwgMjAyMSBhdCAwMjoyNCwgUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJk
QG5vZC5hdD4gd3JvdGU6Cj4KPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gPj4g
QnV0IGxldCBtZSBhZHZlcnRpc2UgdWJpYmxvY2sgYSBzZWNvbmQgdGltZS4KPiA+IFNvcnJ5LCBJ
IGNvdWxkIG5vdCB1bmRlcnN0YW5kIGFib3V0IHRoZSB1YmlibG9jayByZXF1ZXN0LiBJcyBpdAo+
ID4gcG9zc2libGUgdG8gZWxhYm9yYXRlIGxpdHRsZSBtb3JlID8KPiA+IFdlIGFyZSBhbHJlYWR5
IHVzaW5nIHNxdWFzaGZzIG9uIHRvcCBvZiBvdXIgVUJJIHZvbHVtZXMgKGluY2x1ZGluZwo+ID4g
cm9vdGZzIG1vdW50aW5nKS4KPiA+IFRoaXMgaXMgdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUgd2Ug
cGFzczoKPiA+IHJvb3Rmc3R5cGU9c3F1YXNoZnMgcm9vdD0vZGV2L210ZGJsb2NrNDQgdWJpLm10
ZD00MCwwLDMwCj4gPiBBbmQgQ09ORklHX01URF9VQklfQkxPQ0s9eSBpcyBhbHJlYWR5IGVuYWJs
ZWQgaW4gb3VyIGtlcm5lbC4KPiA+IERvIHdlIG5lZWQgdG8gZG8gc29tZXRoaW5nIGRpZmZlcmVu
dCBmb3IgdWJpYmxvY2sgPwo+Cj4gRnJvbSB0aGF0IGNvbW1hbmQgbGluZSBJIHVuZGVyc3RhbmQg
dGhhdCB5b3UgYXJlICpub3QqIHVzaW5nIHNxdWFzaGZzIG9uIHRvcCBvZiBVQkkuCj4gWW91IHVz
ZSBtdGRibG9jay4gdWJpYmxvY2sgaXMgYSBtZWNoYW5pc20gdG8gdHVybiBhbiBVQkkgdm9sdW1l
IGludG8gYSByZWFkLW9ubHkKPiBibG9jayBkZXZpY2UuCj4gU2VlOiBodHRwOi8vd3d3LmxpbnV4
LW10ZC5pbmZyYWRlYWQub3JnL2RvYy91YmkuaHRtbCNMX3ViaWJsb2NrCj4KT2theSwgeW91IG1l
YW4gdG8gc2F5LCB3ZSBzaG91bGQgdXNlIHRoaXMgPwp1YmkubXRkPTUgdWJpLmJsb2NrPTAsMCBy
b290PS9kZXYvdWJpYmxvY2swXzAKSW5zdGVhZCBvZiB0aGlzOgpyb290PS9kZXYvbXRkYmxvY2s0
NCB1YmkubXRkPTQwLDAsMzAKCk9rYXkgSSB3aWxsIGRpc2N1c3MgdGhpcyBpbnRlcm5hbGx5IGFu
ZCBjaGVjay4uCgo+ID4+IElmIHlvdSBwbGFjZSB5b3VyIHNxdWFzaGZzIG9uIGEgVUJJIHN0YXRp
YyB2b2x1bWUsIFVCSSBrbm93cyB0aGUgZXhhY3QgbGVuZ3RoCj4gPj4gYW5kIHlvdSBjYW4gY2hl
Y2tzdW0gaXQKPiA+PiBtb3JlIGVhc2lseS4KPiA+IFllcywgd2UgdXNlIHNxdWFzaGZzIG9uIFVC
SSB2b2x1bWVzLCBidXQgb3VyIHZvbHVtZSB0eXBlIGlzIHN0aWxsIGR5bmFtaWMuCj4gPiBBbHNv
LCB5b3Ugc2FpZCwgVUJJIGtub3dzIHRoZSBleGFjdCBsZW5ndGgsIHlvdSBtZWFuIHRoZSB3aG9s
ZSBpbWFnZSBsZW5ndGggPwo+ID4gSG93IGNhbiB3ZSBnZXQgdGhpcyBsZW5ndGggYXQgcnVudGlt
ZSA/Cj4KPiBZb3UgbmVlZCBhIHN0YXRpYyB2b2x1bWUgZm9yIHRoYXQuIElmIHlvdSB1cGRhdGUg
YSBzdGF0aWMgdm9sdW1lIHRoZSBsZW5ndGggaXMKPiBrbm93biBieSBVQkkuCj4KVGhhbmsgeW91
IHNvIG11Y2ggZm9yIHlvdXIgcmVwbHkhCgpTb3JyeSwgSSBjb3VsZCBub3QgZ2V0IHRoaXMgcGFy
dC4gSG93IHN0YXRpYyB2b2x1bWUgY2FuIGdpdmUgaW1hZ2UgbGVuID8KWW91IG1lYW4gdGhlcmUg
aXMgc29tZSBpbnRlcmZhY2UgYXZhaWxhYmxlIGluIGtlcm5lbCB0byBnZXQgYWN0dWFsIGltYWdl
IGxlbiA/Cgo+ID4gQWxzbywgaG93IGNhbiB3ZSBnZXQgdGhlIGNoZWNrc3VtIG9mIHRoZSBlbnRp
cmUgVUJJIHZvbHVtZSBjb250ZW50Cj4gPiAoaWdub3JpbmcgdGhlIGVyYXNlZC9lbXB0eS9iYWQg
YmxvY2sgY29udGVudCkgPwo+Cj4gSnVzdCByZWFkIGZyb20gdGhlIHZvbHVtZS4gL2Rldi91YmlY
X1kuCj4KSSB0aGluayB0aGlzIGFsc28gd2lsbCBnaXZlIHRoZSBlbnRpcmUgdm9sdW1lIHNpemUs
IGJ1dCB3ZSBzdGlsbCBkb24ndCBrbm93IGhvdwptYW55IHBhZ2VzIGhhdmUgcmVhbCBkYXRhID8K
Rm9yIGV4YW1wbGU6ClN1cHBvc2UsIG15IHJhdyBwYXJ0aXRpb24vdm9sdW1lIGlzIG9mIHNpemUg
MTBNQgpCdXQgbXkgYWN0dWFsIGRhdGEgaW5zaWRlIGl0IGlzIG9mIHNpemUgfjNNQiAobWF5IGJl
IHNwbGl0IGFjcm9zcz8pClRoZW4sIGhvdyBjYW4gd2UgZ2V0IHRoZSBhY3R1YWwgc2l6ZSBvZiB0
aGUgZGF0YSBjb250ZW50ID8KWW91IG1lYW4gdG8gc2F5OiAvZGV2L3ViaVhfWSBzaG91bGQgY29u
dGFpbiBvbmx5IGRhdGEgYmxvY2tzID8KCj4gPiBPciwgeW91IG1lYW4gdG8gc2F5LCB0aGUgd2hv
bGUgY2hlY2tzdW0gbG9naWMgaXMgaW4tYnVpbHQgaW5zaWRlIHRoZQo+ID4gVUJJIGxheWVyIGFu
ZCB1c2VycyBkb24ndCBuZWVkIHRvIHdvcnJ5IGFib3V0IHRoZSBpbnRlZ3JpdHkgYXQgYWxsID8K
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
