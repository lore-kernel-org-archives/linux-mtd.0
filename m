Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F1CE77173
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Dec 2024 17:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NuW6e2yaXhcotqPl77ljewIzuuq+H24iSf5YJG3VU8g=; b=hbHGzbB94HgZwQ
	4863n8f4Yqv0UCguhKFbHMpbhosYy4xX3kkj7uq4GDcUHGdq75k4g8fTUGQoN7bxlsX/XpCKe5EcY
	2o7s+hRNGbR2dpkmcKWNPkUGosniBBAPhnf/XBx8EhKjPX5OHUYAKeElXuk7DI1r6IiSPFNhMqA0E
	gpx4unyTPfpsLZ11rb7n5FezQI5i/9+x1FW1a2sZgHVP7eZMVZ+U8SOwwsoxaueVAi55it6JwOU+W
	VWjFri9OGUzAS8i7by9jRjAiP0ZqaNOiaN6Es3k9NBGmM9g6oFsSzBt2CZRfqV88qQ2Ox/Ifbjo1j
	wCwWSFNKuNzji6/it9Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKy6-00000005dVi-3nQv;
	Sun, 08 Dec 2024 17:21:18 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKy4-00000005dVM-19D6
	for linux-mtd@lists.infradead.org;
	Sun, 08 Dec 2024 17:21:17 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-85c4e74e2baso560714241.0
        for <linux-mtd@lists.infradead.org>; Sun, 08 Dec 2024 09:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733678475; x=1734283275; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1KyqoBFomxOl77+ZU6CgcKwfPXNaWogS1j6njglFyc=;
        b=j7CuzFt2L9xWEUmd9twGcFxe3MhNQqRVEZk0fv992tFVvuqVLwASebfdpt+rznAS6G
         +kFulvsv4I7e2oeGVNs14sPOPeG9guAjKpurwexgUa7zPtJXFXhKUWxrKqRw2q2Sj5U+
         hTGt1hwsyvExy7Doraok0xLgJ/NdgmY2i7cZ71Kg83aWPcdiJ/Ie2pPXrrCGCM8JUg2x
         +3UbFnqfdJDF49ubxz5O9vq68/shClTjMFn/igjWjkwIylNidPv/am40/9iEapLjz7bp
         6Lhnl24Ix6pmaA6RB7Sum9Kj1t53XxoDBnJFb1u07wv/wnJqeguGAw70r8T+IwVlT0jG
         hRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733678475; x=1734283275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1KyqoBFomxOl77+ZU6CgcKwfPXNaWogS1j6njglFyc=;
        b=mUTFaPQ1L9TVgAIIdS1JvV3qAlx4xnyvf7Mh9Wo0FAkaxM4G3YPll5Fy9QDP+nlawe
         iE+IWH40ZcpkScUwmry6eh2mhLQ5rlRKAjZKmYPtjbkRRVdrUFNhHoj9596HKYvRQ4x1
         5MZY1PwIi0HeoamTH7oR99T1YO1d3wpSdW+/XqOq2lnL2q6Rrwm91a95pJOdX7HHdZIt
         8rPrraVU11BRy3CtqhshxXZQsAJUODLXW+sOkPRYL660T6uKBXq/iPCl4GcIeIuF+E5B
         Ejb7C0dODvvKoYzVC9MZaj0Usq4oo3HYvBtifeZENSGhr48VUtR+RKQQHQGhhjiIpjlR
         Ftqw==
X-Forwarded-Encrypted: i=1; AJvYcCW9bQ7ruKZYjKApHGPCSCx9QLuQc+k87lP5x7wnl0/DVXbeuz7DOlAxEPJbDuCqGZR4RoGlOyQYQ34=@lists.infradead.org
X-Gm-Message-State: AOJu0YwQAgpFPFOW5hk/yIt1NQKv0DKv1T77/9fmTvNQRhQvktoLXDN8
	x+4pkVSqSBPafv4HklbGYca7mUMR3aW+lAqJgSJjaI3kmWlAWSb7R5WIAetyL79vXKLLYexQjTK
	7FXKRZdq083/QhLgno2oxvsAlZA0=
X-Gm-Gg: ASbGnctXaD8nkV3Ogun/8+E+ZMu83bOzOEfJj2n/YXHbguC6O2p2PNXgB2YDo88UeDc
	UdOjjKgNtmVHdqdBQqxByXSagVN8RG8M=
X-Google-Smtp-Source: AGHT+IENR3UDThiIkJ+SdvhzuoTwx351q+c6wziFhMmU0b7Us4aOGgMoAOxhZzKj+op8m8ZuFO7bymg3EaHJn4nQtH0=
X-Received: by 2002:a05:6122:4690:b0:518:773b:39f with SMTP id
 71dfb90a1353d-518773b0536mr874128e0c.4.1733678474919; Sun, 08 Dec 2024
 09:21:14 -0800 (PST)
MIME-Version: 1.0
References: <20241208085121.53415-1-dennis.lamerice@gmail.com>
In-Reply-To: <20241208085121.53415-1-dennis.lamerice@gmail.com>
From: Dennis Lam <dennis.lamerice@gmail.com>
Date: Sun, 8 Dec 2024 12:21:04 -0500
Message-ID: <CAGZfcdneGPsAwUZmC6Wv7BWSaQw2rkjDby9nhZFweYOgXvNDbw@mail.gmail.com>
Subject: Re: [[PATCH] MTD: fix slab-use-after-free due to dangling pointer in
 notifier chain] MTD: fix slab-use-after-free due to dangling pointer in
 notifier chain
To: richard@nod.at, chengzhihao1@huawei.com, miquel.raynal@bootlin.com, 
	vigneshr@ti.com
Cc: syzkaller-bugs@googlegroups.com, 
	syzbot+0988a383ae7c57b99dd9@syzkaller.appspotmail.com, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_092116_337146_177AAFE8 
X-CRM114-Status: GOOD (  18.18  )
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

T24gU3VuLCBEZWMgOCwgMjAyNCBhdCAzOjUx4oCvQU0gRGVubmlzIExhbSA8ZGVubmlzLmxhbWVy
aWNlQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBXaGVuIGF0dGFjaGluZyBNVERzLCBhIHJlYm9vdCBu
b3RpZmllciBpcyBhZGRlZCB0byB0aGUgYmxvY2tpbmcKPiBub3RpZmljYXRpb24gY2hhaW4uIEhv
d2V2ZXIsIHdoZW4gZGV0YWNoaW5nIGEgTVREIGFuZCBmcmVlaW5nIGl0cwo+IHJlbGF0ZWQgb2Jq
ZWN0cywgdGhlIG5vdGlmaWVyIGlzIG5ldmVyIHVucmVnaXN0ZXJlZCBmcm9tIHRoZQo+IG5vdGlm
aWNhdGlvbiBjaGFpbi4gVGh1cywgd2hlbiB0aGUgY2hhaW4gaXMgaXRlcmF0ZWQgdGhlcmUgaXMg
YQo+IHBvc3NpYmlsaXR5IG9mIGZpbmRpbmcgdGhlIGFkZHJlc3Mgb2YgdGhlIHJlYm9vdCBub3Rp
ZmllciB3aGljaCBoYXMKPiBhbHJlYWR5IGJlZW4gZnJlZWQsIHJlc3VsdGluZyBpbiBhIHNsYWIt
dXNlLWFmdGVyLWZyZWUgZXJyb3IuCj4KPiBUbyBmaXggdGhpcywgSSBhZGRlZCBhbiB1bnJlZ2lz
dGVyIG5vdGlmaWVyIGZ1bmN0aW9uIGluIHRoZSB1Ymlfd2xfY2xvc2UKPiBmdW5jdGlvbiB0byBl
bnN1cmUgdGhhdCB0aGUgbm90aWZpZXIgaXMgcmVtb3ZlZCBmcm9tIHRoZSBjaGFpbiBhZnRlciB0
aGUKPiBkZXZpY2UgaGFzIGJlZW4gZGV0YWNoZWQuCj4KPiBSZXBvcnRlZC1ieTogc3l6Ym90KzA5
ODhhMzgzYWU3YzU3Yjk5ZGQ5QHN5emthbGxlci5hcHBzcG90bWFpbC5jb20KPiBDbG9zZXM6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC82NzQwOTA5MS4wNTBhMDIyMC4zNjNhMWIuMDEzZC5H
QUVAZ29vZ2xlLmNvbS9ULwo+IFNpZ25lZC1vZmYtYnk6IERlbm5pcyBMYW0gPGRlbm5pcy5sYW1l
cmljZUBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL3ViaS93bC5jIHwgMSArCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L3ViaS93bC5jIGIvZHJpdmVycy9tdGQvdWJpL3dsLmMKPiBpbmRleCA0ZjZmMzM5ZDhmYjguLjMx
YTFlNTUxNWQ5OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC91Ymkvd2wuYwo+ICsrKyBiL2Ry
aXZlcnMvbXRkL3ViaS93bC5jCj4gQEAgLTE5OTUsNiArMTk5NSw3IEBAIHN0YXRpYyB2b2lkIHBy
b3RlY3Rpb25fcXVldWVfZGVzdHJveShzdHJ1Y3QgdWJpX2RldmljZSAqdWJpKQo+ICB2b2lkIHVi
aV93bF9jbG9zZShzdHJ1Y3QgdWJpX2RldmljZSAqdWJpKQo+ICB7Cj4gICAgICAgICBkYmdfd2wo
ImNsb3NlIHRoZSBXTCBzdWItc3lzdGVtIik7Cj4gKyAgICAgICB1bnJlZ2lzdGVyX3JlYm9vdF9u
b3RpZmllcigmdWJpLT53bF9yZWJvb3Rfbm90aWZpZXIpOwo+ICAgICAgICAgdWJpX2Zhc3RtYXBf
Y2xvc2UodWJpKTsKPiAgICAgICAgIHNodXRkb3duX3dvcmsodWJpKTsKPiAgICAgICAgIHByb3Rl
Y3Rpb25fcXVldWVfZGVzdHJveSh1YmkpOwo+IC0tCj4gMi40Ny4wCj4KCk15IGFwb2xvZ2llcyBl
dmVyeW9uZSwgcGxlYXNlIGlnbm9yZSB0aGlzIGVtYWlsLiBNeSBtYWlsaW5nIHNjcmlwdApzZWVt
cyB0byBoYXZlIGNoYW5nZWQgbXkgZW1haWwgaGVhZGVyIGFuZCBjb21taXQgbWVzc2FnZS4gSSB3
aWxsIHNlbmQKYW5vdGhlciBiZXR0ZXIgZm9ybWF0dGVkIGVtYWlsIGxhdGVyLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
