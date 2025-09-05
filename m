Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C606FCA1012
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Sep 2025 02:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EPhk6R4tzx64IbFte31RCnbzTR8QsKm7FExpp4RRR40=; b=tLl7eiPypjEgBx
	Dor9jV/0SsV+SjgGFqYc+AYpbBjoMCx8VfWxKDJ8vYeYqFRhmEsD4M2ik8KsGdFv4pZWYjZkZvRtm
	AHMeUAYJ93EOiJCnAFdl9sCeznUoRhkJ6AUpd9dTrmO9ruXv+1EFYRqn9mjjjSv2S3fCC6LOcUpWS
	a0Ml/Gfw8k3aJxc/75dKBdYDq86trMi38oEsQeISYWIcxhaufafDI0cMerLwu17aT/a6mgcgx/2oW
	nYLMOI19V1tk3If+2lptHpNSsJbEtBmdk3zYpp2Gc57ulDR+b8m1vV/Ek041txVoiXOi3gwNz3zse
	zYgLyJ+cWhzOhpy6nWmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM76-0000000G6fk-1cRp;
	Fri, 05 Sep 2025 02:23:44 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuL54-0000000Firp-2Evy
	for linux-mtd@lists.infradead.org;
	Fri, 05 Sep 2025 01:17:36 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-329b76008c6so1307754a91.1
        for <linux-mtd@lists.infradead.org>; Thu, 04 Sep 2025 18:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757035053; x=1757639853; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7Pf4+kubMT40gLaV6AmzrZ3LLU0nezZUg5BZHTuQLI=;
        b=Pyor9Ytk+Zusu/wBUiv2IcGGuc/S6d1aZDBWzVMMyK/d5SIUy+UESb/pEtsamQTxLp
         Q0GwpzDXRvb/AGYyA5hjqWqaTl6LhSByglDCiYZg7eKjwz4l6IdHZ95hWNPJzazRAitN
         YmUdzWij4KhOZAtdBJPnMNWQz+6SuJkvysGwXTIIlZPO70kTk1h2GAcWcLULpCxXVXt/
         P4wnRFaHPVxcV7I5dMJ1euOoHwrmqDBQCQsqOSfb2VN4NXVSpq//EqSen7DTzGO7gtn/
         IzKd03IBWjyjvTyDwH1ye20yO/0nAMjlJY/Dk18hzg3AfN5hkaEQybzR31Ir1WVMnXEO
         kVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757035053; x=1757639853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7Pf4+kubMT40gLaV6AmzrZ3LLU0nezZUg5BZHTuQLI=;
        b=o4ZxENI0UQs4GXyvxKe24/xvX2HzBa7Lb1XPDbq26HV5Br6GcWIhuHC06+bO6AjlGs
         nSmYnj70xo+kKV3Ylkz1qZfMj5RC/o9dmcWafZLuxaQR8e3yh94x6vXZAUHMImBSAFBX
         e5JS5GxCIKMorBlBg2jRhuVTYXIZyekwshL6T7IVOFFKutGsJo9MdzuKadO7zLn84cvD
         CxpOmg0k7pBoEMniqq+MFUEIoRPYx3Ze/Lssd2iKJ9GWP0OIFomtos2kMmCvhUMT+AKI
         c/L9xgyvtrWc2a5GMaX56PahLqBYiGE2mrik3ord4ohJXkmzDgrhyI5vqTD2XET4ksfw
         xbxw==
X-Forwarded-Encrypted: i=1; AJvYcCVzm4RC/NEktbGWYCZtgHAUZ1D7VySAaB5IT+hKYUq6qBZi82W4V5RMbAuqghsCDpNYC31BrkTVhiY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzfPzFnGiR3s5p/Me0h2DhCf3KJ0nHASVb2htuy5l+tLLd66gGP
	ro16hHrQg5OfTh3+WFg0MCM3mUnxrLZWF15txmgGxcz17dgsREw7c7i6IaJQ537v5zIqtay5s/o
	ruOVMBlM6VoVYsJdaidx3zbo6jt109oMl6rmp
X-Gm-Gg: ASbGnct1RMPW3XpwRU75PCzMDNyWs+0qdG9RbO/OzX2jARXWPXuGJuO6f0ZJEaB3AzT
	t9qvOINHICzyYy2ALH0lCQECztv2NPk0bt4MWnZK7hY10ilHjEF0PJAHhHA+xacxuAaf6c5FYD/
	YDCkp7y1yJ420ApdwVdknGGD5fCq/u7FZrHzTwOjK5xGRdz5wVj40UVQclviRV/Q5+eVCajrIji
	iD0S+4vAqbRXvZzm8aGgo/j7K7XHcHXrzt0PGqwfI5phSHUesxR9xQH6wLNVia/+IhdMHuJ6JE9
	cLa+aA==
X-Google-Smtp-Source: AGHT+IF2qns+wQRFsCXVs6volfobRwQAPreJKcfau6BotrpqzEVF+JmtSuYlKk4wlAMa21p+q4/IITX6/mm6oZrsBdc=
X-Received: by 2002:a17:90b:53cc:b0:327:9e88:7714 with SMTP id
 98e67ed59e1d1-328156f991bmr27587872a91.37.1757035053238; Thu, 04 Sep 2025
 18:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250808095503.906244-1-linchengming884@gmail.com>
 <20250808095503.906244-3-linchengming884@gmail.com> <87zfca9kur.fsf@bootlin.com>
 <CAAyq3SZbPpVX_LyoYaHYhA3ZNeb0NYWQ4KC6-+uubB1GGCqZag@mail.gmail.com> <87y0rhyq12.fsf@bootlin.com>
In-Reply-To: <87y0rhyq12.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Fri, 5 Sep 2025 09:14:40 +0800
X-Gm-Features: Ac12FXx4byBzWH6j48oQZOe7xQFIRkBRcfZZ7-RMjyA1Z6cccgN6oI9mOsKBS90
Message-ID: <CAAyq3Saj5cmHAb3NPd=ZzJEvYD873s2CFKOyoxMrKk6Tj6yakg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nand: macronix: Add randomizer support
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw, 
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_181734_572497_C9C70063 
X-CRM114-Status: GOOD (  22.33  )
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

SGkgTWlxdWVsLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8
IDIwMjXlubQ45pyIMTjml6Ug6YCx5LiAIOS4i+WNiDQ6NDflr6vpgZPvvJoKPgo+IEhpIENoYW5n
IE1pbmcsCj4KPiBPbiAxMS8wOC8yMDI1IGF0IDExOjAxOjI1ICswOCwgQ2hlbmcgTWluZyBMaW4g
PGxpbmNoZW5nbWluZzg4NEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBIaSBNaXF1ZWwsCj4gPgo+
ID4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8IDIwMjXlubQ4
5pyIOOaXpSDpgLHkupQg5LiL5Y2INjoxOeWvq+mBk++8mgo+ID4+Cj4gPj4gT24gMDgvMDgvMjAy
NSBhdCAxNzo1NTowMyArMDgsIENoZW5nIE1pbmcgTGluIDxsaW5jaGVuZ21pbmc4ODRAZ21haWwu
Y29tPiB3cm90ZToKPiA+Pgo+ID4+ID4gRnJvbTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWluZ2xp
bkBteGljLmNvbS50dz4KPiA+PiA+Cj4gPj4gPiBFbmFibGUgcmFuZG9taXplciBmdW5jdGlvbiBi
eSBzcGVjaWZpYyBmbG93Y2hhcnQgdG8gc2V0IHRoZSBkZWZhdWx0IHZhbHVlCj4gPj4gPiBvZiBS
QU5ERU4gdG8gMS4KPiA+PiA+Cj4gPj4gPiBSYW5kb21pemVyIGludHJvZHVjZXMgdHdvIG5ldyBE
VCBwcm9wZXJ0aWVzIGZvciBjaGlsZCBub2RlcyB0byBjb25maWd1cmUKPiA+PiA+IHRoZSByYW5k
b21pemVyIGZ1bmN0aW9uYWxpdHkgYW5kIGNvdmVyYWdlIG9wdGlvbnMuCj4gPj4gPiAgLSBteGlj
LGVuYWJsZS1yYW5kb21pemVyLW90cDogU3BlY2lmeSB3aGV0aGVyIHRvIGFjdGl2YXRlIHRoZSBy
YW5kb21pemVyCj4gPj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmVhdHVyZS4K
PiA+PiA+ICAtIG14aWMscmFuZG9wdDogRGVmaW5lIHRoZSByYW5kb21pemVyIGFyZWEgcGVyIHBh
Z2UuCj4gPj4KPiA+PiBDYW4gd2UgY3JlYXRlIGEgZ2xvYmFsIE5BTkQgRFQgcHJvcGVydHkgZm9y
IHRoYXQ/IEVuYWJsaW5nIGEgcmFuZG9taXplcgo+ID4+IGlzIHF1aXRlIGEgZ2VuZXJpYyBzdGVw
Lgo+ID4+Cj4gPj4gPiBUaGUgcGVuYWx0eSBvZiByYW5kb21pemVyIGFyZSBzdWJwYWdlIGFjY2Vz
c2VzIHByb2hpYml0ZWQgYW5kIG1vcmUgdGltZQo+ID4+ID4gcGVyaW9kIGlzIG5lZWRlZCBpbiBw
cm9ncmFtIG9wZXJhdGlvbiBhbmQgZW50ZXJpbmcgZGVlcCBwb3dlci1kb3duIG1vZGUuCj4gPj4g
PiBpLmUuLCB0UFJPRyAzMjB1cyB0byAzNjB1cyAocmFuZG9taXplciBlbmFibGVkKS4KPiA+Pgo+
ID4+IERvIHlvdSB3YW50IHRvIHNoYXJlIHdoYXQgaXMgdGhlIGFkZGVkIHZhbHVlIGluIHRlcm1z
IG9mIGxpZmV0aW1lIHRvCj4gPj4gZW5hYmxlIHRoZSByYW5kb21pemVyLCBnaXZlbiB0aGUgZHJh
d2JhY2tzIHdoaWNoIGFyZSBzaWduaWZpY2FudD8KPiA+Cj4gPiBUaGUgcmFuZG9taXplciBtYWlu
bHkgdGFyZ2V0cyBleHRyZW1lbHkgdW5iYWxhbmNlZCBkYXRhIHBhdHRlcm5zLAo+ID4gd2hpY2gg
bWlnaHQgcG90ZW50aWFsbHkgbGVhZCB0byBkYXRhIGVycm9ycy4KPiA+Cj4gPiBQbGVhc2UgcmVm
ZXIgdG8gdGhlIGF0dGFjaGVkIGRvY3VtZW50Ogo+ID4gaHR0cHM6Ly93d3cubXhpYy5jb20udHcv
TGlzdHMvQXBwbGljYXRpb25Ob3RlL0F0dGFjaG1lbnRzLzIxNTEvQU4xMDUxVjEtVGhlJTIwSW50
cm9kdWN0aW9uJTIwb2YlMjBSYW5kb21pemVyJTIwRmVhdHVyZSUyMG9uJTIwTVgzMHhGeEcyOEFE
X01YMzV4RnhHMjRBRC5wZGYKPgo+IFRoYW5rcyBmb3IgdGhlIGxpbmssIGl0IG1heSBiZSBwb2lu
dGVkIHdpdGggYSAiTGluazoiIHRhZyBpbiB5b3VyIGNvbW1pdAo+IHRvIGZ1cnRoZXIganVzdGlm
eSB0aGlzIGFkZGl0aW9uLiBIb3dldmVyIGl0IGlzIHNwYXJzZSBvbiBkZXRhaWxzLiBJCj4gd291
bGQgYmUgaW50ZXJlc3RlZCBieSBtb3JlIGRldGFpbHMsIHN1Y2ggYXMgImhvdyBtYW55IDBzPyBo
b3cgbWFueQo+IGJpdGZsaXBzPyBob3cgb2Z0ZW4vbGlrZWx5PyIKClRoYW5rIHlvdSBmb3IgeW91
ciBmZWVkYmFjay4gVW5mb3J0dW5hdGVseSB3ZSBkbyBub3QgaGF2ZSBudW1lcmljYWwKZGF0YSBz
dWNoIGFzIGV4YWN0IG51bWJlcnMgb2YgJzAncywgYml0ZmxpcCByYXRlcywgb3Igb2NjdXJyZW5j
ZQpwcm9iYWJpbGl0aWVzIHRvIHNoYXJlLiBJbnN0ZWFkLCBJIHdvdWxkIGxpa2UgdG8gcmVmZXIg
dG8gdGhlIEpFREVDCkpFU0QyMi1BMTE3RSBxdWFsaWZpY2F0aW9uIHN0YW5kYXJkLCB3aGljaCBw
cm92aWRlcyBndWlkYW5jZSBvbgpyZXRlbnRpb24gYW5kIGVuZHVyYW5jZSB0ZXN0aW5nLgoKQWNj
b3JkaW5nIHRvIHRoaXMgZG9jdW1lbnQsIHRoZXJlIGlzIG5vIHNpbmdsZSBkYXRhIHBhdHRlcm4g
dGhhdApyZXByZXNlbnRzIGEgdW5pdmVyc2FsIHdvcnN0LWNhc2UgYWNyb3NzIGFsbCBmYWlsdXJl
IG1lY2hhbmlzbXMuCkRpZmZlcmVudCBtZWNoYW5pc21zIG1heSBzdHJlc3MgcHJvZ3JhbW1lZCBj
ZWxscywgZXJhc2VkIGNlbGxzLCBvcgpjZWxscyBpbmZsdWVuY2VkIGJ5IGFkamFjZW50IHN0YXRl
cywgYW5kIHRodXMgc3BlY2lmaWMgcGF0dGVybnMgc3VjaAphcyBmdWxseSBwcm9ncmFtbWVkLCBj
aGVja2VyYm9hcmQsIG9yIG1vc3RseSBlcmFzZWQgYXJlIGVhY2ggb25seQp3b3JzdC1jYXNlIGZv
ciBjZXJ0YWluIGRlc2lnbnMgb3IgcHJvY2Vzc2VzLgoKR2l2ZW4gdGhhdCBubyBmaXhlZCBwYXR0
ZXJuIGNhbiBjb3ZlciBhbGwgY2FzZXMsIHRoZSB1c2Ugb2YgYQpyYW5kb21pemVkIGRhdGEgcGF0
dGVybiBpcyBjb25zaWRlcmVkIGEgcHJhY3RpY2FsIG1pdGlnYXRpb24Kc3RyYXRlZ3kuIEEgcmFu
ZG9taXplciBkaXN0cmlidXRlcyBzdHJlc3MgbW9yZSBldmVubHkgYWNyb3NzIHRoZQpkZXZpY2Ug
Ynkgc2NyYW1ibGluZyBpbmNvbWluZyBkYXRhIGJlZm9yZSBzdG9yYWdlIGFuZCByZXN0b3Jpbmcg
aXQKb24gcmVhZC4gVGhpcyBoZWxwcyByZWR1Y2UgcGF0dGVybi1kZXBlbmRlbnQgZGVncmFkYXRp
b24gYW5kIGNhbgp0aGVyZWZvcmUgaW1wcm92ZSBsb25nLXRlcm0gZmxhc2ggcmVsaWFiaWxpdHku
Cgo+Cj4gPiBGaWd1cmUgMSBzaG93cyB0aGF0IGNvbnRpbnVvdXNseSBwcm9ncmFtbWluZyB0b28K
PiA+IG1hbnkgMHMgY2FuIHJlc3VsdCBpbiBkYXRhIGVycm9ycy4KPgo+IFRoYW5rcywKPiBNaXF1
w6hsCgpUaGFua3MsCkNoZW5nLU1pbmcgTGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
